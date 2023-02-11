library(ggthemes)



officer_ind <- subset(officer, OFFICER_RACE = "Other" | OFFICER_RACE = "American Ind")
t1 <- ggplot(officer_ind, aes(OFFICER_YEARS_ON_FORCE)) + geom_histogram()
t1 + facet_grid(OFFICER_RACE~ OFFICER_GENDER)

ggplot(data2, aes(x=factor(OFFICER_GENDER),y=OFFICER_YEARS_ON_FORCE)) + geom_boxplot(aes(fill=OFFICER_GENDER))+theme_few()
ggplot(data2, aes(x=OFFICER_GENDER)) + geom_bar()


ggplot(data2, aes(x=factor(OFFICER_RACE),y=OFFICER_YEARS_ON_FORCE)) + geom_boxplot()
ggplot(data2, aes(x=OFFICER_RACE)) + geom_bar()
attach(data3)


ggplot(data3, aes(FORCE_EFFECTIVE,REASON_FOR_FORCE)) + geom_raster(aes(fill=UOF_level))+theme_few()

ggplot(data3, aes(INCIDENT_DATE, fill=REASON_FOR_FORCE)) + geom_histogram(binwidth = 2)+theme_few()


ggplot(data3, aes(UOF_level)) + geom_density()

table(UOF_level)
c <-ggplot(data3, aes(y=REASON_FOR_FORCE, fill= factor(UOF_level))) + geom_bar()
c + facet_wrap(vars(UOF_level))
                                           
c1 <-ggplot(data3, aes(y=UOF_level, fill= factor(UOF_level))) + geom_bar()
c1 + facet_wrap(vars(REASON_FOR_FORCE))       


data4 <- subset(data3, REASON_FOR_FORCE != "Aggressive Animal" & REASON_FOR_FORCE != "Barricaded Person" & REASON_FOR_FORCE != "Crowd Disbursement" & REASON_FOR_FORCE != "Property Destruction" & SUBJECT_RACE != "American Ind" & SUBJECT_RACE != "Asian" & SUBJECT_RACE != "Other")
data5 <- subset(data3, REASON_FOR_FORCE == "Aggressive Animal" | REASON_FOR_FORCE == "Barricaded Person" | REASON_FOR_FORCE == "Crowd Disbursement" | REASON_FOR_FORCE == "Property Destruction")

ggplot(data4, aes(y=UOF_level,fill= factor(UOF_level),x=..prop.., group=1)) + geom_bar()+facet_grid(SUBJECT_RACE~REASON_FOR_FORCE)+ scale_x_continuous(labels = scales::percent_format())
  #change counts to frequency
ggplot(data5, aes(y=UOF_level, fill= factor(UOF_level))) + geom_bar()+facet_wrap(vars(REASON_FOR_FORCE))


cc <-ggplot(data4, aes(y=UOF_level,fill= factor(UOF_level),x=..prop.., group=1)) + geom_bar()+facet_grid(SUBJECT_RACE~REASON_FOR_FORCE)+ scale_x_continuous(labels = scales::percent_format())
cc
ggplotly(cc)

ggplot(data4, aes(y=REASON_FOR_FORCE,fill= factor(UOF_level),x=..prop.., group=1)) + geom_bar()+facet_grid(SUBJECT_RACE~SUBJECT_GENDER)+ scale_x_continuous(labels = scales::percent_format())

AB<-ggplot(data4, aes(y=REASON_FOR_FORCE,fill= factor(UOF_level))) + geom_bar()+facet_grid(SUBJECT_RACE~SUBJECT_GENDER)
ggplotly(AB)
