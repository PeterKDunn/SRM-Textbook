CN <- read.csv("C:\\Users\\pkald\\OneDrive\\Desktop\\SoilsCN.csv")

# A useful stemplot, and one where we need 2 | 4 means 0.24
stem(CN$TotalNNonI)


# Regression/correlation

plot(CN) # Many look linear

plot( CN$TotalCI, CN$TotalNI)
abline(lm(CN$TotalNI ~ CN$TotalCI))

# PAIRED
t.test( CN$TotalCI, CN$TotalCNonI, paired=TRUE)

t.test( CN$TotalNI, CN$TotalNNonI, paired=TRUE)


diffN <- CN$TotalNI - CN$TotalNNonI


stem(diffN) 
hist(diffN)
