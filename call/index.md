---
layout: default
title: Call for Participation in RUSSE
description: "We are happy to announce two shared tasks of semantic similarity evaluation."
keywords: semantic similarity, relatedness, association, call for participation, RUSSE
---

# Call for Participation

We are happy to announce two shared tasks of semantic similarity evaluation: the relatedness and the association tasks. These tasks are quite accessible, so we encourage both beginners and experts to participate. Short descriptions of the tasks are given below. Potential participants should register in order to participate here as soon as possible: [http://goo.gl/xy8fWC](http://goo.gl/xy8fWC).

## Motivation, Contribution and Expected Results

A semantic similarity measure quantifies the semantic relatedness words or multiword expressions. It yields high values for the pairs of words in a semantic relation (synonyms, hyponyms, associations or co-hyponyms) and low values for all other pairs. Such measures proved to be useful for text processing applications, including text similarity, query expansion, question answering and word sense disambiguation.

Many methods for semantic similarity were proposed and tested during the last 20 years. Recently with the advent of neural network language models yielding state-of-the-art results on the semantic similarity task the interest in this field increased even more. Many authors tried to performed exhaustive comparisons of semantic similarity measures and developed a whole range of benchmarks and evaluations datasets.

Unfortunately, most of the approaches to semantic similarity were implemented and evaluated only on a handful of European languages, mostly in English. While some Russian researchers sporadically tried to adopt several methods developed for English, these efforts were mostly done in a context of some specific applications without any proper evaluation. To the best of our knowledge, no systematic investigation of semantic similarity measures of the Russian language was ever performed.

The goal of the RUSSE shared task is to fill this gap and to conduct an evaluation campaign of key currently available methods. The RUSSE competition will perform a systematic comparison of the currently available methods in the context of Russian language. This will let us identify specific features of the semantic similarity phenomena in Russian language. The event will be organized in a form of a competition of systems that calculate semantic similarity between word.

## Tasks Descriptions

**1\. The Relatedness Task.** In this task, two words are considered similar if they are synonyms, hypernyms or co-hyponyms. Two benchmarks will be provided for this task. The first dataset is based on human judgments about semantic similarity (a translated version of the widely used [MC](https://github.com/alexanderpanchenko/sim-eval/blob/master/datasets/mc.csv), [RG](https://github.com/alexanderpanchenko/sim-eval/blob/master/datasets/rg.csv), and [WordSim353](https://github.com/alexanderpanchenko/sim-eval/blob/master/datasets/wordsim.csv) datasets). The second dataset follows structure of the [BLESS](https://github.com/alexanderpanchenko/sim-eval/blob/master/datasets/bless.csv) and derived from the thesaurus [RuThes Lite](http://www.labinform.ru/pub/ruthes/index.htm).

**2\. The Association Task.** In this task, two words are considered similar if the second is an association of the first one. Association is here is understood as the "mental association" of a person on an input word "stimulus". We use results of the large-scale [Russian associative experiment](http://it-claim.ru/asis) in order to build training and test collections.

## Important Dates

* 22<sup>th</sup> October 2014 – announcement of the task
* <span class="strike">17<sup>th</sup> November 2014</span>  **24<sup>th</sup> November 2014** – release of the training data
* 5<sup>th</sup> January 2015 – release of the test data (submissions should be done on the test data)
* <span class="strike">10<sup>th</sup> January 2015</span>  **20<sup>th</sup> January 2015** – deadline for submissions
* 31<sup>th</sup> January 2015 – announcement of evaluation results
* 15<sup>th</sup> February 2015 – deadline for [Dialogue paper](http://dialog-21.ru/dialog2015/) submission

## Organizing Committee

* Natalia Loukachevitch, Research Computing Center, Moscow State University
* Alexander Panchenko, Digital Society Laboratory LLC & Universite catholique de Louvain
* Dmitry Ustalov, NLPub & Krasovsky Institute of Mathematics and Mechanics UB RAS
* Denis Paperno, Center for Brain/Mind Sciences, University of Trento
* Christian M. Meyer, UKP Lab, Technische Universitat Darmstadt
* Ilia Chetviorkin, Opiner.ru & Moscow State University
* Andrey Philippovich, Bauman Moscow State Technical University
* Natalia Konstantinova, University of Wolverhampton & First Utility.

Further details, including task rationale, schedule and datasets can be found on the RUSSE website: [http://russe.nlpub.ru/](http://russe.nlpub.ru/). Participants will be invited to submit a paper to the [Dialogue 2015 conference](http://www.dialog-21.ru/dialog2015/) describing their system. Inquiries and suggestions are welcome at [alexander.panchenko@uclouvain.be](mailto:alexander.panchenko@uclouvain.be).
