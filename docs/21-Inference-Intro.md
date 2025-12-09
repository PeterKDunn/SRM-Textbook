# (PART) Analysis {-}


# Introducing inference {#IntroducingInference}
\index{Hypothesis testing}\index{Confidence intervals}


<!-- Introductions; easier to separate by format -->

::: {.objectivesBox .objectives data-latex="{iconmonstr-target-4-240.png}"}
So far, you have learnt to ask an RQ, design a study, describe and summarise the data, and model sampling variation.
**In this chapter**, you will be introduced to the two big ideas in inference: *confidence intervals* and *hypothesis testing*.
You will learn to:

* explain the purpose of a confidence interval (CI).
* explain the purpose of hypothesis testing.

:::

<img src="21-Inference-Intro_files/figure-html/unnamed-chunk-4-1.png" width="65%" height="33%" style="display: block; margin: auto;" />



<!-- Define colours as appropriate -->





After posing an RQ (Chap.\ \@ref(RQs)), a study is designed (Chaps.\ \@ref(ResearchDesign)--\@ref(Interpretation)) to gather the evidence to answer the RQ (Chap.\ \@ref(CollectingDataProcedures)).
Then the data are classified (Chap.\ \@ref(DescribingVars)) and summarised accordingly (Chaps.\ \@ref(SummariseQualData) to\ \@ref(SummariseComments)) in preparation for answering the RQ.


This part introduces *analysis*: where the data are used to answer the RQ about the population.
Answering the RQ (which is about a *parameter*) is difficult, since we only study one of the countless possible samples, and hence observe only one of the countless possible values for the *statistic*.
The variation in the values of the statistics from sample to sample is called *sampling variation* (Chap.\ \@ref(SamplingVariation)).

Analysis provides the tools for learning about a population parameter, based on observing one of the numerous possible values of a sample statistic.
The appropriate type of analysis depends upon the number and types of variables, and the purpose of the RQ (Sect.\ \@ref(TwoPurposesOfRQs)):

* *confidence intervals* answer estimation RQs, where the interest is in how precisely a *statistic* estimates a *parameter* (Chaps.\ \@ref(CIOneProportion) to\ \@ref(OneMeanConfInterval); \@ref(AnalysisPaired) to \@ref(AnalysisOddsRatio); Sect.\ \@ref(RegressionCI)).\index{Confidence intervals}
* *hypothesis tests* answer decision-making RQs, where *decisions* are required about a *parameter* based on the value of the *statistic* (Chaps.\ \@ref(TestOneProportion) to\ \@ref(TestOneMean);  \@ref(AnalysisPaired) to \@ref(AnalysisOddsRatio); Sects.\ \@ref(CorrelationTesting) and\ \@ref(RegressionHT).)\index{Hypothesis testing}

Different scenarios require different confidence intervals and hypothesis tests; those discussed in this book are shown in Table\ \@ref(tab:OverviewTable).

(ref:CI-OneProp) Chap.\ \@ref(CIOneProportion)

(ref:HT-OneProp) Chap.\ \@ref(TestOneProportion)

(ref:CI-OneMean) Chap.\ \@ref(OneMeanConfInterval)

(ref:HT-OneMean) Chap.\ \@ref(TestOneMean)

(ref:CI-TwoMeans) Chap.\ \@ref(AnalysisTwoMeans)

(ref:HT-TwoMeans) Chap.\ \@ref(AnalysisTwoMeans)

(ref:CI-Paired) Chap.\ \@ref(AnalysisPaired)

(ref:HT-Paired) Chap.\ \@ref(AnalysisPaired)

(ref:CI-OddsR) Chap.\ \@ref(AnalysisOddsRatio)

(ref:HT-OddsR) Chap.\ \@ref(AnalysisOddsRatio)

(ref:CI-Cor) Sect.\ \@ref(CorrelationCI)

(ref:HT-Cor) Sect.\ \@ref(CorrelationTesting)

(ref:HT-Reg) Sect.\ \@ref(RegressionHT)

(ref:CI-Reg) Sect.\ \@ref(RegressionCI)

<table class="table table-striped" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:OverviewTable)Confidence interrvals and hypothesis tests for different situations.</caption>
 <thead>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; font-weight: bold; " colspan="1"><div style="">Estimation</div></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; font-weight: bold; " colspan="1"><div style="">Decision-making</div></th>
</tr>
  <tr>
   <th style="text-align:left;">  </th>
   <th style="text-align:center;"> confidence intervals) </th>
   <th style="text-align:center;"> hypothesis tests) </th>
  </tr>
 </thead>
<tbody>
  <tr grouplength="3"><td colspan="3" style="border-bottom: 1px solid;"><strong>Descriptive RQs</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Single proportions </td>
   <td style="text-align:center;"> (ref:CI-OneProp) </td>
   <td style="text-align:center;"> (ref:HT-OneProp) </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Single means </td>
   <td style="text-align:center;"> (ref:CI-OneMean) </td>
   <td style="text-align:center;"> (ref:HT-OneMean) </td>
  </tr>
  <tr grouplength="1"><td colspan="3" style="border-bottom: 1px solid;"><strong>Repeated-measures RQs</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 4em;" indentlevel="2"> Mean differences (paired data) </td>
   <td style="text-align:center;"> (ref:CI-Paired) </td>
   <td style="text-align:center;"> (ref:HT-Paired) </td>
  </tr>
  <tr grouplength="2"><td colspan="3" style="border-bottom: 1px solid;"><strong>Relational RQs</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Comparing two means </td>
   <td style="text-align:center;"> (ref:CI-TwoMeans) </td>
   <td style="text-align:center;"> (ref:HT-TwoMeans) </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Comparing two odds or proportions </td>
   <td style="text-align:center;"> (ref:CI-OddsR) </td>
   <td style="text-align:center;"> (ref:HT-OddsR) </td>
  </tr>
  <tr grouplength="2"><td colspan="3" style="border-bottom: 1px solid;"><strong>Correlational RQs</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Correlation </td>
   <td style="text-align:center;"> (ref:CI-Cor) </td>
   <td style="text-align:center;"> (ref:HT-Cor) </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Regression </td>
   <td style="text-align:center;"> (ref:CI-Reg) </td>
   <td style="text-align:center;"> (ref:HT-Reg) </td>
  </tr>
</tbody>
</table>




