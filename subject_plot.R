#subject plot
subject <- data[,c(1,12:14,18,19,20,21)]

head(subject)
# subject_id -> numerical
# genre -> categorical
# race -> categorical
# description -> descriptive
# offense -> categorical
table(duplicated(subject$SUBJECT_ID))
table(duplicated(subject$LOCATION_LATITUDE))
table(duplicated(subject$LOCATION_LONGITUDE))
# duplicated subject_id, counts wont work, change to unique 
subject <- unique(subject)

subject = subject[!duplicated(subject$SUBJECT_ID),]

attach(subject)
table(SUBJECT_RACE)
table(SUBJECT_GENDER)
table(SUBJECT_DESCRIPTION)
table(SUBJECT_OFFENSE)


B <- ggplot(subject, aes(x=SUBJECT_RACE, y=SUBJECT_DESCRIPTION)) + geom_jitter(aes(color=factor(SUBJECT_DESCRIPTION)))
B + facet_grid(SUBJECT_GENDER~.)
A <- ggplot(subject, aes(x=SUBJECT_RACE, fill= factor(SUBJECT_RACE))) + geom_bar()
A + facet_grid(SUBJECT_GENDER~.)

ggplot(subject, aes(y=SUBJECT_DESCRIPTION, fill=SUBJECT_DESCRIPTION)) + geom_bar()

p = ggplot(subject,aes(y=SUBJECT_RACE,x=SUBJECT_GENDER))+geom_jitter(aes(color=SUBJECT_RACE))
p + facet_wrap(vars(SUBJECT_DESCRIPTION))       


#subject offense
SUB1 = separate_rows(subject,SUBJECT_OFFENSE ,sep=",")
SUB1$SUBJECT_OFFENSE <- tolower(SUB1$SUBJECT_OFFENSE)

table(SUB1$SUBJECT_OFFENSE)
for (i in 1:3009){
  SUB1[i,"SUBJECT_OFFENSE"] <- trimws(SUB1[i,"SUBJECT_OFFENSE"])
}

ggplot(SUB1, aes(y=SUBJECT_OFFENSE))+geom_bar()

subject %>%
  leaflet() %>%
  addTiles() %>%
  addProviderTiles("Stamen.Toner") %>%
  addCircleMarkers(lng =~LOCATION_LONGITUDE, lat=~LOCATION_LATITUDE,popup = ~SUBJECT_OFFENSE, clusterOptions = markerClusterOptions())

