# Tests for one proportion {#TestOneProportion}


<!-- Introductions; easier to separate by format -->

::: {.objectivesBox .objectives data-latex="{iconmonstr-target-4-240.png}"}
So far, you have learnt to ask a RQ, design a study, and classify and summarise the data.
You have also learnt to construct confidence intervals.
**In this chapter**, you will learn to:
  
* conduct hypothesis tests for one sample proportion, using a $z$-test.
* determine whether the conditions for using these methods apply in a given situation.
:::

<img src="31-Testing-OneProportion_files/figure-html/unnamed-chunk-2-1.png" width="fig.width=55%" style="display: block; margin: auto;" />



## Introduction: rolling dice {#ProportionTestIntro}


<div style="float:right; width: 222x; border: 1px; padding:10px"><img src="Illustrations/LoadedDice.png" width="200px"/></div>


<!--
\begin{wrapfigure}[8]{R}{.25\textwidth}
  \centering
  \vspace{-10pt} % This removes some white space
  \includegraphics[width=.23\textwidth]{Illustrations/LoadedDice.png}
\end{wrapfigure}
-->


In a toy store one day (for my children...), I saw 'loaded dice' for sale.
The packaging claimed 'One loaded \& one normal'.
I bought two packs!
However, there was no indication as to *which* die was loaded.
So how could I determine which was 'loaded'?
I guess had to roll the dice...

Suppose I selected one die to roll.
If that die happened to be the fair die, I'd expect that each face would appear *approximately* (but not exactly) one-sixth of the time (using classical probability; Sect.\ \@ref(ProbClassical)).
So, I could roll one die, and see how often a <img src="Dice/die1.png" width="13" /> actually appeared.
Using the decision-making process discussed earlier (Sect.\ \@ref(DecisionMaking)), then I could decide if that die was the fair die.

I could ask the decision-making RQ:

> For this die, is the population proportion of rolls that show a <img src="Dice/die1.png" width="13" /> equal to $1/6$?


## Statistical hypotheses and notation

If the die was fair, about one-sixth of rolls would produce a <img src="Dice/die1.png" width="13" />... but not necessarily *exactly* one-sixth, due to *sampling variation*.
Sometimes the value of $\hat{p}$ would be a little smaller than $1/6$, and sometimes a little larger, even if $p$ really was $1/6$.

By initially assuming the population proportion of ones is $1/6$, the possible values of the *sample* proportion from all possible rolls of the fair die could be determined; that is, the *sampling distribution* could be described.
Then, reasonably-expected values of the sample proportion can be compared to the observed value of $\hat{p}$ from the single sample.

If the sample proportion of rolls that are <img src="Dice/die1.png" width="13" /> is not *exactly* $1/6$, two explanations exist:

* The *population* proportion *really is* $1/6$, and the *sample* proportion $\hat{p}$ is not exactly $1/6$ due to sampling variation; or
* The *population* proportion *really is not* $1/6$; that is, the *sample* proportion $\hat{p}$ is not exactly $1/6$ because the die is not fair.

These two possible explanations are called *statistical hypotheses*.
If $p$ is defined as the population proportion of ones, then the hypotheses above are:

* $H_0$: $p = 1/6$, called the *null hypothesis*; and
* $H_1$: $p \ne 1/6$, the called *alternative hypothesis*.

The hypotheses propose values for the unknown *population* proportion (the *parameter* $p$).
Proposing values for the sample proportion (i.e., the statistic $\hat{p}$) is silly: we *know* the observed value of $\hat{p}$ after rolling the die.

The alternative hypothesis can take different forms, depending on the research question.
Here, the RQ here is open to the value of $p$ being smaller *or* larger than $1/6$; that is, two possibilities are considered (since the value of $p$ may be higher or lower than $1/6$ if the die is loaded).
Hence, we write $p\ne 1/6$, which is called a *two-tailed* alternative hypothesis.
An alternative hypothesis like $p > 1/6$ or $p < 1/6$ is a *one-tailed* hypothesis.


