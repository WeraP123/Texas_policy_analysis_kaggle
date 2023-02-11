# officer analysis

officer <- data[,c(4:8)]
head(officer)
# officer_id -> numerical
# genre -> categorical
# race -> categorical
# hire_date -> date
# years on force -> ordinal
table(duplicated(OFFICER_ID))
# duplicated officer_id, counts wont work, change to unique 
officer <- unique(officer)
table(OFFICER_RACE)

g <- ggplot(officer, aes(y=OFFICER_GENDER, fill= OFFICER_GENDER)) + geom_bar()
g
A <- ggplot(officer, aes(y=OFFICER_RACE, fill= OFFICER_RACE)) + geom_bar()
A
t <- ggplot(officer_ind_other, aes(OFFICER_YEARS_ON_FORCE)) + geom_histogram()


officer_ind_other <- subset(officer, OFFICER_RACE != "Other" & OFFICER_RACE != "American Ind")
t + facet_grid(OFFICER_GENDER~ OFFICER_RACE)
ggplot(officer, aes(OFFICER_RACE,OFFICER_YEARS_ON_FORCE))+ geom_boxplot(aes(fill=OFFICER_GENDER))
ggplot(officer, aes(OFFICER_GENDER,OFFICER_YEARS_ON_FORCE))+ geom_boxplot(aes(fill=OFFICER_RACE))
t + facet_grid(OFFICER_RACE~ OFFICER_GENDER)
A + facet_grid(OFFICER_GENDER~.)

ggplot(officer,aes(OFFICER_HIRE_DATE,OFFICER_GENDER))+geom_jitter(aes(color=OFFICER_RACE))
a <- ggplot(officer,aes(OFFICER_HIRE_DATE,OFFICER_RACE))+geom_jitter(aes(color=OFFICER_RACE))
a + facet_grid(OFFICER_GENDER~.)
ggplot(officer,aes(OFFICER_GENDER,OFFICER_HIRE_DATE))+geom_jitter(aes(color=OFFICER_RACE))
ggplot(officer,aes(OFFICER_RACE,OFFICER_HIRE_DATE))+geom_jitter(aes(color=OFFICER_GENDER))


