# Anscombe's Quartet
# 기술통계량(평균(x), 평균(y), 분산(x), 분산(y), 상관계수, 회귀식)이 동일한 4개의 데이터 셋셋

anscombe

# 평균(mean)
ans_x_mean <- anscombe %>%
  select(x1, x2, x3, x4) %>%
  summarise_each(funs(mean), x1, x2, x3, x4)
ans_x_mean

ans_y_mean <- anscombe %>%
  select(y1, y2, y3, y4) %>%
  summarise_each(funs(mean), y1, y2, y3, y4)
ans_y_mean

# 분산(var)
ans_x_var <- anscombe %>%
  select(x1, x2, x3, x4) %>%
  summarise_each(funs(var), x1, x2, x3, x4)
ans_x_var

ans_y_var <- anscombe %>%
  select(y1, y2, y3, y4) %>%
  summarise_each(funs(var), y1, y2, y3, y4)
ans_y_var

# 상관계수(cor)- 미완성 나중에 다시
ans_x_cor <- anscombe %>%
  select(x1, x2, x3, x4) %>%
  summarise_each(funs(cor), x1, x2, x3, x4)
ans_x_cor

ans_y_cor <- anscombe %>%
  select(y1, y2, y3, y4) %>%
  summarise_each(funs(cor), y1, y2, y3, y4)
ans_y_cor

# 회귀분석(cor)- 미완성 나중에 다시
ans_x_cor <- anscombe %>%
  select(x1, x2, x3, x4) %>%
  summarise_each(funs(cor), x1, x2, x3, x4)
ans_x_cor

ans_y_cor <- anscombe %>%
  select(y1, y2, y3, y4) %>%
  summarise_each(funs(cor), y1, y2, y3, y4)
ans_y_cor


