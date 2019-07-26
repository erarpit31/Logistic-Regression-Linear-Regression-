getwd()
setwd("C:/Users/acer/Desktop/R")

data=read.csv("Computer_Data.csv")
New_data=select(data,price,speed)
new_data=print(nrow(New_data)*0.70)
training_set=New_data[1:4381,]
test_set=New_data[4381:6259,]


model=lm(price~speed,data=New_data)
summary(model)

dev.off()

sessionInfo()
RStudio.Version()


#new column in test_set like
test_set$Predicted_price=predict(model,test_set)
View(test_set)
cor(test_set$price,test_set$Predicted_price)

ggplot(data=New_data, aes(x=price))+geom_histogram()

str(new_data1)

new_data1=select(data,price,speed)
new_data1=nrow(new_data1)*0.70
training_set2=new_data1[1:4380,]
test_set1=new_data1[4381:6259,]
model1=lm(price~(speed),data=training_set1)
summary(model1)

#new column in test_set like
test_set1$Predicted_price=predict(model1,test_set1)
View(test_set1)
cor(test_set1$price,test_set1$Predicted_price)

str(data)

new_data3=select(data,price,speed,hd,ram,screen,cd,multi,premium,ads,trend)
new_data3=nrow(new_data3)*0.70
training_set3=new_data1[1:4381,]
test_set4=new_data3[4381:6259,]
model1=lm(price~,data=training_set1)
summary(model1)

#new column in test_set like
test_set1$Predicted_price=predict(model1,test_set1)
View(test_set1)
cor(test_set$price,test_set$Predicted_price)

  


