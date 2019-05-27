#grepl
#grep

text <- "Hi there, do you know who you are voting for?"
print(grepl('voting', text))

v <- c("a","b","c","d","d")
print(grepl('b',v))

print(grep('d',v))