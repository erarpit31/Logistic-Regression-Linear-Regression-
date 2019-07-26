getwd()

setwd("C:/users/acer/Desktop/R")

Churn=read.csv("C:/Users/acer/Desktop/R/Telecom_Data.csv")
dim(Churn)
[1] 3333   21
table(Churn$churn)
FALSE  TRUE 
2850   483 
summary(Churn)
international.plan voice.mail.plan number.vmail.messages total.day.minutes total.day.calls
no :3010           no :2411        Min.   : 0.000        Min.   :  0.0     Min.   :  0.0  
yes: 323           yes: 922        1st Qu.: 0.000        1st Qu.:143.7     1st Qu.: 87.0  
Median : 0.000        Median :179.4     Median :101.0  
Mean   : 8.099        Mean   :179.8     Mean   :100.4  
3rd Qu.:20.000        3rd Qu.:216.4     3rd Qu.:114.0  
Max.   :51.000        Max.   :350.8     Max.   :165.0  
total.day.charge total.eve.minutes total.eve.calls total.eve.charge total.night.minutes total.night.calls
Min.   : 0.00    Min.   :  0.0     Min.   :  0.0   Min.   : 0.00    Min.   : 23.2       Min.   : 33.0    
1st Qu.:24.43    1st Qu.:166.6     1st Qu.: 87.0   1st Qu.:14.16    1st Qu.:167.0       1st Qu.: 87.0    
Median :30.50    Median :201.4     Median :100.0   Median :17.12    Median :201.2       Median :100.0    
Mean   :30.56    Mean   :201.0     Mean   :100.1   Mean   :17.08    Mean   :200.9       Mean   :100.1    
3rd Qu.:36.79    3rd Qu.:235.3     3rd Qu.:114.0   3rd Qu.:20.00    3rd Qu.:235.3       3rd Qu.:113.0    
Max.   :59.64    Max.   :363.7     Max.   :170.0   Max.   :30.91    Max.   :395.0       Max.   :175.0    
total.night.charge total.intl.minutes total.intl.calls total.intl.charge customer.service.calls
Min.   : 1.040     Min.   : 0.00      Min.   : 0.000   Min.   :0.000     Min.   :0.000         
1st Qu.: 7.520     1st Qu.: 8.50      1st Qu.: 3.000   1st Qu.:2.300     1st Qu.:1.000         
Median : 9.050     Median :10.30      Median : 4.000   Median :2.780     Median :1.000         
Mean   : 9.039     Mean   :10.24      Mean   : 4.479   Mean   :2.765     Mean   :1.563         
3rd Qu.:10.590     3rd Qu.:12.10      3rd Qu.: 6.000   3rd Qu.:3.270     3rd Qu.:2.000         
Max.   :17.770     Max.   :20.00      Max.   :20.000   Max.   :5.400     Max.   :9.000         
    churn        
Mode :logical  
FALSE:2850     
TRUE :483      

str(Churn)
'data.frame':	3333 obs. of  21 variables:
$ state                 : Factor w/ 51 levels "AK","AL","AR",..: 17 36 32 36 37 2 20 25 19 50 ...
$ account.length        : int  128 107 137 84 75 118 121 147 117 141 ...
$ area.code             : int  415 415 415 408 415 510 510 415 408 415 ...
$ phone.number          : Factor w/ 3333 levels "327-1058","327-1319",..: 1927 1576 1118 1708 111 2254 1048 81 292 118 ...
$ international.plan    : Factor w/ 2 levels "no","yes": 1 1 1 2 2 2 1 2 1 2 ...
$ voice.mail.plan       : Factor w/ 2 levels "no","yes": 2 2 1 1 1 1 2 1 1 2 ...
$ number.vmail.messages : int  25 26 0 0 0 0 24 0 0 37 ...
$ total.day.minutes     : num  265 162 243 299 167 ...
$ total.day.calls       : int  110 123 114 71 113 98 88 79 97 84 ...
$ total.day.charge      : num  45.1 27.5 41.4 50.9 28.3 ...
$ total.eve.minutes     : num  197.4 195.5 121.2 61.9 148.3 ...
$ total.eve.calls       : int  99 103 110 88 122 101 108 94 80 111 ...
$ total.eve.charge      : num  16.78 16.62 10.3 5.26 12.61 ...
$ total.night.minutes   : num  245 254 163 197 187 ...
$ total.night.calls     : int  91 103 104 89 121 118 118 96 90 97 ...
$ total.night.charge    : num  11.01 11.45 7.32 8.86 8.41 ...
$ total.intl.minutes    : num  10 13.7 12.2 6.6 10.1 6.3 7.5 7.1 8.7 11.2 ...
$ total.intl.calls      : int  3 3 5 7 3 6 7 6 4 5 ...
$ total.intl.charge     : num  2.7 3.7 3.29 1.78 2.73 1.7 2.03 1.92 2.35 3.02 ...
$ customer.service.calls: int  1 1 0 2 3 0 3 0 1 0 ...
$ churn                 : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...

