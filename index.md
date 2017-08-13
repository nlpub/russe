---
layout: default
title: Russian Semantic Similarity Evaluation
description: "The RUSSE competition will perform a systematic comparison and evaluation of the baseline and the most recent approaches to semantic similarity."
---

# The First International Workshop on Russian Semantic Similarity Evaluation (RUSSE)

**Keywords:** computational linguistics, natural language processing, lexical semantics, semantic similarity measures, semantic relations, semantic relation extraction, synonyms, hypernyms, co-hyponyms.

**URL:** <http://russe.nlpub.org/>

## Motivation

A similarity measure is a numerical measure of the degree the two objects are alike. Usually, it quantifies similarity with a scalar in range [0; 1] or [0; ∞]. A semantic similarity measure is a specific similarity measure designed to quantify semantic relatedness of lexical units (e.g. nouns and multiword expressions). It yields high values for the pairs of words in a semantic relation (synonyms, hyponyms, associations or co-hyponyms) and zero values for all other pairs.

Semantic similarity measures proved to be useful for text processing applications, including text similarity, query expansion, question answering and word sense disambiguation. Such measures are practical because of the gap between lexical surface of the text and its meaning. Indeed, the same concept is often represented by different terms. Furthermore, these measures can be useful in linguistic and philological studies.

Measures of semantic similarity is an actively developing field of computational linguistics. Many methods were proposed and tested during last 20 years. Recently with the advent of neural network language models yielding state-of-the-art results on the semantic similarity task the interest to this field increased even more. Many authors tried to performed exhaustive comparisons of semantic similarity measures and developed a whole range of benchmarks and evaluations datasets. See [Lee (1999)](#Lee99), [Agirre et al. (2009)](#Agirre09), [Ferret (2010)](#Ferret10), [Panchenko (2013)](#Panchenko13) and [Baroni (2014)](#Baroni14) for an overview of the current approaches for English.

## Contribution

Unfortunately, most of the approaches to semantic similarity were implemented and evaluated only on a handful of European languages, mostly in English. While some Russian researchers sporadically tried to adopt several methods developed for English, these efforts were mostly done in a context of some specific applications without any proper evaluation. To the best of our knowledge, no systematic investigation of semantic similarity measures of Russian language was ever performed.

## Expected Results

The goal of the RUSSE is to fill this gap and to conduct an evaluation campaign of key currently available methods. The RUSSE competition will perform a systematic comparison and evaluation of the baseline and the most recent approaches to semantic similarity in the context of Russian language. This will let us identify specific features of the semantic similarity phenomena in Russian language. The event will be organized in a form of a competition of systems that calculate similarity between words. We will use the rich experience of organization of similar complains in the framework of ROMIP competitions of our collaborators from Moscow State University and Ural Federal University.

Results of the event will be first of all useful to natural language processing researchers and engineers as well as to philologists and linguists. However, the results may be of interest to a much wider group, e.g. to people learning Russian as a foreign language.

## Dissemination of Results

1. The event will be co-located with the [Dialogue 2015](http://www.dialog-21.ru/en/) conference. Results of the evaluation campaign will be published in the proceeding of the Dialogue to reach Russian-speaking community.

2. We also will release a collection of datasets for evaluation of semantic similarity measures in Russian language. This collection will be shipped with an open source tool for automatic evaluation of semantic similarity measures based on these datasets. So each new similarity measure for Russian language can be seamlessly compared to existing ones.

## References
* Agirre, E., Alfonseca, E., Hall, K., Kravalova, J., Paşca, M., and Soroa, A. (2009). A study on similarity and relatedness using distributional and wordnet-based approaches. In Proceedings of NAACL-HLT 2009, pages 19–27.
* Baroni, M., Dinu, G., & Kruszewski, G. (2014). Don't count, predict! A systematic comparison of context-counting vs. context-predicting semantic vectors. In Proceedings of the 52nd Annual Meeting of the Association for Computational Linguistics (Vol. 1).
* Curran, J. R. (2004). From distributional to semantic similarity. PhD thesis. University of Edinburgh, UK.
* Ferret, O. (2010). Testing semantic similarity measures for extracting synonyms from a corpus. In Proceeding of LREC.
* Lee, L. (1999). Measures of distributional similarity. In Proceedings of the 37th annual meeting of the Association for Computational Linguistics on Computational Linguistics, pages 25–32\. Association for Computational Linguistics.
* Panchenko, A. (2013). Similarity measures for semantic relation extraction. PhD thesis. Université catholique de Louvain, 194 pages, Louvain-la-Neuve, Belgium.
* Sahlgren, M. (2006). The Word-Space Model: Using distributional analysis to represent syntagmatic and paradigmatic relations between words in high-dimensional vector spaces. PhD thesis.
* Van de Cruys, T. (2010). Mining for Meaning: The Extraction of Lexicosemantic Knowledge from Text. PhD thesis, University of Groningen, The Netherlands.
