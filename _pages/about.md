---
permalink: /
title: "S. Solomon Darnell's Personal Academic page"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

### Research Philosophy
My research focuses on advancing AI systems that are both powerful and practically deploy-able, exemplified by retrieval-augmented generation (RAG), neural architectures for vision and language, and responsible AI. During my postdoctoral appointments at the University of Miami Health System and the University of Tennessee Health Sciences Center, I developed specialized RAG tools that outperformed base LLMs on clinical diagnostics, deployed an AI expert system on the [GeneNetwork.org](https://genenetwork.org/) platform, and contributed to a glaucoma assessment model (GlaucoRAG) now under peer review. My earlier work at IBM resulted in five patents covering biometric cryptosystems, blockchain-based identity management, and real-time AI applications for resource-constrained environments. I have published in venues ranging from _IEEE Transactions on Information Forensics and Security_ to _Frontiers in Blockchain_ and have collaborated extensively across disciplines—including ophthalmology, genetics, and education—demonstrating my ability to build externally funded, collaborative research programs. Going forward, I aim to establish a research group focused on next-generation information retrieval, multimodal AI, and trustworthy AI systems, with a strong emphasis on securing federal and industry funding to support graduate students and address societal challenges.

### Teaching Philosophy
I am deeply committed to inclusive and innovative engineering education. As Research & Academic Director at @iLabAfrica Strathmore, I led the creation of a Master’s in Data Science and Analytics program and taught graduate courses in fundamentals of computing and advanced machine learning, mentoring students from diverse backgrounds. I believe in blending theoretical rigor with hands-on projects that prepare students for real-world AI development. My approach emphasizes active learning, collaborative problem-solving, and connecting course concepts to current research and industry applications. I have also mentored remote developers and graduate students in software development, and I am eager to advise additional undergraduate and graduate researchers, guide them in securing fellowships, and help them build successful careers in computing. I am particularly interested in developing collaborative courses at the intersection of advanced biology, blockchain AI, data science, and ethics, as well as contributing to departmental efforts to broaden participation in computing.

### Technical Professional Summary
Adaptive Research Engineer with **10+ years of professional development experience** in object-oriented languages (Java, Go, C++, Python) and  **5+ years specializing in blockchain, AI, Web3, and distributed systems** . Proven technical leader with experience directing teams of 4-8+ engineers on production-grade architecture and system design. Hold **5 USPTO patents** including 3 in blockchain technology. Expert in smart contract development, RESTful API design, and cloud-native architectures deployed on AWS, Azure, and GCP. Strong advocate for code quality, comprehensive test coverage, and continuous delivery practices. Track record of shipping production systems that scale while maintaining high reliability and user experience.

* **Researcher-level depth** (Ph.D., 15+ publications, 5 patents)
* **Engineer-level execution** (ships production code, full-stack, multiple languages)
* **Leader-level vision** (directed programs, founded ventures, mentored teams)



[Check out my biology resources!](biology.md)

The code snippit below is from my research on evolutionary algorithms and pedestrian simulation. The complicated simplicity of its expression elicits joy.

```c++
/** 
  * Runs pedsim to get the fitness of the 
  * candidate solution
  */
double Base::getCSFit( string cs )
{
	string configFile, pedsimExecute, fitnessFile ; 

	configFile = getDirectory( "pedsim" ) + "config2.in" ;
	pedsimExecute = getDirectory( "pedsim" ) + "pedsim" ;
	fitnessFile = getDirectory( "pedsim" ) + "fit.in" ;

	// Write the candidate solution to file so 
	// that pedsim can read it
	double fitness ;
	ofstream out( configFile.c_str() ) ; 
	out << cs << endl ;
	out.close() ;

	system( pedsimExecute.c_str() ) ;
	//cout << "Pedsim execute " << pedsimExecute << endl ;

	// Read the candidate solution fitness from the 
	// file written by pedsim
	ifstream in( fitnessFile.c_str() ) ; 
	in >> fitness ;
	if ( fitness == 0 ) { fitness = 100 ; }
	in.close() ;

	//cout << "Fitness from the base.cc file " << fitness << endl ;

	return fitness ;
}
void Population::update()
{
	int index, 
		indexB, 
		value,
	    thisGene ;
	double p = 0.9,    // p is the crossover constant
		   F = 0.8,    // F is the weighting factor
		   temp ;
	VecInt three, tempOffspring ;
	Individual pA, 
			   pB, 
			   pC ;

	index = 0 ;
	while ( index < getSize() )
	{
		three = selectThree() ;
    // Select 3 Parents
		pA = getParent( three.at(0) ) ;
		pB = getParent( three.at(1) ) ;
		pC = getParent( three.at(2) ) ;
		thisGene = rnd.myRandomInt( getSize() ) ;

		indexB = 0 ;
		while( indexB < getRepSize() )
		{
			value = 0 ;
			if ( rnd.myRandom() < p || thisGene == indexB )
			{
				temp = pA.getRepAt(indexB) + F*( pB.getRepAt(indexB) - pC.getRepAt(indexB) ) ;
				tempOffspring.push_back( (int)temp ) ;
			}
			else
			{
				tempOffspring.push_back( pop.at(index).getRepAt(indexB) ) ;
			}
			indexB++ ;
		}
		offspring.init( tempOffspring ) ;
		tempOffspring.clear() ;

		pop[index] = ( offspring.getFitness() < pop.at(index).getFitness() ) 
			           ? offspring : pop.at(index) ;

		index++ ;
	}
}
```
