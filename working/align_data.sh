mosesdecoder/scripts/training/train-model.perl -root-dir /workspaces/BashantaraAI/ \
     -corpus /workspaces/BashantaraAI/en-mr/corpus/train \
     -f mr -e en -alignment grow-diag-final-and \
     -reordering msd-bidirectional-fe \
     -mgiza -mgiza-cpus 2 \
     -lm 0:5:/workspaces/BashantaraAI/lm/train.ilm.gz:8 \
     -external-bin-dir /workspaces/BashantaraAI/mgiza/mgizapp/bin \
     -parallel > align_data.log 2>&1
