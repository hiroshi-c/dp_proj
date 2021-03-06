setwd("g:/hiroshi/DataScience/dp_proj/deck")

# This block includes all common operations.
library(reshape2)

asCleanNumeric <- function(x){
  x <- as.numeric( sub("\\(r[0-9\\.]*\\)", "",  as.character(x)) )
  return(x)
}

PEP2014 <- read.csv("../population2/PEP_2014_PEPANNRES_with_ann.csv", sep=",", quote="\"", header = TRUE)
PEP2014Columns <- names(PEP2014) %in% c("GEO.id", "GEO.display.label", "resbase42010", "respop72014")
PEP2014 <- PEP2014[PEP2014Columns]
colnames(PEP2014) <- c("id", "name", "base20100401",  "population20140701")
PEP2014NumericColumns <- seq(3, ncol(PEP2014), 1)
PEP2014[ ,PEP2014NumericColumns] <- apply(PEP2014[ ,PEP2014NumericColumns], 2, asCleanNumeric)
PEP2014$growthRate <- with(PEP2014, (population20140701 / base20100401) ^ (1/4.25) - 1)

SF1_QTP1 <- read.csv("../demographic2/DEC_10_SF1_QTP1_with_ann.csv", sep=",", quote="\"", header = TRUE)
QTP1Columns <- names(SF1_QTP1) %in% c("GEO.id", "SUBHD0101_S01", "SUBHD0102_S01",
                                      "SUBHD0101_S02", "SUBHD0101_S03", "SUBHD0101_S04", "SUBHD0101_S05", "SUBHD0101_S06", "SUBHD0101_S07",
                                      "SUBHD0101_S08", "SUBHD0101_S09", "SUBHD0101_S10", "SUBHD0101_S11", "SUBHD0101_S12", "SUBHD0101_S13",
                                      "SUBHD0101_S14", "SUBHD0101_S15", "SUBHD0101_S16", "SUBHD0101_S17", "SUBHD0101_S18", "SUBHD0101_S19", "SUBHD0101_S20")
SF1_QTP1 <- SF1_QTP1[QTP1Columns]
colnames(SF1_QTP1) <- c("id", "total.population", "male",
                        "age0.4", "age5.9", "age10.14", "age15.19", "age20.24", "age25.29",
                        "age30.34", "age35.39", "age40.44", "age45.49", "age50.54", "age55.59",
                        "age60.64", "age65.69", "age70.74", "age75.79", "age80.84", "age85.89", "age90.over" )
QTP1NumericColumns <- seq(2, ncol(SF1_QTP1), 1)
SF1_QTP1[ ,QTP1NumericColumns] <- apply(SF1_QTP1[ ,QTP1NumericColumns], 2, asCleanNumeric)

SF1_QTP3 <- read.csv("../demographic2/DEC_10_SF1_QTP3_with_ann.csv", sep=",", quote="\"", header = TRUE)
QTP3Columns <- names(SF1_QTP3) %in% c("GEO.id", "HD01_S03", "HD01_S04", "HD01_S05", "HD01_S10", "HD01_S18", "HD01_S23", "HD01_S24")
SF1_QTP3 <- SF1_QTP3[QTP3Columns]
colnames(SF1_QTP3) <- c("id", "rWhite", "rBlack.AfricanAmerican", "rAmericanIndian.AlaskaNative", "rAsian", "rNativeHawaiian.OtherPacificIslander", "rOther", "rMultiple" )
QTP3NumericColumns <- seq(2, ncol(SF1_QTP3), 1)
SF1_QTP3[ ,QTP3NumericColumns] <- apply(SF1_QTP3[ ,QTP3NumericColumns], 2, asCleanNumeric)

SF1_QTP11 <- read.csv("../demographic2/DEC_10_SF1_QTP11_with_ann.csv", sep=",", quote="\"", header = TRUE)
QTP11Columns <- names(SF1_QTP11) %in% c("GEO.id", "HD01_S01", "HD01_S02", "HD01_S11", "HD01_S12",  "HD01_S13", "HD01_S14", "HD01_S15",  "HD01_S16", "HD01_S17")
SF1_QTP11 <- SF1_QTP11[QTP11Columns]
colnames(SF1_QTP11) <- c("id", "total.households", "family.households", "h.1person", "h.2person", "h.3person", "h.4person", "h.5person", "h.6person", "h.7person.more")
QTP11NumericColumns <- seq(2, ncol(SF1_QTP11), 1)
SF1_QTP11[ ,QTP11NumericColumns] <- apply(SF1_QTP11[ ,QTP11NumericColumns], 2, asCleanNumeric)

