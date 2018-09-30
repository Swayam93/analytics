library(dplyr)
?mtcars
dplyr::filter(mtcars, mpg>25)
dplyr::filter(mtcars, mpg>25 & am == 1 )
filter(mtcars, mpg>25 & am == 1 )

mtcars %>% filter(mpg> 25 & am==1) %>% arrange(wt) %>% summarise(n())
mtcars %>% filter(mpg> 25 & am==1) %>% arrange(wt) %>% count()

count(mtcars)

mtcars %>% group_by(am) %>% summarise(mean(mpg))
mtcars %>% group_by(gear) %>% summarise(mean(wt))
mtcars %>% top_n(5, mpg) %>% arrange(desc(mpg))
