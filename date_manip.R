today <- Sys.Date()

print(today)

print(class(today))

c <- "2018-04-26"
print(class(c))

my.date <- as.Date(c)
print(class(my.date))

# %d Day of the month -- decimal number
# %m Month (decimal number)
# %b Month (abbrevaiated)
# %B Month (full name)
# %y Year (2 digit)
# %Y Year (4 digit)

my.date <- as.Date("Nov-03-2020", format="%b-%d-%y")
print(class(my.date))

my.date <- as.Date("June, 02, 2018", format="%B, %d, %Y")
print(my.date)

my.time <- as.POSIXct("12:04:22", format="%H:%M:%S")
print(my.time)

# help(strptime)
my.time <- strptime("8:06:19", format="%H:%M:%S")
print(my.time)












