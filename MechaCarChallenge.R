library(dplyr)

#deliverable1----
df <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=df)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=df))


#deliverable2----
suspension <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
total_summary <- suspension %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create summary table
lot_summary <- suspension %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep') #create summary table

#deliverable3----
t.test(suspension$PSI,mu=1500) #compare sample versus population means

#Individual Lots
t.test(suspension[suspension$Manufacturing_Lot=="Lot1",]$PSI,mu=1500)
t.test(suspension[suspension$Manufacturing_Lot=="Lot2",]$PSI,mu=1500)
t.test(suspension[suspension$Manufacturing_Lot=="Lot3",]$PSI,mu=1500)