
# Models and normal distributions {#SamplingDistributions}




::: {.objectivesBox .objectives data-latex="{iconmonstr-target-4-240.png}"}
So far, you have learnt to ask an RQ, design a study, describe and summarise the data, and understand sampling variation.
**In this chapter**, you will learn to:

* describe and draw normal distributions.
* use $z$-scores to compute probabilities related to normal distributions.
* work 'backwards' from probabilities for normal distributions.
:::


<img src="20-Tools-DistributionsAndModels_files/figure-html/unnamed-chunk-9-1.png" width="65%" height="33%" style="display: block; margin: auto;" />


<!-- Define colours as appropriate -->






## Introduction {#DistributionsModelsIntro}

As seen in Chap.\ \@ref(SamplingVariation), many different samples could be drawn from a population, and the value of the statistic varies from sample to sample.
The challenge of research is that only one of these countless possible samples is observed.
The distribution of possible values of the statistic that could be observed from all possible samples is a *sampling distribution*.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Remember: studying a sample leads to the following observations:
\vspace{-2ex}

* every sample is likely to be different.
* we observe just one of the many possible samples.
* every sample is likely to yield a different value for the statistic.
* we observe just one of the many possible values for the statistic.
\vspace{-2ex}

Since many values for the statistic are possible, the possible values of the statistic vary (called *sampling variation*) and have a *distribution* (called a *sampling distribution*).
:::


As seen in Chap.\ \@ref(SamplingVariation), sampling distributions often have a *normal distribution* (or bell-shaped distribution).\index{Distributions}\index{Normal distribution}
That is, the normal distribution\index{Model} is often used to describe the *sampling distribution*.\index{Sampling distribution}
We now study normal distributions, as they appear in many places in research.


## Normal distributions: examples {#DistributionsExample}
\index{Normal distribution!examples for data}

In Chap.\ \@ref(SamplingVariation), we saw that the proportion of odd spins in $15$\ spins of a roulette wheel could vary; similarly, the mean spin from $15$\ spins could vary (Fig.\ \@ref(fig:RouletteWheelHistPropMean)).
In both cases, these sampling distributions had a rough *normal distribution* shape.
This is true for larger numbers of spins also (Figs.\ \@ref(fig:RouletteWheelHist) and\ \@ref(fig:RouletteWheelHistx)).


