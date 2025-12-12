
# External validity: sampling {#Sampling}




<!-- Introductions; easier to separate by format -->


::: {.objectivesBox .objectives data-latex="{iconmonstr-target-4-240.png}"}
You have learnt to ask an RQ, and identify a study design.
**In this chapter**, you will learn to:

* distinguish and explain precision and accuracy.
* distinguish and explain random and non-random sampling.
* explain why random samples are preferred over non-random samples.
* identify, describe and use different sampling methods.
* identify ways to obtain samples likely to be representative.
:::


<img src="06-ResearchDesign-Sampling_files/figure-html/unnamed-chunk-12-1.png" width="65%" height="33%" style="display: block; margin: auto;" />

<!-- Define colours as appropriate -->





## Introduction {#IntroExternalValidity}
\index{External validity}\index{Research design!external validity|(}

In a research study, the researchers learn about the *population* by studying just one of the countless possible *samples*.
Ideally the sample that is studied is representative of the population, so the results from the sample generalise to the population.
This is called *external validity*.\index{External validity}
*External validity* does *not* mean that the results apply more widely than the intended population.


<!-- ::: {.definition #ExternalValidity name="External validity"} -->
<!-- *External validity* refers to the ability to generalise the results to the rest of the population, beyond just those in the sample studied. -->
<!-- ::: -->



<div style="float:right; width: 75px; padding:10px">
<img src="Pics/iconmonstr-share-11-240.png" width="50px"/>
</div>



::: {.example #ExternalValidPop name="External validity"}
Suppose the *population* in a study is *Californian home-owners*.
The sample comprises the Californian home-owners studied by the researchers.
If the study is externally valid, the sample is representative of all Californian home-owners.

The results will not necessarily apply to home-owners outside of Californian, or all Californian residents.
However, this *is irrelevant for external validity*.
External validity concerns how the *sample* represents the intended population in the RQ, which is *Californian home-owners*.
:::



## The idea of sampling {#IdeaOfSampling}
\index{Sampling}

Studying every member of a population is very rare due to cost, time, ethics, logistics and/or practicality.
Instead, a subset of the population (a *sample*) is studied, and *many* different samples are possible.\index{Sample}


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
The challenge of research is learning about a population from studying just one of the countless possible samples.
:::


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/pexels-gerd-altmann-23180.jpg" width="200px"/>
</div>


::: {.example #SamplesAspirin name="Samples"}
A study of the effectiveness of aspirin in treating headaches cannot possibly study every single human who may one day take aspirin.
Not only would this be prohibitively expensive, time consuming, and impractical, but the study would not even study those not yet born who might use aspirin.

Using the whole target population is *impossible*, and a sample must be used.
:::


Only studying one sample out of countless possible samples raises questions:

* *which* individuals should be included in the sample to be studied?
* *how many* individuals should be included in the sample to be studied?

The first issue is studied in this chapter.
The second issue is studied later (Chap.\ \@ref(EstimatingSampleSize)), after learning about the implications of studying samples rather than populations.

Many samples are possible, and *every sample is likely to be different*.
Hence, the results of studying a sample are likely to vary, depending on which individuals are in the studied sample.
The differences between the samples, and differences in the results from each sample, are called *sampling variation*.\index{Sampling variation}
That is, each sample has different individuals, produces different data, and may even suggest different answers to the RQ.


:::{.example name="Number of samples"}
In a 'population' of just\ $100$, the number of possible samples of size\ $25$ is more than twice the number of people currently living on earth.
:::


This is the challenge of research: *making decisions about populations, using just one of the many possible samples*.
A lot can be learnt about the population if selecting a sample is approached correctly.\index{Decision making}


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Almost always, researchers study *samples*,\index{Sample} not *populations*.\index{Population}
Many samples are possible, and *every sample is likely to be different*, and the *results from every sample are likely to be different*.
This is called *sampling variation*.\index{Sampling variation}

As a result, *conclusions from a sample are never certainties*, though special techniques allow us to still learn about the *population* from a *sample*.
:::


:::{.example #SamplingVarInCards name="Sampling variation"}
The animation below shows how samples vary. We know that $50$% of cards in a fair, shuffled pack (a *population*) are red, but each hand (every *sample*) of ten cards can produce a different percentage of red cards (and not always $50$%).
This is a simple example of *sampling variation*.\index{Sampling variation}
:::


<img src="06-ResearchDesign-Sampling_files/figure-html/DealCards-.gif" width="60%" />

\clearpage

## Precision and accuracy {#PrecisionAccuracy}

Two questions concerning sampling in Sect.\ \@ref(IdeaOfSampling) were: *which* individuals should be in the sample, and *how many* individuals should be in the sample.
The first question addresses the *accuracy*\index{Accuracy} of using a sample value to estimate a population value.
The second addresses the *precision*\index{Precision} with which a population value is estimated using a sample.
An estimate that is not accurate is called *biased* (Def.\ \@ref(def:Bias)).


::: {.definition name="Accuracy"}
\index{Accuracy}
*Accuracy* refers to how close a *sample* estimate is likely to be to the *population* value, on average.
:::


::: {.definition name="Precision"}
\index{Precision}
*Precision* refers to how similar the sample estimates from different samples are likely to be to each other (that is, how much variation is likely in the sample estimates).
:::


Using this language:

* the sampling *method* (i.e., *how* the sample is selected) impacts the *accuracy* of the sample estimate (i.e., *external validity*).
* the *size* of the sample impacts the *precision* of the sample estimate (i.e., *internal* validity).

Large samples are more likely to produce *precise* estimates, but they may or may not be accurate estimates.
Similarly, random samples are likely to produce *accurate* estimates, but they may or may not be *precise*.
As an analogy, consider an archer aiming at a target.
The shots can be accurate, or precise, or (ideally) both (Fig.\ \@ref(fig:PrecisionAccuracy)).


<div class="figure" style="text-align: center">
<img src="06-ResearchDesign-Sampling_files/figure-html/PrecisionAccuracy-1.png" alt="Precision and accuracy: each dot indicates where a shot at the target lands, and is like a sample estimate of the population value (shown by the central $\times$)." width="55%" />
<p class="caption">(\#fig:PrecisionAccuracy)Precision and accuracy: each dot indicates where a shot at the target lands, and is like a sample estimate of the population value (shown by the central $\times$).</p>
</div>


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/pexels-iqwan-alif-1206101.jpg" width="200px"/>
</div>


::: {.example #PrecisionAccuracyQld name="Precision and accuracy"}
To estimate the average age of *all Canadians*, $9\,000$ Canadian school children could be sampled.

The answer obtained from the sample will be *inaccurate* because the sample is not representative of *all* Canadians.
Since the sample is large, the answer will give a *precise* answer but to a *different* question: 'What is the average age of Canadian school children?'
:::


<iframe src="https://learningapps.org/watch?v=prpojnfzj22" style="border:0px;width:100%;height:500px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>



## Types of sampling
\index{Sampling}

One key to obtaining accurate estimates about the population from the sample is to ensure that the sample faithfully represents the population.
So, *how* is such a sample selected from the population?

The individuals selected for the sample can be chosen using either *random sampling* or *non-random sampling*.
The word *random* here has a specific meaning that is different from how it is often used in everyday use.
It does *not* mean 'haphazard', 'erratically' or 'picking individuals as aimlessly as I can'.


::: {.definition #Random name="Random"}
*Random* means determined completely by impersonal chance.
:::


### Random sampling {#RandomSamples}
\index{Sampling!random}

In a *random sample*, both of these statements are true:

1. each individual in the population can be selected. 
2. each individual is chosen on the basis of *impersonal* chance (such as using a random number generator, or a table of random numbers).

Some examples of random sampling methods appear in Table\ \@ref(tab:TypesOfRandomSampling), and are explained further in Sect.\ \@ref(RandomSamplingMethods).


::: {.definition #RandomSampling name="Random sample"}
In a *random* sample, each individual in the population can be selected; and each individual is chosen on the basis of *impersonal* chance.
:::


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
The results obtained from a random sample are likely to generalise to the population from which the sample is drawn; that is, *random samples* are likely to produce *externally valid* and *accurate* studies.
:::


<table>
<caption>(\#tab:TypesOfRandomSampling)Comparing five types of random sampling.</caption>
 <thead>
  <tr>
   <th style="text-align:center;">  </th>
   <th style="text-align:right;"> Type </th>
   <th style="text-align:left;"> Stage 1 </th>
   <th style="text-align:left;"> Stage 2 </th>
   <th style="text-align:right;"> Ref. </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> ![](./Pics/iconmonstr-weather-117-240.png){#id .class height=90px width=90px} </td>
   <td style="text-align:right;"> Simple random </td>
   <td style="text-align:left;"> Individuals chosen at *random* </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:right;"> Sect. \@ref(SRS) </td>
  </tr>
  <tr>
   <td style="text-align:center;"> ![](./Pics/iconmonstr-chart-22-240.png){#id .class height=90px width=90px} </td>
   <td style="text-align:right;"> Systematic </td>
   <td style="text-align:left;"> Start at a *random* location </td>
   <td style="text-align:left;"> Take every $n$th element thereafter </td>
   <td style="text-align:right;"> Sect. \@ref(SystematicSampling) </td>
  </tr>
  <tr>
   <td style="text-align:center;"> ![](./Pics/iconmonstr-layer-17-240.png){#id .class height=90px width=90px} </td>
   <td style="text-align:right;"> Stratified </td>
   <td style="text-align:left;"> Split into a few large groups ('strata') of similar individuals </td>
   <td style="text-align:left;"> Select a *simple random sample* from *every* stratum </td>
   <td style="text-align:right;"> Sect. \@ref(StratifiedSampling) </td>
  </tr>
  <tr>
   <td style="text-align:center;"> ![](./Pics/iconmonstr-view-5-240.png){#id .class height=90px width=90px} </td>
   <td style="text-align:right;"> Cluster </td>
   <td style="text-align:left;"> Split into many small groups ('clusters'); select *simple random sample* of clusters </td>
   <td style="text-align:left;"> Select *all* individuals in the chosen clusters </td>
   <td style="text-align:right;"> Sect. \@ref(ClusterSampling) </td>
  </tr>
  <tr>
   <td style="text-align:center;"> ![](./Pics/iconmonstr-view-4-240.png){#id .class height=90px width=90px} </td>
   <td style="text-align:right;"> Multi-stage </td>
   <td style="text-align:left;"> Select *simple random sample* from the larger collection of units </td>
   <td style="text-align:left;"> Select *simple random sample* from those chosen in Stage 1; etc. </td>
   <td style="text-align:right;"> Sect. \@ref(MultistageSampling) </td>
  </tr>
</tbody>
</table>


A pot of soup can be tested randomly or non-randomly.
If the soup is stirred (randomised), the small spoonful of soup can be tasted to obtain an overall impression.
However, an *overall* impression is not obtained from a non-random sample (i.e., a non-stirred pot of soup).


### Non-random sampling {#NonRandomSamples}
\index{Sampling!non-random}

A *non-random* sample is selected using personal input from the researchers.
Examples include:

* *judgement samples*.\index{Sampling!non-random!judgement}
  Individuals are selected based on the researchers' judgement (possibly unconsciously), perhaps because the individuals are (or may appear) agreeable, supportive, easily accessible, or helpful.
  For example, researchers may select rats that are less aggressive, or plants that are accessible, or people that look approachable.
* *convenience samples*.\index{Sampling!non-random!convenience}
  Individuals are selected because they are convenient for the researcher.
  For example, researchers may study beaches that are nearby, or use their friends for a study.
* *voluntary response (self-selecting) samples*.\index{Sampling!non-random!voluntary}
  Individuals participate if they wish to.
  For example, researchers may ask people to volunteer to take a survey.
* *cherry-picking*.\index{Sampling!non-random!cherry-picking}
  Individuals are specifically chosen to reach the conclusion that the researchers want.

In non-random sampling, the individuals *in* the study are probably different from those *not in* the study.
That is, *non-random samples are not likely to be externally valid*.\index{External validity}

Researchers may use a non-random sample intentionally (e.g., to deceive) which is unethical, or unintentionally (e.g., accidentally, or due to practicality (such as meeting budgets)).
Ethically, a random (or somewhat representative sample; Sect.\ \@ref(Representative-samples)) should be used when possible.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Using a non-random sample means that the results probably do not generalise to the intended population: they probably do not produce externally valid or accurate studies.
:::


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/pexels-andrea-piacquadio-3807629.jpg" width="200px"/>
</div>


<!-- ::: {.example #COVIDsampling name="Different ways to sample"} -->
<!-- During the COVID-19 pandemic in 2020, [a Facebook poll](https://www.abc.net.au/news/2020-07-03/coronacheck-anti-vaxxers-flood-online-poll-pete-evans/12415860) asked the question: "Do you think a Coronavirus vaccine should be compulsory?" -->

<!-- The result was reported as '79 per cent of Australians oppose a compulsory vaccination', from a sample of over 53,000 responses. -->
<!-- This sample was a *voluntary response sample*, not a random sample, so the results may not be *accurate*. -->
<!-- For example, the poll could have been completed multiple times by individuals, and by non-Australians as well as Australians. -->

<!-- A different study [@smith2020majority] asked Australians: -->

<!-- > The Federal Government's 'No Jab, No Pay' policy withholds certain benefits and payments from families who don't fully vaccinate their children.  -->
<!-- > Do you agree with this policy? -->

<!-- In the sample of 1809 respondents, 83.7% either agreed or strongly agreed with this statement. -->
<!-- While this sample was not a *truly* random sample of Australians, the sample intentionally included individuals representing a wide range of demographics (e.g., age, gender, location, income, and so on (@smith2020majority, p. 194). -->
<!-- Furthermore, 'respondents were paid small token sum for their participation in the study' to encourage *all* selected respondents to provide an answer (and avoid voluntary responses). -->
<!-- ::: -->


## Methods of random sampling {#RandomSamplingMethods}
\index{Sampling!random}


### Simple random sampling {#SRS}
\index{Sampling!random!simple random}


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Pics/iconmonstr-weather-117-240.png" width="50px"/>
</div>



The most straightforward idea for obtaining a random sample is a *simple random sample*.


::: {.definition #SamplingSRS name="Simple random sample"}
In a *simple random sample*, *every* possible sample of a given size has the *same* chance of being selected.
:::


Selecting a simple random sample requires a list of all members of the population, called the *sampling frame*, from which to select a sample.
Obtaining the sampling frame is often difficult or impossible, and so finding a simple random sample is also difficult.
For example, finding a simple random sample of wombats would require having a list and location of all wombats.
This is absurd; other random sampling methods, like 
[special ecological sampling methods](http://www.countrysideinfo.co.uk/what_method.htm)  (e.g., @manly2014introduction),
would be used instead.



::: {.definition #SamplingFrame name="Sampling frame"}
The *sampling frame* is a list of *all* the individuals in the population.\index{Sampling frame}
:::


Selecting a simple random sample from the *sampling frame* can be performed using *random numbers* (e.g., using random number tables, or 
websites like https://www.random.org).  A smaller version of this webpage, which generates one number at a time, is below; just press *Generate*. The numbers generated by this widget come from the true random number generator at [RANDOM.ORG](https://www.random.org). (The webpage generates as many numbers as you want all at the same time.)
Other random sampling methods avoid the need for a sampling frame, but still use randomness rather than human choice.


<div style="text-align:center;">
<iframe src="https://www.random.org/widgets/integers/iframe.php?title=True+Random+Number+Generator&amp;buttontxt=Generate&amp;width=160&amp;height=200&amp;border=on&amp;bgcolor=%23FFFFFF&amp;txtcolor=%23777777&amp;altbgcolor=%23CCCCFF&amp;alttxtcolor=%23000000&amp;defaultmin=&amp;defaultmax=&amp;fixed=off" frameborder="0" width="160" height="200" scrolling="no" longdesc="https://www.random.org/integers/">
</iframe>
</div>


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
This book assumes simple random samples, unless otherwise noted.
:::


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/pexels-startup-stock-photos-7357.jpg" width="200px"/>
</div>


::: {.example #TypingSRS name="Simple random sampling"}
Consider the letter-typing RQ again (Example\ \@ref(exm:Typing)):

> For students in a large university course, is the average typing speed (in words per minute) the same for those aged under\ $25$ ('younger') and $25$\ or over ('older')?

Suppose budget and time constraints mean approximately\ $40$ students (out of\ $441$) can be selected for the study.
The *sampling frame* is the list of all students enrolled in the course.
Obtaining the sampling frame is feasible here; instructors have access to this information for grading.

A simple random sample could be found using the course enrolment list, by first placing all $441$\ student names into rows of a spreadsheet\index{Computers and software!spreadsheets} (ordered by name, student\ ID, or any way).
Then, using random numbers, $40$\ rows are selected at random (without repeating numbers) between\ $1$ and\ $441$ inclusive.
For instance, when I used 
[random.org](https://www.random.org/integers/?num=40&min=1&max=441&col=5&base=10&format=html&rnd=new),
the first few random numbers were: `410`,	`215`,	`384`,	`158`,	`296`.

Every student chosen using this method becomes part of the study.
If a student could not be contacted or did not respond, more students could be chosen at random to ensure $40$ students participated
(see animation below).
By chance, the sample comprises\ $15$ younger students and $25$\ older students.
:::


<img src="06-ResearchDesign-Sampling_files/figure-html/unnamed-chunk-4-.gif" width="672" />





### Systematic sampling {#SystematicSampling}
\index{Sampling!random!systematic}

<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Pics/iconmonstr-chart-22-240.png" width="50px"/>
</div>


In *systematic sampling*, the first case is *randomly* selected; then, more individuals are selected at regular intervals thereafter.
In general, we say that every\ $n$th individual is selected after the initial random selection.


::: {.example #SystematicCourse name="Systematic sampling"}
For the study in Example\ \@ref(exm:Typing), a sample of $40$\ students in a course of $441$ is needed.
To find a systematic random sample, select a random number between\ $1$ and\ $441/40$ (approximately\ $11$) as a starting point; suppose the random number selected is\ $9$ (as in 
the animation below).

The first student selected is the $9$th\ person in the student list (which may be ordered alphabetically, by student\ ID, or other means).
Thereafter, every\ $441/40$th person, or\ $11$th person, in the list is selected: people in rows $9$,\ $20$,\ $31$, $42$,\ and so on
(see animation below).
By chance, the sample comprises\ $17$ younger students and $23$\ older students.
:::


<img src="06-ResearchDesign-Sampling_files/figure-html/unnamed-chunk-5-.gif" width="672" />


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Care needs to be taken when using systematic samples to ensure a pattern is not hidden.
Consider taking a systematic sample of every $10$th residence on a long street.
In many countries, odd numbers are usually on one side of the street, and even numbers usually on the other side.
Selecting every\ $10$th house (for example) would include houses all on the same side of the street, and hence with similar exposure to the sun, traffic, etc.
:::


:::{.example #SystematicQuebec name="Systematic sampling"}
@alary1991risk studied households in Quebec to determine if their hot water systems kept their water sufficiently hot to avoid Legionellae bacteria.
They used a systematic random sample to select households to study (p.\ $2\,361$):

> The first house was selected by using a random-number table. 
> Thereafter, each fifth house that satisfied the [...] criteria was eligible for the study.
:::


### Stratified sampling  {#StratifiedSampling}
\index{Sampling!random!stratified}

<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Pics/iconmonstr-layer-17-240.png" width="50px"/>
</div>


In *stratified sampling*, the population is split into a *small* number of *large* (usually similar) groups called *strata*, then cases are selected using a *simple random sample* from *each* stratum.
Every individual in the population must be in one, and only one, stratum.


::: {.example #StratifiedUni name="Stratified sampling"}
For the typing study in Example\ \@ref(exm:Typing), $20$\ younger and $20$\ older students could be selected to obtain a sample of size\ $40$.
The sample is stratified by *age group* of the person
(see animation below).

Since $66.7$% of the students are younger in the population, the sample could be selected so that two-thirds of the sample of size\ $40$ (i.e., $27$\ students) were younger students
(see animation below).
This is a *proportional* stratified sample.\index{Sampling!proportional}
:::








<img src="06-ResearchDesign-Sampling_files/figure-html/unnamed-chunk-6-.gif" width="672" />

Similarly, the second animation below shows how a stratified random sample of size\ $40$ might be selected, by randomly selecting $27$\ younger and $13$\ older students.




<img src="06-ResearchDesign-Sampling_files/figure-html/unnamed-chunk-7-.gif" width="672" />


### Cluster sampling {#ClusterSampling}
\index{Sampling!random!cluster}

<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Pics/iconmonstr-view-5-240.png" width="50px"/>
</div>


In *cluster sampling*, the population is split into a *large* number of *small* groups called *clusters*.
Then, a *simple random sample* of clusters is selected, and *every* member of the chosen clusters become part of the sample.
Every individual in the population must be in one, and only one, cluster.


::: {.example name="Cluster sampling"}
For the study in Example\ \@ref(exm:Typing), a simple random sample of (say) three of the many small-group classes for the course could be selected, and *every* student enrolled in those selected small groups constitute the sample
(see animation below).
By chance, the chosen classes produce a sample size of $n = 47$ ($31$\ younger; $16$\ older).
:::



<img src="06-ResearchDesign-Sampling_files/figure-html/unnamed-chunk-8-.gif" width="672" />






### Multi-stage sampling {#MultistageSampling}
\index{Sampling!random!multi-stage}

<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Pics/iconmonstr-view-4-240.png" width="50px"/>
</div>


In *multi-stage sampling*, larger collections of individuals are selected using a *simple random sample*, then smaller collections of individuals *within* those large collections are selected using a *simple random sample*.
The simple random sampling continues for as many levels as necessary, until individuals are being selected (at random in each step).


::: {.example name="Multi-stage sampling"}
For the study in Example\ \@ref(exm:Typing), a *simple random sample* of ten of the many small-group classes could be selected (Stage\ 1), and then four students are *randomly* selected from each of these $10$ selected small groups (Stage\ 2)
(see animation below).
The sample size is $10\times 4 = 40$, comprising (by chance) $24$\ younger students and $16$\ older students.
:::


<img src="06-ResearchDesign-Sampling_files/figure-html/unnamed-chunk-9-.gif" width="672" />


::: {.example name="Multi-stage sampling"}
Multi-stage sampling is often used by national statistical agencies.
For example, to obtain a multi-stage random sample from a country:

* *Stage\ 1*: randomly select some cities in the nation.
* *Stage\ 2*: randomly select some suburbs in these chosen cities.
* *Stage\ 3*: randomly select some streets in these chosen suburbs.
* *Stage\ 4*: randomly select some houses in these chosen streets.

This is cheaper than simple random sampling, as data collectors can be deployed in a small number of cities (only those chosen in Stage\ 1).
:::


### Comparing the samples

The different random sampling methods produce different samples, with different proportions of younger and older students by chance (Table\ \@ref(tab:samplesSummaryTable)).
Of course, repeating the random sampling processes would produce different samples each time.
In all cases, only *one*  of the countless possible samples is studied.


<table>
<caption>(\#tab:samplesSummaryTable)A summary of the various random samples selected using different random sampling methods. In the population, $66.7$% of students are younger students.</caption>
 <thead>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; font-weight: bold; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Number of students selected</div></th>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
</tr>
  <tr>
   <th style="text-align:left;font-weight: bold;">   </th>
   <th style="text-align:center;font-weight: bold;"> Younger </th>
   <th style="text-align:center;font-weight: bold;"> Older </th>
   <th style="text-align:center;font-weight: bold;"> Total </th>
   <th style="text-align:center;font-weight: bold;"> Percentage younger </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Simple random sample </td>
   <td style="text-align:center;"> $26$ </td>
   <td style="text-align:center;"> $14$ </td>
   <td style="text-align:center;"> $40$ </td>
   <td style="text-align:center;"> $65.0$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Systematic sample </td>
   <td style="text-align:center;"> $31$ </td>
   <td style="text-align:center;"> $\phantom{0}9$ </td>
   <td style="text-align:center;"> $40$ </td>
   <td style="text-align:center;"> $77.5$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Stratified sample: equal </td>
   <td style="text-align:center;"> $20$ </td>
   <td style="text-align:center;"> $20$ </td>
   <td style="text-align:center;"> $40$ </td>
   <td style="text-align:center;"> $50.0$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Stratified sample: proportional </td>
   <td style="text-align:center;"> $27$ </td>
   <td style="text-align:center;"> $13$ </td>
   <td style="text-align:center;"> $40$ </td>
   <td style="text-align:center;"> $67.5$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Cluster sample </td>
   <td style="text-align:center;"> $31$ </td>
   <td style="text-align:center;"> $16$ </td>
   <td style="text-align:center;"> $47$ </td>
   <td style="text-align:center;"> $66.0$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Multi-stage sample </td>
   <td style="text-align:center;"> $24$ </td>
   <td style="text-align:center;"> $16$ </td>
   <td style="text-align:center;"> $40$ </td>
   <td style="text-align:center;"> $60.0$ </td>
  </tr>
</tbody>
</table>


## Representative samples {#Representative-samples}
\index{Sampling!representative}

Obtaining a truly random sample is usually hard or impossible in practice.
Sometimes the best compromise is to select a sample sufficiently diverse so that it is likely to be *somewhat representative* of the diversity in the population.
Specifically, those *in* the sample are not likely to be different from those *not in* the sample, at least for the variables of interest.
This is often the only practical way to sample.


::: {.definition #RepresentativeSample name="Representative sample"}
In a *representative* sample, those *in* the sample are not likely to be different from those *not in* the sample, at least for the variables of interest.
A representative sample is *not* a random sample.
:::


As always, the results from any non-random sample *may not generalise* to the intended population (but will generalise to the population which the sample *does* represent).


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/pexels-thisisengineering-3912979.jpg" width="200px"/>
</div>


::: {.example name="Representative sample"}
Suppose we wish to evaluate the functionality of two types of hand prosthetics.

If a randomly-chosen group of Alaska and Texas residents is asked for their feedback, probably (but not certainly) their views would be similar to those of all Americans.
No obvious reason exists for why residents of Alaska and Texas would be very different from residents in the rest of the United States, regarding their view of hand prosthetic functionality.
	
Even though the sample is not a random sample of all Americans, the results *may* generalise to all Americans (though we cannot be sure).
This sample *may* be representative of the population.
:::


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/pexels-juergen-striewski-301048.jpg" width="200px"/>
</div>


::: {.example #AirConUse name="Non-representative samples"}
Suppose we wish to determine the average time per day that Americans households use their air-conditioners for *cooling* in summer. 

A sample of Texas residents would not be expected to represent all Americans: it would *over*-represent the average number of hours air-conditioners are used for *cooling* in summer.
In this case, those *in* the sample are very different to those *not in* the sample, regarding their air-conditioners usage for cooling in summer.

In contrast, suppose a sample of Alaskans was asked the same question.
This sample would not represent all Americans either (it would *under*-represent air-conditioner use).
Again, those *in* the sample are likely to be very different to those *not in* the sample, regarding their air-conditioners usage for *cooling* in summer.
This sample would not be representative of the population.
:::


Sometimes, a *combination* of sampling methods is used.\index{Sampling!combination of methods}
If the combination includes a non-random sampling method, the sampling method does *not* produce a random sample, but is probably more likely to produce an externally valid sample than a completely non-random sample.

		
::: {.example name="A combination of sampling methods"}
In a study of pathogens present on magazines in doctors' surgeries in Dublin, some suburbs can be selected at *random*, and then (within each suburb) all surgeries are contacted, and some surgeries *volunteer* to be part of the study. 
This study does not use a random sample.
:::


:::{.exampleExtra data-latex=""}
In a study of diets of children at child-care centres, researchers used samples in\ 2010 and\ 2016, described as follows [@larson2019staff, p.\ 336]:

> In\ 2010, a stratified random sampling procedure was used to select representative cross-sections of providers working in licensed center-based programs and licensed providers of family home-based care from publicly available lists. 
> [...] Additional participants were also recruited in\ 2016 using a combination of stratified random and open, convenience-based sampling.
:::


Sometimes, practicalities dictate how the sample is obtained, which may result in a non-random sample.
Even so, the impact of using a non-random sample on the conclusions should be discussed (Chap.\ \@ref(Interpretation)).
Sometimes, simple steps can be taken to obtain a sample that is *more likely* to be representative.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Random samples are often difficult to obtain, and sometimes *representative* samples are the best that can be achieved,
In a representative sample, those *in* the sample are not obviously different from those *not in* the sample.
Try to ensure that a broad cross-section of the target population appears in the sample.
:::

Even if a random or representative sample cannot be obtained, the study can still be useful.
The results still apply to the population represented by the sample.
If individuals in the sample are unlikely to be different from individuals *not* in the sample, for the variables important to the study, the results are likely to approximately apply to the population.


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/pexels-lina-kivaka-3395280.jpg" width="200px"/>
</div>


::: {.example #RepresentativeUni name="Representative sample"}
For the typing study in Example\ \@ref(exm:Typing), only selecting students who attend the gym, or only students who are at a certain café, is unlikely to be somewhat representative of the student population.
Instead, the researchers could approach students at different days, times and locations:

* at the café on Monday at\ $8$am.
* at the gym on Tuesday at\ $11$:$30$am.
* at the library on Thursdays at\ $2$pm.

*This is not a random sample*, but should contain a variety of students.
Ideally, *students would not be included more than once in the sample*, though this is often difficult to ensure.
The students *in* the sample are probably somewhat similar to those *not* in the sample in terms of average typing speeds (there is no obvious reason why they would not be), but we cannot be sure.
:::



<iframe src='https://www.ferendum.com/en/embeded.php?pregunta_ID=1252845&sec_digit=1251027117&embeded_digit=219259060' style='width:100%; height:500px; overflow: auto; background: #badaff33;' frameBorder='0'></iframe><BR>
<A href='https://www.ferendum.com' target='_blank'>Free Online Poll Maker</A>



<div class='webex-solution'><button>Solution</button>

The researchers takes a random sample from *each* of the large groups (cases).

This is a **stratified sample**.

</div>





To determine if the sample is somewhat representative of the population, sometimes information about the sample and population can be compared.
The researchers may then be able to make some comment about whether the sample seems reasonably representative.
For example, the sex and age of a sample of university students may be recorded; if the proportion of females in the sample, and the average age of students in the sample, are similar to those of the whole university population, then the sample may be considered somewhat representative of the population (though we cannot be sure). 


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/pexels-rathaphon-nanthapreecha-3846205.jpg" width="200px"/>
</div>



::: {.example #CFSamplePop name="Comparing samples and populations"}
@egbue2017mass studied the adoption of electric vehicles (EVs) by Americans, using a sample of $121$\ people found through social media (such as Facebook) and professional engineering channels.
This is *not* a random sample of Americans.

The authors compared some characteristics of the sample with the American population from the $2010$\ census.
Compared to the US population, the sample contained a higher percentage of males, a higher percentage of people aged\ $18$--$44$, and a higher percentage of wealthy individuals.
:::


<!-- ```{r EVAsdoptCompare} -->
<!-- EVAdopt <- array( dim = c(9, 2)) -->

<!-- colnames(EVAdopt) <- c("Sample",  -->
<!--                        "US Population") -->
<!-- rownames(EVAdopt)<- c("% Male",  -->
<!--                       "% Female", -->
<!-- 		      "Under 18",  -->
<!-- 		      "18--44",  -->
<!-- 		      "45--64",  -->
<!-- 		      "65 and older", -->
<!-- 		      "Under $75,000", -->
<!-- 		      "$75,000 and over",  -->
<!-- 		      "Prefer not to say") -->

<!-- EVAdopt[1, ] <- c(77.68, 49.20) -->
<!-- EVAdopt[2, ] <- c(22.32, 50.80) -->
<!-- EVAdopt[3, ] <- c( 0.00, 24.00) -->
<!-- EVAdopt[4, ] <- c(55.36, 36.50) -->
<!-- EVAdopt[5, ] <- c(31.25, 26.40) -->
<!-- EVAdopt[6, ] <- c(13.39, 13.00) -->
<!-- EVAdopt[7, ] <- c(28.56, 67.49) -->
<!-- EVAdopt[8, ] <- c(51.78, 22.51) -->
<!-- EVAdopt[9, ] <- c(19.64,  0.00) -->

<!-- if( knitr::is_latex_output() ) { -->
<!--   kable(EVAdopt, -->
<!--         format = "latex", -->
<!--         longtable = FALSE, -->
<!--         booktabs = TRUE, -->
<!--         caption = "Comparing the sample and the population (in percentages), for the EV study") %>% -->
<!-- 	kable_styling(font_size = 10) %>% -->
<!-- 	row_spec(0, bold = TRUE) %>% -->
<!--    pack_rows("Gender", 1, 2) %>% -->
<!--    pack_rows("Age", 3, 6) %>% -->
<!--    pack_rows("Annual income", 7, 9) -->
<!-- } -->

<!-- if( knitr::is_html_output() ) { -->
<!--   out <- kable(EVAdopt, -->
<!--         format = "html", -->
<!--         longtable = FALSE, -->
<!--         booktabs = TRUE, -->
<!--         caption = "Comparing the sample and the population (in percentages), for the EV study") %>% -->
<!--    pack_rows("Gender", 1, 2) %>% -->
<!--    pack_rows("Age", 3, 6) %>% -->
<!--    pack_rows("Annual income", 7, 9) -->
<!--     out -->
<!-- } -->
<!-- ``` -->



## Sampling biases {#SelectionBias}
\index{Sampling!bias}
   
The sample may not be representative of the population for many reasons, all of which compromise how well the sample represents the population (i.e., compromises *external* validity and accuracy).
This is called *selection bias*.



::: {.definition #SelectionBias name="Selection, non-response and response bias"}
\index{Bias!selection}\index{Bias!non-response}\index{Bias!response}
*Selection bias* is the tendency of a sample to over- or under-estimate a population quantity.

*Non-response bias* occurs when chosen participants do not respond: those responding may be different from those not responding.

*Response bias* occurs when participants provide *incorrect or false information*.
:::


Selection bias is less common in studies with forward directionality, compared to studies that are non-directional or have backward directionality (Sect.\ \@ref(Directionality)).
*Selection bias* may occur if the wrong sampling frame is used, or non-random sampling is used.
The sample is biased because those *in* the sample may be different from those *not in* the sample (which may not always be obvious).
Biased samples are less likely to produce externally valid studies.


::: {.example name="Selection bias"}
Consider Example\ \@ref(exm:AirConUse), about estimating the average time per day that air conditioners are used for cooling in summer.
Even a *random* sample of Alaskans produces a biased sample of Americans: the sampling frame (Alaskans) does not represent the target population ('Americans').
This is *selection bias*.
:::


*Non-response bias* occurs when chosen participants do not respond.\index{Bias!non-response}
Bias occurs because those who *do not* respond may be different from those who *do* respond.
Non-response bias can occur because of a poorly-designed survey, using voluntary-response sampling, chosen participants refusing to participate, participants forgetting to return completed surveys, etc.


::: {.example #BiasOvertime name="Non-response bias"}
Consider a study to determine the average number of hours of overtime worked by various professions.
People who work a large amount of overtime may be too busy to answer the survey.
Those who answer the survey may be likely to work less overtime than those who do not answer the survey.
This is an (extreme) example of *non-response bias*.
:::


*Response bias* occurs when participants provide *incorrect or false information*.\index{Bias!response}
This may be intentional (for example, respondents lie) or non-intentional (for example, the question is poorly written (see Sect.\ \@ref(WritingQuestions)), personal, or misunderstood).


::: {.example #PoorSampling name="Poor sampling"}
Obtaining data using a telephone survey only includes people who own a telephone, who answer the phone, who do not hang up, who volunteer to complete the survey, and who then finish the whole survey.
The people who participate in the survey must meet these criteria, and probably do not represent the population.

Obtaining data using a TV station call-in at $6$:$15$pm only includes people watching that channel, at that time, and who are sufficiently motivated to call.
These people must meet very specific criteria, and probably do not represent the population.

Randomly sampling students at your university, because it is easier than finding a random sample of all university students in your country, will only generalise to students at that university and not to students at *all* universities in your country.
:::

\index{Research design!external validity|)}

<iframe src="https://learningapps.org/watch?v=pi1dizdma22" style="border:0px;width:100%;height:500px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>


<!-- ## Final example {#Final-Example} -->

<!-- As a demonstration of sampling schemes [@mypapers:ExperientialLearningStats], consider taking a [*non-random* sample](#NonRandomSamples) of the pixels of an image (Fig.\ \@ref(fig:Sampling-NonRandom)). -->
<!-- What is the image? -->
<!-- Seeing the *big picture* is hard using these non-random samples. -->


<!-- ```{r Sampling-NonRandom, echo=FALSE, out.width='49%', fig.align="center", fig.cap="Non-random samples from an image: a small number of pixels (top left); a slightly large number of pixels (top right); a large number of pixels (bottom left); a very large number of pixels (bottom right)", fig.show="hold"} -->
<!-- knitr::include_graphics( c('Sampling/crazy-emotion-eyewear-2015-SMALLER-NonR05-boxed.png', -->
<!--                            'Sampling/crazy-emotion-eyewear-2015-SMALLER-NonR10-boxed.png', -->
<!--                            'Sampling/crazy-emotion-eyewear-2015-SMALLER-NonR25-ALT-boxed.png', -->
<!--                            'Sampling/crazy-emotion-eyewear-2015-SMALLER-NonR50-boxed.png') ) -->
<!-- ``` -->


<!-- In contrast, taking [*simple random sample*](#SRS) makes the *big picture* much clearer (Fig.\ \@ref(fig:Sampling-Random)). -->
<!-- Indeed, *any* type of random sample makes seeing the *big picture* easier. -->

<!-- For example, for a [*cluster sample*](#ClusterSampling) we treat each *column* as a cluster, and select some *columns* at random. -->
<!-- Then, the entire chosen columns are selected. -->
<!-- For a [*multi-stage sample*](#MultistageSampling), we could select some columns at random, then select some pixels in those columns at random. -->


<!-- ```{r Sampling-Random, echo=FALSE, out.width='49%', fig.align="center", fig.cap="Random samples from an image: a small sample of pixels (top left); a slightly larger sample of pixels (top right); a large sample of pixels (bottom left); a very large sample of pixels (bottom right)", fig.show="hold"} -->
<!-- knitr::include_graphics( c( 'Sampling/crazy-emotion-eyewear-2015-SMALLEST-R05.png', -->
<!--                             'Sampling/crazy-emotion-eyewear-2015-SMALLEST-R10.png', -->
<!--                             'Sampling/crazy-emotion-eyewear-2015-SMALLEST-R25.png', -->
<!--                             'Sampling/crazy-emotion-eyewear-2015-SMALLEST-R50.png') ) -->
<!-- ``` -->





<!-- ```{r animation.hook="gifski", cache=FALSE, echo=FALSE, interval=1.5, dev=if (is_latex_output()){"pdf"}else{"png"}} -->
<!-- if (knitr::is_html_output()){ -->
<!--    for (i in 1:4){ -->
<!--       if (i == 1) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R05-cluster.png') )) -->
<!--       if( i == 2) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R10-cluster.png') )) -->
<!--       if (i == 3) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R25-cluster.png') )) -->
<!--       if (i == 4) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R50-cluster.png') )) -->
<!--    } -->
<!-- } -->
<!-- ``` -->




<!-- ```{r animation.hook="gifski", cache=FALSE, echo=FALSE, interval=1.5, dev=if (is_latex_output()){"pdf"}else{"png"}} -->
<!-- if (knitr::is_html_output()){ -->
<!--    for (i in 1:4){ -->
<!--       if (i == 1) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R05-systematic.png') )) -->
<!--       if( i == 2) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R10-systematic.png') )) -->
<!--       if (i == 3) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R25-systematic.png') )) -->
<!--       if (i == 4) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R50-systematic.png') )) -->
<!--    } -->
<!-- } -->
<!-- ``` -->




<!-- ```{r animation.hook="gifski", cache=FALSE, echo=FALSE, interval=1.5, dev=if (is_latex_output()){"pdf"}else{"png"}} -->
<!-- if (knitr::is_html_output()){ -->
<!--    for (i in 1:4){ -->
<!--       if (i == 1) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R05-multi-stage.png') )) -->
<!--       if( i == 2) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R10-multi-stage.png') )) -->
<!--       if (i == 3) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R25-multi-stage.png') )) -->
<!--       if (i == 4) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R50-multi-stage.png') )) -->
<!--    } -->
<!-- } -->
<!-- ``` -->
<!-- For a [*systematic sample*](#SystematicSampling), we could take (for example) every 200th pixel for a small sample, or every fourth pixel for a larger sample (after choosing a random starting point). -->
<!-- We would need to be careful to ensure we did not select pixels in rows or columns, or along an edge, for example. -->
<!-- For a [*stratified sample*](#StratifiedSampling), we could select a simple random sample from the background greenery, and a simple random sample from the person. -->
<!-- These two samples can be combined to get an overall random sample. -->


<!-- ```{r animation.hook="gifski", cache=FALSE, echo=FALSE, interval=1.5, dev=if (is_latex_output()){"pdf"}else{"png"}} -->
<!-- if (knitr::is_html_output()){ -->
<!--    for (i in 1:(20)) { -->
<!--       if (i == 1) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R05-stratified-GREENERY.png') )) -->
<!--       if (i == 2) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R05-stratified-NONGREENERY.png') )) -->
<!--       if (i == 3) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R05-stratified-COMBINED.png') )) -->
<!--       if (i == 4) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-WHITE.png') )) -->
<!--       if (i == 5) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-WHITE.png') )) -->

<!--       if( i == 6) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R10-stratified-GREENERY.png') )) -->
<!--       if( i == 7) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R10-stratified-NONGREENERY.png') )) -->
<!--       if( i == 8) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R10-stratified-COMBINED.png') )) -->
<!--       if( i == 9) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-WHITE.png') )) -->
<!--       if( i == 10) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-WHITE.png') )) -->

<!--       if (i == 11) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R25-stratified-GREENERY.png') )) -->
<!--       if (i == 12) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R25-stratified-NONGREENERY.png') )) -->
<!--       if (i == 13) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R25-stratified-COMBINED.png') )) -->
<!--       if (i == 14) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-WHITE.png') )) -->
<!--       if (i == 15) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-WHITE.png') )) -->

<!--       if (i == 16) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R50-stratified-GREENERY.png') )) -->
<!--       if (i == 17) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R50-stratified-NONGREENERY.png') )) -->
<!--       if (i == 18) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-R50-stratified-COMBINED.png') )) -->
<!--       if (i == 19) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-WHITE.png') )) -->
<!--       if (i == 20) plot( as.raster( png::readPNG('Sampling/crazy-emotion-eyewear-2015-SMALLEST-WHITE.png') )) -->
<!--    } -->
<!-- } -->
<!-- ``` -->


## Chapter summary {#Chap5-Summary}

Almost always, the entire population of interest cannot be studied, so a *sample* (a subset of the population) must be studied.
*Many* samples are possible; only one sample is studied.
Samples can be obtained using *random* or *non-random* methods.
Conclusions made from random samples can usually be generalised to the population (that is, they are externally valid and accurate).

Random sampling methods include *simple random samples*, *systematic samples*, *stratified samples*, *cluster samples*, and *multi-stage samples*.
Random samples are likely to be *externally valid* and *accurate*.

Non-random sampling methods include *convenience samples*, *judgement samples*, *voluntary (self-selecting) samples*, and *cherry-picking*.
Random samples are often very difficult to obtain, so *reasonably representative* samples are sometimes used, where those *in* the sample are unlikely to be very different from those *not in* the sample.
Non-random samples *may not be externally valid* or *accurate*.


The following video may be helpful.


<div style="text-align:center;">
<iframe width="560" height="315" src="https://www.youtube.com/embed/KyuaX10l3GQ" frameborder="0" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture"></iframe>
</div>



## Quick review questions  {#Chap5-QuickReview}

::: {.webex-check .webex-box}
Are the following statements *true* or *false*?

1. Suppose students are randomly selected and sent postal surveys from their university, but some students have moved and so never receive the survey. \tightlist
   This is *response* bias.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. A *large* sample is *always* better than a *random* sample.  
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. *Convenience* sampling and *judgement* sampling are examples of non-random sampling.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
:::




## Exercises {#SamplingExercises}

[Answers to odd-numbered exercises] are given at the end of the book. 




::: {.exercise #SamplingAdvantageRandom}
<!--
What is the main advantage of using a *random* sample?  

a. It is easier.
b. It is more likely to produce an experimental study.
c. It is more likely to produce an externally-valid study.
d. It is more likely to produce precise estimates.
-->

What is the main advantage of using a *random* sample?  
<div class='webex-radiogroup' id='radio_ZVBURSABZW'><label><input type="radio" autocomplete="off" name="radio_ZVBURSABZW" value=""></input> <span>It is easier.</span></label><label><input type="radio" autocomplete="off" name="radio_ZVBURSABZW" value=""></input> <span>It is more likely to produce an experimental study.</span></label><label><input type="radio" autocomplete="off" name="radio_ZVBURSABZW" value="answer"></input> <span>It is more likely to produce an externally-valid study.</span></label><label><input type="radio" autocomplete="off" name="radio_ZVBURSABZW" value=""></input> <span>It is more likely to produce precise estimates.</span></label></div>


:::


::: {.exercise #SamplingAdvantageLarge}
What is the main advantage of using a *large* sample?  
<div class='webex-radiogroup' id='radio_LXCTXMZTQO'><label><input type="radio" autocomplete="off" name="radio_LXCTXMZTQO" value=""></input> <span>It is easier.</span></label><label><input type="radio" autocomplete="off" name="radio_LXCTXMZTQO" value=""></input> <span>It is more likely to produce an experimental study.</span></label><label><input type="radio" autocomplete="off" name="radio_LXCTXMZTQO" value=""></input> <span>It is more likely to produce an externally-valid study.</span></label><label><input type="radio" autocomplete="off" name="radio_LXCTXMZTQO" value="answer"></input> <span>It is more likely to produce precise estimates.</span></label></div>

<!--

a. It is easier.
b. It is more likely to produce an experimental study.
c. It is more likely to produce an externally-valid study.
d. It is more likely to produce precise estimates.
-->
:::


::: {.exercise #SamplingOverUnderA}
For the following scenarios, is the selected sample likely to *over*- or *under*-estimate the unknown population value, or estimate the value accurately?
Explain *why* the over- or -under-estimation occurs, if relevant, and whether this is likely to be intentional or unintentional.

1. In a study by biologists to estimate biodiversity, researchers decide to focus only on easily accessible areas of a forest due to budget and time constraints.
2. A city council wishes to report the crime rate of various neighbourhoods, so employs interviewers to go door-to-door interviewing residents, between $8$am and $5$pm.
3. In a campaign speech, a politician reports on some large successes during her term.
:::


::: {.exercise #SamplingOverUnderB}
For the following scenarios, is the selected sample likely to *over*- or *under*-estimate the unknown population value, or estimate the value accurately?
Explain *why* the over- or -under-estimation occurs, if relevant, and whether this is likely to be intentional or unintentional.

1. A county wants to report the number of homeless, so researchers record data from homeless shelters.
2. In a study of soil fertility, a junior researcher takes soil from the surface for testing.
3. A university has introduced a complex and time-consuming system for professors to report students suspected of cheating.
   When the university produces its *Annual Report*, the reported incidence of cheating is used to claim that 'reports of cheating have dropped'.
:::


::: {.exercise #SamplingSystematicProblem}
A researcher has three months in which to collect the data for a study on car park usage at a shopping centre.
Suppose the researcher wants to take a systematic sample of days, and on each of the selected days records the number of cars in the car park.

To select the days in which to collect data, she decides (by using random numbers) to start data collection on a Tuesday, and then every seventh day thereafter.

1. What problem is evident in this sampling scheme? 
2. What suggestions would you give to improve the sampling?
:::

::: {.exercise #SamplingBooks}
Suppose you need to estimate the average number of pages in physical books in a university library (with a library in each of five campuses).
Describe how to select a sample of $200$\ books using:

:::::: {.cols data-latex=""}
::: {.col data-latex="{0.42\textwidth}"}
1. a *simple random sample* of books.
2. a *stratified sample* of books.
3. a *cluster sample* of books.
:::

::: {.col data-latex="{0.05\textwidth}"}
\ 
<!-- an empty Div (with a white space), serving as
a column separator -->
:::

::: {.col data-latex="{0.52\textwidth}"}
4. a *convenience sample* of books.
5. a *multi-stage sample* of books.
:::
::::::

Which sampling scheme would be most *practical*?
:::


::: {.exercise #SamplingApartments}
Suppose you need a sample of residents from apartments in a large residential complex, comprising $30$\ floors with $15$\ apartments on each floor.
You plan to survey the residents of these apartments.
For each of the possible sampling schemes given below, first describe the sampling scheme, and then determine which methods are likely to give random (or representative) sample (explaining your answers).

1. *Randomly* select five floors, then *randomly* select four apartments from each of those five floors, and interview a randomly-chosen adult living at the apartment.
2. *Randomly* select one floor, and select the $15$ apartments on that floor, then interview the oldest resident of that apartment.
3. Wait at the ground-floor elevator, and ask people who emerge to complete the survey.
4. *Randomly* select five floors, then wait by the elevator on those floors and survey residents as they arrive at the elevator.
:::


::: {.exercise #SamplingShoppingCentre}
Suppose a researcher needs a sample of customers from a large, local shopping centre to complete a questionnaire.
Four sampling schemes are listed below.
For each, describe the type of sampling.
Then, determine which would be the best method (explain why), and determine which (if any)  produce a random sample.

1. The researcher locates themselves outside the supermarket at the shopping centre one morning, and approaches every tenth person who walks past. 
2. The researcher waits at the main entrance for $30\mins$ at $8$am every morning for a week, and approaches every fifth person. 
3. The researcher leaves a pile of survey forms at an unattended booth in the shopping centre, and a locked barrel in which to place completed surveys.
4. The researcher goes to the shopping centre every day for two weeks, at a different time and location each day, and approaches someone every\ $15\mins$.
:::



::: {.exercise #SamplingSchools}
@ridgewell2009school investigated how children in Brisbane travel to state schools. 
Researchers randomly sampled four schools from a list of all Brisbane state schools, and invited every family at each of those four schools to complete a survey.

What *type* of sampling method is this?
How could the researchers determine if the resulting sample was approximately representative?
:::


::: {.exercise #SamplingMalaria}
A study comparing two new malaria vaccines recruited $200$ Kenyans who had contracted malaria.
These recruits were obtained by approaching all patients with a confirmed malaria diagnosis who were admitted to hospitals.
Patients could volunteer for the study or not.
The study was then conducted to a high standard.
Which of the following statements are *true*?  

1. This is a voluntary response sample. <select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
2. The study is likely to have high *external* validity. <select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
3. The sample size is too small for the study results to provide useful information. <select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
:::



::: {.exercise #SamplingForest}
Suppose a natural forest region is classified into two quite different zones.
Zone\ A is mostly dunes and lightly vegetated, and on the coastal side of a ridge; Zone\ B is more densely vegetated and on the inland side of the ridge. 

A sample of sugar ants (*Camponotus app*) is taken from Zone\ A, and another sample of sugar ants from Zone\ B, to study the average size of the ants.
What is the best description of the *type* of sampling method being used?
:::



::: {.exercise #BiasOnline}
A survey in\ 2001 concluded (@data:Heiger:Homebuyer, cited in @bock2010stats, p.\ 283):

> All but\ $2$% of the home buyers have at least one computer at home, and $62$% have two or more.
> Of those with a computer, $99$% are connected to the internet.

The article later reveals the survey was conducted *online* (recall the survey was conducted in\ 2001).
The target population is home buyers; however, home buyers *with* internet access were far more likely to complete the survey than home buyers *without* internet access.

What type of bias is this?
:::




::: {.exercise #NotMultistageSampling}
Researchers are studying the percentage of farms that use a specific management technique.
The researchers *randomly* select $20$\ regions around the country, then *randomly* select farms within each region, then ask farmers to volunteer to be in the study.

Explain why this is *not* a multi-stage sample, and what changes are necessary for the researchers to have a multi-stage sample.
:::


::: {.exercise #NotClusterSampling}
Researchers are comparing the average time that experienced school teachers and first-year school teachers spend in the sun.
The researchers select schools by asking school principals to volunteer their schools, then record information for *every* teacher in those schools.

Explain why this is *not* a cluster sample, and what changes are necessary for the researchers to have a cluster sample.
:::


::: {.exercise #SolarSampling}
@walters2018factors asked this RQ:

> What factors are preventing the adoption of household solar technologies in Santiago?

1. For this RQ, what is the *Population*? \tightlist
2. The study will be *externally valid* if which of these statements is true?
   a. The sample is representative of all households in the world.
   b. The sample is representative of all solar technologies.
   c. The sample is representative of all households in Santiago.
   d. The sample is representative of all households in Chile.
3. Suppose the researchers mail surveys to all households in Santiago, and people return the survey if they wished to.
   What is the *best* description of this sampling method?
4. Suppose the researchers randomly select five suburbs in Santiago; then ten streets within each suburb; then ten households on each street. 
   What is the *best* description of this sampling method?
:::





<!-- QUICK REVIEW ANSWERS -->
<!--
::: {.EOCanswerBox .EOCanswer data-latex="{iconmonstr-check-mark-14-240.png}"}
**Answers to *Quick review* questions:**
**1.** False.
**2.** False (larger: more precise; random: more accurate).
**3.** True.
:::
-->

