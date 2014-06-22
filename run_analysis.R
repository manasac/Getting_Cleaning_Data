run_analysis <- function(){
    
    # Read activity labels and features
    act_labels <- read.table("C:/Coursera/GCD/Project/activity_labels.txt")
    feat <- read.table("C:/Coursera/GCD/Project/features.txt")
    
    # Read Test data
    test_subject <- read.table("C:/Coursera/GCD/Project/test/subject_test.txt")
    test_X <- read.table("C:/Coursera/GCD/Project/test/X_test.txt")
    test_y <- read.table ("C:/Coursera/GCD/Project/test/y_test.txt")
    
    # Read Training data
    
    train_subject <- read.table("C:/Coursera/GCD/Project/train/subject_train.txt")
    train_X <- read.table("C:/Coursera/GCD/Project/train/X_train.txt")
    train_y <- read.table ("C:/Coursera/GCD/Project/train/y_train.txt")
    
    # Perform rowbind for all the sets read from Training and Test data
    result_subject <- rbind(test_subject, train_subject)
    result_X <- rbind(test_X, train_X)
    result_y <- rbind(test_y, train_y)
    
    
    names(result_X) <-  feat[,2]
    result_X <- result_X[ ,grep("*-mean()|*-std()", feat[, 2])]
    
    result_y[,2] <- act_labels[result_y[,1],2]
    names(result_y) <- c("ActID", "ActLabel")
    names(result_subject) <- "Subject"
    
    
    # Perform columnbind for all the sets read from Training and Test data
    
    result_set <- cbind(result_subject, result_y, result_X)
    result_data      = melt(result_set, id.vars = c("Subject", "ActID", "ActLabel"))
    
    #write.table(result_set, "result_Dataset.txt")
    
    Cleandata   = dcast(result_data, Subject + ActLabel + ActID  ~ variable, fun=mean)
    
    write.table(Cleandata, "Clean_Dataset.txt")
    
    
    
}