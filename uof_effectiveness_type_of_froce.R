data2 <- data
data2[data2 == ""] = NA
attach(data2)
data2 <-
  data2 %>%
  unite(TYPE_OF_FORCE_USED, c(24:33), remove = F, sep=',',na.rm=T)


#data3
data2 <- data2[,-c(25:34)]
data3 <- separate_rows(data2, UOF_NUMBER, TYPE_OF_FORCE_USED, FORCE_EFFECTIVE,sep=",")
table(data3$TYPE_OF_FORCE_USED)
attach(data3)
data3$TYPE_OF_FORCE_USED <- tolower(data3$TYPE_OF_FORCE_USED)
#https://nij.ojp.gov/topics/articles/use-force-continuum
#USE of force continuum
lethal_force= c("weapon display at person","weapon display")
less_lethal_methods = tolower(c("K-9 deployment", "Baton display", "baton strike/closed mode", "baton strike/open mode", "BD - grabbed", "BD - pushed", "BD - tripped", "OC spray", "Other impact weapon", "pepperball impact", "pepperball saturation", "Taser", "Taser display at person", "taser", "taser display at person"))
Empty_hand_submission_hard_technique= tolower(c("Feet/Leg/Knee Strike", "Hand/Arm/Elbow Strike"))
Empty_hand_submission_soft_technique= tolower(c("combat stance", "Hand Controlled Escort", "Handcuffing Take Down",  "Held Suspect Down", "Joint Locks","Leg Restraint System", "LVNR", "pressure points", "take down - Arm", "Take down - Body", "Take down - group", "Take down - head"))
verbal_direction= c("verbal command")

data3 <- data3 %>% mutate(UOF_level=
                   case_when(TYPE_OF_FORCE_USED %in% verbal_direction ~ 1,
                             TYPE_OF_FORCE_USED %in% Empty_hand_submission_hard_technique ~ 3,
                             TYPE_OF_FORCE_USED %in% Empty_hand_submission_soft_technique ~ 2,
                             TYPE_OF_FORCE_USED %in% less_lethal_methods ~ 4,
                             TYPE_OF_FORCE_USED %in% lethal_force ~ 5))

