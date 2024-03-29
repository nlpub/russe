---
layout: 2022-tox
title: Russian Text Detoxification Based on Parallel Corpora 
description: Shared task on Text detoxification based on parallel corpora for the Russian Language. Automatic detoxification of the Russian texts aims to combat offensive speech.
---

# Russian Text Detoxification Based on Parallel Corpora 

!!!The [RESULTS](#results) are out!!!

You are very welcome to the first shared task on text detoxification based on a parallel dataset!

**Quick Start:** 
- The task is to rewrite Russian toxic sentences into non-toxic sentences which mean the same thing
- The training data, baselines, and evaluation scripts are available on [github](https://github.com/skoltech-nlp/russe_detox_2022)
- You should submit via [CodaLab](https://codalab.lisn.upsaclay.fr/competitions/642)
- Competition news and announcements are in the [Telegram channel](https://t.me/russe_detox) 
- Join the [Telegram chat](https://t.me/joinchat/Ckja7Vh00qPOU887pLonqQ) for the participants
- The intermediate evaluation is automatic, the final evaluation will be manual.

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

### <a name="data_collection"></a>Data collection pipeline

The dataset was collected for this competition. We hired workers via [Yandex.Toloka platform](https://toloka.yandex.ru/). The pipeline for the parallel detoxification collection was presented in the work [4] and tested for an English dataset collection. We have improved this pipeline and adapted it for the Russian language.

The whole pipeline consists of three tasks:

* **Paraphrase generation.** The annotators are asked to generate a neutral paraphrase of the input text. They can also select not to rewrite the input if the text is already neutral or it is difficult to extract non-toxic content.

Of course, the annotators can write anything as a paraphrase. In order to filter out paraphrases of low quality,  we validate them with the next tasks.

* **Content preservation check.** Given two texts – an original toxic sentence and a generated paraphrase – the annotators should indicate if the content of these texts matches.  

* **Toxicity classification.**   Given the generated paraphrase, the annotators should label it as toxic or neutral.

If the generated paraphrase receives correct answers with high (>=90%) confidence, then it gets into our dataset.

### <a name="definition_toxicity"></a>Definition of toxicity

We generated the paraphrases manually via crowdsourcing. We hired crowd workers using Yandex.Toloka platform. Then, in order to check if the paraphrase is really non-toxic, we launched checked it for toxicity, also via crowdsourcing. The notion of toxicity was explained to the crowd workers using the instructions and training examples.

Please find the instructions below:

>You are asked to read sentences and define if they contain offences, swear or rude words. 
>
>Attention! Non-offensive sentences can contain criticism and have a negative sentiment.
>
>**Examples**
>
>Offensive sentences:
>- Интернетная шпана, не тебе меня поучать. (*You internet punks, it's not for you to lecture me*).
>- Какая подписка, что ты несёшь, поехавший? (*What kind of subscription, what are you talking about, idiot?*)
>- Как минимум два малолетних дегенерата в треде, мда. (*At least two juvenile degenerates in a thread, hmm.*)
>- Вообще не вижу смысла спорить по поводу дюймов, хуёвый там ips или нет, машина не этим интересна. (*In general, I see no reason to argue about inches, no matter if ips is shit or not, it’s not the main thing about a car.*)
>
>Нейтральные (не оскорбительные) предложения:
>- У нас в есть убунты и текникал превью. (*We have ubuntu and technical previews.*)
>- он тоже был храбрым! (*he was brave too!*)
>- Это бессмысленно, ты же знаешь (*It's pointless, you know*)
>- Если он мечтает съесть своих соседей то это плохо. (*If he dreams of eating his neighbors, then this is bad.*)

We provide training examples to fine-tune workers’ understanding of toxicity. The examples have a hint which is shown if a worker chooses a wrong answer. Some examples of training questions:

- “а так реагировать на простое фото это пиздец, по моему фляга у тебя свистит пиздец как” (*And such reaction to a simple photo is fucked up, in my opinion you’re retarded*)
  - *Label*: toxic 
  - *Hint*: Use of obscenity (“fucked up”) and insult (“retarded”)
- “тварина ебаная если это ее слова” (*Fucking beast if that's her words*)
  - *Label*: toxic 
  - *Hint*: Use of insult (“fucking beast”)
- “ну ты глупый” (*You’re stupid*)
  - *Label*: toxic 
  - *Hint*: Insult of the interlocutor (“stupid”)
- “Лжецы. Вот и что с такими делать?” (*Liars. So what should we do to them?*)
  - *Label*: non-toxic 
  - *Hint*: "Liars" is not an insult, but rather a statement of fact and not a swear word.
- “очень плохой человек тот кто со своим ружьем такую птицу убивает” (*A very bad person is the one who kills such a bird with his gun*)
  - *Label*: non-toxic 
  - *Hint*: A "bad person" is not an insult.
- “Странная, люди просто салатом делятся” (*You are strange, people are just sharing their salads*)
  - *Label*: non-toxic 
  - *Hint*: No offences or swear words.

Non-toxic sentences can still contain criticism such as “bad person”, “liar”, etc. Since our task is to detoxify a text while saving its content, we also allow keeping negative content. We also do not focus on subtle forms of toxicity such as sarcasm or passive aggression, since they are difficult to identify not only for machines, but also for untrained human assessors. We leave work on these types of toxicity for future work.

During the dataset collection we tried to exclude examples which are impossible to detoxify. These are (i) sentences whose meaning is offensive, (ii) sentences which aren’t toxic so can’t be detoxified, and (iii) sentences with unclear meaning. See the following examples:
- “пристрелить этих уродов без суда и следствия” (*shoot these freaks without trial*)
  - *Reason*: toxic content
- “а что ты сука умеешь, только ноги раздвигать...” (*and what can you bitch, you can only spread your legs...*)
  - *Reason*: toxic content
- “пидоры они в квадрате суки.” (*fags are squared bitches.*)
  - *Reason*: toxic content
- “ч оз тема ч о класс ответить д лёка продаю пизду дочери комментарий” (*h oz topic h about class answer d loka sell pussy daughter comment*)
  - *Reason*: unclear content
- “СВИНОРУСЫ 19 реджев В треде 19 хохлов” (*PIGS 19 regges In the thread 19 Ukrainians*)
  - *Reason*: unclear content

Paraphrasing sentences with toxic content cannot remove toxicity, and if we manage to remove it, the sense of such sentence will be very different from the original one. 

We would also like to remind that manual labelling can contain a small number of errors, especially if it is non-expert labelling. Thus, you can find occasional incorrect examples in the data.

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

### Human Evaluation

|Team Name|STA|SIM|FL|J|
| --- | --- | --- | --- | --- |
|Human References|**0.888**|**0.824**|0.894|**0.653**|
|**SomethingAwful**|0.794|**0.872**|**0.903**|**0.633**|
|T5 (baseline)|0.791|0.822|**0.925**|**0.606**|
|FRC CSC RAS|0.734|**0.865**|**0.918**|0.598|
|Mindful Squirrel|**0.824**|0.791|0.846|0.582|
|team_ruprompts|0.778|0.809|0.903|0.568|
|orzhan|0.805|0.782|0.869|0.565|
|Barracudas|0.790|0.718|0.782|0.505| 
|king_menin|**0.808**|0.697|0.897|0.501|
|Ruprompts (baseline)|0.803|0.703|0.866|0.493|
|NSU team|0.767|0.721|0.825|0.455|
|anzak|0.433|0.624|0.791|0.171|
|Delete (baseline)|0.387|0.705|0.726|0.162|
|gleb_shnshn|0.249|0.128|0.238|0.016|

### Automatic Evaluation

|Team Name|STA|SIM|FL|J|ChrF|
| --- | --- | --- | --- | --- | --- |
|gleb_shnshn|**0.975**|**0.935**|**0.959**|**0.873**|0.529|
|orzhan|**0.982**|0.860|**0.969**|**0.822**|0.550|
|FRC CSC RAS|0.945|0.855|**0.967**|**0.784**|0.571|
|SomethingAwful|**0.948**|0.819|0.911|0.709|**0.573**|
|Mindful Squirrel|0.933|0.798|0.885|0.659|0.564|
|king_menin|0.942|0.728|0.889|0.614|0.497|
|T5 (baseline)|0.796|0.827|0.837|0.560|**0.573**|
|team_ruprompts|0.804|0.804|0.829|0.542|0.563|
|Ruprompts (baseline)|0.811|0.793|0.804|0.528|0.547|
|Barracudas|0.852|0.758|0.785|0.523|0.532|
|Human References|0.846|0.716|0.783|0.494|**0.773**|
|NSU team|0.830|0.756|0.757|0.483|0.505|
|anzak|0.569|**0.892**|0.910|0.441|0.536|
|Delete (baseline)|0.558|**0.887**|0.852|0.406|0.529|

## <a name="important_dates"></a>Important Dates

* ~~First Call for Participation: December 15, 2021~~
* ~~Release of the Training Data: December 15, 2021~~
* ~~Release of the Test Data: January 31, 2022~~
* ~~Submission of the Results: February 14, 2022~~
* ~~Human Evaluation Results: February 28, 2022~~
* Article submission deadlines: March 25, 2022

## <a name="participate"></a>Participate

Please submit your solutions to CodaLab: <https://codalab.lisn.upsaclay.fr/competitions/642>.

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
