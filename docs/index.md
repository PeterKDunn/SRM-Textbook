---
title: "Scientific Research and Methodology"
subtitle: "An introduction to quantitative research and statistics"
author: "Peter K. Dunn"
date: '2025-12-09 17:02:02.894409'
knit: render_book
documentclass: krantz
classoption: krantz2
output: bookdown::pdf_book
description: "An introduction to quantitative research in science, engineering and
  health (including research design, hypothesis testing and confidence intervals in
  common situations)"
#url: 'https\://bookdown.org/pkaldunn/SRM-Textbook/'
link-citations: yes
colorlinks: yes
lot: no
lof: no
always_allow_html: yes
links-as-notes: yes
site: bookdown::bookdown_site
github-repo: PeterKDunn/SRM-Textbook
graphics: yes
bibliography: [packages.bib, ReferenceList.bib]
biblio-bst: plain.bst
#nocite: |
#  @data:Davidson2000:Amputees, @data:Grabosky2016:Trees, @data:Pons:ResponseTime, @data:Edwards2015:PA
---

<!-- Best way I have found to get correct spacing for units in LaTeX, without screwing up HTML -->
\newcommand{\cms}{\,\text{cm}}
\newcommand{\dLs}{\,\text{dL}}
\newcommand{\xdLs}{\text{dL}}
<!-- No space beforehand so useful in place like \\mgs.\\xdLhas^{-1} -->
\newcommand{\fmols}{\,\text{fmol}}
\newcommand{\gs}{\,\text{g}}
\newcommand{\hs}{\,\text{h}}
\newcommand{\xhs}{\text{h}}
<!-- No space beforehand so useful in place like \\km.\\xhs^{-1} -->
\newcommand{\has}{\,\text{ha}}
\newcommand{\xhas}{\text{ha}}
<!-- No space beforehand so useful in place like \\kgs.\\xhas^{-1} -->
\newcommand{\kgs}{\,\text{kg}}
\newcommand{\kms}{\,\text{km}}
\newcommand{\kWhs}{\,\text{kWh}}
\newcommand{\lbs}{\,\text{lb}}
\newcommand{\Ls}{\,\text{L}}
\newcommand{\xLs}{\text{L}} 
<!-- No space beforehand so useful in place like \\microgs.\\xLs^{-1} -->
\newcommand{\mgs}{\,\text{mg}}
\newcommand{\microgs}{\,\ensuremath{\mu}\text{g}}
\newcommand{\millis}{\,\text{ms}}
\newcommand{\mins}{\,\text{mins}}
\newcommand{\mJs}{\,\text{mJ}}
\newcommand{\mmols}{\,\text{mmol}}
\newcommand{\mLs}{\,\text{mL}}
\newcommand{\mms}{\,\text{mm}}
\newcommand{\ms}{\,\text{m}}
\newcommand{\xms}{\text{m}}
\newcommand{\ozs}{\,\text{oz}}
\newcommand{\secs}{\,\text{s}}
\newcommand{\xsecs}{\text{s}}
\newcommand{\ppms}{\,\text{ppm}}
\newcommand{\ys}{\,\text{y}}
\newcommand{\vs}{\,\text{V}}









<!--- For HTML Only: see https://stackoverflow.com/questions/41655383/r-markdown-similar-feature-to-newcommand-in-latex --->

\ensuremath{\usepackage{customdice}}

<!-- Help with die unicode! -->

\frontmatter 

# Preface  {.unlisted .unnumbered}

<img src="OtherImages/CRC-cover.jpg" style="display: block; margin: auto;" />


This book introduces quantitative research in the scientific and health disciplines, with an emphasis on introductory statistics.
Unlike many introductory statistics textbooks, this textbook gives context to the statistics by first covering the basics of the research design process; it connects the research question with the means to answer that question.
I believe this is crucial to understanding the need and purpose of using statistics.
The research process is broken into six steps, which provide the framework for the content.