## Describing the sampling distribution {#OnePropTestSamplingDist}
\index{Sampling distribution!one proportion (Test)}

When the population proportion of rolls that are a <img src="Dice/die1.png" width="13" /> really is $p = 1/6$, what values of the *sample* proportion are reasonable to expect, given sampling variation?
The answer depends on the sample size.
In *one* roll of a die, rolling a <img src="Dice/die1.png" width="13" />, and hence finding a sample proportion of $\hat{p} = 1$, is not unreasonable.
However, in $20\ 000$ rolls, a sample proportion of $\hat{p} = 1$ would be *incredibly* unlikely for a fair die.

*Hypothesis testing always begins by assuming the null hypothesis is true*.
Here, that means initially assuming that $p = 1/6$.
In Chap.\ \@ref(CIOneProportion), the sampling distribution of a sample proportion was given when $p$ is a known value (see Sect.\ \@ref(SamplingDistributionKnownp)).
Hence, if I decide to use $n = 100$ rolls of the die, the sampling distribution for this die situation can be described as:

* an approximate normal distribution,
* with mean of $1/6$,
* with a standard deviation of 
  $\displaystyle \text{s.e.}(\hat{p}) 
  = \sqrt{\frac{ (1/6) \times \left(1 - (1/6)\right)}{100}} = 0.037267$.

This is how the values of $\hat{p}$ would very if $p$ really was $1/6$, and if certain conditions are met (Sect.\ \@ref(ValidityProportionsTest)).

The *mean* of this distribution is the *mean* of all possible values of $\hat{p}$; the value of that mean is $p$.
Similarly, the standard deviation of this distribution is the *standard error*, denoted $\text{s.e.}(\hat{p})$, the standard deviation of all possible values of the statistic $\hat{p}$.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
The notation $\text{s.e.}(\hat{p})$ denotes the *standard error of the sample proportion*.
Its value is the standard deviation of the proportions computed from all possible samples of a given size\ $n$.
:::



<!-- ```{r NotationOnePropHT} -->
<!-- OneProportionNotation <- array( dim = c(4, 2)) -->

<!-- OneProportionNotation[1, ] <- c("Individual values in the population", -->
<!--                           "Proportion of successes $p$") -->
<!-- OneProportionNotation[2, ] <- c("Individual values in a sample", -->
<!--                           "Proportion of successes $\\hat{p}$") -->
<!-- OneProportionNotation[3, ] <- c("Sample proportions ($\\hat{p}$) across", -->
<!--                           "Vary with approx. normal distribution (under certain conditions)") -->
<!-- OneProportionNotation[4, ] <- c("all possible samples", -->
<!--                           "with mean $\\mu_{\\hat{p}}$ and standard deviation $\\text{s.e.}(\\hat{p})$") -->


<!-- if( knitr::is_latex_output() ) { -->
<!--   kable( OneProportionNotation, -->
<!--          format = "latex", -->
<!--          booktabs = TRUE, -->
<!--          longtable = FALSE, -->
<!--          escape = FALSE, -->
<!--          caption = "The notation used for describing means, and the sampling distribution of the sample means", -->
<!--          align = c("r", "l"), -->
<!--          linesep = c("\\addlinespace", -->
<!--                      "\\addlinespace", -->
<!--                      ""), -->
<!--          col.names = c("Quantity", -->
<!--                        "Description") ) %>% -->
<!-- 	row_spec(0, bold = TRUE) %>% -->
<!--   kable_styling(font_size = 10) -->
<!-- } else { -->
<!--   OneProportionNotation[3, 1] <- paste(OneProportionNotation[3, 1],  -->
<!--                                  OneProportionNotation[4, 1]) -->
<!--   OneProportionNotation[3, 2] <- paste(OneProportionNotation[3, 2],  -->
<!--                                  OneProportionNotation[4, 2]) -->
<!--   OneProportionNotation[4, ] <- NA -->

<!--     kable( OneProportionNotation, -->
<!--          format = "html", -->
<!--          booktabs = TRUE, -->
<!--          longtable = FALSE, -->
<!--          escape = FALSE, -->
<!--          caption = "The notation used for describing means, and the sampling distribution of the sample means", -->
<!--          align = c("r", "l"), -->
<!--          linesep = c("\\addlinespace", -->
<!--                      "\\addlinespace", -->
<!--                      ""), -->
<!--          col.names = c("Quantity", -->
<!--                        "Description") ) %>% -->
<!-- 	row_spec(0, bold = TRUE)  -->
<!-- } -->
<!-- ``` -->



