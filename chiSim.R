chiSim <- function(numSim = 10000, seed = NA){
  
  if ( is.na(seed) ){
    seed <- sample(1:100000, 1)
    cat("SEED:", seed, "\n")
  } else {
    set.seed(seed)
  }
  
  chi2 <- z <- countBL <- OR <- pDiff <- array(dim = numSim)
  
  expTL <-  54 * 157 / 183
  expTR <- 129 * 157 / 183
  expBL <-  26 *  54 / 183
  expBR <-  26 * 129 / 183
  
  expTable <- array( data = c(expTL, expTR,
                              expBL, expBR),
                     dim = c(2, 2))
  obsTable <- array(dim = c(2, 2))
  
  for (i in 1:numSim) {
    countBL[i]  <- sample(0:26,
                          1)
    #countBL[i]  <- rpois(1, 
    #                     lambda = expBL)
    countBR <-  26 - countBL[i]
    countTL <-  54 - countBL[i]
    countTR <- 157 - countTL
    
    obsTable <- array( data = c(countTL,    countTR,
                                countBL[i], countBR),
                       dim = c(2, 2))
    
    
    OR[i] <- (obsTable[2, 1] / obsTable[1, 1]) / (obsTable[2, 2] / obsTable[1, 2])
    pDiff[i] <- obsTable[1, 1] / sum( obsTable[1:2, 1] ) - 
                obsTable[1, 2] / sum( obsTable[1:2, 2] )
    
    flag <- FALSE
    if (any( (countBR == 0) | (countTL == 0) | (countTR == 0) | (countBL[i] == 0) ) ) {
      cat("Zero: i=",i,"\n")
      flag <- TRUE 
    }
    if (any( (countBR < 0) | (countTL < 0) | (countTR < 0) | (countBL[i] < 0) ) ) {
      cat("Negative: i=",i,"\n")
      flag <- TRUE 
    }
    if (any( is.na(countBR) | is.na(countTL) | is.na(countTR) | is.na(countBL[i]) ) ) {
      cat("NA: i=",i,"\n")
      flag <- TRUE 
    }
    if (any( is.infinite(countBR) | is.infinite(countTL) | is.infinite(countTR) | is.infinite(countBL[i]) ) ) {
      cat("INF: i=",i,"\n")
      flag <- TRUE 
    }
    
   # if ( !flag ) {
      
      chi2[i] <- sum( ( (expTable - obsTable)^2 ) / expTable )
      
      p1 <- countTL/(countBL[i] + countTL)
      p2 <- countTR/(countBR + countTR)
      signZ <- sign(p1 - p2)
      
      z[i] <-  sqrt( sum( ( (expTable - obsTable)^2 ) / expTable ) ) * signZ
      #cat("i, chi, z:", i, chi2[i], z[i], "\n")
    #}
    
  }
  par(mfrow  = c(2, 2))
  hist( OR )
  hist( log(OR), 
        breaks = seq(-5, 5, by = 1) )
  hist(pDiff,
       breaks = seq(-1, 1, by = 0.2))
  
#  useThese <- !is.infinite(z) & !is.na(z) 
#  hist( z[  useThese ], 
#        breaks = seq(-6, 6, by = 0.5) )

  return( list(chi2 = chi2, 
               z = z,
               OR = OR,
               pDiff = pDiff,
              # use = useThese,
               seed = seed) )
  
}