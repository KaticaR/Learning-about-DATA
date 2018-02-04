rankall <- function(outcome, num = "best") {
  data<-read.csv( "outcome-of-care-measures.csv")          ##opens the file
  
  if(outcome=="heart attack"){                             ##sets the column for calculations
    c=11
  } else if(outcome=="heart failure"){
    c=17
  } else if(outcome=="pneumonia"){
    c=23
  } else {
    stop("invalid outcome")                               ##if the outcome is not valide stop the execution and return an error message
  }
  
  data[,c]<-as.numeric(as.character(data[,c]))           ##changes "factor" into "numeric" for the outcome
  NotNa<-!is.na(data[,c])                                 ##take NA from the 30-day mortality rate for given outcome
  
  AllStates<-as.vector(data[!duplicated(data[,7]),7])     ##creates a vector with all the diferent states in it
  hospital<-NULL                                          ##sets the vector for the hospital names
  stat<-NULL                                              ##sets the vector for the state names
  for(i in 1:length(AllStates)){
    
    ST<-data$State==AllStates[i]
    rank<-order(data[ST&NotNa,c],data$Hospital.Name[ST&NotNa],decreasing = FALSE) 
    l<-length(rank)                                                             ##rank Hospitals by 30-day mortality rate using order                                                     
    
    if(num == "best") {                                                         ##decide about the output
      hospital<-c(hospital,as.vector(data$Hospital.Name[ST&NotNa][rank][1]))    ##from sorted names by rank take the first
      stat<-c(stat,AllStates[i])                                                ##and puts it in vector hospital and the state in stat
    } else if(num =="worst") {
      hospital<-c(hospital,as.vector(data$Hospital.Name[ST&NotNa][rank][l]))    ##from sorted names by rank take the last
      stat<-c(stat,AllStates[i])                                                ##and puts it in vector hospital and the state in stat
    } else if(num>l){
      hospital<-c(hospital,NA)
      stat<-c(stat,AllStates[i])
    } else {
      hospital<-c(hospital,as.vector(data$Hospital.Name[ST&NotNa][rank][num]))  ##from sorted names by rank take a rank num
      stat<-c(stat,AllStates[i])                                                ##and puts it in vector hospital and the state in stat
    }
  }
  
  data.frame("Hospital"=hospital,"State"=stat)                          ## Return a data frame with the hospital names and the
                                                                        ## (abbreviated) state name
  
 }