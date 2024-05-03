numSim <- 10000

chi2 <- countBL <- array(dim = numSim)

expTL <-  54 * 157 / 183
expTR <- 129 * 157 / 183
expBL <-  26 *  54 / 183
expBR <-  26 * 129 / 183

expTable <- array( data = c(expTL, expTR,
                            expBL, expBR),
                   dim = c(2,2))

for (i in 1:numSim) {
  countBL[i]  <- sample(0:26,
                        1,
                        replace = TRUE)
  countBR <-  26 - countBL[i]
  countTL <-  54 - countBL[i]
  countTR <- 157 - countTL
  
  obsTable <- array( data = c(countTL,    countTR,
                              countBL[i], countBR),
                     dim = c(2,2))
  
  chi2[i] <- sum( ( (expTable - obsTable)^2 ) / expTable )
  
}

hist( log(chi2) )
