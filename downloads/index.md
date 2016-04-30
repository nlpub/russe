---
layout: default
title: Russian Semantic Relatedness
description: "Human and Machine Judgements about Russian Semantic Relatedness."
keywords: semantic similarity, results, evaluation, RUSSE
redirect_from:
  - /rsr
  - /rsr/
---

# Human and Machine Judgements about Russian Semantic Relatedness

This page contains several open language resources for semantic relatednes in Russian language. We present five semantic relatedness resources for Russian, each being a list of triples (word_i, word_j, similarity_ij). Four of them are designed for evaluation of semantic relatedness, each complementing another in terms of relation type. These benchmarks were used in a shared task on Russian semantic similarity. One of the best systems was used to generate the fifth resource – an open distributional thesaurus of Russian. Multiple evaluations of this thesaurus indicate its state-of-the-art quality.

## HJ: Human Judgements of Word Pairs

HJ dataset contains human judgements on 398 word pairs that were translated to Russian from the widely used benchmarks for English: MC (Miller and Charles, 1991), RG (Rubenstein and Goodenough, 1965) and WordSim353 (Filkenstein et al., 2001). In order to collect human judgements, an in-house crowdsourcing system was used. Volunteers on Facebook and Twitter were invited to participate in the experiment. Each annotator has been provided with a random assignment consisting of 15 word pairs selected from the 398 preliminarily prepared pairs, and has been asked to assess the similarity of each pair. The possible options were “not similar at all”, “weak similarity”, “moderate similarity”, and “high similarity”. Ordinal Krippendorff’s alpha of 0.49 indicates a moderate agreement of annotators in this experiment. To evaluate a similarity measure using this dataset one should calculate Spearman’s rank correlation coefficient ρ between a vector of human judgments and the scores of a given system. 

Below you can download either the complete HJ dataset featuring 398 pairs (recommened for most of the caseses), or separate parts of the dataset, namely MC (65 pairs), RG (30 pairs) or WordSim353 (353 apirs). Note, that the WordSim353 is further sub-divided into similarity and relatedness datasets. 

