# (PART) Classifying and summarising data  {-}


# Classifying data and variables {#DescribingVars}


<!-- Introductions; easier to separate by format -->

::: {.objectivesBox .objectives data-latex="{iconmonstr-target-4-240.png}"}
So far, you have learnt to ask an RQ, design a study, and collect the data.
**In this chapter**, you will learn how to classify the data, because this determines the analysis.
You will learn to:

* identify and distinguish qualitative and quantitative variables.
* identify and distinguish nominal and ordinal qualitative variables.
* identify and distinguish continuous and discrete quantitative variables.
:::


<img src="10-DescribingVariables_files/figure-html/unnamed-chunk-4-1.png" width="65%" height="33%" style="display: block; margin: auto;" />



<!-- Define colours as appropriate -->






## Introduction {#Describing-Intro}

Understanding the type of data collected is essential before summarising or analysing,\index{Data} because the *type* of data determines how to proceed.
Broadly, data may be classified as either *quantitative* data (Sect.\ \@ref(QuantData)) or *qualitative* data (Sect.\ \@ref(QualData)).
The *data* are the recorded *values* of the variables, so we also talk about quantitative and qualitative *variables*.
Quantitative variables record quantitative data; qualitative variables record qualitative data.


::: {.example #VariablesData name="Variables and data"}
'Age' is a *variable* because age varies from individual to individual (Def.\ \@ref(def:Variable)).
The *data* may include values like $13$\ months, $21$\ years and $76$\ years.
:::


::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
*Quantitative research* summarises and analyses data using numerical methods (Sect.\ \@ref(TypesOfResearch)).
*Quantitative research* can involve both *quantitative* and *qualitative* data, because both can be summarised numerically (Chaps.\ \@ref(SummariseQuantData) and\ \@ref(SummariseQualData) respectively) and analysed numerically.
:::


## Quantitative data: discrete and continuous data {#QuantData}
\index{Quantitative data|(}\index{Variables!quantitative|(}

*Quantitative* data are mathematically numerical.
Most data arising from counting or measuring are quantitative. 
Quantitative data often (but not always) have measurement units (such as\ *kg* or\ *cm*).\index{Units of measurement}
Be careful: numerical data are not necessarily quantitative; only *mathematically* numerical data are quantitative (numbers with numerical *meanings*).


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Pics/iconmonstr-calculator-9-240.png" width="50px"/>
</div>


::: {.definition #QuantitativeData name="Quantitative data"}
*Quantitative data* are *mathematically* numerical: the numbers have numerical meaning, and represent quantities or amounts.
Quantitative data generally arise from counting or measuring.
:::





::: {.example #QuantitativePostcodes name="Quantitative data"}
The weight of numbats, the thickness of sheet metal, and blood pressure are all *measured*, and are quantitative variables.

The number of power failures per year, the number of solar panels per home, and the number of tangelos per tree are all *counts*, and are quantitative variables. 

<div style="float:right; width: 202x; border: 1px; padding:10px">
<img src="Illustrations/pexels-carlos-cuadros-979959.jpg" width="160px"/>
</div>

Australian postcodes are four-digit numbers, but are *not* quantitative; the numbers are labels.
A postcode of\ 4556 isn't one 'better' or 'more' than a postcode of\ 4555.
The values do not have numerical *meanings*.
Indeed, alphabetic postcodes could have been chosen.
For example, the postcode of Caboolture (Queensland) is\ 4510, but could have been\ QCAB.
:::


Quantitative data may be further classified as *discrete* or *continuous*.\index{Quantitative data!discrete}
*Discrete* quantitative data have possible values that can be *counted*, at least in theory.
Sometimes, the possible values may have no theoretical upper limit, yet are still considered 'countable'.
*Continuous* quantitative data have values that cannot, at least in theory, be recorded exactly: another value can always be found between any two given values of the variable, if we *measure* to a greater number of decimal places.
In practice, though, values must be rounded to a reasonable number of decimal places.


::: {.definition #DiscreteData name="Discrete data"}
\index{Quantitative data!discrete}\index{Variables!discrete quantitative}
*Discrete* quantitative data has a countable number of possible values between any two given values of the variable.
:::


::: {.example #QuantDiscrete name="Discrete quantitative data"}
These quantitative variables are *discrete*:

* the *number* of people in passenger vehicles being driven on a certain road.
  Possible values: $1$,\ $2$,\ $\dots$, with an upper limit of perhaps\ $8$.
* the *number* of cracked eggs in a carton of\ $12$.
  Possible values: $0$,\ $1$, $2$, $\dots$\ $12$.
* the *number* of orthotic devices a person has used.
  Possible values: $0$,\ $1$, $2$,\ $\dots$ 
* the *number* of turbine cracks after $750\hs$ use.
  Possible values: $0$,\ $1$, $2$,\ $\dots$
:::



::: {.definition #ContinuousData name="Continuous data"}
\index{Quantitative data!continuous}\index{Variables!continuous quantitative}
*Continuous* quantitative data have (at least in theory) an infinite number of possible values between any two given values.
:::

Height is continuous: between the heights of\ $179\cms$ and\ $180\cms$, many heights exist, depending on how many decimal places are used to record height.
In practice, however, heights are usually rounded to the nearest centimetre for convenience.
All continuous data are rounded.


::: {.example #QuantContinuous name="Continuous quantitative data"}
These quantitative variables are *continuous*:

* the *weight* of $6$-year-old Fijian children.
  Values exist between any two given values of weight, by measuring to more decimal places of a kilogram.
  However, weights are usually reported to the nearest kilogram.
* the *energy consumption* of houses in London.
  Values exist between any two given values of energy consumption, by measuring to more and more decimal places of a kiloWatt-hour (kWh).
  Consumption would usually be given to the nearest\ kWh.
* the *time* spent in front of a computer each day for employees in a given industry.
  Values exist between any two given times, by measuring to more decimal places of a second.
  The values may be reported to the nearest minute, or the nearest\ $15\mins$.
:::


Sometimes, discrete quantitative data with a very large number of possible values may be treated as continuous.


:::{.example #DiscreteAsContinuous name="Treating discrete data as continuous"}
Annual income is discrete, since no income is between \$$80\,000.00$ and \$$80\,000.01$.
However, annual incomes are much larger than cents, and vary at scales much greater than cents, and so are often treated as continuous.
:::
\index{Quantitative data|)}\index{Variables!quantitative|)}


## Qualitative data: nominal and ordinal data {#QualData}
\index{Qualitative data|(}\index{Variables!qualitative|(}

*Qualitative* data has distinct labels or categories, and are not mathematically numerical.
Be careful: *numerical* data may be qualitative if those numbers don't have numerical *meanings*.
The categories of a qualitative variable are called the *levels* or the *values* of the variable.

      
<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Pics/iconmonstr-construction-35-240.png" width="50px"/>
</div>


::: {.definition #QualitativeData name="Qualitative data"}
*Qualitative data* are not *mathematically* numerical data: they comprise mutually exclusive (and usually exhaustive) categories or labels.\index{Mutually exclusive}\index{Exhaustive}
:::


::: {.definition #Levels name="Levels"}
\index{Qualitative data!levels}
The *levels* (or the *values*) of a qualitative variable refer to the names of the distinct categories. 
:::


::: {.example #QualData name="Qualitative data"}
\index{Qualitative data!levels}
'Brand of mobile phone' is a variable (as 'brand' varies from phone to phone) that is qualitative.
Many levels (i.e., brands) are possible, but could be simplified by using the levels as 'Apple', 'Samsung', 'Google' and 'Other'.
:::


      
::: {.example #QualData2 name="Qualitative data"}
Social Security Numbers (<span style="font-variant:small-caps;">ssn</span>) in the US are nine-digit numbers unique to each individual.
The first three digits represent geographic regions; the next two digits are assigned to groups in that region.
The last four digits are unique to individuals.

Although the <span style="font-variant:small-caps;">ssn</span> is a nine-digit number, <span style="font-variant:small-caps;">ssn</span> is a qualitative variable.
:::


::: {.example #DefinitionsClarity name="Clarity in variables"}
'Age' is a *continuous quantitative* variable, since age could be measured to many decimal places of a second.
Age is usually rounded down to the number of completed years, for convenience.
However, the age of young children may be given as '$3$\ days' or '$10$\ months'.

Sometimes *Age group* is used (such as Under\ $20$; $20$ to under\ $50$; $50$\ or over) instead of Age.
'Age group' is *qualitative*.
Ensure you are clear about which is used.
:::


::: {.example #DefinitionsLevels name="Levels"}
The levels of a variable depend on how the variable is defined.
For example, the variable 'How does the person commute to work' may have two levels: 'Using public transport' and 'Not using public transport'.

Alternatively, the variable could be written as 'Does the person use public transport to commute to work?'
For this variable, the levels are 'Yes' and 'No'.
:::


Qualitative data can be further classified as *nominal* or *ordinal*.


::: {.definition #Nominal name="Nominal qualitative variables"}
\index{Qualitative data!nominal}\index{Variables!nominal qualitative}
A *nominal* qualitative variable is a qualitative variable where the levels\index{Qualitative data!levels} *do not* have a natural order. 
:::


::: {.definition #Ordinal name="Ordinal qualitative variables"}
\index{Qualitative data!ordinal}\index{Variables!ordinal qualitative}
An *ordinal* qualitative variable is a qualitative variable where the levels\index{Qualitative data!levels} *do* have a natural order. 
:::

::: {.example #NominalOrdinal name="Nominal and ordinal data"} 
*Blood type* is qualitative with four levels: Type\ A; Type\ B; Type\ AB; Type\ O.\spacex
These levels have no natural order; they can be ordered alphabetically, or by prevalence.
*Blood type* is nominal.

*Age group* could be listed with levels Under\ $20$; $20$\ to under $50$; $50$\ or over.
These levels have a natural order: youngest to oldest.
*Age group* is ordinal.
:::


::: {.example #OrdinalData name="Ordinal data"}
Consider this questionnaire question:

> Please indicate the extent to which you agree or disagree with this statement:
> 'Vaping should be banned'.\smallskip  
>   
> Strongly disagree;\ \ Disagree;\ \ Neither agree nor disagree;\ \ Agree;\ \ Strongly agree.

The responses will be *ordinal* with five levels.
Giving the levels in the given order (or the reverse order) makes sense; giving the levels in alphabetical order, for example, would be very confusing.
The levels have a natural order.
:::


::: {.example #TypesVariables name="Types of variables"}
Consider a study to determine if the weight of $500\gs$ bags of pasta actually weigh\ $500\gs$ (or more) on average.
One approach is to record the weight of pasta in each bag (a *quantitative* variable), and compare the *average* weight to the target weight of $500\gs$.

Another approach is to record whether each bag of pasta was underweight using a balance scale.
This variable would be *qualitative*, with two *levels* (underweight; not underweight).
The *percentage* of underweight bags could be reported.
:::


<iframe src="https://learningapps.org/watch?v=pchrmqw2c22" style="border:0px;width:100%;height:500px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>


::: {.softwareBox .software data-latex="{iconmonstr-laptop-4-240.png}"}
Most *statistical* software requires variables to be classified as quantitative or qualitative (and perhaps discrete or continuous; ordinal or nominal).\index{Computers and software!statistical}
This enables the software to produce appropriate output and suggest appropriate analyses. 
:::
\index{Qualitative data|)}\index{Variables!qualitative|)}



\clearpage

## Example: water access {#WaterAccessVariables}

@lopez2022farmers studied three rural communities in Cameroon, and recorded information about their access to water.
The study could be used to determine contributors to the incidence of diarrhoea in young children ($85$ households had children under\ $5$ years of age).
The variables in the `WaterAccess` dataset are classified in Tables\ \@ref(tab:WaterAccessQualVariables) and\ \@ref(tab:WaterAccessQuantVariables).


<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:WaterAccessQualVariables)The qualitative variables in the water-access dataset.</caption>
 <thead>
  <tr>
   <th style="text-align:center;"> Qualitative variable </th>
   <th style="text-align:center;"> Type </th>
   <th style="text-align:center;"> Levels </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> Region </td>
   <td style="text-align:center;"> Nominal </td>
   <td style="text-align:center;"> Mbeng; Mbih; Ntsingbeu </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Education </td>
   <td style="text-align:center;"> Ordinal </td>
   <td style="text-align:center;"> Primary or less; Secondary or higher </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Distance to water source </td>
   <td style="text-align:center;"> Ordinal </td>
   <td style="text-align:center;"> Under $100\ms$; $100\ms$\ to\ $1000\ms$; over $1000\ms$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Queuing time at water source </td>
   <td style="text-align:center;"> Ordinal </td>
   <td style="text-align:center;"> Under $5\mins$; $5$ to\ $15\mins$; Over $15\mins$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Household has a garden </td>
   <td style="text-align:center;"> Nominal </td>
   <td style="text-align:center;"> Yes; No </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Household keeps livestock </td>
   <td style="text-align:center;"> Nominal </td>
   <td style="text-align:center;"> Yes; No </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Water source </td>
   <td style="text-align:center;"> Nominal </td>
   <td style="text-align:center;"> Well; Bore; Tap; River </td>
  </tr>
  <tr>
   <td style="text-align:center;"> How often water container washed </td>
   <td style="text-align:center;"> Ordinal </td>
   <td style="text-align:center;"> Before each fill; Once per week; Once per month </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Diarrhoea in children under\ $5$ </td>
   <td style="text-align:center;"> Nominal </td>
   <td style="text-align:center;"> Yes; No </td>
  </tr>
</tbody>
</table>

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>(\#tab:WaterAccessQuantVariables)The quantitative variables in the water-access dataset.</caption>
 <thead>
  <tr>
   <th style="text-align:center;"> Quantitative variable </th>
   <th style="text-align:center;"> Type </th>
   <th style="text-align:center;"> Information </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> Household coordinator's (woman's) age </td>
   <td style="text-align:center;"> Continuous </td>
   <td style="text-align:center;"> Rounded to nearest year </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Number of people in household </td>
   <td style="text-align:center;"> Discrete </td>
   <td style="text-align:center;">  </td>
  </tr>
  <tr>
   <td style="text-align:center;"> Number of children under\ $5$ in household </td>
   <td style="text-align:center;"> Discrete </td>
   <td style="text-align:center;">  </td>
  </tr>
</tbody>
</table>



## Chapter summary {#Describing-Summary}

The *type* of data collected determines the types of summaries and analyses that are needed.
Data and variables can be classified as either:

* *quantitative* (*discrete* or *continuous*) if mathematically numerical.
* *qualitative* (*nominal* or *ordinal*) if not mathematically numerical.



## Quick review questions {#Chap11-QuickReview}

::: {.webex-check .webex-box}
@benetou2020diet studied school-aged adolescents in Greece.
Among other variables, for each child they recorded the body-mass index (weight, divided by height-squared), diet quality (poor; moderate; good), the region where they lived (Attica; Thessaloniki; Other), the number of days they performed physical exercise in the last week, and school grade.

Are the following statements *true* or *false*?

1. 'Body-mass index' is a quantitative discrete variable.\tightlist
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
1. 'Diet quality' is a qualitative ordinal variable.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. 'Region of residence' is a qualitative nominal variable.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. 'Number of days the child performed physical exercise in the last week' is a quantitative discrete variable.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. 'School grade' is a quantitative continuous variable.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
:::


## Exercises {#DescribeExercises}

[Answers to odd-numbered exercises] are given at the end of the book. 




::: {.exercise #DescribeClassifying1}
Classify these variables as quantitative (discrete or continuous) or qualitative (nominal or ordinal).

1. The knee-flex angle after treatment. \tightlist
2. Whether laser drilling of small holes in concrete is successful.
3. Length of time between arrival at an emergency department, and admission.
4. Telephone numbers.
:::


::: {.exercise #DescribeClassifying1B}
Classify these variables as quantitative (discrete or continuous) or qualitative (nominal or ordinal).

1. Number of eggs laid by female brush turkeys. \tightlist
2. Whether a child eats the recommended serving of fruit each day.
3. Bar code numbers on supermarket products.
4. The breed of dog used for koala detection.
:::


::: {.exercise #DescribeClassifying2}
True or false: these variables are *qualitative* and *nominal*.

1. The age group of respondents to a survey. \tightlist
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
2. Whether a cyclist is wearing a helmet or not.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
3. The dosage of a medication applied: $40$,\ $60$ or\ $80\mgs$ per day.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
:::



::: {.exercise #DescribeClassifying2B}
True or false: these variables are *qualitative* and *ordinal*.

1. The brand of fertiliser being applied.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
2. The age of trees.
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
3. Highest level of education (never finished school; primary school; secondary school; beyond secondary school).
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
:::



::: {.exercise #DescribeClassifying3}
A study recorded whether people (who were not swimming) were wearing head-protection at the beach. 
The results were recorded as None; Cap; or\ Hat. 
Which of the following words could be used to classify this variable:
<!--
Nominal;\enskip qualitative;\enskip continuous;\enskip quantitative;\enskip ordinal.
-->

* nominal <select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
* qualitative <select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
* continuous <select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
* quantitative <select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
* ordinal <select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>

:::



::: {.exercise #DescribeClassifyingGraphsLimeTrees}
@data:ForestBiomass2017 studied lime trees (*Tilia cordata*), and recorded these variables for $385$\ trees in Russia: the foliage biomass (in\ kg); the tree diameter (in\ cm); the age of the tree (in\ years); and the origin of the tree (one of Coppice, Natural, or Planted).

Classify the variables in the study using the language of this chapter.
:::


::: {.exercise #VariablesLevelsA}
A study is comparing the proportion of females and males who wear hats between $10$am and $2$pm.
Which one of these could be the *explanatory* variable?
<!--
* The sex of the person.
* 'Female' and 'male'.
* The percentage of people who are female.
-->

* The sex of the person. <select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
* 'Female' and 'male'. <select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
* The percentage of people who are female. <select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>

:::



::: {.exercise #VariablesLevelsB}
A study is comparing the proportion of older women (aged\ $40+$) and younger women (under\ $40$) who work full-time.
Which one of these could be the explanatory variable?
<!--
* 'Full-time' and 'part-time'.
* The percentage of women who are aged under\ $40$.
* Whether a woman is aged under $40$.
* 'Yes' and 'No'.
-->

* 'Full-time' and 'part-time'. <select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
* The percentage of women who are aged under\ $40$. <select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
* Whether a woman is aged under $40$. <select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
* 'Yes' and 'no'. <select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>

:::



::: {.exercise #DescribeClassifyingVariables1}
Are these variables quantitative (discrete or continuous; what units of measurement), or qualitative (nominal or ordinal, and with what levels?)?
   
1. Systolic blood pressure.
1. Diet (vegan; vegetarian; neither vegan nor vegetarian).
1. Socioeconomic status (low income; middle income; high income).
1. Number of times a person visited the doctor last year.
:::


::: {.exercise #DescribeClassifyingVariables2}
@data:Alley2017:SocialMedia studied body-mass index and its relationship with use of social media, and recorded these variables (among others) from a group of $1\,140$ participants:

1. age (under $45$; $45$\ to $64$; $65$\ or over).
1. gender (male; female).
1. location (urban; rural).
1. social media use (none; low; high).
1. total sitting time, in minutes\ per day.

For each variable, classify the *type* of variable: quantitative (discrete or continuous; what units of measurement?), or qualitative (nominal or ordinal; what levels?).
:::


::: {.exercise #BRFSS}
The *Behavioral Risk Factor Surveillance System* (<span style="font-variant:small-caps;">brfss</span>; @data:BRFSS) survey collects data annually in all\ $50$\ US states, the District of Columbia and three US territories, from more than $400\,000$ adults each year.
The following questions, among many others, appear in the 2023\ <span style="font-variant:small-caps;">brfss</span> survey.

1. Do you own or rent your home? (Options: Own, Rent; Other.)
2. How many children less than\ $18$ years of age live in your household?
3. How many cell (mobile) phones do you have for personal use? (Options: $1$;\ $2$;\ $3$;\ $4$;\ $5$; $6$\ or more.)
4. Have you ever served on active duty in the United States Armed Forces? (Options: Yes; No.)
5. About how much do you weigh without shoes?
  
Classify the type of data collected from each question.
:::


::: {.exercise #NHANES}
The *National Health and Nutrition Examination Survey* (<span style="font-variant:small-caps;">nhanes</span>; @data:NHANES3:Data):

> ... examines a nationally representative sample of about $5\,000$ persons each year...

The following questions, among many others, appear in the 2021--2023 <span style="font-variant:small-caps;">nhanes</span> survey, and are asked about the person selected in the household (SP) to complete the questionnaire.

1. Do you consider SP now to be overweight, underweight, or about the right weight? 
2. How many rooms are in SP's home? (Count the kitchen and do not count any bathrooms, or an unfinished basement, or a laundry room.)
3. How many people who live in SP's home smoke cigarettes, cigars, little cigars, pipes, water pipes, hookah, or any other tobacco product?
4. Has SP ever been told by a doctor or other health professional that SP had asthma? (Options: Yes; No; Don't know.)
5. Overall, how would SP rate the health of SP's teeth and gums? (Options: Excellent; Very good; Good; Fair; Poor.)

Classify the type of data collected from each question.
:::



::: {.exercise #DescribeClassifyingOrthoses}
@swinnen2018influence studied the use of ankle-foot orthoses in children with cerebral palsy.
Table\ \@ref(tab:DescribeAnkleFoot) give the data for the $15$ subjects.
(<span style="font-variant:small-caps;">gmfcs</span> is the 
[Gross Motor Function Classification System](https://en.wikipedia.org/wiki/Gross_Motor_Function_Classification_System))
describing the impact of cerebral palsy on motor function; *lower* levels mean *better* functionality.)
Classify the variables in the study using the language of this chapter. 
:::

<table>
<caption>(\#tab:DescribeAnkleFoot)The orthoses dataset.</caption>
 <thead>
  <tr>
   <th style="text-align:center;"> Gender </th>
   <th style="text-align:center;"> Age (years) </th>
   <th style="text-align:center;"> Height (cm) </th>
   <th style="text-align:center;"> Weight (kg) </th>
   <th style="text-align:center;"> GMFCS </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> $\phantom{0}9$ </td>
   <td style="text-align:center;"> $136$ </td>
   <td style="text-align:center;"> $34.5$ </td>
   <td style="text-align:center;"> $1$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> $\phantom{0}7$ </td>
   <td style="text-align:center;"> $106$ </td>
   <td style="text-align:center;"> $16.2$ </td>
   <td style="text-align:center;"> $2$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> $\phantom{0}7$ </td>
   <td style="text-align:center;"> $129$ </td>
   <td style="text-align:center;"> $21.1$ </td>
   <td style="text-align:center;"> $1$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> $12$ </td>
   <td style="text-align:center;"> $152$ </td>
   <td style="text-align:center;"> $40.4$ </td>
   <td style="text-align:center;"> $1$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> $11$ </td>
   <td style="text-align:center;"> $146$ </td>
   <td style="text-align:center;"> $39.3$ </td>
   <td style="text-align:center;"> $2$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> $\phantom{0}5$ </td>
   <td style="text-align:center;"> $113$ </td>
   <td style="text-align:center;"> $18.1$ </td>
   <td style="text-align:center;"> $1$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> $\phantom{0}6$ </td>
   <td style="text-align:center;"> $112$ </td>
   <td style="text-align:center;"> $16.7$ </td>
   <td style="text-align:center;"> $2$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> $\phantom{0}8$ </td>
   <td style="text-align:center;"> $112$ </td>
   <td style="text-align:center;"> $19.1$ </td>
   <td style="text-align:center;"> $1$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> $\phantom{0}8$ </td>
   <td style="text-align:center;"> $138$ </td>
   <td style="text-align:center;"> $28.6$ </td>
   <td style="text-align:center;"> $1$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> $\phantom{0}6$ </td>
   <td style="text-align:center;"> $116$ </td>
   <td style="text-align:center;"> $19.3$ </td>
   <td style="text-align:center;"> $1$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> $\phantom{0}7$ </td>
   <td style="text-align:center;"> $113$ </td>
   <td style="text-align:center;"> $17.6$ </td>
   <td style="text-align:center;"> $1$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> $11$ </td>
   <td style="text-align:center;"> $141$ </td>
   <td style="text-align:center;"> $34.9$ </td>
   <td style="text-align:center;"> $1$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> M </td>
   <td style="text-align:center;"> $\phantom{0}7$ </td>
   <td style="text-align:center;"> $136$ </td>
   <td style="text-align:center;"> $34.5$ </td>
   <td style="text-align:center;"> $1$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> $\phantom{0}9$ </td>
   <td style="text-align:center;"> $128$ </td>
   <td style="text-align:center;"> $21.9$ </td>
   <td style="text-align:center;"> $1$ </td>
  </tr>
  <tr>
   <td style="text-align:center;"> F </td>
   <td style="text-align:center;"> $\phantom{0}8$ </td>
   <td style="text-align:center;"> $133$ </td>
   <td style="text-align:center;"> $23.0$ </td>
   <td style="text-align:center;"> $1$ </td>
  </tr>
</tbody>
</table>


::: {.exercise #DescribeClassifyingNitrogenInSoil}
@data:Lane2002:GLMsoilscience studied fertiliser use, and recorded the soil nitrogen after applying different fertiliser doses.
These variables were recorded for each field:

1. the *fertiliser dose*, in kilograms of nitrogen per hectare; 
2. the *soil nitrogen*, in kilograms of nitrogen per hectare; and
3. the *fertiliser source*; one of 'inorganic' or 'organic'.

Classify the variables in the study.
:::



::: {.exercise #DescribeClassifyingKangaroos}
@brunton2019fright recorded the response of kangaroos to overhead drones (one of 'No vigilance', 'Vigilance', 'Flee\ $<10$\ms', or 'Flee\ $>10\ms$') and the altitude of the drone ($30\ms$, $60\ms$, $100\ms$ or\ $120\ms$).
The mob size and sex of the kangaroo was also recorded.
Classify the variables in the study.
:::


::: {.exercise #DescribeSelfieDeaths}
@data:Dokur2018:SelfieDeaths studied people who died while taking selfies, and recorded the data in Table\ \@ref(tab:TableSelfieDeaths).
Which of the following are the *variables* in the table?
For each that is a variable, classify the variable.

1. The location.
1. The number of people who died at each location.
1. The percentage of people who died at each location.
:::


<table>
<caption>(\#tab:TableSelfieDeaths)Locations of people dying while taking selfies.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Number </th>
   <th style="text-align:center;"> Percentage </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Nature, associated environments </td>
   <td style="text-align:center;"> $48$ </td>
   <td style="text-align:center;"> $43.2$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Train, railway, associated structures </td>
   <td style="text-align:center;"> $22$ </td>
   <td style="text-align:center;"> $19.9$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Buildings, associated structures </td>
   <td style="text-align:center;"> $17$ </td>
   <td style="text-align:center;"> $15.3$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Road, bridge, associated structures </td>
   <td style="text-align:center;"> $12$ </td>
   <td style="text-align:center;"> $10.8$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Dams, associated structures </td>
   <td style="text-align:center;"> $\phantom{0}7$ </td>
   <td style="text-align:center;"> $\phantom{0}6.3$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Fields, farms, associated structures </td>
   <td style="text-align:center;"> $\phantom{0}4$ </td>
   <td style="text-align:center;"> $\phantom{0}3.6$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Others </td>
   <td style="text-align:center;"> $\phantom{0}1$ </td>
   <td style="text-align:center;"> $\phantom{0}0.9$ </td>
  </tr>
</tbody>
</table>






<!-- QUICK REVIEW ANSWERS -->
<!--
::: {.EOCanswerBox .EOCanswer data-latex="{iconmonstr-check-mark-14-240.png}"}
**Answers to *Quick review* questions:**
**1.** False (quantitative continuous).
**2.** True.
**3.** True.
**4.** True
**5.** False (qualitative ordinal).
:::
-->
