showPropOdds <- function(){
  ### Visual for proportions and odds


# Proportion
diagram::openplotmat(mar = c(0.05, 0.05, 0.05, 0.05))

pCol <- viridis::viridis(10)[3]
qCol <- viridis::viridis(10)[8]

#polyon(x = c(0.9, 0.9, 0.8, 0.8),
#       y = c())


# Proportions image
polygon( y = c(0.4, 0.4, 0.3, 0.3),
         x = c(0.1, 0.2, 0.2, 0.1) + 0.1,
         col = pCol)

polygon( y = c(0.2, 0.2, 0.1, 0.1),
         x = c(0.1, 0.2, 0.2, 0.1),
         col = pCol)
polygon( y = c(0.2, 0.2, 0.1, 0.1),
         x = c(0.2, 0.4, 0.4, 0.2),
         col = qCol)


# Odds image
polygon( y = c(0.4, 0.4, 0.3, 0.3),
         x = c(0.6, 0.7, 0.7, 0.6) + 0.1,
         col = pCol)
#polygon( y = c(0.2, 0.2, 0.1, 0.1),
#         x = c(0.6, 0.7, 0.7, 0.6),
#         col = pCol)
polygon( y = c(0.2, 0.2, 0.1, 0.1),
         x = c(0.65, 0.85, 0.85, 0.65),
         col = qCol)

# Vinculums
segments(x0 = 0.05,
         x1 = 0.45,
         y0 = 0.25,
         y1 = 0.25,
         lwd = 2)

segments(x0 = 0.55,
         x1 = 0.95,
         y0 = 0.25,
         y1 = 0.25,
         lwd = 2)


# Text
text(x = 0.25,
     y = 0.5,
     "Proportions")
text(x = 0.75,
     y = 0.5,
     "Odds")


# Top explanation
text(x = 0.15,
     y = 0.85,
     expression(Num.~of~interest*":") )
polygon( y = c(0.8, 0.8, 0.9, 0.9),
         x = c(0.28, 0.38, 0.38, 0.28),
         col = pCol)


text(x = 0.59,
     y = 0.85,
     expression(Num.~bold(not)~of~interest*":") )
polygon( y = c(0.8, 0.8, 0.9, 0.9),
         x = c(0.75, 0.95, 0.95, 0.75),
         col = qCol)

# Divider
abline(h = 0.65, 
       col = "grey")

# Debugging:
#box()
#axis(side = 1)
#axis(side = 2)

}