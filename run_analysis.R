library(tidyr)
library(dplyr)
features <- read.table("features.txt")
label <- read.table("activity_labels.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")
colnames(subject_test)<- "subjid"

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")
colnames(subject_train) <- "subjid"

x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)
subjid <- rbind(subject_train, subject_test)

colnames(x_all) <- features[,2]
colnames(y_all) <- "label"

x_mean_sd <- x_all[,grepl("mean", names(x_all))|grepl("std", names(x_all))]
xy_mean_sd <- cbind(subjid,y_all,x_mean_sd)

vlabel <- label[,2]
xy_mean_sd$label <- vlabel[xy_mean_sd$label]

dat2 <- do.call("rbind",lapply(c(3:ncol(xy_mean_sd)),function(x) {
    tapply(xy_mean_sd[,x], xy_mean_sd[,1:2], mean)
}))
ft <- rep(names(xy_mean_sd)[-(1:2)], each = 30)
sb <- rownames(dat2)
dat3 <- as.data.frame(cbind(sb, ft, dat2))
dat4 <- arrange(gather(dat3, test, value, -(sb:ft)),sb,ft,test)
