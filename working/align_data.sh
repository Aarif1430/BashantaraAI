mosesdecoder/scripts/training/train-model.perl -root-dir /teamspace/studios/this_studio/BashantaraAI/ \
     -corpus /teamspace/studios/this_studio/BashantaraAI/en-mr/corpus/train \
     -f mr -e en -alignment grow-diag-final-and \
     -reordering msd-bidirectional-fe \
     -mgiza -mgiza-cpus 2 \
     -lm 0:5:/teamspace/studios/this_studio/BashantaraAI/lm/train.arpa.en:8 \
     -external-bin-dir /teamspace/studios/this_studio/BashantaraAI/mgiza/mgizapp/bin \
     -parallel
