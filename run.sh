echo "Running..."
export IRSTLM=/teamspace/studios/this_studio/BashantaraAI/irstlm
sudo rm -rf corpus
sudo rm -rf model
sudo rm -rf giza.*
sudo rm -rf lm/*
sudo rm -rf tuning/*
mkdir tuning
sudo rm -rf en-mr/corpus/*
echo "Cleaned and created directories for training...(corpus, model, giza, lm, tuning)"
echo "================================================================================"

cp samantar/BPCC/samanantar_v2/eng_Latn-kas_Arab/train.eng_Latn en-mr/corpus/train.en
cp samantar/BPCC/samanantar_v2/eng_Latn-kas_Arab/train.kas_Arab en-mr/corpus/train.mr
pip install pandas
python working/preprocess_data.py
mosesdecoder/scripts/training/clean-corpus-n.perl /teamspace/studios/this_studio/BashantaraAI/en-mr/corpus/train en mr /teamspace/studios/this_studio/BashantaraAI/en-mr/ 1 100
mv en-mr/.mr en-mr/corpus/train.mr
mv en-mr/.en en-mr/corpus/train.en
irstlm/scripts/add-start-end.sh < en-mr/corpus/train.en > lm/train.sep.en
irstlm/scripts/build-lm.sh -i lm/train.sep.en -n 3 -o lm/train.arpa.en -k 3
irstlm/bin/compile-lm "--text=yes" lm/train.arpa.en.gz lm/train.arpa.en
bash working/align_data.sh
head -1000 en-mr/corpus/train.mr > tuning/tune.mr
head -1000 en-mr/corpus/train.en > tuning/tune.en
bash working/align_data.sh
mkdir tuning/filtered
cp -r model/* tuning/filtered
cd tuning
/teamspace/studios/this_studio/BashantaraAI/mosesdecoder/scripts/training/mert-moses.pl /teamspace/studios/this_studio/BashantaraAI/tuning/tune.mr /teamspace/studios/this_studio/BashantaraAI/tuning/tune.en /teamspace/studios/this_studio/BashantaraAI/mosesdecoder/bin/moses /teamspace/studios/this_studio/BashantaraAI/tuning/filtered/moses.ini -decoder-flags="threads 1" -mertdir /teamspace/studios/this_studio/BashantaraAI/mosesdecoder/bin/ --working-dir /teamspace/studios/this_studio/BashantaraAI/tuning  -decoder-flags="-threads 4"
cd ..
bash working/extract_translit_pairs.sh
echo "Done!"
# scp LightningAI:/teamspace/studios/this_studio/BashantaraAI/mined-pairs.xlsx ~/Downloads/
# mosesdecoder/bin/1-1-Extraction tuning/f tuning/e tuning/a > tuning/1-1.mr-en
# mosesdecoder/scripts/Transliteration/clean.pl tuning/1-1.mr-en > tuning/1-1.mr-en.cleanednew
# mosesdecoder/bin/TMining tuning/1-1.mr-en.cleanednew > tuning/1-1.mr-en.pair-probs-new
# echo 0.5 | mosesdecoder/scripts/Transliteration/threshold.pl tuning/1-1.mr-en.pair-probs-new > tuning/1-1.mr-en.pair-probs-thresh
# echo "I had to do most of it myself." | mosesdecoder/moses2/bin/gcc-9/release/link-static/threading-multi/moses2 -f /teamspace/studios/this_studio/BashantaraAI/tuning/moses.ini