ECN <- read.csv("../economic2/ECN_2012_US_00A1_with_ann.csv", sep=",", quote="\"", header = TRUE)

# This data includes mutliple levels of industry categories. Includes only top level cateogries.
targetCategory <- function(x){
  x <- as.character(x)
  return (x %in% c("22", "31-33", "42", "44-45", "48-49(104)", "51", "52", "53", "54", "56", "61", "62", "71", "72", "81"))
}
ECN <- ECN[targetCategory(ECN$NAICS.id), ]

# Filter out rows where OPTAX.id is T(subject to federal income tax) and Y(exempt from federal income tax). Those are subdivisions of A(All).
ECN <- ECN[!(ECN$OPTAX.id %in% c("T", "Y")), ]

# Filter columns
ECNColumns <- names(ECN) %in% c("GEO.id", "NAICS.display.label", "PAYANN", "EMP")
ECN <- ECN[ECNColumns]
colnames(ECN) <- c("id", "industry", "payroll", "employee")
ECNNumericColumns <- seq(3, ncol(ECN), 1)
ECN[ ,ECNNumericColumns] <- apply(ECN[ ,ECNNumericColumns], 2, asCleanNumeric)

# Generate two subtables as the original table is melted format.
Payroll <- dcast(ECN, id ~ industry, value.var = 'payroll')
colnames(Payroll) <- lapply(colnames(Payroll), function(x) paste("Pyr.", gsub("[ ,()]", ".", x), sep=""))
Employee <- dcast(ECN, id ~ industry, value.var = 'employee')
colnames(Employee) <- lapply(colnames(Employee), function(x) paste("Emp.", gsub("[ ,()]", ".", x), sep=""))

# Many entries are unavailable because the sample count is too small to anonymize individual business. '0' is set for those entries.
Payroll[is.na(Payroll)] <- 0
Employee[is.na(Employee)] <- 0

# Concatenate all sub tables into one.
data1 <- PEP2014[ , c("id", "name", "growthRate")]
data2 <- merge(data1, SF1_QTP1, by.x="id", by.y="id", all=FALSE)
data3 <- merge(data2, SF1_QTP3, by.x="id", by.y="id", all=FALSE)
data4 <- merge(data3, SF1_QTP11, by.x="id", by.y="id", all=FALSE)
data5 <- merge(data4, Payroll, by.x="id", by.y="Pyr.id", all=FALSE)
data6 <- merge(data5, Employee, by.x="id", by.y="Emp.id", all=FALSE)
data <- data6

for (c in seq(5, ncol(data), 1)) {
  data[ , c] <- apply(data[ , c(4, c)], 1, function(x) x[2]/x[1])
}

outliers <- which(data$name %in% c("McKenzie County, North Dakota", "Williams County, North Dakota"))
finalData <- data[-outliers, ]

library(MASS)
initialFit <- lm(growthRate ~ . - id - name, data=finalData)
fit <- stepAIC(initialFit, direction="both")

summary(fit)$adj.r.squared
interestingPoints <- finalData[c(1973, 1991, 2003, 317, 529, 202), ]

#plot(fit)

saveRDS(fit, file="../shiny/model.rds")

distribution <- finalData[ , c("id", "growthRate")]
saveRDS(distribution, file="../shiny/distribution.rds")

#kingCountyAbsolute <- data6[which(data6$name == "King County, Washington"), ]
#kingCountyRelative <- data[which(data$name == "King County, Washington"), ]


testdata <- as.data.frame(finalData[which(finalData$name == "King County, Washington"), ])
predict(fit, newdata = testdata, level=0.95, interval = "prediction")

testdata2 <- finalData[which(finalData$name == "King County, Washington"), ]
prr2 <- predict(initialFit, testdata2, invertval = "prediction")


