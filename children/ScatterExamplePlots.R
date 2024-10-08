### Example scatterplots
### Parameters
fig.ht <- 5.5
fig.wt <- 5

set.seed(2300)
x <- runif(50, 
           min = 0, 
           max = 10)
y <- 2*x + 5 + rnorm( length(x), 0, 1)

par( mar = c(5, 4, 4, 4) + 0.1) # DEFAULT: c(5, 4, 4, 2) + 0.1.
plot( y ~ x,
      pch = 19,
      las = 1,
      xlab = "Explanatory var",
      ylab = "Response",
      main = "Scatterplot A"
)
abline( coef(lm( y ~ x )), 
       lwd = 2, 
       col = 2)

text(0, 25,
     pos = 4,
     "Form: linear\nDirection: positive\nVariation: small")

dev.print(png, 
          filename = "ScatterExampleA.png", 
          width = fig.wt,
          height = fig.ht,
          units = "in", 
          res = 100)

#########################################

set.seed(2300)
x <- runif(50, 
           min = 0, 
           max = 10)
y <- -2*x + 5 + rnorm( length(x), 0, 5) + 25

par( mar = c(5, 4, 2, 2) + 0.1) # DEFAULT: c(5, 4, 4, 2) + 0.1.
plot( y ~ x,
      pch = 19,
      las = 1,
      xlab = "Explanatory var",
      ylab = "Response",
      main = "Scatterplot B"
)
abline( coef(lm( y ~ x )), 
       lwd = 2, 
       col = 2)

text(0, 10, 
     pos = 4,
     "Form: linear\nDirection: negative\nVariation: fairly large")

dev.print(png, 
          filename = "ScatterExampleB.png", 
          width = fig.wt,
          height = fig.ht,
          units = "in", 
          res = 100)

#########################################


set.seed(2300)
x <- runif(50, 
           min = 0, 
           max = 10)
y <- -2*(x-4)^2 + 5 + rnorm( length(x), 0, 5) + 80

par( mar = c(5, 4, 2, 2) + 0.1) # DEFAULT: c(5, 4, 4, 2) + 0.1.
plot( y ~ x,
      pch = 19,
      las = 1,
      xlab = "Explanatory var",
      ylab = "Response",
      main = "Scatterplot C"
)
mod.curve <- lm( y ~ poly(x,2) )

xnew <- seq(0, 10, 
            length = 25)
newdata <- data.frame(x = xnew)
ynew <- predict( mod.curve, 
                newdata = newdata)

lines( ynew ~ xnew, 
      lwd = 2, 
      col = 2)

text(0.25, 40, 
     pos = 4,
     "Form: non-linear (curved)\nDirection: (irrelevant)\nVariation: small")

dev.print(png, 
          filename = "ScatterExampleC.png",
          width = fig.wt,
          height = fig.ht,
          units = "in", 
          res = 100)


#########################################



set.seed(2300)
x <- runif(50, 
           min = 0, 
           max = 10)
y <- 2*(x-4)^2 + 5 + rnorm( length(x), 0, 15) + 25

par( mar = c(5, 4, 2, 2) + 0.1) # DEFAULT: c(5, 4, 4, 2) + 0.1.
plot( y ~ x,
      pch = 19,
      las = 1,
      xlab = "Explanatory var",
      ylab = "Response",
      main = "Scatterplot D"
)
mod.curve <- lm( y ~ poly(x,2) )

xnew <- seq(0, 10, 
            length = 25)
newdata <- data.frame(x = xnew)
ynew <- predict( mod.curve, 
                newdata = newdata)

lines( ynew ~ xnew, 
      lwd = 2, 
      col = 2)

text(0, 125, 
     pos = 4,
     "Form: non-linear (curved)\nDirection: (irrelevant)\nVariation: moderate") 

dev.print(png, 
          filename = "ScatterExampleD.png", 
          width = fig.wt,
          height = fig.ht,
          units = "in", 
          res = 100)



#########################################




set.seed(2300)
set.seed(2300)
x <- runif(50, 
           min = 0, 
           max = 10) 
y <- 2*(x-5)^3 + 5 + rnorm( length(x), 0, 15) + 250

