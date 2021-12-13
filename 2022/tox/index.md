---
layout: default
title: Russian Text Detoxification Based on Parallel Corpora 
description: Shared task on Text detoxification based on parallel corpora for the Russian Language. Automatic detoxification of the Russian texts aims to combat offensive speech.
---

# Russian Text Detoxification Based on Parallel Corpora 

You are very welcome to the first shared task on text detoxification based on a parallel dataset!

Identification of toxicity in user texts is an active area of research. Today, social networks such as [Facebook](https://edition.cnn.com/2021/06/16/tech/facebook-ai-conflict-moderation-groups/index.html, https://vk.com/press/stickers-hate-speech), [Instagram](https://about.instagram.com/blog/announcements/introducing-new-tools-to-protect-our-community-from-abuse), VK are trying to address the problem of toxicity. However, they usually simply block such kinds of texts. We suggest a proactive reaction to toxicity from the user. Namely, we aim at presenting a neutral version of a user message which preserves meaningful content. We denote this task as *detoxification*.

Detoxification can be solved with Text Style Transfer (TST) [1] methods. There already exist unsupervised approaches to detoxification [2, 3] trained without parallel corpora for the Russian and English languages. However, the output of these models is often of bad quality.

Russian IT company Yandex already tried to address the detoxification problem and launched the first [detoxification competition](https://yandex.ru/cup/ml/analysis/#NLP). However, we want to extend this setup. We collected **a new parallel corpus** of toxic sentences and their manually written non-toxic paraphrases and want to refer to the detoxification task as a machine translation task.

## Task Formulation

We present the first of its kind style transfer competition with parallel corpora and human evaluation. More specifically, we address the problem of transferring style from toxic into non-toxic for the Russian language.

The task of detoxification can be formulated as follows: given texts in the toxic style, we want to paraphrase them to the non-toxic style, preserving the content and generating fluent text.

For example:

|| toxic sentence | detoxified sentence |
| --- | --- | --- |
||из за таких пидоров мы и страдаем | Из-за таких людей мы и страдаем |
|*translation:*|*We suffer from such faggots*| *We suffer from such people* |
|||
||хуй знает кто кум, но девушка красивая👍 | неизвестно кто кум, но девушка красивая |
|*translation:*|*fuck knows who the godfather is, but the girl is beautiful 👍*|*it is unknown who the godfather is, but the girl is beautiful*|
|||
||порядок бы блять навёл ! | Порядок бы навел |
|*translation:*|*Put these fucking things in order*|*Put the things in order*|

Everyone interested in TST and detoxification is welcome to participate. The participants are allowed to use any additional datasets or models if they are publicly available. However, we ask participants to mention all additional resources used for the training of models. The participants can test their models on the public test set by submitting the results to the leaderboard. Once the private test set is released, the participants will have a week to detoxify the test sentences and submit their final results.

## Dataset

For this shared task, we created a new dataset with parallel data for detoxification. We hired workers via [Yandex.Toloka platform](https://toloka.yandex.ru/). The pipeline for the parallel detoxification collection was presented in the work [4] and tested for an English dataset collection. We have improved this pipeline and adapted it for the Russian language.

The whole pipeline consists of three tasks:

* **Paraphrase generation.** The annotators are asked to generate a neutral paraphrase of the input text. They can also select not to rewrite the input if the text is already neutral or it is difficult to extract non-toxic content.

Of course, the annotators can write anything as a paraphrase. However, we have very strict criteria to style-transferred text – the text must be now in a neutral style and the content must be preserved. To ensure this, we validate received paraphrases with the next tasks.

* **Content preservation check.** Given to texts – original toxic sentence and generated paraphrase – the annotators should validate if these texts are with similar content. 

* **Toxicity classification.**  Given the generated paraphrase, the annotators should classify it into one of the classes – toxic or neutral.

If the generated paraphrase receives correct answers with high (>=90%) confidence, then it gets into our dataset.

For the original data, we took the toxic part of the toxic classification datasets based on [Odnoklassniki](https://www.kaggle.com/blackmoon/russian-language-toxic-comments) and [Pikabu](https://www.kaggle.com/alexandersemiletov/toxic-russian-comments). As a result, we collected a dataset with paraphrases for **5026** toxic sentences, each having **1-3** paraphrase variants, resulting in **7058** paraphrases overall. 

## Evaluation

As TST is quite a new and difficult task to evaluate, there are several works dedicated to the choice of metrics for this task [5,6]. As in our competition we propose a new parallel corpus for detoxification tasks and now can refer to TST tasks like machine translation tasks, we want to use the best practices of machine translation competitions and hold two parts of submissions evaluation – automatic and human.

### Automatic Evaluation

The goals of a style transfer model are to (i) change the text style, (ii) preserve the
content, and (iii) yield a grammatical sentence. Thus, the automatic evaluation phase consists of the following metrics:


* **Style transfer accuracy (STA).** [Bert-based classifier](https://huggingface.co/SkolkovoInstitute/russian_toxicity_classifier)  (fine-tuned from Conversational Rubert) trained on merge of Russian Language Toxic Comments dataset collected from 2ch.hk and Toxic Russian Comments dataset collected from ok.ru.
* **Meaning preservation score (SIM)** is evaluated as cosine similarity of [LaBSE sentence embeddings](<https://arxiv.org/abs/2007.01852>). For computational optimization, we use the [model](https://huggingface.co/cointegrated/LaBSE-en-ru), which is original LaBSE from Google with embeddings for languages other than Russian and English stripped away.
* **Fluency score (FL)** is evaluated with the [weakly supervised classifier](https://huggingface.co/SkolkovoInstitute/rubert-base-corruption-detector). This BERT-based model has been trained to distinguish 780 thousand texts from Odnoklassniki and Pikabu toxicity datasets and a few [web corpora](<https://wortschatz.uni-leipzig.de/en/download>) from their corrupted versions. The corruptions included random replacement, deletion, addition, shuffling, and re-inflexion of words and characters, random changes of capitalization, round-trip translation, filling random gaps with T5 and RoBERTA models. For each sentence pair, fluency score is the difference of probabilities of being non-corrupted assigned by this classifier to the rewritten sentence and to the original sentence.  

* STA, SIM and FL scores are all linearly calibrated to match human judgements of the corresponding properties, and clipped between 0 and 1.

* **Joint score:**  This is the metric by which **the ranking of automatic evaluation** will be conducted. This metric is calculated as a superposition of three metrics -STA, SIM, and FL: J = (STA * SIM * FL)

* **[ChrF1](https://github.com/m-popovic/chrF):** While all previous metrics compare the output of the model with the original toxic sentences, this metric uses neutral references for the comparison.


### Human Evaluation

After private set submissions, we are going to select the best model for each participant based on an automatically calculated J score. These submissions will be used for the final ranking phase – human evaluation.

We are going to use Yandex.Toloka platform to evaluate participants’ results on a private test set. The texts will be as well evaluated based on three parameters – style transfer accuracy, content preservation, and fluency:


* **Toxicity classification (STA).** Given the generated paraphrase, the annotators should classify it into one of the classes – *toxic* or *neutral*.
* **Content preservation check (SIM).** Given to texts – original toxic sentence and generated paraphrase – the annotators should validate if these texts are with similar content and mark them as *similar* or *dissimilar*.

* **Fluency task (FL).** The annotators validate if the text is written correctly and is meaningful. For fair evaluation, this metric is calculated relative as well to the original sentence. Both original and generated sentences will be evaluated three-point scale: *Absolutely correct* – the words and the whole sentence are correct, meaningful, but we allow punctuation and register mistakes, so some commas can be missed or the sentence can start from the lower-cased letter; *With some mistakes, but meaningful* – the text can contain some incorrectly written or corrupted words, but the reader still can understand the meaning of the whole text; *Incorrect and meaningless* – the sentence contains mistakes that make it difficult to understand the meaning of the text. If the generated sentence receives a score the same or higher than the original sentence, then it will be marked as *correct*, otherwise – *incorrect*.


After receiving manual scores of these three parameters, they again will be concatenated into one joint metric J as a superposition of three scores: J = STA * SIM * FL. **This metric will be used for the final ranking of the participants. The final table with results will be published on the [competition web-page](https://russe.nlpub.org/2022/tox/).**

## Baselines

We provide several baselines for this task: a rule-based **Delete** approach and an approach based on the **[T5 model](https://huggingface.co/sberbank-ai/ruT5-base)**. 

* **Delete:** This is a simple unsupervised method that eliminates toxic words based on a predefined [toxic words vocabulary](https://github.com/skoltech-nlp/rudetoxifier/blob/main/data/train/MAT_FINAL_with_unigram_inflections.txt). The idea is often used on television and other media: rude words are bleeped out or hidden with special characters (usually an asterisk). 

* **T5-base:** This is the supervised baseline based on the T5 model. We trained the [ruT5-base model](https://huggingface.co/sberbank-ai/ruT5-base) on the train part of our dataset.


You are welcome to test other brand new Russian Encoder-Decoder models (like GPT-2, GPT-3, T5, etc.) or other monolingual or multilingual Transformers.  Also, we are expecting to see interesting modifications of classical Seq2Seq models or even brand-new approaches.

## Important Dates

* First Call for Participation: December 15, 2021
* Release of the Training Data: December 15, 2021
* Release of the Test Data: January 31, 2022
* Submission of the Results: February 14, 2022
* Results of the Shared Task: February 28, 2022
* Article submission deadlines: March 15, 2022

## Participate

Please submit your solutions to CodaLab: [will be available soon]<https://codalab.lisn.upsaclay.fr/competitions/584>.

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

## References

*[1] Jin, Di, Zhijing Jin, Zhiting Hu, Olga Vechtomova and Rada Mihalcea. **“Deep Learning for Text Style Transfer: A Survey.”** *ArXiv abs/2011.00416 (2020). [paper](https://arxiv.org/abs/2011.00416)*

*[2] Dementieva, Daryna, Daniil Moskovskiy, Varvara Logacheva, David Dale, Olga Kozlova, Nikita Semenov, and Alexander Panchenko. **“Methods for Detoxification of Texts for the Russian Language”** *Multimodal Technologies and Interaction 5 (2021): no. 9: 54. https://doi.org/10.3390/mti5090054. [paper](https://www.mdpi.com/2414-4088/5/9/54/pdf)*

*[3] Dale, David, Anton Voronov, Daryna Dementieva, Varvara Logacheva, Olga Kozlova, Nikita Semenov and Alexander Panchenko. **“Text Detoxification using Large Pre-trained Neural Models.”** *EMNLP (2021). [paper](https://arxiv.org/pdf/2109.08914.pdf)*

*[4] Daryna Dementieva, Sergey Ustyantsev, David Dale, Olga Kozlova, Nikita Semenov, Alexander Panchenko, Varvara Logacheva. **“Crowdsourcing of Parallel Corpora: the Case of Style Transfer for Detoxification.”** *Proceedings of the 2nd Crowd Science Workshop: Trust, Ethics, and Excellence in Crowdsourced Data Management at Scale co-located with 47th International Conference on Very Large Data Bases (VLDB), 2021. [paper](http://ceur-ws.org/Vol-2932/paper2.pdf)*

*[5] Yamshchikov I. P. et al. **“Style-transfer and Paraphrase: Looking for a Sensible Semantic Similarity Metric.”** *Proceedings of the AAAI Conference on Artificial Intelligence. – 2021. – Т. 35. – №. 16. – С. 14213-14220 [paper](https://arxiv.org/abs/2004.05001)*

*[6] Briakou E. et al. **“Evaluating the Evaluation Metrics for Style Transfer: A Case Study in Multilingual Formality Transfer.”** *Proceedings of the 2021 Conference on Empirical Methods in Natural Language Processing. – 2021. – С. 1321-1336. [paper](https://arxiv.org/abs/2110.10668)*
