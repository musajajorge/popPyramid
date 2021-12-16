
rm(list = ls())

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
getwd()

################################################################################

popPER <- readRDS("popPER.RDS")

colnames(popPER) <- c("Year","Sex","Age","Population")

popPER$gAge <- cut(as.numeric(popPER$Age), breaks=seq(0,80,5), right=F, ordered_result=T)
popPER$gAge <- as.character(popPER$gAge)
popPER$gAge <- ifelse(popPER$Age=="80+", "[80, )", popPER$gAge)
popPER$gAge <- ifelse(popPER$gAge=="[0,5)", "[00,05)", popPER$gAge)
popPER$gAge <- ifelse(popPER$gAge=="[5,10)", "[05,10)", popPER$gAge)

popPER <- dplyr::select(popPER, Year, Sex, Age, gAge, Population)

################################################################################

usethis::use_data(popPER, overwrite=TRUE)
