TRANSLATE='gpu'
NUM_GPUS=1

INPUT_WORD_DROPOUT_RATE=0.2
TARGET_WORD_DROPOUT_RATE=0.1
EDIT_WEIGHT=3

MODEL=transformer
MODEL_TYPE=transformer_base_single_gpu

EXPERIMENT_ROOT_DIR=/home/user/ # TODO set it yourself

PROBLEM=finetune_general_problem
PROBLEM_DIR=$EXPERIMENT_ROOT_DIR/problems/finetune/
TRAIN_DIR=$EXPERIMENT_ROOT_DIR/t2t_train # path to root folder where to store model checkpoints
DATA_DIR=$EXPERIMENT_ROOT_DIR/t2t_data # path to root folder where to generate training data

BATCH_SIZE=2048
MAX_LEN=150
WARMUP_STEPS=10000
LEARNING_RATE_CONSTANT=1

# decoding (Tensorboard)
BEAM_SIZE=4
ALPHA=0.6

# artificial data part
TOKEN_ERR_PROB="0.15"
TOKEN_ERR_DISTRIBUTION="0.7_0.1_0.05_0.1_0.05"
CHAR_ERROR_PROB="0.02"
CHAR_ERR_DISTRIBUTION="0.2_0.2_0.2_0.2_0.2"

DATA_RATIO=1
ADDITIONAL_ARTIFICIAL_SENTENCES=2000000
ADDITIONAL_WIKI_SENTENCES=0
ADDITIONAL_DATA_FILTERED=False

LANG="cs"
INPUT_SENTENCE_FILE="/home/naplava/troja/czesl_experiments/data/train/tokenized/train.all.input"
TARGET_SENTENCE_FILE="/home/naplava/troja/czesl_experiments/data/train/tokenized/train.all.gold"
EVAL_DATA_DIR="/ha/home/naplava/troja/czesl_experiments/data/eval/tokenized/"

# technical stuff
VOCAB_PATH=${DATA_DIR}/artificial_errors-$LANG-tep$TOKEN_ERR_PROB-ted$TOKEN_ERR_DISTRIBUTION-cep$CHAR_ERROR_PROB-ced$CHAR_ERR_DISTRIBUTION/vocab.artificial_errors.32768.subwords

NO_EDIT_DATA_DIR=${DATA_DIR}/$PROBLEM-$LANG-finetune-tep$TOKEN_ERR_PROB-ted$TOKEN_ERR_DISTRIBUTION-cep$CHAR_ERROR_PROB-ced$CHAR_ERR_DISTRIBUTION-aap${ADDITIONAL_ARTIFICIAL_SENTENCES}-awp${ADDITIONAL_WIKI_SENTENCES}-adf${ADDITIONAL_DATA_FILTERED}-ratio${DATA_RATIO}
DATA_DIR=${NO_EDIT_DATA_DIR}-${EDIT_WEIGHT}
PRETRAINED_DIR=${TRAIN_DIR}/artificial_errors-$LANG-tep$TOKEN_ERR_PROB-ted$TOKEN_ERR_DISTRIBUTION-cep$CHAR_ERROR_PROB-ced$CHAR_ERR_DISTRIBUTION/$MODEL-$MODEL_TYPE-iwdr${INPUT_WORD_DROPOUT_RATE}-twdr${TARGET_WORD_DROPOUT_RATE}-ew${EDIT_WEIGHT}-ws${WARMUP_STEPS}-lrc${LEARNING_RATE_CONSTANT} 
TRAIN_DIR=${TRAIN_DIR}/$PROBLEM-$LANG-finetune-tep$TOKEN_ERR_PROB-ted$TOKEN_ERR_DISTRIBUTION-cep$CHAR_ERROR_PROB-ced$CHAR_ERR_DISTRIBUTION/$MODEL-$MODEL_TYPE-iwdr${INPUT_WORD_DROPOUT_RATE}-twdr${TARGET_WORD_DROPOUT_RATE}-ew${EDIT_WEIGHT}-ws${WARMUP_STEPS}-lrc${LEARNING_RATE_CONSTANT}-aap${ADDITIONAL_ARTIFICIAL_SENTENCES}-awp${ADDITIONAL_WIKI_SENTENCES}-adf${ADDITIONAL_DATA_FILTERED}-ratio${DATA_RATIO}