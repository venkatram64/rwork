x <- 14
if(x == 10){
  print("x is 10")
}else if(x == 12){
  print("x is 12")
}else{
  print("not 10 or 12")
}


hot <- FALSE
temp <- 60

if(temp > 80){
  print("temp is greater")
}else if(temp > 50 & temp < 80){
  print("temp is less than 80 and greater than 50")  
} else{
  print("temp is less than 80")
}