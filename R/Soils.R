CN <- read.csv("C:\\Users\\pkald\\OneDrive\\Desktop\\SoilsCN.csv")



diffN <- CN$TotalNI - CN$TotalNNonI


# A usweful stemplot, and one where we need -1 | 8 means -0.18
stem(diffN) 
hist(diffN)

# Regression/correlation

plot(CN) # Many look linear

plot( CN$TotalCI, CN$TotalNI)
abline(lm(CN$TotalNI ~ CN$TotalCI))

# PAIRED
