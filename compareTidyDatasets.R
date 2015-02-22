#used for comparison purposes

fileURL <- "https://s3.amazonaws.com/coursera-uploads/user-3fb4c803aacb94770fd872db/973498/asst-3/1122ce70badd11e48b1f2bd9dc31ebea.txt"
download.file(fileURL,"tidydata2.txt")
x <- read.table("tidydata2.txt", header=TRUE)
y <- read.table("tidydata.txt", header=TRUE)
print(identical(x,y))



