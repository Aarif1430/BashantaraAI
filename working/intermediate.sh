mkdir -p en-mr/translit_out/training/prepared
mkdir -p en-mr/translit_out/training/giza
mkdir -p en-mr/translit_out/training/giza-inverse
mkdir -p en-mr/translit_out/tuning/tmp/
mkdir -p en-mr/translit_out/model/
mkdir -p en-mr/translit_out/training/giza/part1/
mkdir -p en-mr/translit_out/training/giza/part2/
mkdir -p en-mr/translit_out/training/giza/part3/
mkdir -p en-mr/translit_out/training/giza/part4/
mkdir -p en-mr/translit_out/training/giza/part5/
cp -r corpus/* en-mr/translit_out/training/prepared/
cp giza.en-mr/en-mr.A3.final.part* en-mr/translit_out/training/giza/
cp giza.mr-en/mr-en.A3.final.part* en-mr/translit_out/training/giza-inverse/
cp model/moses.ini en-mr/translit_out/tuning/tmp/
cp model/moses.ini en-mr/translit_out/model/
cp giza.mr-en/mr-en.cooc en-mr/translit_out/training/giza/part1/
cp giza.mr-en/mr-en.cooc en-mr/translit_out/training/giza/part2/
cp giza.mr-en/mr-en.cooc en-mr/translit_out/training/giza/part3/
cp giza.mr-en/mr-en.cooc en-mr/translit_out/training/giza/part4/
cp giza.mr-en/mr-en.cooc en-mr/translit_out/training/giza/part5/
