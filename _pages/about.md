---
permalink: /
title: "S. Solomon Darnell's Personal Academic page"
author_profile: true
redirect_from: 
  - /about/
  - /about.html
---

A lot of stuff about amazing research and new tech capabilities of import to myself.

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
