import gensim

WORD2VEC_MODEL_PATH = "/model/word2vecModel"
gensim.models.KeyedVectors.load(WORD2VEC_MODEL_PATH, mmap="r")
