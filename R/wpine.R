### https://nph.onlinelibrary.wiley.com/doi/full/10.1002/ppp3.10410

#' @article{offord2023home,
#'   title={Home gardens contribute to conservation of the critically endangered Wollemi Pine: Evaluation of a botanic garden-led horticultural release programme},
#'   author={Offord, Catherine A and Zimmer, Heidi C},
#'   journal={Plants, people, planet},
#'   year={2023},
#'   publisher={Wiley Online Library}
#' }
#' 

wp <- read.csv("Data/wpine.csv")

wp2 <- subset(wp, (soil == "Sandy") | (soil == "Loamy"))

wp2$growthRate <- with(wp2,
                      (final_height_.cm. - as.numeric(start_height..cm.)) / (2023 - start_year) )

boxplot(growthRate ~ soil, 
        data = wp2)

boxplot(growthRate ~ soil, 
        data = subset(wp2,in_pot_or_ground == "ground") )


t.test( wp2$growthRate[wp2$soil=="Sandy"], wp2$growthRate[wp2$soil=="Loamy"])



table( subset(wp, in_pot_or_ground == "ground")$soil )



