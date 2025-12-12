# Hypothesis tests: one proportion {#TestOneProportion}


<!-- Introductions; easier to separate by format -->

::: {.objectivesBox .objectives data-latex="{iconmonstr-target-4-240.png}"}
So far, you have learnt to ask an RQ, design a study, classify and summarise the data, and form confidence intervals.
**In this chapter**, you will learn to:
  
* identify situations where conducting a test for a proportion is appropriate.
* conduct hypothesis tests for one sample proportion, using a $z$-test.
* determine whether the conditions for using these methods apply in a given situation.
:::

<img src="26-Testing-OneProportion_files/figure-html/unnamed-chunk-5-1.png" width="65%" height="33%" style="display: block; margin: auto;" />


<!-- Define colours as appropriate -->






## Introduction: rolling dice {#ProportionTestIntro}
\index{Hypothesis testing!one proportion|(}

<div style="float:right; width: 222x; border: 1px; padding:10px"><img src="OtherImages/SmiffyDice-Rotated.png" width="200px"/></div>


<!--
\captionsetup[wrapfigure]{margin=8pt}
\begin{wrapfigure}[5]{R}{.35\textwidth} % The first optional input is the number of lines allowed for the image to be placed in
  \centering%
  \vspace{-30pt}% This removes some white space
  \includegraphics[width=.32\textwidth]{OtherImages/SmiffyDice-Rotated.png}%
  \caption{The packaging (Photo: P.\ K.\ Dunn).}\label{fig:DodgyDice}
\end{wrapfigure}
-->


When in a toy store\index{Toy store} one day (for my children, of course), I saw 'loaded dice'\index{Loaded dice} for sale
(see image).
The packaging claimed <span style="font-variant:small-caps;">one loaded \& one normal</span>.
I bought two sets!
However, there was no indication as to *which* die was the loaded die.
How could I determine which of the dice was loaded?
That is, how could I make a *decision* about which die was loaded?

For a die that is *not* loaded, the population proportion of rolling any face of the die is $p = 1/6$.
So, for example, the population proportion of rolls that show a
<span class="larger-die">&#9856;</span>
is $p = 1/6$, using the classical approach to probability.\index{Probability!classical approach}
In any *sample* of rolls, however, the proportion of rolls showing a
<span class="larger-die">&#9856;</span>
would vary due to sampling variation, but would be approximately $\hat{p} = 1/6$ with a fair die.

Suppose I rolled one die a certain number of times (say, $n = 50$\ times), then determined the value of the sample proportion\ $\hat{p}$, the sample proportion of rolls that show a 
<span class="larger-die">&#9856;</span>.
It is unlikely that the value of\ $\hat{p}$ will be *exactly* $1/6$ (the population proportion).
If the observed value of $\hat{p}$ was not exactly $1/6$, two possible reasons could explain this discrepancy between the value of the statistic and the assumed value of the parameter (Chap.\ \@ref(MakingDecisions)):

* I was rolling the *fair* die (with $p = 1/6$), and the discrepancy between the values of the *population* and *sample* proportions was simply due to sampling variation.
* I was rolling the *loaded* die  (with $p \ne 1/6$), and the discrepancy between the values of the *population* and *sample* proportion simply reflected this.

If I observed an unusually small or unusually large sample proportion of rolls that showed a 
<span class="larger-die">&#9856;</span>,
I would suspect that I had the loaded die: I was observing something unusual if I had rolled the fair die.
This is exactly the decision-making process seen in Chap.\ \@ref(MakingDecisions).

More formally then, the decision-making process (Chap.\ \@ref(MakingDecisions)) could proceed as follows.

* Make an *assumption* about the parameter: assume I have a fair die, so that $p = 1/6$, where $p$ is the population proportion of rolls that show a 
<span class="larger-die">&#9856;</span>.
* Describe the *expectations* of the statistic: describe what value of the *sample* proportion $\hat{p}$ could reasonably be expected from a fair die in $50$\ rolls.
* Evaluate the sample *observations*: roll the die $50$\ times to find a value of $\hat{p}$ and compare to what was expected.
* Make a *decision* based on what is observed in the sample.

Using this decision-making process (Fig.\ \@ref(fig:DecisionFlowDice)), I could decide if the die I had rolled seemed to be the fair die (based on rolling a 
<span class="larger-die">&#9856;</span>;
the die may be loaded in a different way, of course).
For one specific die, I am asking the decision-making RQ:

> For this die, is the population proportion of rolls that show a
<span class="larger-die">&#9856;</span>
equal to\ $1/6$?

Answering a decision-making RQ such as this requires a *hypothesis test*.



<div class="figure" style="text-align: center">
<img src="26-Testing-OneProportion_files/figure-html/DecisionFlowDice-1.png" alt="A way to make decisions for the dice example." width="100%" />
<p class="caption">(\#fig:DecisionFlowDice)A way to make decisions for the dice example.</p>
</div>





::: {.tipBox .tip data-latex="{iconmonstr-info-6-240.png}"}
$p$ refers to the *population* proportion, and\ $\hat{p}$ refers to a *sample* proportion.
:::



## Rolling dice: the sampling distribution of $\hat{p}$ {#SamplingDistributionKnownpHT}
\index{Sampling distribution!one proportion (for testing)}


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/pexels-skitterphoto-705171.jpg" width="200px"/>
</div>


When a fair, six-sided die is rolled $50$\ times, what proportion of the rolls will produce a
<span class="larger-die">&#9856;</span>?
That is, what will be the value of the *sample proportion* $\hat{p}$?
Of course, no-one knows, because the sample proportion will not be the same for every sample of $50$\ rolls.
The sample proportion *varies* from sample to sample: *sampling variation* exists and is described by the *sampling distribution*.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Remember: studying a sample leads to the following observations:
\vspace{-2ex}

* every sample is likely to be different.
* we observe just one of the many possible samples.
* every sample is likely to yield a different value for the statistic.
* we observe just one of the many possible values for the statistic.
\vspace{-2ex}

Since many values for the sample proportion are possible, the values of the sample proportion vary (called *sampling variation*) and have a *distribution* (called a *sampling distribution*).
:::




The sampling distribution of\ $\hat{p}$ was described in Def.\ \@ref(def:SamplingDistPropCI) (and repeated in Def.\ \@ref(def:SamplingDistPropHT) below).
The sample proportions are described by

* an approximate normal distribution,
* centred around the *sampling mean*, with a value of $p = 1/6$ (assumed, from $H_0$),
* with a standard deviation, called the *standard error* $\text{s.e.}(\hat{p})$, of
  \begin{equation}
     \text{s.e.}(\hat{p}) 
     = \sqrt{ \frac{p\times(1 - p)}{n} }
     = \sqrt{\frac{ \frac{1}{6} \times \left(1 - \frac{1}{6}\right)}{50}}
     = 0.0527.
    (\#eq:StdErrorExampleDieHT)
  \end{equation}


<center>
<img src="26-Testing-OneProportion_files/figure-html/RollDiceHistHTML-.gif" width="672" />
</center>

(ref:DieRollSamplingDist) The proportion of rolls that show a <span class="larger-die">&#9856;</span>, $\hat{p}$, is not the same for every sample of $50$ rolls; it varies around a mean of $p = 1/6$ (shown by the dot). The solid line is the normal distribution used to model the sampling distribution. The sampling distribution is an approximate normal distribution; it shows a model of how the proportion of rolls showing a <span class="larger-die">&#9856;</span> varies, when a die is rolled $50$ times.


<!--
::: {.definition #SamplingDistPropHT name="Sampling distribution of a sample proportion with $p$ known"}
For a known value of $p$, the *sampling distribution of the sample proportion* is (when certain conditions are met; Sect.\ \@ref(ValidityProportions)) described by
-->

::: {.definition #SamplingDistPropHT name="Sampling distribution of a sample proportion with the population proportion known"}
For a known value of $p$, the *sampling distribution of the sample proportion* is (when certain conditions are met; Sect.\ \@ref(ValidityProportions)) described by


* an approximate normal distribution,
* centred around the sampling mean whose value is\ $p$,
* with a standard deviation (called the *standard error* of\ $\hat{p}$), denoted $\text{s.e.}(\hat{p})$, whose value is
\begin{equation}
   \text{s.e.}(\hat{p}) = \sqrt{\frac{ p \times (1 - p)}{n}},
   (\#eq:StdErrorPknownHT)
\end{equation}
where\ $n$ is the size of the sample used to compute\ $\hat{p}$, and\ $p$ is the population proportion.
:::


A picture of this normal distribution can be drawn (Fig.\ \@ref(fig:NormalDieTheoryHT)); the standard error is the standard deviation of the normal distribution in Fig.\ \@ref(fig:NormalDieTheoryHT).
While we still don't know *exactly* what values of $\hat{p}$ the next set of $n = 50$\ rolls will produce, we have some idea of *how* the sample proportion varies in samples of $50$\ rolls.
For instance, values of\ $\hat{p}$  greater than about\ $0.35$ are unlikely to be observed from a fair die (with $p = 1/6$).


(ref:DieRollStdError) The sampling distribution is an approximate normal distribution; it shows a model of how the proportion of rolls showing a <span class="larger-die">&#9856;</span> varies, when a die is rolled $50$ times. The cross represents the observed sample proportion, $\hat{p} = 0.38$.

<div class="figure" style="text-align: center">
<img src="26-Testing-OneProportion_files/figure-html/NormalDieTheoryHT-1.png" alt="(ref:DieRollStdError)" width="100%" />
<p class="caption">(\#fig:NormalDieTheoryHT)(ref:DieRollStdError)</p>
</div>




## Rolling dice: making a decision {#TestpObsDecision}

Figure\ \@ref(fig:NormalDieTheoryHT) shows what values of the sample proportion $\hat{p}$ are expected when a fair die is rolled.
Step\ 3 of the decision-making process (Fig.\ \@ref(fig:DecisionFlowDice)) is to roll the die.

When I rolled the die, a
<span class="larger-die">&#9856;</span>
appeared $19$\ times in my $50$\ rolls, a sample proportion of
$$
\hat{p} = \frac{19}{50} = 0.38.
$$
In this unusual or unexpected?
Locating this value of $\hat{p}$ on the sampling distribution in Fig.\ \@ref(fig:NormalDieTheoryHT) shows that a sample proportion of $\hat{p} = 0.38$ is *highly* unusual from a fair die with $p = 1/6$.
More specifically, since the sampling distribution has a normal distribution, a $z$-score can be computed:
$$
  z 
  = \frac{\text{statistic} - \text{mean of the distribution}}{\text{std dev. of the distribution}}
  = \frac{0.38 - (1/6)}{0.05270}
  = 4.05,
$$
which is a *very* large $z$-score (based on the $68$--$95$--$99.7$ rule).\index{68@$68$--$95$--$99.7$ rule}
Using a fair die, observing $\hat{p} = 0.38$ would almost never occur.
But I *did* observe $\hat{p} = 0.38$, which suggests that the die I was rolling was *not* the fair die.

I concluded that the die I was rolling was loaded (that is, $p \ne 1/6$).
I may be incorrect (after all, it is not *impossible* to observe $\hat{p} = 0.38$), but the evidence is certainly persuasive.
Using the decision-making process, a decision has been made about the die.

The process described above is called *hypothesis testing*.\index{Hypothesis testing}
Hypothesis testing is used to make decisions about a population after observing just one of the countless possible samples.
Formally, the hypothesis test above proceeds as described in the following sections. 


## Assumptions: hypotheses {#TestpObsDecisionHypothesis}
\index{Test statistic!z@$z$-score}

**Step\ 1** in the decision-making process is to make an assumption about the parameter.
For the die example, the parameter is\ $p$, the population proportion of rolls that show a
<span class="larger-die">&#9856;</span>.
The assumption is that $p = 1/6$.
This is called the *null hypothesis*,\index{Hypotheses!null} denoted by $H_0$:
$$
  \text{$H_0$: } p = 1/6.
$$
The null hypothesis states the value of\ $p$ is $1/6$; in other words, if the sample proportion\ $\hat{p}$ is not equal to $1/6$, the discrepancy is explained by sampling variation.
The null hypothesis is always the 'sampling variation' explanation for the discrepancy between the values of the statistic and the parameter (Sect.\ \@ref(Assumption)).

The other explanation for why the value of the sample proportion $\hat{p}$ is not equal to $1/6$ is called the *alternative hypothesis* (denoted $H_1$),\index{Hypotheses!alternative} that the population proportion is *not* $1/6$, and this is the cause of the discrepancy between the values of the statistic and the parameter:
$$
  \text{$H_1$: } p \ne 1/6.
$$
These two hypotheses offer different explanations for the discrepancy between the values of the population proportion (the parameter) and the sample proportion (the statistic).
The null hypothesis $H_0$ states that $p = 1/6$ and the discrepancy is due to sampling variation.
The alternative hypothesis $H_1$ states that $p \ne 1/6$, which explains the discrepancy.

Here, the RQ here is open to the value of $p$ being smaller *or* larger than\ $1/6$; that is, two possibilities are considered.
Hence, we write $p\ne 1/6$, which is called a *two-tailed* alternative hypothesis.
Alternative hypotheses like $p > 1/6$ (the population proportion is *larger* than $1/6$) or $p < 1/6$  (the population proportion is *smaller* than $1/6$) are *one-tailed* hypothesis.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
The form of the alternative hypothesis (either one- or two-tailed) depends on what the research question asks, *not the data*.
:::



## Expectations: sampling distribution for $\hat{p}$  {#TestpObsDecisionSamplingDist}

**Step\ 2** in the decision-making process is to describe what values of the statistic (i.e., $\hat{p}$) could be expected under the assumption about the parameter (i.e., *when the null hypothesis is true*).
Hypothesis testing *always* begins by assuming the null hypothesis is true.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
The decision-making process begins by assuming the *null hypothesis* is true.
Thus, *the onus is on the data to refute the null hypothesis, the initial assumption*.

That is, the null hypothesis is retained unless persuasive evidence emerges to change our mind.
:::


Effectively, this step requires describing the sampling distribution of the statistic.
For the die example, the sampling distribution for $\hat{p}$ is (see Def.\ \@ref(def:SamplingDistPropHT)):

* an approximate normal distribution,
* centred around the sampling mean whose value is\ $p = 1/6$,
* with a standard deviation, whose value is $\text{s.e.}(\hat{p}) = 0.05270\dots$

Drawing the picture of the sampling distribution (like Fig.\ \@ref(fig:NormalDieTheoryHT)) using this information is not necessary, but may be helpful.


## Observations: $z$-score {#TestpObsDecisiontestStat}

**Step\ 3** in the decision-making process is to evaluate the observations.
As noted above, a
<span class="larger-die">&#9856;</span>
was observed in\ $19$ of the $50$\ rolls, so $\hat{p} = 0.38$.
Since the sampling distribution has a normal distribution, the corresponding $z$-score was computed as $z = 4.05$, which very large.

In hypothesis testing, the $z$-score is called the *test statistic*.\index{Test statistic}\index{Test statistic!z@$z$-score}
The test statistic measures how far, in relative terms, the sample proportion is from the assumed value of the parameter.


## Decision: $P$-value {#TestpObsDecisionPvalues}

**Step\ 4** of the decision-making process is to use the information to make a decision: is the sample statistic *consistent* with what was expected under the assumption that $p = 1/6$, or does it *contradict* what was expected?

For the die example, the decision is reasonably easy: $z = 4.05$ is *very* large and *very* unlikely to be observed if $p = 1/6$.
This means the sample evidence *contradicts* what was expected if the assumption was true: persuasive evidence exists that the die is loaded.

More generally, evidence is evaluated using a $P$-value.\index{P@$P$-values}
$P$-values refer to the area *more extreme* than the calculated test statistic in the sampling distribution.

For this situation, where the sampling distribution has a normal distribution, $P$-values refer to the area *more extreme* than the calculated $z$-score (the statistic)\index{Statistic} in the normal distribution; that is, the area in the *tails* of the distribution (see Fig.\ \@ref(fig:OnePropTestP)).
This is a way to measure how unusual the calculated $z$-score is.

For *two-tailed* alternative hypotheses, the $P$-value is the combined area in the lower and upper tails that correspond to the positive  *and* negative values of the test statistic.
For *one-tailed* alternative hypotheses, the $P$-value is the area in one tail only.
Clearly, since the $P$-value is a probability, its value is always between\ $0$ and\ $1$.

Since the sampling distribution has a normal distribution in this example, $P$-values can be approximated using the $68$--$95$--$99.7$ rule and a diagram (Sect.\ \@ref(ApproxProbs); Sect.\ \@ref(OnePropTestP6895997)), or more precisely using the $z$-tables
in App.\ \@ref(ZTablesOnline)
(Sect.\ \@ref(ZScoreForestry); Sect.\ \@ref(OnePropTestPTables)).
$P$-values are also reported by software for most statistical tests.


### Approximating $P$-values using the $68$--$95$--$99.7$ rule {#OnePropTestP6895997}
\index{68@$68$--$95$--$99.7$ rule}\index{P@$P$-values!estimating using $68$--$95$--$99.7$ rule}

The $68$--$95$--$99.7$ rule can be used to determine *approximate* $P$-values.
To demonstrate, suppose the computed $z$-score was $z = 1$.
Then, the two-tailed $P$-value is the shaded tail-area in Fig.\ \@ref(fig:OnePropTestP) (top left panel): about\ $32$%, based on the $68$--$95$--$99.7$ rule.
The two-tailed $P$-value would be the same if $z = -1$ (as both tails are of interest).
The *one-tailed* $P$-value would be the area in one-tail (Fig.\ \@ref(fig:OnePropTestP), bottom left panel): about\ $16$%, based on the $68$--$95$--$99.7$ rule.

As another example, suppose the calculated $z$-score was $z = -2$.
Then, the two-tailed $P$-value is the shaded area shown in Fig.\ \@ref(fig:OnePropTestP) (top right panel): about\ $5$%, based on the $68$--$95$--$99.7$ rule.
The two-tailed $P$-value would be the same if $z = 2$.
The *one-tailed* $P$-value would be the area in one tail only (Fig.\ \@ref(fig:OnePropTestP), bottom right panel): about\ $2.5$%, based on the $68$--$95$--$99.7$ rule.


<div class="figure" style="text-align: center">
<img src="26-Testing-OneProportion_files/figure-html/OnePropTestP-1.png" alt="The two-tailed $P$-value is the combined area in the two tails of the distribution; the one-tailed $P$-value is the area in one tail only. Top left panel: if $z = 1$ (or $z = -1$), the two-tailed $P$-value is approximately $0.16$. Top right panel: if $z = 2$ (or $z = -2$), the two-tailed $P$-value is approximately $0.05$. The corresponding one-tailed $P$-values are half the two-tailed $P$-values, and are shown in the bottom panels." width="100%" />
<p class="caption">(\#fig:OnePropTestP)The two-tailed $P$-value is the combined area in the two tails of the distribution; the one-tailed $P$-value is the area in one tail only. Top left panel: if $z = 1$ (or $z = -1$), the two-tailed $P$-value is approximately $0.16$. Top right panel: if $z = 2$ (or $z = -2$), the two-tailed $P$-value is approximately $0.05$. The corresponding one-tailed $P$-values are half the two-tailed $P$-values, and are shown in the bottom panels.</p>
</div>

Of course, calculated $z$-scores are unlikely to be exactly $z = 1$ or $z = -2$.
Suppose the $z$-score is a little *larger* than $z = 1$; say $z = 1.2$.
Then, the two-tailed area will be a little *smaller* than the tail area when $z = 1$ (Fig.\ \@ref(fig:OnePropTestP2), left panel).
The two-tailed $P$-value is a little *smaller* than\ $0.32$.

Similarly, suppose the $z$-score is not quite equal to $z = -2$; say $z = -1.9$.
Then, the two-tailed area will be a little *larger* than the tail area when $z = -2$ (Fig.\ \@ref(fig:OnePropTestP2), right panel).
The two-tailed $P$-value is a little *larger* than\ $0.05$.


<div class="figure" style="text-align: center">
<img src="26-Testing-OneProportion_files/figure-html/OnePropTestP2-1.png" alt="The two-tailed $P$-value for $z$-scores not aligned with the $68$--$95$--$99.7$ rule. Left panel: when $z = 1.2$ (or $z = -1.2$). Right panel: when $z = 1.9$ (or $z = -1.9$)." width="95%" />
<p class="caption">(\#fig:OnePropTestP2)The two-tailed $P$-value for $z$-scores not aligned with the $68$--$95$--$99.7$ rule. Left panel: when $z = 1.2$ (or $z = -1.2$). Right panel: when $z = 1.9$ (or $z = -1.9$).</p>
</div>



### More precise $P$-values using tables {#OnePropTestPTables}
\index{P@$P$-values!using tables}

Using the tables of areas under normal distributions (Appendix\ \@ref(ZTablesOnline).), more precise $P$-values can be found using the ideas from Sect.\ \@ref(ExactAreasUsingTables).
For instance (see Fig.\ \@ref(fig:OnePropTestP2)):

* for $z = 1.2$: the area to the *left* of $z = -1.2$ is\ $0.1151$, and the area to the *right* of $z = 1.2$ is\ $0.1151$, so the *two-tailed* $P$-value is $0.1151 + 0.1151 = 0.2302$.
  This is a little smaller than\ $0.32$, as estimated above.
* for $z = 1.9$: the area to the *left* of $z = -1.9$ is\ $0.0287$, and the area to the *right* of $z = 1.9$ is\ $0.0287$, so the *two-tailed* $P$-value is $0.0287 + 0.0287 = 0.0574$.
  This is a little larger than\ $0.05$, as estimated above.

In this die-rolling example, where $z = 4.05$, the tail area is *very* small (using 
Appendix\ \@ref(ZTablesOnline)),
and zero to four decimal places.
$P$-values are never exactly zero, so we write $P < 0.0001$ (that is, the $P$-value is *less than*\ $0.0001$).

$P$-values tells us the probability of observing the sample statistic (or a value even more extreme), assuming the null hypothesis is true.
In the die-rolling example, the $P$-value is the probability of observing the value of $\hat{p} = 0.38$ (or a more extreme value), just through sampling variation if $p = 1/6$.
Then (see the animation below).


* 'big' $P$-values mean the sample statistic (i.e., $\hat{p}$) could reasonably have occurred through sampling variation in one of the many possible samples, if the assumption made about the parameter (stated in $H_0$) was true; the data *do not* contradict the assumption in\ $H_0$.
   There *is no* persuasive evidence to support the alternative hypothesis.
* 'small' $P$-values mean the sample statistic (i.e., $\hat{p}$) is *unlikely* to have occurred through sampling variation in one of the many possible samples, if the assumption made about the parameter (stated in\ $H_0$) was true; the data *do* contradict the assumption in $H_0$.
   There *is* persuasive evidence to support the alternative hypothesis.



<img src="26-Testing-OneProportion_files/figure-html/PvaluesAnimation-.gif" width="672" />





What is meant by 'small' and 'big' in this context?
What represents persuasive evidence to support the alternative hypothesis?
A $P$-value smaller than\ $5$% (or\ $0.05$) is usually considered 'small', and persuasive evidence to support the alternative hypothesis.
In contrast, a $P$-value larger than\ $5$% (or\ $0.05$) is usually considered 'big', and *not* persuasive evidence to support the alternative hypothesis.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
The value of\ $0.05$ given here is *arbitrary*, and in some disciplines the distinction is made when $P = 0.01$ or $P = 0.10$ instead.
:::


Rather than having an arbitrary boundary between 'big' and 'small', a more sensible approach is to qualify the strength of the evidence that supports the alternative hypotheses (discussed further in Sect.\ \@ref(AboutPvalues)).

In this die-rolling example, where the $P$-value is *very* small, the data contradict the null hypothesis that $p = 1/6$: the evidence supports the alternative hypothesis that $p \ne 1/6$.
This suggests that the die is very likely *not* fair.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
*Be careful interpreting the results!*
We cannot be *sure* that the die is unfair.
*A small $P$-value is not proof that the die is loaded.*
The die may be fair but, due to sampling variation, the sample we observed may simply have produced an unusually high proportion of rolls that show a
<span class="larger-die">&#9856;</span>
by chance.

The result is interpreted as 'there is strong evidence that the die is unfair'.
Remember: *the onus is on the data to refute the null hypothesis, the initial assumption*.
:::


::: {.example #PvaluesInterpret name="Interpreting P-values"}
In the die example, suppose we found the two-tailed $P$-value as\ $0.26$.
This is 'large' (i.e., much larger than\ $0.05$).
Then the observed value of\ $\hat{p}$ could easily be explained by chance, and is *not* persuasive evidence to support the alternative hypothesis (that the die is unfair).
There is no persuasive evidence that\ $p$ is not\ $1/6$.
:::

Note that a different value for $\text{s.e.}(\hat{p})$ is required to produce the CI (see Def.\ \@ref(def:DEFSamplingDistributionPhat)).


## Writing conclusions {#OnePropTestCommunicate}

In general, communicating the results of any hypothesis test requires:

* an answer to the RQ,  worded in terms of how much evidence exists to support the *alternative* hypothesis.
* a summary of the evidence used to reach that conclusion (such as the $z$-score and $P$-value, including if the $P$-value is one- or two-tailed).
* sample summary information (see Chap.\ \@ref(CIOneProportion)), summarising the data used to make the decision (which usually includes a CI for the parameter).

So for the die-rolling example, write:

> The sample provides strong evidence ($z = 4.05$; two-tailed $P < 0.001$) that the proportion of rolls that show a
<span class="larger-die">&#9856;</span>
is not\ $1/6$ ($\hat{p} = 0.38$; approx.\ $95$% CI: $0.243$ to\ $0.517$; $n = 50$ rolls) in the population.

This statement includes the three necessary components:

* an answer to the RQ: 'The sample provides very strong evidence... that the population proportion is not\ $1/6$'.
* the evidence used to reach the conclusion: '$z = 4.05$; two-tailed $P < 0.001$'.
* sample summary information (including a CI).


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Since the *null* hypothesis is initially assumed to be true, *the onus is on the evidence to refute the null hypothesis*. 
That is, we retain the null hypothesis unless there is persuasive evidence to stop doing so.
Hence, conclusions are worded in terms of how strongly the evidence (i.e., sample data) supports the alternative hypothesis.  

The alternative hypothesis *may* or *may not* be true, but we report how strongly the evidence (data) supports the alternative hypothesis.
Conclusions are *not* worded in terms of how much evidence supports the null hypothesis.
:::


## Process overview {#OnePropTestOverview}

Let's recap the decision-making process, in this context of rolling a 
<span class="larger-die">&#9856;</span> (Fig.\ \@ref(fig:DecisionFlowDieRoll)):

1. *Assumption*.
   Write the *null hypothesis* and *alternative hypothesis* about the *parameter* (based on the RQ), where\ $p$ is the population proportion of rolls that are a
<span class="larger-die">&#9856;</span>: 
   * $H_0$: $p = 1/6$ (i.e., sampling variation explains the discrepancy between\ $p$ and\ $\hat{p}$).
   * $H_1$: $p \ne 1/6$ (this is a two-tailed alternative hypothesis).
2. *Expectation*. 
   The sampling distribution describes what values to reasonably expect from the sample statistic across all possible samples, *if* the null hypothesis is true.
   In this situation, the sampling distribution has an approximate normal distribution.
3. *Observation*. 
   Compute the $z$-score ($z = 4.05$), a measure of the discrepancy between the assumed population value, and the observed sample value.
   This is a very large value.
4. *Decision*.
   Determine if the data are consistent with the assumption, by computing the $P$-value.
   Here, the two-tailed $P$-value is (much) less than\ $0.0001$, so strong evidence exists that\ $p$ is *not*\ $1/6$.


<div class="figure" style="text-align: center">
<img src="26-Testing-OneProportion_files/figure-html/DecisionFlowDieRoll-1.png" alt="The decison-making process for the die-rolling data." width="100%" />
<p class="caption">(\#fig:DecisionFlowDieRoll)The decison-making process for the die-rolling data.</p>
</div>



## Statistical validity conditions {#ValidityProportionsTest}
\index{Statistical validity (for inference)!one proportion}

The hypothesis test conducted in this chapter assumes the sampling distribution is approximately a normal distribution (and so, for example, the $68$--$95$--$99.7$ rule can be applied).
This is only true if certain conditions are met.

The *statistical validity conditions* for a test for a single proportion is that the *expected* number of individuals in the group of interest (i.e, $n\times p$) and in the group *not* of interest (i.e., $n\times (1 - p)$) both exceed five; that is:

* both $n\times p > 5$ *and* $n\times (1 - p) > 5$.

The value of\ $5$ here is a rough figure; some books give other values (such as\ $10$).
This condition ensures that the *sampling distribution of the sample proportions has an approximate normal distribution* (so that, for example, the $68$--$95$--$99.7$ rule can be used).
The units of analysis are also assumed to be *independent* (e.g., from a simple random sample).
For a test for one proportions, these conditions are similar to those for the CI for one proportion (Sect.\ \@ref(CIOneProportion)).

If the statistical validity conditions are not met, other similar options include using a binomial test\index{Non-parametric statistics} [@conover2003practical].



::: {.example #StatisticalValidityDice name="Statistical validity"}
The hypothesis test regarding the dice is statistically valid.
Firstly, $n\times p = 50 \times (1/6) = 8.666\dots$ (i.e., expect about $8.7$\ rolls to show a <span class="larger-die">&#9856;</span>),
and $n\times (1 - p) = 41.666\dots$ (i.e., expect about $41.7$\ rolls to *not* show a 
<span class="larger-die">&#9856;</span>).
*Both* comfortably exceed five, so the normal distribution will be a good approximation for the sampling distribution.
This is what we observe from a computer simulation (Fig.\ \@ref(fig:StatValidp), left panel).
:::



::: {.example #StatisticalValidityDice2 name="Statistical validity"}
Suppose the die was rolled $10$\ times rather than $50$\ times.
Then, $n\times p = 10 \times (1/6) = 1.666\dots$ and $n\times (1 - p) = 10 \times (1 - 1/6) = 8.333\dots$.
These do not *both* exceed five, so the normal distribution may be a poor approximation for the sampling distribution.

This is what we observe from simulating the situation (Fig.\ \@ref(fig:StatValidp), right panel).
The normal model is poor: the simulation shows that the sample proportions are not even symmetrically distributed.
:::



(ref:StatValidp) The sampling distributions for two situations for rolling a die. Left: for sets of 50 rolls, the sampling distribution does have an approximate normal distribution. Right: for sets of $10$ rolls, the sampling distribution does not have a normal distribution. The solid lines show the approximate normal distributions, and the histograms show the simulated distribution of the sample proportions over many sets of rolls. The solid dots are the value $p = 1/6$, the population proportion of rolls that show a <span class="larger-die">&#9856;</span>.
\index{Hypothesis testing!one proportion|)}


<div class="figure" style="text-align: center">
<img src="26-Testing-OneProportion_files/figure-html/StatValidp-1.png" alt="(ref:StatValidp)" width="95%" />
<p class="caption">(\#fig:StatValidp)(ref:StatValidp)</p>
</div>

## Example: rolling the other die {#OneProportiontestRollOtherDie}

In $50$ rolls of the *other* die, I found a 
<span class="larger-die">&#9856;</span>
on $7$\ rolls, so that $\hat{p} = 7/50 = 0.14$.
To determine if this die appears loaded, the hypotheses are the same as before:
$$
  \text{$H_0$: } p = 1/6  \qquad\text{and}\qquad  \text{$H_1$: } p \ne 1/6.
$$
Following the procedures above (check!) and using the same hypotheses, $z = -0.506$ and (using tables) the two-tailed $P$-value is $2\times 0.3061 = 0.6122$.
This means that the sample result was not unusual if $p = 1/6$, and is certainly not persuasive evidence to support the alternative hypothesis.
There is *no evidence* to suggest the second die is loaded.

This all implies the first die was the loaded die.
Now I need to decide how to distinguish the two dice so I can tell which is which\dots


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
*A large $P$-value does not prove that the die is fair!*
It only means that the proportions of rolls that produce a 
<span class="larger-die">&#9856;</span>
is not unusual... but perhaps the die is loaded in some other way (i.e., to produce more-than-expected rolls of a 
<span class="larger-die">&#9860;</span>).


*A large $P$-value does not necessarily mean that the die is fair!*
The die may indeed be loaded to produce a larger-than-expected numbers of rolls that show a 
<span class="larger-die">&#9856;</span>,
but (due to sampling variation) the sample we observed simply did not provide evidence to make that conclusion.

The result is interpreted in terms of how much evidence exists to support the alternative hypothesis.
The onus is on the data (i.e., evidence) to refute the assumption made in the null hypothesis.
:::




## Example: dominance of birds {#OneProportiontestBirds}

@barve2017elevational compared two types of birds (male green-backed tits; male cinereous tits) to see which was more behaviourally dominant over winter.
If the species were equally-dominant, then about\ $50$% of the interactions would be won by each species.
If we define\ $p$ as the proportion of interactions won by green-backed tits, then we would expect $p = 0.50$.
However, in the $45$\ interactions observed between the two species, green-backed tits won $37$\ interactions (i.e., $\hat{p} = 37/45 = 0.82222$).
A discrepancy exists between the sample proportion ($\hat{p} = 0.8222$) and the expected population proportion $p = 0.50$.

Of course, different sample of $45$\ interactions would produce different values of\ $\hat{p}$.
To test if the population proportion of interaction wins could be equally shared, the hypotheses are:
$$
   \text{$H_0$: } p = 0.5\quad\text{and}\quad\text{$H_1$: } p \ne 0.5 \text{ (two-tailed)}.
$$
The test is statistically valid, since both $n\times p = 45\times 0.5 = 22.5$ and $n\times (1 - p) = 22.5$ exceed five.
The *standard error* is
$$
   \text{s.e.}(\hat{p}) 
   = \sqrt{\frac{p \times (1 - p)}{n}} 
   = \sqrt{\frac{0.50 \times (1 - 0.50)}{45}} 
   = 0.0745356...
$$
Then, the value of the *test statistic* is:
$$
   z 
   = \frac{\hat{p} - p}{\text{s.e.}(\hat{p})}
   = \frac{0.82222 - 0.50}{0.0745356}
   = 4.322.
$$
This is a *very* large $z$-score, so the $P$-value will be very small, using the $68$--$95$--$99.7$ rule, or using tables.
This is persuasive evidence to support the alternative hypothesis.
We write:

> *Very* strong evidence exists in the sample ($P < 0.0001$; $z = 4.325$) that the interactions were not won equally by each species ($\hat{p} = 0.8222$ won by green-backed tits; approx.\ $95$% CI: $0.708$ to\ $0.936$; $n = 45$) in the population.

Note that a different value for $\text{s.e.}(\hat{p})$ is required to produce the CI (see Def.\ \@ref(def:DEFSamplingDistributionPhat)).


## Chapter summary {#Chap28Summary}

These steps are used to test a hypothesis about a population proportion $p$.

* Write the null hypothesis ($H_0$; the sampling variation explanation) and the alternative hypothesis ($H_1$); initially *assume* the value of\ $p$ in the null hypothesis to be true.
* Describe the *sampling distribution*, which describes what to *expect* from the sample statistic across all possible samples, based on this assumption: under certain statistical validity conditions, the sample mean varies with:
   *  an approximate normal distribution,
   *  with sampling mean, whose value is the value of\ $p$,
   *  with a standard deviation of $\displaystyle \text{s.e.}(\hat{p}) = \sqrt{\frac{p \times (1 - p)}{n}}$, where\ $p$ is the hypothesised value given in the null hypothesis, and\ $n$ is the sample size.
* Compute the value of the *test statistic*:
$$
   z = \frac{ \hat{p} - p}{\text{s.e.}(\hat{p})}.
$$
* Compute an approximate *$P$-value* using the $68$--$95$--$99.7$ rule, or using tables.
  Use the $P$-value to make a decision, and write a conclusion.
* Check the statistical validity conditions.



## Quick review questions  {#Chap31-QuickReview}

::: {.webex-check .webex-box}
A study of diseases in Native Americans [@kizer2006digestive] found $381$\ obese or overweight patients in $449$\ patients.
Across all the US population, the percentage obese or overweight was\ $65$%.
The researchers wanted to determine if the percentage of obesity/overweight Native Americans was *greater* than that of the general population.

Are the following statements *true* or *false*?

1. The sample size is $n = 381$. \tightlist
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. The value of the *sample* proportion is\ $\hat{p} = 381$.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. The *null* hypothesis is\ $H_0$: $p = 0.65$.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. The *alternative* hypothesis is\ $H_0$: $p = 0.8486$.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. We initially assume the *population* proportion of overweight/obese Native Americans is\ $0.65$.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. The *alternative* hypothesis is *one*-tailed.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. In a one-sample test of proportion, the $z$-score is always large.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. The value of the $z$-score for this example is $8.82$.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. We have evidence to support the alternative hypothesis in this example.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. We always accept the *null* hypothesis.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
:::


## Exercises {#OneProportionTestExercises}

[Answers to odd-numbered exercises] are given at the end of the book. 




:::{.exercise #sepPWhy1}
Explain *why* the standard error is computed using\ $p$ for hypothesis testing, but using\ $\hat{p}$ for CIs.
:::


:::{.exercise #sepPWhy2}
Explain why describing the sampling distribution is difficult if we *assume* $p \ne 1/6$.
:::


:::{.exercise #OneProportionTestExplainA}
In the die example, the observed proportion is $0.38$.
Could we simply state that the proportion clearly is not $1/6 = 0.1666$?
Explain.
:::



:::{.exercise #OneProportionTestExplainB}
Explain why we compute $\text{s.e.}(\hat{p})$ and not\ $\text{s.e.}(p)$.
:::


:::{.exercise #OneProportionTestExercisesDodgyA}
What is wrong with the following statement, after testing $H_0$: $p = 0.25$:

> There is very strong evidence that the sample proportion is greater than\ $0.25$.
:::


:::{.exercise #OneProportionTestExercisesDodgyB}
Explain what is wrong with this statement from @davis2024higher, that appears under their Table\ 2:

> One proportion $z$-test with $H_0 = 0.076$, the proportion of UDT in our sample...
:::


::: {.exercise #OneProportionTestExercisesPlacebos}
The study of herbal medicines is complicated, as *blinding* subjects\index{Blinding!individuals} is difficult: placebos\index{Placebo} are often easily identifiable by eye, by taste, or by smell.

@loyeung2018experimental studied if subjects could identify potential placebos at a *better* rate than just guessing.
The $81$ subjects were each presented with a choice of five different supplements, four of which were placebos.
Subjects were asked to select which one was the legitimate herbal supplement based on the *taste*; $50$\ subjects correctly selected the true herbal supplement.

1. If the subjects were selecting the true herbal supplement randomly, what proportion of subjects would be expected to select the correct supplement as the true herbal medicine?
2. Write the hypotheses for addressing the aims of the study.
3. Is this a one- or two-tailed test? 
   Explain.
4. Sketch the *sampling distribution* of the sample proportion, assuming $H_0$ is correct, for $n = 81$.
5. Is there evidence that people can identify the true supplement by taste?
6. Are the statistical validity conditions satisfied?
:::


::: {.exercise #POnePropTestMeasles}
@kim2004sero studied the measles-rubella vaccination-rates in Korea, comparing the proportion of children susceptible to measles with the *World Health Organization* target proportion (for children aged\ $5$ to\ $9$ years old: $10$%).

The aim was to test if the proportion of Korean children susceptible to measles in the *population* was $10$%\ or *lower* (i.e., better).
In the study, $55$\ children out of\ $972$ were susceptible to measles.

1. Compute the sample proportion\ $\hat{p}$ of children susceptible to measles.
2. Write the hypotheses for the test.
   Is the test one- or two-tailed?
3. Compute the standard error for the test.
4. Compute the $z$-score and determine the $P$-value.
5. Write a conclusion.
6. Are the statistical validity conditions satisfied?
:::


::: {.exercise #OneProportionTestTurtleSex}
@streeting2022optimising studied western saw-shelled turtles.
When eggs were incubated at $27$^o^C, they observed that $29$\ males and $44$\ females hatched.
Are the proportions of male and female turtles that hatch at this temperature equal?
:::


::: {.exercise #OneProportionTestExercisesEPL}
[*Dataset*: `PremierL`]
In the 2019/2020 English Premier League (EPL), the home team won $91$\ games, and the away team won $67$\ games.
(Another $50$\ games were draws.)

Use the $n = 158$\ games with a result to determine if there is evidence that the home team wins more often than\ $50$% (i.e., that there is a home-side advantage).
:::


::: {.exercise #OneProportionTestExercisesPedalMachines}
@maeda2013introducing introduced pedal machines on the first floor of the Joyner Library for use by students at East Carolina University (ECU) to increase activity in library users.
At ECU, $60.2$%\ of all students were females (i.e., in the population).
Students were observed using the machine on $589$\ occasions, of which\ $295$ times were by females

Is there evidence that the proportion of female users of the machines was *lower* than the overall female proportion at the university?
What would you conclude?
:::


::: {.exercise #OneProportionTestExercisesCasinos}
@koenen1995analysis found that $88$\ of the $357$\ visitors to Las Vegas casinos in 1995 were smokers.
At the time, $25.5$%\ of the general US population were smokers (based on data from the US *National Center for Health Statistics*).
Is the proportion of smokers among casino-goers the same as for the general US population?
:::


:::{.exercise #OneProportionBreadfruitPasta}
@nochera2019development developed gluten-free pasta made from breadfruit.
In the study sample, $57$\ of the $71$\ participants stated that they liked the pasta.
Do the researchers have sufficient evidence to claim that the 'majority of people like breadfruit pasta'?
:::


::: {.exercise #OneProportionTestExercisesCTS}
Carpal Tunnel Syndrome (CTS) is a painful condition in the wrists.
@boltuch2020palmaris were interested in whether 'a relationship exists between the palmaris tendon [and] carpal tunnel syndrome (CTS)' (p.\ 493).
The palmaris longus (PL) tendon is visually absent in about\ $15$% of the population.
The researchers found PL was visually absent in\ $33$ of\ $516$ CTS wrists in their sample.
Is there evidence to suggest that rate of PL absence is *different* in CTS cases, compared to the general population? 
:::


::: {.exercise #OneProportionTestExercisesBorers}
@siegfried2014estimating studied resistance of some commercial corn varieties to the European corn borer. 
Borers were collected from corn in Iowa and Nebraska.

Researchers aimed to estimate the frequency of resistance to the toxin in the corn.
By mating borers collected from the field with various resistant laboratory individuals, they could determine what proportion of resistant individuals to expect in the second generation offspring.
In one study of $n = 172$ second-generation individuals, $24$\ were found to be resistant. 
The theoretical expectation was that $1$-in-$16$ of the second-generation borers would be resistant if the field borers were resistant.
Perform a hypothesis test to determine if the data suggest that the field borers were resistant (that is, if the population proportion is\ $1/16$) as expected.
:::


::: {.exercise #OneProportionTestExercisesLEDlights}
@davidovic2019drivers studied street-light preferences of drivers.
Drivers were asked to conduct a series of manoeuvres under $3\,000$K\ LED light and then under $4\,000$K\ LED lights.
They were then asked to decide which street light they preferred.
Out of the $52$\ subjects, $29$\ preferred the $3\,000$K\ LED lights.
Is there evidence that the choice between the two street lights is random, or is there evidence of a preference for one over the other?
:::



::: {.exercise #OneProportionTestExercisesCoinSpin}
The euro was introduced as a currency on 01\ January 1999.
According to a report by the 
[*New Scientist*](https://www.newscientist.com/article/dn1748-euro-coin-accused-of-unfair-flipping/),
students in Poland spun a Belgian one-euro coin $250$\ times, and found $140$\ heads (as reported by @data:Gelman2002:DiceCoins).
This resulted in an 'accusation of bias' in the *New Scientist* article.
However, every set of $250$\ spins can produce a different proportion of heads, so perhaps the results is just due to randomness.
Does this sample of $250$\ spins suggest that the one-euro Belgian coin is biased?
:::


::: {.exercise #OneProportionTestExercisesBirths}
As noted in Sect.\ \@ref(ProbRelFreq), the 
[*Australian Bureau of Statistics* (ABS)](http:www.abs.gov.au/ausstats/abs@.nsf/0/B8865D71D84F5210CA2579330016754C?opendocument)
stated that:

> The sex ratio for all births registered in Australia generally fluctuates around $105.5$\ male births per $100$\ female births.

(This statistic does not use births registered as 'other' or 'not stated'.)

1. The value of\ $105.5$ is effectively a population odds ratio of male-to-female births.
   Show that this is equivalent to the population proportion of male births as\ $0.51338$ (not including 'other' or 'not stated').
2. In\ 2021, there were $148\,636$\ male births and $140\,944$\ female births.
   Compute the *sample* proportion of male births in\ 2021 (to five decimal places).
<!--   (Another $23$\ births were registered as 'other' or 'not stated', but are not used.) -->
3. Conduct a test to determine if the 2021\ data appear different to the long-term proportion.
:::





<!-- QUICK REVIEW ANSWERS -->
<!--
::: {.EOCanswerBox .EOCanswer data-latex="{iconmonstr-check-mark-14-240.png}"}
\textbf{Answers to \textit{Quick review} questions:}
**1.** False.
**2.** False; $\hat{p} = 381/449 = 0.84855$.
**3.** True.
**4.** False.
**5.** True.
**6.** True.
**7.** False.
**8.** True.
**9.** True.
**10.** False.
:::



<!-- ::: {.exercise #OneProportionTestExercisesIguanas} -->
<!-- @avery2014invasive studied black spiny-tailed iguanas in Florida (an invasive species). -->
<!-- They measured the iguanas' snout--vent length (SVL). -->
<!-- Of the $275$ iguanas with a SVL between $100$ and $149$\ mm, $146$ were female. -->

<!-- Assuming female and male iguanas were equally present in the population, is there evidence that female and male iguanas were equally-likely to be found with SVL in this range? -->
<!-- ::: -->


<!-- ::: {.exercise #OneProportionTestExercisesPenguins} -->
<!-- @vanstreels2013female studied Magellanic penguins found dead or stranded on the southern Brazilian coast. Of the $73$ adult penguins found, $47$ were female, -->

<!-- Assuming female and male penguins were equally present in the population, we would expect about half the dead or stranded penguins to be female and male. -->
<!-- Is this what the data suggest? -->
<!-- ::: -->

<!-- ## Example: obesity REMOVE {#OneProportiontestObesity} -->

<!-- @kolanska2010high compared the rate of obesity in $n = 143$ Polish patients with adrenal tumours to that of the general population of Poland ($p = 0.125$), to test if those with adrenal tumours were *more likely* to be obese that the general population. -->
<!-- The hypotheses are:   -->
<!-- \[ -->
<!--    \text{$H_0$: } p = 0.125\quad\text{and}\quad\text{$H_1$: } p > 0.125\text{ (one-tailed)}. -->
<!-- \] -->
<!-- Assuming the null hypothesis is true, the standard error is (remembering to use $p$):   -->
<!-- \[ -->
<!--    \text{s.e.}(\hat{p})  -->
<!--    = \sqrt{\frac{p (1 - p)}{n}}  -->
<!--    = \sqrt{\frac{.125 \times (1 - 0.125)}{143}}  -->
<!--    = 0.027656... -->
<!-- \] -->
<!-- In their sample, $57$ were obese, so $\hat{p} = 57/143 = 0.3986...$. -->
<!-- Then, the value of the *test statistic* is:   -->
<!-- \[ -->
<!--    z  -->
<!--    = \frac{\hat{p} - p}{\text{s.e.}(p)} -->
<!--    = \frac{0.3986 - 0.125}{0.027656} -->
<!--    = 9.89. -->
<!-- \] -->
<!-- This is an *extremely* large $z$-score, so expect a very small $P$-value using the 68--95--99.7 rule. -->

<!-- The $95$%\ CI for the proportion requires the standard error computed from the *sample* proportion:   -->
<!-- \[ -->
<!--    \text{s.e.}(\hat{p})  -->
<!--    = \sqrt{\frac{\hat{p} (1 - \hat{p})}{n}}  -->
<!--    = \sqrt{\frac{0.3986 \times (1 - 0.3986)}{143}}  -->
<!--    = 0.040943... -->
<!-- \] -->
<!-- The approximate $95$%\ CI is $0.3986 \pm(2 \times 0.040943...)$. -->
<!-- We write: -->

<!-- > *Very* strong evidence exists in the sample (one-tailed $P < 0.001$; $z = 9.89$) that the rate of obesity in patients with adrenal tumours ($\hat{p} = 0.3986$; $n = 143$; approximate 95% CI: 0.317 to 0.480) is higher than the general Polish population. -->




