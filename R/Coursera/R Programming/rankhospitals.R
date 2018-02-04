rankhospital<- function(state,outcome, num = "best"){
  data<-read.csv( "outcome-of-care-measures.csv")          ##opens the file
  
  if(!any(data$State==state)) stop("invalid state")        ##if the state is not valide stop the execution and return an error message
  if(outcome=="heart attack"){                             ##sets the column for calculations
    c=11
  } else if(outcome=="heart failure"){
    c=17
  } else if(outcome=="pneumonia"){
    c=23
  } else {
    stop("invalid outcome")                               ##if the outcome is not valide stop the execution and return an error message
  }
  
  data[,c]<-as.numeric(as.character(data[,c]))            ##changes "factor" into "numeric" for the outcome
  NotNa<-!is.na(data[,c])
  
  rank<-order(data[data$State==state&NotNa,c],data$Hospital.Name[data$State==state&NotNa],decreasing = FALSE)
  l<-length(rank)                                         ##rank Hospitals by 30-day mortality rate using order
  
  if(num == "best") {                                     ##decide about the output
    as.vector(data$Hospital.Name[data$State==state&NotNa][rank][1]) ##from sorted names by rank take the first
  } else if(num =="worst") {
    as.vector(data$Hospital.Name[data$State==state&NotNa][rank][l]) ##from sorted names by rank take the last
    } else if(num>l){
      NA
    } else {
      hospital<-as.vector(data$Hospital.Name[data$State==state&NotNa][rank][1:num]) ##from sorted names by rank take a rank num
      rates<-data[data$State==state&NotNa,c][rank][1:num] 
      data.frame(HOSPITAL=hospital,RATES=rates)
    }
}