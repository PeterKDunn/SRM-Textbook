
# Comparing two means: CIs and tests {#AnalysisTwoMeans}
\index{Difference between means}

<!-- Introductions; easier to separate by format -->

::: {.objectivesBox .objectives data-latex="{iconmonstr-target-4-240.png}"}
You have learnt to ask an RQ, design a study, classify and summarise the data, construct confidence intervals, and conduct hypothesis tests.
**In this chapter**, you will learn to:

* identify situations where comparing two means is appropriate.
* construct confidence intervals for the difference between two means.
* conduct hypothesis tests for comparing two means.
* determine whether the conditions for using these methods apply in a given situation.
:::

<img src="30-CIsTesting-TwoMeans_files/figure-html/unnamed-chunk-6-1.png" width="65%" height="33%" style="display: block; margin: auto;" />



<!-- Define colours as appropriate -->






## Introduction: garter snakes {#TwoMeansHT-intro}

Some Mexican garter snakes (*Thamnophis melanogaster*) live in habitats with no crayfish, while some live in habitats with crayfish and hence use crayfish as a food source.
@manjarrez2017morphological were interested in whether the snakes in these two regions were different:

> For female Mexican garter snakes, is the mean snout--vent length (SVL) different for those in regions with crayfish and without crayfish?

Two different groups of snakes are studied, so this is a relational RQ (the study uses a between-individuals comparison\index{Comparison!between individuals}) with no intervention, and the data are shown 
below.




```{=html}
<div class="datatables html-widget html-fill-item" id="htmlwidget-2b682353726ca7c164d6" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-2b682353726ca7c164d6">{"x":{"filter":"none","vertical":false,"caption":"<caption>Snout--vent length (in cm) for female Mexican garter snakes living in crayfish (n = 35) and non-crayfish (n = 41) regions.<\/caption>","fillContainer":false,"data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86"],["No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","No","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes","Yes"],[52,null,null,47.5,null,29,39.5,48,49.5,43,44.5,36.5,43.5,51.2,34.8,33.2,26.5,40,52.5,null,48.5,48.5,47,38.5,44,43,47.5,48.5,40,34,54,null,43,24,36.2,38.8,48,45,50,26,37.5,43.5,58,42.5,44.5,43.5,51,15.5,38,44,40.5,26,21,34,46.5,46.5,19,22.5,19.5,55.5,47,46.5,32.5,null,39,26,23.5,null,null,null,49,33.5,40,38.5,20.5,46.5,17,49,17.5,24.5,null,17.5,31.5,20,52,45]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Crayfish?<\/th>\n      <th>SVL<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"searching":false,"columnDefs":[{"className":"dt-right","targets":2},{"orderable":false,"targets":0},{"name":" ","targets":0},{"name":"SNF.Crayfish","targets":1},{"name":"SNF.SVL","targets":2}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```


## Summarising the data and error bar charts {#ErrorBarCharts}

A numerical summary *must* summarise the difference between the means, because the RQ is about this difference.
Both groups should be summarised too.\index{Mean!difference between}
The information can be found using software (Fig.\ \@ref(fig:SnakesSummaryTestjamovi)),\index{Software output!comparing two means} and compiled into a table (Table\ \@ref(tab:SnakesNumericalTest)).
The appropriate summary for graphically summarising the *data* is (for example) a boxplot (Fig.\ \@ref(fig:SnakesErrorbar), left panel).\index{Graphs!boxplot}


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
No sample size or standard deviation is provided for the differences in Table\ \@ref(tab:SnakesNumericalTest); these make no sense in the context of comparing two means.
:::


