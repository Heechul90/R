# 문제 1
head(mpg)
ggplot(mpg, aes(x= cty, y= hwy)) +
  geom_point(position = 'jitter')


# 문제 2
head(midwest)
midwest2 <- midwest %>%
  filter(poptotal <= 5e5 | popasian <=1e4) %>%
  select(poptotal, popasian)
midwest2

ggplot(midwest2, aes(x=poptotal, y= popasian)) +
  geom_point(position = 'jitter')


# 문제 3
mpg3 <- mpg %>%
  filter(class == 'suv') %>%
  group_by(manufacturer) %>%
  summarise(cty_mean = mean(cty)) %>%
  arrange(desc(cty_mean))
mpg3

ggplot(mpg3, aes(reorder(manufacturer, -cty_mean), y= cty_mean, fill= manufacturer)) +
  geom_bar(stat = 'identity')


# 문제 4
head(mpg)
View(mpg)
mpg4 <- mpg %>%
  group_by(class) %>%
  summarise(class_n = n())
mpg4  

ggplot(mpg4, aes(reorder(class, -class_n), y= class_n, fill= class)) +
  geom_bar(stat = 'identity')


# 문제 5
str(economics)
head(economics)

ggplot(economics, aes(x=date, y= psavert)) +
  geom_line()


# 문제 6
mpg6 <- mpg %>%
  filter(class %in% c('compact', 'subcompact', 'suv')) %>%
  group_by(class) %>%
  summarise(cty_mean = mean(cty))
mpg6

ggplot(mpg6, aes(x= class, y= cty_mean, fill= class)) +
  geom_bar(stat = 'identity')


## 문제 7
str(diamonds)
head(diamonds)

# 문제 7-1
ggplot(diamonds, aes(x=cut, y='')) +
  geom_col()

# 문제 7-2
ggplot(diamonds, aes(x= cut, y= price)) +
  goem_col()

# 문제 7-3
ggplot(diamonds, aes(x= color, y= price)) +
  geom_line()
