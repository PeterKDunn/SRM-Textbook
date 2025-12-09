# Confidence intervals: one mean {#OneMeanConfInterval}



::: {.objectivesBox .objectives data-latex="{iconmonstr-target-4-240.png}"}
So far, you have learnt to ask an RQ, design a study, classify and summarise the data, and construct a confidence interval for one proportion.
You have also been introduced to confidence intervals.
**In this chapter**, you will learn to 

* identify situations where estimating a mean is appropriate.
* form confidence intervals for one mean.
* determine whether the conditions for using the confidence intervals apply in a given situation.
:::



<img src="23-CIs-OneMean_files/figure-html/unnamed-chunk-5-1.png" width="65%" height="33%" style="display: block; margin: auto;" />


<!-- Define colours as appropriate -->





## Introduction {#CIOneMeanIntro}
\index{Confidence intervals!one mean|(}

<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/pexels-skitterphoto-705171.jpg" width="200px"/>
</div>


Consider rolling a fair, six-sided die $n = 25$ times.
Suppose we are interested in the *mean* of the numbers that are rolled.
Since every face of the die is equally likely to appear on any one roll, the population mean of all possible rolls is $\mu = 3.5$ (in the middle of the numbers on the faces of the die, so this is also the *median*).

What will be the sample mean of the numbers in the $25$\ rolls?
We don't know, as the sample mean varies from sample to sample (*sampling variation*).


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Remember: studying a sample leads to the following observations:
\vspace{-2ex}

* every sample is likely to be different.
* we observe just one of the many possible samples.
* every sample is likely to yield a different value for the statistic.
* we observe just one of the many possible values for the statistic.
\vspace{-2ex}

Since many values for the sample mean are possible, the values of the sample mean vary (called *sampling variation*) and have a *distribution* (called a *sampling distribution*).
:::





## Sampling distribution for $\bar{x}$: for $\sigma$ known {#SamplingDistSampleMeanSigmaKnown}
\index{Sampling distribution!one mean ($\sigma$ known)}

Suppose thousands of people made one set of $25$\ rolls each, and computed the mean for their sample.\index{Mean!of a sample}
Then, every person would have a sample mean for their sample, and we could produce a histogram of all these sample means
(see the animation below).
The mean for any single sample of $n = 25$ rolls will sometimes be higher than $\mu = 3.5$, and sometimes lower than $\mu = 3.5$, but often close to\ $3.5$.
Sample means larger than\ $4.5$, or smaller than\ $2.5$, would occur rarely.


<img src="23-CIs-OneMean_files/figure-html/RollDiceHistMeanHTML-.gif" width="672" />





From the animation above,
the sample means vary with an approximate normal distribution (as with the sample proportions).
This normal distribution does *not* describe the data; it describes how the *values of the sample means vary across all possible samples*.
Under certain conditions (Sect.\ \@ref(ValiditySampleMean)), the values of the sample mean vary with a normal distribution, and this normal distribution has a mean and a standard deviation.

The mean of this sampling distribution (the *sampling mean*) has the value $\mu$.
The standard deviation of this sampling distribution (the *standard error of the sample means*) is denoted $\text{s.e.}(\bar{x})$.
When the *population* standard deviation\ $\sigma$ is *known*, the value of the standard error happens to be
$$
  \text{s.e.}(\bar{x}) = \frac{\sigma}{\sqrt{n}}.
$$
In summary, the values of the sample means have a *sampling distribution* described by:

* an approximate normal distribution,
* with a sampling mean whose value is\ $\mu$, and
* a standard deviation, called the standard error, of $\text{s.e.}(\bar{x}) = \sigma/\sqrt{n}$.

However, since the *population* standard deviation is rarely ever known, we will focus on the case where the value of\ $\sigma$ is unknown (and estimated by the *sample* standard deviation,\ $s$).


## Sampling distribution for $\bar{x}$: for $\sigma$ unknown {#SamplingDistSampleMean}
\index{Sampling distribution!one mean}

Since the value of the population standard deviation\ $\sigma$ is almost never known, the sample standard deviation\ $s$ is used to estimate of the standard error of the mean: $\text{s.e.}(\bar{x}) = s/\sqrt{n}$.
With this information, the *sampling distribution of the sample mean* can be described.


<!--
::: {.definition #DEFSamplingDistributionXbarCI name="Sampling distribution of a sample mean for $\sigma$ unknown"}
When the *population* standard deviation is unknown, the *sampling distribution of the sample mean* is (when certain conditions are met; Sect.\ \@ref(ValiditySampleMean)) described by:
-->

::: {.definition #DEFSamplingDistributionXbarCI name="Sampling distribution of a sample mean for the population standard deviation unknown"}
When the *population* standard deviation is unknown, the *sampling distribution of the sample mean* is (when certain conditions are met; Sect.\ \@ref(ValiditySampleMean)) described by:

  
* an approximate normal distribution,
* centred around a sampling mean whose value is $\mu$,
* with a standard deviation (called the *standard error of the mean*), denoted\ $\text{s.e.}(\bar{x})$, whose value is
\begin{equation}
   \text{s.e.}(\bar{x}) = \frac{s}{\sqrt{n}},
   (\#eq:stderrorxbarCI)
\end{equation}
where\ $n$ is the size of the sample, and\ $s$ is the sample standard deviation of the observations. 
:::


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
A mean or a median may be appropriate for describing the *data*.
However, the *sampling distribution* for the sample mean (under certain conditions) has a *normal distribution*.
Hence, the mean is appropriate for describing the sampling distribution, even if not for describing the data.
:::


## Confidence intervals for $\mu$ {#OneMeanCI}

In practice, we do not know the value of\ $\mu$.
After all, that's why we take a sample: to *estimate* the value of the unknown population mean.
Suppose, then, we did not know the value of\ $\mu$ (the parameter) for the die-rolling situation, but we have an *estimate*: the value of\ $\bar{x}$, the sample mean (the statistic).
The value of\ $\bar{x}$ may be a bit smaller than\ $\mu$, or a bit larger than\ $\mu$ (but we don't know which, since we do not know the value of\ $\mu$).
In other words, the values of\ $\mu$ that may have produced the observed value\ $\bar{x}$ may be less than the value of\ $\bar{x}$, or greater than the value of\ $\bar{x}$.

Since the values of\ $\bar{x}$ vary from sample to sample (*sampling variation*) with an approximate normal distribution (Def.\ \@ref(def:DEFSamplingDistributionXbarCI)), the $68$--$95$--$99.7$ rule could be used to construct an approximate $95$%\ interval for the plausible values of\ $\mu$ that may have produced the observed values of the sample mean.\index{68@$68$--$95$--$99.7$ rule}
This is a *confidence interval* (or a CI).

A CI for the population mean is an interval surrounding a sample mean.
In general, a CI for\ $\mu$ is
$$
   \bar{x} \pm \overbrace{\big(\text{multiplier}\times\text{s.e.}(\bar{x})\big)}^{\text{The `margin of error'}}.
$$
For an approximate $95$%\ CI, the multiplier is about\ $2$ (since about\ $95$% of values are within two standard deviations of the mean, from the $68$--$95$--$99.7$ rule).


<!--
::: {.definition #ConfidenceIntervalmu name="Confidence interval for $\mu$"}
A *confidence interval* (CI) for the unknown value of the population mean\ $\mu$ is
\begin{equation}
  \bar{x} \pm \big( \text{multiplier} \times \text{s.e.}(\bar{x})\big), 
  (\#eq:CImu)
\end{equation}
where $\big( \text{multiplier} \times \text{s.e.}(\hat{p})\big)$ is the *margin of error*, and
$\text{s.e.}(\bar{x})$ is the *standard error* of\ $\bar{x}$ (see Equation\ \@ref(eq:stderrorxbarCI)), where\ $\bar{x}$ is the sample mean, and\ $n$ is the sample size.
For an *approximate* $95$%\ CI, the multiplier is\ $2$.
:::
-->

::: {.definition #ConfidenceIntervalmu name="Confidence interval for the population mean"}
A *confidence interval* (CI) for the unknown value of the population mean\ $\mu$ is
\begin{equation}
  \bar{x} \pm \big( \text{multiplier} \times \text{s.e.}(\bar{x})\big), 
  (\#eq:CImu)
\end{equation}
where $\big( \text{multiplier} \times \text{s.e.}(\hat{p})\big)$ is the *margin of error*, and
$\text{s.e.}(\bar{x})$ is the *standard error* of\ $\bar{x}$ (see Equation\ \@ref(eq:stderrorxbarCI)), where\ $\bar{x}$ is the sample mean, and\ $n$ is the sample size.
For an *approximate* $95$%\ CI, the multiplier is\ $2$.
:::



CIs are often $95$%\ CIs, but any level of confidence can be used (with the appropriate multiplier).
In this book, a multiplier of\ $2$ is used when *approximate* $95$%\ CIs are created manually, and otherwise software is used.\index{Software output}
Commonly, CIs are computed at $90$%,\ $95$% and\ $99$% confidence levels.


::: {.tipBox .tip data-latex="{iconmonstr-info-6-240.png}"}
In Chap.\ \@ref(CIOneProportion), the multiplier was a $z$-score, and approximate values for the multiplier were found using the $68$--$95$--$99.7$ rule.

However, when computing the CI for a sample mean, the multiplier is *not* a $z$-score.
The multiplier would be a $z$-score if the value of the *population* standard deviation was known (e.g., the situation in Sect.\ \@ref(SamplingDistSampleMeanSigmaKnown)).
When\ $\sigma$ is unknown (almost always), and the *sample* standard deviation is used instead, the multiplier is a $t$-score (Sect.\ \@ref(Tscores)).\index{Test statistic!t@$t$-score}

The values of\ $t$- and $z$-multipliers are *very* similar, and (except for small sample sizes) using an approximate multiplier of\ $2$ is reasonable for computing *approximate* $95$%\ CIs in either case.
:::


Pretend for the moment that the value of $\mu$ was unknown, and we tossed a die $25$\ times, and found $\bar{x} = 3.2$ and $s = 2.5$.
Then,
$$
   \text{s.e.}(\bar{x}) = \frac{s}{\sqrt{n}} = \frac{2.5}{\sqrt{25}} = 0.5.
$$
Hence, the sample means vary with an approximate normal distribution, centred around the unknown value of\ $\mu$, with a standard deviation of $\text{s.e.}(\bar{x}) = 0.5$ (Fig.\ \@ref(fig:DiceMeanNormal)).



<div class="figure" style="text-align: center">
<img src="23-CIs-OneMean_files/figure-html/DiceMeanNormal-1.png" alt="The sampling distribution is an approximate normal distribution with mean $3.5$ and standard error $0.5$;  it is a model of how the mean roll varies when a die is rolled $25$ times." width="95%" />
<p class="caption">(\#fig:DiceMeanNormal)The sampling distribution is an approximate normal distribution with mean $3.5$ and standard error $0.5$;  it is a model of how the mean roll varies when a die is rolled $25$ times.</p>
</div>


Our estimate of\ $\bar{x} = 3.2$ may be a bit smaller than the value of\ $\mu$, or a bit larger than the value of\ $\mu$; that is, the value of\ $\mu$ is\ $\bar{x}$, give-or-take a bit.
A range of\ $\mu$ values that are likely to straddle\ $\bar{x}$ is given by a CI.\spacex
An *approximate* $95$%\ CI is (using Equation\ \@ref(eq:CImu)) from
\begin{align*}
                 3.2 - (2 \times 0.5) &\qquad\text{(which is $2.2$)}\\
  \text{to}\quad 3.2 + (2 \times 0.5) &\qquad\text{(which is $4.2$)}.
\end{align*}
Hence, values of\ $\mu$ between\ $2.2$ to\ $4.2$ could reasonably have produced a sample mean of $\bar{x} = 3.2$. 
Using software, the exact $95$%\ CI is from\ $2.17$ to\ $4.23$, the same as the approximate CI to one decimal place.\index{Software output!one mean}


## Statistical validity conditions {#ValiditySampleMean}
\index{Statistical validity (for inference)!one mean}

As with any CI, the underlying mathematics requires certain conditions to be met so that the results are statistically valid (i.e., the sampling distribution is sufficiently like a normal distribution).

The CI for a single mean is *statistically valid* if *either* of these is true:

* $n \ge 25$.
  (If the distribution of the data is highly skewed, the sample size may need to be larger.)
* $n < 25$, *and* the sample data come from a population with a normal distribution.

The sample size of\ $25$ is a rough figure, and some books give other values (such as\ $30$).

This condition ensures that the *sampling distribution of the sample means has an approximate normal distribution* (so that, for example, the $68$--$95$--$99.7$ rule can be used).\index{68@$68$--$95$--$99.7$ rule}
Provided the sample size is larger than about\ $25$, this will be approximately true *even if* the distribution of the individuals in the
population do not have a normal distribution.
That is, when $n \ge 25$ the sample means generally have an approximate normal distribution, even if the data themselves do not follow a normal distribution.
The units of analysis are also assumed to be *independent* (e.g., ideally from a simple random sample).

If the statistical validity conditions are not met, other methods (e.g., non-parametric methods\index{Non-parametric statistics} [@bauer1972constructing]; resampling methods\index{Resampling methods} [@efron2021computer]) may be used.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
When $n \ge 25$ approximately, the *data* do not have to have a normal distribution.
The *sample means* need to have a normal distribution, which is approximately true if the statistical validity conditions are true.
:::


::: {.example #DiceConditions name="Statistical validity"}
In the die example (Sect.\ \@ref(OneMeanCI)), where $n = 25$, the CI is statistically valid.
:::


The second statistical validity condition requires the *population* to have a normal distribution.
Knowing this is obviously difficult; we do not have access to the whole population.
All we can reasonably do is to identify (from the sample) whether the population is likely to be non-normal (when the CI would be not valid).


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/pexels-anna-shvets-4225923.jpg" width="200px"/>
</div>


::: {.example #AssumptionsCT name="Statistical validity"}
@data:silverman:CT examine exposure to radiation for CT scans in the abdomen for $n = 17$ patients [@data:zou:fluoroscopy].
As the sample size is 'small' (less than\ $25$), the *population data* must have a normal distribution for a CI for\ $\mu$ to be statistically valid.

A histogram of the total radiation dose received using the *sample* data (Fig.\ \@ref(fig:CTscanHistogram)) suggests this is very unlikely.
Even though the histogram is from *sample* data, it seems improbable that the data in the sample would have come from a *population* with a normal distribution.

A CI for the mean of these data will probably *not* be statistically valid.
Other methods (such as resampling methods\index{Resampling methods}, which are beyond the scope of this book) are needed to compute a CI for the mean.
:::


<div class="figure" style="text-align: center">
<img src="23-CIs-OneMean_files/figure-html/CTscanHistogram-1.png" alt="The radiation doses from CT scans for $17$ people." width="480" />
<p class="caption">(\#fig:CTscanHistogram)The radiation doses from CT scans for $17$ people.</p>
</div>
\index{Confidence intervals!one mean|)}

<iframe src="https://learningapps.org/watch?v=ppetqnq4322" style="border:0px;width:100%;height:500px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>


## Example: cadmium in peanuts {#Cadmium-In-Peanuts}


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/tom-hermans-ZPfd3ZobOc0-unsplash.jpg" width="200px"/>
</div>


@data:Blair2017:Peanuts studied peanuts gathered from a variety of regions in the United States over various times (perhaps a representative sample).
They found the sample mean cadmium concentration was $\bar{x} = 0.076\ppms$ with a standard deviation of $s = 0.0460\ppms$, from a sample of $290$\ peanuts.
The parameter is\ $\mu$, the population mean cadmium concentration in peanuts.

Every sample of $n = 290$ peanuts is likely to produce a different sample mean, so *sampling variation* in $\bar{x}$\ exists and can be measured using the standard error:
$$
	\text{s.e.}(\bar{x}) = \frac{s}{\sqrt{n}} = \frac{0.0460}{\sqrt{290}} = 0.002701\ppms.
$$
The approximate $95$%\ CI\ is $0.0768 \pm (2 \times 0.002701)$, or $0.0768 \pm 0.00540$, which is from\ $0.0714$ to\ $0.0822\ppms$.
(The *margin of error* is $0.00540$.)\index{Margin of error}
We write:

> The sample mean cadmium concentration of peanuts is $0.0768$\ppms ($n = 290$), with an approximate $95$%\ CI from\ $0.0714$ to\ $0.0822$\ppms.

If we repeatedly took samples of size\ $290$ from this population, about\ $95$% of the $95$%\ CIs would contain the population mean (*our* CI may or may not contain the value of\ $\mu$).
The plausible values of\ $\mu$ that could have produced $\bar{x} = 0.0768$ are between\ $0.0714$ and\ $0.0822\ppms$.
Alternatively, we are about\ $95$% confident that the CI of\ $0.0714$ to\ $0.0822\ppms$ straddles the population mean.

Since the sample size is larger than\ $25$, the CI is statistically valid.



## Chapter summary

To compute a confidence interval (CI) for a mean, compute the sample mean,\ $\bar{x}$, and identify the sample size\ $n$.
Then compute the standard error, which quantifies how much the value of\ $\bar{x}$ varies across all possible samples:
$$
  \text{s.e.}(\bar{x})
  =
  \frac{s}{\sqrt{n}},
$$
where\ $s$ is the sample standard deviation.
The *margin of error* is (multiplier${}\times{}$standard error), where the multiplier is\ $2$ for an approximate $95$%\ CI (from the $68$--$95$--$99.7$ rule).
Then the CI is:
$$
   \bar{x} \pm \left( \text{multiplier}\times\text{standard error} \right).
$$
The statistical validity conditions should also be checked.


## Quick review questions {#Chap25-QuickReview}

::: {.webex-check .webex-box}
Are the following statements *true* or *false*?

1. The value of $\bar{x}$ varies from sample to sample. \tightlist  
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. A CI for\ $\mu$ is never statistically valid if the histogram of the *data* has a non-normal distribution.  
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. A sample of data produces $s = 8$ and $n = 20$; the standard error of the mean is $1.7889$.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. When the sample size is less than\ $25$, the standard error is not statistically valid.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
:::



## Exercises {#OneMeanConfIntervalExercises}

[Answers to odd-numbered exercises] are given at the end of the book. 



::: {.exercise #OneMeanCIBears}
@bartareau2017estimating studied American black bears, and found the mean weight of the $n = 185$ male bears was  $\bar{x} = 84.9\kgs$, with a standard deviation of $s = 51.1\kgs$.

1. Define the *parameter* of interest.
1. Compute the standard error of the mean.
1. Draw a picture of the approximate sampling distribution for\ $\bar{x}$.
1. Compute the approximate $95$%\ CI.
1. Write a conclusion.
1. Is the CI statistically valid?
:::


::: {.exercise #BagsCI}
@data:Dianat2014:schoolbags studied the weight of the school bags of a sample of $586$\ children in Grades $6$--$8$ in Tabriz, Iran.
The mean weight was $\bar{x} = 2.8\kgs$ with a standard deviation of $s = 0.94\kgs$.

1. Define the *parameter* of interest.
1. Compute the standard error of the mean.
1. Draw a picture of the approximate sampling distribution for\ $\bar{x}$.
1. Compute the approximate $95$%\ CI.
1. Write a conclusion.
1. Is the CI statistically valid?
:::


::: {.exercise #CIOneMeanLungCapacityInChildren}
[*Dataset*: `LungCap`]
@data:Tager:FEV studied the lung capacity of children in East Boston.
They measured the forced expiratory volume (FEV) of a sample of $n = 45$ eleven-year-old girls.
For these children, the mean lung capacity was $\bar{x} = 2.85$ litres and the standard deviation was $s = 0.43$ litres [@BIB:data:FEV].
Find an approximate $95$%\ CI for the population mean lung capacity of eleven-year-old females from East Boston.
:::


::: {.exercise #CIOneMeanEnvironmentalPollution}
@data:Taylor2013:Lead studied lead smelter emissions near children's public playgrounds.
They found the mean lead concentration at one playground (Memorial Park, Port Pirie, in South Australia) was $6\,956.41\microgs.\ms^{-2}$, with a standard deviation of $7\,571.74\microgs.\ms^{-2}$, from a sample of $n = 58$ wipes taken over a seven-day period.
(As a reference, the Western Australian Government recommends a maximum of $400\microgs.\ms^{-2}$.)

Find an approximate $95$%\ CI for the mean lead concentration at this playground.
Would these results apply to playgrounds in other parts of Australia?
:::


::: {.exercise #CIOneMeanToothbrushing}
@data:Macgregor1985:ToothbrushinghYoungAdults studied the brushing time for $60$\ young adults (aged $18$--$22$ years old), and found the mean tooth brushing time was\ $33.0\secs$, with a standard deviation of\ $12.0\secs$.
Find an approximate $95$%\ CI for the mean brushing time for young adults.
:::


::: {.exercise #CIOneMeanBloodLoss}
@data:Williams2007:BloodLoss asked paramedics ($n = 199$) to estimate the amount of blood loss on four different surfaces.
When the actual amount of blood spill on concrete was\ $1\,000\mLs$, the mean guess was\ $846.4\mLs$ (with a standard deviation of\ $651.1\mLs$).

1. What is the approximate $95$%\ CI for the mean guess of blood loss?
1. Do you think the participants are good at estimating the amount of blood loss on concrete?
1. Is this CI statistically valid?
:::


::: {.exercise #OneMeanCINHANESInterpret}
[*Dataset*: `NHANES`]
Using data from the <span style="font-variant:small-caps;">nhanes</span> study [@data:NHANES3], the approximate $95$%\ CI for the mean direct HDL cholesterol is\ $1.356$ to\ $1.374\mmols$/L.\spacex
Which (if any) of these interpretations are acceptable?
Explain *why* are the other interpretations are incorrect.

1. In the *sample*, about $95$%\ of individuals have a direct HDL concentration between $1.356$ to $1.374\mmols$/L.
1. In the *population*, about $95$%\ of individuals have a direct HDL concentration between $1.356$ to $1.374\mmols$/L.
1. About $95$%\ of the *samples* are between\ $1.356$ to\ $1.374\mmols$/L.
1. About $95$%\ of the *populations* are between\ $1.356$ to\ $1.374\mmols$/L.
1. The *population* mean varies so that it is between\ $1.356$ to\ $1.374\mmols$/L about $95$% of the time.
1. We are about $95$%\ sure that *sample* mean is between\ $1.356$ to\ $1.374\mmols$/L.
1. It is plausible that the *sample* mean is between\ $1.356$ to\ $1.374\mmols$/L.
:::


::: {.exercise #OneMeanStdError}
@data:Grabosky2016:Trees describe the diameter of *Quercus bicolor* trees planted in a lawn as having a mean of\ $25.8\cms$, with a standard error of\ $0.64\cms$, from a sample of\ $19$ trees.
Which (if either) of the following is correct?
  
1. About\ $95$% of the trees in the *sample* will have a diameter between $25.8 - (2\times 0.64)$ and $25.8 + (2\times 0.64)\cms$ (using the $68$--$95$--$99.7$ rule).
1. About\ $95$% of these types of trees in the *population* will have a diameter between $25.8 - (2\times 0.64)$ and $25.8 + (2\times 0.64)\cms$ (using the $68$--$95$--$99.7$ rule)?
:::


::: {.exercise #ChewingTime}
@watanabe1995estimation studied $n = 30$ five-year-old children, and found the mean time for the children to eat a cookie was\ $61.3\secs$, with a standard deviation of\ $29.4\secs$.

1. What is an approximate $95$%\ CI for the population mean time for a five-year-old child to eat a cookie? 
2. Is the CI statistically valid?
:::


::: {.exercise #CIPizzas}
[*Dataset*: `PizzaSize`]
In\ 2011, *Eagle Boys Pizza* ran a campaign that claimed (among many other claims) that *Eagle Boys* pizzas were 'Real size $12$-inch large pizzas' in an effort to out-market *Dominos Pizza*.
*Eagle Boys* made the data behind the campaign publicly available [@mypapers:Dunn:PizzaSize].
A summary of the diameters of a sample of\ $125$ of *Eagle Boys* large pizzas is shown in Fig.\ \@ref(fig:PizzaCIjamovi).

1. What do\ $\mu$ and\ $\bar{x}$ represent in this context? \tightlist 
2. Write down the *values* of\ $\mu$ and\ $\bar{x}$.
3. Write down the *values* of\ $\sigma$ and\ $s$.
4. Compute the value of the standard error of the mean $\text{s.e.}(\bar{x})$.
5. Explain the difference in *meaning* between\ $s$ and\ $\text{s.e.}(\bar{x})$ here.
6. If someone else takes a sample of\ $125$ *Eagle Boys* pizzas, will the sample mean be $11.486$\ inches again (as in this sample)?
   Why or why not?
7. Draw a picture of the approximate sampling distribution for\ $\bar{x}$.
8. Compute an approximate $95$%\ CI for the mean pizza diameter.
9. Write a statement that communicates your $95$%\ CI for the mean pizza diameter.
10. What are the *statistical* validity conditions? 
    Is the computed CI statistically valid?
11. Do you think that, on average, the pizzas do have a mean diameter of $12$\ inches in the population, as Eagle Boys claim?
    Explain.
:::


::: {.exercise #CIMatchesPerBox}
Claire and Jake were wondering about the mean number of matches in a box.
The boxes contain this statement:

> An average of $45$\ matches per box.

They purchased a carton containing $n = 25$\ boxes of matches, and Jake counted the number of matches in *one* of those $25$\ boxes.
The box contained $44$\ matches.

'Oh wow.  Just wow.' said Jake.
'They lie.  There's only\ $44$ in this box.'

1. What is Jake's misunderstanding? \tightlist
2. Then, they counted the number of matches in *each* of the $n = 25$ boxes, and found the mean number of matches per box was\ $44.9$ matches, and the standard deviation was\ $0.124$.
   Jake notes that the mean is $44.9$\ matches per box, and says: 'You can't have $0.9$\ of a match.  That's dumb.'
   How would you respond?
3. 'Wow!' said Jake.
   'The claim is $45$\ matches per box on average, but the mean really is\ $44.9$!
   They're liars!'
   What is Jake's misunderstanding?
4. 'Come on, Jake,' said Claire.
   'As if the mean will be *exactly*\ $45$ in a sample every single time.
   Let's work out the confidence interval.'
   Why does Claire think a CI is needed?
   What will it tell them?
5. What is an approximate $95$%\ CI for the mean for Claire's sample?
6. 'Aha,' said jake; 'I told you so!
    They *are* absolutely lying!
    Your confidence interval doesn't even include their mean of\ $45$!
   'The manufacturer *must* be lying!'
   Is Jake correct?
   Why or why not?
   What does the CI *mean*?
7. In this scenario, what does\ $\bar{x}$ represent?
   What is the *value* of\ $\bar{x}$?
8. In this scenario, what does\ $\mu$ represent?
   What is the *value* of\ $\mu$?
:::



(ref:EBSummaryCaption) Summary statistics for the diameter of *Eagle Boys* large pizzas.

<div class="figure" style="text-align: center">
<img src="jamovi/PizzaDiameter/PizzaDiameters-jamovi.png" alt="(ref:EBSummaryCaption)" width="40%" />
<p class="caption">(\#fig:PizzaCIjamovi)(ref:EBSummaryCaption)</p>
</div>








<!-- QUICK REVIEW ANSWERS -->
<!--
::: {.EOCanswerBox .EOCanswer data-latex="{iconmonstr-check-mark-14-240.png}"}
**Answers to *Quick review* questions:**
**1.** True
**2.** False.
**3.** True.
**4.** False.
:::
-->

