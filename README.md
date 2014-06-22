## Getting and Cleaning Data

  * Using read.table, read all txt files for activity, features, test and training datasets
  
  * Perform rowbind for _subject, _X, _y for Test and Training data.
  
  * Perform columnbind for all the sets read from Training and Test data
  
  * Perform melt function to the resultant dataset according to the id.vars
  
  * Perform dcast function call to get a data frame from the molten data.

