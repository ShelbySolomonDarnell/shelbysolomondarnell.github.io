# Paper Reviews

## 2020 Evaluating recommender systems for AI-driven biomedical informatics 

### William La Cava

They have built a tool to autmoate ML analysis of bioinformatics datasets, now called Aliro: AI drive data scienAce.

What is this being compared against?
Outher popular AutoML systems, namely AutoSklearn and Hyperopt Sklearn.

What tools are needed to run the system, including analysis?
+ a docker enabled machine
+ a 3GHz processor
+ can be run on a Raspberry PI

*How to input data for the automated process to kick-off.*
To use recommender systems as a data science assistant, we treat
datasets as users, and algorithms as items. The goal of the AI is
therefore as follows: given a dataset, recommend an algorithm con-
figuration to run. Once the algorithm configuration has been run,
the result is now available as a rating of that algorithm configur-
ation on that dataset, as if the user had rated the item. This context
is beneficial for recommender systems, since normally users only oc-
casionally rate the items they are recommended. We denote this
knowledge base of experimental results as D 1⁄4 frad ; rbe; . . .g, where
rad is the test score, i.e. rating, of algorithm configuration a on data-
set d. In our experiments, the test score is the average 10-fold CV
score of the algorithm on the dataset.

Note that, the knowledge base D can be populated not only by
the AI, but by the user through manual experiments (Fig. 1A) and
by the initial knowledge base for PennAI. 

### My Ideation
As this is open source should it be made to run on guix and presented on GeneNetwork.org. It is trained on over 100 open-source examples, GN experiments can be added as examples and new data can be automatically analyzed like old data and then given more suggestions.

This project is using GPT to strengthen its value, you can look at examples of chat [here](https://github.com/EpistasisLab/Aliro/blob/master/chatExamples.md).

If we can use GPT with the data from the correlations it would be phenomenal. Also using the GN platform to run an optimally configured analyis of experiment data, and making it easy to run sub experiments with specific topics in the data, would be amazing.

It's best to get in contact with the authors upon adding to Guix so we can speak of experimentation of integrating it into the GN web UI.

#### Reference
```
@article{pennai_2020,
	title = {Evaluating recommender systems for {AI}-driven biomedical informatics},
	url = {https://doi.org/10.1093/bioinformatics/btaa698},
	journaltitle = {Bioinformatics},
	doi = {10.1093/bioinformatics/btaa698},
	year = {2020},
	author = {La Cava, William and Williams, Heather and Fu, Weixuan and Vitale, Steve and Srivatsan, Durga and Moore, Jason H.},
	eprinttype = {arxiv},
	eprint = {1905.09205},
	keywords = {Computer Science - Machine Learning, Computer Science - Information Retrieval},
}
```

## 2023 Aliro: an automated machine learning tool leveraging LLMs

### Hyunjun Choi

This is the same as the last paper with an update for UI and speaks to LLM utilization visible from it github code.

## 2022 Efficient training of LLMs to fill in the middle

### Mohammad Bavarian

Using previous text in one part of a paragraph to help generate another part of a paragraph. 
Key takeaways:
+ somehow important to LLM training as evidenced by OpenAI saying FIM should be widely used

## 2021 Lo-Ra Low rank adaptation of LLMs

### Edward Hu 

A paper about optimizing the training of LLMs.  This is not exceptionally interesting to me; however, the matrix of values that are decomposed from the possible parameters using a randomized Gaussian function is pretty cool.

I do not see the wild usefulness unless it is already implemented for the major LLMs.


## 2022 Holistic evaluation of LLMs

### Percy Liang

Upon implementing an LLM specifically for GN, we will need to compare and contrast it against a state-of-the-art implementation, namely ChatGPT.  To this end this paper serves as a way to evaluate an LLM quantitatively and qualitatively.
The acryonym for this work is HELM.
Holistic evaluation involves:
+ broad coverage and recognition of incompleteness
+ multi-metric measurement
+ standardization

This papers contributions are:
+ Taxonomy: develop verbage for evaluating LLMs
+ Broad coverage: 16 scenarios each with 7 metrics
+ Evaluation of existing models: 30 models are evaluated, allowing people to see how they rank holistically
+ Empirical findings: support other evaluations and adds new insights about how LLM work
+ Interactive results and codebase: both of which are public


## 2022 GenSLMs: Genome-scale language models reveal SARS-CoV-2 evolutionary dynamics

### Maxim Zvyagin

Use LLms for genomics data that learn the evolutionary landscape virus genomes.
The paper seems to be a mostly an HPC (high performance computing) LLM paper.
The purpose of the LLM is to find emerging viral variants of concern (VOCs) in a timely manner so they can be acted upon.

The works contributions are:
+ development of the largest biological LLM with 2.5B and 25B parameters, trained across 110M prokaryotic gene sequences, with openly available weights
+ designed and validated novel heirarchical transformer-based model using GPT on individual gene sequences and stable diffusion to capture context and longer-range interactions in genome-scale datasets
+ showcasing the training of foundation models on GPU systems and a supercomputers at NVIDIA, and on AI-accelerator hardware, while presenting scaling benchmarks that show how intensive training GenSLMs can be

GenSLMs are part of a system that _learn to model whole-genome evolution patterns using LLMs based on observed data_. Could this research be useful to the Tree-of-Life work?

## 2023 Retrieval-Augmented Generation for LLMs: A Survey
 
### Yunfan Gao

Do you like my RaG?
Naive, Advanced and Modular

