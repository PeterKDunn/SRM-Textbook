# Summarising qualitative data {#SummariseQualData}
\index{Qualitative data!summarising|(}


<!-- Introductions; easier to separate by format -->

::: {.objectivesBox .objectives data-latex="{iconmonstr-target-4-240.png}"}
So far, you have learnt to ask an RQ, design a study, collect the data, classify the data, and summarise quantitative data
**In this chapter**, you will learn to:

* summarise qualitative data using the appropriate graphs.
* summarise qualitative data using, for example, medians, proportions and odds.
:::


<img src="12-SummaryQual_files/figure-html/unnamed-chunk-8-1.png" width="65%" height="33%" style="display: block; margin: auto;" />


<!-- Define colours as appropriate -->






## Introduction {#SummaryQual-Intro}

Many quantitative research studies involve qualitative variables.
Except for very small amounts of data, understanding the data is difficult without a summary.
As with quantitative data, qualitative data can be understood by knowing how often values of the variables appear.
This is called the *distribution* of the data (Def.\ \@ref(def:Distribution)).\index{Distribution!qualitative data}

The distribution can be displayed using a frequency table (Sect.\ \@ref(QualitativeTables)) or a graph (Sect.\ \@ref(QualitativeGraphs)).
Qualitative data can be summarised by finding modes or, for ordinal qualitative data, using medians (Sect.\ \@ref(SummariseDataQualitative)).
The distribution of qualitative data can be summarised numerically by computing proportions, percentages (Sect.\ \@ref(QualitativeProportionsPercentages)) or odds (Sect.\ \@ref(QualOdds)).


## Frequency tables for qualitative data {#QualitativeTables}
\index{Qualitative data!frequency table}

Qualitative data are typically collated in a *frequency table*.\index{Frequency table!qualitative data}
The rows (or the columns) should list the *levels* of the variable, and these should be *exhaustive* (cover all levels) and *mutually exclusive* (observations belong to only one level).\index{Qualitative data!levels}
The number of observations or the percentage of observations (or both) are then given for each level.

For *nominal* data, the levels of the variables can be displayed in alphabetical order, in order of size, in order of personal preference, or in any other order: use the order most likely to be useful to readers.
For *ordinal* data, the natural order of the levels should almost always be used.


::: {.example #AVstudy name="Opinions of AV vehicles"}
@pyrialakou2020perceptions surveyed $400$\ residents of Phoenix (Arizona) about their opinions of autonomous vehicles (AVs).
Demographic information (Table\ \@ref(tab:AVtable1)) and respondents' opinions of sharing roads with AVs (Table\ \@ref(tab:AVtable2)) were recorded.

The gender of the respondent is *nominal* (two levels), while the age group is *ordinal* (six levels).
The levels are shown in the rows.
The three questions about safety (Table\ \@ref(tab:AVtable2)) all yield *ordinal* responses (five levels, in columns). 
:::



<table>
<caption>(\#tab:AVtable1)Demographic information for the AV data for $400$ respondents.</caption>
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;">   </th>
   <th style="text-align:center;font-weight: bold;"> Number </th>
   <th style="text-align:center;font-weight: bold;"> Percentage </th>
  </tr>
 </thead>
<tbody>
  <tr grouplength="2"><td colspan="3" style="border-bottom: 1px solid;"><strong>Gender</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Female </td>
   <td style="text-align:center;"> $204$ </td>
   <td style="text-align:center;"> $51$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Male </td>
   <td style="text-align:center;"> $196$ </td>
   <td style="text-align:center;"> $49$ </td>
  </tr>
  <tr grouplength="6"><td colspan="3" style="border-bottom: 1px solid;"><strong>Age group</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> $18$ to $24$ </td>
   <td style="text-align:center;"> $\phantom{0}52$ </td>
   <td style="text-align:center;"> $13$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> $25$ to $34$ </td>
   <td style="text-align:center;"> $\phantom{0}76$ </td>
   <td style="text-align:center;"> $19$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> $35$ to $44$ </td>
   <td style="text-align:center;"> $\phantom{0}76$ </td>
   <td style="text-align:center;"> $19$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> $45$ to $54$ </td>
   <td style="text-align:center;"> $\phantom{0}72$ </td>
   <td style="text-align:center;"> $18$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> $55$ to $64$ </td>
   <td style="text-align:center;"> $\phantom{0}56$ </td>
   <td style="text-align:center;"> $14$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> $65+$ </td>
   <td style="text-align:center;"> $\phantom{0}68$ </td>
   <td style="text-align:center;"> $17$ </td>
  </tr>
</tbody>
</table>


<table>
<caption>(\#tab:AVtable2)Responses to three scenarios for the AV data for $400$ respondents (rows sum to $n = 400$).</caption>
 <thead>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="2"></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; font-weight: bold; " colspan="2"><div style="">Somewhat</div></th>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="2"></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; font-weight: bold; " colspan="2"><div style="">Somewhat</div></th>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="2"></th>
</tr>
<tr>
<th style="empty-cells: hide;border-bottom:hidden;" colspan="1"></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; font-weight: bold; " colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Unsafe</div></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; font-weight: bold; " colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">unsafe</div></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; font-weight: bold; " colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Neutral</div></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; font-weight: bold; " colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">safe</div></th>
<th style="border-bottom:hidden;padding-bottom:0; padding-left:3px;padding-right:3px;text-align: center; font-weight: bold; " colspan="2"><div style="border-bottom: 1px solid #ddd; padding-bottom: 5px; ">Safe</div></th>
</tr>
  <tr>
   <th style="text-align:left;font-weight: bold;">   </th>
   <th style="text-align:center;font-weight: bold;"> $n$ </th>
   <th style="text-align:center;font-weight: bold;"> \% </th>
   <th style="text-align:center;font-weight: bold;"> $n$ </th>
   <th style="text-align:center;font-weight: bold;"> \% </th>
   <th style="text-align:center;font-weight: bold;"> $n$ </th>
   <th style="text-align:center;font-weight: bold;"> \% </th>
   <th style="text-align:center;font-weight: bold;"> $n$ </th>
   <th style="text-align:center;font-weight: bold;"> \% </th>
   <th style="text-align:center;font-weight: bold;"> $n$ </th>
   <th style="text-align:center;font-weight: bold;"> \% </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Driving near an AV </td>
   <td style="text-align:center;"> $58$ </td>
   <td style="text-align:center;"> $14$ </td>
   <td style="text-align:center;"> $\phantom{0}79$ </td>
   <td style="text-align:center;"> $20$ </td>
   <td style="text-align:center;"> $\phantom{0}96$ </td>
   <td style="text-align:center;"> $24$ </td>
   <td style="text-align:center;"> $97$ </td>
   <td style="text-align:center;"> $24$ </td>
   <td style="text-align:center;"> $70$ </td>
   <td style="text-align:center;"> $18$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Cycling near an AV </td>
   <td style="text-align:center;"> $77$ </td>
   <td style="text-align:center;"> $19$ </td>
   <td style="text-align:center;"> $104$ </td>
   <td style="text-align:center;"> $26$ </td>
   <td style="text-align:center;"> $\phantom{0}87$ </td>
   <td style="text-align:center;"> $22$ </td>
   <td style="text-align:center;"> $76$ </td>
   <td style="text-align:center;"> $19$ </td>
   <td style="text-align:center;"> $56$ </td>
   <td style="text-align:center;"> $14$ </td>
  </tr>
  <tr>
   <td style="text-align:left;font-weight: bold;"> Walking near an AV </td>
   <td style="text-align:center;"> $63$ </td>
   <td style="text-align:center;"> $16$ </td>
   <td style="text-align:center;"> $\phantom{0}86$ </td>
   <td style="text-align:center;"> $22$ </td>
   <td style="text-align:center;"> $103$ </td>
   <td style="text-align:center;"> $26$ </td>
   <td style="text-align:center;"> $82$ </td>
   <td style="text-align:center;"> $20$ </td>
   <td style="text-align:center;"> $66$ </td>
   <td style="text-align:center;"> $16$ </td>
  </tr>
</tbody>
</table>



## Graphs for qualitative data {#QualitativeGraphs}
\index{Qualitative data!graphs|(}\index{Graphs!qualitative data}\index{Software output!graphs}


Three options for graphing qualitative data include:

* *dot charts* (Sect.\ \@ref(DotChartsOneQual)), which are usually a good choice.
* *bar charts* (Sect,\ \@ref(BarCharts)), which are  usually a good choice.
* *pie charts* (Sect.\ \@ref(PieCharts)), which are only useful in special circumstances, and can be hard to interpret.

Sometimes these graphs are used for *discrete* quantitative data with a small number of possible options.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
The purpose of a graph is to display the information in the clearest, simplest possible way, to facilitate understanding the message(s) in the data.
:::


### Dot charts (qualitative data) {#DotChartsOneQual}
\index{Graphs!dot chart!one qualitative variable}

Dot charts indicate the counts (or corresponding percentages) in each level using dots (or some other symbol).
The levels can be on the horizontal or vertical axis, and the counts or percentages on the other.
Placing the levels on the vertical axis often makes for easier reading, and space for long labels. 


::: {.example #DotPlotsQual name="Dot plots"}
For the AV study in Example\ \@ref(exm:AVstudy), a dot chart of the age group of respondents is shown in Fig.\ \@ref(fig:AVDotBarPie) (top left panel).
:::

<div class="figure" style="text-align: center">
<img src="12-SummaryQual_files/figure-html/AVDotBarPie-1.png" alt="The age group of respondents in the AV study. All graphs present the same data." width="100%" />
<p class="caption">(\#fig:AVDotBarPie)The age group of respondents in the AV study. All graphs present the same data.</p>
</div>

For dot charts:

* place the qualitative variable on the horizontal or vertical axis (and label with the levels of the variable).
* use counts or percentages on the other axis.
* for nominal data, *think about the most helpful order* for the levels.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
The axis displaying the counts (or percentages) should *start from zero*, since the distance of the dots from the axis visually implies the frequency of those observations (see Example\ \@ref(exm:VerticalTruncation)).
:::


### Bar charts {#BarCharts}
\index{Graphs!bar chart}

Bar charts use bars to represent the number (or percentage) of observations in each level.
As with dot charts, the levels can be on the horizontal or vertical axis, but placing the level names on the vertical axis often makes for easier reading, and room for long labels. 


::: {.example #BarchartQual name="Bar plots"}
For the AV study in Example\ \@ref(exm:AVstudy), a bar chart of the age group of respondents is shown in Fig.\ \@ref(fig:AVDotBarPie) (top right panel).
:::

For bar charts:

* place the qualitative variable on the horizontal or vertical axis (and label with the levels of the variable).
* use counts or percentages on the other axis.
* for nominal data, levels can be ordered any way: *think about the most helpful order*.
* bars have gaps between bars, as the bars represent distinct categories.

In contrast to bar charts, bars in histograms are butted together (except when an interval has a zero count), as the variable-axis usually represents a continuous numerical scale.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
The axis displaying the counts (or percentages) should *start from zero*, since the height of the bars visually implies the frequency of those observations (see Example\ \@ref(exm:VerticalTruncation)).
:::


### Pie charts {#PieCharts}
\index{Graphs!pie chart}

In pie charts, a circle is divided into segments proportional to the number in each level of the qualitative variable.


::: {.example #PieChartsQual name="Pie charts"}
For the AV study in Example\ \@ref(exm:AVstudy), a pie chart of the age group of respondents is shown in Fig.\ \@ref(fig:AVDotBarPie) (bottom left panel).
:::


Using pie charts may present challenges (see Sect.\ \@ref(PieChartProblems)):

* pie charts only work when graphing parts of a whole.
* pie charts only work when *all* options are present ('exhaustive').
* pie charts are difficult to use with levels having zero or small counts (see Example\ \@ref(fig:PieSmallCounts)).
* pie charts are difficult to interpret when many categories are present.
* pie charts are hard to read, as humans compare *lengths* (bar and dot charts) better than *angles* (pie charts) [@data:Friel:Graphs].


::: {.example #PieUnsuitable name="Pie chart unsuitable"}
Consider studying the percentage of people who use Firefox, Chrome, and Safari as web browsers.
A pie chart is *not suitable* for displaying the data, as people can use more than one of these browsers (i.e., the options are not *mutually exclusive*) nor *exhaustive* (i.e., other options exist). 
:::



### Comparing dot, bar and pie charts {#CompareBarPie}
\index{Graphs!bar chart!compared to other graphs}\index{Graphs!pie chart!compared to other graphs}\index{Graphs!dot chart!compared to other graphs}

In the pie chart (Fig.\ \@ref(fig:AVDotBarPie), bottom left panel), determining *which* age groups have the fewest and most respondents is hard.
The equivalent bar chart or dot chart makes the comparison easy.
The *tilted* pie chart makes this comparison even harder (Fig.\ \@ref(fig:AVDotBarPie), bottom right panel).

Recall that the *purpose of a graph is to display the information in the clearest, simplest possible way, to facilitate understanding the message(s) in the data*.
A pie chart often makes the message hard to see [@siegrist1996use].\index{Graphs!pie chart!warnings}
\index{Qualitative data!graphs|)}

<iframe src="https://learningapps.org/watch?v=pf4om4k5t22" style="border:0px;width:100%;height:500px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>


\clearpage

## Numerical summary: proportions and percentages {#QualitativeProportionsPercentages}
\index{Proportions}\index{Percentages}

Qualitative data can be summarised numerically by using the *proportion* or *percentage* of individuals in each level.
These can be given instead of, or with, the counts (Tables\ \@ref(tab:AVtable1) and\ \@ref(tab:AVtable2)).


::: {.definition #Proportion name="Proportion"}
A *proportion* is a fraction out of a total, and is a number between\ $0$ and\ $1$.
:::


::: {.definition #Percentage name="Percentages"}
A *percentage* is a proportion, multiplied by\ $100$.
In this context, percentages are numbers between\ $0$% and\ $100$%.
:::


*Population* proportions are almost always unknown. 
Instead, the *population* proportion (the parameter), denoted\ $p$, is estimated by a *sample* proportion (a statistic), denoted by\ $\hat{p}$.\index{Estimate}


::: {.pronounceBox .pronounce data-latex="{iconmonstr-microphone-7-240.png}"}
The symbol\ $\hat{p}$ is pronounced 'pee-hat', and refers to a *sample* proportion.
The caret above the\ $p$ is called a 'hat'.
:::


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
As always, only one possible sample is studied.
*Statistics* are estimates of *parameters*, and the value of the *statistic* is not the same for every possible *sample*.
:::


::: {.example #AVProportionsPercentages name="Proportions and percentages"}
Consider the AV data in Table\ \@ref(tab:AVtable1), summarising results from a sample of $n = 400$ respondents.
The *sample proportion* of respondents aged\ $25$ to\ $34$ is $76\div 400$, or\ $0.19$.
The *sample percentage* of respondents aged\ $25$ to\ $34$ is $0.19 \times 100$, or\ $19$%, as in the table.
:::



## Numerical summary: odds {#QualOdds}
\index{Odds}

For the AV data in Table\ \@ref(tab:AVtable1), the number of females is slightly larger than the number of males.
Specifically, the *ratio* of females to males is $204\div 196 = 1.04$; that is, there are\ $1.04$ *times* as many females as males.
This value of\ $1.04$ is the *odds* that a respondent is female in the sample.
An alternative interpretation is that there are $1.04\times 100 = 104$ females for every\ $100$ males in the sample.

While proportions and percentages are computed as the number of results of interest divided by the *total number*, the *odds* are computed as the number of results of interest divided by *the remaining number* (Fig.\ \@ref(fig:PropOdds)).


::: {.definition #Odds name="Odds"}
The *odds* are the number (or proportion, or percentage) of results of interest, divided by the remaining number (or proportion, or percentage) of results:
$$
         \text{Odds} = \frac{\text{Number of results of interest}}{\text{Remaining number of results}}
$$
or (equivalently)
$$
         \text{Odds} 
          = 
            \frac{\text{Proportion of results of interest}}
                 {\text{Remaining proportion of results}}
          = 
            \frac{\text{Percentage of results of interest}}
                 {\text{Remaining percentage of results}}.
$$
The *odds* are how many *times* the result of interest *occurs* compared to the number of times the results of interest does *not occur*.
:::



<div class="figure" style="text-align: center">
<img src="12-SummaryQual_files/figure-html/PropOdds-1.png" alt="Proportions (left) are the number of interest divided by the total number. Odds (right) are the number of interest divided by the rest." width="90%" />
<p class="caption">(\#fig:PropOdds)Proportions (left) are the number of interest divided by the total number. Odds (right) are the number of interest divided by the rest.</p>
</div>


::: {.example #AVOddsMale name="Interpreting odds"}
The AV data (Table\ \@ref(tab:AVtable1)) includes\ $204$ females and $196$\ males.
The *odds* that a respondent is female is\ $1.04$.
The odds are greater than one, as there are more females than males.
Alternatively, there are\ $104$ females for every\ $100$ males.

The *odds* that a respondent is male is $196/204 = 0.96$; there are $0.96$\ *times* the number of males as females.
The odds are less than one, as there are fewer males than females.
Alternatively, there are $96$\ males for every\ $100$ females.
:::


When interpreting odds:
  
* odds *greater* than\ $1$ mean the result of interest is *more* likely to happen than not.
* odds *equal to*\ $1$ mean the result of interest is *equally likely* to happen as not.
* odds *less* than\ $1$ mean the result of interest is *less* likely to happen than not.


::: {.example #AVOdds name="Odds and percentages"}
Consider the AV data in Table\ \@ref(tab:AVtable1), summarising results from a sample of $n = 400$ respondents.

The percentage of respondents aged\ $18$ to\ $24$ is $52/400\times 400 = 13$%.
The *odds* that a respondent is aged\ $18$ to\ $24$ is $52/(400 - 52) = 0.15$.
This means the number of respondents aged\ $18$ to\ $24$ is $0.15$\ times (i.e., less then) the number of respondents aged over\ $24$.

The *odds* that a respondent is aged\ $18$ to\ $54$ is $(52 + 76 + 76 + 72)/(56 + 68) = 2.23$.
This means the number of respondents aged\ $18$ to\ $54$ is\ $2.23$ times (i.e., greater than) the number of respondents aged\ $55$ or over.
:::



The *population* odds (the parameter) are almost always unknown, and are estimated by the *sample* odds (the statistic).
No symbol is commonly used to denote odds.

Take care: proportions and odds are similar, but are different ways of numerically summarising quantitative data (Fig.\ \@ref(fig:PropOdds)).


## Describing the distribution: modes and medians {#SummariseDataQualitative}
\index{Qualitative data!distribution}

Graphs are constructed to help readers understand the data, so any important features in the graph should be described.
One simple way is to identify the level (or levels) with the *most* observations.
This is called the *mode*.\index{Mode}


::: {.definition #Mode name="Mode"}
A *mode* is the level (or levels) of a qualitative variable with the most observations.
:::


::: {.example #OrdinalModes name="Modes" }
Consider the data in Tables\ \@ref(tab:AVtable1) and\ \@ref(tab:AVtable2):

* the *mode* for gender is 'Female' (with\ $204$ respondents, or\ $51$%).
* the *mode* age groups are $25$ to\ $34$ and $35$ to\ $44$ (each with $19$\ respondents, or\ $4.8$%).
* the *modal* response to the question about *driving* near AVs is 'Somewhat safe'.
* the *modal* response to the question about *cycling* near AVs is 'Somewhat unsafe'.
* the *modal* response to the question about *walking* near AVs is 'Neutral'.
:::


*Medians*\index{Median!qualitative ordinal data} can be found for *ordinal* data (but *not* nominal data), since ordinal data have levels with a natural order.
The *median* is the level in which the middle response is located, when the levels from all individuals are placed in order.
The sample median estimates the unknown *population* median.


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Medians can be used to summarise *quantitative data* and *ordinal* data, but *never* nominal data.
:::


::: {.example #OrdinalMedians name="Medians"}
Consider the data in Tables\ \@ref(tab:AVtable1) and\ \@ref(tab:AVtable2).
'Gender' is *nominal* qualitative, so medians are not appropriate.
However, the other variables are *ordinal*, so medians could be used to describe each variable.
Since $n = 400$, the median response will be halfway between the location of the\ $200$th and\ $201$st response when ordered:

* the *median* age group is $35$ to\ $44$.
* the *median* response to the driving-near-AVs question is 'Neutral'.
* the *median* response to the cycling-near-AVs question is 'Neutral'.
* the *median* response to the walking-near-AVs question is 'Neutral'.

For each variable, ordered observations\ $200$ and\ $201$ both fall into the indicated level.
:::


Importantly, all these numerical quantities are computed from a sample (i.e., are statistics; Def.\ \@ref(def:Statistic)), even though the whole population is of interest (i.e., the parameter; Def.\ \@ref(def:Parameter)).

Means (Sect.\ \@ref(Mean)) are generally not suitable for numerically summarising qualitative data.
However, *ordinal* data *may be* numerically summarised like quantitative data in *rare and very special circumstances*.
Means may be appropriate if both of these are true:

* the levels are considered equally spaced.
* assigning a number to each level is appropriate (for example, using a mid-point for numerical age groups).

We will not consider means for ordinal data further.




## Numerical summary tables {#QualSummaryTable}
\index{Qualitative data!summary tables}

Qualitative variables should be summarised in a table.
The table should include, as a minimum, numbers and/or percentages for each level.
While useful in other contexts (see Chap.\ \@ref(CompareQualData)), odds are usually not given in the summary table.
Examples are shown in Tables\ \@ref(tab:AVtable1) and\ \@ref(tab:AVtable2), and in the next section.


## Example: water access {#WaterAccessQual}

@lopez2022farmers recorded data about access to water for three rural communities in Cameroon (see Sect.\ \@ref(WaterAccessQuant)).
Numerous qualitative variables are recorded; some are displayed in Fig.\ \@ref(fig:WaterAcessQual), and summarised in Table\ \@ref(tab:WaterAccessQual).
Notice that the levels\index{Levels} of the two ordinal variables are displayed in their natural order.

The distance to the nearest water source is usually less than\ $1\kms$, and the wait is often over\ $15\mins$.
The most common water source (i,e., the mode) is a bore ($68.6$%).
The median (and mode) distance to the water source was $100\ms$ to $1000\ms$; the median wait time was\ $5$ to\ $15\mins$ (the mode wait time was under $5\mins$).


<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:WaterAccessQual)Summarising some qualitative data in the water-access study. Left: the ordinal variables. Right: the nominal variable.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> Number </th>
   <th style="text-align:right;"> \% </th>
   <th style="text-align:right;"> Odds </th>
  </tr>
 </thead>
<tbody>
  <tr grouplength="3"><td colspan="4" style="border-bottom: 1px solid;"><strong>Distance to water source</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Under $100\ms$ </td>
   <td style="text-align:right;"> $55$ </td>
   <td style="text-align:right;"> $45.5$ </td>
   <td style="text-align:right;"> $0.83$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> $100\ms$\ to $1000\ms$ </td>
   <td style="text-align:right;"> $57$ </td>
   <td style="text-align:right;"> $47.1$ </td>
   <td style="text-align:right;"> $0.89$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Over $1000\ms$ </td>
   <td style="text-align:right;"> $\phantom{0}9$ </td>
   <td style="text-align:right;"> $\phantom{0}7.4$ </td>
   <td style="text-align:right;"> $0.08$ </td>
  </tr>
  <tr grouplength="3"><td colspan="4" style="border-bottom: 1px solid;"><strong>Wait time at water source</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Under $5\mins$ </td>
   <td style="text-align:right;"> $50$ </td>
   <td style="text-align:right;"> $41.7$ </td>
   <td style="text-align:right;"> $0.71$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> $5$ to $15\mins$ </td>
   <td style="text-align:right;"> $28$ </td>
   <td style="text-align:right;"> $23.3$ </td>
   <td style="text-align:right;"> $0.30$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Over $15\mins$ </td>
   <td style="text-align:right;"> $42$ </td>
   <td style="text-align:right;"> $35.0$ </td>
   <td style="text-align:right;"> $0.54$ </td>
  </tr>
  <tr grouplength="4"><td colspan="4" style="border-bottom: 1px solid;"><strong>Water source</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Tap </td>
   <td style="text-align:right;"> $\phantom{0}7$ </td>
   <td style="text-align:right;"> $\phantom{0}5.8$ </td>
   <td style="text-align:right;"> $0.06$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Bore </td>
   <td style="text-align:right;"> $83$ </td>
   <td style="text-align:right;"> $68.6$ </td>
   <td style="text-align:right;"> $2.18$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Well </td>
   <td style="text-align:right;"> $16$ </td>
   <td style="text-align:right;"> $13.2$ </td>
   <td style="text-align:right;"> $0.15$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> River </td>
   <td style="text-align:right;"> $15$ </td>
   <td style="text-align:right;"> $12.4$ </td>
   <td style="text-align:right;"> $0.14$ </td>
  </tr>
</tbody>
</table>

<div class="figure" style="text-align: center">
<img src="12-SummaryQual_files/figure-html/WaterAcessQual-1.png" alt="The distance to the water source (left), the wait time at the water source (centre), and the water sources (right) for the water-access study." width="100%" />
<p class="caption">(\#fig:WaterAcessQual)The distance to the water source (left), the wait time at the water source (centre), and the water sources (right) for the water-access study.</p>
</div>

\index{Qualitative data!summarising|)}


\clearpage

## Chapter summary {#SummaryQual-Summary}

Qualitative data can be graphed with a dot chart, bar chart or (in special circumstances) pie chart.
Qualitative data can be described using the mode or (for *ordinal* data only) a median.
Qualitative data can be numerically summarised using *proportions*, *percentages* or *odds*.


## Quick review questions {#SummaryQual-QuickReview}

Are the following statements *true* or *false*?

::: {.webex-check .webex-box}
1. Nominal data can be summarised using a median. \tightlist
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. Ordinal data can be summarised using a mode.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. Odds are the ratio of how often a result of interest occurs, to how often it does *not* occur.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. Proportions and percentages are the same.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
:::


## Exercises {#SummariseQualDataExercises}

[Answers to odd-numbered exercises] are given at the end of the book. 



::: {.exercise #SpiderMonkeys}
A study of spider monkeys [@data:Chapman1990:SpiderMonkeys] examined the types of social groups present
(Table\ \@ref(tab:SpiderMonkeysHTML)).

1. Construct a suitable plot, and explain what the data reveal.
2. Determine, if appropriate, the median and mode social group.
:::







<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:SpiderMonkeysHTML)Social groups in spider monkeys.</caption>
 <thead>
  <tr>
   <th style="text-align:right;font-weight: bold;"> Social group </th>
   <th style="text-align:center;font-weight: bold;"> Number </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> Solitary </td>
   <td style="text-align:center;"> $\phantom{0}8$ </td>
  </tr>
  <tr>
   <td style="text-align:right;"> All males </td>
   <td style="text-align:center;"> $\phantom{0}3$ </td>
  </tr>
  <tr>
   <td style="text-align:right;"> Female + no young </td>
   <td style="text-align:center;"> $\phantom{0}2$ </td>
  </tr>
  <tr>
   <td style="text-align:right;"> Mixed young </td>
   <td style="text-align:center;"> $15$ </td>
  </tr>
  <tr>
   <td style="text-align:right;"> Mixed + no young </td>
   <td style="text-align:center;"> $\phantom{0}1$ </td>
  </tr>
  <tr>
   <td style="text-align:right;"> One female + offspring </td>
   <td style="text-align:center;"> $23$ </td>
  </tr>
  <tr>
   <td style="text-align:right;"> Many females + offspring </td>
   <td style="text-align:center;"> $48$ </td>
  </tr>
  <tr>
   <td style="text-align:right;">  </td>
   <td style="text-align:center;">  </td>
  </tr>
</tbody>
</table>


::: {.exercise #QualSummary}
@czarniecka2021consumer studied how Poles prepared and consumed coffee using a sample of $1\,500$\ Poles.
Some data are shown in Table\ \@ref(tab:CoffeePoles).

1. Classify the variables as quantitative, nominal or ordinal.
2. Sketch appropriate graphs for the three variables.
3. Summarise the three variables.
4. Where appropriate, compute the median and mode for each variable.
:::

<table>
<caption>(\#tab:CoffeePoles)Location of coffee consumption, brewing temperature and brewing time, from $1\,500$ Poles.</caption>
<tbody>
  <tr grouplength="5"><td colspan="2" style="border-bottom: 1px solid;"><strong>Where consumed</strong></td></tr>
<tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> Home </td>
   <td style="text-align:right;"> 1432 </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> Canteen </td>
   <td style="text-align:right;"> 687 </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> Cafe </td>
   <td style="text-align:right;"> 922 </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> Others' homes </td>
   <td style="text-align:right;"> 994 </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> Work </td>
   <td style="text-align:right;"> 1196 </td>
  </tr>
  <tr grouplength="4"><td colspan="2" style="border-bottom: 1px solid;"><strong>Brewing temperature</strong></td></tr>
<tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> \text{$100^\circ$C} </td>
   <td style="text-align:right;"> 748 </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> \text{$98^\circ$C} </td>
   <td style="text-align:right;"> 269 </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> \text{$93^\circ$C} </td>
   <td style="text-align:right;"> 453 </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> Unknown </td>
   <td style="text-align:right;"> 30 </td>
  </tr>
  <tr grouplength="6"><td colspan="2" style="border-bottom: 1px solid;"><strong>Brewing time</strong></td></tr>
<tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> Under $3$ mins </td>
   <td style="text-align:right;"> 226 </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> About $3$ mins </td>
   <td style="text-align:right;"> 267 </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> About $4$ mins </td>
   <td style="text-align:right;"> 114 </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> About $5$ mins </td>
   <td style="text-align:right;"> 82 </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> About $6$ mins </td>
   <td style="text-align:right;"> 30 </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> Unknown </td>
   <td style="text-align:right;"> 781 </td>
  </tr>
</tbody>
</table>



::: {.exercise #GraphsCars}
@henderson1981building recorded the number of cylinders in many models of cars: eleven cars had four cylinders, seven cars had six cylinders, and fourteen cars had eight cylinders.
The *number* of cylinders is quantitative discrete, but with so few different values, the data could be plotted with a graph used for qualitative data.
For these data:

:::::: {.cols data-latex=""}
::: {.col data-latex="{0.45\textwidth}"}

1. Produce a dot chart.
2. Produce a histogram.

:::

::: {.col data-latex="{0.05\textwidth}"}
\ 
<!-- an empty Div (with a white space), serving as
a column separator -->
:::

::: {.col data-latex="{0.45\textwidth}"}

3. Produce a bar chart.
4. Produce a pie chart.

:::
::::::

\null\smallskip
What graph do you think is best?
Why?
:::





::: {.exercise #GraphSurveyData}
A 
[survey of voice assistants](https://www.nielsen.com/us/en/insights/news/2018/smart-speaking-my-language-despite-their-vast-capabilities-smart-speakers-all-about-the-music.print.html)
(such as Amazon Echo; Google Home; etc.) conducted by
[Nielsen](https://www.nielsen.com/au/en.html)
asked respondents to indicate how they used their voice assistant.
The options were:

:::::: {.cols data-latex=""}
::: {.col data-latex="{0.33\textwidth}"}

* listening to music;
* listen to news;
* use alarms, timer;

:::

::: {.col data-latex="{0.03\textwidth}"}
\ 
<!-- an empty Div (with a white space), serving as
a column separator -->
:::

::: {.col data-latex="{0.60\textwidth}"}

* search for real-time information (e.g., traffic; weather);
* search for factual information (e.g., trivia; history);
* chat with voice assistant for fun.

:::
::::::

Respondents could select all options that applied.
What would be the best graph for displaying respondents answers?
Would a pie chart be suitable? Explain your answer.
:::


::: {.exercise #OrdinalMedians}
@gkebski2019impact studied the taste of bread with varying salt and fibre content.
Information was recorded from $300$ subjects, including the subjects' responses to the statement 'Rolls with lower salt content taste worse than regular ones', on a five-point ordinal scale from 'Strongly Agree' to 'Strongly Disagree'; see Table\ \@ref(tab:Bread).

1. Identify the variables, then classify them as nominal or ordinal.
1. For which variables is a mode an appropriate summary (if any)?
1. For which variables is a median an appropriate summary (if any)?
1. Compute the above statistics where appropriate.
1. Compute and interpret the odds of a respondent coming from a city background.
1. Compute and interpret the odds of a respondent agreeing *or* strongly agreeing with the statement.
1. Compute and interpret the odds of a respondent being male.
:::


<table>
<caption>(\#tab:Bread)The bread-tasting data ($n = 300$).</caption>
 <thead>
  <tr>
   <th style="text-align:right;font-weight: bold;">  </th>
   <th style="text-align:center;font-weight: bold;"> Number </th>
   <th style="text-align:center;font-weight: bold;"> Percentage </th>
  </tr>
 </thead>
<tbody>
  <tr grouplength="2"><td colspan="3" style="border-bottom: 1px solid;"><strong>Gender</strong></td></tr>
<tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> Female </td>
   <td style="text-align:center;"> $150$ </td>
   <td style="text-align:center;"> $50$ </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> Male </td>
   <td style="text-align:center;"> $150$ </td>
   <td style="text-align:center;"> $50$ </td>
  </tr>
  <tr grouplength="4"><td colspan="3" style="border-bottom: 1px solid;"><strong>Place of residence</strong></td></tr>
<tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> Rural </td>
   <td style="text-align:center;"> $49$ </td>
   <td style="text-align:center;"> $16$ </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> City up to $20\, 000$ residents </td>
   <td style="text-align:center;"> $38$ </td>
   <td style="text-align:center;"> $13$ </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> City $20\, 000$ to $100\, 000$ residents </td>
   <td style="text-align:center;"> $83$ </td>
   <td style="text-align:center;"> $28$ </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> City more than $100\, 000$ residents </td>
   <td style="text-align:center;"> $130$ </td>
   <td style="text-align:center;"> $43$ </td>
  </tr>
  <tr grouplength="5"><td colspan="3" style="border-bottom: 1px solid;"><strong>Response to statement</strong></td></tr>
<tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> Strongly agree </td>
   <td style="text-align:center;"> $30$ </td>
   <td style="text-align:center;"> $10$ </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> Agree </td>
   <td style="text-align:center;"> $84$ </td>
   <td style="text-align:center;"> $28$ </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> Neutral </td>
   <td style="text-align:center;"> $78$ </td>
   <td style="text-align:center;"> $26$ </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> Disagree </td>
   <td style="text-align:center;"> $66$ </td>
   <td style="text-align:center;"> $22$ </td>
  </tr>
  <tr>
   <td style="text-align:right;padding-left: 2em;" indentlevel="1"> Strongly disagree </td>
   <td style="text-align:center;"> $42$ </td>
   <td style="text-align:center;"> $14$ </td>
  </tr>
</tbody>
</table>


::: {.exercise #ReclaimedWater}
@lopez2022farmers asked $231$\ farmers what they considered to be the advantages and disadvantages of using reclaimed water on the farm.
The responses are shown in Table\ \@ref(tab:ReclaimedWater) (not all farmers responded).

1. Produce two bar charts to display the data.
1. Produce two dot charts to display the data.
1. Produce two pie charts to display the data.
1. Determine the mode for both the advantages and disadvantages.
1. Compute the percentages for both the advantages and disadvantages.
1. Compute the odds of a farmer stating 'high price' as a disadvantage, among *all* farmers.
1. Compute the odds of a farmer stating 'high price' as a disadvantage, among farmers who listed a disadvantage.
1. What is the difference in the meaning of the last two statements? 
:::

<table class="kable_wrapper">
<caption>(\#tab:ReclaimedWater)The advantages and disadvantages of using reclaimed water, reported by $231$ farmers. (Not all farmers responded.)</caption>
<tbody>
  <tr>
   <td> 

<table>
 <thead>
  <tr>
   <th style="text-align:center;font-weight: bold;"> Advantage </th>
   <th style="text-align:center;font-weight: bold;"> No. farmers </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> Water reutilization </td>
   <td style="text-align:center;"> $15$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Availability </td>
   <td style="text-align:center;"> $27$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Sustainability </td>
   <td style="text-align:center;"> $16$ </td>
  </tr>
</tbody>
</table>

 </td>
   <td> 

<table>
 <thead>
  <tr>
   <th style="text-align:center;font-weight: bold;"> Disadvantage </th>
   <th style="text-align:center;font-weight: bold;"> No. farmers </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> High price </td>
   <td style="text-align:center;"> $40$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Growing conductivity </td>
   <td style="text-align:center;"> $12$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Lack of proper filtering </td>
   <td style="text-align:center;"> $21$ </td>
  </tr>
</tbody>
</table>

 </td>
  </tr>
</tbody>
</table>


::: {.exercise #StudentTransport}
@henning2020modelling studied $284$ university students in Joinville, Brazil, tabulating how students got to campus (Table\ \@ref(tab:TransportTable); each student could select one option only).

1. What is the mode type of active transport? 
   What about motorised transport?
1. What is the mode type of transport overall?
1. Are medians appropriate?
   If so, compute the median for active transport types, and motorised transport types.
1. Compute the proportions for each option, out of the total sample.
1. Compute the odds that a randomly-chosen student uses motorised transport to get to campus.
   Explain what this means.
1. Compute the odds that a student walks to campus.
   Explain what this means.
1. Construct appropriate plots to display the data.
:::

<table>
<caption>(\#tab:TransportTable)Modes of transport for students getting to campus.</caption>
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;">   </th>
   <th style="text-align:center;font-weight: bold;"> Number </th>
  </tr>
 </thead>
<tbody>
  <tr grouplength="2"><td colspan="2" style="border-bottom: 1px solid;"><strong>Active</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Bicycle </td>
   <td style="text-align:center;"> $\phantom{0}29$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Walking </td>
   <td style="text-align:center;"> $\phantom{0}35$ </td>
  </tr>
  <tr grouplength="3"><td colspan="2" style="border-bottom: 1px solid;"><strong>Motorised</strong></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Car </td>
   <td style="text-align:center;"> $\phantom{0}70$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Bus </td>
   <td style="text-align:center;"> $117$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Other </td>
   <td style="text-align:center;"> $\phantom{0}33$ </td>
  </tr>
</tbody>
</table>



::: {.exercise #QualSumBabyBoom}
[*Dataset*: `BabyBoom`]
Figure\ \@ref(fig:BabyBoomDataHTML)
shows the gender of $44$\ babies born in a hospital on one day [@mypapers:Dunn:dataset:1999; @data:Steele:BabyBoom].
The data are given in the order in which the births occurred.

1. What is the mode sex?
1. If appropriate, compute the median sex.
1. Compute the percentages for each sex.
1. Compute the odds that a randomly-chosen baby from the sample is female.
   Explain what this means.
1. Construct appropriate plots to display sex of the baby.
:::



::: {.exercise #FEVplots}
[*Dataset*: `LungCap`]
@data:Tager:FEV studied the lung volume of $654$\ children in East Boston in the\ 1970s (Table\ \@ref(tab:LungCapTab)).

1. Construct suitable plots for all variables.
2. For each qualitative variable, determine the mode.
3. For each qualitative variable, compute the percentage and odds of one of the levels occurring in the data.
4. Compute appropriate statistics for each quantitative variable.
:::

<table>
<caption>(\#tab:LungCapTab)The lung volume (FEV) for youth in East Boston in the 1970s; the first six observations in the dataset ($n = 654$).</caption>
 <thead>
  <tr>
   <th style="text-align:right;font-weight: bold;"> Age </th>
   <th style="text-align:center;font-weight: bold;"> FEV </th>
   <th style="text-align:right;font-weight: bold;"> Height </th>
   <th style="text-align:center;font-weight: bold;"> Gender </th>
   <th style="text-align:right;font-weight: bold;"> Smoking </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> $3$ </td>
   <td style="text-align:center;"> $1.072$ </td>
   <td style="text-align:right;"> $46$ </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:right;"> No </td>
  </tr>
  <tr>
   <td style="text-align:right;"> $4$ </td>
   <td style="text-align:center;"> $0.839$ </td>
   <td style="text-align:right;"> $48$ </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:right;"> No </td>
  </tr>
  <tr>
   <td style="text-align:right;"> $4$ </td>
   <td style="text-align:center;"> $1.102$ </td>
   <td style="text-align:right;"> $48$ </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:right;"> No </td>
  </tr>
  <tr>
   <td style="text-align:right;"> $4$ </td>
   <td style="text-align:center;"> $1.389$ </td>
   <td style="text-align:right;"> $48$ </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:right;"> No </td>
  </tr>
  <tr>
   <td style="text-align:right;"> $4$ </td>
   <td style="text-align:center;"> $1.577$ </td>
   <td style="text-align:right;"> $49$ </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:right;"> No </td>
  </tr>
  <tr>
   <td style="text-align:right;"> $4$ </td>
   <td style="text-align:center;"> $1.418$ </td>
   <td style="text-align:right;"> $49$ </td>
   <td style="text-align:center;"> F </td>
   <td style="text-align:right;"> No </td>
  </tr>
</tbody>
</table>


::: {.exercise #SummariseUniOrthoses}
@swinnen2018influence studied the influence of using ankle-foot orthoses in children with cerebral palsy.
The data in Table\ \@ref(tab:DescribeAnkleFoot) give the data for the $15$\ subjects.
(<span style="font-variant:small-caps;">Gmfcs</span> is the 
[Gross Motor Function Classification System](https://en.wikipedia.org/wiki/Gross_Motor_Function_Classification_System))
used to describe the impact of cerebral palsy on their motor function; where *lower* levels mean *better* functionality.)

1. Construct suitable plots for all variables.
2. For each qualitative variable, determine the mode.
3. For each qualitative variable, compute the percentage and odds of one of the levels occurring in the data.
4. Compute appropriate statistics for each quantitative variable.
:::






<!-- QUICK REVIEW ANSWERS -->
<!--
::: {.EOCanswerBox data-latex="{iconmonstr-check-mark-14-240.png}"}
**Answers to *Quick review* questions:**
**1.** False.
**2.** True.
**3.** True.
**4.** Percentages are proportions multiplied by\ $100$, so similar (but different).
:::
-->

