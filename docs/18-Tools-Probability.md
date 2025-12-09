# (PART) Tools for answering RQs {-}


# Probability {#Probability}



::: {.objectivesBox .objectives data-latex="{iconmonstr-target-4-240.png}"}
So far, you have learnt to ask an RQ, design a study, and describe and summarise the data.
**In this chapter**, you will learn about *probability* to describe the random nature of sample statistics.
You will learn to:

* explain probability.
* identify and apply various approaches to computing probability.
* determine the probability of events described using **and**, **or** and **not** in simple situations.
* identify events that are independent.
* compute simple conditional probabilities.
:::


<img src="18-Tools-Probability_files/figure-html/unnamed-chunk-4-1.png" width="65%" height="33%" style="display: block; margin: auto;" />


<!-- Define colours as appropriate -->






## Introduction {#Chap19Intro}

This chapter briefly discusses *probability*.
*Probability* quantifies the chance of observing a specific, unknown result (an 'event').
Before discussing probability, some associated terms need defining.


::: {.definition #RandomProcedure name="Random procedure"}
\index{Random procedure}
A *random procedure* is a sequence of well-defined steps that (a)\ can be repeated, in theory, indefinitely under essentially identical conditions; (b)\ has well-defined results; and (c)\ where results are unpredictable for any individual repetition.
:::

Using this definition, the result of rolling a die is a 'random procedure', with possible results 
<span class="larger-die">&#9856;</span>,
<span class="larger-die">&#9857;</span>,
<span class="larger-die">&#9858;</span>,
<span class="larger-die">&#9859;</span>,
<span class="larger-die">&#9860;</span>
and
<span class="larger-die">&#9861;</span>.
Similarly, tossing a coin is a random procedure with two possible results: **Heads**
<span class="HTcircle">H</span> or **Tails**
<span class="HTcircle">T</span>.


## Sample spaces, events and probability {#SampleSpaceEvents}

A list of all mutually exclusive\index{Mutually exclusivr} possible results from one instance of a random procedure is the *sample space*.
A *simple event* is any element of the sample space.\index{Event}


::: {.definition #SampleSpace name="Sample space"}
\index{Sample space}
The *sample space* is a list of all possible and mutually exclusive (distinct) results after administering a random procedure once. 
:::


::: {.definition #SimpleEvent name="Simple event"}
\index{Event!simple}
A *simple event* is a single element of the sample space. 
:::


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/pexels-skitterphoto-705171.jpg" width="200px"/>
</div>


::: {.example #SampleSpaceDie name="Sample spaces"}
Consider rolling a fair, six-sided die (the random procedure).
We do not know what face will be uppermost until we roll the die.

However, the *sample space* for this procedure can be listed: 
<span class="larger-die">&#9856;</span>,
<span class="larger-die">&#9857;</span>,
<span class="larger-die">&#9858;</span>,
<span class="larger-die">&#9859;</span>,
<span class="larger-die">&#9860;</span>
and\ 
<span class="larger-die">&#9861;</span>.
These are all mutually exclusive\index{Mutually exclusive} (or distinct) results and cover all possible results (exhaustive)\index{Exhaustive} from a single roll.
The sample space is *discrete* (see Sect.\ \@ref(QuantData)).\index{Quantitative data!discrete}

The event 'rolling a
<span class="larger-die">&#9856;</span>'
is a simple event.
:::


Combinations of the elements in the sample space are usually of more interest than simple events.
These are called *compound events*.


::: {.definition #CompoundEvent name="Compound event"}
\index{Event!compound}
A *compound event* is any combination of simple events.
:::


::: {.example #Events name="Events"}
Some *events* that can be defined using the sample space in Example\ \@ref(exm:SampleSpaceDie) include:

* rolling a
<span class="larger-die">&#9859;</span>.
  This *simple event* includes one element of the sample space:
<span class="larger-die">&#9859;</span>.
* rolling an odd number.
  This *compound event* includes three elements of the sample space: 
<span class="larger-die">&#9856;</span>,
<span class="larger-die">&#9858;</span> and
<span class="larger-die">&#9860;</span>.
* rolling a number larger than 
<span class="larger-die">&#9857;</span>.
  This *compound event* includes four elements of the sample space: 
<span class="larger-die">&#9858;</span>,
<span class="larger-die">&#9859;</span>,
<span class="larger-die">&#9860;</span> and
<span class="larger-die">&#9861;</span>.

The sample space is *discrete* (see Sect.\ \@ref(QuantData)).
:::


::: {.example #SampleSpaceThrowing name="Sample spaces and events"}
Consider the distance you can throw a baseball (the random procedure).
We do not know beforehand what distance your next throw will be, but the *sample space* (i.e., the throwing distance) is a number greater than $0\ms$.
This sample space is *continuous*.\index{Quantitative data!continuous}

Many *compound events* can be defined using this sample space; for example:

* throwing more than\ $50\ms$.
* throwing between\ $10$ and\ $40\ms$.

Because the sample space is continuous, throwing an *exact* distance (such as *exactly*\ $10\ms$) is technically not possible (see Sect.\ \@ref(QuantData)).
:::


Events are often defined using **and**, **or**, **not**.
Consider two events called\ $A$ and\ $B$.
Then, '$A$ **and**\ $B$' is the event comprising events only occurring in *both* events\ $A$ and\ $B$.
'$A$ **or**\ $B$' is the event comprising all events in\ $A$, all events in\ $B$, and events in both.
The event '**not**\ $A$' comprises all the events in the sample space that are *not* in Event\ $A$.


::: {.example #ComplicatedEvents name="Defining events"}
Consider rolling a fair, six-sided die again (Example\ \@ref(exm:SampleSpaceDie)).
Suppose these two (compound) events are defined:

* Event\ $A$ is 'roll a number divisible by\ $2$'.
* Event\ $B$ is 'roll a number divisible by\ $3$'.

Event\ $A$ comprises the simple events 
*roll a <span class="larger-die">&#9857;</span>*,
*roll a <span class="larger-die">&#9859;</span>* and
*roll a <span class="larger-die">&#9861;</span>*.
Event\ $B$ comprises the simple events 
*roll a <span class="larger-die">&#9858;</span>* and
*roll a <span class="larger-die">&#9861;</span>*.

Then, the Event\ '$A$ **and**\ $B$' includes all events only occurring in both\ $A$ and in\ $B$; that is, '$A$ **and**\ $B$' comprises the single simple event
*roll a <span class="larger-die">&#9861;</span>*.

Event\ '$A$ **or**\ $B$' include the events in\ $A$, the events in\ $B$, and those in both; that is, '$A$ **or**\ $B$' comprises the four simple events 
*roll a <span class="larger-die">&#9857;</span>*,
*roll a <span class="larger-die">&#9858;</span>*,
*roll a <span class="larger-die">&#9859;</span>* and\ 
*roll a <span class="larger-die">&#9861;</span>*.

The event '**not**\ $A$' comprises the three simple events 
*roll a <span class="larger-die">&#9856;</span>*,
*roll a <span class="larger-die">&#9858;</span>* and\ 
*roll a <span class="larger-die">&#9860;</span>*.
:::


Using these definitions, a *probability* can be defined.\index{Probability}


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Pics/iconmonstr-coin-5-240.png" width="50px"/>
</div>


::: {.definition #Probability name="Probability"}
A *probability* is a number between $0$ and $1$ inclusive (or between\ $0$% and\ $100$% inclusive) that quantifies the likelihood that a certain event will occur.
:::


A probability of\ $0$ (or\ $0$%) means the event is 'impossible' (will *never* occur), and a probability of\ $1$ (or\ $100$%) means that the event is *certain* to happen (will *always* occur).
Most events have a probability between the extremes of\ $0$% and\ $100$%.


::: {.example #Probabilities name="Probabilities"}
Consider these examples:

* the probability of receiving negative rainfall in London next year is\ $0$; it is impossible.
* the probability of receiving some rain in London next year is\ $1$; it is certain.
* the probability of receiving rain on 01\ January next year in London is between\ $0$ and\ $1$ inclusive.
:::



## Determining probabilities {#DetermineProbabilities}

Three different ways to think about probability are:

* the *classical approach* (Sect.\ \@ref(ProbClassical)).
* the *relative frequency approach* (Sect.\ \@ref(ProbRelFreq)).
* the *subjective approach* (Sect.\ \@ref(ProbSubjective)).
   
These approaches help determine, or approximate, values for probabilities.
   
### Classical approach {#ProbClassical}
\index{Probability!classical approach}

What is the probability of rolling a 
<span class="larger-die">&#9859;</span>
on a die?
The sample space has six possible outcomes (see Example\ \@ref(exm:SampleSpaceDie)) that are *equally likely* to occur (i.e., no reason exists to expect one event to occur more often than the others), and the event 'rolling a 
<span class="larger-die">&#9859;</span>'
comprises just *one* of those events.
Thus, <!--
$$
   \text{Probability of rolling a $\largedice{4}$}
   = \frac{\text{The number of rolls that are a $\largedice{4}$}}{\text{The number of possible events in the sample space}}
   = \frac{1}{6}.
$$
-->

$$
   \text{Probability of rolling a 4}
   = \frac{\text{The number of rolls that are a 4}}{\text{The number of possible events in the sample space}} 
   = \frac{1}{6}.
$$

This approach to computing probabilities is called the  *classical* approach to probability, and is only appropriate when all events in the sample space are *equally likely*.


::: {.definition #ClassicalApproachToProbability name="Classical approach to probability"}
In the *classical approach to probability*, the probability of an event occurring is the number of elements of the sample space included in the event, divided by the total number of elements in the sample space, *when all outcomes are equally likely*.
:::

By this definition:
$$
   \text{Prob. of an event}
    = 
    \frac{\text{Number of simple events in the event of interest}}{\text{Total number of possible equally-likely events}}.
$$


We can say that 'the probability of rolling a 
<span class="larger-die">&#9859;</span>
is $1/6$', or 'the probability of rolling a 
<span class="larger-die">&#9859;</span>
is $0.1667$'.
The answer can also be expressed as a *percentage*: 'the probability of rolling a 
<span class="larger-die">&#9859;</span>
is $16.67$%'.\index{Percentages}
The answer could also be interpreted as 'the *expected* proportion of rolls that are a 
<span class="larger-die">&#9859;</span>
is $0.1667$'.\index{Proportions}
That is, about\ $16.67$% of a very large number of future rolls are likely to be a 
<span class="larger-die">&#9859;</span>.

The probability of rolling a 
<span class="larger-die">&#9859;</span>
is $0.1667$, but any single roll of the die either *will* or *will not* produce a 
<span class="larger-die">&#9859;</span>, and we don't know which will occur.



::: {.example #SimpleProb name="Probabilities for compound events"}
Consider rolling a standard six-sided die.
With six equally-likely results (Example\ \@ref(exm:SampleSpaceDie)), the probability of rolling an even number is\ $3/6$, since there are three even numbers in the sample space.
:::


::: {.example #ProbabilityOutcomes name="Describing probability"}
Consider rolling a standard six-sided die.

* The *probability* of rolling an even number is $3 \div 6 = 0.5$.
* The *percentage* of rolls  expected to be even is $3 \div 6 \times 100 = 50$%.
* The *odds* of rolling an even number is $3\div 3 = 1$.
:::

::: {.example #EventsAndProb name="Probabilities"}
Consider the probabilities of the events in Example\ \@ref(exm:Events).

* The probability of rolling a 
<span class="larger-die">&#9859;</span> is\ $1/6$ (or about\ $0.1667$).
* The probability of rolling an odd number is\ $3/6$, or\ $1/2$ (or\ $0.5$).
* The probability of rolling a number larger than 
<span class="larger-die">&#9857;</span>
is\ $4/6$, or\ $2/3$ (or about\ $0.6667$).
:::


### Relative frequency approach {#ProbRelFreq}
\index{Probability!relative frequency approach}


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/father-22194_640.jpg" width="200px"/>
</div>


What is the probability that a newborn baby will be male?
The sample space could be listed as: *male* and *non-male*.
Since the sample space has two elements, the classical approach suggests the probability is $1\div2 =  0.5$.
However, this approach is appropriate *only if* males and non-males are *equally likely* to be born.
But are they?

In 2021 in
[Australia](https://www.aihw.gov.au/reports/mothers-babies/australias-mothers-babies/data),
$289\,603$ live births occurred, with $148\,636$ male births, $140\,944$ female births, and $23$\ others (or 'not stated').
The *proportion* of males born in the 2021 sample is $148\,636\div 289\,603 = 0.513$, or about\ $51.3$%.
An *estimate* of the probability that the next birth will be male is about\ $0.513$ (or\ $51.3$%), based on using past data.

This is the *relative frequency* approach to calculating probabilities: based on past data.
The relative frequency method can only ever produce an *approximate* probability, as it is based on a limited number of past observations.
An actual probability would require an infinite number of observations. 


::: {.definition #RelativeFrequencyApproachToProbability name="Relative frequency approach to probability"}
In the *relative frequency approach to probability*, the probability of an event is *approximately* the number of times the outcomes of interest has appeared in the past, divided by the number of 'attempts' in the past.
This produces an *approximate* probability.
:::


::: {.example #RFProbability name="Relative frequency probability"}
Based on the earlier information, the *odds* that a new baby will be a boy is *approximately* $0.513\div (1 - 0.513) = 1.053$\index{Odds} (i.e., $105.3$ boys per $100$ girls).
According to the 
[*Australian Bureau of Statistics* (ABS)](http:www.abs.gov.au/ausstats/abs@.nsf/0/B8865D71D84F5210CA2579330016754C?opendocument):

> The sex ratio for all births registered in Australia generally fluctuates around\ $105.5$ male births per\ $100$ female births.

This is close to the odds of\ $1.053$ found above.
:::
         



::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
*Probabilities* describe the likelihood that an event will occur *before* the result is known.
*Odds* and *proportions* can be used either *before* or *after* the result is known, provided the wording is correct.

For example, *proportions* describe how often an event has occurred *after* the result is known, and *expected proportions* describe the likelihood that an event will occur in many repetitions *before* the result is known.
:::


The following example may help explain.

::: {.example #ProbProportioOdds name="Probabilities, proportions and odds"}
*Before* a fair coin is tossed:\index{Probability}\index{Proportions}\index{Odds}
  
* the *probability* of throwing a 
<span class="HTcircle">H</span> is $1/2 = 0.5$ (or\ $50$%).
* the *expected proportion* of 
<span class="HTcircle">H</span> for many coin tosses is\ $0.5$ (or $50$%).
* the *odds* of throwing a
<span class="HTcircle">H</span> is $1/1 = 1$.

If we have *already* tossed a coin $100$ times and found $47$\ heads:
  
* the *proportion* of 
<span class="HTcircle">H</span> in the sample is $47/100 = 0.47$ (or\ $47$%).
* the odds that we *threw* a 
<span class="HTcircle">H</span> in the sample is $47/53 = 0.887$.

The 'probability that we just threw a
<span class="HTcircle">H</span>' makes no sense, because the result is known.
:::



### Subjective approach {#ProbSubjective}
\index{Probability!subjective approach}

Many probabilities cannot be computed using the classical or relative frequency approach; for example, what is the probability that your sporting team wins their next game?
It may depend on how important you deem the injuries to key players, whether you think recent form is crucial, or if you believe in a substantial home ground advantage.
In this case, only a *subjective probability* can be given.

'Subjective' probabilities may be based on personal judgement or experience.
They can also be given by considering some of the relevant issues that may impact the probability (and may, for example, be based on mathematical models that incorporate information from numerous inputs).
Depending on how these other issues are considered and combined, different subjective probabilities may be given.

<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Illustrations/cyclone-62957_640.jpg" width="200px"/>
</div>

Weather forecasts are one example: they incorporate data from sea surface temperatures, local topography, air pressures, air temperatures and so on.
Different models use different inputs, and may combine these inputs differently to produce different (subjective) forecast probabilities.
Subjective probabilities are deductive probabilities (based on reasoning).

::: {.definition #SubjectiveApproachToProbability name="Subjective approach to probability"}
In the *subjective approach to probability*, various factors are incorporated subjectively to determine the probability of an event occurring.
:::


::: {.example #SubjectiveProbElNino name="Subjective probability"}
During El Niño events, eastern Australia typically experiences drier-than-average winters and springs.
The 
[*Australian Broadcasting Corporation*'s news website](https://www.abc.net.au/news/2023-05-23/noaa-bom-el-nino-chances-explored/102341466)
reported (on 23\ May 2023) that the Australian *Bureau of Meteorology* predicted a $50$%\ probability of an El Niño event in\ 2023, while the American *National Oceanic and Atmospheric Administration* predicted a $90$%\ chance of an El Niño event in\ 2023.

Despite this, '[both] agencies are looking at the same part of the Pacific Ocean' to make their predictions.
However, 'the US and Australia base their probability on different criteria'.
The probabilities are subjective probabilities, based on complex mathematical models.
:::


## Independence of events {#Independence}
\index{Independence}

One important concept in probability is *independence*.
Two events are *independent* if the probability of one event happening is the same, whether or not the other event has happened.
For example, the probability of getting a
<span class="HTcircle">H</span> on a coin toss is the same whether you are sitting or not sitting: the result of the coin toss is *independent* of whether you are seated.


<div style="float:right; width: 222x; border: 1px; padding:10px">
<img src="Pics/iconmonstr-arrow-44-240.png" width="50px"/>
</div>


::: {.definition #Independence name="Independence"}
Two events are *independent* if the probability of one event is the same, whether or not the other event has happened.
:::


::: {.example #IndependenceCards name="Independence"}
Consider drawing two cards from a well-shuffled, standard pack (of $52$\ cards), *without* returning the first card.
For the *first* card, the sample space contains every card in the pack, and drawing any card is as equally likely as drawing any other.
Since four cards are **Aces**, the probability of drawing an **Ace** on the first draw is $4/52$ (using the classical approach).

If we drew an **Ace** for the first card, the probability of drawing an **Ace** for the *second* card is $3/51$ (*three* **Aces** remain among the $51$ remaining cards).
Alternatively, if we *don't* draw an **Ace** for the first card, the probability of drawing an **Ace** second time is $4/51$ (*four* **Aces** remain among the $51$\ remaining cards).

That is, the probability of drawing an **Ace** for the second card *depends* on whether an **Ace** was drawn for the first card.
The two events 'Drawing an **Ace** for the first card' and 'Drawing an **Ace** for the second card' are *not independent* events.
:::



::: {.tipBox .tip data-latex="{iconmonstr-info-6-240.png}"}
A 'standard' pack of cards has $52$\ cards, organised into four *suits*: spades $\spadesuit$, clubs $\clubsuit$ (both black), 
hearts $\heartsuit$ and diamonds $\diamondsuit$ (both red).\index{Cards: standard pack}
Each *suit* has $13$\ *denominations*: $2$, $3$, $4$, $5$, $6$, $7$, $8$, $9$, $10$, Jack\ (J), Queen\ (Q), King\ (K), Ace\ (A).
The Ace, King, Queen and Jack cards are called *picture cards*.
(Most packs also contain two jokers, which are not considered part of a *standard* pack.)
:::


:::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
Random samples produce *independent* units of analysis.\index{Sampling!random}\index{Units of analysis}
:::


<iframe src="https://learningapps.org/watch?v=pbd3ekn3k22" style="border:0px;width:100%;height:850px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>


## Conditional probability {#ConditionalProbability}
\index{Probability!conditional}

*Conditional probability* refers to adjusting probabilities when extra information is known.
For example, the probability of rolling a 
<span class="larger-die">&#9856;</span>
is $1/6$ using the classical approach, as the sample space has six equally-likely elements.
However, if we are told that an *odd number* is rolled, only three elements in the sample space need now be considered (rolls of
<span class="larger-die">&#9856;</span>,
<span class="larger-die">&#9858;</span>,
<span class="larger-die">&#9860;</span>)
rather than all six elements; other outcomes are impossible).
So, the probability of rolling a 
<span class="larger-die">&#9856;</span>
is $1/3$.
We say 'the probability of rolling a 
<span class="larger-die">&#9856;</span>,
*given that the roll is an odd number*, is\ $1/3$'.



:::{.example #ConditionalCards name="Conditional probability"}
Suppose someone draws a card from a pack of cards.
The probability that the card is a\ $\clubsuit$ is $13/52 = 1/4$, or\ $25$%.

However, if you are told that the card is a *black* card, then the card must be either a\ $\clubsuit$ or\ $\spadesuit$.
The probability that the card is a\ $\clubsuit$, *given* that the card is black, is $13/26 = 1/2$, or\ $50$%.
:::


:::{.example #Sunglasses name="Wearing sunglasses"}
@data:Dexter2019:SunProtection recorded the number of people at the foot of the Goodwill Bridge,  Brisbane, who wore sunglasses between $11$:$30$am to $12$:$30$pm (Table\ \@ref(tab:SunglassesTableProb)).
The probability of an observed person wearing sunglasses is
$$
  \frac{126 + 123}{126 + 123 + 240 + 263} = 0.3311,
$$
or about $33.1$%.

Conditional probabilities can also be computed:

* *if the observed person is female*, the probability that she is wearing sunglasses is $126\div (240 + 126) = 0.3443$, or about\ $34.4$%.
* *if the observed person is male*, the probability that he is wearing sunglasses is $123\div (263 + 123) = 0.3187$, or about\ $31.9$%.

These probabilities are close, but not exactly equal.

If the two events were *independent*, then these two conditional probabilities would be the same: the probability of wearing sunglasses would be the same for females and males.
In other words, the probability of wearing sunglasses did not depend on whether a female or a male was observed.
We might say that wearing sunglasses is close to, but not exactly, independent of the sex of the person, in the *sample*.
We cannot be sure if wearing sunglasses is independent of the sex of the person in the *population*.
:::


<table>
<caption>(\#tab:SunglassesTableProb)Females and males wearing sunglasses on the Goodwill Bridge, Brisbane.</caption>
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;">   </th>
   <th style="text-align:center;font-weight: bold;"> Female </th>
   <th style="text-align:center;font-weight: bold;"> Male </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Not wearing sunglasses </td>
   <td style="text-align:center;"> $240$ </td>
   <td style="text-align:center;"> $263$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Wearing sunglasses </td>
   <td style="text-align:center;"> $126$ </td>
   <td style="text-align:center;"> $123$ </td>
  </tr>
</tbody>
</table>






## Chapter summary {#ToolsProbabilitySummary}

A *probability* is a number between $0$ and $1$ inclusive (or between\ $0$% and\ $100$% inclusive) that quantifies the likelihood of a certain event occurring.
Three ways to think about probabilities are:

* the *classical approach*, which requires all outcomes to be *equally likely*.
* the *relative frequency* approach (which gives approximate probabilities).
* the *subjective approach* (deductive probabilities).

Two events are *independent* if the probability of one event is the same, whether the other event has happened or not.
Conditional probability incorporates extra information when the probability is computed.


## Quick review questions {#ToolsProbabilityQuickReview}

::: {.webex-check .webex-box}
Suppose *Event\ $A$* is defined as 'Rolling a 
<span class="larger-die">&#9856;</span>
or a 
<span class="larger-die">&#9857;</span>
on a fair die'.
Also, suppose *Event\ $B$* is defined as 'Rolling an even number'.

Are the following statements *true* or *false*?


1. The best *approach* to computing the probability of Event\ $A$ occurring is the *classical* approach.\tightlist
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
2. The *probability* of Event\ $A$ occurring is $2/6$.  
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
3. Rolling a 
<span class="larger-die">&#9856;</span> 
   on the first roll is *independent* of rolling a
<span class="larger-die">&#9856;</span> on a second roll.  
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
4. The *probability* of\ '$A$ **and**\ $B$' occurring is $1/6$.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
5. The *probability* of\ '$A$ **or**\ $B$' occurring is $4/6$.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
6. The *probability* of '**not**\ $B$' occurring is $3/6$. 
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
7. The *odds* of '**not**\ $B$' occurring is $3/6$. 
<select class='webex-select'><option value='blank'></option><option value=''>TRUE</option><option value='answer'>FALSE</option></select>
8. The probability of Event\ $B$ occurring, *if* Event\ $A$ has already occurred, is $1/2$.
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
:::


## Exercises {#ProbabilityExercises}

[Answers to odd-numbered exercises] are given at the end of the book. 




::: {.exercise #ProbabilityMethod}
Which *approach* is best used to estimate a probability in these situations?

1. The probability that the stock market will rise next month.
2. The probability that a randomly-chosen person writes left-handed.
:::


::: {.exercise #ProbabilityMethodB}
Which *approach* is best used to estimate a probability in these situations?

1. The probability that a **King** will be chosen from a pack of cards.
2. The probability that Paris receives more than\ $50\mms$ of rain next May.
:::


::: {.exercise #ProbabilityAndOrNot}
Consider drawing cards from a fair pack.
*Event\ A* is 'drawing a picture card', *Event\ B*  is 'drawing a **King** or **Ace**' and *Event\ C* is 'drawing a $\spadesuit$'.

1. What events are in '$A$ **and**\ $B$'? \tightlist
2. Compute the probability of '$A$ **and**\ $B$'. 
3. What events are in '$A$ **or**\ $B$'? \tightlist
4. Compute the probability of '$A$ **or**\ $B$'. 
5. What events are in '$A$ **and**\ $C$'? \tightlist
6. Compute the probability of '$A$ **and**\ $C$'. 
7. What events are in '**not**\ $C$'? \tightlist
8. Compute the probability of '**not**\ $C$'. 
9. Compute the probability of $C$, if\ $A$ has already occurred.
10. Compute the probability of $A$, if\ $C$ has already occurred.
:::


::: {.exercise #ProbabilityAndOrNot2}
Consider rolling a fair die.
*Event\ A* is 'rolling an *even* number', *Event\ B*  is 'rolling an *odd* number' and *Event\ C* is 'rolling a
<span class="larger-die">&#9857;</span>'.

1. What events are in '$A$ **and**\ $B$'? \tightlist
2. Compute the probability of '$A$ **and**\ $B$'. 
3. What events are in '$A$ **or** $B$'? \tightlist
4. Compute the probability of '$A$ **or**\ $B$'. 
5. What events are in '$A$ **and**\ $C$'? \tightlist
6. Compute the probability of '$A$ **and**\ $C$'. 
7. What events are in '**not**\ $C$'? \tightlist
8. Compute the probability of '**not**\ $C$'. 
9. Compute the probability of $C$, if\ $A$ has already occurred.
10. Compute the probability of $C$, if\ $B$ has already occurred.
:::


::: {.exercise #ProbabilityThreeEvents}
Consider these three events about tossing two fair coins, say Coin\ A and Coin\ B:
*Event\ 1* is 'toss a
<span class="HTcircle">H</span> on Coin\ A'; *Event\ 2* is 'toss a
<span class="HTcircle">T</span> on Coin\ A'; and *Event\ 3* is 'toss a
<span class="HTcircle">H</span> on Coin\ B'.

1. Are *Event\ 1* and *Event\ 2* independent events? \tightlist  
2. Are *Event\ 1* and *Event\ 3* independent events?
3. Compute the probability of *Event\ 3*.
4. What is the probability of *Event\ 3* occurring, if *Event\ 1* has already occurred?
5. List the sample space for the random procedure.
:::


::: {.exercise #ProbabilityThreeEvents2}
Consider these three events about drawing one card from a fair pack:
*Event\ 1* is 'draw a **Jack**'; *Event\ 2* is 'draw a $\heartsuit$'; and *Event\ 3* is 'draw a $\clubsuit$'.

1. Compute the probability of *Event\ 1*. \tightlist
1. Compute the probability of *Event\ 1*, if *Event\ 2* has occurred.
1. Compute the probability of *Event\ 1*, if *Event\ 2* has *not* occurred.
1. Are *Event\ 1* and *Event\ 2* independent?
   Explain.
1. Compute the probability of *Event\ 3*.
1. Compute the probability of *Event\ 3*, if *Event\ 2* has occurred.
1. Compute the probability of *Event\ 3*, if *Event\ 2* has *not* occurred.
1. Are *Event\ 2* and *Event\ 3* independent?
   Explain.
:::



::: {.exercise #ProbabilityDie}
Suppose I roll a standard six-sided die. 

1. What is the *probability* that I will roll a number larger than 
<span class="larger-die">&#9857;</span>? \tightlist
<select class='webex-select'><option value='blank'></option><option value=''>0</option><option value=''>1/6</option><option value=''>2/6</option><option value=''>3/6</option><option value='answer'>4/6</option><option value=''>5/6</option><option value=''>1</option></select>
2. What are the *odds* of rolling a number smaller than 
<span class="larger-die">&#9861;</span>?
<select class='webex-select'><option value='blank'></option><option value=''>0</option><option value=''>1/6</option><option value=''>1/5</option><option value=''>5/6</option><option value=''>6/5</option><option value='answer'>5</option><option value=''>5/6</option><option value=''>1</option></select>

3. Suppose I toss a coin after rolling the die.
   Is the result from the coin toss *independent* of what I rolled on the die?
<div class='webex-radiogroup' id='radio_CPAIGNRMEG'><label><input type="radio" autocomplete="off" name="radio_CPAIGNRMEG" value=""></input> <span>No: because there are six possible outcomes from rolling a die, but only two from tossing a coin</span></label><label><input type="radio" autocomplete="off" name="radio_CPAIGNRMEG" value=""></input> <span>Yes: because die was not rolled at the same time as the coin was tossed</span></label><label><input type="radio" autocomplete="off" name="radio_CPAIGNRMEG" value="answer"></input> <span>Yes: what happens on the die won&apos;t change what happens on the coin</span></label><label><input type="radio" autocomplete="off" name="radio_CPAIGNRMEG" value=""></input> <span>No:   because the die was not rolled at the same time as the coin was tossed</span></label></div>

4. What is the probability that I roll a number divisible by\ $2$ on the die?
<select class='webex-select'><option value='blank'></option><option value=''>0</option><option value=''>1/6</option><option value=''>2/6</option><option value='answer'>3/6</option><option value=''>4/6</option><option value=''>5/6</option><option value=''>1</option></select>
5. What is the probability that I roll a number divisible by\ $2$ **and** divisible by\ $3$ on the die?
<select class='webex-select'><option value='blank'></option><option value=''>0</option><option value='answer'>1/6</option><option value=''>2/6</option><option value=''>3/6</option><option value=''>4/6</option><option value=''>5/6</option><option value=''>1</option></select>
6. What is the probability of rolling a 
<span class="larger-die">&#9857;</span>, *given* that the number is smaller than 
<span class="larger-die">&#9859;</span>?
:::


::: {.exercise #ProbabilityCards}
Suppose you have a well-shuffled, standard pack of $52$\ cards.

1. What is the *probability* that you will draw a **King**?
1. What are the *odds* that you will draw a **King**?
1. What is the *probability* that you will draw a picture card (**Ace**, **King**, **Queen** or **Jack**)?
1. What are the *odds* that you will draw a picture card (**Ace**, **King**, **Queen** or **Jack**)?
1. Suppose I draw two cards from the pack.
   Are the events 'Draw a **King** first' and 'Draw a **Queen** second' independent events? 
1. Suppose I draw one card from the pack (drawing the second without replacing the first), then roll a six-sided die.
   Are the events 'Draw a **Jack** from the pack of cards' and 'Roll a 
   <span class="larger-die">&#9860;</span>
on the die' independent events? 
Explain.
1. If I draw a picture card, what is the probability the card is a **King**?
:::




::: {.exercise #SampleSpaceCardsDiff}
Consider drawing a card from a standard, well-shuffled pack of cards.
The first card is replaced, the pack reshuffled, and then a second card is drawn from the pack.
The colour of the two cards is recorded (Black or Red).

1. Write down the sample space.
2. Define Event\ $D$ as 'the total number of black cards drawn, minus the total number of red cards drawn'.
   Find the probability that\ $D$ is zero.
3. Find the probability that\ $D$ is zero **or** one.
4. Is the colour of the card drawn first *independent* of the colour of the card drawn second?
   Explain.
:::


:::{.exercise #SampleSpaceInfiniteCoins}
Consider the random process ‘tossing a coin’.
Event\ $H$ is of interest: 'the number of tosses until the first
<span class="HTcircle">H</span> is thrown’. 

:::::: {.cols data-latex=""}
:::: {.col data-latex="{0.45\textwidth}"}
1. What is the sample space?
2. Find the probability that $H$ is one.
::::

:::: {.col data-latex="{0.025\textwidth}"}
\ 
<!-- an empty Div (with a white space), serving as
a column separator -->
::::

:::: {.col data-latex="{0.50\textwidth}"}
3. Find the probability that $H$ is two.
4. Find the probability that $H$ is one **or** two.
::::

::::::

:::


::: {.exercise #FirstNationStudents}
@mypaper:Dunn:GLM-IEE tabulated information about Queensland school children (Table\ \@ref(tab:EdTable)).

1. What is the probability that a randomly chosen student is a First Nations student?
1. What is the probability that a randomly chosen student is in a government school?
1. Is the sex of the student approximately independent of whether the student is a First Nations student, for students in government schools?
1. Is the sex of the student approximately independent of whether the student is a First Nations student, for students in non-government schools?
1. Is whether the student is a First Nations student approximately independent of the type of school, for female students?
1. Is whether the student is a First Nations student approximately independent of the type of school, for male students?
1. Based on the above, what can you conclude from the data?
:::

<table>
<caption>(\#tab:EdTable)The number of First Nations and non-First Nations students in Queensland schools (2019).</caption>
 <thead>
  <tr>
   <th style="text-align:left;font-weight: bold;">   </th>
   <th style="text-align:center;font-weight: bold;"> Number of First Nations students </th>
   <th style="text-align:center;font-weight: bold;"> Number of non-First Nations students </th>
  </tr>
 </thead>
<tbody>
  <tr grouplength="2"><td colspan="3" style="border-bottom: 1px solid;"><em>Government schools</em></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Females </td>
   <td style="text-align:center;"> $2\,540$ </td>
   <td style="text-align:center;"> $21\,219$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Males </td>
   <td style="text-align:center;"> $2\,734$ </td>
   <td style="text-align:center;"> $22\,574$ </td>
  </tr>
  <tr grouplength="2"><td colspan="3" style="border-bottom: 1px solid;"><em>Non-government schools</em></td></tr>
<tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Females </td>
   <td style="text-align:center;"> $\phantom{0}391$ </td>
   <td style="text-align:center;"> $\phantom{0}9\,496$ </td>
  </tr>
  <tr>
   <td style="text-align:left;padding-left: 2em;" indentlevel="1"> Males </td>
   <td style="text-align:center;"> $\phantom{0}362$ </td>
   <td style="text-align:center;"> $\phantom{0}9\,963$ </td>
  </tr>
</tbody>
</table>


::: {.exercise #TwoWayTableProbs}
@data:kelishadi2017:snack recorded whether Iranian children aged $6$--$18$ years ate breakfast (Table\ \@ref(tab:SkipBreakfast2)).
Find the *probability* that a randomly chosen student is:

1. A female student.
2. A female student who skipped breakfast.
3. A female student, *if we already know* the child skipped breakfast.
:::


<table>
<caption>(\#tab:SkipBreakfast2)The number of Iranian children aged $6$ to $18$ who skip and do not skip breakfast.</caption>
 <thead>
  <tr>
   <th style="text-align:left;">   </th>
   <th style="text-align:center;"> Skips breakfast </th>
   <th style="text-align:center;"> Doesn't skip breakfast </th>
   <th style="text-align:center;"> Total </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Females </td>
   <td style="text-align:center;"> $2\,383$ </td>
   <td style="text-align:center;"> $4\,257$ </td>
   <td style="text-align:center;font-weight: bold;"> $\phantom{0}6\,640$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Males </td>
   <td style="text-align:center;"> $1\,944$ </td>
   <td style="text-align:center;"> $4\,902$ </td>
   <td style="text-align:center;font-weight: bold;"> $\phantom{0}6\,846$ </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Total </td>
   <td style="text-align:center;"> $4\,327$ </td>
   <td style="text-align:center;"> $9\,159$ </td>
   <td style="text-align:center;font-weight: bold;"> $13\,486$ </td>
  </tr>
</tbody>
</table>

::: {.exercise #IndependentEvents}
Are these pairs of events likely to be *independent* or *not independent*? 
Explain.

1. 'I walk to work tomorrow morning', and 'Rain is expected tomorrow morning'.
1. 'A person smokes more than $10$ cigarettes per week' and 'A person gets lung cancer'.
1. 'It rains today' and 'I hose my garden today'. 
:::


::: {.exercise #SensitivitySpecifity}
In disease testing, two keys aspects of the test are:

* *sensitivity*:\index{Sensitivity} the probability of a *positive* test result among those *with* the disease; and
* *specificity*:\index{Specificity} the probability of a *negative* test result among those *without* the disease.

Both are important for understanding how well a test works in practice.
Ideally, a test would have high sensitivity and high specificity.

A certain test has a *sensitivity* of\ $0.99$ and a *specificity* of\ $0.98$.
Consider a group of $1\,000$\ people, $100$ of whom (unknowingly) have the disease and $900$ who (unknowingly) do not have the disease.
All the people are given the test.

1. Suppose the $100$\ people who *do* have a disease are tested. 
   How many would be expected to return a positive test result?
1. Suppose the $900$\ people who *do not* have a disease are tested. 
   How many would be expected to return a positive test result?
1. In total, how many positive tests would be expected from the $1\,000$\ people? 
1. Consider those people who return a positive test result.
   What is the probability that one of these people actually has the disease?
:::


::: {.exercise #CoinOutcomes}
Explain *why* the following argument is incorrect:

> When I toss two coins, there are only three outcomes: a **Head** and a **Head**, a **Tail** and a **Tail**, or one of each.
> So the probability of obtaining two **Tails** must be one-third.
:::


::: {.exercise #AndrewsQuote}
On 13\ October, 1997, the American television programme *Nightline* interviewed Dr\ Richard Andrews, director of California's *Office of Emergency Services*, to discussed natural disasters being predicted.
In the interview,
[Dr Andrews said:](https://chance.dartmouth.edu/chance_news/recent_news/chance_news_6.12part1.html#Everyprobability)

> I listen to earth scientists talk about earthquake probabilities a lot and in my mind every probability is $50$--$50$: either it will happen or it won't happen.

Explain why Dr Andrews is incorrect when he says that 'every probability is $50$--$50$'. 
Give an example to show why he must be incorrect.
:::









<!-- QUICK REVIEW ANSWERS -->
<!--
::: {.EOCanswerBox .EOCanswer data-latex="{iconmonstr-check-mark-14-240.png}"}
**Answers to *Quick review* questions:**
**1.** True.
**2.** True.
**3.** True.
**4.** True.
**5.** True.
**6.** True.
**7.** False: odds are\ $1$.
**8.** True.
:::
-->