* [Download HJ dataset](https://github.com/nlpub/russe-evaluation/blob/master/russe/evaluation/hj.csv) in the CSV format “word-i word-j similarity-ij”. 
* [Download MC dataset](https://github.com/nlpub/russe-evaluation/blob/master/russe/evaluation/hj-mc.csv) in the CSV format “word-i word-j similarity-ij”
* [Download RG dataset](https://github.com/nlpub/russe-evaluation/blob/master/russe/evaluation/hj-rg.csv) in the CSV format “word-i word-j similarity-ij”
* [Download WordSim353 dataset (similarity)](https://github.com/nlpub/russe-evaluation/blob/master/russe/evaluation/hj-wordsim353-similarity.csv) in the CSV format “word-i word-j similarity-ij”
* [Download WordSim353 dataset (relatedness)](https://github.com/nlpub/russe-evaluation/blob/master/russe/evaluation/hj-wordsim353-relatedness.csv) in the CSV format “word-i word-j similarity-ij”

## RT: Synonyms and Hypernyms from the Thesaurus RuThes

This dataset follows structure of the BLESS dataset (Baroni and Lenci, 2011). Each target word has the same number of related and unrelated source words. The dataset contains 114,066 relations for 6,832 nouns. Half of these relations are synonyms and hypernyms from the RuThes Lite thesaurus (Loukachevitch et al., 2014) and half of them are unrelated words. To generated negative pairs we used simple procedure described in (Panchenko et al., 2015). We filtered false negative relations for 1,008 source words with the help of human annotators. Each negative relation in this subset was annotated by at least two annotators. To evaluate a similarity measure using this dataset one needs to calculate average precision (Panchenko et al., 2015).

* [Download RT dataset (test)](https://github.com/nlpub/russe-evaluation/blob/master/russe/evaluation/rt-test.csv) in the CSV format “word-i word-j similarity-ij”
* [Download RT dataset (full)](https://raw.githubusercontent.com/nlpub/russe-evaluation/master/russe/evaluation/rt.csv) in the CSV format “word-i word-j similarity-ij”

## AE: Cognitive Associations from the [Sociation.org](http://Sociation.org) Experiment

The structure of this dataset is the same as the structure of the RT dataset: each source word has the same number of related and unrelated target words. Related word pairs were sampled from a Russian Web associative experiment. In the experiment, users were asked to provide a reaction to an input stimulus source word, e.g.: man → woman, time → money, and so on. The strength of association in this experiment is quantified by the number of respondents providing the same stimulus-reaction pair. Associative thesauri typically contain a mix of synonyms, hyponyms, meronyms and other types, making relations asymmetric. To build the dataset we have selected target words with the highest association with the stimulus in [Sociation.org](http://Sociation.org) data. Like with the other datasets, we used only single-word nouns. Similarly to the RT dataset, we automatically generated negative word pairs and manually filtered false negatives for a subset of 1,501 pairs. As with the RT dataset, to evaluate a similarity measure based on this dataset one should use average precision.

* [Download AE dataset (test)](https://github.com/nlpub/russe-evaluation/blob/master/russe/evaluation/ae2-test.csv) in the CSV format “word-i word-j similarity-ij”
* [Download AE dataset (full)](https://raw.githubusercontent.com/nlpub/russe-evaluation/master/russe/evaluation/ae2.csv) in the CSV format “word-i word-j similarity-ij”

## MJ: Machine Judgements of Word Pairs from the RUSSE Shared Task

This dataset contains 12,886 word pairs coming from HJ, RT, and AE datasets. In contrast to original hand-labeled binary labels (see Table 1) these pairs have continuous relatedness scores. To estimate these scores we averaged 105 submissions of the shared task on Russian semantic similarity, RUSSE (Panchenko et al., 2015). Each run consisted of 12,886 word pairs along with similarity scores.

* [Download MJ dataset](https://github.com/nlpub/russe-evaluation/blob/master/russe/evaluation/mj.csv) in the CSV format “word-i word-j similarity-ij”

## RDT: Russian Distributional Thesaurus

While resources presented above are accurate and represent different kind of semantics their low coverage let us use them only for evaluation and training. In this section we present a large scale resource in the same (wi, wj, sij) format – the first open Russian distributional thesaurus.

In order to build the distributional thesaurus, we used the skip-gram model (Mikolov et al., 2013) trained on a 12.9 billion word collection of books in Russian. According to the results of our participation in the shared task on Russian semantic similarity (Panchenko et al., 2015), this approach scored in the top 5 among 105 submissions (Arefyev et al., 2015). At the same time, the approach is completely unsupervised and language independent as we do not use any preprocessing except tokenization. More specifically, to build a thesaurus we trained the model on Russian books extracted from the digital library [lib.rus.ec](http://lib.rus.ec). Following our prior experiments (Arefyev et al., 2015) we have selected the following parameters for the model: minimal word frequency – 5, number of dimensions in a word vector – 500, three or five iterations of the learning algorithm over the input corpus, context window size of 1, 2, 3, 5, 7 and 10 words. For the most frequent 932,000 words, we calculated 250 nearest neighbours with the cosine similarity between word vectors. These related words were lemmatized using PyMorphy2\. An important added value of our work is engineering. Training of a model takes up to five days on a r3.8xlarge Amazon EC2 instance featuring 32 cores and 244 GB of RAM. Furthermore, calculation of the neighbours takes up to ten days for only one. Not to mention the time needed to test different configurations of the model.

#####Parameters of the model used to generate this distributional thesaurus:


* Model: skip-gram
* Corpus: [150Gb sample](https://s3-eu-west-1.amazonaws.com/dsl-research/wiki/librusec_fb2.plain.gz) of the [lib.rus.ec](http://lib.rus.ec) collections of Russian books extracted from the FB2 format and cleaned from metadata ([a mirror](http://panchenko.me/russe/librusec_fb2.plain.gz)).
* Context window size: 10 words
* Number of dimensions: 500
* Number of iterations: 3
* Minimal word frequency: 5

#####Statistics of the distributional thesaurus:

* Number of thesaurus entries (source words): 931,896
* Number of destination words: 4,456,444
* Number of relations in the thesaurus: 193,909,130



The resulting DT is a CSV file that can be simply used from any environment. 

* [Download RDT dataset](https://s3-eu-west-1.amazonaws.com/dsl-research/distrib_thes/3attempt/all.norm-sz500-w10-cb0-it3-min5.w2v.vocab_1100000_similar250.gz) in the CSV format “word-i word-j similarity-ij” ([a mirror](http://panchenko.me/russe/all.norm-sz500-w10-cb0-it3-min5.w2v.vocab_1100000_similar250.gz)) (1.8 Gb)
* [Download word vectors](https://s3-eu-west-1.amazonaws.com/dsl-research/wiki/w2v_export/all.norm-sz500-w10-cb0-it3-min5.w2v) used to generate the RDT dataset in the format of [word2vec](https://code.google.com/p/word2vec/). To [load word vectors](https://github.com/nlpub/russe-evaluation/tree/master/russe/measures/word2vec) with GenSim  you will need at least 64Gb of RAM to load the vectors. ([a mirror](http://panchenko.me/russe/all.norm-sz500-w10-cb0-it3-min5.w2v.vocab_1100000_similar250.gz)) (14 Gb)
* [Download the lib.rus.ec corpus](https://s3-eu-west-1.amazonaws.com/dsl-research/wiki/librusec_fb2.plain.gz) used to train the word vectors used to construct the RDT thesaurus consisting of 12.9 billions of tokens. ([a mirror](http://panchenko.me/russe/librusec_fb2.plain.gz)) (40Gb)

## Evaluation Scripts

Evaluation scripts that can be used to measure performance of semantic relatedness measures based on HJ, RT, AE, MJ datasets are available on [GitHub](https://github.com/nlpub/russe-evaluation/tree/master/russe/evaluation).
