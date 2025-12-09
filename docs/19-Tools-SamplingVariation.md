
# Sampling variation {#SamplingVariation}



::: {.objectivesBox .objectives data-latex="{iconmonstr-target-4-240.png}"}
So far, you have learnt to ask an RQ, design a study, describe and summarise the data, and understand propbability.
**In this chapter**, you will learn to:

* explain what a sampling distribution describes.
* explain the difference between the variation between individuals and the variation in statistics.
* determine when a standard error is appropriate to use.
* explain the difference between standard errors and standard deviations.
:::



<img src="19-Tools-SamplingVariation_files/figure-html/unnamed-chunk-7-1.png" width="65%" height="33%" style="display: block; margin: auto;" />


<!-- Define colours as appropriate -->






## Introduction {#SamplingVariationIntro}

One of the most important ideas in research and statistics is that the sample being studied is only one of countless possible samples that could have been selected to study.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Studying a sample leads to the following observations:
\vspace{-2ex}

* every sample is likely to be different.
* we observe just one of the many possible samples.
* every sample is likely to yield a different value for the statistic (i.e., a different estimate\index{Estimate} for the parameter).
* we observe just one of the many possible values for the statistic.
\vspace{-2ex}

Since many values for the statistic are possible, the values of the statistic vary and have a distribution.
:::


In research, decisions need to be made about *populations* based on *samples*; that is, about *parameters* based on *statistics*.
The challenge is that the decision must be made using only one of the many possible samples, and every sample is likely to be different.
Each sample will produce a different value for the *statistic*.
This is called *sampling variation*.