<div class="figure" style="text-align: center">
<img src="20-Tools-DistributionsAndModels_files/figure-html/RouletteWheelHistPropMean-1.png" alt="Sampling distributions for the proportion of odd spins (left), and the mean of the numbers after $15$ roulette wheel spins (right) are approximate normal distributions. The solid lines are theoretical normal distributions." width="90%" />
<p class="caption">(\#fig:RouletteWheelHistPropMean)Sampling distributions for the proportion of odd spins (left), and the mean of the numbers after $15$ roulette wheel spins (right) are approximate normal distributions. The solid lines are theoretical normal distributions.</p>
</div>


The *histograms* in Fig.\ \@ref(fig:RouletteWheelHistPropMean) are based on results from a limited number of simulations.
The solid lines shown in Fig.\ \@ref(fig:RouletteWheelHistPropMean) are actual *normal distributions*, and represent how the histogram might appear theoretically if we used an infinite number of simulations.
The normal distributions are *models*\index{Model} for what might occur in the *population*, so normal distributions are also called *normal models*.
Since the models represent *populations*, the mean of the model is denoted\ $\mu$ and the standard deviation is denoted\ $\sigma$.

A *model*\index{Model} is a theoretical or ideal concept.
A model skeleton isn't $100$%\ accurate and certainly not exactly like *your* skeleton; nonetheless, it suitably approximates reality.
None of us probably have a skeleton *exactly* like the model, but the model is still useful and helpful.
Likewise, a sampling distribution may not have *exactly* a normal shape, but the model is still useful and helpful.
The model is a way of describing a *theoretical* distribution in the population.
A model is a simple (but not overly simple) approximation to reality.
<!-- ; it does not represent any particular sample of data. -->

The histograms in Fig.\ \@ref(fig:RouletteWheelHistPropMean) are not *exactly* normal distributions, but are very close to normal distributions, and certainly close enough for most purposes.
Many, but not all, sampling distributions have approximate normal distributions.

Sampling distributions represent theoretical distributions of sample *statistics*, not the distribution of sample *data*.
When the sampling distribution is a normal distribution, the mean of the distribution is called the *sampling mean* and the standard deviation is called the *standard error*.
<!-- (These values may be *guided* by sample values; e.g., suggesting a mean Leadbeater's possum weight of $1000$\gs based on Fig.\ \@ref(fig:HistogramDBPPossums) (right panel) would be silly.) -->

Apart from their use in modelling theoretical sampling distributions, some quantitative variables have approximate normal distributions too, when the distribution of the data in the *population* can be approximately modelled by a normal distribution.


::: {.example #NormalExamples name="Normal distributions of data"}
Some quantitative variables have approximate normal distributions.
Figure\ \@ref(fig:HistogramDBPPossums) (left panel) shows the diastolic blood pressure of $398$\ Americans [@data:Willems1997:CHD; @data:Schorling1997:smoking].
Figure\ \@ref(fig:HistogramDBPPossums) (right panel) shows the weight of $83$\ male Leadbeater's possums [@data:Williams2022:Possums].
:::


<div class="figure" style="text-align: center">
<img src="20-Tools-DistributionsAndModels_files/figure-html/HistogramDBPPossums-1.png" alt="Two normal distributions. Left: diastolic blood pressure of a sample of $398$ Americans. Right: the weight of a sample of $83$ male Leadbeater's possums.  The solid lines are the approximate normal model for the variable in the population." width="100%" />
<p class="caption">(\#fig:HistogramDBPPossums)Two normal distributions. Left: diastolic blood pressure of a sample of $398$ Americans. Right: the weight of a sample of $83$ male Leadbeater's possums.  The solid lines are the approximate normal model for the variable in the population.</p>
</div>


<!-- The histogram of the proportion of odd spins in Fig.\ \@ref(fig:RouletteWheelHistPropMean) (left panel) is from one of the countless possible samples of odd spins in $15$ spins. -->
<!-- The histogram of the mean of a set of spins in Fig.\ \@ref(fig:RouletteWheelHistPropMean) (right panel) is from one of the countless possible samples of sets of $15$ spins. -->
<!-- The normal distributions represent the unknown population sampling distributions that could reasonably have produced the histograms of the sample statistics.  -->

<!-- The histograms in Fig.\ \@ref(fig:HistogramDBPPossums) are from one of the countless possible samples of Americans (left panel) or Leadbeater's possums (right panel). -->
<!-- The normal distributions represent the unknown population distributions that could reasonably have produced the sample histograms.  -->



## Normal distributions and the 68--95--99.7 rule {#NormalDistribution}

Normal distributions have a shape that is symmetric about the mean, with a bell shape.
Half the values are greater than the mean, and half the values are less than the mean.
The total probability represented by a normal distribution is one (or\ $100$%).
For example, every sample will produce a sample proportion between\ $0$ and\ $1$ and so is represented somewhere in Fig.\ \@ref(fig:RouletteWheelHistPropMean) (left panel); every American has a diastolic blood pressure and so is represented somewhere in Fig.\ \@ref(fig:HistogramDBPPossums) (left panel); every male Leadbeater's possum has a weight and so is represented somewhere in Fig.\ \@ref(fig:HistogramDBPPossums) (right panel). 

In theory, no upper limit or lower limit exists for a variable modelled using a normal distribution.
In practice, this is rarely true, but usually never presents a problem.
Consider the normal distributions in Fig.\ \@ref(fig:HistogramDBPPossums), for example.
The normal distribution shown for the diastolic blood pressure (left panel) has no lower or upper limit in theory, but all practical values of diastolic blood pressure are captured by that part of the normal distribution shown.
The normal distribution implies almost no-one has a diastolic blood pressure below\ $40\mms$\ Hg or above\ $130\mms$\ Hg. 

One of the most important properties of normal distributions is the *68--95--99.7 rule* (sometimes called the *empirical rule*).



<!--
:::{.definition #EmpiricalRule name="The $68$--$95$--$99.7$ rule"} 
For any quantity modelled by a normal distribution:\index{68@$68$--$95$--$99.7$ rule}
-->


:::{.definition #EmpiricalRule name="The 68--95--99.7 rule"}
For any quantity modelled by a normal distribution:\index{68@$68$--$95$--$99.7$ rule}


* *approximately*\ $68$% of values lie within\ $1$ standard deviation of the mean.
* *approximately*\ $95$% of values lie within\ $2$ standard deviations of the mean.
* *approximately*\ $99.7$% of values lie within\ $3$ standard deviations of the mean.

These properties are true for *all* normal distributions, whatever the quantity, whatever the value of the mean, and whatever the value of the standard deviation (Fig.\ \@ref(fig:EmpiricalRuleDiagram)).
:::


<div class="figure" style="text-align: center">
<img src="20-Tools-DistributionsAndModels_files/figure-html/EmpiricalRuleDiagram-1.png" alt="The $68$--$95$--$99.7$ rule. The shaded regions correspond to the central $68$%, $95$% and $99.7$%." width="100%" />
<p class="caption">(\#fig:EmpiricalRuleDiagram)The $68$--$95$--$99.7$ rule. The shaded regions correspond to the central $68$%, $95$% and $99.7$%.</p>
</div>


:::{.example #HeightsFemales name="Heights of females"}
Suppose the heights of Australian adult females in the population can be *modelled* with a normal distribution having a mean of $\mu = 162\cms$, and a standard deviation of $\sigma = 7\cms$, and follow a normal distribution (Fig.\ \@ref(fig:EmpiricalRuleHts)).
<!-- (based on the -->
<!-- r if (knitr::is_latex_output()) { -->
<!--    'Australian Health Survey, 2011--2012).' -->
<!-- } else { -->
<!--    '[Australian Health Survey](https://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/4364.0.55.0012011-12?OpenDocument)).' -->
<!-- } -->
Using the $68$--$95$--$99.7$ rule, approximately\ $68$% of Australian women will be between $162 - 7 = 155\cms$ and $162 + 7 = 169\cms$ tall using this model.
Similarly, approximately\ $95$% of Australian women will be between $162 - (2\times 7) = 148\cms$ and $162 + (2\times 7) = 176\cms$ tall.
:::


<div class="figure" style="text-align: center">
<img src="20-Tools-DistributionsAndModels_files/figure-html/EmpiricalRuleHts-1.png" alt="A model for the height of adult Australian females in the population." width="75%" />
<p class="caption">(\#fig:EmpiricalRuleHts)A model for the height of adult Australian females in the population.</p>
</div>


These regions under the normal curve are probabilities, are often called areas, and are sometimes expressed as percentages.


## Standardising ($z$-scores) {#zScores}
\index{z@$z$-score|(}

<!-- Since many statistics have a normal distribution (under certain circumstances), the $68$--$95$--$99.7$ rule can be used to understand the distribution of sample statistics. -->

Since the $68$--$95$--$99.7$ rule (Def.\ \@ref(def:EmpiricalRule)) applies for all normal distributions, the percentages in the rule only depend on how many standard deviations\ ($\sigma$) a value\ ($x$) is from the mean\ ($\mu$).
This information can be used to learn more about how values are distributed in a normal distribution.

For example, suppose heights of Australian adult females can be modelled with a normal distribution having a mean of $\mu = 162\cms$, and a standard deviation of $\sigma = 7\cms$ (Example\ \@ref(exm:HeightsFemales)).
Using this model, the proportion of Australian adult women *taller* than\ $169\cms$ can be determined.

From a picture (Fig.\ \@ref(fig:HtsExer1), left panel), $162 + 7 = 169\cms$ is one standard deviation *above* the mean.
Since\ $68$% of values are within one standard deviation of the mean,\ $32$% are outside that range (some shorter; some taller).
Hence,\ $16$% are taller than one standard deviation above the mean, so the answer is about\ $16$%.
(Another\ $16$% are shorter than one standard deviation *below* the mean, or less than $162 - 7 = 155\cms$ in height.)

Again, the percentages only depend on how many standard deviations\ ($\sigma$) the value\ ($x$) is from the mean\ ($\mu$), and not the actual values of\ $\mu$ and\ $\sigma$.



<div class="figure" style="text-align: center">
<img src="20-Tools-DistributionsAndModels_files/figure-html/HtsExer1-1.png" alt="Left: what proportion of Australian adult females are taller than $169\cms$? Right: what proportion of Australian adult females are shorter than $148$\cms?" width="90%" />
<p class="caption">(\#fig:HtsExer1)Left: what proportion of Australian adult females are taller than $169\cms$? Right: what proportion of Australian adult females are shorter than $148$\cms?</p>
</div>

<!--
::: {.example #HeightsExer2 name="The $68$--$95$--$99.7$ rule"}
Consider again the heights of Australian adult females.
Using this model, what proportion are *shorter* than\ $148\cms$?
-->

::: {.example #HeightsExer2 name="The 68-95-99.7 rule"}
Consider again the heights of Australian adult females.
Using this model, what proportion are *shorter* than\ $148\cms$?


Again, drawing a picture is helpful (Fig.\ \@ref(fig:HtsExer1), right panel).
Since $162 - (2\times 7) = 148$, $148\cms$ is two standard deviations *below* the mean.
Since $95$% of values are within two standard deviation of the mean,\ $5$% are outside that range (half smaller, half larger; see Fig.\ \@ref(fig:HtsExer1), right panel), so that\ $2.5$% are *shorter* than\ $148\cms$.
(Another\ $2.5$% are *taller* than $162 + 14 = 176\cms$.)
:::


Again, the percentages only depend on how many standard deviations\ ($\sigma$) the value\ ($x$) is from the mean\ ($\mu$).
The number of standard deviations that an observation is from the mean is called a *$z$-score*.
A $z$-score is computed using
$$
   z = \frac{ x - \mu}{\sigma},
$$
where\ $\sigma$ is the standard deviation quantifying the variation in the $x$-values.
Converting values to $z$-scores is called *standardising*.


<!--
::: {.definition #zScore name="$z$-score"}
A *$z$-score* measures how many standard deviations a value\ $x$ is from the mean.
In symbols:
\begin{equation}
   z = \frac{x - \mu}{\sigma},
   (\#eq:zscores)
\end{equation}
where\ $\mu$ is the mean of the distribution, and\ $\sigma$ is the standard deviation of the distribution (measuring the variation in the $x$-values).
:::
-->

::: {.definition #zScore name="z-score"}
A *$z$-score* measures how many standard deviations a value\ $x$ is from the mean.
In symbols:
\begin{equation}
   z = \frac{x - \mu}{\sigma},
   (\#eq:zscores)
\end{equation}
where\ $\mu$ is the mean of the distribution, and\ $\sigma$ is the standard deviation of the distribution (measuring the variation in the $x$-values).
:::

 
 
The $z$-score is also called the *standardised value* or *standard score*.
Note that:

* $z$-scores are negative for observations *below* the mean.
* $z$-scores are positive for observations *above* the mean.
* $z$-scores have no units (that is, not measured in kg, or cm, etc.).


<!--
::: {.example #HeightsExer3 name="$z$-scores"}
Consider the model for the heights of Australian adult females again.
From earlier, the $z$-score for a height of\ $169\cms$ is
$$
   z = \frac{x-\mu}{\sigma} = \frac{169 - 162}{7} = 1,
$$
one standard deviation *above* the mean.
Similarly, the $z$-score for a height of\ $148\cms$ is
$$
   z = \frac{x-\mu}{\sigma} = \frac{148 - 162}{7} = -2,
$$
two standard deviations *below* the mean.
:::-->

::: {.example #HeightsExer3 name="z-scores"}
Consider the model for the heights of Australian adult females again.
From earlier, the $z$-score for a height of\ $169\cms$ is
$$
   z = \frac{x-\mu}{\sigma} = \frac{169 - 162}{7} = 1,
$$
one standard deviation *above* the mean.
Similarly, the $z$-score for a height of\ $148\cms$ is
$$
   z = \frac{x-\mu}{\sigma} = \frac{148 - 162}{7} = -2,
$$
two standard deviations *below* the mean.
:::




<!--
::: {.example #EmpiricalRuleZ  name="The $68$--$95$--$99.7$ rule"}
Consider the model for the heights of Australian adult females: a normal distribution, mean $\mu = 162\cms$, standard deviation $\sigma = 7\cms$ (Fig.\ \@ref(fig:HtsEmpirical)).
Using this model:

* a height of $162\cms$ is zero standard deviations from the mean: $z = 0$.
* $155\cms$ is one standard deviation *below* the mean: $z = -1$.
* $169\cms$ is one standard deviation *above* the mean: $z = 1$.
* $148\cms$ and $176\cms$ correspond to $z = -2$ and $z = 2$ respectively.
* $141\cms$ and $183\cms$ correspond to $z = -3$ and $z = 3$ respectively.
:::
-->

::: {.example #EmpiricalRuleZ  name="The 68-95-99.7 rule"}
Consider the model for the heights of Australian adult females: a normal distribution, mean $\mu = 162\cms$, standard deviation $\sigma = 7\cms$ (Fig.\ \@ref(fig:HtsEmpirical)).
Using this model:

* a height of $162\cms$ is zero standard deviations from the mean: $z = 0$.
* $155\cms$ is one standard deviation *below* the mean: $z = -1$.
* $169\cms$ is one standard deviation *above* the mean: $z = 1$.
* $148\cms$ and $176\cms$ correspond to $z = -2$ and $z = 2$ respectively.
* $141\cms$ and $183\cms$ correspond to $z = -3$ and $z = 3$ respectively.
:::



<div class="figure" style="text-align: center">
<img src="20-Tools-DistributionsAndModels_files/figure-html/HtsEmpirical-1.png" alt="The $68$--$95$--$99.7$ rule and the heights of Australian adult females." width="75%" />
<p class="caption">(\#fig:HtsEmpirical)The $68$--$95$--$99.7$ rule and the heights of Australian adult females.</p>
</div>



## Approximating areas (percentages) using the $68$--$95$--$99.7$ rule {#ApproxProbs}
\index{Normal distribution!approximating percentages|(}

As seen above, the $68$--$95$--$99.7$ rule can be used to approximate percentages under normal distributions.
The rule can even be used for values that do not exactly align with\ $1$,\ $2$ or\ $3$ standard deviations from the mean.

Suppose again that heights of Australian adult females can be modelled with a normal distribution with a mean of $\mu = 162\cms$, and a standard deviation of $\sigma = 7\cms$ (Fig.\ \@ref(fig:HtsEmpirical)).
To find the proportion of women *shorter* than $145\cms$, first draw the situation (Fig.\ \@ref(fig:HtsExer3)).
Proceeding as before, we ask 'How many standard deviations from the mean is\ $145\cms$?'
Using Equation\ \@ref(eq:zscores), $145\cms$ corresponds to a $z$-score of
\begin{equation}
   z = \frac{145 - 162}{7} = -2.4285...
   (\#eq:zscore214)
\end{equation}
which is about\ $2.43$ standard deviations *below* the mean.


<div class="figure" style="text-align: center">
<img src="20-Tools-DistributionsAndModels_files/figure-html/HtsExer3-1.png" alt="What proportion of Australian adult females are shorter than $145\cms$?" width="75%" />
<p class="caption">(\#fig:HtsExer3)What proportion of Australian adult females are shorter than $145\cms$?</p>
</div>


What percentage of observations are less than this $z$-score?
This case is not covered by the $68$--$95$--$99.7$ rule, though the rule can be used to make *rough estimates*.

About\ $2.5$% of observations are less than\ $2$ standard deviations below the mean; that is, about\ $2.5$% of women are shorter than\ $148\cms$.
So the percentage of females shorter than\ $145$\cms (that is, even shorter than\ $148\cms$, and so further into the tail of the distribution) will be *smaller* than\ $2.5$%.
While we don't know the probability exactly, it will be smaller than\ $2.5$%.

Percentages found this way are very approximate, but often sufficient.
However, more accurate percentages are found using tables compiled for this very purpose
(Appendix\ \@ref(ZTablesOnline)).
We now learn to use these tables.
\index{Normal distribution!approximating percentages|)}


## Exact areas (percentages) using tables {#ExactAreasUsingTables}
\index{Normal distribution!using tables|(}

Areas under normal distributions can be found using online tables, or hard copy tables., for any $z$-score.
The online tables are easier to use,
but only the online tables are explained in this online book (see the hard-copy version for the hard-copy tables, and instruction for using use the hard-copy tables).
The tables 
(Appendix\ \@ref(ZTablesOnline))
work with $z$-scores to two decimal places, so consider the $z$-score from Sect.\ \@ref(ApproxProbs) as $z = -2.43$.





The online tables can be found in Appendix \@ref(ZTablesOnline).
In the tables, enter the $z$-score in the the box `z.score`: then, the probability of finding a $z$-score **less than** (i.e., to the left of) this value is shown.
The tables give the area as $0.0075$.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
The tables always give the area to the **left** of the $z$-score that is looked up.
:::

<div style="text-align:center;">

```{=html}
<video src="./Movies/HaveZFindArea.m4v" width="500" controls="controls" loop="loop" style="padding:2px;border-top:1px gray;border-bottom:1px gray;"></video>
```
</div>



::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Our tables always give the area to the *left* of the $z$-score.
:::

Either the hard-copy or online tables gives an answer of\ $0.75$%.
This is consistent with the rough answer using the $68$--$95$--$99.7$ rule: a value less than\ $2.5$%.
\index{Normal distribution!using tables|)}


<iframe src="https://learningapps.org/watch?v=ppievv9gc22" style="border:0px;width:100%;height:850px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>



## Examples using $z$-scores {#ZScoreForestry}

The general approach to computing probabilities from normal distributions is:

* *draw a diagram*, and mark on the value(s) of interest.
* *shade* the required region of interest.
* *compute* the $z$-score(s) using Equation\ \@ref(eq:zscores).
* *use* the tables in Appendix\ \@ref(ZTablesOnline) to compute corresponding areas (percentages).
* *deduce* the answer.

This approach can be used to answer more complicated questions involving normal distributions.


::: {.example #NormalTrees name="Normal distributions"}
Mechanised forest harvesting systems were simulated by @data:Aedo1997:softwood, and the diameters of a specific type of tree were modelled using:

* a normal distribution, with
* a mean of $\mu = 8.8$ inches, and
* a standard deviation of $\sigma = 2.7$ inches.

Using this model, what is the probability that a randomly-chosen tree has a diameter *greater* than\ $5$\ inches?

Following the steps identified earlier:

* *draw* the appropriate normal curve, and mark on\ $5$\ inches (Fig.\ \@ref(fig:ZDBH1), left panel).
* *shade* the region 'greater than\ $5$\ inches' (Fig.\ \@ref(fig:ZDBH1), centre panel).
* *compute* the $z$-score using Equation\ \@ref(eq:zscores):
  $\displaystyle z = (5 - 8.8)/2.7 = -1.41$ to two decimal places.
* *use* tables:
  the probability of a tree diameter *shorter* than $5$\ inches is\ $0.0793$. 
  (Remember: the tables always give area *less* than the value of\ $z$.)
* *deduce* the answer (Fig.\ \@ref(fig:ZDBH1), right panel):
  since the *total* area under the normal distribution is one (or\ $100$%), the probability of a tree diameter  *greater* than\ $5$\ inches is $1 - 0.0793 = 0.9207$, or about\ $92$%.

A randomly-chosen tree has a probability of\ $92$% of having a diameter *greater* than\ $5$\ inches.
:::


<div class="figure" style="text-align: center">
<img src="20-Tools-DistributionsAndModels_files/figure-html/ZDBH1-1.png" alt="What proportion of tree diameters are greater than $5$ inches?" width="100%" />
<p class="caption">(\#fig:ZDBH1)What proportion of tree diameters are greater than $5$ inches?</p>
</div>


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Our normal-distribution tables *always* provide area to the *left* of the $z$-score.
Drawing a picture of the situation is important: it helps visualise getting the area requested from the area the tables provide.
Remember: the *total* area under the normal distribution is one (or\ $100$%).
:::


::: {.example #NormalTreesDiagrams name="Normal distributions"}
These scenarios can be displayed on a diagram as shown in Fig.\ \@ref(fig:MatchDiagrams) (recall $\mu = 8.8$ inches).

1. Tree diameters between\ $3$\ and\ $5$\ inches: Diagram\ A.
2. Tree diameters greater than\ $11$\ inches: Diagram\ B.
3. Tree diameters between\ $5$\ and\ $11$\ inches: Diagram\ C.
4. Tree diameters less than\ $11$\ inches: Diagram\ D.
:::


<!-- ```{r MatchDiagrams, fig.cap="Scenarios with their diagrams",  fig.align="center", out.width="85%", fig.height=4.00, fig.width=8}-->
<div class="figure" style="text-align: center">
<img src="20-Tools-DistributionsAndModels_files/figure-html/MatchDiagrams-1.png" alt="Scenarios with their corresponding diagrams." width="95%" />
<p class="caption">(\#fig:MatchDiagrams)Scenarios with their corresponding diagrams.</p>
</div>



::: {.example #NormalTrees2 name="Normal distributions"}
Using the model for tree diameters in Example\ \@ref(exm:NormalTrees), what is the probability that a tree has a diameter *between*\ $5$\ and\ $11$\ inches?


First, *draw* the situation, and *shade* 'between $5$\ and $10$\ inches' (Fig.\ \@ref(fig:MatchDiagrams), Diagram\ C).
Then, *compute* the $z$-scores for *both* tree diameters:

* \makebox[17mm][l]{For $5$ inches:} $\quad  z = (5 - 8.8)/2.7 = -1.41$ (i.e., below the mean).
* \makebox[17mm][l]{For $11$ inches:} $\quad z = (11 - 8.8)/2.7 = 0.81$ (i.e., above the mean).

The tables in Appendix\ \@ref(ZTablesOnline)
can then be used to find the area to the *left* of $z = -1.41$ (which is\ $0.0793$), and also to find the area to the *left* of $z = 0.81$ (which is\ $0.791$).
However, neither of these provide the area *between* $z = -1.41$ and $z = 0.81$.

Looking carefully at the areas from the tables and the area sought, the required area is the *area* between the two $z$-scores (Fig.\ \@ref(fig:ZDBH3)):
$0.7910 - 0.0793 = 0.7117$ (see the animation below).
The probability that a tree has a diameter between\ $5$ and\ $11$\ inches is about\ $0.7117$, or about\ $71$%.
:::
\index{z@$z$-score|)}



<div class="figure" style="text-align: center">
<img src="20-Tools-DistributionsAndModels_files/figure-html/ZDBH3-1.png" alt="What proportion of tree diameters are between $5$ and $11$ inches? Left: the hatched area is the area to the left of $z = -1.41$. Right: the shaded area is the area to the left of $z = 0.81$. Neither give us the area we seek directly." width="100%" />
<p class="caption">(\#fig:ZDBH3)What proportion of tree diameters are between $5$ and $11$ inches? Left: the hatched area is the area to the left of $z = -1.41$. Right: the shaded area is the area to the left of $z = 0.81$. Neither give us the area we seek directly.</p>
</div>

<img src="20-Tools-DistributionsAndModels_files/figure-html/unnamed-chunk-5-.gif" width="672" />


<iframe src="https://learningapps.org/watch?v=p4jq6ujuj22" style="border:0px;width:100%;height:900px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>



## Unstandardising: working backwards {#Unstandardising}
\index{Normal distribution!using tables backwards}\index{Unstandardising formula}

Using the model for tree diameters in Example\ \@ref(exm:NormalTrees) again, different types of questions can be asked too.
Suppose we needed to identify the diameters of the *smallest*\ $3$% of trees.

This is a different type of problem than before; previously, the *tree diameter* was known, so a $z$-score could be computed, and hence a probability (Fig.\ \@ref(fig:WorkingWithZ)).
However, here the *probability* is known, and a tree diameter is sought.
That is, working 'backwards' is necessary (Fig.\ \@ref(fig:WorkingWithZ)), so the $z$-tables need to be used 'backwards' too.


<div class="figure" style="text-align: center">
<img src="20-Tools-DistributionsAndModels_files/figure-html/WorkingWithZ-1.png" alt="Working with $z$-scores. In the tables, the areas (probabilities) are in the body of the table, and the $z$-scores are in the margins of the table." width="90%" />
<p class="caption">(\#fig:WorkingWithZ)Working with $z$-scores. In the tables, the areas (probabilities) are in the body of the table, and the $z$-scores are in the margins of the table.</p>
</div>


Drawing a rough diagram of the situation again is very helpful (Fig.\ \@ref(fig:DBHBackwards)).
We can only mark the approximate location of the required score, but this is sufficient.
Then, tables must be used to determine the corresponding $z$-score.
Since the required value will be smaller than the mean, the $z$-score will be negative (to the *left* of the mean).


<div class="figure" style="text-align: center">
<img src="20-Tools-DistributionsAndModels_files/figure-html/DBHBackwards-1.png" alt="Tree diameters: the smallest\ $3$\% is shaded. The approximate location of the required $z$-score is drawn." width="70%" />
<p class="caption">(\#fig:DBHBackwards)Tree diameters: the smallest\ $3$\% is shaded. The approximate location of the required $z$-score is drawn.</p>
</div>


As before (Sect.\ \@ref(ExactAreasUsingTables)), online tables or hard copy tables can be used (and again the online tables are easier to use).
Only the online tables are explained in this online book (see the hard-copy version for the hard-copy tables, and instructions for their use).




The online tables are found in Appendix \@ref(ZTablesOnline).
In the tables, enter the area to the **left** of the required unknown value in the box `Area.to.left`: the $z$-score with this probability to the left is shown.

<div style="text-align:center;">


```{=html}
<video src="./Movies/HaveAreaFindZ.m4v" width="500" controls="controls" loop="loop" style="padding:2px;border-top:1px gray;border-bottom:1px gray;"></video>
```
</div>


Using online tables, $z$-score of $z = -1.881$.
(The hard-copy tables are less precise, and give $z = -1.88$.)


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Our tables always give the area to the *left* of the $z$-score.
:::


Using either the hard-copy or online tables, the appropriate $z$-value is about\ $-1.88$ standard deviations *below* the mean; that is, $z = -1.88$ (Fig.\ \@ref(fig:DBHBackwards)).
The $z$-score can be converted to an observation value $x$ using the *unstandardising* formula:^[This is found by re-arranging Equation\ \@ref(eq:zscores).]
$$
	x = \mu + z\sigma.
$$
Using this unstandardising formula:
\begin{align*}
	x &= \mu + (z\times\sigma) \\
		&= 8.8 + (-1.88 \times 2.7) = 3.724;
\end{align*}
that is, about $3$% of trees have diameters less than about\ $3.72$ inches.


::: {.definition #UnstandardisingFormula name="Unstandardising formula"}
When the $z$-score is known, the corresponding value of the observation\ $x$ is
\begin{equation}
	x = \mu + z\sigma.
  (\#eq:UnstandardisingFormula)
\end{equation}
This is called the *unstandardising formula*.
:::


::: {.example #LargestPC name="Normal distributions backwards"}
Using the model for tree diameters in Example\ \@ref(exm:NormalTrees) again, suppose now the diameters of the *largest*\ $25$% of trees needs to be identified.

The situation can be drawn (Fig.\ \@ref(fig:DBHBackwards2)).
Since an area is given, we need to work 'backwards', so the $z$-tables need to be used 'backwards' too.
The *largest*\ $25$% implies large trees, so required diameter is larger than the mean (so corresponds to a positive $z$-score). 

The tables work with the area to the *left* of the value of interest, which is\ $75$% (Fig.\ \@ref(fig:DBHBackwards2)).
Using either the hard-copy or online tables, the appropriate $z$-value is $z = 0.674$.
Then, the $z$-score can be converted to an observation value\ $x$ using the *unstandardising* formula:
\begin{align*}
	x &= \mu + (z\times\sigma) \\
		&= 8.8 + (0.674 \times 2.7) = 10.621.
\end{align*}
That is, about\ $25$% of trees have diameters larger than about\ $10.6$\ inches.
:::


<div class="figure" style="text-align: center">
<img src="20-Tools-DistributionsAndModels_files/figure-html/DBHBackwards2-1.png" alt="Tree diameters: the largest $25$\% is the same as the smallest $75$\%." width="65%" />
<p class="caption">(\#fig:DBHBackwards2)Tree diameters: the largest $25$\% is the same as the smallest $75$\%.</p>
</div>


<iframe src="https://learningapps.org/watch?v=poo3x05hn22" style="border:0px;width:100%;height:600px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>



## Example: methane production

@huhtanen2016effects modelled the retention time of food in sheep, using a normal distribution with the mean retention time as $\mu = 42.5\hs$, and the standard deviation as $\sigma = 3.68\hs$.
We can draw this normal distribution (Fig.\ \@ref(fig:RetentionTime)), and then apply the $68$--$95$--$99.7$ rule:

* about\ $68$% of retention times are between\ $38.82$ and\ $46.18\hs$.
* about\ $95$% of retention times are between\ $35.14$ and\ $49.86\hs$.
* about\ $99.7$% of retention times are between\ $31.46$ and\ $53.54\hs$.



<div class="figure" style="text-align: center">
<img src="20-Tools-DistributionsAndModels_files/figure-html/RetentionTime-1.png" alt="Retention times of food in sheep." width="65%" />
<p class="caption">(\#fig:RetentionTime)Retention times of food in sheep.</p>
</div>


::: {.example #Methane1 name="Working with the normal distribution"}
Using this model, what proportion of sheep have a retention time *less than* $40\hs$?
:::


A retention time of\ $40\hs$ corresponds to a $z$-score of (Fig.\ \@ref(fig:RetentionPlots), top left panel):
$$
   z = \frac{40 - 42.5}{3.68} = -0.68.
$$
This is a *negative* number, since $40\hs$ is *below* the mean.
Using the tables in
Appendix\ \@ref(ZTablesOnline)
(that give the *area to the left* of the $z$-score), the area to the left of $z = -0.68$ is\ $0.2483$, or about\ $24.8$%.
About\ $24.8$% of sheep have a retention time *less* than\ $40\hs$.


::: {.example #Methane2 name="Working with the normal distribution"}
What proportion of sheep have a retention time *greater than*\ $48\hs$ (two days)?
:::

A retention time of\ $48\hs$ corresponds to a $z$-score of\ $1.49$.
Using the normal distribution tables, the area to the *left* of this $z$-score is\ $0.9319$, so the area to the *right* of this $z$-score is\ $0.0681$ (Fig.\ \@ref(fig:RetentionPlots), top right panel).


::: {.example #Methane3 name="Working with the normal distribution"}
What proportion of sheep have a retention time *between*\ $40$ and\ $48\hs$?
:::


<div class="figure" style="text-align: center">
<img src="20-Tools-DistributionsAndModels_files/figure-html/RetentionPlots-1.png" alt="Plots for retention times in sheep." width="100%" />
<p class="caption">(\#fig:RetentionPlots)Plots for retention times in sheep.</p>
</div>





A retention time of\ $40\hs$ corresponds to $z = -0.68$ and, using the normal distribution tables, the area to the *left* of $z = -0.68$ is\ $0.2483$ (Fig.\ \@ref(fig:RetentionPlots), bottom left panel; hatched area).
But this is not the area that we seek.
From earlier, the area to the *left* of $z = 1.49$ is\ $0.9319$ (Fig.\ \@ref(fig:RetentionPlots), bottom left panel; shaded region).
But this is not the area we seek either.
From the two areas that we know, we *can* find the area that we seek (Fig.\ \@ref(fig:RetentionPlots), bottom left panel):

* $48\hs$ corresponds to $z = 1.49$; the area to the *left* of this $z$-score is\ $0.9319$.
* $40\hs$ corresponds to $z = -0.68$; the area to the *left* of this $z$-score is\ $0.2483$.
* the *difference* between these two *areas* is sought, which is $0.9319 - 0.2483 = 0.6836$.

So the proportion is about\ $0.684$ (or\ $68.4$%).


::: {.example #Methane4 name="Working with the normal distribution"}
Consider the\ $35$% of sheep with the *shortest* retention times.
What are these retention times?
:::

The time we seek must be *smaller* than the mean if it defines the *shortest*\ $35$% of retention times.
We don't know *exactly* where to draw the retention time that this corresponds to on the diagram; it's just somewhere to the left of the mean (Fig.\ \@ref(fig:RetentionPlots), bottom right panel).

This time, *we know the area to the left*, but we do not know the value (or $z$-score).
This a 'backwards problem', and we need to find the $z$-score 'backwards' (Sect.\ \@ref(Unstandardising)).
From the hard copy tables, a $z$-score of $z = -0.39$ has an area to the left of\ $0.3483$, which is as close as we can get.
(The online tables are more precise: $z = -0.385$.)

We know the $z$-score, so the retention value is found using the unstandardising formula: 
$$
  x = \mu + (z \times \sigma) 
    =  42.5 + (-0.385\times 3.68) = 41.0832.
$$
The retention time is about\ $41.1\hs$.



## Chapter summary {#DistributionModelsSummary}

A *model* is a way of describing the theoretical distribution of some quantitative quantity.
One common model is a *normal model* or *normal distribution*, which is a bell-shaped distribution with a theoretical mean\ $\mu$ and a theoretical standard deviation\ $\sigma$.
Probabilities can be computed from normal distributions using *$z$-scores*, the $68$--$95$--$99.7$ rule, or tables.


## Quick review questions {#DistributionModelsQuickReview}

::: {.webex-check .webex-box}
Consider again the model for tree diameters in Example\ \@ref(exm:NormalTrees) [@data:Aedo1997:softwood]: a normal distribution with $\mu = 8.8$ inches, and $\sigma = 2.7$ inches.

Are the following statements *true* or *false*?

1. A tree diameter of $10.2$\ inches corresponds to a $z$-score of $(10.2 - 8.8)/2.7 = 0.519$. \tightlist  
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
2. The probability that a tree has a diameter *less* than\ $10.2$\ inches is about\ $0.70$.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
3. The probability that a tree has a diameter *greater* than\ $10.2$\ inches is about\ $0.70$.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
4. A tree diameter of $6$\ inches corresponds to a $z$-score of $1.04$.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
5. The probability that a tree has a diameter *less* than $6$\ inches is $0.15$.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
6. The probability that a tree has a diameter *greater* than $6$\ inches is $0.85$.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
:::




## Exercises {#SamplingDistributionsExercises}

[Answers to odd-numbered exercises] are given at the end of the book. 



::: {.exercise #Statements}
Are the following statements *true* or *false*?

1. The unstandardising formula can be used to compute probabilities. \tightlist
   <select class='webex-select'><option value='blank'></option><option value=''>True</option><option value='answer'>False</option></select>
2. About\ $68$% of observations are within two standard deviations of the mean.  
   <select class='webex-select'><option value='blank'></option><option value=''>True</option><option value='answer'>False</option></select>
3. Positive $z$-scores correspond to values larger than the mean.  
   <select class='webex-select'><option value='blank'></option><option value='answer'>True</option><option value=''>False</option></select>
4. A $z$-score tells us how many standard deviations a value is away from the mean.  
   <select class='webex-select'><option value='blank'></option><option value='answer'>True</option><option value=''>False</option></select>
:::


::: {.exercise #StatementsB}
Are the following statements *true* or *false*?

1. A $z$-score larger than\ $4$ is impossible.  
   <select class='webex-select'><option value='blank'></option><option value=''>True</option><option value='answer'>False</option></select>
2. A $z$-score of zero is located at the mean value of the population.  
   <select class='webex-select'><option value='blank'></option><option value='answer'>True</option><option value=''>False</option></select>
3. About\ $5$% of observations are less than two standard deviations below the mean.  
   <select class='webex-select'><option value='blank'></option><option value=''>True</option><option value='answer'>False</option></select>
4. A $z$-score of zero means a calculation error has been made.  
   <select class='webex-select'><option value='blank'></option><option value=''>True</option><option value='answer'>False</option></select>
:::


::: {.exercise #BasiczA}
Determine the probability that an observation is *less* than the following $z$-scores.

:::::: {.cols data-latex=""}
:::: {.col data-latex="{0.4\textwidth}"}
1. $z = 1.84$.
2. $z = -2.09$.
::::
:::: {.col data-latex="{0.05\textwidth}"}
\ 
<!-- an empty Div (with a white space), serving as
a column separator -->
::::
:::: {.col data-latex="{0.5\textwidth}"}
3. $z = -5.34$.
4. $z = 4.25$
::::
::::::
:::


::: {.exercise #BasiczB}
Determine the probability that an observation is *greater* than the following $z$-scores.

:::::: {.cols data-latex=""}
:::: {.col data-latex="{0.4\textwidth}"}
1. $z = -0.48$.
2. $z = 1.03$.
::::
:::: {.col data-latex="{0.05\textwidth}"}
\ 
<!-- an empty Div (with a white space), serving as
a column separator -->
::::
:::: {.col data-latex="{0.5\textwidth}"}
3. $z = -4.00$.
4. $z = 0.00$
::::
::::::
:::


::: {.exercise #SamplingDistributionsGrowthChartA}
Growth charts released by the *World Health Organisation* [@who2006length] showed that girls aged five-years-old with a height of $100\cms$ are said to have a $z$-score of $z = –2$.
What does this mean?
:::


::: {.exercise #SamplingDistributionsGrowthChartB}
Growth charts released by the *World Health Organisation* [@who2006length] showed that girls aged five-years old with a height of $120\cms$ are said to have a $z$-score of $z = +2$.
What does this mean?
:::


::: {.exercise #SamplingDistributionsIQForwards}
IQ scores are
[designed to have](https://en.wikipedia.org/wiki/IQ_classification)
a mean of\ $100$ and a standard deviation of\ $15$.
Match the diagram in Fig.\ \@ref(fig:IQMatchDiagramsForwards) with the meaning.

:::::: {.cols data-latex=""}
:::: {.col data-latex="{0.4\textwidth}"}
1. IQs greater than\ $110$.
2. IQs between\ $90$ and\ $115$.
::::
:::: {.col data-latex="{0.05\textwidth}"}
\ 
<!-- an empty Div (with a white space), serving as
a column separator -->
::::
:::: {.col data-latex="{0.5\textwidth}"}
3. IQs less than\ $110$.
4. IQs greater than\ $85$.
::::
::::::
:::


<div class="figure" style="text-align: center">
<img src="20-Tools-DistributionsAndModels_files/figure-html/IQMatchDiagramsForwards-1.png" alt="Match the diagram with the description." width="100%" />
<p class="caption">(\#fig:IQMatchDiagramsForwards)Match the diagram with the description.</p>
</div>



::: {.exercise #SamplingDistributionsIQBackwards}
IQ scores are
[designed to have](https://en.wikipedia.org/wiki/IQ_classification)
a mean of\ $100$ and a standard deviation of\ $15$.
Match the diagram in Fig.\ \@ref(fig:IQMatchDiagramsBackwards) with the meaning.

:::::: {.cols data-latex=""}

:::: {.col data-latex="{0.4\textwidth}"}
1. The *largest*\ $25$% of IQ scores.
2. The *smallest*\ $10$% of IQ scores.

::::

:::: {.col data-latex="{0.05\textwidth}"}
\ 
<!-- an empty Div (with a white space), serving as
a column separator -->
::::

:::: {.col data-latex="{0.5\textwidth}"}

3. The *largest*\ $70$% of IQ scores.
4. The *smallest*\ $60$% of IQ scores.
::::
::::::

:::


<div class="figure" style="text-align: center">
<img src="20-Tools-DistributionsAndModels_files/figure-html/IQMatchDiagramsBackwards-1.png" alt="Match the diagram with the description." width="100%" />
<p class="caption">(\#fig:IQMatchDiagramsBackwards)Match the diagram with the description.</p>
</div>


::: {.exercise #SamplingDistributionsEmpiricalA}
The $68$--$95$--$99.7$ rule states that *approximately*\ $68$% of observations are within one standard deviation of the mean.
Use the tables in 
Appendix\ \@ref(ZTablesOnline)
to compute a more precise value for the percentage of observations within one standard deviation of the mean.
Comment.
:::



::: {.exercise #SamplingDistributionsEmpiricalB}
The $68$--$95$--$99.7$ rule states that *approximately*\ $95$% of observations are within two standard deviations of the mean.
Use the tables in
Appendix\ \@ref(ZTablesOnline)
to compute a more precise value for the percentage of observations within two standard deviations of the mean.
Comment.
:::


::: {.exercise #SamplingDistributionsTrees}
Consider again the study by @data:Aedo1997:softwood (Example\ \@ref(exm:NormalTrees)), who studied the diameter of trees in certain forests.
The tree diameters can be modelled as having a normal distribution, with a mean of $\mu = 8.8$ inches, and a standard deviation of $\sigma = 2.7$ inches.
Using this model, answer these questions.

1. What is the probability that a tree will have a diameter *less than*\ $8$\ inches?
1. What is the probability that a tree will have a diameter *greater than*\ $9$\ inches?
1. What is the probability that a tree will have a diameter *between*\ $7$ and\ $10$\ inches?
1. The largest\ $15$% of trees have what diameters?
1. The smallest\ $25$% of trees have what diameters?
:::


::: {.exercise #CornSeeds}
@pasha2016effect simulated methods for coating corn seeds (with fertiliser and crop protection chemicals, etc.).
The seed diameter was modelled with a normal distribution, with mean\ $7.5\mms$ and standard deviation of\ $0.225\mms$.
Using this model, answer these questions.

1. What is the probability that a seed has a diameter of more than $8\mms$?\tightlist  
  <div class='webex-radiogroup' id='radio_PDLZSZXJPL'><label><input type="radio" autocomplete="off" name="radio_PDLZSZXJPL" value=""></input> <span>About 2.22</span></label><label><input type="radio" autocomplete="off" name="radio_PDLZSZXJPL" value="answer"></input> <span>About 1.3%</span></label><label><input type="radio" autocomplete="off" name="radio_PDLZSZXJPL" value=""></input> <span>About 98.7%</span></label></div>

 2. What is the probability that a seed has a diameter less than $7.1\mms$?  
  <div class='webex-radiogroup' id='radio_DKKLSWVOIZ'><label><input type="radio" autocomplete="off" name="radio_DKKLSWVOIZ" value=""></input> <span>About 96.3%</span></label><label><input type="radio" autocomplete="off" name="radio_DKKLSWVOIZ" value="answer"></input> <span>About 3.8%</span></label><label><input type="radio" autocomplete="off" name="radio_DKKLSWVOIZ" value=""></input> <span>About -1.78</span></label></div>

3. What is the probability that a seed has a diameter between $7.5$ and $8\mms$?  
  <div class='webex-radiogroup' id='radio_SSOXVPPRGU'><label><input type="radio" autocomplete="off" name="radio_SSOXVPPRGU" value=""></input> <span>About 0.89</span></label><label><input type="radio" autocomplete="off" name="radio_SSOXVPPRGU" value="answer"></input> <span>About 48.7%</span></label><label><input type="radio" autocomplete="off" name="radio_SSOXVPPRGU" value=""></input> <span>About 2.22</span></label><label><input type="radio" autocomplete="off" name="radio_SSOXVPPRGU" value=""></input> <span>About 50%</span></label><label><input type="radio" autocomplete="off" name="radio_SSOXVPPRGU" value=""></input> <span>About 98.7%</span></label></div>

4. What is the diameter of the smallest $30$% of seeds?  
  <div class='webex-radiogroup' id='radio_FYTYNVNLTO'><label><input type="radio" autocomplete="off" name="radio_FYTYNVNLTO" value=""></input> <span>Smaller than about 7.62mm</span></label><label><input type="radio" autocomplete="off" name="radio_FYTYNVNLTO" value=""></input> <span>Larger than about 7.38mm</span></label><label><input type="radio" autocomplete="off" name="radio_FYTYNVNLTO" value=""></input> <span>About -0.524</span></label><label><input type="radio" autocomplete="off" name="radio_FYTYNVNLTO" value="answer"></input> <span>Smaller than about 7.38mm</span></label></div>

5. What is the diameter of the largest $90$% of the seeds?  
  <div class='webex-radiogroup' id='radio_QGOZXKVMNY'><label><input type="radio" autocomplete="off" name="radio_QGOZXKVMNY" value=""></input> <span>Less than about 7.79mm</span></label><label><input type="radio" autocomplete="off" name="radio_QGOZXKVMNY" value=""></input> <span>Larger than about 7.79mm</span></label><label><input type="radio" autocomplete="off" name="radio_QGOZXKVMNY" value=""></input> <span>Less than about 7.21mm</span></label><label><input type="radio" autocomplete="off" name="radio_QGOZXKVMNY" value="answer"></input> <span>**Larger** than about 7.21mm</span></label><label><input type="radio" autocomplete="off" name="radio_QGOZXKVMNY" value=""></input> <span>About -1.28</span></label></div>

:::



::: {.exercise #SamplingDistributionsGestationLength}
@snowden2018causal studied factors influencing preterm births.
They modelled the gestation length of healthy babies with a normal distribution, having a mean of\ $40$\ weeks, and a standard deviation of\ $1.64$\ weeks.
Using this model, answer these questions.

1. What proportion of births are *longer* than $39$\ weeks (that is, nine months)?
1. In Australia, 
[a premature birth is defined as a birth occuring before $37$ weeks](https://www.pregnancybirthbaby.org.au/premature-baby).
   What proportion of births are expected to be premature?
1. According to
[*Health Direct*](https://www.pregnancybirthbaby.org.au/premature-baby),
   'Babies born between\ $32$ and\ $37$ weeks may need care in a special care nursery'.
   What proportion of healthy births would be expected to be born between\ $32$ and\ $37$ weeks gestation? 
1. How long is the gestation length for the *longest*\ $5$% of pregnancies?
1. How long is the gestation length for the *shortest*\ $10$% of pregnancies?
:::




::: {.exercise #SamplingDistributionsBridgesTrucks}
A new method for evaluating bridge loads [@obrien2018probabilistic] used a simulation to compare the new method to an existing method. 
For the simulation, they modelled the gross vehicle mass (GVM) of trucks as having a normal distribution, with a mean of\ $13$\ tonnes and a standard deviation of\ $1.3$\ tonnes.

The Isuzu F-Series trucks in 2025 were rated as having a GVM between\ $10.7$ and\ $26.0$ tonnes (depending on the configuration).

1. What is the $z$-score for the lower limit of\ $10.7$ tonnes? 
1. What is the $z$-score for the upper limit of\ $26.0$ tonnes? 
1. What does a negative $z$-score mean in this context?
:::


::: {.exercise #SamplingDistributionsIQs}
IQ scores are
[designed to have](https://en.wikipedia.org/wiki/IQ_classification)
a mean of\ $100$ and a standard deviation of\ $15$.
[Mensa](https://www.mensa.org/)
is a society for people with a high IQ; specifically, for people who have 'attained a score within the upper two percent of the general population' (Mensa webpage: https://www.mensa.org/).
What IQ score is needed to join Mensa?
:::


::: {.exercise #SamplingDistributionsIQsMilitary}
IQ scores are
[designed to have](https://en.wikipedia.org/wiki/IQ_classification)
a mean of\ $100$ and a standard deviation of\ $15$.
@data:Zagorsky2016:Blondes reports that the US Military must 'reject all military recruits whose IQ is in the bottom\ $10$% of the population' (@data:Zagorsky2016:Blondes, p.\ 403).
What IQs scores lead to a rejection from the US military?
:::


::: {.exercise #SamplingDistributionsChargingEVs}
A study of the impact of charging electric vehicles (EVs) on electricity demands [@affonso2018probabilistic] modelled the *time* at which people began charging their EVs at home.
Based on a survey [@us20112009], they modelled the time at which EVs began charging as having a mean of\ $5$:$30$pm, with a standard deviation of\ $2.28\hs$.
For this model:

1. What is the probability that an EV will begin charging after\ $9$pm?
1. What is the probability that an EV will begin charging before\ $5$pm?
1. What is the probability that an EV will begin charging between\ $5$pm and\ $6$pm?
1. $30$% of the EVs begin charging after what time?
1. The earliest\ $15$% of charging begins when?
  
*Hint:* this question is easier if you convert times into 'minutes after\ $5$:$30$'.
:::




<!-- QUICK REVIEW ANSWERS -->
<!--
::: {.EOCanswerBox .EOCanswer data-latex="{iconmonstr-check-mark-14-240.png}"}
**Answers to *Quick review* questions:**
**1.** True.
**2.** True.
**3.** False: $1 - 0.70 = 0.30$.
**4.** False: $z = -1.04$.
**5.** True.
**6.** True.
:::
-->

