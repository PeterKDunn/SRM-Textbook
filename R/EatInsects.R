

Education <- c("No Uni",
               "No Uni", 
               "Uni", 
               "Uni")
Insects <- c("No",
             "Yes",
             "No",
             "Yes")
Counts <- c(165,
            81,
            223,
            132)
EatInsects <- data.frame(Education = Education,
                         Insects = Insects,
                         Counts = Counts)

EatInsects.tab <- xtabs( Counts ~ Education + Insects,
                         data = EatInsects)

barplot( t(EatInsects.tab),
         las = 1,
         ylim = c(0, 400),
         main = "Eating of insects and\nuniversity education",
         xlab = "Education",
         ylab = "No. people")



