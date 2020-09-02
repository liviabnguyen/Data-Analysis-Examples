setwd("~/desktop")
library(ggplot2)
#install.packages("dplyr")
library(dplyr)
#install.packages("glue")
df <- read.delim(file = "file.txt", header= TRUE)
head(df)
#summary(df)
#str(df)
density(df$PC1)
plot(density(df$PC1))
ggplot(df, aes(PC1)) + geom_density(fill="blue", alpha =.8) + labs(x = "PC1", y = "Density")



# data %>%
  filter(PC1<.90) %>%
  ggplot( aes(x=PC1)) +
    geom_density(fill="#69b3a2", color="#e9ecef", alpha=0.8)

p <- ggplot(data=df, aes(chol$PC1)) + geom_histogram()

#rm(list = ls()) #clears environment
