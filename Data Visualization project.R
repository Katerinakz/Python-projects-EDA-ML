econ <- read.csv("Economist_Assignment_Data.csv")
head(econ)

#Use ggplot() + geom_point() to create a scatter plot object called pl. 
pl <- ggplot(econ, aes(x=CPI, y=HDI)) +geom_point(aes(color=Region))
pl


#Change the points to be larger empty circles.
pl <- ggplot(econ, aes(x=CPI, y=HDI)) +geom_point(aes(color=Region),
                                                  size=5, shape=1) +
  geom_smooth(aes(group=1), method="lm", formula="y ~log(x)", 
              se=FALSE, color="red")
pl

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl2 <- pl + geom_text(aes(label = Country), color = "gray20", 
                       data = subset(econ, Country %in% pointsToLabel),check_overlap = TRUE)

pl2

pl3 <- pl2+theme_bw()+ 
  scale_x_continuous(name="Corruption Perceptions Index, 2011 (10=least corrupt)",
                     limits=c(1,10), breaks = 1:10) +
  scale_y_continuous(name="Human Development Index, 2011 (1=Best)", 
                     limits = c(0.2,1))

pl3