::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
When computing the standard error for a proportion, take care!

* The formula for a *confidence interval* uses the *sample proportion* $\hat{p}$ (see Eq.\ \@ref(eq:stderrorphat)), since we only have sample information to work with when forming a confidence interval.
* The formula for a *hypothesis test* uses the *population proportion* $p$ from the null hypothesis (see Eq.\ \@ref(eq:StdErrorPknownTest)), since hypothesis testing *assumes the null hypothesis is true*, and hence the value of $p$ is known.

In both cases, use a *proportion* in the formula, not a *percentage* (i.e., $0.16666...$ rather than $16.666...$%). 
Don't forget to take the square root!
:::


A picture of this sampling distribution (Fig.\ \@ref(fig:RollsSixesSD)) shows how the *sample* proportion varies when $n = 100$ across all possible samples, simply due to sampling variation, when $p = 1/6 = 0.1666...$.
Values of $\hat{p}$ between about $13$% and $20$% would seem to occur reasonably frequently when $p = 1/6$.
Values of $\hat{p}$ larger than $0.25$ look unlikely when $n = 100$; values less than $0.10$ also appear unlikely, but not impossible.
A value above $0.30$ looks almost impossible.


<div class="figure" style="text-align: center">
<img src="31-Testing-OneProportion_files/figure-html/RollsSixesSD-7.png" alt="The sampling distribution, showing the distribution of the sample proportion of 1s when the population proportion is $1/6$, in $50$ die rolls" width="90%" />
<p class="caption">(\#fig:RollsSixesSD)The sampling distribution, showing the distribution of the sample proportion of 1s when the population proportion is $1/6$, in $50$ die rolls</p>
</div>


In my $100$ rolls of one die, $41$ showed a <img src="Dice/die1.png" width="13" />, a sample proportion of $\hat{p} = 41/100 = 0.41$.
From Fig.\ \@ref(fig:RollsSixesSD)---the values of $\hat{p}$ from *all* possible samples---this is practically impossible *if the die was fair*.
What I observed was almost impossible... but I really did observe it.
A reasonable conclusion is that the assumption I was making---that the die is fair---is not tenable, nor supported by the evidence (i.e., the data).


## Computing the value of the test statistic {#OnePropTestStatistic}
\index{Hypothesis testing!one proportion}

One way to measure how far the sample proportion $\hat{p} = 0.41$ is from the population proportion $p = 1/6$ in $100$ rolls is to use a $z$-score, since the sampling distribution (Fig.\ \@ref(fig:RollsSixesSD)) has an approximate normal distribution.
Since the mean is $p$ and standard deviation is $\text{s.e.}(\hat{p})$, the $z$-score is  
\begin{align*}
   z 
   &= \frac{\text{sample statistic} - \text{mean of the distribution}}{\text{standard deviation of the distribution}}\\
   &= \frac{\hat{p} - p }{\text{s.e.}(\hat{p})}
    = \frac{0.41 - 0.1666...}{0.037267} = 6.53.
\end{align*}
In this context, the $z$-score is called a *test statistic*.
It means that the observed sample proportion is more than six standard deviations from the mean, which is *highly unusual* according to the [$68$--$95$--$99.7$ rule](#def:EmpiricalRule) (or Tables).


## Determining $P$-values {#OnePropTestP}

The value of the $z$-score shows that the value of $\hat{p}$ is highly very unusual... but how unusual?
Quantifying *how* unusual is assessed using a $P$-value, which is used widely in scientific research. 

$P$-values refer to the area *more extreme* than the calculated $z$-score in the normal distribution; that is, in the *tails* of the distribution.
For *two-tailed* $P$-values, the $P$-value is the combined area in the lower and upper tails.
For *one-tailed* $P$-values, the $P$-value is the area in one tail only.
Clearly, since the $P$-value is a probability, its value is always between $0$ and $1$.


<!-- ```{r, OneTwoP, fig.cap="One-tailed $P$ values (left; center) and two-tailed P-values (right). The two-tailed $P$-value is the combined area in the two tails of the distribution", fig.width=10, fig.height=3, out.width='90%', fig.align="center"} -->
<!-- par(mfrow = c(1, 3),  -->
<!--     mar = c(4, 1, 4, 1) + 0.1) -->


<!-- #####  -->

<!-- out <- plotNormal(mu = 0, -->
<!--            sd = 1, -->
<!--            main = expression( atop( A~one-tailed~italic(P)*"-value"~"if"~italic(z)==1~or~italic(z)==-1*":", -->
<!--                                     approx.~italic(P)*"-"*value*":"~0.32) ), -->
<!--            xlab = expression(italic(z)*"-score") -->
<!--            ) -->

<!-- shadeNormal(out$x, out$y, -->
<!--             lo = -5,  -->
<!--             hi = -1, -->
<!--             col = plot.colour) -->
<!-- polygon(x = c(-0.9, -0.9, 0.9, 0.9), # White-ish background for above text -->
<!--         y = c(0.05, 0.14, 0.14, 0.05), -->
<!--         border = NA, -->
<!--         col = "white") -->

<!-- anchorN <- c(-2, 0.08) -->

<!-- arrows(x0 = -1.25,  -->
<!--        x1 = anchorN[1], -->
<!--        y0 = 0.04, -->
<!--        y1 = anchorN[2], -->
<!--        angle = 15, -->
<!--        length = 0.15) # BOTH ENDS -->
<!-- text(anchorN, -->
<!--      pos = 3, -->
<!--      label = "One tail only") -->



<!-- ##### -->


<!-- out <- plotNormal(mu = 0, -->
<!--            sd = 1, -->
<!--            main = expression( atop( A~one-tailed~italic(P)*"-value"~"if"~italic(z)==1~or~italic(z)==-1*":", -->
<!--                                     approx.~italic(P)*"-"*value*":"~0.32) ), -->
<!--            xlab = expression(italic(z)*"-score") -->
<!--            ) -->

<!-- shadeNormal(out$x, out$y, -->
<!--             lo = 1,  -->
<!--             hi = 5, -->
<!--             col = plot.colour) -->
<!-- polygon(x = c(-0.9, -0.9, 0.9, 0.9), # White-ish background for above text -->
<!--         y = c(0.05, 0.14, 0.14, 0.05), -->
<!--         border = NA, -->
<!--         col = "white") -->

<!-- anchorP <- c(2, 0.08) -->

<!-- arrows(x0 = 1.25,  -->
<!--        x1 = anchorP[1], -->
<!--        y0 = 0.04, -->
<!--        y1 = anchorP[2], -->
<!--        angle = 15, -->
<!--        length = 0.15) # BOTH ENDS -->
<!-- text(anchorP, -->
<!--      pos = 3, -->
<!--      label = "One tail only") -->



<!-- ##### -->


<!-- out <- plotNormal(mu = 0, -->
<!--            sd = 1, -->
<!--            main = expression( atop( The~italic(P)*"-value"~"if"~italic(z)==2~or~italic(z)==-1*":", -->
<!--                                     approx.~italic(P)*"-"*value*":"~0.05) ), -->
<!--            xlab = expression(italic(z)*"-score") -->
<!--            ) -->
<!-- shadeNormal(out$x, out$y, -->
<!--             lo = -5,  -->
<!--             hi = -2, -->
<!--             col = plot.colour) -->
<!-- shadeNormal(out$x, out$y, -->
<!--             lo = 2,  -->
<!--             hi = 5, -->
<!--             col = plot.colour) -->

<!-- polygon(x = c(-1.4, -1.4, 1.4, 1.4), # White-ish background for above text -->
<!--         y = c(0.05, 0.14, 0.14, 0.05), -->
<!--         border = NA, -->
<!--         col = "white") -->

<!-- arrows(x0 = 1.25,  -->
<!--        x1 = anchorP[1], -->
<!--        y0 = 0.04, -->
<!--        y1 = anchorP[2], -->
<!--        angle = 15, -->
<!--        length = 0.15) -->
<!-- arrows(x0 = -1.25,  -->
<!--        x1 = anchorP[1], -->
<!--        y0 = 0.04, -->
<!--        y1 = anchorP[2], -->
<!--        angle = 15, -->
<!--        length = 0.15) -->

<!-- text(anchorP, -->
<!--      pos = 3, -->
<!--      label = "Two-tailed") -->
<!-- ``` -->




$P$-values can be approximated using the $68$--$95$--$99.7$ rule and a diagram (Sect.\ \@ref(ApproxProbs); Sect.\ \@ref(OnePropTestP6895997)), or more precisely using the $z$-tables
in App.\ \@ref(ZTablesOnline)
(Sect.\ \@ref(Z-Score-Forestry); Sect\ \@ref(OnePropTestPTables)).
$P$-values are also reported by software for most statistical tests.


### Approximating $P$-values: the $68$--$95$--$99.7$ rule {#OnePropTestP6895997}
\index{68@$68$--$95$--$99.7$ rule}

The $68$--$95$--$99.7$ rule can be used to determine *approximate* $P$-values only:

* *If* the calculated $z$-score was $z = 1$, the two-tailed $P$-value would be the shaded area in Fig.\ \@ref(fig:OnePropTestP) (left panel):
  about $32$%, based on the $68$--$95$--$99.7$ rule.
  The $P$-value would be the same if $z = -1$.
  The *one-tailed* $P$-value would be the area in one-tail: 
  About $16$%, based on the $68$--$95$--$99.7$ rule.
* *If* the calculated $z$-score was $z = 2$, the two-tailed $P$-value would be the shaded area shown in Fig.\ \@ref(fig:OnePropTestP) (right panel): 
  about $5$%, based on the $68$--$95$--$99.7$ rule.
  The $P$-value would be the same if $z = -2$.
  The *one-tailed* $P$-value would be the area in one-tail:
  About $2.5$%, based on the $68$--$95$--$99.7$ rule.



<div class="figure" style="text-align: center">
<img src="31-Testing-OneProportion_files/figure-html/OnePropTestP-2.png" alt="The two-tailed P-value is the combined area in the two tails of the distribution; left panel: if $z = 1$ (or $z = -1$); right panel: if $z = 2$ (or $z = -2$). (The one-tailed $P$-values are half the two-tailed $P$-values: $P = 0.16$ and $P = 0.025$.)" width="90%" />
<p class="caption">(\#fig:OnePropTestP)The two-tailed P-value is the combined area in the two tails of the distribution; left panel: if $z = 1$ (or $z = -1$); right panel: if $z = 2$ (or $z = -2$). (The one-tailed $P$-values are half the two-tailed $P$-values: $P = 0.16$ and $P = 0.025$.)</p>
</div>


If the $z$-score is a little *larger* than $z = 1$, say $z = 1.2$, then the tail area will be a little *smaller* than the tail area when $z = 1$ (Fig.\ \@ref(fig:OnePropTestP2), left panel).
The two-tailed $P$-value is a little *smaller* than $0.32$.

Similarly, when the $t$-score is a bit *smaller* than $z = 2$, say $z = 1.9$, the tail area will be a little *larger* than the tail area when $z = 2$ (Fig.\ \@ref(fig:OnePropTestP2), right panel).
The two-tailed $P$-value is a little *larger* than $0.05$.


<div class="figure" style="text-align: center">
<img src="31-Testing-OneProportion_files/figure-html/OnePropTestP2-1.png" alt="The two-tailed P-value is the combined area in the two tails of the distribution; left panel: when $z = 1.2$ (or $z = -1.2$); right panel: when $z = 1.9$ (or $z = -1.9$)." width="90%" />
<p class="caption">(\#fig:OnePropTestP2)The two-tailed P-value is the combined area in the two tails of the distribution; left panel: when $z = 1.2$ (or $z = -1.2$); right panel: when $z = 1.9$ (or $z = -1.9$).</p>
</div>



### More precise $P$-values: using tables {#OnePropTestPTables}

Using the tables of areas under normal distributions (Appendix\ \@ref(ZTablesOnline).), more precise $P$-values can be found using the ideas from Sect.\ \@ref(ExactAreasUsingTables).
For instance (see Fig.\ \@ref(fig:OnePropTestP2)):

* For $z = 1.2$: the area to the *left* of $z = -1.2$ is $0.1151$, and the area to the *right* of $z = 1.2$ is $0.1151$, so the *two-tailed* $P$-value is $0.1151 + 0.1151 = 0.2302$.
  This is a little smaller than $0.32$, as estimated above.
* For $z = 1.9$: the area to the *left* of $z = -1.9$ is $0.0287$, and the area to the *right* of $z = 1.9$ is $0.0287$, so the *two-tailed* $P$-value is $0.0287 + 0.0287 = 0.0574$.
  This is a little larger than $0.05$, as estimated above.

In this die-rolling example, where the $z$-score is $6.53$, the tail area is *very* small (using Appendix\ \@ref(ZTablesOnline)),
and zero to four decimal places (Fig.\ \@ref(fig:RollsSixesSD)).
Since $P$-values are never exactly zero, we write $P < 0.001$ (that is, the $P$-value is *less than* $0.0001$).


## Making decisions with $P$-values {#OnePropTestDecisions}

$P$-values tells us the probability of observing the sample statistic (or one even more extreme), assuming the null hypothesis is true.
In the die-rollin example, the $P$-value is the probability of observing the value of $\hat{p} = 0.41$ (or more extreme), just through sampling variation (chance) if $p = 1/6$.
Since the $P$-value is a probability (of something quite specific), it is a value between $0$ and $1$. 
Then (see Fig.\ \@ref(fig:PvaluesAnimation)):


* 'Big' $P$-values mean that the sample statistic (i.e., $\bar{p}$) could reasonably have occurred through sampling variation in one of the many possible samples, if the assumption made about the parameter (stated in $H_0$) was true: 
   The data *do not* contradict the assumption in $H_0$.
* 'Small' $P$-values mean that the sample statistic (i.e., $\hat{p}$) is unlikely to have occurred through sampling variation in one of the many possible samples, if the assumption made about the parameter (stated in $H_0$) was true: 
   The data *do* contradict the assumption in $H_0$.

What is meant by 'small' and 'big' in this contexts? 
This is *arbitrary*: no definitive rules exist.
A $P$-value smaller than $1$% (that is, smaller than $0.01$) is usually considered 'small', and a $P$-value larger than $10$% (that is, larger than $0.10$) is usually considered 'big'.
Between the values of $1$% and $10$% is often a 'grey area'.
Commonly, however, a $P$-value less than $0.05$ is often considered 'small'.

In this die-rolling example, where the $P$-value is *very* small, the data contradict the null hypothesis (that $p = 1/6$), suggesting that the die is probably *not* fair.

::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
*Be careful interpreting the results!*
We cannot be sure that the die is unfair.
*A small $P$-value is not proof that the die is loaded.*
The die may be fair but, due to sampling variation, the sample we observed simply produced an unusually high proportion of <img src="Dice/die1.png" width="13" /> rolls.

Hence, the result is interpreted as 'there is evidence that the die is unfair'.
*The onus is on the data to refute the null hypothesis, the initial assumption*.
:::






