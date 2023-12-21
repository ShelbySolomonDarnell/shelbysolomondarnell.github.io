<!--
---
layout: default
---

---
title: "SCBI-Research-Journey-2023"
---

---
permalink: /index/
---
-->

# AI, Affect, and Human Centered Computing for Genetics and Genomics

## A computer scientists genetics/genomics research journey and curriculum vitae (CV).

<!--
Text can be **bold**, _italic_, or ~~strikethrough~~.
-->
  [Link to CV](./cv.html).
  [Link to Biology](./biology.html).
  [Link to Rational medicine resources](./rational_medicine.html)

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

------

<!--
###### Header 6
| head1        | head two          | three |
|:-------------|:------------------|:------|
| ok           | good swedish fish | nice  |
| out of stock | good and plenty   | nice  |
| ok           | good `oreos`      | hmm   |
| ok           | good `zoute` drop | yumm  |

### There's a horizontal rule below this.

* * *

### Here is an unordered list:

*   Item foo
*   Item bar
*   Item baz
*   Item zip

### And an ordered list:

1.  Item one
1.  Item two
1.  Item three
1.  Item four

### And a nested list:

- level 1 item
  - level 2 item
  - level 2 item
    - level 3 item
    - level 3 item
- level 1 item
  - level 2 item
  - level 2 item
  - level 2 item
- level 1 item
  - level 2 item
  - level 2 item
- level 1 item

### Small image

![Octocat](https://github.githubassets.com/images/icons/emoji/octocat.png)

### Large image

![Branching](https://guides.github.com/activities/hello-world/branching.png)


### Definition lists can be used with HTML syntax.

<dl>
<dt>Name</dt>
<dd>Godzilla</dd>
<dt>Born</dt>
<dd>1952</dd>
<dt>Birthplace</dt>
<dd>Japan</dd>
<dt>Color</dt>
<dd>Green</dd>
</dl>


```
Long, single-line code blocks should not wrap. They should horizontally scroll if they are too long. This line should be long enough to demonstrate this.
```

```
The final element.
```
---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults
-->




