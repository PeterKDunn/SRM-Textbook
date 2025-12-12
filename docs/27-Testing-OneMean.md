# Hypothesis tests: one mean {#TestOneMean}


<!-- Introductions; easier to separate by format -->

::: {.objectivesBox .objectives data-latex="{iconmonstr-target-4-240.png}"}
You have learnt to ask an RQ, design a study, classify and summarise the data, construct confidence intervals, and perform a hypothesis test for one proportion.
**In this chapter**, you will learn to:

* identify situations where conducting a test for a mean is appropriate.
* conduct hypothesis tests for one sample mean, using a $t$-test.
* determine whether the conditions for using these methods apply in a given situation.
:::

<img src="27-Testing-OneMean_files/figure-html/unnamed-chunk-7-1.png" width="65%" height="33%" style="display: block; margin: auto;" />




<!-- Define colours as appropriate -->





## Introduction: body temperatures {#BodyTemperature}
\index{Hypothesis testing!one mean|(}




<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/pexels-anna-shvets-3987141.jpg" width="200px"/>
</div>


The average internal body temperature is commonly believed to be $37.0$^o^C ($98.6$^o^F).
This value is based on data over\ $150$ years old [@data:Wunderlich:BodyTemp].
Since then, the methods for measuring internal body temperature have changed substantially:

> Thermometers used by Wunderlich were cumbersome, had to be read in situ, and, when used for axillary measurements [i.e., under the armpit]... required $15$ to\ $20\mins$ to equilibrate.
> Today's thermometers are smaller and more reliable and equilibrate more rapidly.
> In addition, the mouth and rectum have replaced the axilla [armpit] as the preferred sites for monitoring body temperature.
>
> --- @data:mackowiak:bodytemp, p. 1579

For this reason, the reported internal body temperature (recorded by newer instruments, in different locations) may have changed since the 1860s.
Therefore, we could ask:

> Is the *population* mean internal body temperature equal to $37.0$^o^C?

A *decision* is sought about the value of the *population* mean body temperature.
Presumably, the intended population is all people, though the population, in practice, may depend on what population is represented by the available data.

The population mean internal body temperature will never be known: the internal body temperature of every person alive would need to be measured, and even those not yet born.
A *sample* must be studied.

Define the parameter as $\mu$, the population mean internal body temperature (in ^o^C).
A *sample* of people can be used to determine if evidence exists that the *population* mean internal body temperature is not $37.0$^o^C,\index{Mean!of a population} using the decision-making process (Sect.\ \@ref(DecisionMaking)).


## Assumptions: hypotheses {#TestpObsDecisionHypotheses}

**Step\ 1** of the decision-making process is to *assume* a value for the parameter.
The established claim is that the population mean internal body temperature is $37.0$^o^C, so we assume this value.
This assumption becomes the null hypothesis: 
$$
   \text{$H_0$: } \mu = 37.0.
$$
If the *sample* mean is not $37.0$^o^C, this hypothesis proposes that the discrepancy is due to sampling variation.

The RQ asks if the *population* mean internal body temperate $\mu$ is *equal* to $37.0$^o^C, or if it has *changed*.
The RQ does not specifically ask if $\mu$ is smaller than $37.0$^o^C, or larger than  $37.0$^o^C.
This means the alternative hypothesis is two-tailed:
$$
   \text{$H_1$: } \mu \ne 37.0.
$$


## Expectations: sampling distribution for $\bar{x}$ {#SamplingDistSampleMeanHT}
\index{Sampling distribution!one mean}

**Step\ 2** of the decision-making process is to describe what values of the statistic (in this case, the sample mean $\bar{x}$) can be expected if the value of $\mu$ is assumed to be $37.0$ (the value specified in $H_0$).
In other words, the *sampling distribution* of $\bar{x}$ needs to be described. 

The sample mean *varies* from sample to sample, and varies with a normal distribution (whose standard deviation is called the *standard error*) under certain conditions (given in Sect.\ \@ref(ValiditySampleMeanTest)).
The sampling distribution of\ $\bar{x}$ was described in Sect.\ \@ref(SamplingDistSampleMean), and repeated below.


::: {.definition #DEFSamplingDistributionXbarHT name="Sampling distribution of a sample mean"}
When the *population* standard deviation is unknown, the *sampling distribution of the sample mean* is (when certain conditions are met; Sect.\ \@ref(ValiditySampleMean)) described by:

* an approximate normal distribution,
* centred around a sampling mean whose value is $\mu$,
* with a standard deviation (called the *standard error of the mean*), denoted\ $\text{s.e.}(\bar{x})$, whose value is
\begin{equation}
   \text{s.e.}(\bar{x}) = \frac{s}{\sqrt{n}},
   (\#eq:stderrorxbarHT)
\end{equation}
where\ $n$ is the size of the sample, and\ $s$ is the sample standard deviation of the observations. 
:::


The mean of this sampling distribution---the *sampling mean*---has the value $\mu$.
The standard deviation of this sampling distribution is called the *standard error of the sample means*, denoted $\text{s.e.}(\bar{x})$.
When the *population* standard deviation\ $\sigma$ is *unknown*, the value of the standard error happens to be (see Equation\ \@ref(eq:stderrorxbarHT))
$$
  \text{s.e.}(\bar{x}) = \frac{s}{\sqrt{n}}.
$$

@data:mackowiak:bodytemp gathered body-temperature data for $n = 130$ people, collated by @data:Shoemaker1996:Temperature
(Fig.\ \@ref(fig:DataBodyTemp); Fig.\ \@ref(fig:BodyTempHist)).
The data all come from

> ... volunteers participating in Shigella vaccine trials conducted at the University of Maryland Center for Vaccine Development, Baltimore...
>
> --- @data:mackowiak:bodytemp, p. 1578

Hence, the population for the study (and RQ) should be redefined accordingly.
From software output (Fig.\ \@ref(fig:BodyTempjamovi)), the *sample* mean is $\bar{x} = 36.8052$^o^C\index{Mean!of a sample} and the *sample* standard deviation is $s = 0.4073$^o^C.
Using this value of $s$, the sampling distribution of\ $\bar{x}$ can be described, if\ $\mu$ really was\ $37.0$:

* an approximate normal distribution,
* with a sampling mean whose value is $\mu = 37.0$ (from\ $H_0$),
* with a standard deviation of $\text{s.e.}(\bar{x}) = s/\sqrt{n} = 0.4073/\sqrt{130} = 0.0357$ (as in the output).


\begin{figure}
\begin{minipage}{0.42\textwidth}
\captionof{table}{The body temperature data: the first nine and last nine of the $130$ ordered observations\label{tab:DataBodyTemp}.}
\fontsize{8}{12}\selectfont

\end{minipage}
\hspace{0.05\textwidth}
\begin{minipage}{0.51\textwidth}%
\centering
<img src="27-Testing-OneMean_files/figure-html/unnamed-chunk-5-1.png" width="95%" />
\caption{The histogram of the body temperature data\label{fig:BodyTempHist}.}
\end{minipage}
\end{figure}



<div class="figure" style="text-align: center">

```{=html}
<div class="datatables html-widget html-fill-item" id="htmlwidget-ca58f7fbb623e0657c25" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-ca58f7fbb623e0657c25">{"x":{"filter":"none","vertical":false,"data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130"],[96.3,96.7,96.90000000000001,97,97.09999999999999,97.09999999999999,97.09999999999999,97.2,97.3,97.40000000000001,97.40000000000001,97.40000000000001,97.40000000000001,97.5,97.5,97.59999999999999,97.59999999999999,97.59999999999999,97.7,97.8,97.8,97.8,97.8,97.90000000000001,97.90000000000001,98,98,98,98,98,98,98.09999999999999,98.09999999999999,98.2,98.2,98.2,98.2,98.3,98.3,98.40000000000001,98.40000000000001,98.40000000000001,98.40000000000001,98.5,98.5,98.59999999999999,98.59999999999999,98.59999999999999,98.59999999999999,98.59999999999999,98.59999999999999,98.7,98.7,98.8,98.8,98.8,98.90000000000001,99,99,99,99.09999999999999,99.2,99.3,99.40000000000001,99.5,96.40000000000001,96.7,96.8,97.2,97.2,97.40000000000001,97.59999999999999,97.7,97.7,97.8,97.8,97.8,97.90000000000001,97.90000000000001,97.90000000000001,98,98,98,98,98,98.09999999999999,98.2,98.2,98.2,98.2,98.2,98.2,98.3,98.3,98.3,98.40000000000001,98.40000000000001,98.40000000000001,98.40000000000001,98.40000000000001,98.5,98.59999999999999,98.59999999999999,98.59999999999999,98.59999999999999,98.7,98.7,98.7,98.7,98.7,98.7,98.8,98.8,98.8,98.8,98.8,98.8,98.8,98.90000000000001,99,99,99.09999999999999,99.09999999999999,99.2,99.2,99.3,99.40000000000001,99.90000000000001,100,100.8],[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2],[70,71,74,80,73,75,82,64,69,70,68,72,78,70,75,74,69,73,77,58,73,65,74,76,72,78,71,74,67,64,78,73,67,66,64,71,72,86,72,68,70,82,84,68,71,77,78,83,66,70,82,73,78,78,81,78,80,75,79,81,71,83,63,70,75,69,62,75,66,68,57,61,84,61,77,62,71,68,69,79,76,87,78,73,89,81,73,64,65,73,69,57,79,78,80,79,81,73,74,84,83,82,85,86,77,72,79,59,64,65,82,64,70,83,89,69,73,84,76,79,81,80,74,77,66,68,77,79,78,77],[35.722,35.944,36.056,36.111,36.167,36.167,36.167,36.222,36.278,36.333,36.333,36.333,36.333,36.389,36.389,36.444,36.444,36.444,36.5,36.556,36.556,36.556,36.556,36.611,36.611,36.667,36.667,36.667,36.667,36.667,36.667,36.722,36.722,36.778,36.778,36.778,36.778,36.833,36.833,36.889,36.889,36.889,36.889,36.944,36.944,37,37,37,37,37,37,37.056,37.056,37.111,37.111,37.111,37.167,37.222,37.222,37.222,37.278,37.333,37.389,37.444,37.5,35.778,35.944,36,36.222,36.222,36.333,36.444,36.5,36.5,36.556,36.556,36.556,36.611,36.611,36.611,36.667,36.667,36.667,36.667,36.667,36.722,36.778,36.778,36.778,36.778,36.778,36.778,36.833,36.833,36.833,36.889,36.889,36.889,36.889,36.889,36.944,37,37,37,37,37.056,37.056,37.056,37.056,37.056,37.056,37.111,37.111,37.111,37.111,37.111,37.111,37.111,37.167,37.222,37.222,37.278,37.278,37.333,37.333,37.389,37.444,37.722,37.778,38.222]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>BodyTemp<\/th>\n      <th>Gender<\/th>\n      <th>HeartRate<\/th>\n      <th>BodyTempC<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"searching":false,"columnDefs":[{"className":"dt-right","targets":[1,2,3,4]},{"orderable":false,"targets":0},{"name":" ","targets":0},{"name":"BodyTemp","targets":1},{"name":"Gender","targets":2},{"name":"HeartRate","targets":3},{"name":"BodyTempC","targets":4}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```

<p class="caption">(\#fig:DataBodyTemp)The body temperature data.</p>
</div>

<!-- The figure for LaTeX is in the minipage (combined with data table), so only need show it for the HTML -->

<div class="figure" style="text-align: center">
<img src="27-Testing-OneMean_files/figure-html/BodyTempHist-1.png" alt="The histogram of the body temperature data." width="50%" />
<p class="caption">(\#fig:BodyTempHist)The histogram of the body temperature data.</p>
</div>




<div class="figure" style="text-align: center">
<img src="jamovi/BodyTemp/BodyTemp-Summary.png" alt="The software output summary for the body temperature data." width="65%" />
<p class="caption">(\#fig:BodyTempjamovi)The software output summary for the body temperature data.</p>
</div>


A picture of this sampling distribution (Fig.\ \@ref(fig:BodyTempSamplingDist)) shows how the sample mean varies when $n = 130$, for all possible samples when $\mu = 37.0$.
For example, the value of\ $\bar{x}$ will be *larger* than\ $37.0357$^o^C about\ $16$% of the time (using the $68$--$95$--$99.7$ rule) if\ $\mu$ really is\ $37.0$.


<div class="figure" style="text-align: center">
<img src="27-Testing-OneMean_files/figure-html/BodyTempSamplingDist-1.png" alt="The distribution of sample mean body temperatures, if the population mean is $37.0^\circ$C and $n = 130$. The grey vertical lines are\ $1$,\ $2$ and\ $3$ standard deviations from the mean." width="95%" />
<p class="caption">(\#fig:BodyTempSamplingDist)The distribution of sample mean body temperatures, if the population mean is $37.0^\circ$C and $n = 130$. The grey vertical lines are\ $1$,\ $2$ and\ $3$ standard deviations from the mean.</p>
</div>




<iframe src="https://learningapps.org/watch?v=p28qr801322" style="border:0px;width:100%;height:600px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>


## Observations: $t$-score {#Tscores}
\index{Test statistic!t@$t$-score}

**Step\ 3** of the decision-making process is to evaluate the observations.
Locating $\bar{x} = 36.8052$ on the sampling distribution (Fig.\ \@ref(fig:BodyTempSamplingDistT)) shows that this observed sample mean is, relatively speaking, *extremely* low: a sample mean this low is very unlikely to occur in any sample of $n = 130$ when $\mu = 37.0$.
How many standard deviations is\ $\bar{x}$ away from $\mu = 37.0$?
Compute:
$$
  \frac{\text{statistic} - \text{mean of the distribution}}{\text{std dev. of the distribution}}   
  =
  \frac{36.8052 - 37.0}{0.035724} = -5.453.
$$
This is like a $z$-score: it measures the number of standard deviations that the value is from the mean.
However, it is not a $z$-score; it is a $t$-score.
Both $t$- and $z$-scores measure *the number of standard deviations that a value is from the mean*.
Here the value is a $t$-score, because the *population* standard deviation\ $\sigma$ is unknown, and the *sample* standard deviation is used instead to compute $\text{s.e.}(\bar{x})$.


::: {.tipBox .tip data-latex="{iconmonstr-info-6-240.png}"}
Like $z$-scores, $t$-scores measure the number of standard deviations that a value is from the mean of the distribution.
:::


<div class="figure" style="text-align: center">
<img src="27-Testing-OneMean_files/figure-html/BodyTempSamplingDistT-1.png" alt="The sample mean of $\bar{x} = 36.8041^\circ$C is very unlikely to be observed in any sample of size $n = 130$, if $\mu = 37.0^\circ$C.\spacex The standard deviation of the distribution is $\text{s.e.}(\bar{x}) = 0.035724$." width="85%" />
<p class="caption">(\#fig:BodyTempSamplingDistT)The sample mean of $\bar{x} = 36.8041^\circ$C is very unlikely to be observed in any sample of size $n = 130$, if $\mu = 37.0^\circ$C.\spacex The standard deviation of the distribution is $\text{s.e.}(\bar{x}) = 0.035724$.</p>
</div>



The calculation is therefore:
$$
   t = \frac{36.8052 - 37.0}{0.035724} = -5.453.
$$
The observed sample mean is *more than five standard deviations below the population mean*, which is highly unusual based on the $68$--$95$--$99.7$ rule (Fig.\ \@ref(fig:BodyTempSamplingDistT)).
This is very persuasive evidence that $\mu$ is not $37.0$.

In general, when the sampling distribution has an approximate normal distribution and the *sample* standard deviation is used to compute the standard error, the $t$-score is 
\begin{equation}
   t 
   = 
   \frac{\text{sample statistic} - \text{mean of the sampling distribution}}
        {\text{standard error of the sampling distribution}}
   =
   \frac{\bar{x} - \mu}{\text{s.e.}(\bar{x})}.
   (\#eq:tscore)
\end{equation}


<iframe src="https://learningapps.org/watch?v=pi8jnzhu322" style="border:0px;width:100%;height:500px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>



## Decision: $P$-value {#Pvalues}

As seen in Sect.\ \@ref(TestpObsDecisionPvalues), a $P$-value quantifies how unusual the observed sample statistic is, after assuming $H_0$ is true.
Since $t$-scores and $z$-scores are very similar, the $P$-value can be *approximated* using the $68$--$95$--$99.7$ rule and a diagram, or *approximated* using $z$-tables 
(Appendix\ \@ref(ZTablesOnline)).
Usually, however, software is used to compute the $P$-value.\index{Software output!one mean}
$t$-scores and $z$-scores with the same value produce almost the same $P$-values, except for small sample sizes.

Both methods produce approximate $P$-values only, since the approximations are based on using $z$-scores rather than $t$-scores.
Usually, software is used to determine precise $P$-values for $t$-scores (Fig.\ \@ref(fig:BodyTempTestjamovi)).\index{Software output!one mean}
The output (under the heading `p`) shows that the $P$-value is indeed very small: less than\ $0.001$ (written $P < 0.001$).


::: {.tipBox .tip data-latex="{iconmonstr-info-6-240.png}"}
Some software reports a $P$-value of\ `0.000`, which really means that the $P$-value is zero to three decimal places.
Since $P$-values can never be exactly zero, we should write $P < 0.001$: that is, the $P$-value is *smaller* than\ $0.001$.
:::


This $P$-value means that, if $\mu = 37.0$, a sample mean as low as\ $36.8052$ would be *very* unusual to observe (from a sample size of $n = 130$). 
And yet, we did.
Using the decision-making process, this implies that the initial assumption (i.e., $H_0$) is contradicted by the data: we observed something extremely unlikely if $\mu = 37.0$.
That is, there is very persuasive evidence that the *population* mean body temperature is *not*\ $37.0$^o^C.


<div class="figure" style="text-align: center">
<img src="jamovi/BodyTemp/BodyTempTtest.png" alt="Software output for conducting the $t$-test for the body temperature data." width="65%" />
<p class="caption">(\#fig:BodyTempTestjamovi)Software output for conducting the $t$-test for the body temperature data.</p>
</div>


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
For *one-tailed tests*, the $P$-value is *half* the value of the two-tailed $P$-value.
:::


As seen in Sect.\ \@ref(TestpObsDecisionPvalues), $P$-values measure the probability of observing the sample statistic (or something more extreme), assuming the population parameter is the value given in\ $H_0$.
For the body-temperature data then, where $P < 0.001$, the $P$-value is *very* small, so *very strong evidence* exists that the population mean body temperature is not\ $37.0$^o^C.


## Writing conclusions

Communicating the results of any hypothesis test requires an *answer to the RQ*, a summary of the *evidence* used to reach that conclusion (such as the $t$-score and $P$-value, stating if the $P$-value is one- or two-tailed), and some *sample summary information* (including a CI).
For the body-temperature example, write:

> The sample provides very strong evidence ($t = -5.45$; two-tailed $P < 0.001$) that the population mean body temperature is *not*\ $37.0$^o^C ($\bar{x} = 36.81$; $95$% CI: $36.73$ to\ $36.88$^o^C; $n = 130$).

This statement contains the three components.

1. The *answer to the RQ*:
   the sample provides very strong evidence that the population mean body temperature is not\ $37.0$^o^C.
   The alternative hypothesis is two-tailed, so the conclusion is that the population mean body temperature is *not equal to* \ $37.0$^o^C.
2. The *evidence* used to reach the conclusion: $t = -5.45$; two-tailed  $P < 0.001$.
3. Some *sample summary information*: the sample mean (with the CI) and the sample size.

The test is about the *mean* internal body temperature; *individuals* have internal body temperatures ranging from\ $35.722$^o^C to\ $38.222$^o^C.\index{Range}

The difference between the value of $37.0$^o^C and the sample mean of $36.81$^o^C is small in absolute terms, and is probably of little practical importance for most applications.\index{Practical importance}
Notice that the CI does *not* include the value of $\mu = 37.0$.


## Process overview {#TestSummary}

Let's recap the decision-making process for this body temperatures (Fig.\ \@ref(fig:DecisionFlowTemps)) example:

1. *Assumption*.
   Write the *null hypothesis* about the parameter (based on the RQ): $H_0$: $\mu = 37.0$. 
   In addition, write the *alternative hypothesis*: $H_1$: $\mu \ne 37.0$. 
   (This alternative hypothesis is two-tailed.)
2. *Expectation*. 
   The *sampling distribution* describes what to expect from the statistic *if* the null hypothesis is true.
   The sampling distribution is an approximate normal distribution.
3. *Observation*. 
   Compute the $t$-score: $t = -5.45$. 
   The $t$-score can be computed by software, or using the general equation in Equation\ \@ref(eq:tscore).
4. *Decision*.
   Determine if the data are *consistent* with the assumption, by computing the $P$-value.
   Here, the $P$-value is much smaller than\ $0.001$.
   The $P$-value can be computed by software, or approximated using the $68$--$95$--$99.7$ rule.
   The *conclusion* is that there is very strong evidence that\ $\mu$ is not\ $37.0$.


<div class="figure" style="text-align: center">
<img src="27-Testing-OneMean_files/figure-html/DecisionFlowTemps-1.png" alt="The decison-making process for the body-temperature data." width="100%" />
<p class="caption">(\#fig:DecisionFlowTemps)The decison-making process for the body-temperature data.</p>
</div>




## Statistical validity conditions {#ValiditySampleMeanTest}
\index{Statistical validity (for inference)!one mean}

All hypothesis tests have underlying conditions to be met so that the results are statistically valid.
For a test of one mean, this means that the sampling distribution must have an approximate normal distribution so that $P$-values can be found.

The test for a single mean is *statistically valid* if *either* of these is true:

* when $n \ge 25$.
  (If the distribution of the data is highly skewed, the sample size may need to be larger.)
* when $n < 25$, *and* the sample data come from a *population* with a normal distribution.

The sample size of\ $25$ is a rough figure; some books give other values (such as\ $30$).

This condition ensures that the *distribution of the sample means has an approximate normal distribution* (so that, for example, the $68$--$95$--$99.7$ rule can be used).
Provided the sample size is larger than about $25$, this will be approximately true *even if* the distribution of the individuals in the population does not have a normal distribution.
That is, when $n \ge 25$ the sample means generally have an approximate normal distribution, even if the data themselves do not have a normal distribution.
The units of analysis are also assumed to be *independent* (e.g., from a simple random sample).

If the statistical validity conditions are not met, other similar options include a sign test\index{Sign test} or a Wilcoxon signed-rank test\index{Wilcoxon signed ranks test} [@conover2003practical], or using resampling methods [@efron2021computer].


::: {.example #StatisticalValidityTemps name="Statistical validity"}
The hypothesis test regarding body temperature is statistically valid since the sample size is larger than\ $25$ ($n = 130$).
(The data, as displayed in Fig.\ \@ref(fig:BodyTempHist), do *not* need to come from a population with a normal distribution.)
:::
\index{Hypothesis testing!one mean|)}


## Example: student IQs {#IQstudents}

Standard IQ scores are designed to have a mean in the general population of\ $\mu = 100$.
Researchers at Griffith University (GU) asked:

> For students at Griffith University, is the mean IQ higher than\ $100$?
  
The parameter is $\mu$, the population mean IQ for students at GU.\spacex

To answer this RQ, @reilly2022gender studied $n = 224$ students at Griffith University (GU), finding a sample mean IQ of\ $111.19$ and a standard deviation of\ $14.21$. 
Is this evidence that GU students have a *higher* mean IQ than the general population?
The hypotheses are:
$$
   \text{$H_0$: $\mu = 100 \qquad \text{and} \qquad H_1$: $\mu > 100$.}
$$
This test is *one-tailed*, since the RQ asks if the mean IQ of GU students is *greater* than\ $100$, the one-tailed $P$-value will be in the tail corresponding to *larger* IQ scores (i.e., to the right of the mean).
(Writing $H_0$: $\mu\le 100$ is also correct (and equivalent), though the test still proceeds as though $\mu = 100$, the largest option permitted by $\mu\le100$.)

We do not have the original data, but the summary information is sufficient: $\bar{x} = 111.19$ with $s = 14.21$ from a sample of size $n = 224$. 
The *sample* mean is higher than $100$, but since sample means vary, the difference may be just due to sampling variation.
The sample means vary with a normal distribution, with mean\ $100$ and a standard deviation of
$$
   \text{s.e.}(\bar{x}) = \frac{s}{\sqrt{n}} = \frac{14.21}{\sqrt{224}} = 0.94945.
$$
The $t$-score is
$$
   t = \frac{\bar{x} - \mu}{\text{s.e.}(\bar{x})} = \frac{111.19 - 100}{0.94945} = 11.786.
$$

This $t$-score is *huge*: a sample mean as large as\ $111.19$ would be highly unlikely to occur in any sample of size $n = 224$, simply by sampling variation, if the population mean really was\ $100$.
Since the alternative hypothesis is *one-tailed*, and $\mu > 100$ specifically, the $P$-value is the area in the right-side tail of the distribution only (Fig.\ \@ref(fig:IQSamplingDistribution)); it will be extremely small.
This is very persuasive evidence to support the alternative hypothesis.

   
<div class="figure" style="text-align: center">
<img src="27-Testing-OneMean_files/figure-html/IQSamplingDistribution-1.png" alt="The sampling distribution for the IQ data. The RQ is one-tailed so the $P$-value is the area in one tail." width="95%" />
<p class="caption">(\#fig:IQSamplingDistribution)The sampling distribution for the IQ data. The RQ is one-tailed so the $P$-value is the area in one tail.</p>
</div>


We conclude:

> Very strong evidence exists in the sample ($t = 11.78$; one-tailed $P < 0.001$) that the population mean IQ in students at Griffith University is greater than\ $100$ (mean $111.19$; $95$% CI: $109.29$ to\ $113.09$; $n = 224$).

The test is about the *mean* IQ; *individual* students may have IQs less than $100$.

Since the sample size is much larger than\ $25$, this conclusion is *statistically valid*.
The sample is not a random sample from the population of all GU students (the students are mostly first-year, undergraduate psychological science students). 
However, these students may be somewhat representative of all GU students.
In any case, the results probably apply to first-year, undergraduate psychological science students at GU. 

The difference between the general population IQ of\ $100$ and the sample mean IQ of GU students is only small: about\ $11$ IQ units (less than one standard deviation).
Possibly, this difference has very little practical importance,\index{Practical importance} even though the statistical evidence suggests that the difference cannot be explained by chance.

IQ scores are designed to have a standard deviation of $\sigma = 15$ in the general population.
If this applies for university students too (and we do not know if it does), the standard error is $\text{s.e.}(\bar{x}) = \sigma/\sqrt{n} = 15/\sqrt{130} = 1.0022$, and the test-statistic is then a $z$-score:
$$
  z = \frac{\bar{x} - \mu}{\text{s.e.}(\bar{x})} = \frac{111.19 - 100}{1.0022} = 11.87.
$$
The conclusions do not change: the $P$-value is still extremely small.


## Chapter summary {#Chap27-Summary}

These steps are used to test a hypothesis about a population mean $\mu$.

* Write the null hypothesis ($H_0$) and the alternative hypothesis ($H_1$); initially *assume* the value of $\mu$ in the null hypothesis to be true.
* Describe the *sampling distribution*, which describes what to *expect*  from the sample mean based on this assumption: under certain statistical validity conditions, the sample mean varies with:
   *  an approximate normal distribution,
   *  with sampling mean whose value is the value of $\mu$ (from $H_0$), and
   *  having a standard deviation of $\displaystyle \text{s.e.}(\bar{x}) =\frac{s}{\sqrt{n}}$.
* Compute the value of the *test statistic*:
$$
   t = \frac{ \bar{x} - \mu}{\text{s.e.}(\bar{x})},
$$
where $\mu$ is the hypothesised value given in the null hypothesis.
* The $t$-value is like a $z$-score, and so an approximate *$P$-value* can be estimated using the $68$--$95$--$99.7$ rule or tables, or found using software.
  Use the $P$-value to make a decision, and write a conclusion.
* Check the statistical validity conditions.


The following short video may help explain some of these concepts:


<iframe width="560" height="315" src="https://www.youtube.com/embed/ZbJ58Ag22Mw" frameborder="0" allow="accelerometer; encrypted-media; gyroscope; picture-in-picture"></iframe>


## Quick review questions  {#Chap32-QuickReview}


::: {.webex-check .webex-box}
The usual recommendation for a safe gap between travelling vehicles in traffic (a 'headway') is *at least* $1.9\secs$ (often rounded to\ $2\secs$ for the public).
@majeed2014field studied $n = 28$ streams of traffic in Birmingham, Alabama found the mean headway was $1.1915\secs$, with a standard deviation of\ $0.231\secs$.
The researchers wanted to test if the mean headway in Birmingham was *less than* the recommended\ $1.9\secs$.

Are the following statements *true* or *false*?

1. The standard error of the mean is $0.231\secs$. \tightlist
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. The null hypothesis is 'The sample mean headway is $1.9\secs$'.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. The alternative hypothesis 'The population mean is less than $1.9\secs$'.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. The test is *one-tailed*.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. The value of the test statistic is $t = -16.23$.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. The one-tailed $P$-value is very small.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. There is no evidence to support the *alternative* hypothesis.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
:::



<!-- ::: {.webex-check .webex-box} -->
<!-- A study [@imtiaz2017assessment] compared the nutritional intake of $n = 50$ anaemic infants in Lahore (Pakistan) with the recommended daily intake (of 13g). -->
<!-- The mean daily protein intake in the sample was 14g, with a standard deviation of 3g. -->
<!-- The researchers wanted to see if the mean intake met (or exceeded) the recommendation, or not. -->
<!-- ::: -->



## Exercises {#TestOneMeanAnswerExercises}

[Answers to odd-numbered exercises] are given at the end of the book. 




::: {.exercise #OneTSpeed}
@azwari2021evaluating studied driving speeds in Malaysia, and recorded the speeds of vehicles on various roads.
One RQ was whether the mean speed of cars on one particular road was the posted speed limit of\ $90\kms.\xhs^{-1}$, or whether it was *higher*.

The researchers recorded the speed of $n = 400$ vehicles on this road, and found the mean and standard deviation of the speeds of individual vehicles were $\bar{x} = 96.56$ and $s = 13.874\kms.\xhs^{-1}$.

1. Define the parameter of interest.
2. Write the statistical hypotheses.
3. Compute the standard error of the sample mean.
4. Sketch the sampling distribution of the sample mean for $n = 400$.
5. Compute the test statistic, a $t$-score.
6. Determine the $P$-value, and write a conclusion.
7. Is the test statistically valid?
:::


::: {.exercise #TestOneMeanExercisesSlalom}
A competitive slalom competitor completed $n = 30$ attempts on a $38.8\ms$ kayak slalom course to assess the accuracy of a GPS tracking system [@macdermidValidityReliabilityGlobal2022].
The trials produced a mean distance, recorded by the GPS, as $36.54\ms$ with a standard deviation of $2.07\ms$.

1. Define the parameter of interest.
2. Write the statistical hypotheses.
3. Compute the standard error of the sample mean.
4. Sketch the sampling distribution of the sample mean for $n = 30$.
5. Compute the test statistic, a $t$-score.
6. Determine the $P$-value, and write a conclusion.
7. Is the test statistically valid?
:::


::: {.exercise #TestOneMeanExercisesAutomatedVehicles}
@data:greenlee2018:vehicles conducted a study of human--automation interaction with automated vehicles.
They were interested in whether the average mental demand of 'drivers' of automated vehicles was *higher* than the average mental demand for ordinary tasks.

In the study, the $n = 22$ participants 'drove' (in a simulator) an automated vehicle for\ $40\mins$. 
While driving, the drivers monitored the road for hazards.
The researchers assessed the 'mental demand' placed on these drivers, where scores over\ $50$ 'typically indicate substantial levels of workload' (p.\ 471).
For the sample, the mean score was\ $84.00$ with a standard deviation of\ $22.05$.

Is there evidence of a 'substantial workload' associated with monitoring roadways while 'driving' automated vehicles?
:::



:::{.exercise #TestOneMeanWaterTemp}
Health departments recommend that hot water be stored at $60$^o^C or higher, to kill *legionella* 
 bacteria (for example, [*Health and Safety Executive*, UK](https://www.hse.gov.uk/legionnaires/things-to-consider.htm)).
@alary1991risk studied $n = 178$ Quebec homes with electric water heaters to see if the mean water temperature was less than $60$^o^C (i.e., at risk).

The mean temperature was\ $56.6$^o^C, with a standard error of\ $0.4$^o^C.\spacex
Is there evidence the mean water temperature in Quebec is too low to kill *legionella* bacteria?
:::



::: {.exercise #TestOneMeanExercisesCherryRipes}
[*Dataset*: `CherryRipe`]
A *Cherry Ripe* is a popular Australian chocolate bar.
In\ 2017,\ 2018 and\ 2019, I sampled some *Cherry Ripe* Fun Size bars.
The packaging claimed that the Fun Size bars weigh\ $14\gs$ (on average).

1. Use the software output (Fig.\ \@ref(fig:CherryRipes201720182019)) to determine if the mean weight is\ $14\gs$ or not.
2. Explain the difference in the meaning of `SD` and `SE` in this context.
:::

(ref:CherryRipesOutputHT) Software output for the *Cherry Ripes* data.

<div class="figure" style="text-align: center">
<img src="jamovi/CherryRipe/CherryRipe-Descriptives.png" alt="(ref:CherryRipesOutputHT)" width="60%" />
<p class="caption">(\#fig:CherryRipes201720182019)(ref:CherryRipesOutputHT)</p>
</div>



::: {.exercise #TestOneMeanBloodLoss}
(This study was also seen in Exercise\ \@ref(exr:CIOneMeanBloodLoss).)
@data:Williams2007:BloodLoss asked $n = 199$ paramedics to estimate the amount of blood on four different surfaces.
When the actual amount of blood spilt on concrete was\ $\,1000\mLs$, the mean guess was\ $846.4\mLs$ (with $s = 651.1\mLs$).

Is there evidence that the mean guess is\ $1\,000\mLs$ (the true amount)?
Is this test statistically valid?
:::



::: {.exercise #TestOneMeanExercisesSleep}
@lin2021sleep compared the average sleep times of Taiwanese pre-school children to the recommendation (of *at least*\ $10\hs$ per night).
Using the summary of the data for weekend sleep-times (Table\ \@ref(tab:SleepingSummary)), do girls get *less than* $10\hs$ of sleep per night, on average?
Do boys?
:::

<table>
<caption>(\#tab:SleepingSummary)Summary information for the Taiwanese pre-schoolers sleep times (in h).</caption>
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;">   </th>
   <th style="text-align:center;font-weight: bold;"> Sample size </th>
   <th style="text-align:center;font-weight: bold;"> Sample mean </th>
   <th style="text-align:center;font-weight: bold;"> Sample std dev. </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Boys </td>
   <td style="text-align:center;"> $47$ </td>
   <td style="text-align:center;"> $8.50$ </td>
   <td style="text-align:center;"> $0.48$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Girls </td>
   <td style="text-align:center;"> $39$ </td>
   <td style="text-align:center;"> $8.64$ </td>
   <td style="text-align:center;"> $0.37$ </td>
  </tr>
</tbody>
</table>



::: {.exercise #TestOneMeanQualityControl}
[*Dataset*: `LHconc`]
@feng2017application assessed the accuracy of two instruments from a clinical laboratory, by comparing the reported luteotropichormone (LH) concentrations to known, pre-determined values using $n = 36$ samples.
Use hypothesis tests to determine how the instruments perform, for both high- and mid-level LH concentrations (using the information in
below an in Table\ \@(tab:QualityControlDataSummary)).
:::



```{=html}
<div class="datatables html-widget html-fill-item" id="htmlwidget-2bd64e790f37206a1cd0" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-2bd64e790f37206a1cd0">{"x":{"filter":"none","vertical":false,"caption":"<caption>The quality-control data: LH levels (in mIU/mL) for two instruments.<\/caption>","data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36"],[61.63,63.11,66.88,62.56,66.12,65.34,64.83,64.22,65.54000000000001,65.33,67.83,65.97,65.01000000000001,64.51000000000001,64.3,64.38,64.75,63.12,62.93,63.59,67.04000000000001,64.38,63.41,64.19,64.86,63.7,63.14,66,63.43,64.25,63.67,64.78,58.02,63.46,65.2,63.74],[18.36,18.77,18.98,17.97,19.69,19.63,19.5,19.39,19.87,19.66,20.41,18.37,19.09,18.98,19.22,18.99,19.58,19.7,19,19.11,19.97,19.52,19.39,17.2,19.75,19.35,19.95,19.38,19.33,19,19.05,19.24,19.29,19.29,19.18,19.35],[62.64,64.36,66.06,65.39,66.84999999999999,65.56,66.59999999999999,66.90000000000001,65.5,65.92,65.51000000000001,65.03,64.22,64.19,64.95,64.95,64.45,64.77,65.58,64.87,63.52,65.02,66.05,63.82,64.58,65.09,64.86,64.84999999999999,66.75,65.37,64.29000000000001,65.5,62.85,64,63.72,64.3],[19.12,19.07,19.58,19.35,19.65,19.13,19.55,19.85,19.45,19.87,19.73,19.6,20.76,18.98,19.93,19.15,19.23,19.2,19.52,19.38,19.08,18.89,19.57,19.35,19.13,19.44,19.27,19.58,19.71,19.64,19.14,19.28,19.68,18.27,18.75,19.57]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>High level<\/th>\n      <th>Mid level<\/th>\n      <th>High level<\/th>\n      <th>Mid level<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"searching":false,"columnDefs":[{"className":"dt-right","targets":[1,2,3,4]},{"orderable":false,"targets":0},{"name":" ","targets":0},{"name":"High1","targets":1},{"name":"Mid1","targets":2},{"name":"High2","targets":3},{"name":"Mid2","targets":4}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```


<table>
<caption>(\#tab:QualityControlDataSummary)Summary of the quality-control data for LH levels (in mIU/mL) for two instruments.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> High level </th>
   <th style="text-align:center;"> Mid level </th>
   <th style="text-align:center;"> High level </th>
   <th style="text-align:center;"> Mid level </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Mean of data </td>
   <td style="text-align:center;"> $64.310$ </td>
   <td style="text-align:center;"> $19.240$ </td>
   <td style="text-align:center;"> $64.970$ </td>
   <td style="text-align:center;"> $19.400$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Std dev. of data </td>
   <td style="text-align:center;"> $\phantom{0}1.700$ </td>
   <td style="text-align:center;"> $\phantom{0}0.588$ </td>
   <td style="text-align:center;"> $\phantom{0}1.029$ </td>
   <td style="text-align:center;"> $\phantom{0}0.413$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pre-determined target </td>
   <td style="text-align:center;"> $64.220$ </td>
   <td style="text-align:center;"> $19.010$ </td>
   <td style="text-align:center;"> $65.050$ </td>
   <td style="text-align:center;"> $19.450$ </td>
  </tr>
</tbody>
</table>



::: {.exercise #PizzasHT}
[*Dataset*: `PizzaSize`]
(This study was also seen in Exercise\ \@ref(exr:CIPizzas).)
In 2011, *Eagle Boys Pizza* ran a campaign that claimed that *Eagle Boys* pizzas were  'Real size $12$-inch large pizzas' [@mypapers:Dunn:PizzaSize].
*Eagle Boys* made the data from the campaign publicly available.
Using the summary of the diameters of a sample of\ $125$ of their large pizzas (Fig.\ \@ref(fig:PizzaSoftwareHTjamovi)), test the company's claim:

> For *Eagle Boys*' pizzas, is mean diameter actually\ $12$ inches, or not?


1. What is the parameter of interest?
1. Write down the values of\ $\bar{x}$ and\ $s$.
1. Determine the value of the standard error of the mean.
1. Write the hypotheses to test if the mean pizza diameter is\ $12$\ inches.
1. Is the alternative hypothesis one- or two-tailed? Why?
1. Draw the normal distribution that shows how the *sample mean pizza diameter* would vary by chance, *even if* the population mean diameter was $12$\ inches. 
1. Compute the $t$-score for testing the hypotheses.
1. What is the approximate $P$-value using the $68$--$95$--$99.7$ rule?
1. Write a conclusion: do pizzas have a mean diameter of\ $12$\ inches, as claimed?
1. Is it reasonable to assume the *statistical* validity conditions are satisfied? 
:::

(ref:EBSummaryHTCaption) Summary statistics for the diameter of *Eagle Boys* large pizzas.

<div class="figure" style="text-align: center">
<img src="jamovi/PizzaDiameter/PizzaDiameters-jamovi.png" alt="(ref:EBSummaryHTCaption)" width="40%" />
<p class="caption">(\#fig:PizzaSoftwareHTjamovi)(ref:EBSummaryHTCaption)</p>
</div>


::: {.exercise #OneMeanHtExerciseSleepTime}
@saxvig2021sleep studied the length of sleep each night for a 'large and representative sample of Norwegian adolescents' (p.\ 1) aged\ $16$ and\ $17$\ years of age.
The recommendation is for adolescents to have at least\ $8\hs$ of sleep each night.

In the sample of $n = 3\,972$ individuals, the mean amount of sleep on schools days was $6\hs$\ $43\mins$ (i.e., $403\mins$), with a standard deviation of $87\mins$.
On non-school days, the mean amount of sleep was $8\hs$\ $38\mins$ (i.e., $518\mins$), with a standard deviation of\ $98\mins$.

Do Norwegian adolescents appear to meet the guidelines of having '*at least*\ $8\hs$' sleep each night on school days? 
On non-school days?
:::






<!-- QUICK REVIEW ANSWERS -->
<!--
::: {.EOCanswerBox .EOCanswer data-latex="{iconmonstr-check-mark-14-240.png}"}
\textbf{Answers to \textit{Quick review} questions:}
**1.** False: $0.0436$.
**2.** False: *population* mean.
**3.** True.
**4.** True.
**5.** True.
**6.** True.
**7.** False.
:::
-->
