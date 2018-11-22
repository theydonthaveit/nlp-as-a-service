import gensim

WORD2VEC_MODEL_PATH = "word2vecModel"
gensim.models.KeyedVectors.load(WORD2VEC_MODEL_PATH, mmap="r")
