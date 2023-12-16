./mosesdecoder/scripts/training/mert-moses.pl tune.mr tune.en ../mosesdecoder/bin/moses filtered/moses.ini -decoder-flags="threads 1" -mertdir ../mosesdecoder/bin/ --working-dir /workspaces/BashantaraAI/tuning  -decoder-flags="-threads 4"

irstlm/bin/compile-lm "--text=yes" lm/train.ilm.gz lm/train.arpa.en

 ../irstlm/scripts/build-lm.sh -i train.sep.en -n 3 -o train.arpa.en -k 3

rstlm/scripts/add-start-end.sh < en-mr/corpus/train.en > lm/train.sep.en
