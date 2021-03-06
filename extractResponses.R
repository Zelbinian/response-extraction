#
# Extract responses will take a csv file (from a Google Sheet), representing
# survey responses, and split each response into an individual, standalone file
#
# Put together with much help from stack exchage
# http://stackoverflow.com/questions/30248776/how-to-sequentially-go-through-every-row-and-then-every-column-in-an-r-data-fram
#
# @dir - The directory the files should be placed in
# @csv - The data to read from
#
extractResponses <- function(outputName = "response", dir, csv) {
    
    # reading the data in as a matrix so we can make the data row-wise
    data <- as.matrix(read.csv(csv))
    
    # the output from Google Sheets makes colnames hard to read, this fixes it
    colnames(data) <- gsub(".", " ", colnames(data), fixed = TRUE)
    
    for(row in 1:nrow(data)) {
        # makes use of recycling in R to match up the column names (the questions) with
        # each row of responses
        fileData <- paste(colnames(data), "------", data[row,], sep = "\n")
        fileName <- paste0(dir,'/',outputName,row,".txt")
        cat(fileData, file = fileName, sep = "\n\n")
    }
    
    # makes use of recycling in R to match up the column names (the questions) with
    # each row of responses
    #dataByRow <- paste(colnames(data), "-------", t(data), sep = "\n")
    
}