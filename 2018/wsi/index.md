---
layout: default
title: Russian Word Sense Induction Evaluation
description: "The RUSSE competition will perform a systematic comparison and evaluation of the baseline and the most recent approaches to word sense induction and disambuguation."
---

# A Shared Task on Word Sense Induction and Disambiguation for the Russian Language

We invite you to participate in the shared task on Word Sense Induction and Disambiguation for the Russian Language co-located with the [Dialogue 2018 conference](http://www.dialog-21.ru/en/). 

## Motivation

Word Sense Induction (WSI) is the process of automatic identification of the word senses. While evaluation of various sense induction and disambiguation approaches was performed in the past for the Western European languages, e.g., English, French, and German, no systematic evaluation of WSI for [Slavic languages](http://sigslav.cs.helsinki.fi) is available at the moment. This shared task makes a first step towards bridging this gap by setting up a shared task on one Slavic language. The goal of this task is to compare sense induction and disambiguation systems for the Russian language. Many Slavic languages still do not have broad coverage lexical resources available in English, such as WordNet, which provide a comprehensive inventory of senses. Therefore, word sense induction methods investigated in this shared task can be of great value to enable semantic processing of Slavic languages.  

If you are interested in participation, please [register using this form](https://goo.gl/forms/fnTNOwk4PrsZySX82) by the 15th of November.  A brief description of the present study in Russian is available at [NLPub](https://nlpub.ru/RUSSE).

## Task Description

The shared task is structurally similar to prior WSI tasks for the English language, such as [SemEval 2007 WSI](http://semeval2.fbk.eu/semeval2.php?location=tasks&taskid=2) and [SemEval 2010 WSI&D](https://www.cs.york.ac.uk/semeval2010_WSI/) tasks. 
We use the “lexical sample” settings. Namely, we provide the participants with the set of contexts representing examples of ambiguous words, like the word “bank” in “In geography, the word **bank** generally refers to the land alongside a body of water.” For each context, a participant needs to disambiguate one target word. Note that, we do not provide any sense inventory: the participant can assign sense identifiers of their choice to a context, e.g., “bank#1” or “bank (area)”.

### Tracks

The task will feature two tracks:

* In the “knowledge-free” track participants need to induce a sense inventory from a text corpus of their own. The participants need to use it to assign each context with a sense identifier according to this induced inventory.
* In the “knowledge-rich” track participants are free to use a sense inventory from an existing dictionary to disambiguate the target words (yet the use of the gold standard inventory is prohibited).

The advantage of our setting is that virtually any existing word sense disambiguation approach can be used within the framework of our shared task starting from unsupervised sense embeddings to the graph-based methods that rely on lexical knowledge bases, such as WordNet.

### Datasets

We will provide training datasets, which can be used for development of the models. Later, test datasets will be released: The participants will need to use the developed models to disambiguate the test sentences and submit their final results to the organisers. Training and testing datasets will use the same corpora and annotations approaches, but the target words will be different for training and testing datasets.

### Quality Measure

Similarly to SemEval 2010 Task 14 WSI&D, we use a gold standard, where each ambiguous target word is provided with a set of instances, i.e., the contextscontaining the word. Each instance is manually annotated with the single sense identifier according to a predefined sense inventory. Each participating system assigns the sense labels for these ambiguous words, which can be viewed as a clustering of instances, according to sense labels. To evaluate a system, the system's labelling of contexts is compared to the gold standard labelling. We use the Adjusted Rand Index (ARI) as the quantitative measure of the clustering.

### Baseline Systems

We will offer a simple open source baseline system that will demonstrate the task, the input and output data formats as well as the used quality measure. For the knowledge-free track, we particularly encourage participation of various systems based on unsupervised word sense embeddings, e.g., AdaGram. For the knowledge-rich track, word sense embeddings based on inventories based of lexical resources, e.g., AutoExtend, can be obtained on the basis of lexical resources such as [RuThes](http://www.labinform.ru/pub/ruthes/index.htm) and [RuWordNet](http://ruwordnet.ru/ru/).   

## Dissemination of the Results

The results of the shared task will be disseminated and discussed at the [24th International Conference on Computational Linguistics and Intellectual Technologies Dialogue 2018](http://www.dialog-21.ru/en/): the proceedings are indexed by Scopus. Training and the test datasets will be published online to foster future research and developments.

## Important Dates

* **First Call for Participation**: October 15, 2017.
* **Release of the Training Data**: November 1, 2017.
* **Release of the Test Data**: December 15, 2018.
* **Submission of the Results**: January 15, 2018.
* **Results of the Shared Task**: February 1, 2018.

## Organizers

* Alexander Panchenko, University of Hamburg
* Dmitry Ustalov, Krasovskii Institute of Mathematics and Mechanics
* Konstantin Lopukhin, Scrapinghub Inc.
* Anastasiya Lopukhina, Neurolinguistics Laboratory, National Research University Higher School of Economics & Russian Language Institute of the Russian Academy of Sciences
* Nikolay Arefyev, Moscow State University & Samsung Research
* Natalia Loukachevitch, Moscow State University

## Data Formats

We use the textual data format for both input and output data. Particularly, it is the TSV file format with the following columns:

* ```context_id```: the number of the context;
* ```word```: the subject for disambiguation;
* ```gold_sense_id```: the word sense identifier in the gold standard;
* ```predict_sense_id```: the word sense identifier predicted by the participating system;
* ```positions```: the word positions in the context;
* ```context```: the text fragment containing the target word.

Please consider the example of the data format we offer: input.tsv, output.tsv. Note that the participating system should fill the empty predict_sense_id field with the sense predicted by the system.

## References to Prior Work

* Bartunov, S., Kondrashkin, D., Osokin, A., and Vetrov, D. P. (2016). [Breaking Sticks and Ambiguities with Adaptive Skip-gram](http://proceedings.mlr.press/v51/bartunov16.html). Journal of Machine Learning Research, 51:130–138.

* Lesk, M. (1986). [Automatic Sense Disambiguation Using Machine Readable Dictionaries: How to Tell a Pine Cone from an Ice Cream Cone](https://doi.org/10.1145/318723.318728). In Proceedings of the 5th Annual International Conference on Systems Documentation, pages 24–26, Toronto, Ontario, Canada. ACM.

* Lopukhin, K. A., Iomdin, B. L., and Lopukhina, A. A. (2017). [Word Sense Induction for Russian: Deep Study and Comparison with Dictionaries](http://www.dialog-21.ru/media/3927/lopukhinkaetal.pdf). In Computational Linguistics and Intellectual Technologies: Papers from the Annual conference “Dialogue”. Volume 1 of 2. Computational Linguistics: Practical Applications, pages 121–134, Moscow. RSUH.

* Manandhar, S., Klapaftis, I., Dligach, D., and Pradhan, S. (2010). [SemEval-2010 Task 14: Word Sense Induction & Disambiguation](https://aclweb.org/anthology/S10-1011). In Proceedings of the 5th International Workshop on Semantic Evaluation, pages 63–68, Uppsala, Sweden. Association for Computational Linguistics.

* Miller, T., Erbs, N., Zorn, H.-P., Zesch, T., and Gurevych, I. (2013). [DKPro WSD: A Generalized UIMA-based Framework for Word Sense Disambiguation](https://aclweb.org/anthology/P13-4007). In Proceedings of the 51st Annual Meeting of the Association for Computational Linguistics: System Demonstrations, pages 37–42, Sofia, Bulgaria. Association for Computational Linguistics.

* Navigli, R. (2012). [A Quick Tour of Word Sense Disambiguation, Induction and Related Approaches](https://doi.org/10.1007/978-3-642-27660-6_10). In SOFSEM 2012: Theory and Practice of Computer Science: 38th Conference on Current Trends in Theory and Practice of Computer Science, pages 115–129, Špindlerův Mlýn, Czech Republic. Springer.

* Panchenko, A., Fide, M., Ruppert, E., Faralli, S., Ustalov, D., Ponzetto, S. P., and Biemann, C. (2017). [Unsupervised, Knowledge-Free, and Interpretable Word Sense Disambiguation](https://aclweb.org/anthology/D/D17/D17-2016.pdf). In Proceedings of the 2017 Conference on Empirical Methods in Natural Language Processing: System Demonstrations, pages 91–96, Copenhagen, Denmark. Association for Computational Linguistics.

* Ustalov, D., Panchenko, A., and Biemann, C. (2017). [Watset: Automatic Induction of Synsets from a Graph of Synonyms](https://doi.org/10.18653/v1/P17-1145). In: Proceedings of the 55th Annual Meeting of the Association for Computational Linguistics (Volume 1: Long Papers), pages 1579–1590, Vancouver, Canada. Association for Computational Lingustics.