# removing the state, area_code, and account_length attributes,phone.number, 
#which are not appropriate for classification features
Churn=Churn[-c(1,2,3,4)]
str(Churn)
'data.frame':	3333 obs. of  17 variables:
$ international.plan    : Factor w/ 2 levels "no","yes": 1 1 1 2 2 2 1 2 1 2 ...
$ voice.mail.plan       : Factor w/ 2 levels "no","yes": 2 2 1 1 1 1 2 1 1 2 ...
$ number.vmail.messages : int  25 26 0 0 0 0 24 0 0 37 ...
$ total.day.minutes     : num  265 162 243 299 167 ...
$ total.day.calls       : int  110 123 114 71 113 98 88 79 97 84 ...
$ total.day.charge      : num  45.1 27.5 41.4 50.9 28.3 ...
$ total.eve.minutes     : num  197.4 195.5 121.2 61.9 148.3 ...
$ total.eve.calls       : int  99 103 110 88 122 101 108 94 80 111 ...
$ total.eve.charge      : num  16.78 16.62 10.3 5.26 12.61 ...
$ total.night.minutes   : num  245 254 163 197 187 ...
$ total.night.calls     : int  91 103 104 89 121 118 118 96 90 97 ...
$ total.night.charge    : num  11.01 11.45 7.32 8.86 8.41 ...
$ total.intl.minutes    : num  10 13.7 12.2 6.6 10.1 6.3 7.5 7.1 8.7 11.2 ...
$ total.intl.calls      : int  3 3 5 7 3 6 7 6 4 5 ...
$ total.intl.charge     : num  2.7 3.7 3.29 1.78 2.73 1.7 2.03 1.92 2.35 3.02 ...
$ customer.service.calls: int  1 1 0 2 3 0 3 0 1 0 ...
$ churn                 : logi  FALSE FALSE FALSE FALSE FALSE FALSE ...



# split 70 percent of the data into the training dataset and 30 percent of the 
#data into the testing dataset

trainset=Churn[1:2331,]
testset=Churn[2331:3333,]

# use dim to explore the dimensions of both the training and testing datasets
dim(trainingset)
[1] 2331   13
dim(testset)
[1] 1003   17
#we apply the glm function on the dataset, trainingset, 
#by using churn as a class label and the rest of the variables as input features.

model=glm(churn~.,family = binomial(),data=trainingset, )

Call:
  glm(formula = churn ~ ., family = binomial(), data = trainingset)

Deviance Residuals: 
  Min       1Q   Median       3Q      Max  
-1.6227  -0.5550  -0.4013  -0.2730   3.0126  

Coefficients:
                          Estimate Std. Error z value Pr(>|z|)    
  (Intercept)             -8.273674 0.809700 -10.218   <2e-16 ***
  total.day.calls         0.002279  0.003228   0.706   0.4802    
  total.day.charge        0.069713  0.007516   9.276   <2e-16 ***
  total.eve.minutes       1.827999  1.916924   0.954   0.3403    
