# Comparing quantitative data within individuals {#SummariseWithin}
\index{Quantitative data!changes \textit{within} individuals}



<!-- Introductions; easier to separate by format -->

::: {.objectivesBox .objectives data-latex="{iconmonstr-target-4-240.png}"}
So far, you have learnt to ask an RQ, design a study, collect the data, describe the data and summarise the data.
**In this chapter**, you will learn to:

* summarise within-individual changes in quantitative data using appropriate graphs.
* summarise within-individual changes using summary tables.
:::


<img src="13-CompareWithin_files/figure-html/unnamed-chunk-5-1.png" width="65%" height="33%" style="display: block; margin: auto;" />


<!-- Define colours as appropriate -->






## Introduction

Sometimes the same quantitative variable is measured on each individual more than once (i.e., *within*-individual changes for each unit of analysis) but only a small number of times.
Examples of this type of data include:

* measurements of weekly household water consumption for many households, *before* and *after* installing water-saving devices.
* blood pressure recorded for people at $8$am, $1$pm and $8$pm each day.

In both cases, the same variable is measured multiple times for each individual.
This chapter studies summarising within-individuals changes in *quantitative* variables.


## Numerical summary: mean differences {#WithinSummaryTables}
\index{Quantitative data!changes \textit{within} individuals!summary tables}\index{Summary table!mean difference}\index{Mean difference}

When each individual has *two* observations, the difference between the observations can be computed for each individual.
Then, the appropriate numerical summary is to summarise these *differences* over all individuals; for example, using the *mean* of these *differences*.

When *more than two* observations are made for each individual, the changes from the first observation (the \emph{reference level})\index{Reference level} may be computed (e.g., if the first observation is pre-intervention, or a benchmark, observation); for example, using the *mean change* (see Sect.\ \@ref(PainRelievingTape)).


:::{.example #WithinIndividualComparison name="Within-individual comparisons"}
@data:Lothian2006:Whey studied children with atopic asthma, and measured the immunogoblin\ E concentrations (IgE) before and after an intervention for each child (Table\ \@ref(tab:IgEChanges)), plus the *reduction* in IgE for each child.
The child is the *individual*.\index{Individuals}

For the IgE data, the numerical summary table is shown in Table\ \@ref(tab:IgETable).
The direction of the difference is implied by the word '*reduction*'.
:::


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
In the numerical summary table, the information for the differences is *not* found by subtracting the information in one row from the other.
In Table\ \@ref(tab:IgETable), for example, the number of differences is not $11 - 11 = 0$; the standard deviation of the differences is *not* $1615.53 - 1354.4 = 261.13\microgs$.$\Ls^{-1}$.
These statistics are computed from the differences (i.e., the **Reductions** in Table\ \@ref(tab:IgEChanges)).
:::




<table>
<caption>(\#tab:IgEChanges)The IgE before and after an intervention, and the change in IgE (in micrograms/L).</caption>
 <thead>
  <tr>
   <th style="text-align:center;"> IgE (before) in micrograms/L </th>
   <th style="text-align:center;"> IgE (after) in micrograms/L </th>
   <th style="text-align:center;"> IgE reduction in micrograms/L </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}83$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}83$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}\phantom{0}0$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $\phantom{0}292$ </td>
   <td style="text-align:center;"> $\phantom{0}292$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}\phantom{0}0$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $\phantom{0}293$ </td>
   <td style="text-align:center;"> $\phantom{0}292$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}\phantom{0}1$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $\phantom{0}623$ </td>
   <td style="text-align:center;"> $\phantom{0}542$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}81$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $\phantom{0}792$ </td>
   <td style="text-align:center;"> $\phantom{0}709$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}83$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $1543$ </td>
   <td style="text-align:center;"> $1000$ </td>
   <td style="text-align:center;"> $\phantom{0}543$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $1668$ </td>
   <td style="text-align:center;"> $1000$ </td>
   <td style="text-align:center;"> $\phantom{0}668$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $1960$ </td>
   <td style="text-align:center;"> $1626$ </td>
   <td style="text-align:center;"> $\phantom{0}334$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $2877$ </td>
   <td style="text-align:center;"> $2502$ </td>
   <td style="text-align:center;"> $\phantom{0}375$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $2961$ </td>
   <td style="text-align:center;"> $2711$ </td>
   <td style="text-align:center;"> $\phantom{0}250$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $5504$ </td>
   <td style="text-align:center;"> $4504$ </td>
   <td style="text-align:center;"> $1000$ </td>
  </tr>
</tbody>
</table>