par( mar = c(5, 4, 2, 2) + 0.1) # DEFAULT: c(5, 4, 4, 2) + 0.1.
plot( y ~ x,
      pch = 19,
      las = 1,
      xlab = "Explanatory var",
      ylab = "Response",
      main = "Scatterplot E"
)
mod.curve <- lm( y ~ poly(x,3) )

xnew <- seq(0, 10, 
            length = 25)
newdata <- data.frame(x = xnew)
ynew <- predict( mod.curve, 
                newdata = newdata)

lines( ynew ~ xnew, 
      lwd = 2, 
      col = 2)

text(0, 450, 
     pos = 4,
     "Form: non-linear (curved)\nDirection: (irrelevant)\nVariation: small/moderate") 

dev.print(png, 
          filename = "ScatterExampleE.png", 
          width = fig.wt,
          height = fig.ht,
          units = "in", 
          res = 100)



#########################################




set.seed(2300)
x <- runif(50, 
           min = 0, 
           max = 10) 
y <- runif(50, 
           min = 0, 
           max = 5)

par( mar=c(5, 4, 2, 2) + 0.1) # DEFAULT: c(5, 4, 4, 2) + 0.1.
plot( y ~ x,
      pch = 19,
      las = 1,
      ylim = c(0, 6),
      xlab = "Explanatory var",
      ylab = "Response",
      main = "Scatterplot F"
)
mod.curve <- lm( y ~ poly(x, 1) )

xnew <- seq(0, 10, 
            length = 25)
newdata <- data.frame(x = xnew)
ynew <- predict( mod.curve, 
                newdata = newdata)

lines( ynew ~ xnew, 
      lwd = 2, 
      col = 2)

text(0, 5.75, 
     "No obvious relationship", 
     pos = 4)

dev.print(png, 
          filename = "ScatterExampleF.png", 
          width = fig.wt,
          height = fig.ht,
          units = "in", 
          res = 100)


#########################################

set.seed(2300)
x <- runif(50,
           min = 0, 
           max = 10)
y <- 2*x + 5 + rnorm( length(x), 0, 1*x/2)

par( mar = c(5, 4, 2, 2) + 0.1) # DEFAULT: c(5, 4, 4, 2) + 0.1.
plot( y ~ x,
      pch = 19,
      las = 1,
      ylim = c(5, 25),
      xlab = "Explanatory var",
      ylab = "Response",
      main = "Scatterplot G"
)
mod.curve <- lm( y ~ poly(x, 1) )

xnew <- seq(0, 10, 
            length = 25)
newdata <- data.frame(x = xnew)
ynew <- predict( mod.curve, 
                newdata = newdata)

lines( ynew ~ xnew, 
      lwd = 2, 
      col = 2)

text(0, 22, 
     pos = 4,
     "Form: linear\nDirection: positive\nVariation: increase as x increases") 

dev.print(png, 
          filename = "ScatterExampleG.png", 
          width = fig.wt,
          height = fig.ht,
          units = "in", 
          res = 100)



#########################################

set.seed(2300)
library(GLMsData)
data(nminer)


par( mar=c(5, 4, 2, 2) + 0.1) # DEFAULT: c(5, 4, 4, 2) + 0.1.
plot( Minerab ~ Eucs, 
     data = nminer,
      pch = 19,
      ylim = c(0, 20),
      las = 1,
      xlab = "Explanatory var",
      ylab = "Response",
      main = "Scatterplot H"
)
mod.curve <- glm( Minerab ~ Eucs, 
                 data = nminer, 
                 family = poisson(link = "log"))

xnew <- seq(0, 35, 
            length = 25)
newdata <- data.frame(Eucs = xnew)
ynew <- predict( mod.curve, 
                newdata = newdata, 
                type = "response")

lines( ynew ~ xnew, 
      lwd = 2, 
      col = 2)

text(0, 18, 
     pos = 4,
     "Form: non-linear (curved)\nDirection: (irrelevant)\nVariation: increasing")

dev.print(png, 
          filename = "ScatterExampleH.png", 
          width = fig.wt,
          height = fig.ht,
          units = "in", 
          res = 100)

