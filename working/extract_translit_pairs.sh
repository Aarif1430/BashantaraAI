/workspaces/BashantaraAI/mosesdecoder/scripts/Transliteration/train-transliteration-module.pl  \
     --corpus-f /workspaces/BashantaraAI/en-mr/corpus/train.mr  --corpus-e /workspaces/BashantaraAI/en-mr/corpus/train.en  \
     --alignment /workspaces/BashantaraAI/model/aligned.grow-diag-final-and  \
     --moses-src-dir /workspaces/BashantaraAI/mosesdecoder --external-bin-dir /workspaces/BashantaraAI/mgiza/mgizapp/bin   \
     --input-extension mr --output-extension en \
     --srilm-dir /workspaces/BashantaraAI/srilm/bin \
     --out-dir /workspaces/BashantaraAI/tuning > /workspaces/BashantaraAI/align_data.log 2>&1
