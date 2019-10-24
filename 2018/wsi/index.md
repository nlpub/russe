---
layout: 2018-wsi
title: Russian Word Sense Induction Evaluation
description: "The RUSSE competition will perform a systematic comparison and evaluation of the baseline and the most recent approaches to word sense induction and disambiguation."
---

# A Shared Task on Word Sense Induction and Disambiguation for the Russian Language

We invite you to participate in the [ACL SIGSLAV](http://sigslav.cs.helsinki.fi) sponsored shared task on Word Sense Induction and Disambiguation for the Russian Language. **TLDR of the task**: You are given a word, e.g. ```bank``` and a bunch of text fragments (aka "contexts") where this word occurs, e.g. ```bank is a financial institution that accepts deposits``` and ```river bank is a slope beside a body of water```. You need to cluster these contexts in the (unknown in advance) number of clusters which correspond to various senses of the word. In this example, you want to have two groups with the contexts of the ```company``` and the ```area``` senses of the word ```bank```. 

The training dataset and detailed instructions for participants are available at our [GitHub repository](https://nlpub.github.io/russe-wsi-kit/). If you are interested in participation, please [register using this form](https://goo.gl/forms/fnTNOwk4PrsZySX82).

## Motivation

Word Sense Induction (WSI) is the process of automatic identification of the word senses. While evaluation of various sense induction and disambiguation approaches was performed in the past for the Western European languages, e.g., English, French, and German, no systematic evaluation of WSI for [Slavic languages](http://sigslav.cs.helsinki.fi) are available at the moment. This shared task makes a first step towards bridging this gap by setting up a shared task on one Slavic language. The goal of this task is to compare sense induction and disambiguation systems for the Russian language. Many Slavic languages still do not have broad coverage lexical resources available in English, such as WordNet, which provide a comprehensive inventory of senses. Therefore, word sense induction methods investigated in this shared task can be of great value to enable semantic processing of Slavic languages.

## Task Description

The shared task is structurally similar to prior WSI tasks for the English language, such as [SemEval 2007 WSI](http://semeval2.fbk.eu/semeval2.php?location=tasks&taskid=2) and [SemEval 2010 WSI&D](https://www.cs.york.ac.uk/semeval2010_WSI/) tasks.
We use the “lexical sample” settings. Namely, we provide the participants with the set of contexts representing examples of ambiguous words, like the word “bank” in “In geography, the word **bank** generally refers to the land alongside a body of water.” For each context, a participant needs to disambiguate one target word. Note that, we do not provide any sense inventory: the participant can assign sense identifiers of their choice to a context, e.g., “bank#1” or “bank (area)”.

### Tracks

The task will feature two tracks:

* In the “knowledge-free” track participants need to induce a sense inventory from a text corpus of their own. The participants need to use it to assign each context with a sense identifier according to this induced inventory.
* In the “knowledge-rich” track participants are free to use a sense inventory from an existing dictionary to disambiguate the target words (yet the use of the gold standard inventory is prohibited).

The advantage of our setting is that virtually any existing word sense disambiguation approach can be used within the framework of our shared task starting from unsupervised sense embeddings to the graph-based methods that rely on lexical knowledge bases, such as WordNet.

### Datasets

We provide three training datasets, which can be used for development of the models of various sense inventories and corpora.  Once the test datasets will be released, the participants will need to use the developed models to disambiguate the test sentences submitting their final results. Training and testing datasets use the same corpora and annotations approaches, but the target words will be different for training and testing datasets.

### Quality Measure

Similarly to SemEval 2010 Task 14 WSI&D, we use a gold standard, where each ambiguous target word is provided with a set of instances, i.e., the context containing the target word. Each instance is manually annotated with the single sense identifier according to a predefined sense inventory. Each participating system assigns the sense labels for these ambiguous word occurrences, which can be viewed as a clustering of instances, according to sense labels. To evaluate a system, the system’s labeling of contexts is compared to the gold standard labeling. We use the Adjusted Rand Index (ARI) as the quantitative measure of the clustering.


### Baseline Systems

We provide a state-of-the-art baseline that demonstrates the task and the data formats. For the knowledge-free track, we particularly encourage participation of various systems based on unsupervised word sense embeddings, e.g. AdaGram. For the knowledge-rich track, word sense embeddings based on inventories based of lexical resources, e.g., AutoExtend, can be obtained on the basis of lexical resources such as [RuThes](http://www.labinform.ru/pub/ruthes/index.htm) and [RuWordNet](http://ruwordnet.ru/ru/).

## Important Dates

* **First Call for Participation**: October 15, 2017.
* **Release of the Training Data**: November 1, 2017.
* **Release of the Test Data**: December 15, 2018.
* **Submission of the Results**: ~~January 15~~ ~~February 1~~ February 4, 2018.
* **Results of the Shared Task**: ~~February 1~~ February 15, 2018.

## Participation in the Task: Instructions

**Train datasets are already online**. You can start working on the development of our models. The detailed instructions are available at our [Github repository](https://nlpub.github.io/russe-wsi-kit/). Please follow the instruction in this repository to participate in the task and write us a question if something is not clear.

### Flow of the Task and the Deadlines

The important dates are listed above. We publically share the training datasets on the **1st of November 2017**. The participants will have six weeks until the December 15 to develop their models using these training data.

On the **15th of December 2017** we will release test data and participants will be able to make real submissions during seven weeks until the **February 4, 2018**. Note that the training dataset and test dataset contain various words: you cannot simply learn a disambiguation model from the training dataset and apply it to the test data as the target words will be different. Instead, the participants will need to induce word senses of the words in the test dataset.

## Dissemination of the Results

We invite participants can submit a paper about their system to the [24th International Conference on Computational Linguistics and Intellectual Technologies (Dialogue'2018)](http://www.dialog-21.ru/en/): the proceedings are indexed by Scopus. The results of the shared task have been [discussed]({{ site.baseurl }}{% link _posts/2018-06-02-dialogue.md %}) at this conference. Training and the test datasets will be published online to foster future research and developments.

## Citation

* Panchenko,&nbsp;A., Lopukhina,&nbsp;A., Ustalov,&nbsp;D., Lopukhin,&nbsp;K., Arefyev,&nbsp;N., Leontyev,&nbsp;A., Loukachevitch,&nbsp;N.: [RUSSE&rsquo;2018: A Shared Task on Word Sense Induction for the Russian Language](http://www.dialog-21.ru/media/4539/panchenkoaplusetal.pdf). In: Computational Linguistics and Intellectual Technologies: Papers from the Annual International Conference &ldquo;Dialogue&rdquo;. pp.&nbsp;547&ndash;564. RSUH, Moscow, Russia (2018)

```latex
{% raw %}@inproceedings{Panchenko:18:dialogue,
  author    = {Panchenko, Alexander and Lopukhina, Anastasia and Ustalov, Dmitry and Lopukhin, Konstantin and Arefyev, Nikolay and Leontyev, Alexey and Loukachevitch, Natalia},
  title     = {{RUSSE'2018: A Shared Task on Word Sense Induction for the Russian Language}},
  booktitle = {Computational Linguistics and Intellectual Technologies: Papers from the Annual International Conference ``Dialogue''},
  year      = {2018},
  pages     = {547--564},
  url       = {http://www.dialog-21.ru/media/4539/panchenkoaplusetal.pdf},
  address   = {Moscow, Russia},
  publisher = {RSUH},
  issn      = {2221-7932},
  language  = {english},
}{% endraw %}
```

## Acknowledgements

This research was supported by Deutsche Forschungsgemeinschaft (DFG) under the project “Joining Ontologies and Semantics Induced from Text” (JOIN-T) and by the RFBR under the project no.&nbsp;16-37-00354 мол&#95;а. The work of Konstantin Lopukhin and Anastasiya Lopukhina was supported by a grant of the Russian Science Foundation, Project 16-18-02054. We are grateful to the authors of the Active Dictionary of Russian who kindly allowed us to use the dictionary in this shared task. We are grateful to Ted Pedersen for a helpful discussion about the evaluation settings in this shared task.

## References to Prior Work

* Bartunov, S., Kondrashkin, D., Osokin, A., and Vetrov, D. P. (2016). [Breaking Sticks and Ambiguities with Adaptive Skip-gram](http://proceedings.mlr.press/v51/bartunov16.html). Journal of Machine Learning Research, 51:130–138.

* Lesk, M. (1986). [Automatic Sense Disambiguation Using Machine Readable Dictionaries: How to Tell a Pine Cone from an Ice Cream Cone](https://doi.org/10.1145/318723.318728). In Proceedings of the 5th Annual International Conference on Systems Documentation, pages 24–26, Toronto, Ontario, Canada. ACM.

* Lopukhin, K. A., Iomdin, B. L., and Lopukhina, A. A. (2017). [Word Sense Induction for Russian: Deep Study and Comparison with Dictionaries](http://www.dialog-21.ru/media/3927/lopukhinkaetal.pdf). In Computational Linguistics and Intellectual Technologies: Papers from the Annual conference “Dialogue”. Volume 1 of 2. Computational Linguistics: Practical Applications, pages 121–134, Moscow. RSUH.

* Manandhar, S., Klapaftis, I., Dligach, D., and Pradhan, S. (2010). [SemEval-2010 Task 14: Word Sense Induction & Disambiguation](https://aclweb.org/anthology/S10-1011). In Proceedings of the 5th International Workshop on Semantic Evaluation, pages 63–68, Uppsala, Sweden. Association for Computational Linguistics.

* Miller, T., Erbs, N., Zorn, H.-P., Zesch, T., and Gurevych, I. (2013). [DKPro WSD: A Generalized UIMA-based Framework for Word Sense Disambiguation](https://aclweb.org/anthology/P13-4007). In Proceedings of the 51st Annual Meeting of the Association for Computational Linguistics: System Demonstrations, pages 37–42, Sofia, Bulgaria. Association for Computational Linguistics.

* Navigli, R. (2012). [A Quick Tour of Word Sense Disambiguation, Induction and Related Approaches](https://doi.org/10.1007/978-3-642-27660-6_10). In SOFSEM 2012: Theory and Practice of Computer Science: 38th Conference on Current Trends in Theory and Practice of Computer Science, pages 115–129, Špindlerův Mlýn, Czech Republic. Springer.

* Panchenko, A., Fide, M., Ruppert, E., Faralli, S., Ustalov, D., Ponzetto, S. P., and Biemann, C. (2017). [Unsupervised, Knowledge-Free, and Interpretable Word Sense Disambiguation](https://aclweb.org/anthology/D/D17/D17-2016.pdf). In Proceedings of the 2017 Conference on Empirical Methods in Natural Language Processing: System Demonstrations, pages 91–96, Copenhagen, Denmark. Association for Computational Linguistics.

* Pelevina M., Arefyev N., Biemann C., Panchenko A. (2016): [Making Sense of Word Embeddings](http://anthology.aclweb.org/W16-1620). In Proceedings of the 1st Workshop on Representation Learning for NLP co-located with the ACL conference. Berlin, Germany. Association for Computational Linguistics

* Ustalov, D., Panchenko, A., and Biemann, C. (2017). [Watset: Automatic Induction of Synsets from a Graph of Synonyms](https://doi.org/10.18653/v1/P17-1145). In: Proceedings of the 55th Annual Meeting of the Association for Computational Linguistics (Volume 1: Long Papers), pages 1579–1590, Vancouver, Canada. Association for Computational Linguistics.
