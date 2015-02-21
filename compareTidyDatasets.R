fileURL <- "https://s3.amazonaws.com/coursera-uploads/user-3fb4c803aacb94770fd872db/973498/asst-3/bc29cb20b5d311e4b768370a143eec8d.txt"
download.file(fileURL,"tidydata2.txt")
x <- read.table("tidydata2.txt")
y <- read.table("tidydata.txt")
identical(x,y)