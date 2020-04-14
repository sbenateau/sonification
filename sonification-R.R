# Test sonification with R

# Not available for R 3.6
install.packages("playitbyr")

install.packages("sonify")
library(sonify)


# example data
x <- 1:100
exp <- exp(x)
ln <- log(x)
sin <- sin(x/10)
corr = x + runif(100,min = -10, max = 10 )
plotToSound <- list(x,exp,ln,sin,corr)


test <- sample(1:length(plotToSound))
for (i in 1:length(plotToSound)) {
  obj = sonify(plotToSound[[test[i]]], duration=4, play=FALSE, tick = TRUE, tick_len = .02)
  writeWave(obj, paste("testFile",i,".waw"), extensible = TRUE)
}

par(mfrow=c(2,3))
test <- sample(1:length(plotToSound))
for (i in 1:length(plotToSound)) {
  plot(plotToSound[[test[i]]])
}

install.packages('spotifyr')
?sonify
