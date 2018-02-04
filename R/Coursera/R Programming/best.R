best<- function(state,outcome){
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
  
  
  lowest<-min(data[data$State==state,c],na.rm = TRUE)     ##calculates the lowest 30-day mortality for the outcome
  as.vector(sort(data$Hospital.Name[data[,c]==lowest&data$State==state])[1])   ##Returns the Hospitals with the lowest
                                                                               ##30-day mortality for the outcome
                                                                               ##If there are more then one hospital
                                                                               ##the names are sorted alphabeticaly
                                                                               ##and the name of the firs one is set as a vector
}