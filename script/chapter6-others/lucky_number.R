library(tidyverse)
library(mailR)

lucky_num <- sample(0:9, 1) %>% 
  switch(
    "0" = "Zero",
    "1" = "One",
    "2" = "Two",
    "3" = "Three",
    "4" = "Four",
    "5" = "Five",
    "6" = "Six",
    "7" = "Seven",
    "8" = "Eight",
    "9" = "Nine"
  ) # Extract & Transform

send.mail(from = "lt.lovetoken@gmail.com", 
          to = "lt.lovetoken@gmail.com",
          subject = "Today lucky number",
          body = paste0("Today lucky number : ", lucky_num), # 메일본문에 추출된 행운숫자의 서수를 붙인다.
          smtp = list(host.name = "smtp.gmail.com", port = 465, user.name = "lt.lovetoken", passwd = "#######", ssl = T),
          authenticate = T)

tibble(
  lucky_number = lucky_num,
  date = Sys.Date()
) %>% write_csv("luck_numbers.csv", append = T) # Load
