---
layout: default
title: Taxonomy Enrichment for the Russian Language
description: Shared task on Taxonomy Enrichment for the Russian Language. Taxonomies are tree structures which organize terms into a semantic hierarchy.
---

# Taxonomy Enrichment for the Russian Language

## Overview

Taxonomies are tree structures which organize terms into a semantic hierarchy. Taxonomic relations (or hypernyms) are “is-a” relations: cat *is-a* animal, banana *is-a* fruit, Microsoft *is-a* company, etc. This type of relations is useful in a wide range of natural language processing tasks for performing semantic analysis. The goal of this semantic task is to extend an existing taxonomy with relations of previously unseen words.

Multiple evaluation campaigns for hypernym extraction ([SemEval-2018 task 9](https://repositori.upf.edu/handle/10230/35249)), taxonomy induction ([Semeval-2016 task 13](https://www.aclweb.org/anthology/S16-1168), [SemEval 2015 task 17](https://www.aclweb.org/anthology/S15-2151/)), and most notably for taxonomy enrichment ([SemEval-2016 task 14](https://www.aclweb.org/anthology/S16-1169/)) were organized for English and other western European languages in the past. However, this is the first evaluation campaign of this kind for Russian and any Slavic language. Moreover, the task has a more realistic setting as compared to the SemEval-2016 task 14 taxonomy enrichment task as the participants are not given the definitions of words but only new unseen words in context.

More concretely, the goal of this task is the following: Given words that are not yet included in the taxonomy, we need to associate each word with the appropriate hypernyms from an existing taxonomy. For example, given the input word “утка” (duck) we expect you to provide a list of its most probable 10 candidate hypernym synsets the word could be attached to, e.g. “animal”, “bird”, and so on. Here a word may refer to one, two or more “ancestors” (hypernym synsets) at the same time.

## Evaluation

We expect from participant a ranked list of 10 possible candidates for each new word in the test set. We will evaluate the systems using the [Mean Average Precision](https://en.wikipedia.org/wiki/Evaluation_measures_(information_retrieval)#Mean_average_precision) (MAP) and [Mean Reciprocal Rank](https://en.wikipedia.org/wiki/Evaluation_measures_(information_retrieval)#Mean_average_precision) (MRR) scores. MAP score pays attention to the whole range of possible hypernyms, whereas MRR looks at how close to the top of the list a first correct prediction is. In addition to that, the F<sub>1</sub> score will be computed to evaluate the performance of the top 1 prediction of the methods. MAP will be the official metric to rank the submissions.

## Baselines

We will provide simple baselines based on distributional and neural language models. Besides, we believe that popular neural context-aware models (like ELMo and BERT) will be of particular use for this task as they can represent out-of-vocabulary words on the basis of their context. Therefore, everyone interested in testing these and other distributional semantic models are welcome to participate.

## Tracks

The task will feature two tracks: detection of hypernyms for nouns and for verbs. The participants are allowed to use any additional datasets and corpora in addition to the train set based on the [RuWordNet](http://www.ruwordnet.ru/) taxonomy. Moreover, we also provide the additional data: news text corpus, parsed Wikipedia corpus and [hypernym database](http://panchenko.me/data/joint/isas/ru-librusec-wiki-diff.csv.gz) from [Russian Distributional Thesaurus](https://mipt.ru/Russian_Distributional_Thesaurus). However, we ask participants to mention all additional resources used for training of models.

The participants can test their models on the public test set by submitting the results to the leaderboards for each track (Nouns and Verbs). Once the private test sets is released, the participants will have two weeks to predict hypernyms for it and submit their final results.

## Important Dates

* First Call for Participation: December 15, 2019
* Release of the Training Data: December 15, 2019
* Release of the Test Data: January 31, 2020
* Submission of the Results: February 14, 2020
* Results of the Shared Task: February 28, 2020
* Article submission deadlines: March 10, 2020

## Participate

Please submit your solutions to CodaLab at <https://competitions.codalab.org/competitions/22168>.

Join our discussion group in Telegram: <https://t.me/joinchat/Ckja7Vh00qPOU887pLonqQ>.

## Organizers

* Irina Nikishina, Skoltech (<Irina.Nikishina@skoltech.ru>)
* Varvara Logacheva, Skoltech (<v.logacheva@skoltech.ru>)
* Alexander Panchenko, Skoltech
* Natalia Loukachevitch, Lomonosov Moscow State University
