PG <- read.csv("C:\\Users\\pkald\\OneDrive\\Desktop\\Playgrounds.csv")

# SO: SOIL vs RUBBER
with(PG, xtabs(~ + is.na(avgPb) + SampleType))


PGsub <- subset(PG,
                (SampleType == "soil") | (SampleType == "rubber") )


with( PGsub, 
      t.test(avgPb ~ SampleType))

boxplot( avgPb ~ SampleType,
         data = PGsub)