The book is designed for teaching at first-year undergraduate level, with examples mostly drawn from science, health and engineering.
Many real journal articles are used throughout the text in examples, to demonstrate the use of the techniques.
Almost every dataset used in this book is real and available in the **R**\ package
[**SRMData**](https://CRAN.R-project.org/package=SRMData)
(see App.\ \@ref(AppendixDataSets)).


The main focus of the book is the analysis of data, with an emphasis on understanding the underlying concepts rather than a focus on using mathematics.
Software output\index{Software output} is often used to help when calculations become onerous.
The output is from jamovi [@Software:jamovi],\index{Computers and software!jamovi} but is sufficiently generic that no knowledge of jamovi is necessary to use this book, and this book can be read without relying on any specific statistical software.
(jamovi, however, is *free* to download and use.)



The following call-outs are used in this book:


::: {.objectivesBox .objectives data-latex="{iconmonstr-target-4-240.png}"}
These chunks introduce the objectives for the chapters of the book.
:::

\smallskip

::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
These chunks highlight common mistakes or warnings, about a particular concept or about using a formula.
:::


::: {.tipBox .tip data-latex="{iconmonstr-info-6-240.png}"}
These chunks offer helpful information.
:::


::: {.softwareBox .software data-latex="{iconmonstr-laptop-4-240.png}"}
These chunks refer to information about using software or a calculator.
:::


::: {.pronounceBox .pronounce data-latex="{iconmonstr-microphone-7-240.png}"}
These chunks indicate how certain symbols and terms are pronounced.
:::


<!--
::: {.EOCanswerBox .EOCanswer data-latex="{iconmonstr-check-mark-14-240.png}"}
These end-of-chapter chunks provide answers to the end-of-chapter *Quick review questions*.
:::
-->


This book was made using **R** [@Software:Rsoftware] with the **bookdown** package [@Software:Rbookdown], using [Markdown](https://en.wikipedia.org/wiki/Markdown) 
syntax and **knitr** [@package:knitr] and numerous other **R** packages.
All of this software is *free* and open source.
Other resources used include:

* Some online activities are created using **LearningApps.org**, which is free to use.
* various icons from 
[**iconmonstr**](https://iconmonstr.com/)
  (freely available).
* the images of the cards (e.g., in Sect.\ \@ref(NeedForDecisionMaking)), which are in the public domain and available from https://code.google.com/archive/p/vector-playing-cards/.

Earlier drafts of this textbook have been used to teach thousands of students, and the book has been used by many fantastic teaching assistants.
I thank all of them for their feedback.
Special thanks to Dr Amanda Shaker (La\ Trobe University), who reported numerous issues in earlier editions (and often provided corrections).



<!-- ## How to use this book {-} -->


## How to use this online book {-}

* **Navigation**: navigate between pages depends on the size of your screen.
On wider screens:

  - the left-side menu is for navigating between *chapters*.
  - the right-side menu is for navigating between the *sections* of the current chapter.

* Words can be searched for using **Search** button on the menu:
  
<img src="bs4-Search.png" width="233" />




::: {.importantBox .important data-latex="{iconmonstr-warning-8-240.png}"}
The book is optimised for *online viewing*,
and the book may be updated frequently,
so a printed PDF version may not be the most recent version.
:::


In some places, interactive 'quiz' questions are given.
*In the online version*, the background turns from red to green when the answer is correct.
Try it now:

::: {.webex-check .webex-box}
1. What is $1 + 1$?
<select class='webex-select'><option value='blank'></option><option value=''>One</option><option value='answer'>Two</option><option value=''>Three</option></select>
1. What is $1 + 2$?
<input class='webex-solveme nospaces ignorecase' size='5' data-answer='["3","three"]'/>
1. Is $2 + 2 = 4$?
<select class='webex-select'><option value='blank'></option><option value='answer'>TRUE</option><option value=''>FALSE</option></select>
1. Which one of these is FALSE?
<div class='webex-radiogroup' id='radio_BQXNUEJXLD'><label><input type="radio" autocomplete="off" name="radio_BQXNUEJXLD" value=""></input> <span>The inventor of the fairy floss machine was a dentist</span></label><label><input type="radio" autocomplete="off" name="radio_BQXNUEJXLD" value=""></input> <span>Barack Obama has won two Grammy awards</span></label><label><input type="radio" autocomplete="off" name="radio_BQXNUEJXLD" value="answer"></input> <span>Once a year all of Wikipedia is printed, and placed in a vault in Norway.</span></label></div>

:::


## Learning Outcomes {.unlisted .unnumbered}

::: {.objectivesBox .objectives data-latex="{iconmonstr-target-4-240.png}"}
In this book, you will learn to:

* develop quantitative research questions and testable hypotheses.
* design quantitative studies to answer simple quantitative research questions.
* select and produce appropriate graphical, numerical and statistical analyses.
* select, apply and interpret the results of the correct statistical technique to analyse data.
* comprehend, apply and communicate in the language of research and statistics.
* demonstrate professional integrity in planning, interpreting and reporting the results of quantitative studies.
:::



## How to cite this book {.unlisted .unnumbered}

Peter K. Dunn (2024). *Scientific Research and Methodology: An introduction to quantitative research in science and health*.
https://bookdown.org/pkaldunn/SRM-Textbook


The online version of this book is licensed under the
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/). You can purchase a printed copy or PDF copy from CRC Press in 2025.





## Image credits {-}


The sources of the images used in the online version of this book (in accordance with the terms of [Unsplash](https://unsplash.com/license), [Pixabay](https://pixabay.com/service/license/) and [Pexels](https://www.pexels.com/license/)) are listed
below.



*  Image of the mouse (e.g., Sect.\ \@ref(HowDoWeKnow)): 
  Photo by 
  [Shutterbug75](https://pixabay.com/users/Shutterbug75-2077322/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=1238239)
  from 
  [Pixabay](https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=1238239)

*  Image of the cigarette (e.g., Sect.\ \@ref(TypesOfResearch)): 
  Photo by 
  [Shutterbug75](https://pixabay.com/users/shutterbug75-2077322/?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=1270516)
  from 
  [Pixabay](https://pixabay.com/?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=1270516)
  
* Image of students around a computer (e.g., Sect \@ref(Software-In-Research)): Photo by
  [Sain Tipchai](https://pixabay.com/users/sasint-3639875/?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=1807505)
  from
  [Pixabay](https://pixabay.com/?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=1807505)

* Image of gardening (e.g., Sect.\ \@ref(TypesOfResearch)):
  Photo by 
  [Lukas](https://www.pexels.com/@goumbik?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from 
  [Pexels](https://www.pexels.com/photo/agriculture-backyard-blur-close-up-296230/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of electric car charging (e.g., Sect.\ \@ref(TypesOfResearch)): Photo by 
  [Rathaphon Nanthapreecha](https://www.pexels.com/@rathaphon-nanthapreecha-1516060?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from
  [Pexels](https://www.pexels.com/photo/white-car-charging-3846205/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of stressed students (e.g., Sect.\ \@ref(OperationDefinitions)): Photo by
  [Oladimeji Ajegbile](https://www.pexels.com/@diimejii?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from 
  [Pexels](https://www.pexels.com/photo/man-working-using-a-laptop-2696299/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of women playing rugby (Sect.\ \@ref(OperationDefinitions)): Photo by
  [TheOtherKev](https://pixabay.com/users/theotherkev-9436196/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=6905793) from
  [Pixabay](https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=6905793)

* Image of women at the beach (e.g., Sect \@ref(UnitsObsAnalysis)): 
  Photo by 
  [nappy](https://www.pexels.com/@nappy?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels) 
  from 
  [Pexels](https://www.pexels.com/photo/two-women-with-man-hugging-by-the-sea-936018/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of tyres (e.g., Sect \@ref(UnitsObsAnalysis)): 
  Photo by 
  [Mylene2401](https://pixabay.com/users/mylene2401-10328767/?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=4664205) 
  from 
  [Pixabay](https://pixabay.com/?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=4664205)

* Image of the man (e.g., Sect \@ref(UnitsObsAnalysis)): 
  Photo by 
  [Moose Photos](https://www.pexels.com/@moose-photos-170195?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from 
  [Pexels](https://www.pexels.com/photo/man-wearing-brown-dress-shirt-holding-white-fedora-hat-1036627/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of person walking (e.g., Sect.\ \@ref(DescriptiveStudies)): Photo by 
  [Kaboompics.com](https://www.pexels.com/@kaboompics?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels) 
  from 
  [Pexels](https://www.pexels.com/photo/close-up-of-a-woman-s-sport-shoes-6346/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of soft drinks (e.g., Sect.\ \@ref(Directionality)):
  Photo by
  [ThreeMilesPerHour](https://pixabay.com/users/threemilesperhour-9661546/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=3586888)
  from 
  [Pixabay](https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=3586888)
  
* Image of paper pile (e.g., Sect.\ \@ref(EthicalGuidelines)):
  Photo by
  [Ag Ku](https://pixabay.com/users/myrfa-3126475/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=1614223)
  from 
  [Pixaby](https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=1614223)
  
* Image of hazard sign (e.g., Sect.\ \@ref(Common-Ethical-Issues)):
  Photo by
  [Mikael Seegen](https://unsplash.com/@mikael_seegen?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText)
  from
  [Unsplash](https://unsplash.com/s/photos/danger?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText)


* Image of older man with a headache (e.g., Sect.\ \@ref(IdeaOfSampling)): Photo by
  [Gerd Altmann](https://www.pexels.com/@geralt?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from 
  [Pexels](https://www.pexels.com/photo/man-old-depressed-headache-23180/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of soup (e.g., Sect.\ \@ref(NeedForDecisionMaking)): Photo by
  [Audrey Hunt](https://pixabay.com/users/vocalcoach-3898/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=179725)
  from 
  [Pixabay](https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=179725)

* The images of dice (e.g., Sect.\ \@ref(ProbClassical)):
  Images by [Clker-Free-Vector-Images](https://pixabay.com/users/clker-free-vector-images-3736/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=26772)
  from 
  [Pixabay](https://pixabay.com//?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=26772)
  
* Image of baby (e.g., Sect.\ \@ref(ProbRelFreq)): Photo by
  [PublicDomainPictures](https://pixabay.com/users/publicdomainpictures-14/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=22194)
  from 
  [Pixabay](https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=22194)

* Image of cyclone (e.g., Sect.\ \@ref(ProbSubjective)): Photo by
  [WikiImages](https://pixabay.com/users/wikiimages-1897/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=62957) 
  from
  [Pixabay](https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=62957)

* Image of school kids (e.g., Sect.\ \@ref(PrecisionAccuracy)): Photo by
  [Iqwan Alif](https://www.pexels.com/@iqwan-alif-493640?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels) 
  from 
  [Pexels](https://www.pexels.com/photo/laughing-children-in-between-woman-and-man-at-daytime-1206101/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of person typing (e.g., Sect.\ \@ref(SRS)):
  Photo by 
  [Startup Stock Photos](https://www.pexels.com/@startup-stock-photos?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels) 
  from 
  [Pexels](https://www.pexels.com/photo/startup-planning-notes-mac-book-7357/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)


* Image of the prosthetic (e.g., Sect.\ \@ref(Representative-samples)): Photo by
  [ThisIsEngineering](https://www.pexels.com/@thisisengineering?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from 
  [Pexels](https://www.pexels.com/photo/robotic-hand-prosthetic-3912979/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of two people drinking coffee (e.g., Sect.\ \@ref(Representative-samples)): Photo by
  [Lina Kivaka](https://www.pexels.com/@lina?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from 
  [Pexels](https://www.pexels.com/photo/man-and-a-woman-having-coffee-while-chatting-3395280/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of sweaty woman (e.g., Sect.\ \@ref(Representative-samples)): Photo by
  [Juergen Striewski](https://www.pexels.com/@striewa?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from 
  [Pexels](https://www.pexels.com/photo/calm-woman-with-colorful-hand-fan-301048/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of an electric car charging (e.g., Sect.\ \@ref(Representative-samples)):
  Photo by 
  [Rathaphon Nanthapreecha](https://www.pexels.com/@rathaphon-nanthapreecha-1516060?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels) 
  from 
  [Pexels](https://www.pexels.com/photo/white-car-charging-3846205/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of a wholegrain loaf (e.g., Sect.\ \@ref(Chap7-Intro)):
  Photo by 
  [Gil Goldman](https://www.pexels.com/@gil-goldman-46091?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels) 
  from 
  [Pexels](https://www.pexels.com/photo/fresh-bread-loafs-on-table-in-bakery-4268507/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of two women (e.g., Sect.\ \@ref(ManagingConfounding)): Photo by
  [Andrea Piacquadio](https://www.pexels.com/@olly?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from 
  [Pexels](https://www.pexels.com/photo/joyful-adult-daughter-greeting-happy-surprised-senior-mother-in-garden-3768131/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of toothbrush (e.g., Sect.\ \@ref(HawthorneEffect)): Photo by
  [PhotoMIX Company](https://www.pexels.com/@wdnet?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels) 
  from
  [Pexels](https://www.pexels.com/photo/blue-and-white-toothpaste-on-toothbrush-216729/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  
* Image of a man washing his hands (e.g., Sect.\ \@ref(InterpretStudyDesign)):
  Photo by 
  [Ketut Subiyanto](https://www.pexels.com/@ketut-subiyanto?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels) 
  from 
  [Pexels](https://www.pexels.com/photo/man-in-white-long-sleeve-shirt-washing-his-hands-4308195/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of a man drinking coffee (e.g., Sect.\ \@ref(InterpretApplicability)):
  Photo by
  [nappy](https://www.pexels.com/@nappy?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels) 
  from 
  [Pexels](https://www.pexels.com/photo/man-sitting-in-front-of-round-table-while-sipping-from-white-ceramic-mug-936019/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of mail box (e.g., Sect.\ \@ref(QualData)): Photo by
  [Carlos Cuadros](https://www.pexels.com/@cuadros92?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from 
  [Pexels](https://www.pexels.com/photo/multi-coloured-wooden-mailbox-mounted-on-door-979959/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of father and baby (e.g., Sect.\ \@ref(StemAndLeafPlots)): Photo by
  [nappy](https://www.pexels.com/@nappy?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from 
  [Pexels](https://www.pexels.com/photo/man-carrying-his-baby-3569597/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of fries (e.g., Sect.\ \@ref(DotChartsOneVar)): Photo by
  [Dzenina Lukac](https://www.pexels.com/@dzeninalukac?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from 
  [Pexels](https://www.pexels.com/photo/fried-potatoes-1583884/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of athletes (e.g., Sect.\ \@ref(Scatterplots)): Photo by
  [Jim De Ramos](https://www.pexels.com/@jim-de-ramos-395808?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from 
  [Pexels](https://www.pexels.com/photo/people-doing-swim-race-1263349/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of birthday cake (e.g., Sect.\ \@ref(HistoDiffPlot)): Photo by
  [Leslie Eckert](https://pixabay.com/users/cimabue-635601/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=916253) 
  from
  [Pixabay](https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=916253)

* Image of a river (e.g., Sect.\ \@ref(ComputeAverage)): Photo by
  [Beverly Buckley](https://pixabay.com/users/buntysmum-5497946/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=4221472)
  from
  [Pixabay](https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=4221472)
  
* Image of a child brushing teeth (e.g., Sect.\ \@ref(DecisionMaking)):
  Photo by 
  [Ketut Subiyanto](https://www.pexels.com/@ketut-subiyanto?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from 
  [Pexels](https://www.pexels.com/photo/focused-african-american-kid-cleaning-teeth-looking-at-mirror-4546136/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of playing cards (e.g., Sect.\ \@ref(Independence)): Photo by
  [Patrick JL Laso](https://pixabay.com/users/jlaso-381360/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=416960)
  from
  [Pixabay](https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=416960)

* Image of tape measure (e.g., Sect.\ \@ref(zScores)): Photo by
  [Johanna Pakkala](https://pixabay.com/users/johanna84-31220/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=289399)
  from
  [Pixabay](https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=289399)

* Image of forest (e.g., Sect.\ \@ref(ZScoreForestry)):
  Photo by 
  [Brandon Montrone](https://www.pexels.com/@brandon-montrone-230847)
  from 
  [Pexels](https://www.pexels.com/photo/green-pine-trees-1179229/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of roulette wheel (e.g., Sect.\ \@ref(SamplingDistributionMeans)): Photo by
  [Greg Montani](https://pixabay.com/users/gregmontani-1014946/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=839037)
  from
  [Pixabay](https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=839037)

* Image of dice (e.g., Sect.\ \@ref(SamplingDistributionKnownp)):
  Photo by 
  [Skitterphoto](https://www.pexels.com/@skitterphoto)
  from
  [Pexels](https://www.pexels.com/photo/pair-of-white-dice-on-top-of-mirror-705171/)
  
* Image of a koala (e.g., Sect.\ \@ref(ConfIntPUnknownP)):
  Photo by
  [Eriksson Luo](https://unsplash.com/@newdawn?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText)
  on 
  [Unsplash](https://unsplash.com/s/photos/koalas?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText)

* Image of blood test equipment (e.g., Sect.\ \@ref(ValidityProportions)): Photo by
  [Karolina Grabowska](https://www.pexels.com/@karolina-grabowska?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from 
  [Pexels](https://www.pexels.com/photo/set-of-vials-and-test-tube-of-blood-4226912/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of woman drinking coffee (e.g., Sect.\ \@ref(Female-Coffee-Drinkers)):
  Photo by
  [Gian Cescon](https://unsplash.com/@giancescon?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText)
  on 
  [Unsplash](https://unsplash.com/s/photos/coffee?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText)

* Image of a child carrying a school bag (e.g., Sect.\ \@ref(OneMeanCI)): Photo by
  [Pixabay](https://www.pexels.com/photo/boy-in-brown-hoodie-carrying-red-backpack-while-walking-on-dirt-road-near-tall-trees-207697/)

* Image of a scan (e.g., Sect.\ \@ref(ValiditySampleMean)): Photo by
  [Anna Shvets](https://www.pexels.com/@shvetsa?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from
  [Pexels](https://www.pexels.com/photo/woman-clinic-doctor-health-4225923/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of peanuts (e.g., Sect.\ \@ref(Cadmium-In-Peanuts)):
  Photo by
  [Tom Hermans](https://unsplash.com/@tomhermans?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText)
  on
  [Unsplash](https://unsplash.com/s/photos/peanuts?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText)
  
* Image of a citrus tree (e.g., Sect.\ \@ref(ErrorBarCharts)): 
  Photo by
  [Anderson Guerra](https://www.pexels.com/@andersonguerra)
  from
  [Pexels](https://www.pexels.com/photo/closeup-photo-of-round-green-fruit-1171521/)

* Image of litter on beach (e.g., Sect.\ \@ref(ErrorBarCharts)): 
  Photo by
  [Lucien Wanda](https://www.pexels.com/@lucien-wanda-1179483?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from 
  [Pexels](https://www.pexels.com/photo/piles-of-garbage-by-the-shore-2827735/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  
* Image of freeway exit (e.g., Sect.\ \@ref(SpeedSignage)):
  Photos by
  [Pexels](https://www.pexels.com/@pixabay)
  from
  [Pexels](https://www.pexels.com/photo/light-trails-on-road-at-night-315939/)

* Image of a handful of blueberries (Sect.\ \@ref(SampleSizeIdeas)):
  Photo by [Jan Temmel](https://pixabay.com/users/jantemmel-353437/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=801571) from 
  [Pixabay](https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=801571)

* Image of loaded dice (Sect.\ \@ref(ProportionTestIntro)):
  Photo by Peter K. Dunn.

* Image of woman in wheelchair (e.g., Sect.\ \@ref(exr:BHADP)): 
  Photo by:
  [Marcus Aurelius](https://www.pexels.com/@marcus-aurelius?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from 
  [Pexels](https://www.pexels.com/photo/woman-in-yellow-long-sleeve-shirt-sitting-on-wheelchair-4063510/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of students (e.g., Sect.\ \@ref(MealsOnCampus)): 
  Photo by 
  [Startup Stock Photos](https://www.pexels.com/@startup-stock-photos?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from 
  [Pexels](https://www.pexels.com/photo/people-coffee-meeting-team-7096/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  

* Image of woman with thermometer (e.g., Sect.\ \@ref(BodyTemperature)): 
  Photo by 
  [Anna Shvets](https://www.pexels.com/@shvetsa?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  from 
  [Pexels](https://www.pexels.com/photo/woman-in-face-mask-checking-thermometer-3987141/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of deer (e.g., Chap.\ \@ref(TwoQuant)): 
  Photo by 
  [Diana Parkhouse](https://unsplash.com/@ditakesphotos?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText)
  on
  [Unsplash](https://unsplash.com/s/photos/deer?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText")
  
* Image of polluted water (e.g., Sect.\ \@ref(Removal-Efficiency)): 
 Photo by 
 [Lisa Fotios](https://www.pexels.com/@fotios-photos?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels) 
 from 
 [Pexels](https://www.pexels.com/photo/trash-on-body-of-water-3264779/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)

* Image of reading notes (e.g., Sect.\ \@ref(Chap36-Intro)): 
  Photo by
  [Pixaby](https://www.pexels.com/@pixabay)
  from 
  [Pexels](https://www.pexels.com/photo/woman-reading-her-notes-258353/)

* Image of woman writing (e.g., Sect.\ \@ref(Chap37-Intro)): Photo by 
  [Ivan Samkov](https://www.pexels.com/@ivan-samkov?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels) 
  from 
  [Pexels](https://www.pexels.com/photo/woman-writing-on-a-notebook-4240494/?utm_content=attributionCopyText&utm_medium=referral&utm_source=pexels)
  
* Image of writing on a desk (e.g., Sect.\ \@ref(LexicalAmbiguity)): Photo by
  [Free-Photos](https://pixabay.com/photos/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=828911)
  from
  [Pixabay](https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=828911).  
  










