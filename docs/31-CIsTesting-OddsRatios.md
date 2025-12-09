
# Comparing two odds or proportions: CIs and tests {#AnalysisOddsRatio}


<!-- Introductions; easier to separate by format -->

::: {.objectivesBox .objectives data-latex="{iconmonstr-target-4-240.png}"}
You have learnt to ask an RQ, design a study, classify and summarise the data, construct confidence intervals, and conduct hypothesis tests.
**In this chapter**, you will learn to:

* identify situations where comparing proportions or odds is appropriate.
* form confidence intervals for the difference between two proportions.
* form confidence intervals for odds ratios.
* conduct hypothesis tests for comparing two proportions.
* conduct hypothesis tests for comparing two odds.
* determine whether the conditions for using these methods apply in a given situation.
:::


<img src="31-CIsTesting-OddsRatios_files/figure-html/unnamed-chunk-30-1.png" width="65%" height="33%" style="display: block; margin: auto;" />




<!-- Define colours as appropriate -->






## Introduction: meals on-campus {#MealsOnCampus}


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/pexels-startup-stock-photos-7096.jpg" width="200px"/>
</div>


@data:Mann12017:UniStudents examined the relationship between where university students usually ate, and where the student lived,
for students from two Canadian universities.
The researchers cross-classified the $n = 183$ students (the units of analysis) according to two *qualitative* variables:

* where the student lived, *with* their parents or *not with* their parents.
* where the student ate most meals, *off*-campus or *on*-campus.


Both variables are qualitative, so means are not appropriate for summarising the data.
The data can be compiled into a two-way table of counts\index{Tables!two-way} (Table\ \@ref(tab:MealsDataTable)), also called a *contingency table*.\index{Two-way tables}
Both qualitative variables have two levels, so this is a $2\times 2$ table.
Every cell in the $2\times 2$ table contains different students, so the comparison is *between* individuals.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
The study has one sample of students, classified according to two variables (i.e., each student is placed into one of the four cells in the $2\times 2$ table).
:::



<table>
<caption>(\#tab:MealsDataTable)Where university students live and eat.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Most off-campus </th>
   <th style="text-align:center;"> Most on-campus </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Living with parents </td>
   <td style="text-align:center;"> $52$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}2$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Not living with parents </td>
   <td style="text-align:center;"> $105$ </td>
   <td style="text-align:center;"> $\phantom{0}24$ </td>
  </tr>
</tbody>
</table>



The *proportion* of students who eat most meals off-campus can be compared between those who live with their parents and those who do *not* live with their parents.
Then, the parameter is the difference between the population proportions in each group.

Alternatively, the *odds* of students who eat most meals off-campus can be compared between those who live with their parents and those who do *not* live with their parents.
Then, the parameter is the comparison of the odds in both groups, the *odds ratio* (OR);\index{Odds ratio} specifically, the OR of eating most meals off-campus, comparing those living with parents to those not living with parents.


::: {.softwareBox .software data-latex="{iconmonstr-laptop-4-240.png}"}
The table can be constructed with either variable as the rows.
However, software commonly compares *rows*, so it makes sense to place the groups to be compared (i.e., the levels of the explanatory variable) in the rows of the table.
:::




## Summarising data {#CIOddsRatiosSummaries}
\index{Odds}\index{Difference between proportions}\index{Odds ratio}

Since two groups are being compared, subscripts are used to distinguish between the two groups; say, Groups\ $1$ and\ $2$ in general (Table\ \@ref(tab:ORHT)).
For this example, we use\ $N$ to refer to students *not* living with their parents, and\ $L$ for students living with their parents.


