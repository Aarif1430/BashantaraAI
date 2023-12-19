/teamspace/studios/this_studio/BashantaraAI/mosesdecoder/scripts/Transliteration/train-transliteration-module.pl  \
     --corpus-f /teamspace/studios/this_studio/BashantaraAI/en-mr/corpus/train.mr  --corpus-e /teamspace/studios/this_studio/BashantaraAI/en-mr/corpus/train.en  \
     --alignment /teamspace/studios/this_studio/BashantaraAI/model/aligned.grow-diag-final-and  \
     --moses-src-dir /teamspace/studios/this_studio/BashantaraAI/mosesdecoder --external-bin-dir /teamspace/studios/this_studio/BashantaraAI/mgiza/mgizapp/bin   \
     --input-extension mr --output-extension en \
     --srilm-dir /teamspace/studios/this_studio/BashantaraAI/srilm/bin \
     --out-dir /teamspace/studios/this_studio/BashantaraAI/tuning > /teamspace/studios/this_studio/BashantaraAI/align_data.log 2>&1
