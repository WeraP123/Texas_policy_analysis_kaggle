library(dplyr)
library(dsEssex)
library(ggplot2)
library(leaflet)
library(hablar)
library(tidyr)
library(tidyverse)
library(ggcorrplot)
library(plotly)
library(htmlwidgets)
load("data.RData")

summary(data)
head(data)
data <- data[, -c(20:31,46)]
data[data == "NULL"] = NA
table(data$SUBJECT_GENDER)
data <- subset(data, SUBJECT_GENDER != "Unknown" & SUBJECT_ID != 0 & OFFICER_ID != 0)
data$INCIDENT_TIME <- format(as.POSIXct(data$INCIDENT_TIME,format='%I:%M:%S %p'), format="%H:%M:%S")
data$OFFICER_HIRE_DATE <- as.Date(data$OFFICER_HIRE_DATE, format = "%m/%d/%y")
data$INCIDENT_DATE <- as.Date(data$INCIDENT_DATE, format = "%m/%d/%y")
data <- data[complete.cases(data),]

attach(data)
table(SUBJECT_GENDER)


#injuries_spellings = c("no injuries", "no injuries visible", "no visible injuries","none" )
#data <- data %>% mutate(SUBJECT_INJURY_TYPE=
#                          case_when(SUBJECT_INJURY_TYPE %in% injuries_spellings ~ "no injuries noted or visble"))
                                     
sapply(data, class)
attach(data)

table(duplicated(SUBJECT_ID))
table(duplicated(UOF_NUMBER))
table(duplicated(OFFICER_ID))


# all of the rows are unque: UOF_Number: 55 duplicates, they are like an index for the given case of use of force by one officer, it can descibe use of force
# on many subjects during one incident. If another officer joins to help on the same incident then it is a different UOF to be reported for called officer
# incident can be uniquely identifed by combining: data, time and same lattidute and longitude.
# Therefore there are no duplicated in the subjects ID for an one incident