<table>
<caption>(\#tab:ORHT)Notation used to distinguish the two independent groups.</caption>
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;">   </th>
   <th style="text-align:center;font-weight: bold;"> Group 1 </th>
   <th style="text-align:center;font-weight: bold;"> Group 2 </th>
   <th style="text-align:center;font-weight: bold;"> Comparing groups </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Sample sizes: </td>
   <td style="text-align:center;"> $n_1$ </td>
   <td style="text-align:center;"> $n_2$ </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sample odds: </td>
   <td style="text-align:center;"> $\text{Odds}_1$ </td>
   <td style="text-align:center;"> $\text{Odds}_2$ </td>
   <td style="text-align:center;"> $\text{Odds ratio (OR)} = \text{Odds}_1/\text{Odds}_2$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sample proportions: </td>
   <td style="text-align:center;"> $\hat{p}_1$ </td>
   <td style="text-align:center;"> $\hat{p}_2$ </td>
   <td style="text-align:center;"> $\hat{p}_1 - \hat{p}_2$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Standard errors: </td>
   <td style="text-align:center;"> $\displaystyle\text{s.e.}(\hat{p}_1)$ </td>
   <td style="text-align:center;"> $\displaystyle\text{s.e.}(\hat{p}_2)$ </td>
   <td style="text-align:center;"> $\displaystyle\text{s.e.}(\hat{p}_1 - \hat{p}_2)$ </td>
  </tr>
</tbody>
</table>


The parameter is either a difference between two population proportions, or a population OR.
For example, the parameter could be the difference between population proportion of students eating most meals *off*-campus, comparing students living with their parents, to students *not* living with their parents.
Alternatively (and equivalently), the parameter could be the population\ OR of eating most meals *off*-campus, comparing students living with their parents, to students *not* living with their parents.


<div class="figure" style="text-align: center">
<img src="jamovi/UniStudents/UniStudents-Chisq-zTest-All.png" alt="Software output for comparing the odds and proportion of students eating most meals at home, for students living with and not with their parents" width="65%" />
<p class="caption">(\#fig:EatingSoftware)Software output for comparing the odds and proportion of students eating most meals at home, for students living with and not with their parents</p>
</div>


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Since software commonly compares *rows* (for example, see the text under the bottom table in Fig.\ \@ref(fig:EatingSoftware)), it makes sense to place the groups to be compared (i.e., the explanatory variable) in the rows of the table.

Then, the difference between the two proportions are usually calculated as the Row\ 1 proportion minus the Row\ 2 proportion.
Similarly, the odds then can be interpreted as\index{Odds ratio!interpreting}\index{Software output!comparing two odds (odds ratio)} comparing Column\ 1 counts to Column\ 2 counts, and the *odds ratio* as comparing the Row\ 1 odds to the Row\ 2 odds.
:::


The RQ and the hypotheses can be written as comparing *proportions* (Sect.\ \@ref(CompareTwoProportions)), comparing *odds* (Sect.\ \@ref(CompareTwoOdds)), or about *ORs*.
With two qualitative variables, an appropriate numerical summary includes the odds and proportions (or percentages) for the outcome for both comparison groups, and the sample sizes (Table\ \@ref(tab:EatingNumericalSummary)).

To compare the *proportions*, define the sample proportion of students eating most meals off-campus as\ $\hat{p}$, and write\ $\hat{p}_L$ for the proportion living with parents and\ $\hat{p}_N$ for the proportion *not* living with parents.
Then,
$$
  \hat{p}_L = \frac{52}{52 + 2} = 0.96296
  \quad\text{and}\quad
  \hat{p}_N = \frac{105}{105 + 24} = 0.813953.
$$
The *difference* between the two proportions is
$$
  \hat{p}_L - \hat{p}_N = 0.9630 - 0.8140 =  0.1490,
$$
(as in the software output: Fig.\ \@ref(fig:EatingSoftware)).
By this definition, the difference is how much greater the proportion eating most meals off-campus is for students *living* with their parents, compared to students *not living* with their parents.


::: {.tipBox .tip data-latex="{iconmonstr-info-6-240.png}"}
Be clear about how differences are defined!
Differences could be computed as:

* the proportion eating most meals off-campus for those living with their parents, *minus* the proportion *not* living with their parents.
This measures how much greater the proportion is for those living with their parents; or
* the proportion eating most meals off-campus for those *not* living with their parents, *minus* the proportion living with their parents.
This measures how much greater the proportion is for those *not* living with their parents.

Either is fine, provided you are *consistent*, and *clear* about how the differences are computed.
The *meaning* of any conclusions will be the same.
:::

To compare the *odds*, first see that the odds of eating most meals *off-campus* is:

* $52 \div  2 = 26$    for students     *living with their parents* (Row\ 1 of Table\ \@ref(tab:MealsDataTable)).
* $105\div 24 = 4.375$ for students *not living with their parents* (Row\ 2 of Table\ \@ref(tab:MealsDataTable)).

(Notice the numbers in the *second* column are always on the bottom of the fraction.)
So the *OR* of eating most meals *off-campus* (the *first* column), comparing students living with parents to students *not* living with parents (*second* column), is $26 \div 4.375 = 5.943$ (as in the software output: Fig.\ \@ref(fig:EatingGraphs)).

The numerical summary (Table\ \@ref(tab:EatingNumericalSummary)) shows the proportion and odds of eating most meals off-campus, comparing students living at home and those not living at home.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
The OR can be interpreted in *either* of these ways (i.e., both are correct):\index{Odds ratio!interpreting}\index{Software output!comparing two odds (odds ratio)}

* the *odds* compare Row\ 1 counts to Row\ 2 counts, for both columns.
   The *OR* then compares the Column\ 1 odds to the Column\ 2 odds.
* the *odds* compare Column\ 1 counts to Column\ 2 counts.
   The *OR* then compares the Row\ 1 odds to the Row\ 2 odds.

Odds and ORs are computed with the *first row* and *first column* values on the *top* of the fraction.
Since the explanatory variable is usually in the rows, the second is usually the most useful.
In this case, both of the above approaches produces an OR of\ $5.943$.
:::


An appropriate graph is a side-by-side bar chart\index{Graphs!side-by-side bar chart} or a stacked bar chart\index{Graphs!stacked bar chart} (Fig.\ \@ref(fig:EatingGraphs)).
The side-by-side bar is useful for comparing odds.
For instance, in the two left-most bars in Fig.\ \@ref(fig:EatingGraphs) (left panel), the first bar is $26$\ times as high as the second bar (and $26$\ is the odds); in the two right-most bars, the first bar is $4.375$\ times as high as the second bar (and $4.375$\ is the odds).
A stacked bar chart is useful for comparing proportions.


<table>
<caption>(\#tab:EatingNumericalSummary)The odds and proportion of university students eating most meals off-campus.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Odds of having most
 meals off-campus </th>
   <th style="text-align:center;"> Proportion having most
 meals off-campus </th>
   <th style="text-align:center;"> Sample size </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Living with parents </td>
   <td style="text-align:center;"> $26.000$ </td>
   <td style="text-align:center;"> $\phantom{0}0.963$ </td>
   <td style="text-align:center;"> $\phantom{0}54$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Not living with parents </td>
   <td style="text-align:center;"> $\phantom{0}4.375$ </td>
   <td style="text-align:center;"> $\phantom{0}0.814$ </td>
   <td style="text-align:center;"> $129$ </td>
  </tr>
  <tr>
   <td style="text-align:left;">  </td>
   <td style="text-align:center;"> OR: $5.943$ </td>
   <td style="text-align:center;"> Difference: $0.149$ </td>
   <td style="text-align:center;">  </td>
  </tr>
</tbody>
</table>




<div class="figure" style="text-align: center">
<img src="31-CIsTesting-OddsRatios_files/figure-html/EatingGraphs-1.png" alt="The student-eating data. Left: a side-by-side bar chart. Right: a stacked bar chart." width="95%" />
<p class="caption">(\#fig:EatingGraphs)The student-eating data. Left: a side-by-side bar chart. Right: a stacked bar chart.</p>
</div>



## Confidence intervals for comparing proportions {#CICompareProportions}
\index{Confidence intervals!comparing two proportions|(}\index{Sampling distribution!comparing two proportions}\index{Difference between proportions}


The sample proportions for each group will vary from sample to sample, and the *difference* between the sample proportions will be different for each sample.
Hence, the *difference* between the two sample proportions has a sampling distribution and *standard error*.
Under certain conditions (Sect.\ \@ref(ValidityChiSq)), this sampling distribution has a normal distribution.


::: {.definition #DEFSamplingDistributionDiffProportions name="Sampling distribution for the difference between two sample proportions for a CI"}
When constructing a CI, the *sampling distribution of the difference between two sample proportions*\ $\hat{p}_1$ and\ $\hat{p}_2$ is (when the appropriate conditions are met; Sect.\ \@ref(ValidityChiSq)) described by:

* an approximate normal distribution,
* centred around a sampling mean whose value is ${p_1} - {p_2}$, the difference between the *population* proportions,
* with a standard deviation, called the standard error of the difference between the proportions, of $\displaystyle\text{s.e.}(\hat{p}_1 - \hat{p}_2)$.

The standard error for the difference between the proportions is found using
\begin{equation}
  \text{s.e.}(\hat{p}_1 - \hat{p}_2) = \sqrt{ \text{s.e.}(\hat{p}_1)^2 + \text{s.e.}(\hat{p}_2)^2},
  (\#eq:SEtwoproportionsCI)
\end{equation}
though this value will often be *given* (e.g., on computer output).
:::


For the student-eating data, the standard errors of the sample proportions for each group are computed using Equation\ \@ref(eq:stderrorphat) as
\begin{align*}
  \text{s.e.}(\hat{p}_L) &= \sqrt{\frac{0.962963 \times (1 - 0.962963)}{54}}   = 0.025700, \text{and}\\
  \text{s.e.}(\hat{p}_N) &= \sqrt{\frac{0.8139535\times (1 - 0.8139535)}{129}} = 0.034262.
\end{align*}
The standard error of the difference between the proportions is then
$$
\text{s.e.}(\hat{p}_L - \hat{p}_N)
= \sqrt{ \text{s.e.}(\hat{p}_L)^2 + \text{s.e.}(\hat{p}_N)^2}
= \sqrt{ 0.025700^2 + 0.034262^2 } = 0.042830.
$$

Thus, the differences between the sample proportions will have:

* an approximate normal distribution,
* centred around the sampling mean whose value is $p_L - p_N$,
* with a standard deviation of $\text{s.e.}(\hat{p}_L - \hat{p}_N) = 0.0428295$.


The sampling distribution describes how the values of $\hat{p}_L - \hat{p}_N$ vary from sample to sample. 
Then, finding a $95$%\ CI for the difference between the proportions is similar to the process used previously, since the sampling distribution has an approximate normal distribution:
$$
\text{statistic} \pm \big(\text{multiplier} \times\text{s.e.}(\text{statistic})\big).
$$
When the statistic is $\hat{p}_L - \hat{p}_N$, the approximate $95$%\ CI is
$$
(\hat{p}_L - \hat{p}_N) \pm \big(2 \times \text{s.e.}(\hat{p}_L - \hat{p}_N)\big).
$$
So, in this case, the approximate $95$%\ CI is
$$
0.1490 \pm (2 \times 0.042830),
$$
or $0.149 \pm 0.0857$ after rounding (i.e., from\ $0.0633$ to\ $0.235$).
This approximate\ CI is very similar to the (exact) CI from software (Fig.\ \@ref(fig:EatingGraphs)).\index{Software output!comparing two proportions}
We write:

> The difference between the proportions of students eating most meals at home is\ $0.1490$, higher for those living with their parents ($0.963$; $n = 52$) than those not living with their parents ($0.814$; $n = 129$), with the approximate $95$%\ CI from\ $0.0633$ to\ $0.235$.

The plausible values for the difference between the two population proportions are between\ $0.063$ to\ $0.235$, larger for those living with parents.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Giving the CI alone is insufficient; the *direction* in which the differences were calculated must be given, so readers know which group had the higher proportion.
:::
\index{Confidence intervals!comparing two proportions|)}


## Hypothesis tests for comparing proportions: $z$-test {#CompareTwoProportions}
\index{Hypothesis testing!comparing two proportions|(}\index{Difference between proportions}

To compare the two proportions using a hypothesis test, the two-tailed RQ is:

> Is the *population* proportion of students eating most meals off-campus the same for students *living with* their parents and for students *not living with* their parents?

As usual, the population values are unknown, so the parameter $p_L - p_N$ is estimated using the statistic $\hat{p}_L - \hat{p}_N$.

Hypothesis testing always begins by assuming that the null hypothesis is true (Sect.\ \@ref(HypothesisNull)).
In this context, that means assuming that the population proportion of eating most meals off-campus is the same in both groups:

* $H_0$: $p_L - p_N = 0$ (equivalent to $p_L = p_N$).

From the RQ, the alternative hypothesis is *two*-tailed:

* $H_1$: $p_L - p_N \ne 0$ (equivalent to $p_L \ne p_N$).

Because the null hypothesis is assumed to be true, the proportions are assumed to have the same value for both groups.
Hence, the data from the two groups can be combined to determine an overall (or common) proportion of students eating most meals off-campus:
\begin{equation}
  \hat{p} = \frac{52 + 105}{52 + 105 + 2 + 24} = \frac{157}{183} = 0.85792.
  (\#eq:OverallP)
\end{equation}
This is the overall proportion of students eating most meals off-campus, since we assumed no difference between students living with and not with their parents.
Effectively, this proportion has been computed by summing the columns in Table\ \@ref(tab:MealsDataTable) and using this combined data to compute the proportion of students eating most meals off-campus.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
As with any hypothesis test, the null hypothesis is assumed to be true.
For a test comparing two proportions, that implies the proportion in each group is the same, and so the standard errors are computed using the common (overall) proportion.
:::


The *sample* proportions for the two groups ($L$ and\ $N$) will vary from sample to sample and so have a sampling distribution.
The standard error of the sample proportion for each sample is computed using this common proportion\ $\hat{p}$, using the same idea as in Equation\ \@ref(eq:stderrorphat):
\begin{align*}
  \text{s.e.}(p_L) &= \sqrt{ \frac{\hat{p}\times(1 - \hat{p})}{n_L}} = \sqrt{ \frac{0.85792\times(1 - 0.85792)}{54}} = 0.047511, \text{and}\\
  \text{s.e.}(p_N) &= \sqrt{ \frac{\hat{p}\times(1 - \hat{p})}{n_N}} = \sqrt{ \frac{0.85792\times(1 - 0.85792)}{129}} = 0.030739.
\end{align*}


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
When computing the standard errors as part of a *hypothesis test*, the common or overall proportion is used to compute the standard errors.
:::


The difference between the two proportions will vary from sample to sample too, and hence have a sampling distribution; under certain conditions (Sect.\ \@ref(ValidityChiSq)), this sampling distribution will have a normal distribution.
The standard error of this sampling distribution for the *difference* between the proportions is
$$
  \text{s.e.}(\hat{p}_L - \hat{p}_N) = \sqrt{ \text{s.e.}(\hat{p}_L)^2 +  \text{s.e.}(\hat{p}_N)^2 }
  =
  \sqrt{ 0.047511^2 + 0.030739^2} = 0.056588,
$$
which is similar to Equation\ \@ref(eq:SEtwoproportionsCI), except that a common proportion was used to compute $\text{s.e.}(\hat{p}_L)$ and $\text{s.e.}(\hat{p}_L)$.


::: {.definition #DEFSamplingDistributionDiffProportionsHT name="Sampling distribution for the difference between two sample proportions for a hypothesis test"}
When conducting a hypothesis test, the *sampling distribution of the difference between two sample proportions*\ $\hat{p}_1$ and\ $\hat{p}_2$ is (when the appropriate conditions are met; Sect.\ \@ref(ValidityChiSq)) described by:

* an approximate normal distribution,
* centred around a sampling mean whose value is ${p_{1}} - {p_{2}}$, the difference between the *population* proportions (from $H_0$),
* with a standard deviation, called the standard error of the difference between the proportions, of $\displaystyle\text{s.e.}(\hat{p}_1 - \hat{p}_2)$.

The standard error for the difference between the proportions is
$$
  \text{s.e.}(\hat{p}_1 - \hat{p}_2) = \sqrt{ \text{s.e.}(\hat{p}_1)^2 +  \text{s.e.}(\hat{p}_2)^2 },
$$
where
$$
  \text{s.e.}(p_1) = \sqrt{ \frac{\hat{p}\times(1 - \hat{p})}{n_1}}
  \quad\text{and}\quad
  \text{s.e.}(p_2) = \sqrt{ \frac{\hat{p}\times(1 - \hat{p})}{n_2}},
$$
where\ $\hat{p}$ is the common (overall) sample proportion.
:::


Since the sampling distribution has an approximate normal distribution, the test statistic is\index{Test statistic!z@$z$-score}
$$
  z = \frac{ (\hat{p}_L - \hat{p}_N) - (p_L - p_N) }{\text{s.e.}(\hat{p}_L - \hat{p}_N)} \
  = \frac{ 0.14901 - 0}{0.056588} 
  = 2.633.
$$
Since the sampling distribution has an approximate normal distribution, the approximate $P$-value can be computed from normal distribution tables (Sect.\ \@ref(ExactAreasUsingTables)), approximated using the $68$--$95$--$99.7$ rule,\index{68@$68$--$95$--$99.7$ rule} or from software output (Fig.\ \@ref(fig:EatingSoftware)).\index{Software output!comparing two proportions}
The two-tailed $P$-value reported by software (Fig.\ \@ref(fig:EatingSoftware), under the column\ `p`) is indeed small: $0.008$ to three decimal places.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
The test statistic for tests involving proportions is a $z$-score and *not* a $t$-score.
:::


A small $P$-value means strong evidence exists to supporting\ $H_1$: the evidence suggests a difference between the *population* proportions.
We write:

> The *sample* provides strong evidence ($z = 2.63$; two-tailed $P = 0.008$) that the proportion of students in the *population* of having most meals off-campus is different for students living with their parents (proportion: $0.963$, $n = 54$) and students *not* living with their parents (proportion: $0.814$, $n = 129$; difference: $0.149$; approximate $95$%\ CI from\ $0.0633$ to\ $0.235$, higher for students living with their parents).

The conclusion includes three components (Sect.\ \@ref(WordingConclusion)): the *answer to the RQ*; the *evidence* used to reach that conclusion ('$z = 2.63$; two-tailed $P = 0.008$'); and some *sample summary statistics* (including the $95$%\ CI for the difference between proportions).
The conclusion makes clear which proportion is higher.
\index{Hypothesis testing!comparing two proportions|)}


## Confidence intervals for comparing odds (for an odds ratio) {#CICompareOdds}
\index{Sampling distribution!odds ratio}\index{Odds ratio}\index{Confidence intervals!comparing two odds (odds ratio)|(}

A CI can be formed for the OR, as well as for the difference between two proportions.
Every sample of students is likely to be different, and hence the odds of students eating off campus will vary from sample to sample (in both groups).
Hence, the OR varies also from sample to sample.
That is, *sampling variation* exists, so the OR has a *sampling distribution*.

However, the sampling distribution of the sample OR does *not have a normal distribution*.^[For those interested (this is *optional*): the *logarithm* of the OR has an approximate normal distribution under certain conditions.]
For this reason, the CI for the OR will be taken directly from software output, and the sampling distribution is not discussed.

Software\index{Software output!comparing two odds (odds ratio)} (Fig.\ \@ref(fig:EatingGraphs), right panel) gives the sample OR as\ $5.94$, and the (exact) $95$%\ CI as\ $1.35$ to\ $26.1$.
The value of the OR is the same as the value computed manually.


<!-- ```{r UniMealsTestOutputjamovi, fig.show="hold", fig.cap="The jamovi output for computing a CI", fig.align="center", out.width="49%"} -->
<!-- knitr::include_graphics( "jamovi/UniStudents/UniStudents-OR-CI.png") -->
<!-- #knitr::include_graphics( "SPSS/UniStudents/UniStudentsRiskOutput.png") -->
<!-- ``` -->


We write:

> The odds of students eating most meals off-campus is\ $5.94$, higher for students living with their parents (odds:\ $26.0$; $n = 54$) than for students *not* living with their parents (odds:\ $4.38$; $n = 129$), with the $95$%\ CI from\ $1.35$ to\ $26.1$.

There is a $95$%\ chance that this CI straddles the population OR.\spacex
Notice that the *meaning* of the OR is explained in the conclusions: the odds of eating most meals *off*-campus, and comparing students living with parents to *not* living with parents.

*The CI for an OR is not symmetrical*, like the others we have seen;^[For those interested (this is *optional*): this is because the OR has no upper limit, but the lower limit of an OR is zero. 
The *logarithm* of the limits of the CI form a symmetric interval.] that is, the sample OR of\ $5.94$ is not in the centre of the CI.


::: {.tipBox .tip data-latex="{iconmonstr-info-6-240.png}"}
Interpreting and explaining ORs can be challenging, so care is needed!
:::
\index{Confidence intervals!comparing two odds (odds ratio)|)}


<iframe src="https://learningapps.org/watch?v=pqzmnub7n22" style="border:0px;width:100%;height:500px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>



## Hypothesis tests for comparing odds: $\chi$-test {#CompareTwoOdds}
\index{Odds ratio}\index{Hypothesis testing!odds ratio|(}

### Hypotheses {#TwoOddsHypotheses}

For the $2\times 2$ table of counts in Table\ \@ref(tab:MealsDataTable), odds can be compared rather than proportions:

> Are the *population odds* of students eating most meals off-campus the same for students *living with* their parents and for students *not living with* their parents?

If the odds are the same in the two groups, this is equivalent to an OR of one.
Hence, the RQ could also be written as

> Is the *population OR* of eating most meals off-campus, comparing students who live *with their* parents to students *not living with* their parents, equal to one?

Either way, the *parameter* is the population OR, and the null hypothesis is the 'no difference, no change, no relationship' position:

* $H_0$: The *population*\ OR is one, or (equivalently)  
\phantom{$H_0$:{}} The *population* odds are the same in each group.

This hypothesis proposes that the *sample* odds are not the same in the two groups only due to sampling variation.
This is the initial *assumption*.
The alternative hypothesis is

* $H_1$: The *population*\ OR is not one, or (equivalently)  
\phantom{$H_0$:{}} The *population* odds are *different* in each group.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
For comparing odds, the alternative hypothesis *is always two-tailed*.
:::


In our example then:

* $H_0$: The *population* odds of eating most meals off-campus is the *same* for students living with their parents and for students not living with their parents.
* $H_1$: The *population* odds of eating most meals off-campus is *different* for students living with their parents and for students not living with their parents.

As usual, the decision-making process starts by *assuming* the null hypothesis is true: that the *population* OR is one (i.e., the population odds in each group are equal).



::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
For two-way tables, RQs can be framed in terms of ORs, comparing odds, comparing proportions, or (for larger two-way table) using associations (or relationships).

For consistency: if the RQ is about odds, the hypotheses and conclusion should be about the odds; if the RQ is about proportions, the hypotheses and conclusion should be about the proportions; and so on.
:::


### Finding expected counts {#ExpectedValues}

Assuming the null hypothesis is true (which is the initial assumption made) means that the odds are the same in both groups (and the proportions are the same in both groups too).
That is, the proportions of students eating most meals off-campus is the same for students *living with* and *not living with* their parents.
Let's consider the implication.

From Table\ \@ref(tab:MealsDataTable), $157$\ students out of $183$ ate most meals off-campus, so that $157\div 183 = 0.8579$ of students in the entire sample ate most of their meals off-campus (which is the common proportion found in Equation\ \@ref(eq:OverallP)).

If the proportion of students who eat most of their meals off-campus is the *same* for those who live with their parents and those who don't, then we'd *expect* $0.8579$\ of students in *both* groups to be eating most meals off-campus.
In other words, the two *conditional* probabilities\index{Probability!conditional} would be the same.
In that case:

* we would *expect* a proportion of\ $0.8579$ of the $54$\ students who *live with their parents* (i.e., $0.8579\times 54 = 46.33$ students) to eat most meals off-campus.
* we would *expect* a proportion of\ $0.8579$ of the $129$\ students who *don't live with their parents* (i.e., $0.8579\times 129 = 110.67$ students) to eat most meals off-campus.

In other words, the proportions (and hence the odds) of eating most meals off-campus is the same in each group.
Those are the *expected* counts\index{Expected counts} if the proportions (or odds) were exactly the same in each group (Table\ \@ref(tab:MealsDataTableExpected)), as assumed in\ $H_0$.

How close are the *observed* counts (Table\ \@ref(tab:MealsDataTable)) to the *expected* counts (Table\ \@ref(tab:MealsDataTableExpected))?
For instance, $46.33$ of the $54$\ students who *live with their parents* are *expected* to eat most meals off-campus; yet we observed\ $52$; $110.67$ of the $129$\ students who *don't live with their parents* are *expected* to eat most meals off-campus; yet we observed\ $105$.

The observed and expected counts are similar, but not the exactly same.
The difference between the observed and expected counts *may* be explained by sampling variation (that is, the null hypothesis explanation).

The hypothesis test effectively compares the observed counts to the expected counts (assuming no relationship between the variables) over the whole $2\times 2$ table.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
You *do not* have to compute the expected counts\index{Expected counts} explicitly (software does it in the background, or explicitly if requested).
However, seeing how the decision-making process works in this context is helpful.
:::


In previous hypothesis tests, the *sampling distribution* had an approximate normal distribution.
However, the sampling distribution of the OR is more complicated^[For those interested: the *logarithm* of the sample ORs have an approximate normal distribution, and hence a *standard error*.] so will not be presented.
We will use software output only to conduct the test.


<table>
<caption>(\#tab:MealsDataTableExpected)Where university students live and eat: expected counts.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Most off-campus </th>
   <th style="text-align:center;"> Most on-campus </th>
   <th style="text-align:center;"> Total </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Living with parents </td>
   <td style="text-align:center;"> $\phantom{0}46.328$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}7.672$ </td>
   <td style="text-align:center;font-weight: bold;"> $\phantom{0}54$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Not living with parents </td>
   <td style="text-align:center;"> $110.672$ </td>
   <td style="text-align:center;"> $\phantom{0}18.328$ </td>
   <td style="text-align:center;font-weight: bold;"> $129$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Total </td>
   <td style="text-align:center;font-weight: bold;"> $157.000$ </td>
   <td style="text-align:center;font-weight: bold;"> $\phantom{0}26.000$ </td>
   <td style="text-align:center;font-weight: bold;font-weight: bold;"> $183$ </td>
  </tr>
</tbody>
</table>




### Computing the value of the test statistic {#TestStatObs}

The decision-making process compares what is *expected* if the null hypothesis about the parameter is true (Table\ \@ref(tab:MealsDataTableExpected)) to what is *observed* in the sample (Table\ \@ref(tab:MealsDataTable)).
Previously, when the sampling distribution was a normal distribution, the test statistic was a $t$-score or a $z$-score.
However, the sampling distribution for an OR does *not* have a normal distribution, and so a different test statistic is needed.

In this context, the test-statistic is 'chi-squared', written $\chi^2$.\index{Test statistic!$\chi^2$-score}
The $\chi^2$-score measures the overall size of the differences between the expected counts\index{Expected counts} and observed counts, over the entire $2\times 2$ table.


:::: {.pronounceBox .pronounce data-latex="{iconmonstr-microphone-7-240.png}"}

::: {style="display: flex;"}
The Greek letter $\chi$ is pronounced 'kie', as in **ki**te (*not* 'chi' as in **Chi**na or in **chi**n).
The test statistic $\chi^2$ is pronounced as 'chi-squared'.
:::

::: {}

```{=html}
<video controls="controls" loop="FALSE loop" src="./Movies/chi.mp4" style="padding:5px; border: 2px solid gray;" width="121"></video>
```
:::

::::



From the software (Fig.\ \@ref(fig:EatingSoftware)), $\chi^2 = 6.934$.
But what does this value *mean*?
Is it 'large' or 'small'?
The $\chi^2$-value, for $2\times 2$ tables of counts, has an equivalent $z$-score, so that a $P$-value can be estimated using the $68$--$95$--$99.7$ rule.
The $\chi^2$-value is equivalent to
$$
  z = \sqrt{\chi^2}\qquad\text{for a $2\times 2$ table of counts only}.
$$
Here then, the $\chi^2$-value is equivalent to a $z$-score of $\sqrt{6.934} = 2.633$.
This is the *same* $z$-score produced when comparing two proportions (Sec.\ \@ref(CompareTwoProportions); Fig.\ \@ref(fig:EatingSoftware)), and hence the $P$-value will be the same also.
Using the $68$--$95$--$99.7$ rule, a small $P$-value is expected.
The two-tailed $P$-value reported by software (Fig.\ \@ref(fig:EatingSoftware), under the column\ `p`) is indeed small: $0.008$ to three decimals.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Recall that $\chi^2$-tests always have *two-tailed* alternative hypotheses, so two-tailed $P$-values are always reported.
:::


<iframe src="https://learningapps.org/watch?v=ptw49fp0322" style="border:0px;width:100%;height:600px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>



Click on the hotspots in the following image, and describe what the software output tells us.


<iframe src="https://learningapps.org/watch?v=p54msvghc22" style="border:0px;width:100%;height:800px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>



### Writing conclusions {#WritingConclusionChi2}

A very small $P$-value ($0.008$ to three decimals) means strong evidence exists to supporting\ $H_1$: the evidence suggests a difference in the *population* odds in the two groups.
We write:

> The *sample* provides strong evidence ($\chi^2 = 6.934$, $n = 54$; two-tailed $P = 0.008$) that the odds in the *population* of having most meals off-campus is different for students living with their parents (odds:\ $26$) and students *not* living with their parents (odds:\ $4.375$, $n = 129$; OR: $5.94$; $95$%\ CI from\ $1.35$ to\ $26.1$).

The conclusion includes three components (Sect.\ \@ref(WordingConclusion)): the *answer to the RQ*; the *evidence* used to reach that conclusion ('$\chi^2 = 6.934$; two-tailed $P = 0.008$'); and some *sample summary statistics* (including the $95$%\ CI for the OR).

The conclusion makes clear what the odds and the OR *mean*.
The odds are described as the 'odds of having most meals off-campus', and the OR as then comparing these odds between 'students living with their parents and students *not* living with their parents'.
\index{Hypothesis testing!odds ratio|)}


## Statistical validity conditions {#ValidityChiSq}
\index{Statistical validity (for inference)!odds ratio}

As usual, these results hold under certain conditions.
The CIs and tests above are statistically valid if: 

* all *expected* counts are at least five.

Some books may give other (but similar) conditions.

The statistical validity condition refers to the *expected* (not the *observed*) counts.
In some software, the *expected* counts must be explicitly requested to see if this condition is satisfied (Fig.\ \@ref(fig:UniMealsTestExpectedjamovi)).
The units of analysis are also assumed to be *independent* (e.g., from a simple random sample).

If the statistical validity conditions are not met, other similar options include using a Fisher's exact test\index{Fisher's exact test} [@conover2003practical] or using resampling methods [@efron2021computer].


<div class="figure" style="text-align: center">
<img src="jamovi/UniStudents/UniStudents-Expected.png" alt="The expected counts, as computed by software." width="70%" />
<p class="caption">(\#fig:UniMealsTestExpectedjamovi)The expected counts, as computed by software.</p>
</div>


::: {.example #StatisticalValidityEatingHT name="Statistical validity"}
For the student-eating data, the smallest *observed* count is\ $2$ (living with parents; most meals off-campus), but the smallest *expected* count (see Table\ \@ref(tab:MealsDataTableExpected) or Fig.\ \@ref(fig:UniMealsTestExpectedjamovi)) is\ $7.67$, which is greater than five.
This means the two analyses (comparing proportions; comparing odds) are both statistically valid.
The size of the *expected* counts is important for the statistical validity condition.
:::


Usually, you do not compute these expected counts.
However, a quick check for the statistical validity is to compute the *smallest* expected counts, using
\begin{equation}
  \frac{(\text{Smallest row total})\times(\text{Smallest column total})}{\text{Overall total}}.
  (\#eq:SmallestExpectedCount)
\end{equation}
If this value is greater than five, the CIs and tests are statistically valid.


## Hypothesis tests of independence more generally: $\chi^2$-tests {#CompareManyProportions}

Often a table of counts is larger than $2\times 2$.
In these situations, the RQ may not be able to be worded in terms of comparing proportions or odds.
Instead, the hypotheses can be worded in terms of *independence*, *relationships* or *associations* (but *not* correlations) between the variables:

> Is there a relationship (or association) between one qualitative variable and another qualitative variable?

The RQ is answered using a $\chi^2$-test, by extending the ideas in Sect.\ \@ref(CompareTwoOdds); *$z$-tests and $t$-tests are not appropriate.*


<!--
:::{.example #ChiSqLarger name="Two-way tables larger than $2\times 2$"}
[*Dataset*: `RipsID`]
@diez2023rip studied Spanish people's knowledge of ocean rips
(Table\ \@ref(tab:RipTableDataHTML).
The table is a $4\times 2$ two-way table.
The rows are the age groups, as the age groups are being compared.
The RQ is
-->

:::{.example #ChiSqLarger name="Two-way tables larger than 2x2"}
[*Dataset*: `RipsID`]
@diez2023rip studied Spanish people's knowledge of ocean rips
(Table\ \@ref(tab:RipTableDataHTML).
The table is a $4\times 2$ two-way table.
The rows are the age groups, as the age groups are being compared.
The RQ is



> Is there a relationship (or association) between age group and people's ability to correctly identify a rip?
:::






<table>
<caption>(\#tab:RipTableDataHTML)Identifying rips: data by age group.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Correctly </th>
   <th style="text-align:center;"> Incorrectly </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 18 to 24 </td>
   <td style="text-align:center;"> $\phantom{0}41$ </td>
   <td style="text-align:center;"> $\phantom{0}5$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 25 to 34 </td>
   <td style="text-align:center;"> $\phantom{0}47$ </td>
   <td style="text-align:center;"> $12$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 35 to 50 </td>
   <td style="text-align:center;"> $106$ </td>
   <td style="text-align:center;"> $19$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 51 to 65 </td>
   <td style="text-align:center;"> $\phantom{0}52$ </td>
   <td style="text-align:center;"> $\phantom{0}7$ </td>
  </tr>
</tbody>
</table>

<table>
<caption>(\#tab:RipTableSummaryHTML)Identifying rips: a summary table. The ORs are relative to the $51$ to $65$ age group.</caption>
 <thead>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; font-weight: bold; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Correctly identifying rips</div></th>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
</tr>
  <tr>
   <th style="text-align:left;font-weight: bold;">   </th>
   <th style="text-align:center;font-weight: bold;"> Odds </th>
   <th style="text-align:center;font-weight: bold;"> OR </th>
   <th style="text-align:center;font-weight: bold;"> Percentage </th>
   <th style="text-align:center;font-weight: bold;"> $n$ </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 18 to 24 </td>
   <td style="text-align:center;"> $8.200$ </td>
   <td style="text-align:center;"> $1.104$ </td>
   <td style="text-align:center;"> $89.1$ </td>
   <td style="text-align:center;"> $\phantom{0}46$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 25 to 34 </td>
   <td style="text-align:center;"> $3.917$ </td>
   <td style="text-align:center;"> $0.527$ </td>
   <td style="text-align:center;"> $79.7$ </td>
   <td style="text-align:center;"> $\phantom{0}59$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 35 to 50 </td>
   <td style="text-align:center;"> $5.579$ </td>
   <td style="text-align:center;"> $0.751$ </td>
   <td style="text-align:center;"> $84.8$ </td>
   <td style="text-align:center;"> $125$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 51 to 65 </td>
   <td style="text-align:center;"> $7.429$ </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> $88.1$ </td>
   <td style="text-align:center;"> $\phantom{0}59$ </td>
  </tr>
</tbody>
</table>

The odds and percentage of people in each age group that can correctly identify rips can be computed
(Table\ \@ref(tab:RipTableSummaryHTML),
but this is not always possible (e.g., for a $3\times 4$ table).
ORs compare *pairs* of odds, and the ORs in 
Table\ \@ref(tab:RipTableSummaryHTML)
are all relative to those in the\ $51$ to\ $65$ age group (hence, no OR is given for the $51$ to\ $65$ age group, which is the *reference level*).\index{Reference level}
For example, the odds of someone aged\ $18$ to\ $24$ correctly identifying a rip is\ $1.104$ times the odds of someone aged\ $51$ to\ $65$ correctly identifying a rip.

For tables larger than $2\times 2$ more generally, the hypothesis are usually worded in terms of associations or relationships (but *not* correlations) between the variables:

* $H_0$: In the *population*, there *is no association* between correctly identifying a rip and age group.
* $H_1$: In the *population*, there *is an association* between correctly identifying a rip and age group.

The test statistic is a $\chi^2$-value, which compares the observed and expected counts;\index{Expected counts} the expected counts are found in the same way as in Sect.\ \@ref(ExpectedValues).

For two-way tables larger than $2\times 2$, the parameter describing the association between the variables is the $\chi^2$-value.
When no relationship exists in the sample, the observed and expected counts are the same, and $\chi^2 = 0$.
The larger the difference between the observed and expected counts, the larger the value of\ $\chi^2$.
Sampling variation means that the observed counts will vary from sample to sample, so that\ $\chi^2$ may not be exactly zero, even if there is no association between the variables.

Software computes $\chi^2 = 2.406$, and the two-tailed $P$-value as $P = 0.492$ (Fig.\ \@ref(fig:Ripsjamovi), left panel).
This $P$-value means there is not persuasive evidence to support the alternative hypothesis:

> The *sample* provides no evidence ($\chi^2 = 2.406$, $n = 289$; two-tailed $P = 0.492$) of an association between age group and the ability to correctly identify a rip among Spanish people.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
For hypothesis tests involving tables of counts larger than $2\times 2$, the alternative hypothesis *is always two-tailed*.
:::


<div class="figure" style="text-align: center">
<img src="jamovi/RipsID/RipsID-chisq.png" alt="Software output for the hypothesis test about knowledge of ocean rips." width="43%" /><img src="jamovi/RipsID/RipsID-Expected.png" alt="Software output for the hypothesis test about knowledge of ocean rips." width="52%" />
<p class="caption">(\#fig:Ripsjamovi)Software output for the hypothesis test about knowledge of ocean rips.</p>
</div>


The statistical validity conditions are the same as in Sect.\ \@ref(ValidityChiSq):\index{Statistical validity (for inference)!odds ratio} all *expected* counts are at least five.
Using Equation\ \@ref(eq:SmallestExpectedCount),
$$
  \frac{(\text{Smallest row total})\times(\text{Smallest column total})}{\text{Overall total}}
  =
  \frac{46\times 43}{289} = 6.84
$$
(as in Fig.\ \@ref(fig:Ripsjamovi), right panel), which is larger than five.
The test is statistically valid.


<iframe src="https://learningapps.org/watch?v=ptw49fp0322" style="border:0px;width:100%;height:600px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>



Click on the hotspots in the following image, and describe what the jamovi output tells us.


<iframe src="https://learningapps.org/watch?v=p54msvghc22" style="border:0px;width:100%;height:800px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>



<!-- ## Standardised residuals -->


<!-- The $\chi^2$-value, and hence the $P$-value, tells us  -->
<!-- *if* there is evidence that a difference exists. -->
<!-- It does not tell us *where* the difference lies, or *what* the difference is. -->
<!-- (That is, it doesn't tell us if students who live with their parents -->
<!-- are more likely to eat meals *on-* or *off-*campus.) -->
<!-- In $2\times2$ tables, -->
<!-- this is rarely hard to determine, -->
<!-- but in other size two-way table (such as a $4\times 3$ table, for example) it can be more challenging. -->
<!-- To help determine where the difference are located, -->
<!-- we can ask SPSS^[Using `Analyze> Descriptive Statistics> Crosstabs...`, and then in the `Cells` tab select `Residuals> Standardized`.] to produce  -->
<!-- *standardized residuals* -->
<!-- (Table \@ref(fig:UniMealsTestSPSSStdRes)). -->




<!-- ```{r UniMealsTestSPSSStdRes, echo=FALSE, fig.cap="The standardized residuals from SPSS for the two-way table for the uni-students eating data.", fig.align="center", out.width="60%"} -->
<!-- knitr::include_graphics("SPSS/UniStudents/UniStudentsStdRes.png") -->
<!-- ``` -->



<!-- Standardised residuals are like $z$-scores, -->
<!-- so that cells in the table with a standardized residual larger than about $2$ -->
<!-- mean that the observed counts were *higher* than we would have expected, -->
<!-- and -->
<!-- that cells in the table with a standardized residual smaller than about $-2$ -->
<!-- mean that the observed counts were *smaller* than we would have expected. -->
<!-- So for the uni-student data -->
<!-- (Table \@ref(fig:UniMealsTestSPSSStdRes)), -->
<!-- we can find the largest and smallest standardized residuals: -->

<!-- * $-2.0$: Students *living with their parents* are *less likely* (because the residual is *negative*) to eat most meals on-campus -->
<!--    (compared to what we'd expect by chance). -->
<!-- * $1.3$: Students *not living with their parents*  are *more likely* (because the residual is *positive*) to eat mostmeals on-campus -->
<!--    (compared to what we'd expect by chance); -->

<!-- So while the $\chi^2$-square suggests there is a difference, -->
<!-- the standardised residuals tells us *how* they are different: -->
<!-- students living *with* their parents are -->
<!-- *less* likely to eat most meals on-campus. -->
<!-- Again, -->
<!-- standardized residuals may not be needed here to reach these conclusions, -->
<!-- but they can be used in larger two-way tables -->
<!-- (for example,  -->
<!-- see Sect.\ \@ref(ORTestDumping)). -->



## Example: turtle nests {#TurtleNests}

The hatching success of loggerhead turtles on Mediterranean beaches is often compromised by fungi and bacteria.
@candan2021first studied the odds of a nest being infected, comparing relocated nests (relocated due to the risk of tidal inundation), and non-relocated nests
(Table\ \@ref(tab:TurtleNestDataTable)).
The researchers were interested in knowing:

> For Mediterranean loggerhead turtles, are the odds of infections the same for natural and relocated nests?


<table>
<caption>(\#tab:TurtleNestDataTable)Infected and non-infected turtle nests.</caption>
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;">   </th>
   <th style="text-align:center;font-weight: bold;"> Non-infected </th>
   <th style="text-align:center;font-weight: bold;"> Infected </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Natural </td>
   <td style="text-align:center;"> $29$ </td>
   <td style="text-align:center;"> $10$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Relocated </td>
   <td style="text-align:center;"> $14$ </td>
   <td style="text-align:center;"> $\phantom{0}8$ </td>
  </tr>
</tbody>
</table>

<div class="figure" style="text-align: center">
<img src="31-CIsTesting-OddsRatios_files/figure-html/TurtleNestsGraphs-1.png" alt="Bar chart for the turtle-nesting data." width="50%" />
<p class="caption">(\#fig:TurtleNestsGraphs)Bar chart for the turtle-nesting data.</p>
</div>


Since the RQ is written in terms of odds, the hypotheses should be written using odds also:

* $H_0$: The odds of a nest being infected is     *the same* for natural and relocated nests.
* $H_1$: The odds of a nest being infected is *not the same* for natural and relocated nests.

Here, $N$ refers to **N**atural nests, and\ $R$ to **R**elocated nests.
The parameter is the odds ratio of a nest being infected, comparing natural to relocated nests.
(The equivalent hypotheses written in terms of proportions would be $H_0$: $p_N - p_R = 0$ and $H_1$: $p_N - p_R \ne 0$. 
The hypotheses could also be written in terms of associations.)

A graphical summary is shown in Fig.\ \@ref(fig:TurtleNestsGraphs).
A numerical summary table (Table\ \@ref(tab:TurtleNestDataTable), right table) shows that the odds of natural nest being infected is $1.66$\ times the odds of a relocated nest being infected.
From the software output (Fig.\ \@ref(fig:TurtleNestsOutputjamovi)), the $\chi^2$-value is\ $0.777$.
Since the table is a $2\times 2$ table, the equivalent $z$-score can be found: $z = \sqrt{0.777} = 0.88$.
This $z$-scorw is very small, so expect a large $P$-value.
(This is the value of the $z$-score shown in Fig.\ \@ref(fig:TurtleNestsOutputjamovi) for comparing two proportions.)
The $P$-value is\ $0.378$ on the output (for both tests).

The smallest *expected* count is $(22\times 18) / 61 = 6.49$, which exceeds five, so the test is statistically valid.
Since the RQ and hypotheses were written in terms of odds, the conclusion is also written in terms of odds:

> There is no evidence of a difference in the odds of infection ($\chi^2$: $0.777$; $P$-value: $0.378$; OR: $1.657$; $95$%\ CI: $0.537$ to\ $5.12$) between natural nests (odds: $2.90$; $n = 39$) and relocated nests (odds: $1.75$; $n = 22$).

There is no evidence that relocating the nest (to protect them from tidal inundation) changes the risk of infection.


:::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
We *do not* say whether the evidence supports the null hypothesis.
We assume the null hypothesis is true, so we state the strength of evidence to change our mind (and hence support the alternative hypothesis).
The current sample presents no evidence to contradict the assumption, but future evidence may emerge.
:::

<!-- and Table 5 (BTW, Table 6 is  not $2\times 2$): -->


<div class="figure" style="text-align: center">
<img src="jamovi/TurtleNests/TurtleNests-Chisq-pDiff.png" alt="The software output for the turtle-nesting data." width="60%" />
<p class="caption">(\#fig:TurtleNestsOutputjamovi)The software output for the turtle-nesting data.</p>
</div>


## Example: health of female burros {#HTCompareOddsBurros}

@johnson1987demography studied $315$\ introduced female burros (donkeys) in the Mojave Desert (California) to understand management processes. 
One RQ was:

> For these female burros, is the reproductive status of the burros related to their health?

The data
(Table\ \@ref(tab:BurrosDataHTML))
are given in a $3\times 3$ table of counts.
The data are summarised using row proportions in
Table\ \@ref(tab:BurrosSummaryHTML)),
and in a graph in Fig.\ \@ref(fig:BurrosChisqjamoviPlot) (left panel).
Software output is shown in Fig.\ \@ref(fig:BurrosChisqjamoviPlot) (right panel).







<table>
<caption>(\#tab:BurrosDataHTML)The health and reproductive status of female burros. (Pregnant and lactating burros were counted with the lactating burros only.)</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Excellent </th>
   <th style="text-align:center;"> Fair </th>
   <th style="text-align:center;"> Poor </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Barren </td>
   <td style="text-align:center;"> $\phantom{0}16$ </td>
   <td style="text-align:center;"> $\phantom{0}21$ </td>
   <td style="text-align:center;"> $\phantom{0}38$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pregnant </td>
   <td style="text-align:center;"> $\phantom{0}14$ </td>
   <td style="text-align:center;"> $\phantom{0}53$ </td>
   <td style="text-align:center;"> $\phantom{0}62$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lactating </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}4$ </td>
   <td style="text-align:center;"> $\phantom{0}29$ </td>
   <td style="text-align:center;"> $\phantom{0}78$ </td>
  </tr>
</tbody>
</table>

<table>
<caption>(\#tab:BurrosSummaryHTML)Row proportions for the burros data (i.e., rows sum to one).</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Odds </th>
   <th style="text-align:center;"> OR </th>
   <th style="text-align:center;"> Percentage </th>
   <th style="text-align:center;"> $n$ </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Barren </td>
   <td style="text-align:center;"> $0.271$ </td>
   <td style="text-align:center;"> $7.254$ </td>
   <td style="text-align:center;"> $21.333$ </td>
   <td style="text-align:center;"> $75.000$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Pregnant </td>
   <td style="text-align:center;"> $0.122$ </td>
   <td style="text-align:center;"> $3.257$ </td>
   <td style="text-align:center;"> $10.853$ </td>
   <td style="text-align:center;"> $129.000$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Lactating </td>
   <td style="text-align:center;"> $0.037$ </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> $3.604$ </td>
   <td style="text-align:center;"> $111.000$ </td>
  </tr>
</tbody>
</table>


The hypotheses must be worded in terms of associations (or *relationships*):

* $H_0$: *No association* exists between reproductive status and overall health.
* $H_1$: *An association* exists between reproductive status and overall health.

From the software output (Fig.\ \@ref(fig:BurrosChisqjamoviPlot), right panel), $\chi^2 = 23.585$.
Notice that a comparison of proportions is not possible for tables larger than $2\times 2$.
Software reports $P < 0.001$, which suggests very strong evidence in the sample that an association exists between reproductive status and overall health.


<div class="figure" style="text-align: center">
<img src="31-CIsTesting-OddsRatios_files/figure-html/BurrosChisqjamoviPlot-1.png" alt="Left: a stacked bar chart for the burro-health data. Right: software output for the burro-health data." width="44%" /><img src="jamovi/Burros/BurrosChisquareTest.png" alt="Left: a stacked bar chart for the burro-health data. Right: software output for the burro-health data." width="55%" />
<p class="caption">(\#fig:BurrosChisqjamoviPlot)Left: a stacked bar chart for the burro-health data. Right: software output for the burro-health data.</p>
</div>


The conclusion could be written as

> The sample provides very strong evidence ($\chi^2 = 23.585$; $P < 0.001$; $3\times 3$ table) of an association between reproductive status and overall health of female burros ($n = 315$).

Adding sample summary information to this conclusion is cumbersome.
Instead, readers can be pointed to the numerical summary
(Table\ \@ref(tab:BurrosSummaryHTML)).
Furthermore, CIs are not reported.

While we know there is an association between the variables, we can only speculate on the nature of the association (i.e., for which group(s) the *population* proportions are different).
Formal methods for doing so requires methods beyond this book, but Fig.\ \@ref(fig:BurrosChisqjamoviPlot) (left panel) suggests that lactating burros are far more likely to have poor health.

The smallest *expected* value is $75\times 34/315 = 8.1$, which exceeds\ $5$, so the results are statistically valid.


## Chapter summary {#TestsOddsRatio-Summary}

To compare a two-level qualitative variable between two groups, a CI can be formed for the difference between two proportions, or for an OR.

To compute a CI for the difference between two proportions, compute the difference between the two sample proportions, $\hat{p}_1 - \hat{p}_2$, and identify the sample sizes\ $n_1$ and\ $n_2$.
Then the standard error, which quantifies how much the value of $\hat{p}_1 - \hat{p}_2$ varies across all possible samples, is
$$
\text{s.e.}(\hat{p}_1 - \hat{p}_2)
=
\sqrt{ \text{s.e}(\hat{p}_1) + \text{s.e.}(\hat{p}_2)},
$$
where $\text{s.e.}(\hat{p}_1)$ and $\text{s.e.}(\hat{p}_2)$ are the standard errors of Groups\ $1$ and\ $2$ (Equation\ \@ref(eq:stderrorphat)).
The *margin of error* is (multiplier${}\times{}$standard error), where the multiplier is\ $2$ for an approximate $95$%\ CI (using the $68$--$95$--$99.7$ rule).
Then the CI is:
$$
(\hat{p}_1 - \hat{p}_2) \pm \left( \text{multiplier}\times\text{standard error} \right).
$$
Software is used to compute a CI for the OR, as the sampling distribution does not have a normal distribution.

These steps are used to test a hypothesis about a difference between two population proportions $p_1 - p_2$.

* Write the null hypothesis\ ($H_0$) and the alternative hypothesis\ ($H_1$); initially *assume* the value of $(p_1 - p_2)$ in the null hypothesis to be true.
* Describe the *sampling distribution*, which describes what to *expect*  from the difference between the sample proportions based on this assumption: under certain statistical validity conditions, the difference between the sample proportions vary with:
   *  an approximate normal distribution,
   *  with sampling mean whose value is the value of $(p_1 - p_2)$ (from $H_0$), and
   *  having a standard deviation of $\displaystyle \text{s.e.}(\hat{p}_1 - \hat{p}_2)$ computed using the *common* proportion.
* Compute the value of the *test statistic*:
$$
  z = \frac{ (\hat{p}_1 - \hat{p}_2) - (p_1 - p_2)}{\text{s.e.}(\hat{p}_1 - \hat{p}_2)},
$$
where $p_1 - p_2$ is the hypothesised difference given in the null hypothesis.
* An approximate *$P$-value* can be estimated using the $68$--$95$--$99.7$ rule, or an exact $P$-value found using software.
  Use the $P$-value to make a decision, and write a conclusion.
* Check the statistical validity conditions.

These steps are used to test a hypothesis for comparing two odds, or to test for a relationship between two qualitative variables more generally.

* Write the null hypothesis\ ($H_0$) and the alternative hypothesis\ ($H_1$); initially *assume* no relationship between the two variables.
* Find the value of the *test statistic* (a $\chi^2$-score) on the software output.
  (For $2\times 2$ tables only, the equivalent $z$-score is\ $\sqrt{\chi^2}$.)
* A *$P$-value* is found using software; use the $P$-value to make a decision, and write a conclusion.
* Check the statistical validity conditions.

The statistical validity conditions should be checked: all *expected* counts should exceed five.


## Quick review questions {#TestsOddsRatio-QuickReview}

<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/pexels-rathaphon-nanthapreecha-3846205.jpg" width="200px"/>
</div>

::: {.webex-check .webex-box}
@chen2023triage investigated the relationship between body temperature of patients admitted to hospital following a heart attack (HA), and a having a subsequent HA while in hospital (Table\ \@ref(tab:HAttackData)).

Are the following statements *true* or *false*?

1. From the software output, the $P$-value is $0.180$. \tightlist
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. The alternative hypothesis two-tailed.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. There is *no* evidence of a difference in odds of having an in-hospital HA, comparing patients with low and high body temperatures.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. The CI is not statistically valid, because the CIs for the difference between the proportions has a *negative* value.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. The CI means that the sample\ OR is likely to be between\ $0.330$ and\ $5.568$.  
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. The $\chi^2$-value is $0.180$.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. Of patients with a low body temperature, $4/27 = 0.148$ had an in-hospital HA.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. The *odds* that a patient with a low body temperature had an in-hospital HA is $4/23 = 0.174$.  
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>

Select the correct answer:

9. The OR in the output is given as $1.357$. 
What does this OR *mean*?
<select class='webex-select'><option value='blank'></option><option value='answer'>The odds of having an in-hospital HA is $1.357$ times greater for those with a low body temperature.</option><option value=''>The odds of having an in-hospital HA is $1.357$ times smaller for those with a low body temperature.</option><option value=''>The proportion of patients having an in-hospital HA is $1.357$ times greater for those with a low body temperature.</option><option value=''>The proportion of patients having an in-hospital HA is $1.357$ times smaller for those with a low body temperature.</option></select>

:::



\begin{figure}
\begin{minipage}{0.38\textwidth}
\captionof{table}{Body temperature of patients, and whether they experienced a heart attack in hospital\label{tab:HAttackData}.}
\fontsize{8}{12}\selectfont
\begin{@empty}

\begin{tabular}{lcc}
\toprule
\multicolumn{1}{c}{\textbf{ }} & \multicolumn{2}{c}{\textbf{In-hospital}} \\
\multicolumn{1}{c}{\textbf{ }} & \multicolumn{2}{c}{\textbf{heart attack}} \\
\cmidrule(l{3pt}r{3pt}){2-3}
\textbf{ } & \textbf{Yes} & \textbf{No}\\
\midrule
Low body temp. & $\phantom{0}4$ & $23$\\
High body temp. & $\phantom{0}5$ & $39$\\
\bottomrule
\end{tabular}
\end{@empty}
\end{minipage}
\hspace{0.05\textwidth}
\begin{minipage}{0.54\textwidth}%
\centering
<img src="jamovi/HAttack/HAttack-jamovi.png" width="95%" />
\caption{Software output for the heart-attack study.}\label{fig:HAttackjamovi}
\end{minipage}
\end{figure}




<table>
<caption>(\#tab:HAttackData)Body temperature of patients, and whether they experienced a heart attack while in hospital.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> In-hospital HA </th>
   <th style="text-align:center;"> No in-hospital HA </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Low body temp. </td>
   <td style="text-align:center;"> $\phantom{0}4$ </td>
   <td style="text-align:center;"> $23$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> High body temp. </td>
   <td style="text-align:center;"> $\phantom{0}5$ </td>
   <td style="text-align:center;"> $39$ </td>
  </tr>
</tbody>
</table>

<!-- The figure for LaTeX is in the minipage (combined with data table), so only need show it for the HTML -->

<div class="figure" style="text-align: center">
<img src="jamovi/HAttack/HAttack-jamovi.png" alt="Software output for the heart-attack study." width="50%" />
<p class="caption">(\#fig:HAttackjamovi)Software output for the heart-attack study.</p>
</div>





## Exercises {#TestsOddsRatioExercises}

[Answers to odd-numbered exercises] are given at the end of the book. 





::: {.exercise #OddsSame}
Consider the expected counts in Table\ \@ref(tab:MealsDataTableExpected).
Confirm that the *odds* of having most meals off-campus is the same for students living with their parents, and for students not living with their parents.
:::



::: {.exercise #OddsSame2}
Compute all four expected counts in Table\ \@ref(tab:HAttackData).
Confirm that the corresponding test may not be statistically valid.
:::



::: {.exercise #OddsRatioCISamplingDistA}
Sketch the sampling distribution for the difference between the proportions of students eating most meals off-campus, for those living with parents minus those not living with parents.
What is the sampling distribution for the equivalent OR?
:::


::: {.exercise #OddsRatioCISamplingDistB}
Sketch the sampling distribution for the difference between the proportion of non-infected turtle nests, for natural nests minus relocated nests (in Sect.\ \@ref(TurtleNests)).
What is the sampling distribution for the equivalent OR?
:::


::: {.exercise #Chi2z}
Suppose an analysis of a $2\times 2$ table of counts produces a value of $\chi^2 = 10.66$.

1. What would be the equivalent $z$-score for comparing the two proportions?
2. What would be the approximate $P$-value?
:::

::: {.exercise #Chi2zA}
Suppose an analysis of a $2\times 2$ table of counts produces a value of $\chi^2 = 4.06$.

1. What would be the equivalent $z$-score for comparing the two proportions?
2. What would be the approximate $P$-value?
:::


::: {.exercise #EVAdoption}
[*Dataset*: `EVPurchase`]
@egbue2017mass studied the adoption of electric vehicles (EVs) by a group of professional Americans (Table\ \@ref(tab:EV10years)).
Software output is shown in Fig.\ \@ref(fig:EVjamovi).

1. Based on the output, how is the difference between the two proportions defined?
1. Write the hypothesis for comparing the *proportions* using this definition of the difference.
1. Use the software output to conduct the test.
1. Use the software output to write down the corresponding CI for the difference in proportions.
1. Based on the output, how is the OR defined?
1. Write the hypothesis for comparing the *odds*, for those with and without post-graduate study.
1. Use the software output to conduct the test.
1. Use the software output to write down the corresponding CI for the OR.
1. Are the CIs and tests statistically valid?
:::




\begin{figure}
\begin{minipage}{0.32\textwidth}
\captionof{table}{Responses to `Would you purchase an electric vehicle in the next $10$ years?' by education\label{tab:EV10years}.}
\fontsize{8}{12}\selectfont\centering
\begin{@empty}

\begin{tabular}{lcc}
\toprule
\textbf{ } & \textbf{Yes} & \textbf{No}\\
\midrule
No post-grad & $24$ & $\phantom{0}8$\\
Post-grad study & $51$ & $29$\\
\bottomrule
\end{tabular}
\end{@empty}
\end{minipage}
\hspace{0.05\textwidth}
\begin{minipage}{0.60\textwidth}%
\centering
<img src="jamovi/EVs/EVs-Tests-CI-both.png" width="98%" />
\caption{Software output for the EV study.}\label{fig:EVjamovi}
\end{minipage}
\end{figure}




<table>
<caption>(\#tab:EV10years)Responses to 'Would you purchase an electric vehicle in the next $10$ years?' by education.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Yes </th>
   <th style="text-align:center;"> No </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> No post-grad </td>
   <td style="text-align:center;"> $24$ </td>
   <td style="text-align:center;"> $\phantom{0}8$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Post-grad study </td>
   <td style="text-align:center;"> $51$ </td>
   <td style="text-align:center;"> $29$ </td>
  </tr>
</tbody>
</table>

<!-- The figure for LaTeX is in the minipage (combined with data table), so only need show it for the HTML -->

<div class="figure" style="text-align: center">
<img src="jamovi/EVs/EVs-CI-both.png" alt="Software output for the EV study." width="50%" />
<p class="caption">(\#fig:EVjamovi)Software output for the EV study.</p>
</div>





::: {.exercise #EthiopianFarmers}
@meresa2023effect investigated Ethiopian farmers' adoption of improved soil and water conservation structures on their farms (Table\ \@ref(tab:FarmersData)).
Software output is shown in Fig.\ \@ref(fig:farmersjamoviHT).



\begin{figure}
\begin{minipage}{0.32\textwidth}
\captionof{table}{Adoption of conservation practices by Ethiopian farmers, by farm size\label{tab:FarmersData}.}
\fontsize{8}{12}\selectfont\centering
\begin{@empty}

\begin{tabular}{lcc}
\toprule
\multicolumn{1}{c}{\textbf{ }} & \multicolumn{2}{c}{\textbf{Adopter?}} \\
\cmidrule(l{3pt}r{3pt}){2-3}
\textbf{ } & \textbf{No} & \textbf{Yes}\\
\midrule
$< 0.5$ ha (small) & $86$ & $61$\\
$\ge 0.5$ ha (large) & $43$ & $71$\\
\bottomrule
\end{tabular}
\end{@empty}
\end{minipage}
\hspace{0.05\textwidth}
\begin{minipage}{0.60\textwidth}%
\centering
<img src="jamovi/Farmers/Farmers-Chi2-pDiff-CITest.png" width="98%" />
\caption{Software output for the farming study.}\label{fig:farmersjamoviHT}
\end{minipage}
\end{figure}




<table>
<caption>(\#tab:FarmersData)Adoption of conservation practices by Ethiopian farmers, by farm size.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Non-adopter </th>
   <th style="text-align:center;"> Adopter </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Less than $0.5$ ha (small) </td>
   <td style="text-align:center;"> $86$ </td>
   <td style="text-align:center;"> $61$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> $\ge 0.5$ ha (large) </td>
   <td style="text-align:center;"> $43$ </td>
   <td style="text-align:center;"> $71$ </td>
  </tr>
</tbody>
</table>

<!-- The figure for LaTeX is in the minipage (combined with data table), so only need show it for the HTML -->

<div class="figure" style="text-align: center">
<img src="jamovi/Farmers/Farmers-Chi2-pDiff-CITest.png" alt="Software output for the farming study." width="50%" />
<p class="caption">(\#fig:farmersjamoviHT)Software output for the farming study.</p>
</div>


1. Based on the output, how is the difference between the two proportions defined?
1. Write the hypothesis for comparing the proportions, using this definition of the difference.
1. Use the software output to conduct the test.
1. Use the software output to write down the corresponding CI for the difference in proportions.
1. Based on the output, how is the OR defined?
1. Write the hypothesis for comparing the odds, for farmers with small and large farms.
1. Use the software output to conduct the test.
1. Use the software output to write down the corresponding CI for the OR.
1. Are the CIs and tests statistically valid?
:::


::: {.exercise #ORcrashes}
[*Dataset*: `CarCrashes`]
@wang2020driver recorded information about car crashes in a rural, mountainous county in western China
(Table\ \@ref(tab:CrashDataTableHTML)).

1. Sketch a suitable graph to display the data.
1. Compute the *proportion* of crashes involving a pedestrian in\ 2011 ($\hat{p}_{2011}$), and in\ 2015 ($\hat{p}_{2015}$).
1. Compute the *difference between the proportion* of crashes involving a pedestrian from\ 2011 to\ 2015, consistent with the definition used in the output (Fig.\ \@ref(fig:CarCrashjamovi)).
1. Compute the value of $\text{s.e.}(\hat{p}_{2011} - \hat{p}_{2015})$, needed for constructing the CI.
1. Construct the *approximate* $95$% CI for the difference between the proportions.
1. Write down a $95$%\ CI for the difference between the proportions.
1. Interpret what this CI means.
1. Compute the *odds* of crashes involving a pedestrian in\ 2011, and also in \ 2015.
1. Compute the *OR* of crashes involving a pedestrian, comparing\ 2011 to\ 2015.
1. Write down the CI for the OR.
1. Construct an appropriate numerical summary table for the data.
1. Compute the value of $\text{s.e.}(\hat{p}_{2011} - \hat{p}_{2015})$, needed for conducting a hypothesis test.
1. Conduct a hypothesis test to determine if there is a difference between $p_{2011}$ and $p_{2015}$.
1. Conduct a hypothesis test to determine if there is a difference between the odds of a crash involving a pedestrian for\ 2011 and\ 2015.
1. Are the CIs and tests statistically valid?
:::




\begin{figure}
\begin{minipage}{0.32\textwidth}
\captionof{table}{Type of car crashes in different years\label{tab:CrashDataTableLATEX}.}
\fontsize{8}{12}\selectfont

\begin{tabular}{lcc}
\toprule
\multicolumn{1}{c}{\textbf{ }} & \multicolumn{1}{c}{\textbf{Involving}} & \multicolumn{1}{c}{\textbf{Involving}} \\
\textbf{ } & \textbf{pedestrians} & \textbf{vehicles}\\
\midrule
2011 & $15$ & $35$\\
2015 & $37$ & $85$\\
\bottomrule
\end{tabular}
\end{minipage}
\hspace{0.05\textwidth}
\begin{minipage}{0.60\textwidth}%
\centering
<img src="jamovi/CarCrashes/CarCrashes-ALL.png" width="99%" style="display: block; margin: auto;" />
\caption{Software output for the car-crash study.}\label{fig:CarCrashjamovi}
\end{minipage}
\end{figure}




<table>
<caption>(\#tab:CrashDataTableHTML)Responses to 'Would you purchase an electric vehicle in the next $10$ years?' by education.</caption>
 <thead>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; font-weight: bold; " colspan="1"><div style="">Involving</div></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; font-weight: bold; " colspan="1"><div style="">Involving</div></th>
</tr>
  <tr>
   <th style="text-align:left;font-weight: bold;">   </th>
   <th style="text-align:center;font-weight: bold;"> pedestrians </th>
   <th style="text-align:center;font-weight: bold;"> vehicles </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 2011 </td>
   <td style="text-align:center;"> $15$ </td>
   <td style="text-align:center;"> $35$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2015 </td>
   <td style="text-align:center;"> $37$ </td>
   <td style="text-align:center;"> $85$ </td>
  </tr>
</tbody>
</table>

<!-- The figure for LaTeX is in the minipage (combined with data table), so only need show it for the HTML -->

<div class="figure" style="text-align: center">
<img src="jamovi/CarCrashes/CarCrashes-ALL.png" alt="Software output for the car-crash data." width="50%" />
<p class="caption">(\#fig:CarCrashjamovi)Software output for the car-crash data.</p>
</div>





::: {.exercise #TestsOddsRatioScars}
[*Dataset*: `ScarHeight`] 
@data:Wallace2017:Sunburn compared the heights of scars from burns received by people in Western Australia (Table\ \@ref(tab:ScarsData)).
Software was used to analyse the data (Fig.\ \@ref(fig:ScarHeightRiskjamovi)).

1. Sketch an appropriate graph to summarise the data.
1. Compute the *proportion* of men having a smooth scar, and the *proportion* of women.
1. Compute the *difference between the proportions* of men and women having a smooth scar.
1. Compute the standard error for the difference between the proportions, needed for constructing a CI.
1. Compute the *approximate* $95$%\ CI for the difference between the proportions.
1. Write down the $95$%\ CI for the difference between the proportions, using the software output.
1. Interpret what this CI means.
1. Compute the *odds* of having a smooth scar for men, and for women.
1. Compute the *OR* of having a smooth scar, comparing men to women.
1. Write down the CI for the OR of having a smooth scar, comparing men to women.
1. Compile a numerical summary table.
1. Compute the value of standard error of the difference between the proportions, needed for conducting a hypothesis test.
1. Conduct a hypothesis test to determine if there is a difference between the proportions for men and women.
1. Conduct a hypothesis test to determine if there is a difference between the odds for men and women.
1. Are the CIs and tests statistically valid?
:::




\begin{figure}
\begin{minipage}{0.32\textwidth}
\captionof{table}{Heights of scars for men and women\label{tab:ScarsData}.}
\fontsize{8}{12}\selectfont

\begin{tabular}{lcc}
\toprule
\multicolumn{1}{c}{\textbf{ }} & \multicolumn{1}{c}{\textbf{Smooth}} & \multicolumn{1}{c}{\textbf{Over 0\,mm,}} \\
\textbf{ } & \textbf{(0\,mm)} & \textbf{up to 1\,mm}\\
\midrule
Men & $216$ & $115$\\
Women & $\phantom{0}99$ & $\phantom{0}62$\\
\bottomrule
\end{tabular}
\end{minipage}
\hspace{0.05\textwidth}
\begin{minipage}{0.60\textwidth}%
\centering
<img src="jamovi/ScarHeight/ScarHeight-No-Expected.png" width="98%" style="display: block; margin: auto;" />
\caption{Software output for the scar-height data.}\label{fig:ScarHeightRiskjamovi}
\end{minipage}
\end{figure}




<table>
<caption>(\#tab:ScarsData)Heights of scars for men and women.</caption>
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;font-weight: bold;">   </th>
   <th style="text-align:center;font-weight: bold;font-weight: bold;"> Men </th>
   <th style="text-align:center;font-weight: bold;font-weight: bold;"> Women </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Smooth </td>
   <td style="text-align:center;"> $216$ </td>
   <td style="text-align:center;"> $\phantom{0}99$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 0mm to 1mm </td>
   <td style="text-align:center;"> $115$ </td>
   <td style="text-align:center;"> $\phantom{0}62$ </td>
  </tr>
</tbody>
</table>

<!-- The figure for LaTeX is in the minipage (combined with data table), so only need show it for the HTML -->

<div class="figure" style="text-align: center">
<img src="jamovi/ScarHeight/ScarHeight-No-Expected.png" alt="Software output for the scar-height data." width="50%" />
<p class="caption">(\#fig:ScarHeightRiskjamovi)Software output for the scar-height data.</p>
</div>






::: {.exercise #PetBirdsTest}
[*Dataset*: `PetBirds`]
@data:Kohlmeier1992:BirdsCancer examined people with lung cancer, and a matched set of controls who did not have lung cancer, and recorded the number in each group that kept pet birds. 
The data are shown in Table\ \@ref(tab:BirdsData), and the software output in Fig.\ \@ref(fig:PetBirdsjamovi).

Consider this RQ:

> Are the odds of having a pet bird the same for people *with* lung cancer (cases) and for people *without* lung cancer (controls)?

1. Compute the difference between the proportions of people with pet birds, for those with and without lung cancer.
1. Compute the standard error needed to compute the CI for the difference in proportions.
1. Compute the standard error needed to conduct the hypothesis test to compare the proportions.
1. Explain *why* the two standard errors have slightly different values.
1. Compute an approximate $95$%\ CI for the difference between the two proportions.
1. Write down the $95$%\ CI for the difference between the proportions using the output (Fig.\ \@ref(fig:PetBirdsjamovi)).
1. Interpret the CIs.
1. Conduct a hypothesis test to compare the two proportions.
1. Confirm that the OR in the output is correct.
1. Write down a $95$%\ CI for the OR, and interpret what it means.
1. Perform a hypothesis test to determine if the odds of having a pet bird is the same for people with and without lung cancer.
1. Are the CIs and tests statistically valid?
1. Explain why no cause-and-effect can be reached.
:::


<table>
<caption>(\#tab:BirdsData)The pet bird data.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Adults with lung cancer </th>
   <th style="text-align:center;"> Adults without lung cancer </th>
   <th style="text-align:center;"> Total </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Did not keep pet birds </td>
   <td style="text-align:center;"> $141$ </td>
   <td style="text-align:center;"> $328$ </td>
   <td style="text-align:center;font-weight: bold;"> $469$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Kept pet birds </td>
   <td style="text-align:center;"> $\phantom{0}98$ </td>
   <td style="text-align:center;"> $101$ </td>
   <td style="text-align:center;font-weight: bold;"> $199$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:center;"> $239$ </td>
   <td style="text-align:center;"> $429$ </td>
   <td style="text-align:center;font-weight: bold;"> $668$ </td>
  </tr>
</tbody>
</table>


<div class="figure" style="text-align: center">
<img src="jamovi/PetBirds/Pets-Test-Both.png" alt="Software output for the pet-birds data." width="49.5%" /><img src="jamovi/PetBirds/PetsCI-Both.png" alt="Software output for the pet-birds data." width="49.5%" />
<p class="caption">(\#fig:PetBirdsjamovi)Software output for the pet-birds data.</p>
</div>





::: {.exercise #TestsOddsRatioAugustRainfallInEmerald}
[*Daatset*: `EmeraldAug`]
The *Southern Oscillation Index*\ (SOI) is a standardised measure of the air pressure difference between Tahiti and Darwin, and is related to rainfall in some parts of the world [@climate:stone:1996], and especially Queensland [@climate:stone:1992].

The rainfall at Emerald (Queensland) was recorded for Augusts between\ 1889 and\ 2002 inclusive [@mypapers:dunnsmyth:glms], where the monthly average\ SOI was positive, and when the SOI was non-positive (zero or negative), as shown in Table\ \@ref(tab:SOItableAnalysis).

1. Compute the difference between the proportions of Augusts with rain, for months with a positive SOI compared to months with a non-positive SOI.
1. Compute the standard error needed to compute the CI for the difference in proportions.
1. Compute the standard error needed to conduct the hypothesis to compare the proportions.
1. Explain *why* the two standard errors have slightly different values.
1. Compute an approximate $95$%\ CI for the difference between the two proportions.
1. Write down the $95$%\ CI for the difference between the proportions using the output (Fig.\ \@ref(fig:EmeraldRainjamoviOutput)).
1. Interpret the CIs.
1. Conduct a hypothesis test to compare the two proportions.
1. Confirm that the OR in the output is correct.
1. Write down a $95$%\ CI for the OR, and interpret what it means.
1. Perform a hypothesis test to determine if the odds of recoding rain is the same for Augusts with non-positive and positive SOI.
1. Are the CIs and tests statistically valid?
:::


<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:SOItableAnalysis)The SOI, and whether rainfall was recorded in Augusts between 1889 and 2002 inclusive.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Rainfall recorded </th>
   <th style="text-align:center;"> No rainfall recorded </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Positive SOI </td>
   <td style="text-align:center;"> $53$ </td>
   <td style="text-align:center;"> $\phantom{0}7$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Non-positive SOI </td>
   <td style="text-align:center;"> $40$ </td>
   <td style="text-align:center;"> $14$ </td>
  </tr>
</tbody>
</table>


<div class="figure" style="text-align: center">
<img src="jamovi/EmeraldRain/EmeraldRain-NoE-Both.png" alt="Software output for the Emerald-rain data." width="65%" />
<p class="caption">(\#fig:EmeraldRainjamoviOutput)Software output for the Emerald-rain data.</p>
</div>





::: {.exercise #TestOddsRatioSunglasses}
[*Dataset*: `HatSunglasses`]
@data:Dexter2019:SunProtection recorded the number of people at the foot of the Goodwill Bridge, Brisbane, who wore hats between $11$:$30$am to $12$:$30$pm.
Of the $366$\ females observed, $22$ wore hats; of the $386$\ males observed, $79$ wore hats.

1. Construct the two-way table for the data.
1. Compute the proportions of females and males wearing a hat, and hence the difference between the proportions.
1. Compute the odds of a female and the odds of a male wearing a hat, and hence the OR.
1. Compute an approximate $95$%\ CI for the difference between the proportions.
1. Write down the $95$%\ CI for the difference between the proportion (Fig.\ \@ref(fig:SunglassesOutput)).
1. Interpret the CIs.
1. Write down, then interpret, a $95$%\ CI for the OR.
1. Perform a hypothesis test to determine if the odds of wearing a hat is the same for females and males.
1. Write down the conclusion.
1. Are the CIs and tests statistically valid?
:::


<div class="figure" style="text-align: center">
<img src="jamovi/HatSunglasses/HatSunglasses-CI-Both.png" alt="Software output for the hats data." width="49%" /><img src="jamovi/HatSunglasses/HatSunglasses-Test-Both.png" alt="Software output for the hats data." width="50%" />
<p class="caption">(\#fig:SunglassesOutput)Software output for the hats data.</p>
</div>




::: {.exercise #OddsRatiosCITurbinesHT}
[*Dataset*: `Turbines`]
A study of turbine failures [@MyersBook; @NelsonLifeData] ran $73$\ turbines for around $1\,800\hs$, and found that seven developed fissures (small cracks).
They also ran a different set of\ $42$ turbines for about\ $3\,000\hs$, and found that nine developed fissures.

1. Construct the two-way table for the data.
1. Compute the difference between the proportions of fissures at $1\,800\hs$ and $3\,000\hs$, and hence the difference between the proportions.
1. Compute the odds of a fissure after $1\,800\hs$ and after $3\,000\hs$, and hence the OR.
1. Compute an approximate $95$%\ CI for the difference between the proportions.
1. Write down the $95$%\ CI for the difference between the proportions (Fig.\ \@ref(fig:TurbinesOutput)).
1. Interpret the CIs.
1. Write down, then interpret, a $95$%\ CI for the OR.
1. Test for a relationship.
1. Are the CIs and tests statistically valid?
:::


<div class="figure" style="text-align: center">
<img src="jamovi/Turbines/Turbines-Both-CITest.png" alt="Software output for the turbine data." width="60%" />
<p class="caption">(\#fig:TurbinesOutput)Software output for the turbine data.</p>
</div>



::: {.exercise #TestOddsRatioBearTree}
@witmer2020preliminary compared various types of repellents (including bear faeces) to prevent bears damaging trees in an Idaho forest.
Part of the data are summarised in 
Table\ \@ref(tab:BearTreeData).

1. Compute the odds of new damage for both repellents, and hence the OR.
1. Compute the proportion of trees with new damage for both repellents, and hence the difference between the proportions.
1. Write the hypothesis for conducting a hypothesis test involving proportions.
1. Write the hypothesis for conducting a hypothesis test involving odds.
1. Software gives $\chi^2$ as\ $4.4850$. 
   What is the equivalent $z$-score (e.g., for the test of proportions)? 
   Would you expect a large or small $P$-value?
1. The $P$-value, from software, is $P = 0.0342$. 
   Write a conclusion, either using odds or proportions.
1. Is the analysis statistically valid?
:::


<table>
<caption>(\#tab:BearTreeData)The number of trees with new damage by bears, according to different repellents.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> New damage </th>
   <th style="text-align:center;"> No new damage </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Bear faeces </td>
   <td style="text-align:center;"> $\phantom{0}6$ </td>
   <td style="text-align:center;"> $69$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Control (water) </td>
   <td style="text-align:center;"> $15$ </td>
   <td style="text-align:center;"> $60$ </td>
  </tr>
</tbody>
</table>

::: {.exercise #B12Deficiency}
[*Dataset*: `B12Diet`]
@data:Gammon2012:B12 examined B12\ deficiencies in 'predominantly overweight/obese women of South Asian origin living in Auckland'.
Some women were on a vegetarian diet and some were not
(Table\ \@ref(tab:B12Data)).
One RQ was:

> Among this group of women, are the odds of being vitamin\ B12 deficient different for women on a vegetarian diet compared to women on a non-vegetarian diet?

1. Compute the odds of B12 deficiency for both diets, and hence the OR.
1. Compute the proportion of women with B12 deficiency for both diets, and hence the difference between the proportions.
1. Write the hypothesis for conducting a hypothesis test involving proportions.
1. Write the hypothesis for conducting a hypothesis test involving odds.
1. Software gives $\chi^2$ as\ $4.7067$. 
   What is the equivalent $z$-score (e.g., for the test of proportions)? 
   Would you expect a large or small $P$-value?
1. The $P$-value, from software, is $P = 0.0305$. 
   Write a conclusion, either using odds or proportions.
1. Is the analysis statistically valid?
:::


<table>
<caption>(\#tab:B12Data)The number of vegetarian and non-vegetarian women who are (and are not) B12 deficient.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> B12 deficient </th>
   <th style="text-align:center;"> Not B12 deficient </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Vegetarians </td>
   <td style="text-align:center;"> $\phantom{0}8$ </td>
   <td style="text-align:center;"> $\phantom{0}26$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Non-vegetarians </td>
   <td style="text-align:center;"> $\phantom{0}8$ </td>
   <td style="text-align:center;"> $\phantom{0}82$ </td>
  </tr>
</tbody>
</table>








<!-- ```{r B12jamoviOutput, fig.show="hold", fig.cap="Software output for the B12 data.", fig.align="center", out.width=c("49%", "49%")} -->
<!-- knitr::include_graphics( "jamovi/B12/B12CI-Both.png") -->
<!-- knitr::include_graphics( "jamovi/B12/B12Test-Both.png") -->
<!-- ``` -->





::: {.exercise #DogsHT}
[*Dataset*: `DogWalks`]
@naughton2024association studied the difference between the activities of dogs kept in the city and on farms (Table\ \@ref(tab:DogWalkTable)).
One RQ was:

> For Northern Ireland dogs, is there an association between length of walks, and location?

1. Write down the hypotheses to answer this RQ.
1. Perform a hypothesis to answer the RQ, using the output in Fig.\ \@ref(fig:DogWalksjamovi).
1. Write down the conclusion, in terms of odds, including a CI.
1. Write down the conclusion, in terms of proportions, including a CI.
1. Is the test statistically valid?
:::


<table>
<caption>(\#tab:DogWalkTable)The length of walks for dogs, living in the city and farms. ('Varies' means usuually short walks, but occasional longer walks.)</caption>
 <thead>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; font-weight: bold; " colspan="4"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Walk length (in mins)</div></th>
</tr>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Under $30$ </th>
   <th style="text-align:center;"> $30$ to under $60$ </th>
   <th style="text-align:center;"> $60$ to under $120$ </th>
   <th style="text-align:center;"> Varies </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> City </td>
   <td style="text-align:center;"> $138$ </td>
   <td style="text-align:center;"> $\phantom{0}84$ </td>
   <td style="text-align:center;"> $\phantom{0}13$ </td>
   <td style="text-align:center;"> $264$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Farm </td>
   <td style="text-align:center;"> $\phantom{0}84$ </td>
   <td style="text-align:center;"> $102$ </td>
   <td style="text-align:center;"> $\phantom{0}33$ </td>
   <td style="text-align:center;"> $243$ </td>
  </tr>
</tbody>
</table>


<div class="figure" style="text-align: center">
<img src="jamovi/DogWalks/DogWalks-Test.png" alt="Software output for the dog-walking data." width="45%" />
<p class="caption">(\#fig:DogWalksjamovi)Software output for the dog-walking data.</p>
</div>



::: {.exercise #ComplianceHT}
[*Dataset*: `Mumps`]
@soud2009isolation studied the compliance of students with an isolation request following a large mumps outbreak in Kansas in 2006.
One RQ was:

> Is there an association between age group, and compliance with the isolation order?

The data are shown in 
Table\ \@ref(tab:MumpsTableHTML)
and the software output in
Fig.\ \@ref(fig:MumpsjamoviHTML).

1. Write down the hypotheses.
1. Compute the proportion of each age group that complied with the isolation request.
1. Compute the odds of each age group that complied with the isolation request.
1. Compute the relevant ORs (using 'Older than\ $22$' as the reference level), and interpret what these mean.
1. Determine the $\chi^2$-value and perform a hypothesis to answer the RQ.
1. Is the test statistically valid?
:::





<!--
\begin{figure}
\begin{minipage}{0.48\textwidth}
\captionof{table}{The compliance of students by age group\label{tab:MumpsTable}.}
\fontsize{8}{12}\selectfont
\begin{@empty}

\begin{tabular}{lcc}
\toprule
\textbf{ } & \textbf{Complied} & \textbf{Did not comply}\\
\midrule
$18$ to $19$ & $40$ & $10$\\
$20$ to $21$ & $37$ & $14$\\
Older than $22$ & $22$ & $\phantom{0}9$\\
\bottomrule
\end{tabular}
\end{@empty}
\end{minipage}
\hspace{0.05\textwidth}
\begin{minipage}{0.42\textwidth}%
\centering
<img src="jamovi/Mumps/Mumps-Test.png" width="100%" />
\caption{Software output for the compliance data.}\label{fig:Mumpsjamovi}
\end{minipage}%
\end{figure}
-->



<table>
<caption>(\#tab:MumpsTableHTML)The  compliance of students by age group.</caption>
 <thead>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; font-weight: bold; " colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Compliance</div></th>
</tr>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Complied </th>
   <th style="text-align:center;"> Did not comply </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> $18$ to $19$ </td>
   <td style="text-align:center;"> $40$ </td>
   <td style="text-align:center;"> $10$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> $20$ to $21$ </td>
   <td style="text-align:center;"> $37$ </td>
   <td style="text-align:center;"> $14$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Older than $22$ </td>
   <td style="text-align:center;"> $22$ </td>
   <td style="text-align:center;"> $\phantom{0}9$ </td>
  </tr>
</tbody>
</table>

<div class="figure" style="text-align: center">
<img src="jamovi/Mumps/Mumps-Test.png" alt="Software output for the compliance data." width="45%" />
<p class="caption">(\#fig:MumpsjamoviHTML)Software output for the compliance data.</p>
</div>





::: {.exercise #ShoppingBags}
[*Dataset*: `ShoppingBags`]
@choon2017perception studied $400$\ residents of  Klang Valley, Malaysia, to examine residents' approach to waste management.
One RQ was:

> For residents of Klang Valley, is age group associated with whether people bring their own bags when shopping?

The data 
(Table\ \@ref(tab:BagsTableHTHTML))
are given in a $3\times 2$ table of counts.
The software output is shown in 
Fig.\ \@ref(fig:BagsChisqjamoviHTML).






<!--
\begin{figure}
\begin{minipage}{0.48\textwidth}
\captionof{table}{Whether shoppers bring their own bags, and the shoppers age group\label{tab:BagsTableHT}.}
\fontsize{8}{12}\selectfont
\begin{@empty}

\begin{tabular}{lcc}
\toprule
\multicolumn{1}{c}{\textbf{ }} & \multicolumn{2}{c}{\textbf{Brings bags?}} \\
\cmidrule(l{3pt}r{3pt}){2-3}
\textbf{ } & \textbf{Yes} & \textbf{No}\\
\midrule
$30$ and under & $126$ & $138$\\
$31$ to $40$ & $\phantom{0}50$ & $\phantom{0}32$\\
Over $40$ & $\phantom{0}41$ & $\phantom{0}13$\\
\bottomrule
\end{tabular}
\end{@empty}
\end{minipage}
\hspace{0.05\textwidth}
\begin{minipage}{0.42\textwidth}%
\centering
<img src="jamovi/ShoppingBags/ShoppingBags-Test.png" width="100%" />
\caption{Software output for the shopping-bags data.}\label{fig:BagsChisqjamovi}
\end{minipage}%
\end{figure}
-->



<table>
<caption>(\#tab:BagsTableHTHTML)Whether shoppers bring their own bags, and the shoppers age group.</caption>
 <thead>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; font-weight: bold; " colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Compliance</div></th>
</tr>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Brings own bags </th>
   <th style="text-align:center;"> Does not bring own bags </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> $30$ and under </td>
   <td style="text-align:center;"> $126$ </td>
   <td style="text-align:center;"> $138$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> $31$ to $40$ </td>
   <td style="text-align:center;"> $\phantom{0}50$ </td>
   <td style="text-align:center;"> $\phantom{0}32$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Over $40$ </td>
   <td style="text-align:center;"> $\phantom{0}41$ </td>
   <td style="text-align:center;"> $\phantom{0}13$ </td>
  </tr>
</tbody>
</table>

<div class="figure" style="text-align: center">
<img src="jamovi/ShoppingBags/ShoppingBags-Test.png" alt="Software output for the shopping-bags data." width="45%" />
<p class="caption">(\#fig:BagsChisqjamoviHTML)Software output for the shopping-bags data.</p>
</div>



1. Compute the odds of someone bringing a shopping bag, for each age group.
1. Compute the OR of bringing a shopping bag (using the 'Over\ $40$' age group as the reference level).
1. Compute the percentage of people bringing a shopping bag, for each age group.
1. Construct the hypotheses for testing for an association between the variables.
1. Use the software output to answer the research question.
1. Write a conclusion.
1. Is the test statistically valid.
:::


::: {.exercise #CrabShells}
[*Dataset*: `CrabShells3`]
Hermit crabs place sea anemones on their shells for protection.
@brooks1989hermit studied the placement of the anemones:

> Is there a relationship between the vertical and horizontal locations of anemones placed by hermit crabs on their shells?

The data are shown in 
Table\ \@ref(tab:CrabShellDataHTML),
and output in
Fig.\ \@ref(fig:CrabShellsChisqjamoviHTML).

1. Perform a hypothesis test to answer the RQ using the $3\times 3$ table
(Fig.\ \@ref(fig:CrabShellsChisqjamoviHTML), top output).
1. Confirm that the statistical validity conditions are not met when using the $3\times 3$ table.
1. Construct a $2\times 2$ table, recording the location of the anemones as either 'Central' or 'Side' without distinguishing *which* side.
   Hence, repeat the test using the $2\times 2$ table
 (Fig.\ \@ref(fig:CrabShellsChisqjamoviHTML), bottom output).
   (These data are in the file `CrabShell2`.)
:::





<!--
\begin{figure}
\begin{minipage}{0.48\textwidth}
\captionof{table}{The location of anemones placed on shells by hermit crabs\label{tab:CrabShellData}.}
\fontsize{8}{12}\selectfont
\begin{@empty}

\begin{tabular}{lccc}
\toprule
\multicolumn{1}{c}{\textbf{ }} & \multicolumn{3}{c}{\textbf{Column}} \\
\cmidrule(l{3pt}r{3pt}){2-4}
\textbf{ } & \textbf{Side 1} & \textbf{Central} & \textbf{Side 2}\\
\midrule
\textbf{Row}: Side 1 & $\phantom{0}\phantom{0}2$ & $\phantom{0}\phantom{0}9$ & $\phantom{0}\phantom{0}9$\\
\textbf{Row}: Central & $\phantom{0}22$ & $\phantom{0}30$ & $\phantom{0}37$\\
\textbf{Row}: Side 2 & $\phantom{0}\phantom{0}1$ & $\phantom{0}\phantom{0}0$ & $\phantom{0}\phantom{0}2$\\
\bottomrule
\end{tabular}
\end{@empty}
\end{minipage}
\hspace{0.05\textwidth}
\begin{minipage}{0.42\textwidth}%
\centering
<img src="jamovi/CrabShells/CrabShells3ChisquareTest.png" width="100%" /><img src="jamovi/CrabShells/CrabShells2ChisquareTest.png" width="100%" />
\caption{Software output for the $3\times 3$ table of crab-shell data (top output), and for the $2\times 2$ table of crab-shell data (bottom output).}\label{fig:CrabShellsChisqjamovi}
\end{minipage}%
\end{figure}
-->



<table>
<caption>(\#tab:CrabShellDataHTML)The location of anemones placed on shells by hermit crabs.</caption>
 <thead>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; font-weight: bold; " colspan="3"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Column</div></th>
</tr>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Side 1 </th>
   <th style="text-align:center;"> Central </th>
   <th style="text-align:center;"> Side 2 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Row: Side 1 </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}2$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}9$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}9$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Row: Central </td>
   <td style="text-align:center;"> $\phantom{0}22$ </td>
   <td style="text-align:center;"> $\phantom{0}30$ </td>
   <td style="text-align:center;"> $\phantom{0}37$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Row: Side 2 </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}1$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}0$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}2$ </td>
  </tr>
</tbody>
</table>

<div class="figure" style="text-align: center">
<img src="jamovi/CrabShells/CrabShells3ChisquareTest.png" alt="Software output for the $3\times 3$ table of crab-shell data (top output), and for the $2\times 2$ table of crab-shell data (bottom output)." width="45%" /><img src="jamovi/CrabShells/CrabShells2ChisquareTest.png" alt="Software output for the $3\times 3$ table of crab-shell data (top output), and for the $2\times 2$ table of crab-shell data (bottom output)." width="45%" />
<p class="caption">(\#fig:CrabShellsChisqjamoviHTML)Software output for the $3\times 3$ table of crab-shell data (top output), and for the $2\times 2$ table of crab-shell data (bottom output).</p>
</div>








<!-- QUICK REVIEW ANSWERS -->
<!--
::: {.EOCanswerBox .EOCanswer data-latex="{iconmonstr-check-mark-14-240.png}"}
**Answers to *Quick review* questions:**
**1.** False.
**2.** True.
**3.** True.
**4.** False.
**5.** False.
**6.** True.
**7.** True.
**8.** True.
**9.** a.
:::
-->





