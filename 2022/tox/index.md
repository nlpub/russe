---
layout: default
title: Russian Text Detoxification Based on Parallel Corpora 
description: Shared task on Text detoxification based on parallel corpora for the Russian Language. Automatic detoxification of the Russian texts aims to combat offensive speech.
---

# Russian Text Detoxification Based on Parallel Corpora 

You are very welcome to the first shared task on text detoxification based on a parallel dataset!

**Quick Start:** 
- The task is to rewrite Russian toxic sentences into non-toxic sentences which mean the same thing
- The training data, baselines, and evaluation scripts are available on [github](https://github.com/skoltech-nlp/russe_detox_2022)
- You should submit via [CodaLab](https://codalab.lisn.upsaclay.fr/competitions/642)
- Competition news and discussion are in the [Telegram chat](https://t.me/joinchat/Ckja7Vh00qPOU887pLonqQ)
- The intermediate evaluation is automatic, the final evaluation will be manual.

**Contents:**
1. [Motivation](#motivation)
2. [Task Formulation](#task_formulation)
3. [Dataset](#dataset)
4. [Evaluation](#evaluation)
  - [Automatic evaluation](#automatic_evaluation)
  - [Human evaluation](#human_evaluation)
5. [General rules](#general_rules)
6. [Baselines](#baselines)
7. [RESULTS](#results)
8. [Important dates](#important_dates)
9. [Organizers](#organizers)
10. [Acknowledgements](#acknowledgements)
11. [References](#references)


## <a name="motivation"></a>Motivation

Identification of toxicity in user texts is an active area of research. Today, social networks such as [Facebook](https://edition.cnn.com/2021/06/16/tech/facebook-ai-conflict-moderation-groups/index.html), [Instagram](https://about.instagram.com/blog/announcements/introducing-new-tools-to-protect-our-community-from-abuse), [VK](https://vk.com/press/stickers-hate-speech) are trying to address the problem of toxicity. However, they usually simply block such kinds of texts. We suggest a proactive reaction to toxicity from the user. Namely, we aim at presenting a neutral version of a user message which preserves meaningful content. We denote this task as *detoxification*.

Detoxification can be solved with Text Style Transfer (TST) [[1](#cite1)] methods. There already exist unsupervised approaches to detoxification [2, 3] trained without parallel corpora for the Russian and English languages. However, the output of these models is often of bad quality.

Russian IT company Yandex already tried to address the detoxification problem and launched the first [detoxification competition](https://yandex.ru/cup/ml/analysis/#NLP). However, we want to extend this setup. We collected **a new parallel corpus** of toxic sentences and their manually written non-toxic paraphrases and want to refer to the detoxification task as a machine translation task.

## <a name="task_formulation"></a>Task Formulation

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

## <a name="dataset"></a>Dataset

We provide a parallel detoxification dataset. The source sentences are Russian toxic messages from [Odnoklassniki](https://www.kaggle.com/blackmoon/russian-language-toxic-comments), [Pikabu](https://www.kaggle.com/alexandersemiletov/toxic-russian-comments) and [Twitter](http://study.mokoron.com/) platforms. The target part of the dataset are the same messages which were manually rewritten by crowd workers to eliminate toxicity. Some toxic sentences contain multiple (up to 3) variants of detoxification.

The dataset is divided into train, development, and test sets. The train and development parts are made available along with their references from the beginning of the competition. The source test sentences will be made available during the evaluation phase. The reference test sentences will be released after the end of the competition. Dataset statistics:
- train: 3,539 toxic sentences with 1-3 detoxified versions;
- development: 800 toxic sentences with 1-3 detoxified versions;
- test: 1,474 toxic sentences with 1-3 detoxified versions.

The dataset was collected for this competition. We hired workers via [Yandex.Toloka platform](https://toloka.yandex.ru/). The pipeline for the parallel detoxification collection was presented in the work [4] and tested for an English dataset collection. We have improved this pipeline and adapted it for the Russian language.

The whole pipeline consists of three tasks:

* **Paraphrase generation.** The annotators are asked to generate a neutral paraphrase of the input text. They can also select not to rewrite the input if the text is already neutral or it is difficult to extract non-toxic content.

Of course, the annotators can write anything as a paraphrase. In order to filter out paraphrases of low quality,  we validate them with the next tasks.

* **Content preservation check.** Given two texts – an original toxic sentence and a generated paraphrase – the annotators should indicate if the content of these texts matches.  

* **Toxicity classification.**   Given the generated paraphrase, the annotators should label it as toxic or neutral.

If the generated paraphrase receives correct answers with high (>=90%) confidence, then it gets into our dataset.

## <a name="evaluation"></a>Evaluation

Style transfer is difficult to evaluate automatically because there are multiple ways of rewriting a sentence in a different style. Thus, there is no established evaluation strategy. There exist several concurrent evaluations strategies each having its weak points [5,6]. We use the best practices of machine translation and other text generation competitions and perform automatic as well as manual evaluation. 


### <a name="automatic_evaluation"></a>Automatic Evaluation

The goals of a style transfer model are to (i) change the text style, (ii) preserve the
content, and (iii) yield a grammatical sentence. Thus, the automatic evaluation phase consists of the following metrics:


* **Style transfer accuracy (STA)** is evaluated with a [BERT-based classifier](https://huggingface.co/SkolkovoInstitute/russian_toxicity_classifier) (fine-tuned from Conversational Rubert) trained on merge of Russian Language Toxic Comments dataset collected from 2ch.hk and Toxic Russian Comments dataset collected from ok.ru.
* **Meaning preservation score (SIM)** is evaluated as cosine similarity of [LaBSE sentence embeddings](https://arxiv.org/abs/2007.01852). For computational optimization, we use the [model version](https://huggingface.co/cointegrated/LaBSE-en-ru), which is original LaBSE from Google with embeddings for languages other than Russian and English stripped away.
* **Fluency score (FL)** is evaluated with a [fluency classifier](https://huggingface.co/SkolkovoInstitute/rubert-base-corruption-detector). This is a BERT-based model trained to distinguish real user-generated texts from corrupted texts. We train the model on 780 thousand texts from Odnoklassniki and Pikabu toxicity datasets and a few [web corpora](<https://wortschatz.uni-leipzig.de/en/download>) and on their automatically corrupted versions. The corruptions included random replacement, deletion, insertion, shuffling, and re-inflexion of words and characters, random changes of capitalization, round-trip translation, filling random gaps with T5 and RoBERTA models. For each sentence pair, we compute the probability of being corrupted for its source and target sentences. The overall fluency score is the difference between these two probabilities. The rationale behind this is the following. Since we detoxify user-generated sentences, they can already contain errors and disfluencies, and it is unfair to expect a detoxification model to fix these errors. We make sure that the detoxification model produces a text which is not worse in terms of fluency than the original message.  

* **Joint score:**  We combine the three metrics to get a single number along which models can be compared. It is computed as an averaged sentence-level multiplication of STA, SIM, and FL: J = (STA * SIM * FL). This metric will be used for **ranking models during the automatic evaluation**.

STA, SIM and FL scores are all linearly calibrated to match human judgements of the corresponding properties, and clipped between 0 and 1.

Since we have reference answers for the public and private test sets, we compute the reference-based **[ChrF1](https://github.com/m-popovic/chrF)** metric, which is the character-level F1 score. This metric will be given only for participants’ information and will not influence the ranking of models.


### <a name="human_evaluation"></a>Human Evaluation

Since the automatic metrics (both referenceless classifiers and reference-based metrics) cannot reliably identify the best-performing model, we also conduct the manual evaluation of the private test set.

After having submitted the detoxified versions of the private test set, participants can choose one of their models for manual evaluation. If a participant does not choose the model themselves, we are going to select their model which yielded the highest automatic J score.

The outputs of the best models (one per participant/team) will be manually evaluated along with three parameters: style transfer accuracy, content preservation, and fluency:


* **Toxicity (STA).**  Given the generated paraphrase, the annotators should classify it into one of the classes – *toxic* or *neutral*.

* **Content preservation (SIM).**  Given two texts (original toxic sentence and generated paraphrase) the annotators should evaluate the similarity of their content and mark them as *similar* or *dissimilar*.

* **Fluency task (FL).** The annotators validate if the text is grammatically correct and meaningful. For a fair evaluation, this metric is calculated relative to the original sentence. Both original and generated sentences will be evaluated along a three-point scale:     
  - *Absolutely correct* – the words and the whole sentence are correct, meaningful, but we allow punctuation and register mistakes because they are common in user-generated content;
  - *Contains mistakes, but is meaningful* – the text can contain some words with errors or typos, but the reader still can understand the meaning of the whole text;
  - *Incorrect and meaningless* – the sentence contains mistakes that make it difficult to understand the meaning of the text. 

If the generated sentence receives a score the same or higher than the original sentence, then it will be marked as *correct*, otherwise – *incorrect*.

After receiving manual scores of these three parameters, they will be combined into one joint metric J as a sentence-level multiplication of three scores: J = STA * SIM * FL. **This metric will be used for the final ranking of the participants and for identifying the winner. The final table with results will be published on the [competition web-page](https://russe.nlpub.org/2022/tox/).**

## <a name="general_rules"></a>General Rules

We welcome various architectures and models for detoxification.
Participants are welcome to use any additional data and existing pre-trained models under open source licences.

Once results are submitted, participants must provide their source code and model via GitHub.

We do not encourage any type of automatic metric abuse or hackathon methods with automatic evaluation, e.g. adversarial attacks, p-hacking, etc. As the second stage of the evaluation is manual (see Evaluation), solutions with non-human readable texts will be excluded.

## <a name="baselines"></a>Baselines

We provide two baselines for this task: a rule-based **Delete** approach and an approach based on the **[T5 model](https://huggingface.co/sberbank-ai/ruT5-base)**. 

* **Delete:** This is an unsupervised method that eliminates toxic words based on a predefined [toxic words vocabulary](https://github.com/skoltech-nlp/rudetoxifier/blob/main/data/train/MAT_FINAL_with_unigram_inflections.txt). The idea is often used on television and other media: rude words are bleeped out or hidden with special characters (usually an asterisk). We provide both the vocabulary and the script that applies it to input sentences.

* **T5-base:** This is the supervised baseline based on the T5 model. We trained the [ruT5-base model](https://huggingface.co/sberbank-ai/ruT5-base) on the train part of our dataset.

You are welcome to test other brand new Russian Encoder-Decoder models (GPT-2, GPT-3, T5, etc.) or other monolingual or multilingual Transformers.  Also, we would be happy to see interesting modifications of classical Seq2Seq models or even novel approaches.

## <a name="results"></a>RESULTS

The final results will be available here after the human evaluation.

## <a name="important_dates"></a>Important Dates

* First Call for Participation: December 15, 2021
* Release of the Training Data: December 15, 2021
* Release of the Test Data: January 31, 2022
* Submission of the Results: February 14, 2022
* Human Evaluation Results: February 28, 2022
* Article submission deadlines: March 15, 2022

## <a name="motivation"></a>Participate

Please submit your solutions to CodaLab: [will be available soon](https://codalab.lisn.upsaclay.fr/competitions/642).

Join our discussion group in Telegram: <https://t.me/joinchat/Ckja7Vh00qPOU887pLonqQ>.

## <a name="organizers"></a>Organizers

* Daryna Dementieva, Skoltech
* Irina Nikishina, Skoltech
* Varvara Logacheva, Skoltech
* David Dale, Skoltech 
* Alexander Panchenko, Skoltech
* Irina Krotova, Mobile TeleSystems (MTS)
* Nikita Semenov, Mobile TeleSystems (MTS)
* Tatiana Shavrina, Sberbank
* Alena Fenogenova, Sberbank

<img src="./logos/skoltech_logo.png" alt="skoltech" width="100"/> <img src="./logos/MTS_Al_Crop_Red.png" alt="mts" width="100"/>
<img src="./logos/Sber_Devices_1Line.png" alt="sber" width="180"/>

## <a name="acknowledgements"></a> Acknowledgements

The human evaluation is supported by the [Yandex.Toloka](https://toloka.yandex.ru/) research grant.

## <a name="references"></a>References

<a name="cite1"></a>[1] Jin, Di, Zhijing Jin, Zhiting Hu, Olga Vechtomova and Rada Mihalcea. **“Deep Learning for Text Style Transfer: A Survey.”** *ArXiv abs/2011.00416 (2020). [pdf](https://arxiv.org/abs/2011.00416)*

[2] Dementieva, Daryna, Daniil Moskovskiy, Varvara Logacheva, David Dale, Olga Kozlova, Nikita Semenov, and Alexander Panchenko. **“Methods for Detoxification of Texts for the Russian Language”** *Multimodal Technologies and Interaction 5 (2021): no. 9: 54. https://doi.org/10.3390/mti5090054. [pdf](https://www.mdpi.com/2414-4088/5/9/54/pdf)*

[3] Dale, David, Anton Voronov, Daryna Dementieva, Varvara Logacheva, Olga Kozlova, Nikita Semenov and Alexander Panchenko. **“Text Detoxification using Large Pre-trained Neural Models.”** *EMNLP (2021). [pdf](https://arxiv.org/pdf/2109.08914.pdf)*

[4] Daryna Dementieva, Sergey Ustyantsev, David Dale, Olga Kozlova, Nikita Semenov, Alexander Panchenko, Varvara Logacheva. **“Crowdsourcing of Parallel Corpora: the Case of Style Transfer for Detoxification.”** *Proceedings of the 2nd Crowd Science Workshop: Trust, Ethics, and Excellence in Crowdsourced Data Management at Scale co-located with 47th International Conference on Very Large Data Bases (VLDB), 2021. [pdf](http://ceur-ws.org/Vol-2932/paper2.pdf)*

[5] Yamshchikov I. P. et al. **“Style-transfer and Paraphrase: Looking for a Sensible Semantic Similarity Metric.”** *Proceedings of the AAAI Conference on Artificial Intelligence. – 2021. – Т. 35. – №. 16. – С. 14213-14220. [pdf](https://ojs.aaai.org/index.php/AAAI/article/view/17672/17479)*

[6] Briakou E. et al. **“Evaluating the Evaluation Metrics for Style Transfer: A Case Study in Multilingual Formality Transfer.”** *Proceedings of the 2021 Conference on Empirical Methods in Natural Language Processing. – 2021. – С. 1321-1336. [pdf](https://aclanthology.org/2021.emnlp-main.100.pdf)*