<div class="figure" style="text-align: center">
<img src="jamovi/Snakes/Snakes-Test.png" alt="Software output for the garter-snakes data." width="100%" /><img src="jamovi/Snakes/Snakes-Summary.png" alt="Software output for the garter-snakes data." width="65%" />
<p class="caption">(\#fig:SnakesSummaryTestjamovi)Software output for the garter-snakes data.</p>
</div>


<table>
<caption>(\#tab:SnakesNumericalTest)Numerical summaries of SVL (in cm) for female snakes in two regions.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Mean </th>
   <th style="text-align:center;"> Standard deviation </th>
   <th style="text-align:center;"> Sample size </th>
   <th style="text-align:center;"> Standard error </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Non-crayfish region </td>
   <td style="text-align:center;"> $42.57$ </td>
   <td style="text-align:center;"> $\phantom{0}7.79$ </td>
   <td style="text-align:center;"> $41$ </td>
   <td style="text-align:center;"> $1.216$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Crayfish region </td>
   <td style="text-align:center;"> $34.17$ </td>
   <td style="text-align:center;"> $12.49$ </td>
   <td style="text-align:center;"> $35$ </td>
   <td style="text-align:center;"> $2.112$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Difference </td>
   <td style="text-align:center;"> $\phantom{0}8.39$ </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> $2.437$ </td>
  </tr>
</tbody>
</table>



<div class="figure" style="text-align: center">
<img src="30-CIsTesting-TwoMeans_files/figure-html/SnakesErrorbar-1.png" alt="Boxplot (left) and error bar chart (right) of SVL for female snakes in two regions." width="95%" />
<p class="caption">(\#fig:SnakesErrorbar)Boxplot (left) and error bar chart (right) of SVL for female snakes in two regions.</p>
</div>


Since two groups are being compared, subscripts are used to distinguish between the statistics for the two groups; say, Groups\ $1$ and\ $2$ in general (Table\ \@ref(tab:IndSampleNotationHT)).
Using this notation, the *parameter* in the RQ is the difference between population means: $\mu_1 - \mu_2$.
As usual, the population values are unknown, so this is estimated using the statistic $\bar{x}_1 - \bar{x}_2$.


<table>
<caption>(\#tab:IndSampleNotationHT)Notation used to distinguish between the two independent groups.</caption>
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
   <td style="text-align:left;"> Population means: </td>
   <td style="text-align:center;"> $\mu_1$ </td>
   <td style="text-align:center;"> $\mu_2$ </td>
   <td style="text-align:center;"> $\mu_1 - \mu_2$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sample means: </td>
   <td style="text-align:center;"> $\bar{x}_1$ </td>
   <td style="text-align:center;"> $\bar{x}_2$ </td>
   <td style="text-align:center;"> $\bar{x}_1 - \bar{x}_2$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Standard deviations: </td>
   <td style="text-align:center;"> $s_1$ </td>
   <td style="text-align:center;"> $s_2$ </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Standard errors: </td>
   <td style="text-align:center;"> $\displaystyle\text{s.e.}(\bar{x}_1) = \frac{s_1}{\sqrt{n_1}}$ </td>
   <td style="text-align:center;"> $\displaystyle\text{s.e.}(\bar{x}_2) = \frac{s_2}{\sqrt{n_2}}$ </td>
   <td style="text-align:center;"> $\displaystyle\text{s.e.}(\bar{x}_1 - \bar{x}_2)$ </td>
  </tr>
</tbody>
</table>


For the garter-snakes data, define the differences as the mean for females snakes living in non-crayfish regions\ ($N$), *minus* the mean for female snakes in crayfish regions\ ($C$): $\mu_N - \mu_C$.
This is the *parameter*.
By this definition, the differences refer to how much larger (on average) the SVL is for snakes living in non-crayfish regions.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Here the difference is computed as the mean\ SVL for snakes living in non-crayfish regions, *minus* the mean\ SVL for snakes living in crayfish regions.
Computing the difference as the mean\ SVL for snakes in crayfish regions, *minus* non-crayfish regions is also correct.

You need to be clear about how the difference is computed, and be consistent throughout.
The *meaning* of the conclusions will be the same whichever direction is used.
:::


A useful way to compare the means of two (or more) groups is to display the CIs for the means of the groups being compared in an *error bar chart*.\index{Graphs!error bar charts}
Error bars charts display the expected variation *in the sample means* from sample to sample, while boxplots display the variation *in the individual observations*.
For the garter-snakes data, the error bar chart (Fig.\ \@ref(fig:SnakesErrorbar), right panel) shows the $95$%\ CI for each group; the mean appears as a dot.

The two CIs for the SVL are (using information from the bottom table in Fig.\ \@ref(fig:SnakesSummaryTestjamovi)):

* \makebox[34mm][l]{Crayfish regions:} $34.171 \pm (2 \times 2.112)$, or from\ $29.94$ to\ $38.40\cms$.
* \makebox[34mm][l]{Non-crayfish regions:} $42.566 \pm (2\times 1.216)$, or from\ $40.13$ to\ $45.00\cms$.

However, the error bar chart, and these CIs, do not give a CI for the *difference* between the two means, as relevant to the RQ.


::: {.example #ErrorBarCharts2 name="Error bar charts"}
@data:ForestBiomass2017 studied the foliage biomass of small-leaved lime trees from three sources: coppices; natural; planted.
Three graphical summaries are shown in Fig.\ \@ref(fig:LimeTreesBoxErrorbar): a boxplot (showing the variation in *individual* trees; left), an error bar chart (showing the variation in the *sample means*; centre) on the same vertical scale as the boxplot, and the same error bar chart using a more appropriate scale for the error bar plot  (right).
:::


<div class="figure" style="text-align: center">
<img src="30-CIsTesting-TwoMeans_files/figure-html/LimeTreesBoxErrorbar-1.png" alt="Boxplot (left) and error bar charts (centre; right) comparing the mean foliage biomass for small-leaved lime trees from three sources (C:\ Coppice; N:\ Natural; P:\ Planted). The centre panel shows an error bar chart using the same vertical scale as the boxplot; the dashed horizontal lines are the limits of the error bar chart on the right. The right error bar chart uses a more appropriate scale on the vertical axis. The solid dots show the mean of the distributions." width="100%" />
<p class="caption">(\#fig:LimeTreesBoxErrorbar)Boxplot (left) and error bar charts (centre; right) comparing the mean foliage biomass for small-leaved lime trees from three sources (C:\ Coppice; N:\ Natural; P:\ Planted). The centre panel shows an error bar chart using the same vertical scale as the boxplot; the dashed horizontal lines are the limits of the error bar chart on the right. The right error bar chart uses a more appropriate scale on the vertical axis. The solid dots show the mean of the distributions.</p>
</div>


## Confidence intervals for  $\mu_1 - \mu_2$ {#CIDiffBetweenMeans}
\index{Sampling distribution!comparing two means}\index{Confidence intervals!comparing two means|(}

Each sample will comprise different snakes, and give different SVLs. 
The sample means for each group will differ from sample to sample, and the *difference* between the sample means will be different for each sample also.
The *difference* between the sample means varies from sample to sample, and so has a sampling distribution and a standard error.


::: {.definition #DEFSamplingDistributionDiffMeans name="Sampling distribution for the difference between two sample means"}
The *sampling distribution of the difference between two sample means*\ $\bar{x}_1$ and\ $\bar{x}_2$ is (when the appropriate conditions are met; Sect.\ \@ref(ValidityTwoMeans)) described by:

* an approximate normal distribution,
* centred around a sampling mean whose value is\ ${\mu_1} - {\mu_2}$, the difference between the *population* means,
* with a standard deviation, called the standard error of the difference between the means, of $\displaystyle\text{s.e.}(\bar{x}_1 - \bar{x}_2)$.

The standard error for the difference between the means is found using
$$
\text{s.e.}(\bar{x}_1 - \bar{x}_2) = \sqrt{ \text{s.e.}(\bar{x}_1)^2 + \text{s.e.}(\bar{x}_2)^2},
$$
though this value will often be *given* (e.g., on computer output) rather than needing to be computed.
:::


For the garter-snakes data, the differences between the sample means will have:

* an approximate normal distribution,
* centred around the sampling mean whose value is $\mu_N - \mu_C$,
* with a standard deviation, called the *standard error* of the difference, of $\text{s.e.}(\bar{x}_P - \bar{x}_C) = 2.437$.

The standard error of the difference between the means was computed using
$$
  \text{s.e.}(\bar{x}_N - \bar{x}_C)
  = \sqrt{ \text{s.e.}(\bar{x}_N)^2 + \text{s.e.}(\bar{x}_C)^2}
  = \sqrt{ 1.216^2 + 2.1112^2 } = 2.437,
$$
the same value shown in the *second row* of the software output (Fig.\ \@ref(fig:SnakesSummaryTestjamovi)).

The sampling distribution describes how the values of $\bar{x}_N - \bar{x}_C$ vary from sample to sample. 
Then, finding a $95$%\ CI for the difference between the mean SVLs is similar to the process used in Chap.\ \@ref(OneMeanConfInterval), since the sampling distribution has an approximate normal distribution:
$$
\text{statistic} \pm \big(\text{multiplier} \times\text{s.e.}(\text{statistic})\big).
$$
When the statistic is $\bar{x}_P - \bar{x}_C$, the approximate $95$%\ CI is
$$
(\bar{x}_N - \bar{x}_C) \pm \big(2 \times \text{s.e.}(\bar{x}_N - \bar{x}_C)\big).
$$
So, in this case, the approximate $95$%\ CI is
$$
8.394 \pm (2 \times 2.437)
$$
or $8.394\pm 4.874$, after rounding appropriately.
We write:

> The difference between mean SVLs is\ $8.39\cms$, shorter for those living in a crayfish region (mean: $34.17\cms$; s.e.: $2.112$; $n = 35$) compared to those *not* living in a crayfish region (mean: $42.57\cms$; s.e.: $1.216$; $n = 41$), with an *approximate* $95$%\ CI for the difference between mean SVLs from $3.52$ to $13.27\cms$.

The plausible values for the difference between the two population means SVLs are between\ $3.52$ to $13.27\cms$ (shorter for those living in crayfish regions).


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Giving the CI alone is insufficient; the *direction* in which the differences were calculated must be given, so readers know which group had the higher mean.
:::


Output from software often shows two CIs for the difference between the two means (Fig.\ \@ref(fig:SnakesSummaryTestjamovi)).
*We will use the results from Welch's test (the second row)*,\index{Welch's test} as this row of output is more general, and makes fewer assumptions, than the results in the first row.
The information in the second row makes fewer assumptions, and is more widely applicable.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Most software gives *two* CIs: one assuming the standard deviations in the two groups are the same (Student's), and another *not* assuming the standard deviations in the two groups are the same (Welch's).

We will use the information that does *not* assume the standard deviations in the two groups are the same.
In the software output in Fig.\ \@ref(fig:SnakesSummaryTestjamovi), this is the second row of the top table (labelled 'Welch's\ $t$').
(The information in both rows are often similar anyway.)
:::


From the output, the $95$%\ CI for the difference is from\ $3.51$ to\ $13.28\cms$.
The *approximate* CI and the *exact* (from software) CIs are only slightly different, as the samples sizes are not too small.
(Recall: the $t$-multiplier of\ $2$ is an approximation, based on the $68$--$95$--$99.7$ rule.)
\index{Confidence intervals!comparing two means|)}



## Hypothesis tests for $\mu_1 - \mu_2$: $t$-test
\index{Hypothesis testing!comparing two means|(}

A hypothesis test can be used to decide if the SVL is different for the two regions.
The parameter for the test is $\mu_N - \mu_C$.

As always, the null hypothesis is the default 'no difference, no change, no relationship' position; any difference between the parameter and statistic is due to sampling variation (Sect.\ \@ref(AboutHypotheses)).
Hence, the null hypothesis is 'no difference' between the population mean\ SVL of the two groups:

* $H_0$: $\mu_N - \mu_C = 0$ (equivalent to $\mu_N = \mu_C$).

From the RQ, the alternative hypothesis is *two*-tailed:

* $H_1$: $\mu_N - \mu_C\ne 0$ (equivalent to $\mu_N \ne \mu_C$).

The alternative hypothesis proposes that any difference between the *sample* means is because a difference really exists between the *population means*. 
The alternative hypothesis is two-tailed, based on the RQ.

The difference between the sample mean SVLs in the two groups depends on which one of the many possible samples is randomly obtained, *even if* the difference between the means in the population is zero.
The difference between the sample means is $8.394\cms$, but this difference will vary from sample to sample; that is, *sampling variation* exists.

For the SVL\ data, the sampling distribution of $\bar{x}_N - \bar{x}_C$ can be described as (see Def.\ \@ref(def:DEFSamplingDistributionDiffMeans)):

* an approximate normal distribution,
* centred around the sampling mean whose value is ${\mu_{N}} - {\mu_{C}} = 0$, the difference between the population means (from $H_0$),
* with a standard deviation of $\text{s.e.}(\bar{x}_N - \bar{x}_C) = 2.4368$.


::: {.softwareBox .software data-latex="{iconmonstr-laptop-4-240.png}"}
Most software gives *two* hypothesis test results: one assuming the standard deviations in the two groups are the same, and another *not* assuming the standard deviations in the two groups are the same.

We will use the information that does *not* assume the standard deviations in the two groups are the same.
In the software output in Fig.\ \@ref(fig:SnakesSummaryTestjamovi), this is the second row of the bottom table (labelled 'Welch's\ $t$').
(The information in both rows are often similar anyway.)
:::


The observed difference between sample means, relative to what was expected, is found by computing the test statistic; in this case, a $t$-score.
The software output (Fig.\ \@ref(fig:SnakesSummaryTestjamovi)) gives the $t$-score, but the $t$-score can also be computed using the information in Table\ \@ref(tab:SnakesNumericalTest):\index{Test statistic!t@$t$-score} 
\begin{align*}
t
&= 
\frac{\text{sample statistic} - \text{mean of sampling distribution (from $H_0$)}}
{\text{standard deviation of sampling distribution}}\\[6pt]
&= 
\frac{ (\bar{x}_P - \bar{x}_C) - (\mu_P - \mu_C)}
{\text{s.e.}(\bar{x}_P - \bar{x}_C)}
= \frac{8.39 - 0}{2.4368} = 3.44,
\end{align*}
as in the software output.

A $P$-value determines if the sample statistic is consistent with the assumption (i.e., $H_0$).
Since the $t$-score is large, the $P$-value will be small using the $68$--$95$--$99.7$ rule\index{68@$68$--$95$--$99.7$ rule} (and less than\ $0.003$).
This is confirmed by the software (Fig.\ \@ref(fig:SnakesSummaryTestjamovi)): the two-tailed $P$-value is\ $0.0011$.

A small $P$-value suggests the observations are *inconsistent* with the assumption of no difference (Table\ \@ref(tab:PvaluesInterpretation)), and the difference between the sample means could *not* be reasonably explained by sampling variation, if $\mu_N - \mu_C = 0$.



Click on the pins in the following image, and describe what the software output tells us.

<iframe src="https://learningapps.org/watch?v=pd365s6bj22" style="border:0px;width:100%;height:500px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>



In conclusion, write:

> Strong evidence exists in the sample (two independent samples $t = 3.445$; two-tailed $P = 0.0011$) that the population mean SVL is different for female snakes living in crayfish regions (mean:\ $34.17\cms$; $n = 35$) and non-crayfish regions (mean:\ $42.57\cms$; $n = 41$;\ $95$%\ CI for the difference: $3.51$ to\ $13.28\cms$ longer for those in non-crayfish regions).

The conclusion contains an *answer to the RQ*, the *evidence* leading to this conclusion ($t = 3.44$; two-tailed $P = 0.0011$), and *sample summary statistics*, including a CI.
\index{Hypothesis testing!comparing two means|)}



## Statistical validity conditions{#ValidityTwoMeans}
\index{Statistical validity (for inference)!comparing two means}

As usual, these results apply under certain conditions.
The CI and test for comparing two means is *statistically valid* if *either* of these is true:

* when *both* samples have $n \ge 25$.
  (If the distribution of a sample is highly skewed, the sample size for that sample may need to be larger.)
* when one or both groups have $25$\ or fewer observations, *and* the *populations* corresponding to the groups with samples sizes under\ $25$ have an approximate normal distribution.

The sample size of\ $25$ is a rough figure; some books give other values (such as\ $30$).

This condition ensures that the *distribution of the difference between sample means has an approximate normal distribution* (so that, for example, the $68$--$95$--$99.7$ rule can be used).
The histograms of the *sample data* can be used to determine if normality of the *populations* seems reasonable.
The units of analysis are also assumed to be *independent* (e.g., from a simple random sample).

If the statistical validity conditions are not met, other similar options include using a Mann-Whitney test\index{Mann-Whitney test} [@conover2003practical] or using resampling methods [@efron2021computer].


::: {.example #StatisticalValidityReactionHT name="Statistical validity"}
For the garter-snakes data, both samples sizes exceed\ $25$ ($41$ and\ $35$), so the test is statistically valid.
The data in each group do not need to be normally distributed, since both sample sizes are larger than\ $25$, and the data are not severely skewed (Fig.\ \@ref(fig:SnakesErrorbar), left panel).
:::


## Tests for comparing more than two means: ANOVA {#CompareManyMeans}

Often, more than two means need to be compared.
This requires a different method, called *analysis of variance*\index{Analysis of variance} (or <span style="font-variant:small-caps;">anova</span>).
The details are beyond the scope of this book.
In this section, a very brief overview of using a one-way <span style="font-variant:small-caps;">anova</span> is given, using an example.
Importantly, this example shows that the basic principles of hypothesis testing from Chap.\ \@ref(MoreAboutTests) still apply.


<span style="font-variant:small-caps;">Anova</span> is a general tool that can be extended beyond just comparing more than two means, and used in many and varied context for the analysis of data.


::: {.example #ANOVA name="ANOVA"}
[*Dataset*: `Lime`]
@data:ForestBiomass2017 studied the foliage biomass of small-leaved lime trees from three sources: coppices ($C$); natural ($N$); planted $P$); see Example\ \@ref(exm:ErrorBarCharts2).
A boxplot and error bar chart are shown in Fig.\ \@ref(fig:LimeTreesBoxErrorbar).
A numerical summary is shown in Table\ \@ref(tab:LimeTreesSummary) (based on the output in Fig.\ \@ref(fig:LimeTreesjamovi)).

To compare the mean foliage biomass of trees from the three sources, the null hypothesis is 'no difference' between the population means:
$$
  \text{$H_0$:}\ \mu_C = \mu_N = \mu_P.
$$
The alternative hypothesis is that the three means are not all equal. 
This hypothesis encompasses many possibilities: for example, that the three means are *all* different from each other, or that the first is different from the other two (which are the same).
Because the alternative hypothesis encompasses many possibilities, we write:
$$
  \text{$H_1$:}\ \text{Not all means are equal.}
$$


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
For comparing more than two means, the alternative hypothesis *is always two-tailed*.
:::


Performing an <span style="font-variant:small-caps;">anova</span> using software (Fig.\ \@ref(fig:LimeTreesjamovi)) gives $P = 0.005$.
(The *test statistic* here is an $F$-score;\index{Test statistic!F@$F$-score} we don't discuss these further, but the $F$-score measures the overall difference between the three means.)
The small $P$-value in this context means the same as usual (Sect.\ \@ref(AboutPvalues)): there is  persuasive evidence to support the alternative hypothesis (that the three means are *not* all equal).

While we know the means are not all the same, we do not know *which* group means are different from which other group means.
One option might be to compare all possible combinations of two groups (i.e., the means of groups\ $C$ and\ $N$; the means of groups\ $C$ and\ $P$; the means of groups\ $N$ and\ $P$) using three separate two-sample $t$-tests.
While  this approach is possible, it increases the probability of declaring a false positive (i.e., of making a Type\ I error; Sect.\ \@ref(TypeErrors)):\index{Type\ I error} *incorrectly* declaring that a difference exists between two sets of means.
The correct approach requires methods beyond this book.
:::



<div class="figure" style="text-align: center">
<img src="jamovi/Lime/LimeANOVA.png" alt="Software output for testing hypotheses for the lime-trees data." width="55%" />
<p class="caption">(\#fig:LimeTreesjamovi)Software output for testing hypotheses for the lime-trees data.</p>
</div>


<table>
<caption>(\#tab:LimeTreesSummary)Foliage biomass of lime trees (in kg) from different origins.</caption>
<tbody>
  <tr>
   <td style="text-align:left;"> Coppice </td>
   <td style="text-align:center;"> $2.01$ </td>
   <td style="text-align:center;"> $2.29$ </td>
   <td style="text-align:center;"> $0.199$ </td>
   <td style="text-align:center;"> $133$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Natural </td>
   <td style="text-align:center;"> $1.48$ </td>
   <td style="text-align:center;"> $1.76$ </td>
   <td style="text-align:center;"> $0.129$ </td>
   <td style="text-align:center;"> $185$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Planted </td>
   <td style="text-align:center;"> $2.68$ </td>
   <td style="text-align:center;"> $3.32$ </td>
   <td style="text-align:center;"> $0.406$ </td>
   <td style="text-align:center;"> $\phantom{0}67$ </td>
  </tr>
</tbody>
</table>





## Example: speed signage {#SpeedSignage}

<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/pexels-pixabay-315939.jpg" width="200px"/>
</div>

To reduce vehicle speeds on freeway exit ramps, @ma2019impacts studied the impact of additional signage.
At one site (Ningxuan Freeway), speeds were recorded for $38$\ vehicles *before* the extra signage was added, and then for $41$ different vehicles *after* the extra signage was added.

The researchers are hoping that the addition of extra signage will *reduce* the mean speed of the vehicles.
The RQ is:

> At this freeway exit, does the mean vehicle speed *reduce* after extra signage is added?

The data are *not* paired: different vehicles are measured before\ ($B$) and after\ ($A$) the extra signage is added.
Define $\mu$ as the mean speed (in km.h^$-1$^) on the exit ramp, and the parameter as $\mu_B - \mu_A$, the *reduction* in the mean speed.

The data can be summarised (Table\ \@ref(tab:SignageSummary)) using the software output (Fig.\ \@ref(fig:SpeedjamoviCI2)), where
$$
\text{s.e.}(\bar{x}_B - \bar{x}_A) 
= \sqrt{ \text{s.e.}(\bar{x}_B)^2 + \text{s.e.}(\bar{x}_A)^2} 
= \sqrt{ 2.140^2 + 2.051^2} = 2.965,
$$
as in the output table (Row\ 2).
A boxplot of the data is shown in Fig.\ \@ref(fig:SignageErrorBar) (left panel), and an error bar chart in Fig.\ \@ref(fig:SignageErrorBar) (right panel).


<div class="figure" style="text-align: center">
<img src="jamovi/Speed/Speed-ALL.png" alt="Software output for the speed data." width="100%" />
<p class="caption">(\#fig:SpeedjamoviCI2)Software output for the speed data.</p>
</div>


<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:SignageSummary)The signage data summary (in km.h$^{-1}$).</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Mean </th>
   <th style="text-align:center;"> Median </th>
   <th style="text-align:center;"> Standard deviation </th>
   <th style="text-align:center;"> Standard error </th>
   <th style="text-align:center;"> Sample size </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Before </td>
   <td style="text-align:center;"> $98.02$ </td>
   <td style="text-align:center;"> $98.2$ </td>
   <td style="text-align:center;"> $13.194$ </td>
   <td style="text-align:center;"> $\phantom{0}2.1$ </td>
   <td style="text-align:center;"> $38$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> After </td>
   <td style="text-align:center;"> $92.34$ </td>
   <td style="text-align:center;"> $93.9$ </td>
   <td style="text-align:center;"> $13.134$ </td>
   <td style="text-align:center;"> $\phantom{0}2.1$ </td>
   <td style="text-align:center;"> $41$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Speed reduction </td>
   <td style="text-align:center;"> $\phantom{0}5.68$ </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> $\phantom{0}3.0$ </td>
   <td style="text-align:center;">  </td>
  </tr>
</tbody>
</table>


<div class="figure" style="text-align: center">
<img src="30-CIsTesting-TwoMeans_files/figure-html/SignageErrorBar-1.png" alt="Boxplot (left) and error bar chart (right) showing the mean speed before and after the addition of extra signage, and the $95$\% CIs. The vertical scales on the two graphs are different." width="90%" />
<p class="caption">(\#fig:SignageErrorBar)Boxplot (left) and error bar chart (right) showing the mean speed before and after the addition of extra signage, and the $95$\% CIs. The vertical scales on the two graphs are different.</p>
</div>



An approximate $95$% CI for the difference between the mean speeds is
$$
5.674 \pm (2 \times 2.9642),
$$
or from\ $-0.25$ to\ $11.60\kms$.h^$-1$^.
(This is very similar to the $95$% CI shown in Fig.\ \@ref(fig:SpeedjamoviCI2).)
The negative value is not a negative speed.
Since the difference between the means is defined as a *reduction*, this CI means that the *reduction* in the populations mean speed is likely between $-0.25$ to\ $11.64\kms$.h^$-1$^.
Since a negative reduction is an increase, this is more easily understood as the difference being located between a $0.25\kms$.h^$-1$^ *increase* before the signage was added to an\ $11.64\kms$.h^$-1$^ *reduction* after the signage was added.

The hypotheses are:

* $H_0$: $\mu_B - \mu_A = 0$: there is no difference in the population mean speeds.
* $H_1$: $\mu_B - \mu_A > 0$: the population mean speed has *reduced* after the addition of signage.

The best estimate of the difference in *population* means is the difference between the *sample* means: $(\bar{x}_B - \bar{x}_A) = 5.68$.
Since $\text{s.e.}(\bar{x}_B - \bar{x}_A) = 2.965$, the $t$-score is
$$
t
= \frac{(\bar{x}_B - \bar{x}_A) - (\mu_B - \mu_A)}{\text{s.e.}(\bar{x}_B - \bar{x}_{A})}
= \frac{5.674 - 0}{2.9642} = 1.91.
$$
using Equation\ \@ref(eq:tscore).
(Recall that $\mu_B - \mu_A = 0$ is initially assumed, from the null hypothesis.)

Remembering that the alternative hypothesis is *one-tailed*, the $P$-value (using the $68$--$95$--$99.7$ rule) is larger than\ $0.025$, but smaller than\ $0.32$, so making a clear decision is difficult without using software.
However, since the $t$-score is *just* less than 2, we suspect that the $P$-value is likely to be closer to\ $0.025$ than to\ $0.32$.

From software, $P = 0.0297$ (you cannot be this precise just using the $68$--$95$--$99.7$ rule).
Using Table\ \@ref(tab:PvaluesInterpretation), this $P$-value provides moderate evidence of a reduction in mean speeds.
We conclude:

> Moderate evidence exists in the sample ($t = 1.91$; one-tailed $P = 0.030$) that mean speeds have reduced after the addition of extra signage (mean reduction: $5.67\kms$.h^$-1$^; $95$%\ CI for the difference: $-0.23$ to\ $11.6\kms$.h^$-1$^; s.e.: $2.96\kms$.h^$-1$^).
The before mean speed was $98.02\kms$.h^$-1$^ ($n = 38$; standard deviation: $13.19\kms$.h^$-1$^); the after mean speed was $92.34\kms$.h^$-1$^ ($n = 41$; standard deviation: $13.13\kms$.h^$-1$^).

Whether the mean speed reduction of $5.67\kms$.h^$-1$^ has *practical importance* is a separate issue.\index{Practical importance}
Using the validity conditions, the CI and the test are statistically valid.


::: {.tipBox .tip data-latex="{iconmonstr-info-6-240.png}"}
Remember: the conclusion must make clear *which* mean is larger! 
:::


## Example: chamomile tea {#ChamomileTea-TwoMeans}

(This study was seen in Sect.\ \@ref(ChamomileTea-Paired).)
@rafraf2015effectiveness studied patients with Type\ 2 diabetes mellitus (T2DM).
They randomly allocated $32$\ patients into a control group (who drank hot water), and $32$ to receive chamomile tea (@rafraf2015effectiveness).

The total glucose (TG) was measured for each individual in both groups, both before the intervention and after eight weeks on the intervention.
Summary data are given in Table\ \@ref(tab:TGsummaryTable).
Evidence suggests that the chamomile tea group shows a mean reduction in TG (Sect.\ \@ref(ChamomileTea-Paired)), while the hot-water group shows no evidence of a reduction.
That is, there appears to be a difference between the two groups regarding the *change* in TG.\spacex
However, the differences between the chamomile-tea and the hot-water groups may be due to the samples selected (i.e., sampling variation), so comparing the changes between the two groups is helpful.

The following relational RQ can be asked:

> For patients with T2DM, is the mean reduction in TG *greater* for the chamomile tea group compared to the hot water group?

Notice the RQ is one-tailed; the aim of the study is to determine if the chamomile-tea drinking group performs *better* (i.e., reduces the mean TG) than the control group.

This RQ is comparing two separate groups; specifically, comparing the *differences* between the two groups.
This study contains both *within*-individuals comparisons (see Sect.\ \@ref(ChamomileTea-Paired)) and a *between*-individuals comparison (this section); see Fig.\ \@ref(fig:TeaSummaryAnnotated).
This is equivalent to treating the *differences* for both groups as the two separate sets of data in the two-sample analysis.


<div class="figure" style="text-align: center">
<img src="OtherImages/ChamomileTea/ChamomileSummary-BetweenWithinGroups.png" alt="The chamomile-tea study has two within-individuals comparisons, and a between-individuals comparison (comparing the differences in each group)." width="100%" />
<p class="caption">(\#fig:TeaSummaryAnnotated)The chamomile-tea study has two within-individuals comparisons, and a between-individuals comparison (comparing the differences in each group).</p>
</div>


The corresponding hypotheses are:
<!--
$$
  \text{$H_0$: $\mu_T - \mu_W = 0$ \qquad and\qquad $H_1$: $\mu_T - \mu_W > 0$}
$$
-->

$$
  \text{$H_0$: $\mu_T - \mu_W = 0$ and $H_1$: $\mu_T - \mu_W > 0$}
$$

where\ $\mu$ refers to the mean *reduction* in TG, $T$ refers to the tea-drinking group, and $W$ to the hot-water drinking group.

The parameter $\mu_T - \mu_W$ is estimated by the statistic $\bar{x}_T - \bar{x}_W = 45.74\mgs$.dL^$-1$^.
The standard error for the statistic was found as $\text{s.e.}(\bar{x}_T - \bar{x}_W) = 8.42$ (using the information in Table\ \@ref(tab:TGsummaryTable)).
Hence, the test statistic is:
$$
  t 
  = \frac{(\mu_T - \mu_W) - (\bar{x}_T - \bar{x}_W)}{\text{s.e.}(\bar{x}_T - \bar{x}_W)}
  = \frac{45.75 - 0}{8.42} 
  = 5.43,
$$
which is very large, so the $P$ value will be very small (using the $68$--$95$--$99.7$ rule), and certainly smaller than\ $0.001$.

We write:

> There is very strong evidence ($t = 5.43$; one-tailed $P < 0.001$) that the mean reduction in TG for the chamomile-tea drinking group (mean reduction: $36.62\mgs$.dL^$-1$^) is greater than the mean reduction in TG for the hot-water drinking group (mean reduction: $-7.12\mgs$.dL^$-1$^; difference between means: $45.74\mgs$.dL^$-1$^; approx. $95$%\ CI: $28.64$ to\ $62.84\mgs$.dL^$-1$^).

Again, the sample sizes are larger than\ $25$, so the results are statistically valid.


## Chapter summary {#Chap30-Summary}

To compute a confidence interval (CI) for the difference between two means, compute the difference between the two sample means, $\bar{x}_1 - \bar{x}_2$, and identify the sample sizes\ $n_1$ and\ $n_2$.
Then compute the standard error, which quantifies how much the value of $\bar{x}_1 - \bar{x}_2$ varies across all possible samples:
$$
\text{s.e.}(\bar{x}_1 - \bar{x}_2)
=
\sqrt{ \text{s.e}(\bar{x}_1) + \text{s.e.}(\bar{x}_2)},
$$
where $\text{s.e.}(\bar{x}_1)$ and $\text{s.e.}(\bar{x}_2)$ are the standard errors of Groups\ $1$ and\ $2$.
The *margin of error* is (multiplier${}\times{}$standard error), where the multiplier is\ $2$ for an approximate $95$%\ CI (using the $68$--$95$--$99.7$ rule).
Then the CI is:
$$
(\bar{x}_1 - \bar{x}_2) \pm \left( \text{multiplier}\times\text{standard error} \right).
$$
The statistical validity conditions should also be checked.


These steps are used to test a hypothesis about a difference between two population means $\mu_1 - \mu_2$.

* Write the null hypothesis\ ($H_0$) and the alternative hypothesis\ ($H_1$); initially *assume* the value of $(\mu_1 - \mu_2)$ in the null hypothesis to be true.
* Describe the *sampling distribution*, which describes what to *expect* from the difference between the sample means based on this assumption: under certain statistical validity conditions, the difference between the sample means vary with:
  * an approximate normal distribution,
  * with sampling mean whose value is the value of $(\mu_1 - \mu_2)$ (from $H_0$), and
  * having a standard deviation of $\displaystyle \text{s.e.}(\bar{x}_1 - \bar{x}_2)$.
* Compute the value of the *test statistic*:
$$
  t = \frac{ (\bar{x}_1 - \bar{x}_2) - (\mu_1 - \mu_2)}{\text{s.e.}(\bar{x}_1 - \bar{x}_2)},
$$
where $\mu_1 - \mu_2$ is the hypothesised difference given in the null hypothesis.
* The $t$-value is like a $z$-score, and so an approximate *$P$-value* can be estimated using the $68$--$95$--$99.7$ rule, or found using software.
  Use the $P$-value to make a decision, and write a conclusion.
* Check the statistical validity conditions.

<span style="font-variant:small-caps;">Anova</span> is used to compare means for more than two groups.

The following short video may help explain some of these concepts:


<div style="text-align:center;">

```{=html}
<video src="./videos/TwoMeans.mp4" width="550" controls="controls" loop="loop" style="padding:5px; border: 2px solid gray;"></video>
```
</div>


## Quick review questions {#Chap35-QuickReview}

::: {.webex-check .webex-box}
@lee2016effect studied iron levels in Koreans with Type\ 2 diabetes, comparing people on a vegan ($n = 46$) and a conventional ($n = 47$) diet for $12$\ weeks.
A summary of the data for iron levels are shown in Table\ \@ref(tab:VeganDiet).

Are the following statements *true* or *false*?

1. An appropriate graph for displaying the *data* is a boxplot. \tightlist  
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. The difference between the means in the population is denoted $\mu_V - \mu_C$, where\ $V$ represent the vegan diet, and\ $C$ represents the conventional diet.  
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. The standard error of the difference between the sample means is denoted $\text{s.e.}(\bar{x}_V) - \text{s.e.}(\bar{x}_C)$.  
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. An error bar chart displays the variation in the *data*.  
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. The sample size is missing from the *Difference* row, but the value is $47 - 46 = 1$.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. The standard deviation is missing from the *Difference* row, but the value is $0.4$.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. The standard error for the difference cannpt be computed, as not enough information is given.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. The two-tailed $P$-value for the comparison is $P = 0.046$.
This means that *no evidence* that the population means are different.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
:::


<table>
<caption>(\#tab:VeganDiet)Comparing the iron levels (mg) for subjects using a vegan or conventional diet for $12$ weeks.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Mean </th>
   <th style="text-align:center;"> Standard deviation </th>
   <th style="text-align:center;"> $n$ </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Vegan diet </td>
   <td style="text-align:center;"> $13.9$ </td>
   <td style="text-align:center;"> $2.3$ </td>
   <td style="text-align:center;"> $46$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Conventional diet </td>
   <td style="text-align:center;"> $15.0$ </td>
   <td style="text-align:center;"> $2.7$ </td>
   <td style="text-align:center;"> $47$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Difference </td>
   <td style="text-align:center;"> $\phantom{0}1.1$ </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
</tbody>
</table>




## Exercises {#TestTwoMeansExercises}

[Answers to odd-numbered exercises] are given at the end of the book. 




::: {.exercise #TwoSampleDiffsA}
Suppose researchers are comparing the cell diameter of lymphocytes (a type of white blood cell) and tumour cells.
Define the mean diameter of lymphocytes as\ $\mu_L$, and the mean diameter of tumour cells as\ $\mu_T$.

If the difference between the means were defined as $\mu_L - \mu_T$, what does this *mean*?
:::


::: {.exercise #TwoSampleDiffsB}
Suppose researchers are comparing the braking distance of cars using two different types of brake pads (Type\ A and Type\ B).
Define the mean breaking distance for cars with Type\ A brake pads as\ $\mu_A$, and  mean breaking distance for cars with Type\ B brake pads as\ $\mu_B$.

If the difference between the means were defined as $\mu_B - \mu_A$, what does this *mean*?
:::


::: {.exercise #TwoMeansCISamplingDistSignage}
Sketch the sampling distribution for the difference between the mean speeds before and after adding extra signage (Sect.\ \@ref(SpeedSignage)).
:::


::: {.exercise #TwoMeansCISamplingDistTea}
Sketch the sampling distribution for the difference between reduction in mean TG for the tea-drinking and the hot-water drinking group (Sect.\ \@ref(ChamomileTea-TwoMeans)).
:::


::: {.exercise #TwoMeansWhales}
@agbayani2020growth measured (among other variables) the length of gray whales (*Eschrichtius robustus*) at birth.
Are female gray whales longer than males, on average, in the population at birth?
Summary information is shown in Table\ \@ref(tab:WhaleInfo).



<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:WhaleInfo)Numerical summary of length of whales at birth (in m).</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Mean </th>
   <th style="text-align:center;"> Standard deviation </th>
   <th style="text-align:center;"> Sample size </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Female </td>
   <td style="text-align:center;"> $4.66$ </td>
   <td style="text-align:center;"> $0.38$ </td>
   <td style="text-align:center;"> $26$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Male </td>
   <td style="text-align:center;"> $4.60$ </td>
   <td style="text-align:center;"> $0.30$ </td>
   <td style="text-align:center;"> $30$ </td>
  </tr>
</tbody>
</table>

1. Define the parameter, and write down its estimate.
Carefully describe what it means.
1. Sketch an error bar chart.
1. Compute the standard error of the difference between the two means.
1. Compile a numerical summary table.
1. Compute the approximate $95$%\ CI.
1. Write the hypotheses to answer the RQ.
1. Compute the $t$-score, and approximate the $P$-value using the $68$--$95$--$99.7$ rule.
1. Write a conclusion.
1. Are the CI and test statistically valid?
:::


::: {.exercise #TwoMeansNHANES}
[*Dataset*: `NHANES`]
Earlier, the <span style="font-variant:small-caps;">nhanes</span> study (Exercise\ \@ref(exr:CompareQuantExercisesNHANES)) was used to summarise the data used to answer this RQ:

> Among Americans, is the mean direct HDL cholesterol (in mmol.L^$-1$^) different for current smokers and non-smokers?

Use the software output in Fig.\ \@ref(fig:NHANESTest) to answer these questions.

1. Define the parameter of interest, and write down its estimate.
Carefully describe what it means.
1. Sketch an error bar chart.
1. Compile a numerical summary table.
1. Compute the approximate $95$%\ CI, and write a conclusion.
1. Write down the exact $95$%\ CI, and write a conclusion.
1. Write the hypotheses to answer the RQ.
1. Write down the standard error of the difference.
1. Write down the $t$-score and the $P$-value.
1. Write a conclusion.
1. Are the CI and test statistically valid?
1. Is the difference between the means likely to be of practical importance?
:::

(ref:NHANEScaption) Software output for the <span style="font-variant:small-caps;">nhanes</span> data.

<div class="figure" style="text-align: center">
<img src="jamovi/NHANES/NHANES-DirectHDL-Smoke-ALL.png" alt="(ref:NHANEScaption)" width="95%" />
<p class="caption">(\#fig:NHANESTest)(ref:NHANEScaption)</p>
</div>


::: {.exercise #MeansIndSamplesExercisesEchinacea}
@data:barrett:echinacea studied the effectiveness of echinacea to treat the common cold, and compared the mean duration of the cold for participants treated with echinacea or a placebo\index{Placebo} to determine if using echinacea *reduced* the mean duration of symptoms.
Participants were blinded to the treatment, and allocated to the groups randomly.
A summary of the data is given in Table\ \@ref(tab:Echinacea).

1. What is the parameter?
Carefully describe what it means.
1. Compute the standard error for the mean duration of symptoms for each group.
1. Compute the standard error for the difference between the means.
1. Sketch an error bar chart.
1. Compute an approximate $95$%\ CI for the *difference* between the mean durations for the two groups.
1. Compute an approximate $95$%\ CI for the population mean duration of symptoms for those treated with echinacea.
1. Write the hypotheses to answer the RQ.
1. Compute the standard error of the difference.
1. Compute the $t$-score, and approximate the $P$-value using the normal distribution tables.
1. Write a conclusion.
1. Are the CI and test statistically valid?
1. Are the results likely to be of practical importance?
:::



<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:Echinacea)Numerical summary of duration (in days) of common cold symptoms, for blinded patients taking echinacea or a placebo.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Mean </th>
   <th style="text-align:center;"> Standard deviation </th>
   <th style="text-align:center;"> Standard error </th>
   <th style="text-align:center;"> Sample size </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Placebo </td>
   <td style="text-align:center;"> $6.87$ </td>
   <td style="text-align:center;"> $3.62$ </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> $176$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Echinacea </td>
   <td style="text-align:center;"> $6.34$ </td>
   <td style="text-align:center;"> $3.31$ </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> $183$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Difference </td>
   <td style="text-align:center;"> $0.53$ </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
</tbody>
</table>



::: {.exercise #MeansIndSamplesExercisesCarpalTunnelSyndrome}
Carpal tunnel syndrome (CTS) is pain experienced in the wrists.
@data:Schmid2012:splinting compared two different treatments: night splinting, or gliding exercises.

Participants were *randomly allocated* to one of the two groups.
Pain intensity (measured using a quantitative visual analogue scale; *larger* values mean *greater* pain) were recorded after one week of treatment.
The data are summarised in Table\ \@ref(tab:CarpalTunnel).

1. What is the parameter?
   Carefully describe what it means.
1. Compute the standard error for the mean pain intensity for each group.
1. Compute the standard error for the difference between the mean of the two groups.
1. Sketch an error bar chart.
1. Compute an approximate $95$%\ CI for the *difference* in mean pain intensity for the treatments.
1. Compute an approximate $95$%\ CI for the population mean pain intensity for those treated with splinting.
1. Write the hypotheses to answer the RQ.
1. Compute the $t$-score, and approximate the $P$-value using the $68$--$95$--$99.7$ rule.
1. Write a conclusion.
1. Are the CI and test statistically valid?
:::


<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:CarpalTunnel)Numerical summary of pain intensity for two different treatments of carpal tunnel syndrome.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Mean </th>
   <th style="text-align:center;"> Standard deviation </th>
   <th style="text-align:center;"> Standard error </th>
   <th style="text-align:center;"> Sample size </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Exercise </td>
   <td style="text-align:center;"> $0.8$ </td>
   <td style="text-align:center;"> $1.4$ </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> $10$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Splinting </td>
   <td style="text-align:center;"> $1.1$ </td>
   <td style="text-align:center;"> $1.1$ </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> $10$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Difference </td>
   <td style="text-align:center;"> $0.3$ </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
</tbody>
</table>



::: {.exercise #TwoMeansDental}
[*Dataset*: `Dental`]
@data:woodward:dental recorded the sugar consumption in industrialised (mean: $41.8\kgs$/person/y) and non-industrialised (mean: $24.6\kgs$/person/y) countries.
The software output is shown in Fig.\ \@ref(fig:Dentaljamovi).

1. What is the parameter?
Carefully describe what it means.
1. Write the hypotheses.
1. Using the software output (Fig.\ \@ref(fig:Dentaljamovi)), write down and interpret the CI.
1. Write a conclusion for the hypothesis test.
1. Is the test statistically valid?
:::

<div class="figure" style="text-align: center">
<img src="jamovi/Dental/WoodwardWalker1994-ttest.png" alt="Software output for the sugar-consumption data; the Groups refer to whether the country is industrialised (Yes) or not (No)." width="95%" />
<p class="caption">(\#fig:Dentaljamovi)Software output for the sugar-consumption data; the Groups refer to whether the country is industrialised (Yes) or not (No).</p>
</div>



::: {.exercise #Deceleration}
[*Dataset*: `Deceleration`]
To reduce vehicle speeds on freeway exit ramps, @ma2019impacts studied using additional signage.
At one site studied (Ningxuan Freeway), speeds were recorded at various points on the freeway exit for vehicles *before* the extra signage was added, and then for different vehicles *after* the extra signage was added.

In addition, the *deceleration* of each vehicle was determined 
(Exercise\ \@ref(exr:CompareQuantDeceleration))
as the vehicle left the $120\kms$.h^$-1$^ speed zone and approached the $80\kms$.h^$-1$^ speed zone. 
Use the data, and the summary in Table\ \@ref(tab:SignageSummaryDecHT), to test the RQ:

> At this freeway exit, is the mean vehicle deceleration the same before extra signage is added and after extra signage is added?

Identify clearly the parameter of interest to understand how much the deceleration *increased* after adding the extra signage.
Remember to compute and interpret the CI for this parameter.
:::





<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:SignageSummaryDecHT)The signage deceleration data summary (in m.s$^{-2}$).</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Mean </th>
   <th style="text-align:center;"> Standard deviation </th>
   <th style="text-align:center;"> Standard error </th>
   <th style="text-align:center;"> Sample size </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Before </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}0.0745$ </td>
   <td style="text-align:center;"> $\phantom{0}0.0494$ </td>
   <td style="text-align:center;"> $\phantom{0}0.00802$ </td>
   <td style="text-align:center;"> $\phantom{0}38$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> After </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}0.0765$ </td>
   <td style="text-align:center;"> $\phantom{0}0.0521$ </td>
   <td style="text-align:center;"> $\phantom{0}0.00814$ </td>
   <td style="text-align:center;"> $\phantom{0}41$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Change </td>
   <td style="text-align:center;"> $\phantom{0}{-0.0020}$ </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;"> $\phantom{0}0.01143$ </td>
   <td style="text-align:center;">  </td>
  </tr>
</tbody>
</table>


::: {.exercise #FacePlant}
[*Dataset*: `ForwardFall`]
A study [@data:Wojcik:ForwardFall] compared the lean-forward angle in younger and older women (Table\ \@ref(tab:FacePlant)).
An elaborate set-up was constructed to measure this lean-forward angle, using harnesses.
Consider this RQ:

> Among healthy women, is the mean lean-forward angle *greater* for younger women compared to older women?

Use the software output (Fig.\ \@ref(fig:FallFowardTTestTestjamovi)) to answer these questions:

1. What is the parameter?
Carefully describe what it means.
1. What is an appropriate graph to display the *data*?
1. Construct an appropriate numerical summary from the software output (Fig.\ \@ref(fig:FallFowardTTestjamovi)).
1. Construct *approximate* and *exact* $95$%\ CIs.
Explain any differences.
1. Is the test one- or two-tailed?
1. Write the statistical hypothesis.
1. Use the software output to conduct the hypothesis test.
1. Write a conclusion.
1. Are the  CI and test statistically valid?
:::

<div class="figure" style="text-align: center">
<img src="jamovi/FallForward/FallForwardTTestOutput-All.png" alt="Software output for the face-plant data." width="95%" />
<p class="caption">(\#fig:FallFowardTTestTestjamovi)Software output for the face-plant data.</p>
</div>



::: {.exercise #BHADP}
@data:Becker1991:BHADP compared the access to health promotion (HP) services for people with and without a disability in southwestern of the USA.\spacex
'Access' was measured using the quantitative
*Barriers to Health Promoting Activities for Disabled Persons*  [(<span style="font-variant:small-caps;">bhadp</span>) scale](http://www.utexas.edu/nursing/chpr/resources/bhadp.html).
*Higher* scores mean *greater* barriers to health promotion services.
The RQ is:

> Is there a difference between the mean <span style="font-variant:small-caps;">bhadp</span> scores, for people with and without a disability, in southwestern USA?

1. What is the parameter?
   Carefully describe what it means.
1. Sketch an error bar chart.
1. Compute the standard error of the difference.
1. Compile a numerical summary table.
1. Compute the approximate $95$%\ CI, and write a conclusion.
1. Write down the hypotheses.
1. Compute the $t$-score.
1. Determine the $P$-value.
1. Write a conclusion.
1. Are the CI and  test statistically valid?
:::


<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:BHADPSummary)The data summary for <span style="font-variant:small-caps;">bhadp</span> scores (no measurement units).</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Sample mean </th>
   <th style="text-align:center;"> Standard deviation </th>
   <th style="text-align:center;"> Sample size </th>
   <th style="text-align:center;"> Standard error </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Disability </td>
   <td style="text-align:center;"> $31.83$ </td>
   <td style="text-align:center;"> $7.73$ </td>
   <td style="text-align:center;"> $132$ </td>
   <td style="text-align:center;"> $0.67280$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> No disability </td>
   <td style="text-align:center;"> $25.07$ </td>
   <td style="text-align:center;"> $4.80$ </td>
   <td style="text-align:center;"> $137$ </td>
   <td style="text-align:center;"> $0.41010$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Difference </td>
   <td style="text-align:center;"> $\phantom{0}6.76$ </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
</tbody>
</table>




::: {.exercise #TestTwoMeansBodyTemperature}
[*Dataset*: `BodyTemp`]
Consider again the body temperature data from Sect.\ \@ref(BodyTemperature).
The researchers also recorded the gender of the patients, as they also wanted to compare the mean internal body temperatures for females and males.

Use the software output in Fig.\ \@ref(fig:BodyTempGenderjamoviHT) to perform this test and to construct an approximate $95$%\ CI appropriate for answering the RQ.
Comment on the practical significance of your results.
:::

<div class="figure" style="text-align: center">
<img src="jamovi/BodyTemp/BodyTempTestGender.png" alt="Software output for the body-temperature data." width="100%" />
<p class="caption">(\#fig:BodyTempGenderjamoviHT)Software output for the body-temperature data.</p>
</div>


::: {.exercise #TestTwoMeansFitnessOfParamedics}
@data:chapman2007:MaleParamedics compared 'conventional' male paramedics in Western Australia with male 'special-operations' paramedics.
Some information comparing their physical profiles is shown in Table\ \@ref(tab:ParamedicsTest).

1. Compute the missing standard errors.
1. Compare the mean grip strength for the two groups of paramedics.
(The *standard error for the difference between the means* is $3.30$.) 
1. Compare the mean number of push-ups completed in one minute for the two groups of paramedics. 
(The *standard error for the difference between the means* is $4.0689$.) 
:::


<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:ParamedicsTest)The physical profile of conventional ($n = 18$) and special operation ($n = 11$) paramedics in Western Australia.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Conventional </th>
   <th style="text-align:center;"> Special Operations </th>
  </tr>
 </thead>
<tbody>
  <tr grouplength="3"><td colspan="3" style="border-bottom: 1px solid;"><strong>Grip strength (in kg)</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Mean </td>
   <td style="text-align:center;"> $51$ </td>
   <td style="text-align:center;"> $56$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Standard deviation </td>
   <td style="text-align:center;"> $\phantom{0}8$ </td>
   <td style="text-align:center;"> $\phantom{0}9$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Standard error </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr grouplength="3"><td colspan="3" style="border-bottom: 1px solid;"><strong>Push-ups (per minutes)</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Mean </td>
   <td style="text-align:center;"> $36$ </td>
   <td style="text-align:center;"> $47$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Standard deviation </td>
   <td style="text-align:center;"> $10$ </td>
   <td style="text-align:center;"> $11$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Standard error </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
</tbody>
</table>


::: {.exercise #TwoMeansCIExercisesAnorexia}
[*Dataset*: `Anorexia`]
Young girls ($n = 29$) with anorexia received cognitive behavioural treatment (@data:hand:handbook), while another $n = 26$ young girls received a control treatment (the 'standard' treatment).
All girls had their weight recorded before and after treatment.

1. Determine the mean *gain* for individual girls using software.
1. Compute a CI for the mean weight gain for the girls in each group.
1. Compute a CI for the difference between the mean weight gains for the two treatment groups.
1. Conduct a test to determine if there is a difference between the mean weight gains for the two treatment groups.
:::


::: {.exercise #Coeliac}
Researchers studied the impact of a gluten-free diet on dental cavities [@khalaf2020caries].
Some summary information regarding the number decayed, missing and filled teeth (DMFT) is shown in Table\ \@ref(tab:CoeliacDMFTCI).
An *exact* $95$%\ CI is given as for the difference is\ $-2.32$ to\ $2.76$.

1. Using the $68$--$95$--$99.7$ rule gives a slightly different CI.\spacex
Why?
1. True or false: the difference is computed as the number of DMFT for coeliacs minus non-coeliacs. \tightlist 
1. True or false: one of the values for the CI is a negative value, which must be an error (as a negative number of DMFT is impossible).
1. We are $95$%\ confident that the difference between the population means is:

   * smaller for coeliacs;
   * between\ $2.32$ higher for non-coeliacs to\ $2.76$ higher for coeliacs.
   * between\ $2.76$ higher for non-coeliacs to\ $2.32$ higher for coeliacs.
:::


<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:CoeliacDMFTCI)The summary of the number of DMFT for coeliacs and non-coeliacs.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Sample size </th>
   <th style="text-align:center;"> Mean </th>
   <th style="text-align:center;"> Standard deviation </th>
   <th style="text-align:center;"> Standard error </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Coeliacs </td>
   <td style="text-align:center;"> $23$ </td>
   <td style="text-align:center;"> $8.39$ </td>
   <td style="text-align:center;"> $4.4$ </td>
   <td style="text-align:center;"> $0.92$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Non-coeliacs </td>
   <td style="text-align:center;"> $23$ </td>
   <td style="text-align:center;"> $8.17$ </td>
   <td style="text-align:center;"> $4.1$ </td>
   <td style="text-align:center;"> $0.86$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-style: italic;"> Difference </td>
   <td style="text-align:center;font-style: italic;">  </td>
   <td style="text-align:center;font-style: italic;"> $0.22$ </td>
   <td style="text-align:center;font-style: italic;">  </td>
   <td style="text-align:center;font-style: italic;"> $1.30$ </td>
  </tr>
</tbody>
</table>




::: {.exercise #TwoMeansReactionTimes}
[*Dataset*: `ReactionTime`]
@data:Strayer2001:phones examined the reaction times, while driving, for students from the University of Utah [@agresti2007statistics].
In one study, students were randomly allocated to one of two groups: one group *used* a mobile phone while driving in a driving simulator, and one group *did not use* a mobile phone while driving in a driving simulator.
The reaction time for each student was measured.
The data are shown
below.

Use the data to answer this RQ:

> For students, what is the difference between the mean reaction time while driving when using a mobile phone and when *not* using a mobile phone?
:::



```{=html}
<div class="datatables html-widget html-fill-item" id="htmlwidget-dd0076bbd91127297b07" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-dd0076bbd91127297b07">{"x":{"filter":"none","vertical":false,"caption":"<caption>Reaction times (in milliseconds) for students using, and not using, mobile phones, while driving.<\/caption>","fillContainer":false,"data":[[636,623,615,672,601,600,542,554,543,520,609,559,595,565,573,554,626,501,574,468,578,560,525,647,456,688,679,960,558,482,527,536],[557,572,457,489,532,506,648,485,610,444,626,626,426,585,487,436,642,476,586,565,617,528,578,472,485,539,523,479,535,603,512,449]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th>Reaction time: using phone<\/th>\n      <th>Reaction time: not using phone<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"searching":false,"columnDefs":[{"className":"dt-right","targets":[0,1]},{"name":"Use phone","targets":0},{"name":"Not using phone","targets":1}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```





::: {.exercise #TwoMeansCIExercisesBMIanova}
[*Dataset*: `BMI`]
@johnson2021association collected data from hospital outpatients at an Irish hospital.
One RQ in the study concerns comparing the mean number of days per week that patients exercise for more than $30\mins$ (say, $\mu$) according to their smoking status: daily\ ($D$), occasionally\ ($O$) or not at all\ ($N$).

Use the output (Fig.\ \@ref(fig:BMIjamovi)) to answer the questions that follow.

1. Construct an error bar chart to summarise the data. 
1. Construct a numerical summary table.
2. Perform a suitable hypothesis test, and answer the RQ,
:::


<div class="figure" style="text-align: center">
<img src="jamovi/BMI/BMIANOVA.png" alt="Software output for testing hypotheses for the BMI data." width="55%" />
<p class="caption">(\#fig:BMIjamovi)Software output for testing hypotheses for the BMI data.</p>
</div>



<!-- QUICK REVIEW ANSWERS -->
<!--
::: {.EOCanswerBox .EOCanswer data-latex="{iconmonstr-check-mark-14-240.png}"}
**Answers to *Quick review* questions**:
**1.** True.
**2.** True.
**3.** False: $\text{s.e.}(\bar{x}_C - \bar{x}_V)$.
**4.** False: variation for the sample means.
**5.** False: sample size makes no sense.
**6.** False: standard deviation makes no sense
**7.** False: $0.5197$.
**8.** False: *slight* evidence population means are different.
:::
-->
