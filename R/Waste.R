WS <- read.csv("C:\\Users\\pkald\\OneDrive\\Desktop\\Waste.csv",
               skip = 3)



# Where are the data sizes useful?
xtabs(~ is.na(WS$Summer1) + WS$Location)
xtabs(~ is.na(WS$Summer2) + WS$Location)

xtabs(~ is.na(WS$Spring1) + WS$Location)
xtabs(~ is.na(WS$Spring2) + WS$Location)

xtabs(~ is.na(WS$Winter1) + WS$Location)
xtabs(~ is.na(WS$Winter2) + WS$Location)

xtabs(~ is.na(WS$Fall1) + WS$Location) ###### Best nr = 29, nu = 20
xtabs(~ is.na(WS$Fall2) + WS$Location)



# Try using a weekly 
boxplot(WS$Fall2 ~ WS$Location)

