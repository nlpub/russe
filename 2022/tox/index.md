---
layout: default
title: Russian Text Detoxification Based on Parallel Corpora 
description: Shared task on Text detoxification based on parallel corpora for the Russian Language. Automatic detoxification of the Russian texts aims to combat offensive speech.
---

# Russian Text Detoxification Based on Parallel Corpora 

Identification of toxicity in user texts is an active area of research. The task of automatic rewriting of offensive content attracted less attention, yet it may find various useful applications such as making the online world a better place by suggesting to a user posting a more neutral version of an emotional comment. The existing works on text detoxification cast this task as style transfer. The style transfer task is generally understood as rewriting of text with the same content and with the altering of one or several attributes which constitute the “style”, such as authorship, sentiment, or degree of politeness. 

One of the most straightforward ways of solving a style transfer task is to “translate” a source sentence into the target style using a supervised encoder-decoder model. Since the source and the target sequences are in the same language, pretrained LMs such as GPT-2 can be applied for this task — fine-tuning them on relatively small parallel corpora gives a good
result. However, this method is used quite rarely because of the lack of sufficiently large parallel data. The rest of the described models are trained in an unsupervised way.

Whereas much work has been done for the English language in this field, there are very few works on detoxification for the Russian language. Therefore, this competition is aimed to draw everyone's attention to the important NLP task of automatic rewriting of offensive content.

## Overview

We present the first competition with parallel corpora and human evaluation on the automatic detoxification of the Russian texts to combat offensive speech. Such a kind of textual style transfer can be used, for instance, for processing toxic content in social media and chatbot text filtering. In addition to the first parallel corpus of toxic / detoxified data for Russian, we also provide baseline approaches to style transfer and a set of evaluation metrics based on the state-of-the-art approaches to evaluation.

For this shared task, we compiled a new dataset with parallel data for detoxification. We asked crowd workers to rewrite toxic sentences so that they keep the original content and do not sound offensive. We hired workers via Yandex.Toloka platform. Since the phrases produced by crowd workers can be of low quality, they were further revised by other crowd workers. We collected a dataset with paraphrases for 11,939 toxic sentences, each having 1-3 paraphrase variants, resulting in 19,767 paraphrases overall. We also plan to expand the dataset with thousands of examples by filtering additional text sources and using assessors from Yandex.Toloka service.

Everyone interested in paraphrasing toxic sentences are welcome to participate. The participants are allowed to use any additional datasets or models if they are publicly available. However, we ask participants to mention all additional resources used for the training of models. The participants can test their models on the public test set by submitting the results to the leaderboard. Once the private test set is released, the participants will have a week to detoxify test sentences and submit their final results.

## Evaluation

The evaluation will be carried out both automatically (in CodaLab) and manually. Participants upload a file with the predicted results to the CodaLab competition system, then it is automatically evaluated with our script. The evaluation consists of the following metrics:

* Style transfer accuracy
* Meaning preservation score
* Fluency score
* Joint score (Style transfer accuracy * Meaning preservation score * Fluency score)
* ChrF1 <https://github.com/m-popovic/chrF>

## Baselines

We provide a baseline based on the T5 model <https://huggingface.co/sberbank-ai/ruT5-base>. Besides, we believe that popular Encoder-Decoder architectures will be of particular use for this task. Therefore, everyone interested in testing brand new Russian Encoder-Decoder models (like GPT-2, GPT-3, T5, etc.) are welcome to participate.

## Important Dates

* First Call for Participation: December 15, 2021
* Release of the Training Data: December 15, 2021
* Release of the Test Data: January 31, 2022
* Submission of the Results: February 14, 2022
* Results of the Shared Task: February 28, 2022
* Article submission deadlines: March 15, 2022

## Participate

Please submit your solutions to CodaLab at <https://codalab.lisn.upsaclay.fr/competitions/584>.

Join our discussion group in Telegram: <https://t.me/joinchat/Ckja7Vh00qPOU887pLonqQ>.

## Organizers

* Daryna Dementieva, Skoltech (<Daryna.Dementieva@skoltech.ru>)
* Irina Nikishina, Skoltech (<Irina.Nikishina@skoltech.ru>)
* Varvara Logacheva, Skoltech (<v.logacheva@skoltech.ru>)
* David Dale, Skoltech 
* Alexander Panchenko, Skoltech
* Olga Kozlova, Mobile TeleSystems (MTS)
* Irina Krotova, Mobile TeleSystems (MTS)
* Nikita Semenov, Mobile TeleSystems (MTS)
* Tatiana Shavrina, Sberbank
* Alena Fenogenova, Sberbank
