
counts <- array( dim=c(4, 2))

for (varR1 in (0:43)) {
  for (varR2 in (0:43)) {
    for (varR4 in (0:59)) {
      
      counts[1, 1] <- 46 - varR1
      counts[1, 2] <- varR1
      
      counts[2, 1] <- 59 - varR2
      counts[2, 2] <- varR2
      
      counts[4, 1] <- 59 - varR4
      counts[4, 2] <- varR4
      
      counts[3, 1] <- 246 - counts[1, 1] - counts[2, 1] - counts[4, 1]
      counts[3, 2] <-  43 - counts[1, 2] - counts[2, 2] - counts[4, 2]
      
      if ( all(counts > 0)) {
        out <- chisq.test(counts)
        if (  abs(out$statistic - 2.658) < 0.003 ) {
          cat( varR1, varR2, varR4, " -> ", out$statistic, "\n")
          stop()
        }
        
      }
    }
  }
}