total.eve.calls          0.003216   0.003216   1.000   0.3173    
total.eve.charge       -21.431381  22.551649  -0.950   0.3419    
total.night.minutes     -0.897037   1.017894  -0.881   0.3782    
total.night.calls        0.000196   0.003347   0.059   0.9533    
total.night.charge      20.010221  22.619221   0.885   0.3763    
total.intl.minutes      -7.268670   6.127455  -1.186   0.2355    
total.intl.calls        -0.062786   0.028333  -2.216   0.0267 *  
total.intl.charge       27.288232  22.691731   1.203   0.2291    
customer.service.calls   0.445734   0.045542   9.787   <2e-16 ***
  ---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

(Dispersion parameter for binomial family taken to be 1)

Null deviance: 1842.6  on 2330  degrees of freedom
Residual deviance: 1615.6  on 2318  degrees of freedom
AIC: 1641.6

Number of Fisher Scoring iterations: 5

# with the summary function to obtain summary information of the built logistic regression model
summary(model)
Call:
  glm(formula = churn ~ ., family = binomial(), data = trainingset)

Deviance Residuals: 
  Min       1Q   Median       3Q      Max  
-1.6227  -0.5550  -0.4013  -0.2730   3.0126  

Coefficients:
                          Estimate Std. Error z value Pr(>|z|)    
(Intercept)             -8.273674   0.809700 -10.218   <2e-16 ***
  total.day.calls        0.002279   0.003228   0.706   0.4802    
  total.day.charge       0.069713   0.007516   9.276   <2e-16 ***
  total.eve.minutes       1.827999   1.916924   0.954   0.3403    
total.eve.calls          0.003216   0.003216   1.000   0.3173    
total.eve.charge       -21.431381  22.551649  -0.950   0.3419    
total.night.minutes     -0.897037   1.017894  -0.881   0.3782    
total.night.calls        0.000196   0.003347   0.059   0.9533    
total.night.charge      20.010221  22.619221   0.885   0.3763    
total.intl.minutes      -7.268670   6.127455  -1.186   0.2355    
total.intl.calls        -0.062786   0.028333  -2.216   0.0267 *  
  total.intl.charge       27.288232  22.691731   1.203   0.2291    
customer.service.calls   0.445734   0.045542   9.787   <2e-16 ***
  ---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

(Dispersion parameter for binomial family taken to be 1)

Null deviance: 1842.6  on 2330  degrees of freedom
Residual deviance: 1615.6  on 2318  degrees of freedom
AIC: 1641.6

Number of Fisher Scoring iterations: 5

# we find that the built model contains insignificant variables, which would lead to misclassification.
#Therefore, we use significant variables to train the classification model
model1= glm(churn ~ total.day.charge  + 
              customer.service.calls+total.intl.calls,
           data = trainset, 
          family=binomial)

summary(model1)

Call:
  glm(formula = churn ~ total.day.charge + customer.service.calls + 
        total.intl.calls, family = binomial, data = trainset)

Deviance Residuals: 
  Min       1Q   Median       3Q      Max  
-1.6335  -0.5522  -0.4205  -0.3128   2.9684  

Coefficients:
                          Estimate Std. Error z value Pr(>|z|)    
  (Intercept)            -4.610660   0.302486 -15.243   <2e-16 ***
  total.day.charge        0.067642   0.007341   9.214   <2e-16 ***
  customer.service.calls  0.422762   0.044329   9.537   <2e-16 ***
  total.intl.calls       -0.047519   0.027264  -1.743   0.0814 .  
---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

(Dispersion parameter for binomial family taken to be 1)

Null deviance: 1842.6  on 2330  degrees of freedom
Residual deviance: 1667.3  on 2327  degrees of freedom
AIC: 1675.3

Number of Fisher Scoring iterations: 5



#glm variable importance
varImp(model1)
                        Overall
total.day.charge       9.213749
customer.service.calls 9.536977
total.intl.calls       1.742884

# you can then use a fitted model, fit, to predict the outcome of testset. 
#You can also determine the class by judging whether the probability is above 0.5

pred = predict(model1,testset, type="response")
Class = pred >0.5
summary(Class)
    Mode   FALSE    TRUE 
logical     987      16 

# You can generate the counting statistics based on the testing dataset label and predicted result:
tb = table(testset$churn,Class)

tb

    Class
        FALSE TRUE
FALSE   827    7
TRUE    160    9

accuracy=(827+9)/1003
accuracy
0.8334