<table>
<caption>(\#tab:IgETable)A numerical summary of the IgE data (in $\mu$g/L).</caption>
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;">   </th>
   <th style="text-align:center;font-weight: bold;"> Mean </th>
   <th style="text-align:center;font-weight: bold;"> Std dev. </th>
   <th style="text-align:center;font-weight: bold;"> Sample size </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Before </td>
   <td style="text-align:center;"> $\phantom{0}1690.5$ </td>
   <td style="text-align:center;"> $1615.53$ </td>
   <td style="text-align:center;"> $11$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> After </td>
   <td style="text-align:center;"> $\phantom{0}1387.4$ </td>
   <td style="text-align:center;"> $1354.28$ </td>
   <td style="text-align:center;"> $11$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-style: italic;"> Reduction </td>
   <td style="text-align:center;font-style: italic;"> $\phantom{0}\phantom{0}303.2$ </td>
   <td style="text-align:center;font-style: italic;"> $\phantom{0}325.28$ </td>
   <td style="text-align:center;font-style: italic;"> $11$ </td>
  </tr>
</tbody>
</table>




## Graphs for the differences
\index{Quantitative data!changes \textit{within} individuals!graphs}\index{Graphs!changes \textit{within} individuals}\index{Software output!graphs}

For within-individual changes for a *quantitative* variable, options for plotting include: 

* *histograms of differences* (Sect.\ \@ref(HistoDiffPlot)), which are useful for changes in *pairs* of measurements or observations for each individual.
* *case-profile plots* (Sect.\ \@ref(CaseProfilePlot)), which are useful when the same individuals are measured or observed a small number of times.


### Histogram of differences {#HistoDiffPlot}
\index{Graphs!histogram of  differences}

Sometimes the same variable is measured on each unit of analysis twice, when the *changes* (or *differences*) for each individual can be produced, and a histogram of the changes or differences can be constructed.
The direction of the differences should be clear (e.g., first measurement minus second, or second measurement minus first).

Issues relevant for constructing histograms (Sect.\ \@ref(Histograms)), such as bin widths and boundary values, also apply here.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
The axis displaying the counts (or percentages) should *start from zero*, since the height of the bars visually implies the frequency of those differences (see Example\ \@ref(exm:VerticalTruncation)).
:::


::: {.example #CaseProfileHistDiffPlots name="Within-individual comparisons"}
For the IgE data (Table\ \@ref(tab:IgEChanges)), the *reduction* in IgE for each child can be shown using a histogram
(Fig.\ \@ref(fig:PairedGraphCaseProfileHTML), top panel).
:::








<div class="figure" style="text-align: center">
<img src="13-CompareWithin_files/figure-html/PairedGraphCaseProfileHTML-1.png" alt="The IgE data. Top: a histogram of the differences. Bottom: a case-profile plot. Each line represents one subject, joining that person's pre-intervention score to their post-intervention score." width="480" />
<p class="caption">(\#fig:PairedGraphCaseProfileHTML)The IgE data. Top: a histogram of the differences. Bottom: a case-profile plot. Each line represents one subject, joining that person's pre-intervention score to their post-intervention score.</p>
</div>


### Case-profile plots {#CaseProfilePlot}
\index{Graphs!case-profile plot}

Sometimes the variable is measured or recorded more than twice, and so a single set of differences cannot be produced.
In these cases, the values for each individual can be plotted using a case-profile plot: the measurements are shown on one axis (usually the vertical), and the various points at which measurements are taken are shown on the other axis. 
A case-profile plot is still useful for paired data, of course.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
The axis displaying the counts (or percentages) *need not start from zero*, since the distance from the axis to the lines *do not* visually imply any quantity of interest.
Rather, the *relative changes* represented by the lines display the quantity of interest.
:::


::: {.example #CaseProfilePlots name="Case-profile plot"}
For the IgE data (Table\ \@ref(tab:IgEChanges)), the measurements of IgE for each child at both times can be shown in a case-profile plot
(Fig.\ \@ref(fig:PairedGraphCaseProfileHTML), bottom panel).
Each line corresponds to a unit of analysis (i.e., a child).
:::


:::{.example #CaseProfileRunning name="Case-profile plot"}
Runners use wearable devices to measure many performance indicators, including vertical oscillation (VO). 
VO contributes to running economy and injury risk, so reliable VO measurements are crucial.
@smith2022validity compared four devices, and obtained data from video analysis for $n = 150$ athletes; that is, each participant had the same runs measured using five methods.
The case-profile plot (Fig.\ \@ref(fig:RunningRM)) shows the means for each method using a solid point; each line represents one runner.
NOVA and Footpod give smaller VO measurements in general.
:::

<div class="figure" style="text-align: center">
<img src="13-CompareWithin_files/figure-html/RunningRM-1.png" alt="Vertical oscillation (VO) measured using five methods for $15$ runners. The solid black points represent the means for each method. Left: a line is plotted for each individual. Right: only the means are shown, with vertical lines from the minimum value to the maximum value for each method." width="100%" />
<p class="caption">(\#fig:RunningRM)Vertical oscillation (VO) measured using five methods for $15$ runners. The solid black points represent the means for each method. Left: a line is plotted for each individual. Right: only the means are shown, with vertical lines from the minimum value to the maximum value for each method.</p>
</div>

As in Example\ \@ref(exm:CaseProfileRunning), the case-profile plot is hard to read with large numbers of individuals, and so sometimes the mean (or median, as appropriate) is shown, with some measure of the variation of the observations (Fig.\ \@ref(fig:RunningRM) shows the minimum and maximum values for each method, for instance).\index{Range}





## Example: invasive plants {#CompareWithinInvasivePlants}

Skypilot (*Polemonium viscosum*) is a native alpine wildflower growing in the Colorado Rocky Mountains (USA).
In recent years, a willow shrub (*Salix*) has been encroaching on skypilot territory and, because willow often flowers early, researchers [@kettenbach2017shrub] are concerned that the willow may 'negatively affect pollination regimes of resident alpine wildflower species' (p.\ $6\,965$).
One RQ was:

> In the Colorado Rocky Mountains, what is the mean difference between first-flowering day for the native skypilot and the encroaching willow?

Data for both species was collected at\ $25$ different sites
(Fig\ \@ref(fig:FloweringDataHTML)).
The site is the *individual*; the data are *paired* (Sect.\ \@ref(PairedIntro)), a form of blocking\index{Blocking} (Sect.\ \@ref(ManagingConfounding)).
The 'first-flowering day' is the number of days since the start of the year (e.g., January\ 12 is 'day\ 12') when flowers were first observed.





<div class="figure">

```{=html}
<div class="datatables html-widget html-fill-item" id="htmlwidget-1ac79aa8b1e98cb6910f" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-1ac79aa8b1e98cb6910f">{"x":{"filter":"none","vertical":false,"caption":"<caption>The day of the year of first flowering by encroaching willow and native skypilot.<\/caption>","fillContainer":false,"data":[[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25],[201,178,189,189,196,207,199,178,178,191,187,190,190,209,221,179,174,172,196,173,180,181,186,194,197],[201,179,189,189,203,203,199,182,178,191,192,197,190,209,221,188,179,166,196,173,173,179,186,209,197]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th>Site<\/th>\n      <th>Willow<\/th>\n      <th>Skypilot<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"searching":false,"columnDefs":[{"className":"dt-right","targets":[0,1,2]},{"name":"V1","targets":0},{"name":"V2","targets":1},{"name":"V3","targets":2}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```

<p class="caption">(\#fig:FloweringDataHTML)The cyclone data.</p>
</div>


\clearpage

Since the data are available, the data should be summarised graphically (Fig.\ \@ref(fig:FloweringPlots)) and numerically (Table\ \@ref(tab:FloweringSummary)), using software output (Fig.\ \@ref(fig:Floweringjamovi)).\index{Software output!mean differences}


<div class="figure" style="text-align: center">
<img src="jamovi/Flowering/Flowering-Descriptives.png" alt="Software output for the flowering-day data." width="100%" />
<p class="caption">(\#fig:Floweringjamovi)Software output for the flowering-day data.</p>
</div>



<table>
<caption>(\#tab:FloweringSummary)The day of first flowering for encroaching willow and native skypilot.</caption>
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;">   </th>
   <th style="text-align:center;font-weight: bold;"> Mean </th>
   <th style="text-align:center;font-weight: bold;"> Std dev. </th>
   <th style="text-align:center;font-weight: bold;"> Sample size </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Willow (encroaching) </td>
   <td style="text-align:center;"> $189.40$ </td>
   <td style="text-align:center;"> $12.200$ </td>
   <td style="text-align:center;"> $25$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Skypilot (native) </td>
   <td style="text-align:center;"> $190.76$ </td>
   <td style="text-align:center;"> $13.062$ </td>
   <td style="text-align:center;"> $25$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Differences </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}1.36$ </td>
   <td style="text-align:center;"> $\phantom{0}4.698$ </td>
   <td style="text-align:center;"> $25$ </td>
  </tr>
</tbody>
</table>


<div class="figure" style="text-align: center">
<img src="13-CompareWithin_files/figure-html/FloweringPlots-1.png" alt="The flowering-day data. Left: a histogram of the difference between the first-flowering days (skypilot minus willow). Right: a case-profile plot of days of first flowering (unfilled points and dashed lines indicate earlier or same dates (smaller or equal values) for willow)." width="100%" />
<p class="caption">(\#fig:FloweringPlots)The flowering-day data. Left: a histogram of the difference between the first-flowering days (skypilot minus willow). Right: a case-profile plot of days of first flowering (unfilled points and dashed lines indicate earlier or same dates (smaller or equal values) for willow).</p>
</div>



## Example: pain-relieving tape {#PainRelievingTape}

@naugle2021effect studied the effect of using Kinesio Tape to alleviate pain in athletes.
Pain was measured by applying a slow constant rate of pressure on the left arm, and subjects pressed a button when the sensation moved from pressure to pain.
The pressure at which this occurred was recorded.
This was repeated $5\mins$ before applying the tape, $5\mins$ after applying the tape, and again $15$--$20\mins$ after applying the tape.

Figure\ \@ref(fig:TapeRepeated) shows the reported pain for\ $16$ subjects.
A summary table is shown in Table\ \@ref(tab:TapeTable).
The pain thresholds are increasing slightly as time progresses.



<div class="figure" style="text-align: center">
<img src="13-CompareWithin_files/figure-html/TapeRepeated-1.png" alt="Pain threshold (left arm) at three time points when using Kinesio Tape, without applying tension, for $n = 16$ subjects. The filled, black points represent the means for each time point." width="80%" />
<p class="caption">(\#fig:TapeRepeated)Pain threshold (left arm) at three time points when using Kinesio Tape, without applying tension, for $n = 16$ subjects. The filled, black points represent the means for each time point.</p>
</div>


<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:TapeTable)A numerical summary of the tape data: pain thresholds in kPa.</caption>
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;">   </th>
   <th style="text-align:center;font-weight: bold;"> Mean (in kPa) </th>
   <th style="text-align:center;font-weight: bold;"> Std dev. (in kPa) </th>
   <th style="text-align:center;font-weight: bold;"> Sample size </th>
   <th style="text-align:center;font-weight: bold;"> Mean increase </th>
   <th style="text-align:center;font-weight: bold;"> SD increase </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Pre: $5\mins$ </td>
   <td style="text-align:center;"> $446.5$ </td>
   <td style="text-align:center;"> $175.18$ </td>
   <td style="text-align:center;"> $16$ </td>
   <td style="text-align:center;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Post: $5\mins$ </td>
   <td style="text-align:center;"> $479.6$ </td>
   <td style="text-align:center;"> $199.61$ </td>
   <td style="text-align:center;"> $16$ </td>
   <td style="text-align:center;"> $33.1$ </td>
   <td style="text-align:center;"> $\phantom{0}73.93$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Post: $15-20\mins$ </td>
   <td style="text-align:center;"> $506.9$ </td>
   <td style="text-align:center;"> $214.36$ </td>
   <td style="text-align:center;"> $16$ </td>
   <td style="text-align:center;"> $60.4$ </td>
   <td style="text-align:center;"> $102.72$ </td>
  </tr>
</tbody>
</table>


## Chapter summary {#Chap13-Summary}

Quantitative data measured within individuals can be summarised using a histogram of differences when the variable is measured or observed twice, or a case-profile plot (with two or more measurement or observations per individual).
A summary table should show the numerical summaries for the quantitative variable at each measurement or observation and for appropriate changes. 


## Quick review questions {#Chap13-QuickReview}

::: {.webex-check .webex-box}
Are the following statements *true* or *false*?

1. A histogram of the differences is only appropriate for with two within-individuals measurements or observations. \tightlist
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
2. A case-profile plot is only appropriate for showing changes for two within-individuals measurements or observations.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
3. The median and IQR are *not* appropriate for summarising differences.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
4. Explaining *how* the differences are computed is important.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
:::




## Exercises {#SummariseWithin-Exercises}

[Answers to odd-numbered exercises] are given at the end of the book. 



:::{.exercise #CompareWithinInsulation}
[*Dataset*: `Insulation`]
The *Electricity Council* in Bristol wanted to determine if a certain type of wall-cavity insulation reduced average energy consumption in winter [@data:OpenUni:insulationBA; @data:hand:handbook]:

> In Bristol homes, what is the *mean reduction* in energy consumption after adding home insulation?

1. What are the individuals (units of analysis)?
1. Explain why this study uses a within-individuals comparison.
1. Use the collected data
(shown below)
to sketch a case-profile plot.
1. Use the data to sketch a histogram of the differences.
1. Use software or a calculator to prepare a summary table.
:::



```{=html}
<div class="datatables html-widget html-fill-item" id="htmlwidget-cf1cdafad301bee554ae" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-cf1cdafad301bee554ae">{"x":{"filter":"none","vertical":false,"caption":"<caption>The house insulation data: energy consumption before and after adding insulation, and the energy saving (all in MWh).<\/caption>","fillContainer":false,"data":[["1","2","3","4","5","6","7","8","9","10"],["A","B","C","D","E","F","G","H","I","J"],[12.1,11,14.1,13.8,15.5,12.2,12.8,9.9,10.8,12.7],[12,10.6,13.4,11.2,15.3,13.6,12.6,8.800000000000001,9.6,12.4],[0.1,0.4,0.7,2.6,0.2,-1.4,0.2,1.1,1.2,0.3]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>Home<\/th>\n      <th>Before<\/th>\n      <th>After<\/th>\n      <th>Diff<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"searching":false,"columnDefs":[{"className":"dt-right","targets":[2,3,4]},{"orderable":false,"targets":0},{"name":" ","targets":0},{"name":"Home","targets":1},{"name":"Before","targets":2},{"name":"After","targets":3},{"name":"Diff","targets":4}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```




::: {.exercise #CompareWithinExercisesCaptopril}
[*Dataset*: `Captopril`]
In a study of hypertension [@data:hand:handbook; @data:macgregor:essential], $15$ patients were given a drug (Captopril) and their systolic blood pressure measured (in mm\ Hg) immediately before and two hours after being given the drug (Table\ \@ref(tab:CICaptoprilData)).

1. Explain why this study uses a within-individuals comparison.
1. Construct a histogram of the differences.
1. Construct a case-profile plot for the data.
:::





<table>
<caption>(\#tab:CICaptoprilData)The Captopril data: before after after systolic blood pressures (in mm Hg).</caption>
 <thead>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="2"></th>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="2"></th>
</tr>
  <tr>
   <th style="text-align:left;"> Before </th>
   <th style="text-align:left;"> After </th>
   <th style="text-align:left;"> Before </th>
   <th style="text-align:left;"> After </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> $210$ </td>
   <td style="text-align:left;"> $201$ </td>
   <td style="text-align:left;"> $173$ </td>
   <td style="text-align:left;"> $147$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> $169$ </td>
   <td style="text-align:left;"> $165$ </td>
   <td style="text-align:left;"> $146$ </td>
   <td style="text-align:left;"> $136$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> $187$ </td>
   <td style="text-align:left;"> $166$ </td>
   <td style="text-align:left;"> $174$ </td>
   <td style="text-align:left;"> $151$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> $160$ </td>
   <td style="text-align:left;"> $157$ </td>
   <td style="text-align:left;"> $201$ </td>
   <td style="text-align:left;"> $168$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> $167$ </td>
   <td style="text-align:left;"> $147$ </td>
   <td style="text-align:left;"> $198$ </td>
   <td style="text-align:left;"> $179$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> $176$ </td>
   <td style="text-align:left;"> $145$ </td>
   <td style="text-align:left;"> $148$ </td>
   <td style="text-align:left;"> $129$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> $185$ </td>
   <td style="text-align:left;"> $168$ </td>
   <td style="text-align:left;"> $154$ </td>
   <td style="text-align:left;"> $131$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> $206$ </td>
   <td style="text-align:left;"> $180$ </td>
   <td style="text-align:left;">  </td>
   <td style="text-align:left;">  </td>
  </tr>
</tbody>
</table>





:::{.exercise #CompareWithinPainRelief}
[*Dataset*: `PainRelief`]
@augustino2023dataset measured the reported pain of new mothers in Dodoma (Tanzania) at four times: near giving birth, then $20$,\ $40$ and\ $60\mins$ after giving birth.
Mothers were administered either paracetamol or a cold pack as pain relief.
Pain was recorded using a 'numeric rating scale represented by the horizontal line marked from zero to ten', where higher scores mean greater pain.

Since the number of individuals is large ($n = 912$), use the summary data in Table\ \@ref(tab:PainReliefTable) to sketch a plot of the means and the range, like that in Figure\ \@ref(fig:TapeRepeated).
:::


<table>
<caption>(\#tab:PainReliefTable)A summary table of reported pain for mothers after giving birth.</caption>
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;">   </th>
   <th style="text-align:right;font-weight: bold;">  </th>
   <th style="text-align:center;font-weight: bold;"> At birth </th>
   <th style="text-align:center;font-weight: bold;"> After 20 mins </th>
   <th style="text-align:center;font-weight: bold;"> After 40 mins </th>
   <th style="text-align:center;font-weight: bold;"> After 60 mins </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Paracetamol </td>
   <td style="text-align:right;"> Mean </td>
   <td style="text-align:center;"> $\phantom{0}7.44$ </td>
   <td style="text-align:center;"> $\phantom{0}6.89$ </td>
   <td style="text-align:center;"> $4.69$ </td>
   <td style="text-align:center;"> $2.84$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> ($n = 456$) </td>
   <td style="text-align:right;"> Standard deviation </td>
   <td style="text-align:center;"> $\phantom{0}2.01$ </td>
   <td style="text-align:center;"> $\phantom{0}1.83$ </td>
   <td style="text-align:center;"> $1.49$ </td>
   <td style="text-align:center;"> $1.19$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;">  </td>
   <td style="text-align:right;"> Minimum </td>
   <td style="text-align:center;"> $\phantom{0}2.00$ </td>
   <td style="text-align:center;"> $\phantom{0}2.00$ </td>
   <td style="text-align:center;"> $2.00$ </td>
   <td style="text-align:center;"> $0.00$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;">  </td>
   <td style="text-align:right;"> Maximum </td>
   <td style="text-align:center;"> $10.00$ </td>
   <td style="text-align:center;"> $10.00$ </td>
   <td style="text-align:center;"> $9.00$ </td>
   <td style="text-align:center;"> $7.00$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Cold pack </td>
   <td style="text-align:right;"> Mean </td>
   <td style="text-align:center;"> $\phantom{0}8.63$ </td>
   <td style="text-align:center;"> $\phantom{0}5.67$ </td>
   <td style="text-align:center;"> $3.19$ </td>
   <td style="text-align:center;"> $0.99$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> ($n = 455$) </td>
   <td style="text-align:right;"> Standard deviation </td>
   <td style="text-align:center;"> $\phantom{0}1.40$ </td>
   <td style="text-align:center;"> $\phantom{0}2.03$ </td>
   <td style="text-align:center;"> $1.63$ </td>
   <td style="text-align:center;"> $0.99$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;">  </td>
   <td style="text-align:right;"> Minimum </td>
   <td style="text-align:center;"> $\phantom{0}4.00$ </td>
   <td style="text-align:center;"> $\phantom{0}0.00$ </td>
   <td style="text-align:center;"> $0.00$ </td>
   <td style="text-align:center;"> $0.00$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;">  </td>
   <td style="text-align:right;"> Maximum </td>
   <td style="text-align:center;"> $10.00$ </td>
   <td style="text-align:center;"> $\phantom{0}9.00$ </td>
   <td style="text-align:center;"> $6.00$ </td>
   <td style="text-align:center;"> $4.00$ </td>
  </tr>
</tbody>
</table>


::: {.exercise #CompareWithinStressSurgeryCI}
[*Dataset*: `Stress`]
The concentration of beta-endorphins in the blood is a sign of stress.
One study (@data:hand:handbook, Dataset\ 232; @hoaglin2011exploring) measured the beta-endorphin concentration for $19$\ patients about to undergo surgery.

Each patient had their beta-endorphin concentrations measured $12$--$14\hs$ before surgery, and also $10\mins$ before surgery.
A numerical summary (from software output) is in Table\ \@ref(tab:StressTable).\index{Software output!mean differences}


<table>
<caption>(\#tab:StressTable)The numerical summary for the presurgical stress data.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Mean </th>
   <th style="text-align:center;"> Std deviation </th>
   <th style="text-align:center;"> Sample size </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 12--14 h before surgery </td>
   <td style="text-align:center;"> $\phantom{0}8.35$ </td>
   <td style="text-align:center;"> $\phantom{0}4.397$ </td>
   <td style="text-align:center;"> $19$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 10 min before surgery </td>
   <td style="text-align:center;"> $16.05$ </td>
   <td style="text-align:center;"> $12.509$ </td>
   <td style="text-align:center;"> $19$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Increase </td>
   <td style="text-align:center;"> $\phantom{0}7.70$ </td>
   <td style="text-align:center;"> $13.519$ </td>
   <td style="text-align:center;"> $19$ </td>
  </tr>
</tbody>
</table>


1. Explain why this study uses a within-individuals comparison.
1. Explain why the standard deviation for the *increase* is not the difference between the two individuals time-point standard deviations.
1. Using the data file and software, construct a histogram of the differences.
1. Using the data file and software, construct a case-profile plot for the data.
:::




<!-- ::: {.exercise #CompareWithinCOVID} -->
<!-- @romero2020physical measured (among other things) the number of minutes of vigorous physical activity (PA) performed by Spanish health students *before* and *during* the COVID-19 lockdown (from\ March to April\ 2020 in Spain). -->
<!-- Since the *before* and *during* lockdown were both measured on *each* participant, the data are *paired* (within individuals). -->
<!-- The data are summarised in Table\ \@ref(tab:COVIDsummaryTable). -->

<!-- 1. Construct a histogram of the differences. -->
<!-- 1. Construct a case-profile plot for the data. -->
<!-- ::: -->



<!-- ```{r COVIDsummaryTable} -->
<!-- COVID.summary     <- array( dim = c(3, 2)) -->
<!-- colnames(COVID.summary) <- c("Mean (mins)",  -->
<!--                              "Std dev. (mins)") -->
<!-- rownames(COVID.summary) <- c("Before", -->
<!--                              "During", -->
<!--                              "Increase") -->


<!-- COVID.summary[1, ] <- c(28.47, -->
<!--                         54.13) -->
<!-- COVID.summary[2, ] <- c(30.66, -->
<!--                         30.04) -->
<!-- COVID.summary[3, ] <- c(2.68, -->
<!--                         51.30) -->


<!-- if( knitr::is_latex_output() ) { -->
<!--   knitr::kable( pad(COVID.summary, -->
<!--                     surroundMaths = TRUE, -->
<!--                     targetLength = c(5, 5), -->
<!--                     decDigits = 2), -->
<!--                 format = "latex", -->
<!--                 booktabs = TRUE, -->
<!--                 longtable = FALSE, -->
<!--                 escape = FALSE, -->
<!--                 caption = "Summary information for the COVID-lockdown exercise data for $n = 214$ Spanish students.", -->
<!--                 align = "c") %>% -->
<!--     row_spec(0, bold = TRUE) %>% -->
<!--     row_spec(3, italic = TRUE) %>% -->
<!--     row_spec(2,  -->
<!--              hline_after = TRUE) %>% -->
<!--     kable_styling(font_size = 8) -->
<!-- }  -->
<!-- if( knitr::is_html_output() ) { -->
<!--   knitr::kable( pad(COVID.summary, -->
<!--                     surroundMaths = TRUE, -->
<!--                     targetLength = c(5, 5), -->
<!--                     decDigits = 2), -->
<!--                 format = "html", -->
<!--                 caption = "Summary information for the COVID-lockdown exercise data for $n = 214$ Spanish students.") -->
<!-- } -->
<!-- ``` -->



:::{.exercise #CompareWithinRunning}
[*Dataset*: `Running`] 
Create a summary table for the data in Example\ \@ref(exm:CaseProfileRunning). 
:::


:::{.exercise #CompareWithinWCTennis}
[*Dataset*: `WCTennis`]
@alberca2022sprint recorded the push-time for French wheelchair tennis players, while holding and not holding a racquet (Table\ \@ref(tab:WCTennis); @alberca2022sprintDATA).

1. What do the differences mean (as given in the table)?
2. Create a plot of the data.
3. Create a numerical summary table for the data.
:::


<table>
<caption>(\#tab:WCTennis)The wheelchair-tennis data. One observation is missing.</caption>
 <thead>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; font-weight: bold; " colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Push-time (in s)</div></th>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
</tr>
  <tr>
   <th style="text-align:center;font-weight: bold;"> Person </th>
   <th style="text-align:center;font-weight: bold;"> With racquet </th>
   <th style="text-align:center;font-weight: bold;"> Without racquet </th>
   <th style="text-align:center;font-weight: bold;"> Difference (in s) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}1$ </td>
   <td style="text-align:center;"> $\phantom{0}0.2625$ </td>
   <td style="text-align:center;"> $\phantom{0}0.1833$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}0.0792$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}2$ </td>
   <td style="text-align:center;"> $\phantom{0}0.2375$ </td>
   <td style="text-align:center;"> $\phantom{0}0.2250$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}0.0125$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}3$ </td>
   <td style="text-align:center;"> $\phantom{0}0.2583$ </td>
   <td style="text-align:center;"> $\phantom{0}0.2042$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}0.0542$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}4$ </td>
   <td style="text-align:center;"> $\phantom{0}0.1917$ </td>
   <td style="text-align:center;"> $\phantom{0}0.1875$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}0.0042$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}5$ </td>
   <td style="text-align:center;"> $\phantom{0}0.1875$ </td>
   <td style="text-align:center;"> $\phantom{0}0.1708$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}0.0167$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}6$ </td>
   <td style="text-align:center;"> $\phantom{0}0.2542$ </td>
   <td style="text-align:center;"> $\phantom{0}0.1750$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}0.0792$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}7$ </td>
   <td style="text-align:center;"> $\phantom{0}0.2333$ </td>
   <td style="text-align:center;"> $\phantom{0}0.1917$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}0.0417$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}8$ </td>
   <td style="text-align:center;"> $\phantom{0}0.1917$ </td>
   <td style="text-align:center;"> $\phantom{0}0.1708$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}0.0208$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}9$ </td>
   <td style="text-align:center;"> $\phantom{0}0.2208$ </td>
   <td style="text-align:center;"> $\phantom{0}0.2208$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}0.0000$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $\phantom{0}10$ </td>
   <td style="text-align:center;"> $\phantom{0}0.2583$ </td>
   <td style="text-align:center;"> $\phantom{0}0.2750$ </td>
   <td style="text-align:center;"> $\phantom{0}{-0.0167}$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $\phantom{0}11$ </td>
   <td style="text-align:center;"> $\phantom{0}0.2083$ </td>
   <td style="text-align:center;"> $\phantom{0}0.1750$ </td>
   <td style="text-align:center;"> $\phantom{0}\phantom{0}0.0333$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $\phantom{0}12$ </td>
   <td style="text-align:center;"> --- </td>
   <td style="text-align:center;"> $\phantom{0}0.2042$ </td>
   <td style="text-align:center;"> --- </td>
  </tr>
  <tr>
   <td style="text-align:center;"> $\phantom{0}13$ </td>
   <td style="text-align:center;"> $\phantom{0}0.2208$ </td>
   <td style="text-align:center;"> $\phantom{0}0.2292$ </td>
   <td style="text-align:center;"> $\phantom{0}{-0.0083}$ </td>
  </tr>
</tbody>
</table>



:::{.exercise #CompareWithinJumping}
[*Dataset*: `Jumping`]
@hebert2023effect recorded double-legged jumping distance for\ $80$ healthy people, when they wore shoes and were barefoot
(data below).


1. What do the differences mean (as given in the table)?
2. Create a plot of the data.
3. Create a numerical summary table for the data.
:::



```{=html}
<div class="datatables html-widget html-fill-item" id="htmlwidget-220efe58c38fd45c6891" style="width:100%;height:auto;"></div>
<script type="application/json" data-for="htmlwidget-220efe58c38fd45c6891">{"x":{"filter":"none","vertical":false,"caption":"<caption>Jumping distances for athletes, with and without shoes.<\/caption>","fillContainer":false,"data":[["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80"],[42.73,41,27.37,46.8,48.87,26.4,45.47,23.73,39.87,26.43,42.7,27.73,28.37,36.43,23.33,29.43,33.87,26.23,27.73,22.47,40.57,35.7,37.17,35.73,33.53,17.5,19.37,32.5,24.17,22.87,22.47,42.6,27.2,42.63,43,43.03,37.57,39.87,22.5,28.73,33.53,12.8,28.07,35.43,19.43,27.4,37.27,8.529999999999999,30.43,36.83,51.43,36.9,34.33,35.77,41.5,45.1,23.5,17.27,42.67,21.03,21.03,29.03,36.8,24.1,28.07,37.93,39.97,36.07,26.07,32.4,31.13,20.5,25.77,26.13,43.87,24.9,32.73,56.5,33.57,27.77],[42.23,39.47,30.4,36.6,49.73,25.83,44.67,22.5,42.67,27.77,41.5,27.7,27.1,36.83,22.13,27.37,35.37,30.77,30.1,23.83,38.3,35,39.53,35.37,36.93,23.13,21.07,30.5,23.07,22.77,19.93,41.77,28.4,38.4,48.03,43.47,34.23,43.83,24,27.2,35.63,14.53,27.77,35.77,21.37,31.47,39.43,11.47,30.03,39.97,51.93,37.5,38.37,37.17,41,41.5,24.93,16.4,42.63,19.17,22.53,33.93,39.2,28.37,29.43,41.03,41.47,38.73,25.2,31.07,33.9,23.7,25.27,23.37,45.9,24.87,33.9,55.1,32.07,33.57],[0.5,1.53,-3.03,10.2,-0.87,0.57,0.8,1.23,-2.8,-1.33,1.2,0.03,1.27,-0.4,1.2,2.07,-1.5,-4.53,-2.37,-1.37,2.27,0.7,-2.37,0.37,-3.4,-5.63,-1.7,2,1.1,0.1,2.53,0.83,-1.2,4.23,-5.03,-0.43,3.33,-3.97,-1.5,1.53,-2.1,-1.73,0.3,-0.33,-1.93,-4.07,-2.17,-2.93,0.4,-3.13,-0.5,-0.6,-4.03,-1.4,0.5,3.6,-1.43,0.87,0.03,1.87,-1.5,-4.9,-2.4,-4.27,-1.37,-3.1,-1.5,-2.67,0.87,1.33,-2.77,-3.2,0.5,2.77,-2.03,0.03,-1.17,1.4,1.5,-5.8]],"container":"<table class=\"display\">\n  <thead>\n    <tr>\n      <th> <\/th>\n      <th>With shoes<\/th>\n      <th>Barefoot<\/th>\n      <th>Difference<\/th>\n    <\/tr>\n  <\/thead>\n<\/table>","options":{"searching":false,"columnDefs":[{"className":"dt-right","targets":[1,2,3]},{"orderable":false,"targets":0},{"name":" ","targets":0},{"name":"With shoes (in cm)","targets":1},{"name":"Barefoot (in cm)","targets":2},{"name":"Difference (in cm)","targets":3}],"order":[],"autoWidth":false,"orderClasses":false}},"evals":[],"jsHooks":[]}</script>
```





<!-- QUICK REVIEW ANSWERS -->
<!--
::: {.EOCanswerBox .EOCanswer data-latex="{iconmonstr-check-mark-14-240.png}"}
**Answers to *Quick review* questions:**
**1.** True.
**2.** False; a case-profile plot can be used for *two or more* within-individual comparisons.
**3.** False; use whatever numerical summaries are appropriate.
**4.** True.
:::
-->