::: {.definition #SamplingVariation name="Sampling variation"}
\index{Sampling variation}
*Sampling variation* refers to how the sample estimates (statistics) vary from sample to sample, because every possible sample is different.
:::


Any distribution that describes how a statistic varies for all possible samples is called a *sampling distribution*.


::: {.definition #SamplingDistribution name="Sampling distribution"}
A *sampling distribution* is the distribution of a statistic, showing how its value varies in all possible samples.
:::


## Sample proportions have a sampling distribution {#SamplingDistributionProportions}

Sample proportions, like all statistics, vary from sample to sample; that is, *sampling variation* exists, so sample proportions have a *sampling distribution*.

Consider a European roulette wheel
shown below in the animation:
a ball and wheel are spun, and the ball can land on any number on the wheel from\ $0$ to\ $36$ (inclusive).
Using the classical approach to probability, the probability of the ball landing on an *odd* number (an '*odd-spin*') is $p = 18/37 =  0.486$.
This is the *population proportion* (the parameter).


<!-- Show Roulette wheel, and some text: -->



<img src="19-Tools-SamplingVariation_files/figure-html/SpinningWheel-.gif" width="672" />




If the wheel is spun (say) $15$\ times, the \emph{sample} proportion of odd-spins, denoted\ $\hat{p}$, will vary.
But, *how* does\ $\hat{p}$ vary from one set of\ $15$ spins to another set of $15$\ spins? 
Can we describe *how* the values of\ $\hat{p}$ vary across the possible samples?







Computer simulation can be used to demonstrate what happens if the wheel was spun, over and over again, for $n = 15$ spins each time, and the proportion of odd-spins was recorded for each repetition.
The proportion of odd spins\ $\hat{p}$ varies from sample to sample (sampling variation), as shown by the histogram (Fig.\ \@ref(fig:RouletteWheelHist), top left panel).
The *shape* of the distribution is approximately bell shaped.
We can see that, for many repetitions of $15$\ spins, $\hat{p}$ is rarely smaller than\ $0.2$, and rarely larger than\ $0.8$.
That is, reasonable values to expect for\ $\hat{p}$ are between about\ $0.2$ and\ $0.8$.

If the wheel was spun (say) $n = 25$ times (rather than\ $15$ times), $\hat{p}$ again varies (Fig.\ \@ref(fig:RouletteWheelHist), top right panel): the values of\ $\hat{p}$ vary from sample to sample.
The same process can be repeated for many repetitions of (say) $n = 100$ and $n = 200$ spins (Fig.\ \@ref(fig:RouletteWheelHist), bottom panels).

Notice that as the sample size\ $n$ increases, the variation in the sampling distribution gets smaller.
With $200$\ spins, for instance, observing a sample proportion smaller than\ $0.4$ or greater than\ $0.6$ seems highly unusual, but these are not uncommon at all for\ $15$ spins.

The sampling distributions can be described by a mean (called the *sampling mean*) and a standard deviation (called the *standard error*).


::: {.example #ReasonableValuesp name="Reasonable values for the sample proportion"}
Suppose a roulette wheel was spun $100$\ times, and $31$\ odd numbers were observed.
The sample proportion is $\hat{p} = 31/100 = 0.31$.
From Fig.\ \@ref(fig:RouletteWheelHist) (bottom left panel), a sample proportion this low almost never occurs in a sample of\ $100$ rolls.

This is very unlikely to occur from a fair roulette wheel.
Hence, we either observed something highly unusual, or the wheel is not fair (e.g., a problem exists with the wheel).
:::


<div class="figure" style="text-align: center">
<img src="19-Tools-SamplingVariation_files/figure-html/RouletteWheelHist-1.png" alt="Sampling distributions for the proportion of roulette wheel spins that show an odd number, for sets of rolls of varying sizes." width="100%" />
<p class="caption">(\#fig:RouletteWheelHist)Sampling distributions for the proportion of roulette wheel spins that show an odd number, for sets of rolls of varying sizes.</p>
</div>


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
The values of the sample proportion vary from sample to sample.
The distribution of the possible values of the *sample* proportion is called a *sampling distribution*.

Under certain conditions, the sampling distribution of a sample proportion is described by an approximate bell-shaped distribution (formally called a *normal distribution*).
In general, the approximation gets better as the sample size increases.
In addition, the possible values of\ $\hat{p}$ vary less as the sample size increases.

The mean of the sampling distribution is called the *sampling mean*; the standard deviation of the sampling distribution is called the *standard error* (Fig.\ \@ref(fig:StatisticVariesAcrossSamples)).
:::


## Sample means have a sampling distribution {#SamplingDistributionMeans}

The sample mean, like all statistics, varies from sample to sample; that is, *sampling variation* exists, so sample means have a *sampling distribution*.


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/luck-839037_640.jpg" width="200px"/>
</div>


Consider a European roulette wheel again (Sect.\ \@ref(SamplingDistributionProportions)).
Rather than recording the sample proportion of odd-spins, suppose the *sample mean* of the numbers was recorded.
If the wheel is spun (say) $15$\ times, the *sample* mean of the spins\ $\bar{x}$ will vary from one set of $15$\ spins to another.
But *how* does it vary?

Again, computer simulation can be used to demonstrate what could happen if the wheel was spun $15$\ times, over and over again, and the mean of the numbers was recorded for each repetition.
Clearly, the sample mean spin\ $\bar{x}$ can vary from sample to sample (sampling variation) for $n = 15$ spins (Fig.\ \@ref(fig:RouletteWheelHistx), top left panel).

When $n = 15$, the sample mean\ $\bar{x}$ varies from sample to sample, and the *shape* of the distribution again is approximately bell-shaped.
If the wheel was spun more than $15$\ times (say, $n = 50$ times) something similar occurs (Fig.\ \@ref(fig:RouletteWheelHistx), top right panel): the values of\ $\bar{x}$ vary from sample to sample, and the values have an approximate bell-shaped (normal) distribution.
In fact, the values of\ $\bar{x}$ have a bell-shaped  distribution for other numbers of spins also (Fig.\ \@ref(fig:RouletteWheelHistx), bottom panels).

The sampling distributions can be described by a mean (called the *sampling mean*) and a standard deviation (called the *standard error*).


<div class="figure" style="text-align: center">
<img src="19-Tools-SamplingVariation_files/figure-html/RouletteWheelHistx-1.png" alt="Sampling distributions for the mean of the numbers after a roulette wheel is spun a certain number of times." width="100%" />
<p class="caption">(\#fig:RouletteWheelHistx)Sampling distributions for the mean of the numbers after a roulette wheel is spun a certain number of times.</p>
</div>


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
The values of the sample mean vary from sample to sample.
The distribution of the possible values of the *sample* mean is called a *sampling distribution*.

Under certain conditions, the sampling distribution of a sample mean is described by an approximate bell-shaped (or normal) distribution.
In general, the approximation gets better as the sample size increases.
In addition, the possible values of\ $\bar{x}$ vary less as the sample size increases.

The mean of the sampling distribution is called the *sampling mean*; the standard deviation of the sampling distribution is called the *standard error* (Fig.\ \@ref(fig:StatisticVariesAcrossSamples)).
:::

::: {.example #ReasonableValuesMean name="Reasonable values for the sample mean"}
Suppose we spun a roulette wheel\ $100$ times, and the mean of the observed numbers was $\bar{x} = 18.9$.
From Fig.\ \@ref(fig:RouletteWheelHistx) (bottom left panel), a sample mean with this value does not look unusual at all; it would occur reasonably frequently.
The evidence does not suggest a problem with the wheel.
:::


As we have seen, each sample is likely to be different, so *any* statistic is likely to vary from sample to sample.
(The value of the *population* parameter does not change.)
This variation in the possible values of the observed sampling statistic is called *sampling variation*.



## Sampling means and standard errors {#StandardErrors}

As seen in the previous two sections, the value of a sample statistic varies from sample to sample.
The value of the sample statistic that is observed depends on which one of the countless samples happens to be observed

The possible values of the statistic that we could potentially observe have a *distribution* (specifically, a *sampling distribution*); see Fig.\ \@ref(fig:StatisticVariesAcrossSamples).
The *mean* of this sampling distribution is called the *sampling mean*.
The sampling mean is the average value of all possible values of the statistic.
Not all sampling distributions have a bell-shaped distribution.


::: {.definition #SamplingMean name="Sampling mean"}
The *sampling mean* is the mean of the sampling distribution of a statistic: the mean of the values of the statistic from all possible samples.
:::


The *standard deviation* of this sampling distribution is called the *standard error*.
The standard error measures how the value of the statistic varies across all possible values of the statistic; see Fig.\ \@ref(fig:StatisticVariesAcrossSamples).
The standard error is a measure of how precisely the *sample* statistic estimates the *population* parameter.
If every possible sample (of a given size) was found, and the statistic computed from each sample, the standard deviation of all these estimates is the *standard error*.


::: {.definition #StandardError name="Standard error"}
A *standard error* is the standard deviation of the sampling distribution of a statistic: the standard deviation of the values of the statistic from all possible samples.
:::


<div class="figure" style="text-align: center">
<img src="19-Tools-SamplingVariation_files/figure-html/StatisticVariesAcrossSamples-1.png" alt="Describing how the value of the sample statistic varies across all possible samples, when the sampling distribution has a normal distribution." width="70%" />
<p class="caption">(\#fig:StatisticVariesAcrossSamples)Describing how the value of the sample statistic varies across all possible samples, when the sampling distribution has a normal distribution.</p>
</div>

 

Figures\ \@ref(fig:RouletteWheelHist) and\ \@ref(fig:RouletteWheelHistx) show that the variation in the values of the statistic get smaller for larger sample sizes.
That is, the standard error gets *smaller* as the sample sizes get *larger*: sample statistics show less variation for larger\ $n$.
This makes sense: *larger* samples generally produce more precise estimates.\index{Precision}
After all, that's the advantage of larger samples: all else being equal, larger samples produce more precise estimates (Sect.\ \@ref(PrecisionAccuracy)).


::: {.example #StandardErrors name="Standard errors"}
In Fig.\ \@ref(fig:RouletteWheelHistx), a sample of\ $250$ (i.e., $250$\ spins) is unlikely to produce a sample mean larger than\ $20$, or smaller than\ $15$. 
However, in a sample of size\ $15$ (i.e., $15$\ spins) sample means near\ $15$ and\ $20$ are quite commonplace.

In samples of size\ $100$, the variation in the mean spin is smaller than in samples of size\ $15$.
Hence, the *standard error* (the standard deviation of the sampling distributions) will be smaller for samples of size\ $250$ than for samples of size\ $15$.
:::


For many sample statistics, *the variation from sample to sample can be approximately described by a bell-shaped (normal) distribution* (the *sampling distribution*) if certain conditions are met.
Furthermore, the *standard deviation of this sampling distribution is called the standard error*.
The standard error is a special name given to the *standard deviation* that describes the variation in the possible values of a statistic.


::: {.tipBox .tip data-latex="{iconmonstr-info-6-240.png}"}
'Standard error' is an unfortunate label: it is not an *error*, or even *standard*.
(For example, there is no such thing as a '*non*-standard error'.)
:::


## Standard deviation and standard error

Even
[experienced researchers confuse the meaning and the usage of the terms](https://retractionwatch.com/2019/12/09/authors-retract-two-studies-on-high-blood-pressure-and-supplements-after-realizing-theyd-made-a-common-error/#more-118562)
*standard deviation* and *standard error* [@ko2014inappropriate].
Understanding the difference is important.

The *standard deviation*, in general, quantifies the amount of variation in any quantity that varies.
The *standard error* only ever refers to the standard deviation that describes a sampling distribution.

Typically, in a research study, *standard deviations* describe the variation in the individuals in a sample: how observations vary from *individual to individual*.
The *standard error* is only used to describe how *sample estimates* vary from sample to sample (i.e., to describe the precision of sample estimates).

The standard error *is* a standard deviation, but specifically describes the variation in sampling distributions.
*Any* numerical quantity estimated from a sample (a *statistic*) can vary from sample to sample, and so has sampling variation, a sampling distribution, and hence a standard error.
(Not all sampling distributions are *normal* distributions, however.)


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
*Any* quantity estimated from a sample (a statistic) has a standard error. 
:::


::: {.tipBox .tip data-latex="{iconmonstr-info-6-240.png}"}
The *standard error* is often abbreviated to 'SE' or 's.e.'.
For example, the 'standard error of the sample mean' is usually written $\text{s.e.}(\bar{x})$, and the 'standard error of the sample proportion' is usually written $\text{s.e.}(\hat{p})$.
:::


Parameters do not vary from sample to sample, so *do not* have a sampling distribution (or a standard error).


<iframe src="https://learningapps.org/watch?v=pk8ucviua22" style="border:0px;width:100%;height:800px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>


## Chapter summary {#SamplingVariationSummary}

A *sampling distribution* describes how all possible values of a statistic vary from sample to sample.
Under certain circumstances, the sampling distribution often can be described by a *bell-shaped (or normal) distribution*.
The standard deviation of this normal distribution is called a *standard error*.
The standard error is the name specifically given to the standard deviation that describes the variation in the statistic *across all possible samples*.


## Quick review questions {#SamplingVariationQuickReview}

::: {.webex-check .webex-box}
Are the following statements *true* or *false*?

1. The phrase 'the standard error of the population proportion' is illogical.\tightlist  
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. The sample size *does not* have a standard error?  
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. Sampling variation refers to how sample sizes vary.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. Sampling distributions describe how parameters vary.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. Statistics do not vary from sample to sample.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. Populations are numerically summarised using parameters
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. The *standard deviation* is a type of *standard error* in a specific situation.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. Sampling distributions are always *normal* distributions.  
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. Sampling variation measures the amount of variation in the individuals in the sample.  
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. The standard error measures the size of the error when we use a sample to estimate a population.  
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. In general, a standard deviation measures the amount of variation.   
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
:::


## Exercises {#SamplingVariationExercises}

[Answers to odd-numbered exercises] are given at the end of the book. 



::: {.exercise #StdErrorOrStdDeviationA}
In the following scenarios, would a *standard deviation* or a *standard error* be the appropriate way to measure the amount of variation?
Explain.

1. Researchers are studying the spending habits of customers. 
   They would like to measure the variation in the amount spent by shoppers per transaction at a supermarket.
1. Researchers are studying the time it takes for inner-city office workers to travel to work each morning. 
   They would like to determine the precision with which their estimate (a mean of $47\mins$) has been measured.
:::

::: {.exercise #StdErrorOrStdDeviationB}
In the following scenarios, would a *standard deviation* or a *standard error* be the appropriate way to measure the amount of variation?
Explain.

1. A study examined the effect of taking a pain-relieving drug on children.
   The researchers want to describe the sample they used in the study, including a description of how the ages of the children in the study vary.
1. A study estimated the proportion of children aged under\ $14$ who owned a mobile (cell) phone.
   The researchers want to report this estimate, indicating the precision of that estimate.
:::


::: {.exercise #HasStandardErrorA}
Which of the following have a *standard error*?

1. The population proportion.
2. The sample median.
3. The sample IQR.
:::



::: {.exercise #HasStandardErrorB}
Which of the following have a *standard error*?

1. The sample standard deviation.
2. The population odds.
3. The sample odds ratio.
::::


::: {.exercise #RouletteWheelA}
Consider spinning a European roulette wheel.

1. Suppose the wheel was spun $15$\ times (Fig.\ \@ref(fig:RouletteWheelHistx), top left panel), and the mean spin was\ $22.1$.
   What would you conclude about the wheel?
1. Suppose the wheel was spun $250$\ times (Fig.\ \@ref(fig:RouletteWheelHistx), bottom right panel), and the mean spin was\ $22.1$.
   What would you conclude about the wheel?
1. Suppose the wheel was spun $50$\ times (Fig.\ \@ref(fig:RouletteWheelHistx), top right panel), and the mean spin was\ $22.1$.
   What would you conclude about the wheel?
1. Suppose the wheel was spun $50$\ times (Fig.\ \@ref(fig:RouletteWheelHistx), top right panel), and the mean spin was\ $24.0$.
   What would you conclude about the wheel?
::::



::: {.exercise #RouletteWheelB}
Consider spinning a European roulette wheel.

1. Suppose the wheel was spun $15$\ times (Fig.\ \@ref(fig:RouletteWheelHist), top left panel), and the proportion of spins showing an odd number was\ $0.44$.
   What would you conclude about the wheel?
1. Suppose the wheel was spun $15$\ times (Fig.\ \@ref(fig:RouletteWheelHist), top left panel), and the proportion of spins showing an odd number was\ $0.13$.
   What would you conclude about the wheel?
1. Suppose the wheel was spun $15$\ times (Fig.\ \@ref(fig:RouletteWheelHist), top left panel), and the proportion of spins showing an odd number was\ $0.65$.
   What would you conclude about the wheel?
1. Suppose the wheel was spun $200$\ times (Fig.\ \@ref(fig:RouletteWheelHist), bottom right panel), and the proportion of spins showing an odd number was\ $0.65$.
   What would you conclude about the wheel?
:::




::: {.exercise #QuoteStdError}
A research article [@nagele2003misuse] made this statement:

> ... authors often [incorrectly] use the standard error of the mean (SEM) to describe the variability of their sample...

What is wrong with using the standard error of the mean to describe the sample?
How would you explain the difference between the *standard error* and the *standard deviation*?
:::







<!-- QUICK REVIEW ANSWERS -->
<!--
::: {.EOCanswerBox .EOCanswer data-latex="{iconmonstr-check-mark-14-240.png}"}
**Answers to *Quick review* questions:**
**1.** True. 
**2.** True.
**3.** False.
**4.** False.
**5.** False.
**6.** True.
**7.** False.
**8.** False.
**9.** False.
**10.** False.
**11.** True.
:::
-->


