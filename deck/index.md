---
title       : Modeling of population growth rate
subtitle    : All US counties from April 2010 to July 2014
author      : Hiroshi Ohno
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## 1. Objective and summary

- Population growth is one of fundamental social factors to affect the society.
 - In general, moderate growth rate is desired for organized development of the society.
 - Modeling the mechanism of growth rate may help predicting the trend in the future and making political decision to adjust it. (This study does NOT focus on the prediction, though.)

- Summary of modeling result
 - 35% is explained by demographic data which this study used
 - 4% is explained by economic data which this study used
 
- I expect much of unexplained part may be explained by some other economic data. Demographic data used was reasonablly detail and accurate while ecnomic data used was very limited.

--- .class #id 

## 2. Methodology



- Target: Annualized population growth rate from April 2010 to July 2014 (estimated by U.S. Census Bureau)


- Input data for demographic aspect: U.S. 2010 Census
 + Total population, male/female, population in age bands (5 year division), race, number of household, family/non-family, population in a household


- Input data for economic aspect: U.S. 2012 Economic Census
 + Payroll and number of employees in top level industry cateogries.


- All data are per county of the United States.



- Linear regression model
 + All variables except total population are regularized as per-capita basis.

 + Excluding two large outliers, which seem to attribute extreme population increment from oil industry boom in North Dakota.

 + Use stepwise selection provided by MASS package to eliminate insignificant variables.

```
## Start:  AIC=-30241.75
## growthRate ~ (id + name + total.population + male + age0.4 + 
##     age5.9 + age10.14 + age15.19 + age20.24 + age25.29 + age30.34 + 
##     age35.39 + age40.44 + age45.49 + age50.54 + age55.59 + age60.64 + 
##     age65.69 + age70.74 + age75.79 + age80.84 + age85.89 + age90.over + 
##     rWhite + rBlack.AfricanAmerican + rAmericanIndian.AlaskaNative + 
##     rAsian + rNativeHawaiian.OtherPacificIslander + rOther + 
##     rMultiple + total.households + family.households + h.1person + 
##     h.2person + h.3person + h.4person + h.5person + h.6person + 
##     h.7person.more + Pyr.Accommodation.and.food.services + Pyr.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Pyr.Arts..entertainment..and.recreation + Pyr.Educational.services + 
##     Pyr.Finance.and.insurance + Pyr.Health.care.and.social.assistance + 
##     Pyr.Information + Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Transportation.and.warehousing.104. + 
##     Pyr.Utilities + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Arts..entertainment..and.recreation + Emp.Educational.services + 
##     Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Information + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Retail.trade + Emp.Transportation.and.warehousing.104. + 
##     Emp.Utilities + Emp.Wholesale.trade) - id - name
## 
## 
## Step:  AIC=-30241.75
## growthRate ~ total.population + male + age0.4 + age5.9 + age10.14 + 
##     age15.19 + age20.24 + age25.29 + age30.34 + age35.39 + age40.44 + 
##     age45.49 + age50.54 + age55.59 + age60.64 + age65.69 + age70.74 + 
##     age75.79 + age80.84 + age85.89 + age90.over + rWhite + rBlack.AfricanAmerican + 
##     rAmericanIndian.AlaskaNative + rAsian + rNativeHawaiian.OtherPacificIslander + 
##     rOther + rMultiple + total.households + family.households + 
##     h.1person + h.2person + h.3person + h.4person + h.5person + 
##     h.6person + Pyr.Accommodation.and.food.services + Pyr.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Pyr.Arts..entertainment..and.recreation + Pyr.Educational.services + 
##     Pyr.Finance.and.insurance + Pyr.Health.care.and.social.assistance + 
##     Pyr.Information + Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Transportation.and.warehousing.104. + 
##     Pyr.Utilities + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Arts..entertainment..and.recreation + Emp.Educational.services + 
##     Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Information + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Retail.trade + Emp.Transportation.and.warehousing.104. + 
##     Emp.Utilities + Emp.Wholesale.trade
## 
## 
## Step:  AIC=-30241.75
## growthRate ~ total.population + male + age0.4 + age5.9 + age10.14 + 
##     age15.19 + age20.24 + age25.29 + age30.34 + age35.39 + age40.44 + 
##     age45.49 + age50.54 + age55.59 + age60.64 + age65.69 + age70.74 + 
##     age75.79 + age80.84 + age85.89 + age90.over + rWhite + rBlack.AfricanAmerican + 
##     rAmericanIndian.AlaskaNative + rAsian + rNativeHawaiian.OtherPacificIslander + 
##     rOther + total.households + family.households + h.1person + 
##     h.2person + h.3person + h.4person + h.5person + h.6person + 
##     Pyr.Accommodation.and.food.services + Pyr.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Pyr.Arts..entertainment..and.recreation + Pyr.Educational.services + 
##     Pyr.Finance.and.insurance + Pyr.Health.care.and.social.assistance + 
##     Pyr.Information + Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Transportation.and.warehousing.104. + 
##     Pyr.Utilities + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Arts..entertainment..and.recreation + Emp.Educational.services + 
##     Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Information + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Retail.trade + Emp.Transportation.and.warehousing.104. + 
##     Emp.Utilities + Emp.Wholesale.trade
## 
## 
## Step:  AIC=-30241.75
## growthRate ~ total.population + male + age0.4 + age5.9 + age10.14 + 
##     age15.19 + age20.24 + age25.29 + age30.34 + age35.39 + age40.44 + 
##     age45.49 + age50.54 + age55.59 + age60.64 + age65.69 + age70.74 + 
##     age75.79 + age80.84 + age85.89 + rWhite + rBlack.AfricanAmerican + 
##     rAmericanIndian.AlaskaNative + rAsian + rNativeHawaiian.OtherPacificIslander + 
##     rOther + total.households + family.households + h.1person + 
##     h.2person + h.3person + h.4person + h.5person + h.6person + 
##     Pyr.Accommodation.and.food.services + Pyr.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Pyr.Arts..entertainment..and.recreation + Pyr.Educational.services + 
##     Pyr.Finance.and.insurance + Pyr.Health.care.and.social.assistance + 
##     Pyr.Information + Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Transportation.and.warehousing.104. + 
##     Pyr.Utilities + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Arts..entertainment..and.recreation + Emp.Educational.services + 
##     Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Information + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Retail.trade + Emp.Transportation.and.warehousing.104. + 
##     Emp.Utilities + Emp.Wholesale.trade
## 
##                                                                                Df
## - Pyr.Arts..entertainment..and.recreation                                       1
## - Emp.Retail.trade                                                              1
## - Emp.Arts..entertainment..and.recreation                                       1
## - age0.4                                                                        1
## - Pyr.Accommodation.and.food.services                                           1
## - age5.9                                                                        1
## - age45.49                                                                      1
## - rWhite                                                                        1
## - age25.29                                                                      1
## - age60.64                                                                      1
## - h.6person                                                                     1
## - age40.44                                                                      1
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Transportation.and.warehousing.104.                                       1
## - age80.84                                                                      1
## - Pyr.Transportation.and.warehousing.104.                                       1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Accommodation.and.food.services                                           1
## - rAmericanIndian.AlaskaNative                                                  1
## - rBlack.AfricanAmerican                                                        1
## - age30.34                                                                      1
## - age15.19                                                                      1
## - h.4person                                                                     1
## - rOther                                                                        1
## - Emp.Information                                                               1
## - age35.39                                                                      1
## - age20.24                                                                      1
## - Pyr.Educational.services                                                      1
## - age65.69                                                                      1
## - age75.79                                                                      1
## - Pyr.Professional..scientific..and.technical.services                          1
## - Emp.Professional..scientific..and.technical.services                          1
## - Emp.Educational.services                                                      1
## - Emp.Health.care.and.social.assistance                                         1
## - h.5person                                                                     1
## - Pyr.Utilities                                                                 1
## - Pyr.Manufacturing                                                             1
## - Pyr.Retail.trade                                                              1
## - total.households                                                              1
## - Emp.Utilities                                                                 1
## - rNativeHawaiian.OtherPacificIslander                                          1
## <none>                                                                           
## - Pyr.Finance.and.insurance                                                     1
## - h.3person                                                                     1
## - Pyr.Information                                                               1
## - age50.54                                                                      1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## - h.2person                                                                     1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - age10.14                                                                      1
## - age55.59                                                                      1
## - Pyr.Health.care.and.social.assistance                                         1
## - h.1person                                                                     1
## - age85.89                                                                      1
## - rAsian                                                                        1
## - age70.74                                                                      1
## - Emp.Finance.and.insurance                                                     1
## - Emp.Wholesale.trade                                                           1
## - total.population                                                              1
## - Pyr.Wholesale.trade                                                           1
## - Emp.Manufacturing                                                             1
## - Pyr.Other.services..except.public.administration.                             1
## - family.households                                                             1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
##                                                                                 Sum of Sq
## - Pyr.Arts..entertainment..and.recreation                                      0.00000000
## - Emp.Retail.trade                                                             0.00000000
## - Emp.Arts..entertainment..and.recreation                                      0.00000000
## - age0.4                                                                       0.00000001
## - Pyr.Accommodation.and.food.services                                          0.00000012
## - age5.9                                                                       0.00000079
## - age45.49                                                                     0.00000198
## - rWhite                                                                       0.00000326
## - age25.29                                                                     0.00000386
## - age60.64                                                                     0.00000484
## - h.6person                                                                    0.00000615
## - age40.44                                                                     0.00000632
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00000882
## - Emp.Transportation.and.warehousing.104.                                      0.00001212
## - age80.84                                                                     0.00001292
## - Pyr.Transportation.and.warehousing.104.                                      0.00001398
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00001422
## - Emp.Accommodation.and.food.services                                          0.00001426
## - rAmericanIndian.AlaskaNative                                                 0.00001815
## - rBlack.AfricanAmerican                                                       0.00001851
## - age30.34                                                                     0.00002008
## - age15.19                                                                     0.00002073
## - h.4person                                                                    0.00002520
## - rOther                                                                       0.00002539
## - Emp.Information                                                              0.00003035
## - age35.39                                                                     0.00003225
## - age20.24                                                                     0.00003268
## - Pyr.Educational.services                                                     0.00003564
## - age65.69                                                                     0.00003610
## - age75.79                                                                     0.00003618
## - Pyr.Professional..scientific..and.technical.services                         0.00004099
## - Emp.Professional..scientific..and.technical.services                         0.00004883
## - Emp.Educational.services                                                     0.00004965
## - Emp.Health.care.and.social.assistance                                        0.00005379
## - h.5person                                                                    0.00005428
## - Pyr.Utilities                                                                0.00005551
## - Pyr.Manufacturing                                                            0.00006535
## - Pyr.Retail.trade                                                             0.00006557
## - total.households                                                             0.00006729
## - Emp.Utilities                                                                0.00007253
## - rNativeHawaiian.OtherPacificIslander                                         0.00008593
## <none>                                                                                   
## - Pyr.Finance.and.insurance                                                    0.00009334
## - h.3person                                                                    0.00010261
## - Pyr.Information                                                              0.00013039
## - age50.54                                                                     0.00014284
## - Emp.Real.estate.and.rental.and.leasing                                       0.00016032
## - h.2person                                                                    0.00017322
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00020218
## - age10.14                                                                     0.00020224
## - age55.59                                                                     0.00021250
## - Pyr.Health.care.and.social.assistance                                        0.00021395
## - h.1person                                                                    0.00022735
## - age85.89                                                                     0.00024317
## - rAsian                                                                       0.00025494
## - age70.74                                                                     0.00027000
## - Emp.Finance.and.insurance                                                    0.00034240
## - Emp.Wholesale.trade                                                          0.00041017
## - total.population                                                             0.00042766
## - Pyr.Wholesale.trade                                                          0.00049003
## - Emp.Manufacturing                                                            0.00052699
## - Pyr.Other.services..except.public.administration.                            0.00055262
## - family.households                                                            0.00059462
## - Emp.Other.services..except.public.administration.                            0.00098656
## - male                                                                         0.00103629
##                                                                                    RSS
## - Pyr.Arts..entertainment..and.recreation                                      0.14133
## - Emp.Retail.trade                                                             0.14133
## - Emp.Arts..entertainment..and.recreation                                      0.14133
## - age0.4                                                                       0.14133
## - Pyr.Accommodation.and.food.services                                          0.14133
## - age5.9                                                                       0.14133
## - age45.49                                                                     0.14133
## - rWhite                                                                       0.14133
## - age25.29                                                                     0.14133
## - age60.64                                                                     0.14134
## - h.6person                                                                    0.14134
## - age40.44                                                                     0.14134
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14134
## - Emp.Transportation.and.warehousing.104.                                      0.14134
## - age80.84                                                                     0.14134
## - Pyr.Transportation.and.warehousing.104.                                      0.14134
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14134
## - Emp.Accommodation.and.food.services                                          0.14134
## - rAmericanIndian.AlaskaNative                                                 0.14135
## - rBlack.AfricanAmerican                                                       0.14135
## - age30.34                                                                     0.14135
## - age15.19                                                                     0.14135
## - h.4person                                                                    0.14136
## - rOther                                                                       0.14136
## - Emp.Information                                                              0.14136
## - age35.39                                                                     0.14136
## - age20.24                                                                     0.14136
## - Pyr.Educational.services                                                     0.14137
## - age65.69                                                                     0.14137
## - age75.79                                                                     0.14137
## - Pyr.Professional..scientific..and.technical.services                         0.14137
## - Emp.Professional..scientific..and.technical.services                         0.14138
## - Emp.Educational.services                                                     0.14138
## - Emp.Health.care.and.social.assistance                                        0.14139
## - h.5person                                                                    0.14139
## - Pyr.Utilities                                                                0.14139
## - Pyr.Manufacturing                                                            0.14140
## - Pyr.Retail.trade                                                             0.14140
## - total.households                                                             0.14140
## - Emp.Utilities                                                                0.14140
## - rNativeHawaiian.OtherPacificIslander                                         0.14142
## <none>                                                                         0.14133
## - Pyr.Finance.and.insurance                                                    0.14142
## - h.3person                                                                    0.14143
## - Pyr.Information                                                              0.14146
## - age50.54                                                                     0.14147
## - Emp.Real.estate.and.rental.and.leasing                                       0.14149
## - h.2person                                                                    0.14150
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14153
## - age10.14                                                                     0.14153
## - age55.59                                                                     0.14154
## - Pyr.Health.care.and.social.assistance                                        0.14155
## - h.1person                                                                    0.14156
## - age85.89                                                                     0.14157
## - rAsian                                                                       0.14159
## - age70.74                                                                     0.14160
## - Emp.Finance.and.insurance                                                    0.14167
## - Emp.Wholesale.trade                                                          0.14174
## - total.population                                                             0.14176
## - Pyr.Wholesale.trade                                                          0.14182
## - Emp.Manufacturing                                                            0.14186
## - Pyr.Other.services..except.public.administration.                            0.14188
## - family.households                                                            0.14192
## - Emp.Other.services..except.public.administration.                            0.14232
## - male                                                                         0.14237
##                                                                                   AIC
## - Pyr.Arts..entertainment..and.recreation                                      -30244
## - Emp.Retail.trade                                                             -30244
## - Emp.Arts..entertainment..and.recreation                                      -30244
## - age0.4                                                                       -30244
## - Pyr.Accommodation.and.food.services                                          -30244
## - age5.9                                                                       -30244
## - age45.49                                                                     -30244
## - rWhite                                                                       -30244
## - age25.29                                                                     -30244
## - age60.64                                                                     -30244
## - h.6person                                                                    -30244
## - age40.44                                                                     -30244
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30244
## - Emp.Transportation.and.warehousing.104.                                      -30244
## - age80.84                                                                     -30244
## - Pyr.Transportation.and.warehousing.104.                                      -30244
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30243
## - Emp.Accommodation.and.food.services                                          -30243
## - rAmericanIndian.AlaskaNative                                                 -30243
## - rBlack.AfricanAmerican                                                       -30243
## - age30.34                                                                     -30243
## - age15.19                                                                     -30243
## - h.4person                                                                    -30243
## - rOther                                                                       -30243
## - Emp.Information                                                              -30243
## - age35.39                                                                     -30243
## - age20.24                                                                     -30243
## - Pyr.Educational.services                                                     -30243
## - age65.69                                                                     -30243
## - age75.79                                                                     -30243
## - Pyr.Professional..scientific..and.technical.services                         -30243
## - Emp.Professional..scientific..and.technical.services                         -30243
## - Emp.Educational.services                                                     -30243
## - Emp.Health.care.and.social.assistance                                        -30243
## - h.5person                                                                    -30243
## - Pyr.Utilities                                                                -30243
## - Pyr.Manufacturing                                                            -30242
## - Pyr.Retail.trade                                                             -30242
## - total.households                                                             -30242
## - Emp.Utilities                                                                -30242
## - rNativeHawaiian.OtherPacificIslander                                         -30242
## <none>                                                                         -30242
## - Pyr.Finance.and.insurance                                                    -30242
## - h.3person                                                                    -30242
## - Pyr.Information                                                              -30241
## - age50.54                                                                     -30241
## - Emp.Real.estate.and.rental.and.leasing                                       -30240
## - h.2person                                                                    -30240
## - Pyr.Real.estate.and.rental.and.leasing                                       -30239
## - age10.14                                                                     -30239
## - age55.59                                                                     -30239
## - Pyr.Health.care.and.social.assistance                                        -30239
## - h.1person                                                                    -30239
## - age85.89                                                                     -30239
## - rAsian                                                                       -30238
## - age70.74                                                                     -30238
## - Emp.Finance.and.insurance                                                    -30236
## - Emp.Wholesale.trade                                                          -30235
## - total.population                                                             -30235
## - Pyr.Wholesale.trade                                                          -30233
## - Emp.Manufacturing                                                            -30232
## - Pyr.Other.services..except.public.administration.                            -30232
## - family.households                                                            -30231
## - Emp.Other.services..except.public.administration.                            -30223
## - male                                                                         -30222
## 
## Step:  AIC=-30243.75
## growthRate ~ total.population + male + age0.4 + age5.9 + age10.14 + 
##     age15.19 + age20.24 + age25.29 + age30.34 + age35.39 + age40.44 + 
##     age45.49 + age50.54 + age55.59 + age60.64 + age65.69 + age70.74 + 
##     age75.79 + age80.84 + age85.89 + rWhite + rBlack.AfricanAmerican + 
##     rAmericanIndian.AlaskaNative + rAsian + rNativeHawaiian.OtherPacificIslander + 
##     rOther + total.households + family.households + h.1person + 
##     h.2person + h.3person + h.4person + h.5person + h.6person + 
##     Pyr.Accommodation.and.food.services + Pyr.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Pyr.Educational.services + Pyr.Finance.and.insurance + Pyr.Health.care.and.social.assistance + 
##     Pyr.Information + Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Transportation.and.warehousing.104. + 
##     Pyr.Utilities + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Arts..entertainment..and.recreation + Emp.Educational.services + 
##     Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Information + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Retail.trade + Emp.Transportation.and.warehousing.104. + 
##     Emp.Utilities + Emp.Wholesale.trade
## 
##                                                                                Df
## - Emp.Retail.trade                                                              1
## - age0.4                                                                        1
## - Emp.Arts..entertainment..and.recreation                                       1
## - Pyr.Accommodation.and.food.services                                           1
## - age5.9                                                                        1
## - age45.49                                                                      1
## - rWhite                                                                        1
## - age25.29                                                                      1
## - age60.64                                                                      1
## - h.6person                                                                     1
## - age40.44                                                                      1
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Transportation.and.warehousing.104.                                       1
## - age80.84                                                                      1
## - Pyr.Transportation.and.warehousing.104.                                       1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Accommodation.and.food.services                                           1
## - rAmericanIndian.AlaskaNative                                                  1
## - rBlack.AfricanAmerican                                                        1
## - age30.34                                                                      1
## - age15.19                                                                      1
## - h.4person                                                                     1
## - rOther                                                                        1
## - Emp.Information                                                               1
## - age35.39                                                                      1
## - age20.24                                                                      1
## - Pyr.Educational.services                                                      1
## - age65.69                                                                      1
## - age75.79                                                                      1
## - Pyr.Professional..scientific..and.technical.services                          1
## - Emp.Professional..scientific..and.technical.services                          1
## - Emp.Educational.services                                                      1
## - Emp.Health.care.and.social.assistance                                         1
## - h.5person                                                                     1
## - Pyr.Utilities                                                                 1
## - Pyr.Manufacturing                                                             1
## - Pyr.Retail.trade                                                              1
## - total.households                                                              1
## - Emp.Utilities                                                                 1
## - rNativeHawaiian.OtherPacificIslander                                          1
## <none>                                                                           
## - Pyr.Finance.and.insurance                                                     1
## - h.3person                                                                     1
## - Pyr.Information                                                               1
## - age50.54                                                                      1
## - h.2person                                                                     1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## + Pyr.Arts..entertainment..and.recreation                                       1
## - age10.14                                                                      1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - age55.59                                                                      1
## - Pyr.Health.care.and.social.assistance                                         1
## - h.1person                                                                     1
## - age85.89                                                                      1
## - rAsian                                                                        1
## - age70.74                                                                      1
## - Emp.Finance.and.insurance                                                     1
## - Emp.Wholesale.trade                                                           1
## - total.population                                                              1
## - Pyr.Wholesale.trade                                                           1
## - Emp.Manufacturing                                                             1
## - Pyr.Other.services..except.public.administration.                             1
## - family.households                                                             1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
##                                                                                 Sum of Sq
## - Emp.Retail.trade                                                             0.00000000
## - age0.4                                                                       0.00000001
## - Emp.Arts..entertainment..and.recreation                                      0.00000003
## - Pyr.Accommodation.and.food.services                                          0.00000012
## - age5.9                                                                       0.00000079
## - age45.49                                                                     0.00000198
## - rWhite                                                                       0.00000326
## - age25.29                                                                     0.00000386
## - age60.64                                                                     0.00000484
## - h.6person                                                                    0.00000617
## - age40.44                                                                     0.00000632
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00000911
## - Emp.Transportation.and.warehousing.104.                                      0.00001213
## - age80.84                                                                     0.00001293
## - Pyr.Transportation.and.warehousing.104.                                      0.00001399
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00001446
## - Emp.Accommodation.and.food.services                                          0.00001452
## - rAmericanIndian.AlaskaNative                                                 0.00001815
## - rBlack.AfricanAmerican                                                       0.00001852
## - age30.34                                                                     0.00002009
## - age15.19                                                                     0.00002074
## - h.4person                                                                    0.00002520
## - rOther                                                                       0.00002539
## - Emp.Information                                                              0.00003045
## - age35.39                                                                     0.00003228
## - age20.24                                                                     0.00003270
## - Pyr.Educational.services                                                     0.00003564
## - age65.69                                                                     0.00003610
## - age75.79                                                                     0.00003619
## - Pyr.Professional..scientific..and.technical.services                         0.00004122
## - Emp.Professional..scientific..and.technical.services                         0.00004899
## - Emp.Educational.services                                                     0.00005016
## - Emp.Health.care.and.social.assistance                                        0.00005381
## - h.5person                                                                    0.00005428
## - Pyr.Utilities                                                                0.00005570
## - Pyr.Manufacturing                                                            0.00006536
## - Pyr.Retail.trade                                                             0.00006559
## - total.households                                                             0.00006741
## - Emp.Utilities                                                                0.00007267
## - rNativeHawaiian.OtherPacificIslander                                         0.00008593
## <none>                                                                                   
## - Pyr.Finance.and.insurance                                                    0.00009486
## - h.3person                                                                    0.00010278
## - Pyr.Information                                                              0.00013056
## - age50.54                                                                     0.00014289
## - h.2person                                                                    0.00017348
## - Emp.Real.estate.and.rental.and.leasing                                       0.00017500
## + Pyr.Arts..entertainment..and.recreation                                      0.00000000
## - age10.14                                                                     0.00020225
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00021215
## - age55.59                                                                     0.00021258
## - Pyr.Health.care.and.social.assistance                                        0.00021419
## - h.1person                                                                    0.00022766
## - age85.89                                                                     0.00024322
## - rAsian                                                                       0.00025497
## - age70.74                                                                     0.00027019
## - Emp.Finance.and.insurance                                                    0.00034383
## - Emp.Wholesale.trade                                                          0.00041019
## - total.population                                                             0.00043545
## - Pyr.Wholesale.trade                                                          0.00049027
## - Emp.Manufacturing                                                            0.00052700
## - Pyr.Other.services..except.public.administration.                            0.00055963
## - family.households                                                            0.00059507
## - Emp.Other.services..except.public.administration.                            0.00099968
## - male                                                                         0.00103775
##                                                                                    RSS
## - Emp.Retail.trade                                                             0.14133
## - age0.4                                                                       0.14133
## - Emp.Arts..entertainment..and.recreation                                      0.14133
## - Pyr.Accommodation.and.food.services                                          0.14133
## - age5.9                                                                       0.14133
## - age45.49                                                                     0.14133
## - rWhite                                                                       0.14133
## - age25.29                                                                     0.14133
## - age60.64                                                                     0.14134
## - h.6person                                                                    0.14134
## - age40.44                                                                     0.14134
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14134
## - Emp.Transportation.and.warehousing.104.                                      0.14134
## - age80.84                                                                     0.14134
## - Pyr.Transportation.and.warehousing.104.                                      0.14134
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14134
## - Emp.Accommodation.and.food.services                                          0.14134
## - rAmericanIndian.AlaskaNative                                                 0.14135
## - rBlack.AfricanAmerican                                                       0.14135
## - age30.34                                                                     0.14135
## - age15.19                                                                     0.14135
## - h.4person                                                                    0.14136
## - rOther                                                                       0.14136
## - Emp.Information                                                              0.14136
## - age35.39                                                                     0.14136
## - age20.24                                                                     0.14136
## - Pyr.Educational.services                                                     0.14137
## - age65.69                                                                     0.14137
## - age75.79                                                                     0.14137
## - Pyr.Professional..scientific..and.technical.services                         0.14137
## - Emp.Professional..scientific..and.technical.services                         0.14138
## - Emp.Educational.services                                                     0.14138
## - Emp.Health.care.and.social.assistance                                        0.14139
## - h.5person                                                                    0.14139
## - Pyr.Utilities                                                                0.14139
## - Pyr.Manufacturing                                                            0.14140
## - Pyr.Retail.trade                                                             0.14140
## - total.households                                                             0.14140
## - Emp.Utilities                                                                0.14140
## - rNativeHawaiian.OtherPacificIslander                                         0.14142
## <none>                                                                         0.14133
## - Pyr.Finance.and.insurance                                                    0.14143
## - h.3person                                                                    0.14143
## - Pyr.Information                                                              0.14146
## - age50.54                                                                     0.14147
## - h.2person                                                                    0.14150
## - Emp.Real.estate.and.rental.and.leasing                                       0.14151
## + Pyr.Arts..entertainment..and.recreation                                      0.14133
## - age10.14                                                                     0.14153
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14154
## - age55.59                                                                     0.14154
## - Pyr.Health.care.and.social.assistance                                        0.14155
## - h.1person                                                                    0.14156
## - age85.89                                                                     0.14157
## - rAsian                                                                       0.14159
## - age70.74                                                                     0.14160
## - Emp.Finance.and.insurance                                                    0.14167
## - Emp.Wholesale.trade                                                          0.14174
## - total.population                                                             0.14177
## - Pyr.Wholesale.trade                                                          0.14182
## - Emp.Manufacturing                                                            0.14186
## - Pyr.Other.services..except.public.administration.                            0.14189
## - family.households                                                            0.14193
## - Emp.Other.services..except.public.administration.                            0.14233
## - male                                                                         0.14237
##                                                                                   AIC
## - Emp.Retail.trade                                                             -30246
## - age0.4                                                                       -30246
## - Emp.Arts..entertainment..and.recreation                                      -30246
## - Pyr.Accommodation.and.food.services                                          -30246
## - age5.9                                                                       -30246
## - age45.49                                                                     -30246
## - rWhite                                                                       -30246
## - age25.29                                                                     -30246
## - age60.64                                                                     -30246
## - h.6person                                                                    -30246
## - age40.44                                                                     -30246
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30246
## - Emp.Transportation.and.warehousing.104.                                      -30246
## - age80.84                                                                     -30246
## - Pyr.Transportation.and.warehousing.104.                                      -30246
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30245
## - Emp.Accommodation.and.food.services                                          -30245
## - rAmericanIndian.AlaskaNative                                                 -30245
## - rBlack.AfricanAmerican                                                       -30245
## - age30.34                                                                     -30245
## - age15.19                                                                     -30245
## - h.4person                                                                    -30245
## - rOther                                                                       -30245
## - Emp.Information                                                              -30245
## - age35.39                                                                     -30245
## - age20.24                                                                     -30245
## - Pyr.Educational.services                                                     -30245
## - age65.69                                                                     -30245
## - age75.79                                                                     -30245
## - Pyr.Professional..scientific..and.technical.services                         -30245
## - Emp.Professional..scientific..and.technical.services                         -30245
## - Emp.Educational.services                                                     -30245
## - Emp.Health.care.and.social.assistance                                        -30245
## - h.5person                                                                    -30245
## - Pyr.Utilities                                                                -30245
## - Pyr.Manufacturing                                                            -30244
## - Pyr.Retail.trade                                                             -30244
## - total.households                                                             -30244
## - Emp.Utilities                                                                -30244
## - rNativeHawaiian.OtherPacificIslander                                         -30244
## <none>                                                                         -30244
## - Pyr.Finance.and.insurance                                                    -30244
## - h.3person                                                                    -30244
## - Pyr.Information                                                              -30243
## - age50.54                                                                     -30243
## - h.2person                                                                    -30242
## - Emp.Real.estate.and.rental.and.leasing                                       -30242
## + Pyr.Arts..entertainment..and.recreation                                      -30242
## - age10.14                                                                     -30241
## - Pyr.Real.estate.and.rental.and.leasing                                       -30241
## - age55.59                                                                     -30241
## - Pyr.Health.care.and.social.assistance                                        -30241
## - h.1person                                                                    -30241
## - age85.89                                                                     -30241
## - rAsian                                                                       -30240
## - age70.74                                                                     -30240
## - Emp.Finance.and.insurance                                                    -30238
## - Emp.Wholesale.trade                                                          -30237
## - total.population                                                             -30236
## - Pyr.Wholesale.trade                                                          -30235
## - Emp.Manufacturing                                                            -30234
## - Pyr.Other.services..except.public.administration.                            -30234
## - family.households                                                            -30233
## - Emp.Other.services..except.public.administration.                            -30224
## - male                                                                         -30224
## 
## Step:  AIC=-30245.75
## growthRate ~ total.population + male + age0.4 + age5.9 + age10.14 + 
##     age15.19 + age20.24 + age25.29 + age30.34 + age35.39 + age40.44 + 
##     age45.49 + age50.54 + age55.59 + age60.64 + age65.69 + age70.74 + 
##     age75.79 + age80.84 + age85.89 + rWhite + rBlack.AfricanAmerican + 
##     rAmericanIndian.AlaskaNative + rAsian + rNativeHawaiian.OtherPacificIslander + 
##     rOther + total.households + family.households + h.1person + 
##     h.2person + h.3person + h.4person + h.5person + h.6person + 
##     Pyr.Accommodation.and.food.services + Pyr.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Pyr.Educational.services + Pyr.Finance.and.insurance + Pyr.Health.care.and.social.assistance + 
##     Pyr.Information + Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Transportation.and.warehousing.104. + 
##     Pyr.Utilities + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Arts..entertainment..and.recreation + Emp.Educational.services + 
##     Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Information + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Transportation.and.warehousing.104. + Emp.Utilities + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - age0.4                                                                        1
## - Emp.Arts..entertainment..and.recreation                                       1
## - Pyr.Accommodation.and.food.services                                           1
## - age5.9                                                                        1
## - age45.49                                                                      1
## - rWhite                                                                        1
## - age25.29                                                                      1
## - age60.64                                                                      1
## - h.6person                                                                     1
## - age40.44                                                                      1
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Transportation.and.warehousing.104.                                       1
## - age80.84                                                                      1
## - Pyr.Transportation.and.warehousing.104.                                       1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Accommodation.and.food.services                                           1
## - rAmericanIndian.AlaskaNative                                                  1
## - rBlack.AfricanAmerican                                                        1
## - age30.34                                                                      1
## - age15.19                                                                      1
## - h.4person                                                                     1
## - rOther                                                                        1
## - Emp.Information                                                               1
## - age35.39                                                                      1
## - age20.24                                                                      1
## - Pyr.Educational.services                                                      1
## - age65.69                                                                      1
## - age75.79                                                                      1
## - Pyr.Professional..scientific..and.technical.services                          1
## - Emp.Professional..scientific..and.technical.services                          1
## - Emp.Educational.services                                                      1
## - Emp.Health.care.and.social.assistance                                         1
## - h.5person                                                                     1
## - Pyr.Utilities                                                                 1
## - Pyr.Manufacturing                                                             1
## - total.households                                                              1
## - Emp.Utilities                                                                 1
## - rNativeHawaiian.OtherPacificIslander                                          1
## <none>                                                                           
## - Pyr.Finance.and.insurance                                                     1
## - h.3person                                                                     1
## - Pyr.Information                                                               1
## - age50.54                                                                      1
## - h.2person                                                                     1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## + Emp.Retail.trade                                                              1
## + Pyr.Arts..entertainment..and.recreation                                       1
## - age10.14                                                                      1
## - age55.59                                                                      1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - Pyr.Health.care.and.social.assistance                                         1
## - h.1person                                                                     1
## - age85.89                                                                      1
## - rAsian                                                                        1
## - age70.74                                                                      1
## - Emp.Finance.and.insurance                                                     1
## - Emp.Wholesale.trade                                                           1
## - total.population                                                              1
## - Pyr.Wholesale.trade                                                           1
## - Emp.Manufacturing                                                             1
## - Pyr.Other.services..except.public.administration.                             1
## - family.households                                                             1
## - Pyr.Retail.trade                                                              1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
##                                                                                 Sum of Sq
## - age0.4                                                                       0.00000001
## - Emp.Arts..entertainment..and.recreation                                      0.00000003
## - Pyr.Accommodation.and.food.services                                          0.00000012
## - age5.9                                                                       0.00000080
## - age45.49                                                                     0.00000199
## - rWhite                                                                       0.00000329
## - age25.29                                                                     0.00000387
## - age60.64                                                                     0.00000484
## - h.6person                                                                    0.00000618
## - age40.44                                                                     0.00000631
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00000928
## - Emp.Transportation.and.warehousing.104.                                      0.00001213
## - age80.84                                                                     0.00001295
## - Pyr.Transportation.and.warehousing.104.                                      0.00001404
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00001468
## - Emp.Accommodation.and.food.services                                          0.00001497
## - rAmericanIndian.AlaskaNative                                                 0.00001822
## - rBlack.AfricanAmerican                                                       0.00001865
## - age30.34                                                                     0.00002009
## - age15.19                                                                     0.00002074
## - h.4person                                                                    0.00002525
## - rOther                                                                       0.00002542
## - Emp.Information                                                              0.00003049
## - age35.39                                                                     0.00003229
## - age20.24                                                                     0.00003270
## - Pyr.Educational.services                                                     0.00003566
## - age65.69                                                                     0.00003612
## - age75.79                                                                     0.00003620
## - Pyr.Professional..scientific..and.technical.services                         0.00004132
## - Emp.Professional..scientific..and.technical.services                         0.00004904
## - Emp.Educational.services                                                     0.00005015
## - Emp.Health.care.and.social.assistance                                        0.00005383
## - h.5person                                                                    0.00005439
## - Pyr.Utilities                                                                0.00005592
## - Pyr.Manufacturing                                                            0.00006535
## - total.households                                                             0.00006744
## - Emp.Utilities                                                                0.00007307
## - rNativeHawaiian.OtherPacificIslander                                         0.00008608
## <none>                                                                                   
## - Pyr.Finance.and.insurance                                                    0.00009501
## - h.3person                                                                    0.00010283
## - Pyr.Information                                                              0.00013055
## - age50.54                                                                     0.00014301
## - h.2person                                                                    0.00017348
## - Emp.Real.estate.and.rental.and.leasing                                       0.00017611
## + Emp.Retail.trade                                                             0.00000000
## + Pyr.Arts..entertainment..and.recreation                                      0.00000000
## - age10.14                                                                     0.00020224
## - age55.59                                                                     0.00021259
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00021433
## - Pyr.Health.care.and.social.assistance                                        0.00021462
## - h.1person                                                                    0.00022780
## - age85.89                                                                     0.00024321
## - rAsian                                                                       0.00025548
## - age70.74                                                                     0.00027019
## - Emp.Finance.and.insurance                                                    0.00034384
## - Emp.Wholesale.trade                                                          0.00041254
## - total.population                                                             0.00043574
## - Pyr.Wholesale.trade                                                          0.00049292
## - Emp.Manufacturing                                                            0.00052703
## - Pyr.Other.services..except.public.administration.                            0.00055971
## - family.households                                                            0.00059855
## - Pyr.Retail.trade                                                             0.00077213
## - Emp.Other.services..except.public.administration.                            0.00099985
## - male                                                                         0.00103935
##                                                                                    RSS
## - age0.4                                                                       0.14133
## - Emp.Arts..entertainment..and.recreation                                      0.14133
## - Pyr.Accommodation.and.food.services                                          0.14133
## - age5.9                                                                       0.14133
## - age45.49                                                                     0.14133
## - rWhite                                                                       0.14133
## - age25.29                                                                     0.14133
## - age60.64                                                                     0.14134
## - h.6person                                                                    0.14134
## - age40.44                                                                     0.14134
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14134
## - Emp.Transportation.and.warehousing.104.                                      0.14134
## - age80.84                                                                     0.14134
## - Pyr.Transportation.and.warehousing.104.                                      0.14134
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14135
## - Emp.Accommodation.and.food.services                                          0.14135
## - rAmericanIndian.AlaskaNative                                                 0.14135
## - rBlack.AfricanAmerican                                                       0.14135
## - age30.34                                                                     0.14135
## - age15.19                                                                     0.14135
## - h.4person                                                                    0.14136
## - rOther                                                                       0.14136
## - Emp.Information                                                              0.14136
## - age35.39                                                                     0.14136
## - age20.24                                                                     0.14136
## - Pyr.Educational.services                                                     0.14137
## - age65.69                                                                     0.14137
## - age75.79                                                                     0.14137
## - Pyr.Professional..scientific..and.technical.services                         0.14137
## - Emp.Professional..scientific..and.technical.services                         0.14138
## - Emp.Educational.services                                                     0.14138
## - Emp.Health.care.and.social.assistance                                        0.14139
## - h.5person                                                                    0.14139
## - Pyr.Utilities                                                                0.14139
## - Pyr.Manufacturing                                                            0.14140
## - total.households                                                             0.14140
## - Emp.Utilities                                                                0.14140
## - rNativeHawaiian.OtherPacificIslander                                         0.14142
## <none>                                                                         0.14133
## - Pyr.Finance.and.insurance                                                    0.14143
## - h.3person                                                                    0.14143
## - Pyr.Information                                                              0.14146
## - age50.54                                                                     0.14147
## - h.2person                                                                    0.14150
## - Emp.Real.estate.and.rental.and.leasing                                       0.14151
## + Emp.Retail.trade                                                             0.14133
## + Pyr.Arts..entertainment..and.recreation                                      0.14133
## - age10.14                                                                     0.14153
## - age55.59                                                                     0.14154
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14155
## - Pyr.Health.care.and.social.assistance                                        0.14155
## - h.1person                                                                    0.14156
## - age85.89                                                                     0.14157
## - rAsian                                                                       0.14159
## - age70.74                                                                     0.14160
## - Emp.Finance.and.insurance                                                    0.14167
## - Emp.Wholesale.trade                                                          0.14174
## - total.population                                                             0.14177
## - Pyr.Wholesale.trade                                                          0.14182
## - Emp.Manufacturing                                                            0.14186
## - Pyr.Other.services..except.public.administration.                            0.14189
## - family.households                                                            0.14193
## - Pyr.Retail.trade                                                             0.14210
## - Emp.Other.services..except.public.administration.                            0.14233
## - male                                                                         0.14237
##                                                                                   AIC
## - age0.4                                                                       -30248
## - Emp.Arts..entertainment..and.recreation                                      -30248
## - Pyr.Accommodation.and.food.services                                          -30248
## - age5.9                                                                       -30248
## - age45.49                                                                     -30248
## - rWhite                                                                       -30248
## - age25.29                                                                     -30248
## - age60.64                                                                     -30248
## - h.6person                                                                    -30248
## - age40.44                                                                     -30248
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30248
## - Emp.Transportation.and.warehousing.104.                                      -30248
## - age80.84                                                                     -30248
## - Pyr.Transportation.and.warehousing.104.                                      -30247
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30247
## - Emp.Accommodation.and.food.services                                          -30247
## - rAmericanIndian.AlaskaNative                                                 -30247
## - rBlack.AfricanAmerican                                                       -30247
## - age30.34                                                                     -30247
## - age15.19                                                                     -30247
## - h.4person                                                                    -30247
## - rOther                                                                       -30247
## - Emp.Information                                                              -30247
## - age35.39                                                                     -30247
## - age20.24                                                                     -30247
## - Pyr.Educational.services                                                     -30247
## - age65.69                                                                     -30247
## - age75.79                                                                     -30247
## - Pyr.Professional..scientific..and.technical.services                         -30247
## - Emp.Professional..scientific..and.technical.services                         -30247
## - Emp.Educational.services                                                     -30247
## - Emp.Health.care.and.social.assistance                                        -30247
## - h.5person                                                                    -30247
## - Pyr.Utilities                                                                -30247
## - Pyr.Manufacturing                                                            -30246
## - total.households                                                             -30246
## - Emp.Utilities                                                                -30246
## - rNativeHawaiian.OtherPacificIslander                                         -30246
## <none>                                                                         -30246
## - Pyr.Finance.and.insurance                                                    -30246
## - h.3person                                                                    -30246
## - Pyr.Information                                                              -30245
## - age50.54                                                                     -30245
## - h.2person                                                                    -30244
## - Emp.Real.estate.and.rental.and.leasing                                       -30244
## + Emp.Retail.trade                                                             -30244
## + Pyr.Arts..entertainment..and.recreation                                      -30244
## - age10.14                                                                     -30243
## - age55.59                                                                     -30243
## - Pyr.Real.estate.and.rental.and.leasing                                       -30243
## - Pyr.Health.care.and.social.assistance                                        -30243
## - h.1person                                                                    -30243
## - age85.89                                                                     -30243
## - rAsian                                                                       -30242
## - age70.74                                                                     -30242
## - Emp.Finance.and.insurance                                                    -30240
## - Emp.Wholesale.trade                                                          -30239
## - total.population                                                             -30238
## - Pyr.Wholesale.trade                                                          -30237
## - Emp.Manufacturing                                                            -30236
## - Pyr.Other.services..except.public.administration.                            -30236
## - family.households                                                            -30235
## - Pyr.Retail.trade                                                             -30231
## - Emp.Other.services..except.public.administration.                            -30226
## - male                                                                         -30225
## 
## Step:  AIC=-30247.75
## growthRate ~ total.population + male + age5.9 + age10.14 + age15.19 + 
##     age20.24 + age25.29 + age30.34 + age35.39 + age40.44 + age45.49 + 
##     age50.54 + age55.59 + age60.64 + age65.69 + age70.74 + age75.79 + 
##     age80.84 + age85.89 + rWhite + rBlack.AfricanAmerican + rAmericanIndian.AlaskaNative + 
##     rAsian + rNativeHawaiian.OtherPacificIslander + rOther + 
##     total.households + family.households + h.1person + h.2person + 
##     h.3person + h.4person + h.5person + h.6person + Pyr.Accommodation.and.food.services + 
##     Pyr.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Pyr.Educational.services + Pyr.Finance.and.insurance + Pyr.Health.care.and.social.assistance + 
##     Pyr.Information + Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Transportation.and.warehousing.104. + 
##     Pyr.Utilities + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Arts..entertainment..and.recreation + Emp.Educational.services + 
##     Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Information + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Transportation.and.warehousing.104. + Emp.Utilities + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - Emp.Arts..entertainment..and.recreation                                       1
## - Pyr.Accommodation.and.food.services                                           1
## - age5.9                                                                        1
## - rWhite                                                                        1
## - h.6person                                                                     1
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## - age45.49                                                                      1
## - Emp.Transportation.and.warehousing.104.                                       1
## - Pyr.Transportation.and.warehousing.104.                                       1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Accommodation.and.food.services                                           1
## - age25.29                                                                      1
## - age60.64                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - rBlack.AfricanAmerican                                                        1
## - age40.44                                                                      1
## - rOther                                                                        1
## - h.4person                                                                     1
## - Emp.Information                                                               1
## - Pyr.Educational.services                                                      1
## - age80.84                                                                      1
## - Pyr.Professional..scientific..and.technical.services                          1
## - Emp.Professional..scientific..and.technical.services                          1
## - Emp.Educational.services                                                      1
## - Emp.Health.care.and.social.assistance                                         1
## - h.5person                                                                     1
## - Pyr.Utilities                                                                 1
## - age30.34                                                                      1
## - Pyr.Manufacturing                                                             1
## - total.households                                                              1
## - Emp.Utilities                                                                 1
## - rNativeHawaiian.OtherPacificIslander                                          1
## <none>                                                                           
## - Pyr.Finance.and.insurance                                                     1
## - age75.79                                                                      1
## - h.3person                                                                     1
## - age15.19                                                                      1
## - Pyr.Information                                                               1
## - age65.69                                                                      1
## - age35.39                                                                      1
## - h.2person                                                                     1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## - age20.24                                                                      1
## + age0.4                                                                        1
## + age90.over                                                                    1
## + Emp.Retail.trade                                                              1
## + Pyr.Arts..entertainment..and.recreation                                       1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - Pyr.Health.care.and.social.assistance                                         1
## - h.1person                                                                     1
## - rAsian                                                                        1
## - Emp.Finance.and.insurance                                                     1
## - Emp.Wholesale.trade                                                           1
## - total.population                                                              1
## - Pyr.Wholesale.trade                                                           1
## - Emp.Manufacturing                                                             1
## - age50.54                                                                      1
## - Pyr.Other.services..except.public.administration.                             1
## - family.households                                                             1
## - age10.14                                                                      1
## - Pyr.Retail.trade                                                              1
## - age70.74                                                                      1
## - age85.89                                                                      1
## - age55.59                                                                      1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
##                                                                                 Sum of Sq
## - Emp.Arts..entertainment..and.recreation                                      0.00000003
## - Pyr.Accommodation.and.food.services                                          0.00000012
## - age5.9                                                                       0.00000224
## - rWhite                                                                       0.00000329
## - h.6person                                                                    0.00000620
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00000927
## - age45.49                                                                     0.00000962
## - Emp.Transportation.and.warehousing.104.                                      0.00001212
## - Pyr.Transportation.and.warehousing.104.                                      0.00001403
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00001473
## - Emp.Accommodation.and.food.services                                          0.00001496
## - age25.29                                                                     0.00001534
## - age60.64                                                                     0.00001798
## - rAmericanIndian.AlaskaNative                                                 0.00001822
## - rBlack.AfricanAmerican                                                       0.00001864
## - age40.44                                                                     0.00002343
## - rOther                                                                       0.00002542
## - h.4person                                                                    0.00002548
## - Emp.Information                                                              0.00003048
## - Pyr.Educational.services                                                     0.00003570
## - age80.84                                                                     0.00003666
## - Pyr.Professional..scientific..and.technical.services                         0.00004139
## - Emp.Professional..scientific..and.technical.services                         0.00004912
## - Emp.Educational.services                                                     0.00005025
## - Emp.Health.care.and.social.assistance                                        0.00005382
## - h.5person                                                                    0.00005455
## - Pyr.Utilities                                                                0.00005593
## - age30.34                                                                     0.00006422
## - Pyr.Manufacturing                                                            0.00006542
## - total.households                                                             0.00006774
## - Emp.Utilities                                                                0.00007307
## - rNativeHawaiian.OtherPacificIslander                                         0.00008608
## <none>                                                                                   
## - Pyr.Finance.and.insurance                                                    0.00009501
## - age75.79                                                                     0.00009830
## - h.3person                                                                    0.00010289
## - age15.19                                                                     0.00010788
## - Pyr.Information                                                              0.00013055
## - age65.69                                                                     0.00013063
## - age35.39                                                                     0.00013854
## - h.2person                                                                    0.00017478
## - Emp.Real.estate.and.rental.and.leasing                                       0.00017613
## - age20.24                                                                     0.00018422
## + age0.4                                                                       0.00000001
## + age90.over                                                                   0.00000001
## + Emp.Retail.trade                                                             0.00000000
## + Pyr.Arts..entertainment..and.recreation                                      0.00000000
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00021433
## - Pyr.Health.care.and.social.assistance                                        0.00021461
## - h.1person                                                                    0.00022914
## - rAsian                                                                       0.00025609
## - Emp.Finance.and.insurance                                                    0.00034447
## - Emp.Wholesale.trade                                                          0.00041321
## - total.population                                                             0.00043574
## - Pyr.Wholesale.trade                                                          0.00049298
## - Emp.Manufacturing                                                            0.00052756
## - age50.54                                                                     0.00055777
## - Pyr.Other.services..except.public.administration.                            0.00056099
## - family.households                                                            0.00060007
## - age10.14                                                                     0.00074772
## - Pyr.Retail.trade                                                             0.00077213
## - age70.74                                                                     0.00077872
## - age85.89                                                                     0.00080346
## - age55.59                                                                     0.00093627
## - Emp.Other.services..except.public.administration.                            0.00100177
## - male                                                                         0.00103967
##                                                                                    RSS
## - Emp.Arts..entertainment..and.recreation                                      0.14133
## - Pyr.Accommodation.and.food.services                                          0.14133
## - age5.9                                                                       0.14133
## - rWhite                                                                       0.14133
## - h.6person                                                                    0.14134
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14134
## - age45.49                                                                     0.14134
## - Emp.Transportation.and.warehousing.104.                                      0.14134
## - Pyr.Transportation.and.warehousing.104.                                      0.14134
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14135
## - Emp.Accommodation.and.food.services                                          0.14135
## - age25.29                                                                     0.14135
## - age60.64                                                                     0.14135
## - rAmericanIndian.AlaskaNative                                                 0.14135
## - rBlack.AfricanAmerican                                                       0.14135
## - age40.44                                                                     0.14135
## - rOther                                                                       0.14136
## - h.4person                                                                    0.14136
## - Emp.Information                                                              0.14136
## - Pyr.Educational.services                                                     0.14137
## - age80.84                                                                     0.14137
## - Pyr.Professional..scientific..and.technical.services                         0.14137
## - Emp.Professional..scientific..and.technical.services                         0.14138
## - Emp.Educational.services                                                     0.14138
## - Emp.Health.care.and.social.assistance                                        0.14139
## - h.5person                                                                    0.14139
## - Pyr.Utilities                                                                0.14139
## - age30.34                                                                     0.14139
## - Pyr.Manufacturing                                                            0.14140
## - total.households                                                             0.14140
## - Emp.Utilities                                                                0.14140
## - rNativeHawaiian.OtherPacificIslander                                         0.14142
## <none>                                                                         0.14133
## - Pyr.Finance.and.insurance                                                    0.14143
## - age75.79                                                                     0.14143
## - h.3person                                                                    0.14143
## - age15.19                                                                     0.14144
## - Pyr.Information                                                              0.14146
## - age65.69                                                                     0.14146
## - age35.39                                                                     0.14147
## - h.2person                                                                    0.14151
## - Emp.Real.estate.and.rental.and.leasing                                       0.14151
## - age20.24                                                                     0.14152
## + age0.4                                                                       0.14133
## + age90.over                                                                   0.14133
## + Emp.Retail.trade                                                             0.14133
## + Pyr.Arts..entertainment..and.recreation                                      0.14133
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14155
## - Pyr.Health.care.and.social.assistance                                        0.14155
## - h.1person                                                                    0.14156
## - rAsian                                                                       0.14159
## - Emp.Finance.and.insurance                                                    0.14167
## - Emp.Wholesale.trade                                                          0.14174
## - total.population                                                             0.14177
## - Pyr.Wholesale.trade                                                          0.14182
## - Emp.Manufacturing                                                            0.14186
## - age50.54                                                                     0.14189
## - Pyr.Other.services..except.public.administration.                            0.14189
## - family.households                                                            0.14193
## - age10.14                                                                     0.14208
## - Pyr.Retail.trade                                                             0.14210
## - age70.74                                                                     0.14211
## - age85.89                                                                     0.14213
## - age55.59                                                                     0.14227
## - Emp.Other.services..except.public.administration.                            0.14233
## - male                                                                         0.14237
##                                                                                   AIC
## - Emp.Arts..entertainment..and.recreation                                      -30250
## - Pyr.Accommodation.and.food.services                                          -30250
## - age5.9                                                                       -30250
## - rWhite                                                                       -30250
## - h.6person                                                                    -30250
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30250
## - age45.49                                                                     -30250
## - Emp.Transportation.and.warehousing.104.                                      -30250
## - Pyr.Transportation.and.warehousing.104.                                      -30249
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30249
## - Emp.Accommodation.and.food.services                                          -30249
## - age25.29                                                                     -30249
## - age60.64                                                                     -30249
## - rAmericanIndian.AlaskaNative                                                 -30249
## - rBlack.AfricanAmerican                                                       -30249
## - age40.44                                                                     -30249
## - rOther                                                                       -30249
## - h.4person                                                                    -30249
## - Emp.Information                                                              -30249
## - Pyr.Educational.services                                                     -30249
## - age80.84                                                                     -30249
## - Pyr.Professional..scientific..and.technical.services                         -30249
## - Emp.Professional..scientific..and.technical.services                         -30249
## - Emp.Educational.services                                                     -30249
## - Emp.Health.care.and.social.assistance                                        -30249
## - h.5person                                                                    -30249
## - Pyr.Utilities                                                                -30249
## - age30.34                                                                     -30248
## - Pyr.Manufacturing                                                            -30248
## - total.households                                                             -30248
## - Emp.Utilities                                                                -30248
## - rNativeHawaiian.OtherPacificIslander                                         -30248
## <none>                                                                         -30248
## - Pyr.Finance.and.insurance                                                    -30248
## - age75.79                                                                     -30248
## - h.3person                                                                    -30248
## - age15.19                                                                     -30247
## - Pyr.Information                                                              -30247
## - age65.69                                                                     -30247
## - age35.39                                                                     -30247
## - h.2person                                                                    -30246
## - Emp.Real.estate.and.rental.and.leasing                                       -30246
## - age20.24                                                                     -30246
## + age0.4                                                                       -30246
## + age90.over                                                                   -30246
## + Emp.Retail.trade                                                             -30246
## + Pyr.Arts..entertainment..and.recreation                                      -30246
## - Pyr.Real.estate.and.rental.and.leasing                                       -30245
## - Pyr.Health.care.and.social.assistance                                        -30245
## - h.1person                                                                    -30245
## - rAsian                                                                       -30244
## - Emp.Finance.and.insurance                                                    -30242
## - Emp.Wholesale.trade                                                          -30241
## - total.population                                                             -30240
## - Pyr.Wholesale.trade                                                          -30239
## - Emp.Manufacturing                                                            -30238
## - age50.54                                                                     -30238
## - Pyr.Other.services..except.public.administration.                            -30238
## - family.households                                                            -30237
## - age10.14                                                                     -30234
## - Pyr.Retail.trade                                                             -30233
## - age70.74                                                                     -30233
## - age85.89                                                                     -30233
## - age55.59                                                                     -30230
## - Emp.Other.services..except.public.administration.                            -30228
## - male                                                                         -30227
## 
## Step:  AIC=-30249.75
## growthRate ~ total.population + male + age5.9 + age10.14 + age15.19 + 
##     age20.24 + age25.29 + age30.34 + age35.39 + age40.44 + age45.49 + 
##     age50.54 + age55.59 + age60.64 + age65.69 + age70.74 + age75.79 + 
##     age80.84 + age85.89 + rWhite + rBlack.AfricanAmerican + rAmericanIndian.AlaskaNative + 
##     rAsian + rNativeHawaiian.OtherPacificIslander + rOther + 
##     total.households + family.households + h.1person + h.2person + 
##     h.3person + h.4person + h.5person + h.6person + Pyr.Accommodation.and.food.services + 
##     Pyr.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Pyr.Educational.services + Pyr.Finance.and.insurance + Pyr.Health.care.and.social.assistance + 
##     Pyr.Information + Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Transportation.and.warehousing.104. + 
##     Pyr.Utilities + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Educational.services + Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Information + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Transportation.and.warehousing.104. + Emp.Utilities + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - Pyr.Accommodation.and.food.services                                           1
## - age5.9                                                                        1
## - rWhite                                                                        1
## - h.6person                                                                     1
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## - age45.49                                                                      1
## - Emp.Transportation.and.warehousing.104.                                       1
## - Pyr.Transportation.and.warehousing.104.                                       1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Accommodation.and.food.services                                           1
## - age25.29                                                                      1
## - age60.64                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - rBlack.AfricanAmerican                                                        1
## - age40.44                                                                      1
## - h.4person                                                                     1
## - rOther                                                                        1
## - Emp.Information                                                               1
## - Pyr.Educational.services                                                      1
## - age80.84                                                                      1
## - Pyr.Professional..scientific..and.technical.services                          1
## - Emp.Professional..scientific..and.technical.services                          1
## - Emp.Educational.services                                                      1
## - Emp.Health.care.and.social.assistance                                         1
## - h.5person                                                                     1
## - Pyr.Utilities                                                                 1
## - age30.34                                                                      1
## - Pyr.Manufacturing                                                             1
## - total.households                                                              1
## - Emp.Utilities                                                                 1
## - rNativeHawaiian.OtherPacificIslander                                          1
## <none>                                                                           
## - Pyr.Finance.and.insurance                                                     1
## - age75.79                                                                      1
## - h.3person                                                                     1
## - age15.19                                                                      1
## - Pyr.Information                                                               1
## - age65.69                                                                      1
## - age35.39                                                                      1
## - h.2person                                                                     1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## - age20.24                                                                      1
## + Emp.Arts..entertainment..and.recreation                                       1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + age0.4                                                                        1
## + age90.over                                                                    1
## + Emp.Retail.trade                                                              1
## - Pyr.Health.care.and.social.assistance                                         1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - h.1person                                                                     1
## - rAsian                                                                        1
## - Emp.Finance.and.insurance                                                     1
## - Emp.Wholesale.trade                                                           1
## - total.population                                                              1
## - Pyr.Wholesale.trade                                                           1
## - Emp.Manufacturing                                                             1
## - age50.54                                                                      1
## - Pyr.Other.services..except.public.administration.                             1
## - family.households                                                             1
## - age10.14                                                                      1
## - Pyr.Retail.trade                                                              1
## - age70.74                                                                      1
## - age85.89                                                                      1
## - age55.59                                                                      1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
##                                                                                 Sum of Sq
## - Pyr.Accommodation.and.food.services                                          0.00000009
## - age5.9                                                                       0.00000224
## - rWhite                                                                       0.00000326
## - h.6person                                                                    0.00000617
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00000926
## - age45.49                                                                     0.00000959
## - Emp.Transportation.and.warehousing.104.                                      0.00001216
## - Pyr.Transportation.and.warehousing.104.                                      0.00001400
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00001480
## - Emp.Accommodation.and.food.services                                          0.00001509
## - age25.29                                                                     0.00001530
## - age60.64                                                                     0.00001803
## - rAmericanIndian.AlaskaNative                                                 0.00001835
## - rBlack.AfricanAmerican                                                       0.00001861
## - age40.44                                                                     0.00002346
## - h.4person                                                                    0.00002551
## - rOther                                                                       0.00002559
## - Emp.Information                                                              0.00003045
## - Pyr.Educational.services                                                     0.00003567
## - age80.84                                                                     0.00003665
## - Pyr.Professional..scientific..and.technical.services                         0.00004136
## - Emp.Professional..scientific..and.technical.services                         0.00004909
## - Emp.Educational.services                                                     0.00005037
## - Emp.Health.care.and.social.assistance                                        0.00005388
## - h.5person                                                                    0.00005454
## - Pyr.Utilities                                                                0.00005600
## - age30.34                                                                     0.00006464
## - Pyr.Manufacturing                                                            0.00006559
## - total.households                                                             0.00006772
## - Emp.Utilities                                                                0.00007313
## - rNativeHawaiian.OtherPacificIslander                                         0.00008623
## <none>                                                                                   
## - Pyr.Finance.and.insurance                                                    0.00009519
## - age75.79                                                                     0.00009847
## - h.3person                                                                    0.00010286
## - age15.19                                                                     0.00010819
## - Pyr.Information                                                              0.00013056
## - age65.69                                                                     0.00013078
## - age35.39                                                                     0.00013857
## - h.2person                                                                    0.00017492
## - Emp.Real.estate.and.rental.and.leasing                                       0.00018107
## - age20.24                                                                     0.00018458
## + Emp.Arts..entertainment..and.recreation                                      0.00000003
## + Pyr.Arts..entertainment..and.recreation                                      0.00000003
## + age0.4                                                                       0.00000001
## + age90.over                                                                   0.00000001
## + Emp.Retail.trade                                                             0.00000000
## - Pyr.Health.care.and.social.assistance                                        0.00021500
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00021559
## - h.1person                                                                    0.00022910
## - rAsian                                                                       0.00025634
## - Emp.Finance.and.insurance                                                    0.00034482
## - Emp.Wholesale.trade                                                          0.00041328
## - total.population                                                             0.00043576
## - Pyr.Wholesale.trade                                                          0.00049303
## - Emp.Manufacturing                                                            0.00052848
## - age50.54                                                                     0.00055781
## - Pyr.Other.services..except.public.administration.                            0.00056292
## - family.households                                                            0.00060047
## - age10.14                                                                     0.00074997
## - Pyr.Retail.trade                                                             0.00077889
## - age70.74                                                                     0.00078154
## - age85.89                                                                     0.00080434
## - age55.59                                                                     0.00093861
## - Emp.Other.services..except.public.administration.                            0.00101762
## - male                                                                         0.00104026
##                                                                                    RSS
## - Pyr.Accommodation.and.food.services                                          0.14133
## - age5.9                                                                       0.14133
## - rWhite                                                                       0.14133
## - h.6person                                                                    0.14134
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14134
## - age45.49                                                                     0.14134
## - Emp.Transportation.and.warehousing.104.                                      0.14134
## - Pyr.Transportation.and.warehousing.104.                                      0.14134
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14135
## - Emp.Accommodation.and.food.services                                          0.14135
## - age25.29                                                                     0.14135
## - age60.64                                                                     0.14135
## - rAmericanIndian.AlaskaNative                                                 0.14135
## - rBlack.AfricanAmerican                                                       0.14135
## - age40.44                                                                     0.14135
## - h.4person                                                                    0.14136
## - rOther                                                                       0.14136
## - Emp.Information                                                              0.14136
## - Pyr.Educational.services                                                     0.14137
## - age80.84                                                                     0.14137
## - Pyr.Professional..scientific..and.technical.services                         0.14137
## - Emp.Professional..scientific..and.technical.services                         0.14138
## - Emp.Educational.services                                                     0.14138
## - Emp.Health.care.and.social.assistance                                        0.14139
## - h.5person                                                                    0.14139
## - Pyr.Utilities                                                                0.14139
## - age30.34                                                                     0.14140
## - Pyr.Manufacturing                                                            0.14140
## - total.households                                                             0.14140
## - Emp.Utilities                                                                0.14140
## - rNativeHawaiian.OtherPacificIslander                                         0.14142
## <none>                                                                         0.14133
## - Pyr.Finance.and.insurance                                                    0.14143
## - age75.79                                                                     0.14143
## - h.3person                                                                    0.14143
## - age15.19                                                                     0.14144
## - Pyr.Information                                                              0.14146
## - age65.69                                                                     0.14146
## - age35.39                                                                     0.14147
## - h.2person                                                                    0.14151
## - Emp.Real.estate.and.rental.and.leasing                                       0.14151
## - age20.24                                                                     0.14152
## + Emp.Arts..entertainment..and.recreation                                      0.14133
## + Pyr.Arts..entertainment..and.recreation                                      0.14133
## + age0.4                                                                       0.14133
## + age90.over                                                                   0.14133
## + Emp.Retail.trade                                                             0.14133
## - Pyr.Health.care.and.social.assistance                                        0.14155
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14155
## - h.1person                                                                    0.14156
## - rAsian                                                                       0.14159
## - Emp.Finance.and.insurance                                                    0.14168
## - Emp.Wholesale.trade                                                          0.14174
## - total.population                                                             0.14177
## - Pyr.Wholesale.trade                                                          0.14182
## - Emp.Manufacturing                                                            0.14186
## - age50.54                                                                     0.14189
## - Pyr.Other.services..except.public.administration.                            0.14189
## - family.households                                                            0.14193
## - age10.14                                                                     0.14208
## - Pyr.Retail.trade                                                             0.14211
## - age70.74                                                                     0.14211
## - age85.89                                                                     0.14214
## - age55.59                                                                     0.14227
## - Emp.Other.services..except.public.administration.                            0.14235
## - male                                                                         0.14237
##                                                                                   AIC
## - Pyr.Accommodation.and.food.services                                          -30252
## - age5.9                                                                       -30252
## - rWhite                                                                       -30252
## - h.6person                                                                    -30252
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30252
## - age45.49                                                                     -30252
## - Emp.Transportation.and.warehousing.104.                                      -30252
## - Pyr.Transportation.and.warehousing.104.                                      -30251
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30251
## - Emp.Accommodation.and.food.services                                          -30251
## - age25.29                                                                     -30251
## - age60.64                                                                     -30251
## - rAmericanIndian.AlaskaNative                                                 -30251
## - rBlack.AfricanAmerican                                                       -30251
## - age40.44                                                                     -30251
## - h.4person                                                                    -30251
## - rOther                                                                       -30251
## - Emp.Information                                                              -30251
## - Pyr.Educational.services                                                     -30251
## - age80.84                                                                     -30251
## - Pyr.Professional..scientific..and.technical.services                         -30251
## - Emp.Professional..scientific..and.technical.services                         -30251
## - Emp.Educational.services                                                     -30251
## - Emp.Health.care.and.social.assistance                                        -30251
## - h.5person                                                                    -30251
## - Pyr.Utilities                                                                -30251
## - age30.34                                                                     -30250
## - Pyr.Manufacturing                                                            -30250
## - total.households                                                             -30250
## - Emp.Utilities                                                                -30250
## - rNativeHawaiian.OtherPacificIslander                                         -30250
## <none>                                                                         -30250
## - Pyr.Finance.and.insurance                                                    -30250
## - age75.79                                                                     -30250
## - h.3person                                                                    -30250
## - age15.19                                                                     -30249
## - Pyr.Information                                                              -30249
## - age65.69                                                                     -30249
## - age35.39                                                                     -30249
## - h.2person                                                                    -30248
## - Emp.Real.estate.and.rental.and.leasing                                       -30248
## - age20.24                                                                     -30248
## + Emp.Arts..entertainment..and.recreation                                      -30248
## + Pyr.Arts..entertainment..and.recreation                                      -30248
## + age0.4                                                                       -30248
## + age90.over                                                                   -30248
## + Emp.Retail.trade                                                             -30248
## - Pyr.Health.care.and.social.assistance                                        -30247
## - Pyr.Real.estate.and.rental.and.leasing                                       -30247
## - h.1person                                                                    -30247
## - rAsian                                                                       -30246
## - Emp.Finance.and.insurance                                                    -30244
## - Emp.Wholesale.trade                                                          -30243
## - total.population                                                             -30242
## - Pyr.Wholesale.trade                                                          -30241
## - Emp.Manufacturing                                                            -30240
## - age50.54                                                                     -30240
## - Pyr.Other.services..except.public.administration.                            -30240
## - family.households                                                            -30239
## - age10.14                                                                     -30236
## - Pyr.Retail.trade                                                             -30235
## - age70.74                                                                     -30235
## - age85.89                                                                     -30235
## - age55.59                                                                     -30232
## - Emp.Other.services..except.public.administration.                            -30230
## - male                                                                         -30229
## 
## Step:  AIC=-30251.75
## growthRate ~ total.population + male + age5.9 + age10.14 + age15.19 + 
##     age20.24 + age25.29 + age30.34 + age35.39 + age40.44 + age45.49 + 
##     age50.54 + age55.59 + age60.64 + age65.69 + age70.74 + age75.79 + 
##     age80.84 + age85.89 + rWhite + rBlack.AfricanAmerican + rAmericanIndian.AlaskaNative + 
##     rAsian + rNativeHawaiian.OtherPacificIslander + rOther + 
##     total.households + family.households + h.1person + h.2person + 
##     h.3person + h.4person + h.5person + h.6person + Pyr.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Pyr.Educational.services + Pyr.Finance.and.insurance + Pyr.Health.care.and.social.assistance + 
##     Pyr.Information + Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Transportation.and.warehousing.104. + 
##     Pyr.Utilities + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Educational.services + Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Information + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Transportation.and.warehousing.104. + Emp.Utilities + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - age5.9                                                                        1
## - rWhite                                                                        1
## - h.6person                                                                     1
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## - age45.49                                                                      1
## - Emp.Transportation.and.warehousing.104.                                       1
## - Pyr.Transportation.and.warehousing.104.                                       1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - age25.29                                                                      1
## - age60.64                                                                      1
## - rBlack.AfricanAmerican                                                        1
## - rAmericanIndian.AlaskaNative                                                  1
## - age40.44                                                                      1
## - h.4person                                                                     1
## - rOther                                                                        1
## - Emp.Information                                                               1
## - Pyr.Educational.services                                                      1
## - age80.84                                                                      1
## - Pyr.Professional..scientific..and.technical.services                          1
## - Emp.Professional..scientific..and.technical.services                          1
## - Emp.Educational.services                                                      1
## - Emp.Health.care.and.social.assistance                                         1
## - h.5person                                                                     1
## - Pyr.Utilities                                                                 1
## - age30.34                                                                      1
## - Pyr.Manufacturing                                                             1
## - total.households                                                              1
## - Emp.Utilities                                                                 1
## - Emp.Accommodation.and.food.services                                           1
## - rNativeHawaiian.OtherPacificIslander                                          1
## <none>                                                                           
## - Pyr.Finance.and.insurance                                                     1
## - age75.79                                                                      1
## - h.3person                                                                     1
## - age15.19                                                                      1
## - Pyr.Information                                                               1
## - age65.69                                                                      1
## - age35.39                                                                      1
## - h.2person                                                                     1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## - age20.24                                                                      1
## + Pyr.Accommodation.and.food.services                                           1
## + age0.4                                                                        1
## + age90.over                                                                    1
## + Emp.Arts..entertainment..and.recreation                                       1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + Emp.Retail.trade                                                              1
## - Pyr.Health.care.and.social.assistance                                         1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - h.1person                                                                     1
## - rAsian                                                                        1
## - Emp.Finance.and.insurance                                                     1
## - Emp.Wholesale.trade                                                           1
## - total.population                                                              1
## - Pyr.Wholesale.trade                                                           1
## - Emp.Manufacturing                                                             1
## - age50.54                                                                      1
## - Pyr.Other.services..except.public.administration.                             1
## - family.households                                                             1
## - age10.14                                                                      1
## - age70.74                                                                      1
## - age85.89                                                                      1
## - Pyr.Retail.trade                                                              1
## - age55.59                                                                      1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
##                                                                                 Sum of Sq
## - age5.9                                                                       0.00000226
## - rWhite                                                                       0.00000318
## - h.6person                                                                    0.00000612
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00000929
## - age45.49                                                                     0.00000955
## - Emp.Transportation.and.warehousing.104.                                      0.00001227
## - Pyr.Transportation.and.warehousing.104.                                      0.00001391
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00001491
## - age25.29                                                                     0.00001552
## - age60.64                                                                     0.00001794
## - rBlack.AfricanAmerican                                                       0.00001857
## - rAmericanIndian.AlaskaNative                                                 0.00001891
## - age40.44                                                                     0.00002337
## - h.4person                                                                    0.00002589
## - rOther                                                                       0.00002631
## - Emp.Information                                                              0.00003040
## - Pyr.Educational.services                                                     0.00003617
## - age80.84                                                                     0.00003703
## - Pyr.Professional..scientific..and.technical.services                         0.00004143
## - Emp.Professional..scientific..and.technical.services                         0.00004918
## - Emp.Educational.services                                                     0.00005103
## - Emp.Health.care.and.social.assistance                                        0.00005428
## - h.5person                                                                    0.00005466
## - Pyr.Utilities                                                                0.00005614
## - age30.34                                                                     0.00006467
## - Pyr.Manufacturing                                                            0.00006638
## - total.households                                                             0.00006782
## - Emp.Utilities                                                                0.00007321
## - Emp.Accommodation.and.food.services                                          0.00007339
## - rNativeHawaiian.OtherPacificIslander                                         0.00008745
## <none>                                                                                   
## - Pyr.Finance.and.insurance                                                    0.00009524
## - age75.79                                                                     0.00009842
## - h.3person                                                                    0.00010282
## - age15.19                                                                     0.00010810
## - Pyr.Information                                                              0.00013047
## - age65.69                                                                     0.00013068
## - age35.39                                                                     0.00013865
## - h.2person                                                                    0.00017630
## - Emp.Real.estate.and.rental.and.leasing                                       0.00018466
## - age20.24                                                                     0.00018472
## + Pyr.Accommodation.and.food.services                                          0.00000009
## + age0.4                                                                       0.00000001
## + age90.over                                                                   0.00000001
## + Emp.Arts..entertainment..and.recreation                                      0.00000001
## + Pyr.Arts..entertainment..and.recreation                                      0.00000000
## + Emp.Retail.trade                                                             0.00000000
## - Pyr.Health.care.and.social.assistance                                        0.00021609
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00021733
## - h.1person                                                                    0.00023013
## - rAsian                                                                       0.00025941
## - Emp.Finance.and.insurance                                                    0.00034561
## - Emp.Wholesale.trade                                                          0.00041337
## - total.population                                                             0.00043600
## - Pyr.Wholesale.trade                                                          0.00049296
## - Emp.Manufacturing                                                            0.00053235
## - age50.54                                                                     0.00055890
## - Pyr.Other.services..except.public.administration.                            0.00056290
## - family.households                                                            0.00060251
## - age10.14                                                                     0.00075275
## - age70.74                                                                     0.00078155
## - age85.89                                                                     0.00080440
## - Pyr.Retail.trade                                                             0.00086332
## - age55.59                                                                     0.00094277
## - Emp.Other.services..except.public.administration.                            0.00101754
## - male                                                                         0.00104280
##                                                                                    RSS
## - age5.9                                                                       0.14133
## - rWhite                                                                       0.14133
## - h.6person                                                                    0.14134
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14134
## - age45.49                                                                     0.14134
## - Emp.Transportation.and.warehousing.104.                                      0.14134
## - Pyr.Transportation.and.warehousing.104.                                      0.14134
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14135
## - age25.29                                                                     0.14135
## - age60.64                                                                     0.14135
## - rBlack.AfricanAmerican                                                       0.14135
## - rAmericanIndian.AlaskaNative                                                 0.14135
## - age40.44                                                                     0.14135
## - h.4person                                                                    0.14136
## - rOther                                                                       0.14136
## - Emp.Information                                                              0.14136
## - Pyr.Educational.services                                                     0.14137
## - age80.84                                                                     0.14137
## - Pyr.Professional..scientific..and.technical.services                         0.14137
## - Emp.Professional..scientific..and.technical.services                         0.14138
## - Emp.Educational.services                                                     0.14138
## - Emp.Health.care.and.social.assistance                                        0.14139
## - h.5person                                                                    0.14139
## - Pyr.Utilities                                                                0.14139
## - age30.34                                                                     0.14140
## - Pyr.Manufacturing                                                            0.14140
## - total.households                                                             0.14140
## - Emp.Utilities                                                                0.14140
## - Emp.Accommodation.and.food.services                                          0.14140
## - rNativeHawaiian.OtherPacificIslander                                         0.14142
## <none>                                                                         0.14133
## - Pyr.Finance.and.insurance                                                    0.14143
## - age75.79                                                                     0.14143
## - h.3person                                                                    0.14143
## - age15.19                                                                     0.14144
## - Pyr.Information                                                              0.14146
## - age65.69                                                                     0.14146
## - age35.39                                                                     0.14147
## - h.2person                                                                    0.14151
## - Emp.Real.estate.and.rental.and.leasing                                       0.14152
## - age20.24                                                                     0.14152
## + Pyr.Accommodation.and.food.services                                          0.14133
## + age0.4                                                                       0.14133
## + age90.over                                                                   0.14133
## + Emp.Arts..entertainment..and.recreation                                      0.14133
## + Pyr.Arts..entertainment..and.recreation                                      0.14133
## + Emp.Retail.trade                                                             0.14133
## - Pyr.Health.care.and.social.assistance                                        0.14155
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14155
## - h.1person                                                                    0.14156
## - rAsian                                                                       0.14159
## - Emp.Finance.and.insurance                                                    0.14168
## - Emp.Wholesale.trade                                                          0.14174
## - total.population                                                             0.14177
## - Pyr.Wholesale.trade                                                          0.14182
## - Emp.Manufacturing                                                            0.14186
## - age50.54                                                                     0.14189
## - Pyr.Other.services..except.public.administration.                            0.14189
## - family.households                                                            0.14193
## - age10.14                                                                     0.14208
## - age70.74                                                                     0.14211
## - age85.89                                                                     0.14214
## - Pyr.Retail.trade                                                             0.14219
## - age55.59                                                                     0.14227
## - Emp.Other.services..except.public.administration.                            0.14235
## - male                                                                         0.14237
##                                                                                   AIC
## - age5.9                                                                       -30254
## - rWhite                                                                       -30254
## - h.6person                                                                    -30254
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30254
## - age45.49                                                                     -30254
## - Emp.Transportation.and.warehousing.104.                                      -30254
## - Pyr.Transportation.and.warehousing.104.                                      -30253
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30253
## - age25.29                                                                     -30253
## - age60.64                                                                     -30253
## - rBlack.AfricanAmerican                                                       -30253
## - rAmericanIndian.AlaskaNative                                                 -30253
## - age40.44                                                                     -30253
## - h.4person                                                                    -30253
## - rOther                                                                       -30253
## - Emp.Information                                                              -30253
## - Pyr.Educational.services                                                     -30253
## - age80.84                                                                     -30253
## - Pyr.Professional..scientific..and.technical.services                         -30253
## - Emp.Professional..scientific..and.technical.services                         -30253
## - Emp.Educational.services                                                     -30253
## - Emp.Health.care.and.social.assistance                                        -30253
## - h.5person                                                                    -30253
## - Pyr.Utilities                                                                -30253
## - age30.34                                                                     -30252
## - Pyr.Manufacturing                                                            -30252
## - total.households                                                             -30252
## - Emp.Utilities                                                                -30252
## - Emp.Accommodation.and.food.services                                          -30252
## - rNativeHawaiian.OtherPacificIslander                                         -30252
## <none>                                                                         -30252
## - Pyr.Finance.and.insurance                                                    -30252
## - age75.79                                                                     -30252
## - h.3person                                                                    -30252
## - age15.19                                                                     -30251
## - Pyr.Information                                                              -30251
## - age65.69                                                                     -30251
## - age35.39                                                                     -30251
## - h.2person                                                                    -30250
## - Emp.Real.estate.and.rental.and.leasing                                       -30250
## - age20.24                                                                     -30250
## + Pyr.Accommodation.and.food.services                                          -30250
## + age0.4                                                                       -30250
## + age90.over                                                                   -30250
## + Emp.Arts..entertainment..and.recreation                                      -30250
## + Pyr.Arts..entertainment..and.recreation                                      -30250
## + Emp.Retail.trade                                                             -30250
## - Pyr.Health.care.and.social.assistance                                        -30249
## - Pyr.Real.estate.and.rental.and.leasing                                       -30249
## - h.1person                                                                    -30249
## - rAsian                                                                       -30248
## - Emp.Finance.and.insurance                                                    -30246
## - Emp.Wholesale.trade                                                          -30245
## - total.population                                                             -30244
## - Pyr.Wholesale.trade                                                          -30243
## - Emp.Manufacturing                                                            -30242
## - age50.54                                                                     -30242
## - Pyr.Other.services..except.public.administration.                            -30242
## - family.households                                                            -30241
## - age10.14                                                                     -30238
## - age70.74                                                                     -30237
## - age85.89                                                                     -30237
## - Pyr.Retail.trade                                                             -30235
## - age55.59                                                                     -30234
## - Emp.Other.services..except.public.administration.                            -30232
## - male                                                                         -30231
## 
## Step:  AIC=-30253.7
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age25.29 + age30.34 + age35.39 + age40.44 + age45.49 + 
##     age50.54 + age55.59 + age60.64 + age65.69 + age70.74 + age75.79 + 
##     age80.84 + age85.89 + rWhite + rBlack.AfricanAmerican + rAmericanIndian.AlaskaNative + 
##     rAsian + rNativeHawaiian.OtherPacificIslander + rOther + 
##     total.households + family.households + h.1person + h.2person + 
##     h.3person + h.4person + h.5person + h.6person + Pyr.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Pyr.Educational.services + Pyr.Finance.and.insurance + Pyr.Health.care.and.social.assistance + 
##     Pyr.Information + Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Transportation.and.warehousing.104. + 
##     Pyr.Utilities + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Educational.services + Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Information + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Transportation.and.warehousing.104. + Emp.Utilities + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - rWhite                                                                        1
## - h.6person                                                                     1
## - age45.49                                                                      1
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Transportation.and.warehousing.104.                                       1
## - Pyr.Transportation.and.warehousing.104.                                       1
## - age25.29                                                                      1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - rBlack.AfricanAmerican                                                        1
## - rAmericanIndian.AlaskaNative                                                  1
## - rOther                                                                        1
## - h.4person                                                                     1
## - Emp.Information                                                               1
## - age80.84                                                                      1
## - Pyr.Educational.services                                                      1
## - age60.64                                                                      1
## - Pyr.Professional..scientific..and.technical.services                          1
## - age40.44                                                                      1
## - Emp.Professional..scientific..and.technical.services                          1
## - Emp.Educational.services                                                      1
## - h.5person                                                                     1
## - Emp.Health.care.and.social.assistance                                         1
## - Pyr.Utilities                                                                 1
## - Pyr.Manufacturing                                                             1
## - total.households                                                              1
## - Emp.Accommodation.and.food.services                                           1
## - Emp.Utilities                                                                 1
## - rNativeHawaiian.OtherPacificIslander                                          1
## <none>                                                                           
## - Pyr.Finance.and.insurance                                                     1
## - h.3person                                                                     1
## - age30.34                                                                      1
## - age75.79                                                                      1
## - Pyr.Information                                                               1
## - age35.39                                                                      1
## - h.2person                                                                     1
## + age5.9                                                                        1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## + age0.4                                                                        1
## + age90.over                                                                    1
## + Pyr.Accommodation.and.food.services                                           1
## + Emp.Arts..entertainment..and.recreation                                       1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + Emp.Retail.trade                                                              1
## - age65.69                                                                      1
## - age15.19                                                                      1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - Pyr.Health.care.and.social.assistance                                         1
## - h.1person                                                                     1
## - rAsian                                                                        1
## - Emp.Finance.and.insurance                                                     1
## - Emp.Wholesale.trade                                                           1
## - total.population                                                              1
## - age20.24                                                                      1
## - Pyr.Wholesale.trade                                                           1
## - Emp.Manufacturing                                                             1
## - Pyr.Other.services..except.public.administration.                             1
## - family.households                                                             1
## - age10.14                                                                      1
## - Pyr.Retail.trade                                                              1
## - age50.54                                                                      1
## - Emp.Other.services..except.public.administration.                             1
## - age70.74                                                                      1
## - male                                                                          1
## - age85.89                                                                      1
## - age55.59                                                                      1
##                                                                                 Sum of Sq
## - rWhite                                                                       0.00000308
## - h.6person                                                                    0.00000616
## - age45.49                                                                     0.00000732
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00000939
## - Emp.Transportation.and.warehousing.104.                                      0.00001225
## - Pyr.Transportation.and.warehousing.104.                                      0.00001387
## - age25.29                                                                     0.00001466
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00001472
## - rBlack.AfricanAmerican                                                       0.00001842
## - rAmericanIndian.AlaskaNative                                                 0.00001908
## - rOther                                                                       0.00002643
## - h.4person                                                                    0.00002714
## - Emp.Information                                                              0.00003038
## - age80.84                                                                     0.00003581
## - Pyr.Educational.services                                                     0.00003623
## - age60.64                                                                     0.00003800
## - Pyr.Professional..scientific..and.technical.services                         0.00004166
## - age40.44                                                                     0.00004520
## - Emp.Professional..scientific..and.technical.services                         0.00004972
## - Emp.Educational.services                                                     0.00005133
## - h.5person                                                                    0.00005535
## - Emp.Health.care.and.social.assistance                                        0.00005575
## - Pyr.Utilities                                                                0.00005662
## - Pyr.Manufacturing                                                            0.00006753
## - total.households                                                             0.00006757
## - Emp.Accommodation.and.food.services                                          0.00007321
## - Emp.Utilities                                                                0.00007387
## - rNativeHawaiian.OtherPacificIslander                                         0.00008801
## <none>                                                                                   
## - Pyr.Finance.and.insurance                                                    0.00009417
## - h.3person                                                                    0.00010250
## - age30.34                                                                     0.00010363
## - age75.79                                                                     0.00012964
## - Pyr.Information                                                              0.00013116
## - age35.39                                                                     0.00015287
## - h.2person                                                                    0.00017745
## + age5.9                                                                       0.00000226
## - Emp.Real.estate.and.rental.and.leasing                                       0.00018424
## + age0.4                                                                       0.00000146
## + age90.over                                                                   0.00000013
## + Pyr.Accommodation.and.food.services                                          0.00000011
## + Emp.Arts..entertainment..and.recreation                                      0.00000000
## + Pyr.Arts..entertainment..and.recreation                                      0.00000000
## + Emp.Retail.trade                                                             0.00000000
## - age65.69                                                                     0.00019636
## - age15.19                                                                     0.00021204
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00021700
## - Pyr.Health.care.and.social.assistance                                        0.00021944
## - h.1person                                                                    0.00023043
## - rAsian                                                                       0.00025998
## - Emp.Finance.and.insurance                                                    0.00034393
## - Emp.Wholesale.trade                                                          0.00041540
## - total.population                                                             0.00043706
## - age20.24                                                                     0.00044092
## - Pyr.Wholesale.trade                                                          0.00049419
## - Emp.Manufacturing                                                            0.00053676
## - Pyr.Other.services..except.public.administration.                            0.00056452
## - family.households                                                            0.00061096
## - age10.14                                                                     0.00085258
## - Pyr.Retail.trade                                                             0.00086419
## - age50.54                                                                     0.00088696
## - Emp.Other.services..except.public.administration.                            0.00101998
## - age70.74                                                                     0.00103000
## - male                                                                         0.00104929
## - age85.89                                                                     0.00110000
## - age55.59                                                                     0.00138288
##                                                                                    RSS
## - rWhite                                                                       0.14134
## - h.6person                                                                    0.14134
## - age45.49                                                                     0.14134
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14134
## - Emp.Transportation.and.warehousing.104.                                      0.14134
## - Pyr.Transportation.and.warehousing.104.                                      0.14135
## - age25.29                                                                     0.14135
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14135
## - rBlack.AfricanAmerican                                                       0.14135
## - rAmericanIndian.AlaskaNative                                                 0.14135
## - rOther                                                                       0.14136
## - h.4person                                                                    0.14136
## - Emp.Information                                                              0.14136
## - age80.84                                                                     0.14137
## - Pyr.Educational.services                                                     0.14137
## - age60.64                                                                     0.14137
## - Pyr.Professional..scientific..and.technical.services                         0.14138
## - age40.44                                                                     0.14138
## - Emp.Professional..scientific..and.technical.services                         0.14138
## - Emp.Educational.services                                                     0.14139
## - h.5person                                                                    0.14139
## - Emp.Health.care.and.social.assistance                                        0.14139
## - Pyr.Utilities                                                                0.14139
## - Pyr.Manufacturing                                                            0.14140
## - total.households                                                             0.14140
## - Emp.Accommodation.and.food.services                                          0.14141
## - Emp.Utilities                                                                0.14141
## - rNativeHawaiian.OtherPacificIslander                                         0.14142
## <none>                                                                         0.14133
## - Pyr.Finance.and.insurance                                                    0.14143
## - h.3person                                                                    0.14144
## - age30.34                                                                     0.14144
## - age75.79                                                                     0.14146
## - Pyr.Information                                                              0.14146
## - age35.39                                                                     0.14149
## - h.2person                                                                    0.14151
## + age5.9                                                                       0.14133
## - Emp.Real.estate.and.rental.and.leasing                                       0.14152
## + age0.4                                                                       0.14133
## + age90.over                                                                   0.14133
## + Pyr.Accommodation.and.food.services                                          0.14133
## + Emp.Arts..entertainment..and.recreation                                      0.14133
## + Pyr.Arts..entertainment..and.recreation                                      0.14133
## + Emp.Retail.trade                                                             0.14133
## - age65.69                                                                     0.14153
## - age15.19                                                                     0.14155
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14155
## - Pyr.Health.care.and.social.assistance                                        0.14155
## - h.1person                                                                    0.14156
## - rAsian                                                                       0.14159
## - Emp.Finance.and.insurance                                                    0.14168
## - Emp.Wholesale.trade                                                          0.14175
## - total.population                                                             0.14177
## - age20.24                                                                     0.14177
## - Pyr.Wholesale.trade                                                          0.14183
## - Emp.Manufacturing                                                            0.14187
## - Pyr.Other.services..except.public.administration.                            0.14190
## - family.households                                                            0.14194
## - age10.14                                                                     0.14219
## - Pyr.Retail.trade                                                             0.14220
## - age50.54                                                                     0.14222
## - Emp.Other.services..except.public.administration.                            0.14235
## - age70.74                                                                     0.14236
## - male                                                                         0.14238
## - age85.89                                                                     0.14243
## - age55.59                                                                     0.14272
##                                                                                   AIC
## - rWhite                                                                       -30256
## - h.6person                                                                    -30256
## - age45.49                                                                     -30256
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30256
## - Emp.Transportation.and.warehousing.104.                                      -30255
## - Pyr.Transportation.and.warehousing.104.                                      -30255
## - age25.29                                                                     -30255
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30255
## - rBlack.AfricanAmerican                                                       -30255
## - rAmericanIndian.AlaskaNative                                                 -30255
## - rOther                                                                       -30255
## - h.4person                                                                    -30255
## - Emp.Information                                                              -30255
## - age80.84                                                                     -30255
## - Pyr.Educational.services                                                     -30255
## - age60.64                                                                     -30255
## - Pyr.Professional..scientific..and.technical.services                         -30255
## - age40.44                                                                     -30255
## - Emp.Professional..scientific..and.technical.services                         -30255
## - Emp.Educational.services                                                     -30255
## - h.5person                                                                    -30255
## - Emp.Health.care.and.social.assistance                                        -30255
## - Pyr.Utilities                                                                -30255
## - Pyr.Manufacturing                                                            -30254
## - total.households                                                             -30254
## - Emp.Accommodation.and.food.services                                          -30254
## - Emp.Utilities                                                                -30254
## - rNativeHawaiian.OtherPacificIslander                                         -30254
## <none>                                                                         -30254
## - Pyr.Finance.and.insurance                                                    -30254
## - h.3person                                                                    -30254
## - age30.34                                                                     -30254
## - age75.79                                                                     -30253
## - Pyr.Information                                                              -30253
## - age35.39                                                                     -30252
## - h.2person                                                                    -30252
## + age5.9                                                                       -30252
## - Emp.Real.estate.and.rental.and.leasing                                       -30252
## + age0.4                                                                       -30252
## + age90.over                                                                   -30252
## + Pyr.Accommodation.and.food.services                                          -30252
## + Emp.Arts..entertainment..and.recreation                                      -30252
## + Pyr.Arts..entertainment..and.recreation                                      -30252
## + Emp.Retail.trade                                                             -30252
## - age65.69                                                                     -30252
## - age15.19                                                                     -30251
## - Pyr.Real.estate.and.rental.and.leasing                                       -30251
## - Pyr.Health.care.and.social.assistance                                        -30251
## - h.1person                                                                    -30251
## - rAsian                                                                       -30250
## - Emp.Finance.and.insurance                                                    -30248
## - Emp.Wholesale.trade                                                          -30247
## - total.population                                                             -30246
## - age20.24                                                                     -30246
## - Pyr.Wholesale.trade                                                          -30245
## - Emp.Manufacturing                                                            -30244
## - Pyr.Other.services..except.public.administration.                            -30244
## - family.households                                                            -30243
## - age10.14                                                                     -30237
## - Pyr.Retail.trade                                                             -30237
## - age50.54                                                                     -30237
## - Emp.Other.services..except.public.administration.                            -30234
## - age70.74                                                                     -30234
## - male                                                                         -30233
## - age85.89                                                                     -30232
## - age55.59                                                                     -30226
## 
## Step:  AIC=-30255.63
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age25.29 + age30.34 + age35.39 + age40.44 + age45.49 + 
##     age50.54 + age55.59 + age60.64 + age65.69 + age70.74 + age75.79 + 
##     age80.84 + age85.89 + rBlack.AfricanAmerican + rAmericanIndian.AlaskaNative + 
##     rAsian + rNativeHawaiian.OtherPacificIslander + rOther + 
##     total.households + family.households + h.1person + h.2person + 
##     h.3person + h.4person + h.5person + h.6person + Pyr.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Pyr.Educational.services + Pyr.Finance.and.insurance + Pyr.Health.care.and.social.assistance + 
##     Pyr.Information + Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Transportation.and.warehousing.104. + 
##     Pyr.Utilities + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Educational.services + Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Information + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Transportation.and.warehousing.104. + Emp.Utilities + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - h.6person                                                                     1
## - age45.49                                                                      1
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Transportation.and.warehousing.104.                                       1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Pyr.Transportation.and.warehousing.104.                                       1
## - age25.29                                                                      1
## - Emp.Information                                                               1
## - h.4person                                                                     1
## - age80.84                                                                      1
## - Pyr.Educational.services                                                      1
## - age60.64                                                                      1
## - Pyr.Professional..scientific..and.technical.services                          1
## - age40.44                                                                      1
## - Emp.Professional..scientific..and.technical.services                          1
## - Emp.Educational.services                                                      1
## - Emp.Health.care.and.social.assistance                                         1
## - Pyr.Utilities                                                                 1
## - h.5person                                                                     1
## - total.households                                                              1
## - Pyr.Manufacturing                                                             1
## - Emp.Accommodation.and.food.services                                           1
## - Emp.Utilities                                                                 1
## <none>                                                                           
## - Pyr.Finance.and.insurance                                                     1
## - h.3person                                                                     1
## - age30.34                                                                      1
## - age75.79                                                                      1
## - Pyr.Information                                                               1
## - age35.39                                                                      1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + age5.9                                                                        1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## + age0.4                                                                        1
## + age90.over                                                                    1
## + Emp.Retail.trade                                                              1
## + Pyr.Accommodation.and.food.services                                           1
## + Emp.Arts..entertainment..and.recreation                                       1
## + Pyr.Arts..entertainment..and.recreation                                       1
## - h.2person                                                                     1
## - age65.69                                                                      1
## - age15.19                                                                      1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - Pyr.Health.care.and.social.assistance                                         1
## - h.1person                                                                     1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - Emp.Finance.and.insurance                                                     1
## - Emp.Wholesale.trade                                                           1
## - total.population                                                              1
## - age20.24                                                                      1
## - Pyr.Wholesale.trade                                                           1
## - rOther                                                                        1
## - Emp.Manufacturing                                                             1
## - Pyr.Other.services..except.public.administration.                             1
## - rBlack.AfricanAmerican                                                        1
## - family.households                                                             1
## - age10.14                                                                      1
## - Pyr.Retail.trade                                                              1
## - age50.54                                                                      1
## - Emp.Other.services..except.public.administration.                             1
## - age70.74                                                                      1
## - male                                                                          1
## - age85.89                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - age55.59                                                                      1
## - rAsian                                                                        1
##                                                                                 Sum of Sq
## - h.6person                                                                    0.00000499
## - age45.49                                                                     0.00000705
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00000958
## - Emp.Transportation.and.warehousing.104.                                      0.00001248
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00001407
## - Pyr.Transportation.and.warehousing.104.                                      0.00001412
## - age25.29                                                                     0.00001603
## - Emp.Information                                                              0.00003078
## - h.4person                                                                    0.00003163
## - age80.84                                                                     0.00003412
## - Pyr.Educational.services                                                     0.00003612
## - age60.64                                                                     0.00003734
## - Pyr.Professional..scientific..and.technical.services                         0.00004220
## - age40.44                                                                     0.00004839
## - Emp.Professional..scientific..and.technical.services                         0.00004961
## - Emp.Educational.services                                                     0.00005139
## - Emp.Health.care.and.social.assistance                                        0.00005465
## - Pyr.Utilities                                                                0.00005740
## - h.5person                                                                    0.00005977
## - total.households                                                             0.00006472
## - Pyr.Manufacturing                                                            0.00006707
## - Emp.Accommodation.and.food.services                                          0.00007365
## - Emp.Utilities                                                                0.00007488
## <none>                                                                                   
## - Pyr.Finance.and.insurance                                                    0.00009540
## - h.3person                                                                    0.00009959
## - age30.34                                                                     0.00010455
## - age75.79                                                                     0.00013166
## - Pyr.Information                                                              0.00013378
## - age35.39                                                                     0.00015116
## + rWhite                                                                       0.00000308
## + rMultiple                                                                    0.00000308
## + age5.9                                                                       0.00000216
## - Emp.Real.estate.and.rental.and.leasing                                       0.00018442
## + age0.4                                                                       0.00000135
## + age90.over                                                                   0.00000015
## + Emp.Retail.trade                                                             0.00000003
## + Pyr.Accommodation.and.food.services                                          0.00000001
## + Emp.Arts..entertainment..and.recreation                                      0.00000000
## + Pyr.Arts..entertainment..and.recreation                                      0.00000000
## - h.2person                                                                    0.00019291
## - age65.69                                                                     0.00019386
## - age15.19                                                                     0.00021106
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00021589
## - Pyr.Health.care.and.social.assistance                                        0.00021677
## - h.1person                                                                    0.00022766
## - rNativeHawaiian.OtherPacificIslander                                         0.00024796
## - Emp.Finance.and.insurance                                                    0.00034442
## - Emp.Wholesale.trade                                                          0.00041404
## - total.population                                                             0.00043752
## - age20.24                                                                     0.00044974
## - Pyr.Wholesale.trade                                                          0.00049124
## - rOther                                                                       0.00050859
## - Emp.Manufacturing                                                            0.00053606
## - Pyr.Other.services..except.public.administration.                            0.00056697
## - rBlack.AfricanAmerican                                                       0.00056762
## - family.households                                                            0.00062659
## - age10.14                                                                     0.00084954
## - Pyr.Retail.trade                                                             0.00086148
## - age50.54                                                                     0.00088445
## - Emp.Other.services..except.public.administration.                            0.00102406
## - age70.74                                                                     0.00103126
## - male                                                                         0.00104726
## - age85.89                                                                     0.00109892
## - rAmericanIndian.AlaskaNative                                                 0.00120500
## - age55.59                                                                     0.00139174
## - rAsian                                                                       0.00174352
##                                                                                    RSS
## - h.6person                                                                    0.14134
## - age45.49                                                                     0.14134
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14135
## - Emp.Transportation.and.warehousing.104.                                      0.14135
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14135
## - Pyr.Transportation.and.warehousing.104.                                      0.14135
## - age25.29                                                                     0.14135
## - Emp.Information                                                              0.14137
## - h.4person                                                                    0.14137
## - age80.84                                                                     0.14137
## - Pyr.Educational.services                                                     0.14137
## - age60.64                                                                     0.14137
## - Pyr.Professional..scientific..and.technical.services                         0.14138
## - age40.44                                                                     0.14139
## - Emp.Professional..scientific..and.technical.services                         0.14139
## - Emp.Educational.services                                                     0.14139
## - Emp.Health.care.and.social.assistance                                        0.14139
## - Pyr.Utilities                                                                0.14139
## - h.5person                                                                    0.14140
## - total.households                                                             0.14140
## - Pyr.Manufacturing                                                            0.14140
## - Emp.Accommodation.and.food.services                                          0.14141
## - Emp.Utilities                                                                0.14141
## <none>                                                                         0.14134
## - Pyr.Finance.and.insurance                                                    0.14143
## - h.3person                                                                    0.14144
## - age30.34                                                                     0.14144
## - age75.79                                                                     0.14147
## - Pyr.Information                                                              0.14147
## - age35.39                                                                     0.14149
## + rWhite                                                                       0.14133
## + rMultiple                                                                    0.14133
## + age5.9                                                                       0.14133
## - Emp.Real.estate.and.rental.and.leasing                                       0.14152
## + age0.4                                                                       0.14133
## + age90.over                                                                   0.14134
## + Emp.Retail.trade                                                             0.14134
## + Pyr.Accommodation.and.food.services                                          0.14134
## + Emp.Arts..entertainment..and.recreation                                      0.14134
## + Pyr.Arts..entertainment..and.recreation                                      0.14134
## - h.2person                                                                    0.14153
## - age65.69                                                                     0.14153
## - age15.19                                                                     0.14155
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14155
## - Pyr.Health.care.and.social.assistance                                        0.14155
## - h.1person                                                                    0.14156
## - rNativeHawaiian.OtherPacificIslander                                         0.14158
## - Emp.Finance.and.insurance                                                    0.14168
## - Emp.Wholesale.trade                                                          0.14175
## - total.population                                                             0.14177
## - age20.24                                                                     0.14179
## - Pyr.Wholesale.trade                                                          0.14183
## - rOther                                                                       0.14184
## - Emp.Manufacturing                                                            0.14187
## - Pyr.Other.services..except.public.administration.                            0.14190
## - rBlack.AfricanAmerican                                                       0.14190
## - family.households                                                            0.14196
## - age10.14                                                                     0.14219
## - Pyr.Retail.trade                                                             0.14220
## - age50.54                                                                     0.14222
## - Emp.Other.services..except.public.administration.                            0.14236
## - age70.74                                                                     0.14237
## - male                                                                         0.14238
## - age85.89                                                                     0.14244
## - rAmericanIndian.AlaskaNative                                                 0.14254
## - age55.59                                                                     0.14273
## - rAsian                                                                       0.14308
##                                                                                   AIC
## - h.6person                                                                    -30258
## - age45.49                                                                     -30258
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30257
## - Emp.Transportation.and.warehousing.104.                                      -30257
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30257
## - Pyr.Transportation.and.warehousing.104.                                      -30257
## - age25.29                                                                     -30257
## - Emp.Information                                                              -30257
## - h.4person                                                                    -30257
## - age80.84                                                                     -30257
## - Pyr.Educational.services                                                     -30257
## - age60.64                                                                     -30257
## - Pyr.Professional..scientific..and.technical.services                         -30257
## - age40.44                                                                     -30257
## - Emp.Professional..scientific..and.technical.services                         -30257
## - Emp.Educational.services                                                     -30257
## - Emp.Health.care.and.social.assistance                                        -30257
## - Pyr.Utilities                                                                -30256
## - h.5person                                                                    -30256
## - total.households                                                             -30256
## - Pyr.Manufacturing                                                            -30256
## - Emp.Accommodation.and.food.services                                          -30256
## - Emp.Utilities                                                                -30256
## <none>                                                                         -30256
## - Pyr.Finance.and.insurance                                                    -30256
## - h.3person                                                                    -30256
## - age30.34                                                                     -30255
## - age75.79                                                                     -30255
## - Pyr.Information                                                              -30255
## - age35.39                                                                     -30254
## + rWhite                                                                       -30254
## + rMultiple                                                                    -30254
## + age5.9                                                                       -30254
## - Emp.Real.estate.and.rental.and.leasing                                       -30254
## + age0.4                                                                       -30254
## + age90.over                                                                   -30254
## + Emp.Retail.trade                                                             -30254
## + Pyr.Accommodation.and.food.services                                          -30254
## + Emp.Arts..entertainment..and.recreation                                      -30254
## + Pyr.Arts..entertainment..and.recreation                                      -30254
## - h.2person                                                                    -30254
## - age65.69                                                                     -30254
## - age15.19                                                                     -30253
## - Pyr.Real.estate.and.rental.and.leasing                                       -30253
## - Pyr.Health.care.and.social.assistance                                        -30253
## - h.1person                                                                    -30253
## - rNativeHawaiian.OtherPacificIslander                                         -30252
## - Emp.Finance.and.insurance                                                    -30250
## - Emp.Wholesale.trade                                                          -30249
## - total.population                                                             -30248
## - age20.24                                                                     -30248
## - Pyr.Wholesale.trade                                                          -30247
## - rOther                                                                       -30247
## - Emp.Manufacturing                                                            -30246
## - Pyr.Other.services..except.public.administration.                            -30245
## - rBlack.AfricanAmerican                                                       -30245
## - family.households                                                            -30244
## - age10.14                                                                     -30239
## - Pyr.Retail.trade                                                             -30239
## - age50.54                                                                     -30239
## - Emp.Other.services..except.public.administration.                            -30236
## - age70.74                                                                     -30236
## - male                                                                         -30235
## - age85.89                                                                     -30234
## - rAmericanIndian.AlaskaNative                                                 -30232
## - age55.59                                                                     -30228
## - rAsian                                                                       -30220
## 
## Step:  AIC=-30257.53
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age25.29 + age30.34 + age35.39 + age40.44 + age45.49 + 
##     age50.54 + age55.59 + age60.64 + age65.69 + age70.74 + age75.79 + 
##     age80.84 + age85.89 + rBlack.AfricanAmerican + rAmericanIndian.AlaskaNative + 
##     rAsian + rNativeHawaiian.OtherPacificIslander + rOther + 
##     total.households + family.households + h.1person + h.2person + 
##     h.3person + h.4person + h.5person + Pyr.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Pyr.Educational.services + Pyr.Finance.and.insurance + Pyr.Health.care.and.social.assistance + 
##     Pyr.Information + Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Transportation.and.warehousing.104. + 
##     Pyr.Utilities + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Educational.services + Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Information + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Transportation.and.warehousing.104. + Emp.Utilities + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - age45.49                                                                      1
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Transportation.and.warehousing.104.                                       1
## - Pyr.Transportation.and.warehousing.104.                                       1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - age25.29                                                                      1
## - Emp.Information                                                               1
## - age80.84                                                                      1
## - Pyr.Educational.services                                                      1
## - age60.64                                                                      1
## - Pyr.Professional..scientific..and.technical.services                          1
## - Emp.Professional..scientific..and.technical.services                          1
## - age40.44                                                                      1
## - Emp.Educational.services                                                      1
## - Emp.Health.care.and.social.assistance                                         1
## - Pyr.Utilities                                                                 1
## - Pyr.Manufacturing                                                             1
## - Emp.Utilities                                                                 1
## - Emp.Accommodation.and.food.services                                           1
## - total.households                                                              1
## <none>                                                                           
## - Pyr.Finance.and.insurance                                                     1
## - h.5person                                                                     1
## - age30.34                                                                      1
## - h.4person                                                                     1
## - Pyr.Information                                                               1
## - age75.79                                                                      1
## - h.3person                                                                     1
## - age35.39                                                                      1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## + age5.9                                                                        1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + age0.4                                                                        1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## + age90.over                                                                    1
## + Emp.Retail.trade                                                              1
## + Pyr.Accommodation.and.food.services                                           1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + Emp.Arts..entertainment..and.recreation                                       1
## - age65.69                                                                      1
## - Pyr.Health.care.and.social.assistance                                         1
## - age15.19                                                                      1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - Emp.Finance.and.insurance                                                     1
## - h.1person                                                                     1
## - Emp.Wholesale.trade                                                           1
## - total.population                                                              1
## - age20.24                                                                      1
## - Pyr.Wholesale.trade                                                           1
## - rOther                                                                        1
## - h.2person                                                                     1
## - Emp.Manufacturing                                                             1
## - Pyr.Other.services..except.public.administration.                             1
## - rBlack.AfricanAmerican                                                        1
## - family.households                                                             1
## - age10.14                                                                      1
## - Pyr.Retail.trade                                                              1
## - age50.54                                                                      1
## - Emp.Other.services..except.public.administration.                             1
## - age70.74                                                                      1
## - male                                                                          1
## - age85.89                                                                      1
## - age55.59                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - rAsian                                                                        1
##                                                                                 Sum of Sq
## - age45.49                                                                     0.00000665
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00000948
## - Emp.Transportation.and.warehousing.104.                                      0.00001271
## - Pyr.Transportation.and.warehousing.104.                                      0.00001369
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00001426
## - age25.29                                                                     0.00001580
## - Emp.Information                                                              0.00003092
## - age80.84                                                                     0.00003359
## - Pyr.Educational.services                                                     0.00003623
## - age60.64                                                                     0.00003681
## - Pyr.Professional..scientific..and.technical.services                         0.00004118
## - Emp.Professional..scientific..and.technical.services                         0.00004810
## - age40.44                                                                     0.00004818
## - Emp.Educational.services                                                     0.00005156
## - Emp.Health.care.and.social.assistance                                        0.00005210
## - Pyr.Utilities                                                                0.00005703
## - Pyr.Manufacturing                                                            0.00006673
## - Emp.Utilities                                                                0.00007435
## - Emp.Accommodation.and.food.services                                          0.00007465
## - total.households                                                             0.00008462
## <none>                                                                                   
## - Pyr.Finance.and.insurance                                                    0.00009553
## - h.5person                                                                    0.00010134
## - age30.34                                                                     0.00010692
## - h.4person                                                                    0.00010738
## - Pyr.Information                                                              0.00013315
## - age75.79                                                                     0.00013392
## - h.3person                                                                    0.00014151
## - age35.39                                                                     0.00015063
## + h.6person                                                                    0.00000499
## + h.7person.more                                                               0.00000499
## + age5.9                                                                       0.00000222
## + rWhite                                                                       0.00000191
## + rMultiple                                                                    0.00000191
## + age0.4                                                                       0.00000146
## - Emp.Real.estate.and.rental.and.leasing                                       0.00018522
## + age90.over                                                                   0.00000012
## + Emp.Retail.trade                                                             0.00000006
## + Pyr.Accommodation.and.food.services                                          0.00000000
## + Pyr.Arts..entertainment..and.recreation                                      0.00000000
## + Emp.Arts..entertainment..and.recreation                                      0.00000000
## - age65.69                                                                     0.00019405
## - Pyr.Health.care.and.social.assistance                                        0.00021279
## - age15.19                                                                     0.00021332
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00021645
## - rNativeHawaiian.OtherPacificIslander                                         0.00024993
## - Emp.Finance.and.insurance                                                    0.00034282
## - h.1person                                                                    0.00038163
## - Emp.Wholesale.trade                                                          0.00041604
## - total.population                                                             0.00044409
## - age20.24                                                                     0.00045852
## - Pyr.Wholesale.trade                                                          0.00049173
## - rOther                                                                       0.00050775
## - h.2person                                                                    0.00051947
## - Emp.Manufacturing                                                            0.00053341
## - Pyr.Other.services..except.public.administration.                            0.00056274
## - rBlack.AfricanAmerican                                                       0.00056644
## - family.households                                                            0.00064341
## - age10.14                                                                     0.00085460
## - Pyr.Retail.trade                                                             0.00086114
## - age50.54                                                                     0.00088605
## - Emp.Other.services..except.public.administration.                            0.00101911
## - age70.74                                                                     0.00102771
## - male                                                                         0.00107391
## - age85.89                                                                     0.00109973
## - age55.59                                                                     0.00139820
## - rAmericanIndian.AlaskaNative                                                 0.00140552
## - rAsian                                                                       0.00174735
##                                                                                    RSS
## - age45.49                                                                     0.14135
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14135
## - Emp.Transportation.and.warehousing.104.                                      0.14135
## - Pyr.Transportation.and.warehousing.104.                                      0.14136
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14136
## - age25.29                                                                     0.14136
## - Emp.Information                                                              0.14137
## - age80.84                                                                     0.14138
## - Pyr.Educational.services                                                     0.14138
## - age60.64                                                                     0.14138
## - Pyr.Professional..scientific..and.technical.services                         0.14138
## - Emp.Professional..scientific..and.technical.services                         0.14139
## - age40.44                                                                     0.14139
## - Emp.Educational.services                                                     0.14139
## - Emp.Health.care.and.social.assistance                                        0.14139
## - Pyr.Utilities                                                                0.14140
## - Pyr.Manufacturing                                                            0.14141
## - Emp.Utilities                                                                0.14142
## - Emp.Accommodation.and.food.services                                          0.14142
## - total.households                                                             0.14143
## <none>                                                                         0.14134
## - Pyr.Finance.and.insurance                                                    0.14144
## - h.5person                                                                    0.14144
## - age30.34                                                                     0.14145
## - h.4person                                                                    0.14145
## - Pyr.Information                                                              0.14147
## - age75.79                                                                     0.14147
## - h.3person                                                                    0.14148
## - age35.39                                                                     0.14149
## + h.6person                                                                    0.14134
## + h.7person.more                                                               0.14134
## + age5.9                                                                       0.14134
## + rWhite                                                                       0.14134
## + rMultiple                                                                    0.14134
## + age0.4                                                                       0.14134
## - Emp.Real.estate.and.rental.and.leasing                                       0.14153
## + age90.over                                                                   0.14134
## + Emp.Retail.trade                                                             0.14134
## + Pyr.Accommodation.and.food.services                                          0.14134
## + Pyr.Arts..entertainment..and.recreation                                      0.14134
## + Emp.Arts..entertainment..and.recreation                                      0.14134
## - age65.69                                                                     0.14153
## - Pyr.Health.care.and.social.assistance                                        0.14155
## - age15.19                                                                     0.14155
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14156
## - rNativeHawaiian.OtherPacificIslander                                         0.14159
## - Emp.Finance.and.insurance                                                    0.14168
## - h.1person                                                                    0.14172
## - Emp.Wholesale.trade                                                          0.14176
## - total.population                                                             0.14178
## - age20.24                                                                     0.14180
## - Pyr.Wholesale.trade                                                          0.14183
## - rOther                                                                       0.14185
## - h.2person                                                                    0.14186
## - Emp.Manufacturing                                                            0.14188
## - Pyr.Other.services..except.public.administration.                            0.14190
## - rBlack.AfricanAmerican                                                       0.14191
## - family.households                                                            0.14199
## - age10.14                                                                     0.14220
## - Pyr.Retail.trade                                                             0.14220
## - age50.54                                                                     0.14223
## - Emp.Other.services..except.public.administration.                            0.14236
## - age70.74                                                                     0.14237
## - male                                                                         0.14242
## - age85.89                                                                     0.14244
## - age55.59                                                                     0.14274
## - rAmericanIndian.AlaskaNative                                                 0.14275
## - rAsian                                                                       0.14309
##                                                                                   AIC
## - age45.49                                                                     -30259
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30259
## - Emp.Transportation.and.warehousing.104.                                      -30259
## - Pyr.Transportation.and.warehousing.104.                                      -30259
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30259
## - age25.29                                                                     -30259
## - Emp.Information                                                              -30259
## - age80.84                                                                     -30259
## - Pyr.Educational.services                                                     -30259
## - age60.64                                                                     -30259
## - Pyr.Professional..scientific..and.technical.services                         -30259
## - Emp.Professional..scientific..and.technical.services                         -30259
## - age40.44                                                                     -30259
## - Emp.Educational.services                                                     -30258
## - Emp.Health.care.and.social.assistance                                        -30258
## - Pyr.Utilities                                                                -30258
## - Pyr.Manufacturing                                                            -30258
## - Emp.Utilities                                                                -30258
## - Emp.Accommodation.and.food.services                                          -30258
## - total.households                                                             -30258
## <none>                                                                         -30258
## - Pyr.Finance.and.insurance                                                    -30258
## - h.5person                                                                    -30257
## - age30.34                                                                     -30257
## - h.4person                                                                    -30257
## - Pyr.Information                                                              -30257
## - age75.79                                                                     -30257
## - h.3person                                                                    -30257
## - age35.39                                                                     -30256
## + h.6person                                                                    -30256
## + h.7person.more                                                               -30256
## + age5.9                                                                       -30256
## + rWhite                                                                       -30256
## + rMultiple                                                                    -30256
## + age0.4                                                                       -30256
## - Emp.Real.estate.and.rental.and.leasing                                       -30256
## + age90.over                                                                   -30256
## + Emp.Retail.trade                                                             -30256
## + Pyr.Accommodation.and.food.services                                          -30256
## + Pyr.Arts..entertainment..and.recreation                                      -30256
## + Emp.Arts..entertainment..and.recreation                                      -30256
## - age65.69                                                                     -30255
## - Pyr.Health.care.and.social.assistance                                        -30255
## - age15.19                                                                     -30255
## - Pyr.Real.estate.and.rental.and.leasing                                       -30255
## - rNativeHawaiian.OtherPacificIslander                                         -30254
## - Emp.Finance.and.insurance                                                    -30252
## - h.1person                                                                    -30251
## - Emp.Wholesale.trade                                                          -30251
## - total.population                                                             -30250
## - age20.24                                                                     -30250
## - Pyr.Wholesale.trade                                                          -30249
## - rOther                                                                       -30249
## - h.2person                                                                    -30248
## - Emp.Manufacturing                                                            -30248
## - Pyr.Other.services..except.public.administration.                            -30247
## - rBlack.AfricanAmerican                                                       -30247
## - family.households                                                            -30246
## - age10.14                                                                     -30241
## - Pyr.Retail.trade                                                             -30241
## - age50.54                                                                     -30241
## - Emp.Other.services..except.public.administration.                            -30238
## - age70.74                                                                     -30238
## - male                                                                         -30237
## - age85.89                                                                     -30236
## - age55.59                                                                     -30230
## - rAmericanIndian.AlaskaNative                                                 -30229
## - rAsian                                                                       -30222
## 
## Step:  AIC=-30259.38
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age25.29 + age30.34 + age35.39 + age40.44 + age50.54 + 
##     age55.59 + age60.64 + age65.69 + age70.74 + age75.79 + age80.84 + 
##     age85.89 + rBlack.AfricanAmerican + rAmericanIndian.AlaskaNative + 
##     rAsian + rNativeHawaiian.OtherPacificIslander + rOther + 
##     total.households + family.households + h.1person + h.2person + 
##     h.3person + h.4person + h.5person + Pyr.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Pyr.Educational.services + Pyr.Finance.and.insurance + Pyr.Health.care.and.social.assistance + 
##     Pyr.Information + Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Transportation.and.warehousing.104. + 
##     Pyr.Utilities + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Educational.services + Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Information + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Transportation.and.warehousing.104. + Emp.Utilities + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## - age25.29                                                                      1
## - Pyr.Transportation.and.warehousing.104.                                       1
## - Emp.Transportation.and.warehousing.104.                                       1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - age80.84                                                                      1
## - Emp.Information                                                               1
## - Pyr.Educational.services                                                      1
## - Pyr.Professional..scientific..and.technical.services                          1
## - age40.44                                                                      1
## - Emp.Professional..scientific..and.technical.services                          1
## - age60.64                                                                      1
## - Emp.Educational.services                                                      1
## - Emp.Health.care.and.social.assistance                                         1
## - Pyr.Utilities                                                                 1
## - Pyr.Manufacturing                                                             1
## - Emp.Utilities                                                                 1
## - Emp.Accommodation.and.food.services                                           1
## - total.households                                                              1
## <none>                                                                           
## - Pyr.Finance.and.insurance                                                     1
## - h.5person                                                                     1
## - h.4person                                                                     1
## - Pyr.Information                                                               1
## - h.3person                                                                     1
## - age75.79                                                                      1
## - age30.34                                                                      1
## - age35.39                                                                      1
## + age0.4                                                                        1
## + age45.49                                                                      1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + age90.over                                                                    1
## + Emp.Retail.trade                                                              1
## + age5.9                                                                        1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + Pyr.Accommodation.and.food.services                                           1
## + Emp.Arts..entertainment..and.recreation                                       1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## - Pyr.Health.care.and.social.assistance                                         1
## - age65.69                                                                      1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - age15.19                                                                      1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - Emp.Finance.and.insurance                                                     1
## - h.1person                                                                     1
## - Emp.Wholesale.trade                                                           1
## - total.population                                                              1
## - Pyr.Wholesale.trade                                                           1
## - rOther                                                                        1
## - Emp.Manufacturing                                                             1
## - rBlack.AfricanAmerican                                                        1
## - Pyr.Other.services..except.public.administration.                             1
## - h.2person                                                                     1
## - age20.24                                                                      1
## - family.households                                                             1
## - Pyr.Retail.trade                                                              1
## - age50.54                                                                      1
## - age10.14                                                                      1
## - Emp.Other.services..except.public.administration.                             1
## - age70.74                                                                      1
## - male                                                                          1
## - age85.89                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - age55.59                                                                      1
## - rAsian                                                                        1
##                                                                                 Sum of Sq
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00000891
## - age25.29                                                                     0.00001154
## - Pyr.Transportation.and.warehousing.104.                                      0.00001301
## - Emp.Transportation.and.warehousing.104.                                      0.00001334
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00001434
## - age80.84                                                                     0.00002927
## - Emp.Information                                                              0.00003033
## - Pyr.Educational.services                                                     0.00003623
## - Pyr.Professional..scientific..and.technical.services                         0.00004122
## - age40.44                                                                     0.00004374
## - Emp.Professional..scientific..and.technical.services                         0.00004813
## - age60.64                                                                     0.00004842
## - Emp.Educational.services                                                     0.00005079
## - Emp.Health.care.and.social.assistance                                        0.00005205
## - Pyr.Utilities                                                                0.00005773
## - Pyr.Manufacturing                                                            0.00006620
## - Emp.Utilities                                                                0.00007516
## - Emp.Accommodation.and.food.services                                          0.00007555
## - total.households                                                             0.00007866
## <none>                                                                                   
## - Pyr.Finance.and.insurance                                                    0.00009320
## - h.5person                                                                    0.00010899
## - h.4person                                                                    0.00012974
## - Pyr.Information                                                              0.00013325
## - h.3person                                                                    0.00013594
## - age75.79                                                                     0.00014039
## - age30.34                                                                     0.00014325
## - age35.39                                                                     0.00014415
## + age0.4                                                                       0.00000692
## + age45.49                                                                     0.00000665
## + h.6person                                                                    0.00000459
## + h.7person.more                                                               0.00000459
## + rWhite                                                                       0.00000175
## + rMultiple                                                                    0.00000175
## + age90.over                                                                   0.00000040
## + Emp.Retail.trade                                                             0.00000007
## + age5.9                                                                       0.00000001
## + Pyr.Arts..entertainment..and.recreation                                      0.00000001
## + Pyr.Accommodation.and.food.services                                          0.00000000
## + Emp.Arts..entertainment..and.recreation                                      0.00000000
## - Emp.Real.estate.and.rental.and.leasing                                       0.00018643
## - Pyr.Health.care.and.social.assistance                                        0.00021282
## - age65.69                                                                     0.00021504
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00021724
## - age15.19                                                                     0.00024502
## - rNativeHawaiian.OtherPacificIslander                                         0.00025727
## - Emp.Finance.and.insurance                                                    0.00034037
## - h.1person                                                                    0.00037567
## - Emp.Wholesale.trade                                                          0.00041876
## - total.population                                                             0.00046444
## - Pyr.Wholesale.trade                                                          0.00049541
## - rOther                                                                       0.00050654
## - Emp.Manufacturing                                                            0.00053396
## - rBlack.AfricanAmerican                                                       0.00056114
## - Pyr.Other.services..except.public.administration.                            0.00057058
## - h.2person                                                                    0.00059283
## - age20.24                                                                     0.00061885
## - family.households                                                            0.00069695
## - Pyr.Retail.trade                                                             0.00085591
## - age50.54                                                                     0.00089326
## - age10.14                                                                     0.00094183
## - Emp.Other.services..except.public.administration.                            0.00102794
## - age70.74                                                                     0.00106513
## - male                                                                         0.00108568
## - age85.89                                                                     0.00115868
## - rAmericanIndian.AlaskaNative                                                 0.00140079
## - age55.59                                                                     0.00153455
## - rAsian                                                                       0.00177121
##                                                                                    RSS
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14136
## - age25.29                                                                     0.14136
## - Pyr.Transportation.and.warehousing.104.                                      0.14136
## - Emp.Transportation.and.warehousing.104.                                      0.14136
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14136
## - age80.84                                                                     0.14138
## - Emp.Information                                                              0.14138
## - Pyr.Educational.services                                                     0.14138
## - Pyr.Professional..scientific..and.technical.services                         0.14139
## - age40.44                                                                     0.14139
## - Emp.Professional..scientific..and.technical.services                         0.14140
## - age60.64                                                                     0.14140
## - Emp.Educational.services                                                     0.14140
## - Emp.Health.care.and.social.assistance                                        0.14140
## - Pyr.Utilities                                                                0.14141
## - Pyr.Manufacturing                                                            0.14141
## - Emp.Utilities                                                                0.14142
## - Emp.Accommodation.and.food.services                                          0.14142
## - total.households                                                             0.14143
## <none>                                                                         0.14135
## - Pyr.Finance.and.insurance                                                    0.14144
## - h.5person                                                                    0.14146
## - h.4person                                                                    0.14148
## - Pyr.Information                                                              0.14148
## - h.3person                                                                    0.14148
## - age75.79                                                                     0.14149
## - age30.34                                                                     0.14149
## - age35.39                                                                     0.14149
## + age0.4                                                                       0.14134
## + age45.49                                                                     0.14134
## + h.6person                                                                    0.14134
## + h.7person.more                                                               0.14134
## + rWhite                                                                       0.14135
## + rMultiple                                                                    0.14135
## + age90.over                                                                   0.14135
## + Emp.Retail.trade                                                             0.14135
## + age5.9                                                                       0.14135
## + Pyr.Arts..entertainment..and.recreation                                      0.14135
## + Pyr.Accommodation.and.food.services                                          0.14135
## + Emp.Arts..entertainment..and.recreation                                      0.14135
## - Emp.Real.estate.and.rental.and.leasing                                       0.14153
## - Pyr.Health.care.and.social.assistance                                        0.14156
## - age65.69                                                                     0.14156
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14156
## - age15.19                                                                     0.14159
## - rNativeHawaiian.OtherPacificIslander                                         0.14161
## - Emp.Finance.and.insurance                                                    0.14169
## - h.1person                                                                    0.14172
## - Emp.Wholesale.trade                                                          0.14177
## - total.population                                                             0.14181
## - Pyr.Wholesale.trade                                                          0.14184
## - rOther                                                                       0.14185
## - Emp.Manufacturing                                                            0.14188
## - rBlack.AfricanAmerican                                                       0.14191
## - Pyr.Other.services..except.public.administration.                            0.14192
## - h.2person                                                                    0.14194
## - age20.24                                                                     0.14197
## - family.households                                                            0.14205
## - Pyr.Retail.trade                                                             0.14220
## - age50.54                                                                     0.14224
## - age10.14                                                                     0.14229
## - Emp.Other.services..except.public.administration.                            0.14238
## - age70.74                                                                     0.14241
## - male                                                                         0.14243
## - age85.89                                                                     0.14251
## - rAmericanIndian.AlaskaNative                                                 0.14275
## - age55.59                                                                     0.14288
## - rAsian                                                                       0.14312
##                                                                                   AIC
## - Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30261
## - age25.29                                                                     -30261
## - Pyr.Transportation.and.warehousing.104.                                      -30261
## - Emp.Transportation.and.warehousing.104.                                      -30261
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30261
## - age80.84                                                                     -30261
## - Emp.Information                                                              -30261
## - Pyr.Educational.services                                                     -30261
## - Pyr.Professional..scientific..and.technical.services                         -30261
## - age40.44                                                                     -30260
## - Emp.Professional..scientific..and.technical.services                         -30260
## - age60.64                                                                     -30260
## - Emp.Educational.services                                                     -30260
## - Emp.Health.care.and.social.assistance                                        -30260
## - Pyr.Utilities                                                                -30260
## - Pyr.Manufacturing                                                            -30260
## - Emp.Utilities                                                                -30260
## - Emp.Accommodation.and.food.services                                          -30260
## - total.households                                                             -30260
## <none>                                                                         -30259
## - Pyr.Finance.and.insurance                                                    -30259
## - h.5person                                                                    -30259
## - h.4person                                                                    -30259
## - Pyr.Information                                                              -30259
## - h.3person                                                                    -30259
## - age75.79                                                                     -30258
## - age30.34                                                                     -30258
## - age35.39                                                                     -30258
## + age0.4                                                                       -30258
## + age45.49                                                                     -30258
## + h.6person                                                                    -30258
## + h.7person.more                                                               -30258
## + rWhite                                                                       -30257
## + rMultiple                                                                    -30257
## + age90.over                                                                   -30257
## + Emp.Retail.trade                                                             -30257
## + age5.9                                                                       -30257
## + Pyr.Arts..entertainment..and.recreation                                      -30257
## + Pyr.Accommodation.and.food.services                                          -30257
## + Emp.Arts..entertainment..and.recreation                                      -30257
## - Emp.Real.estate.and.rental.and.leasing                                       -30257
## - Pyr.Health.care.and.social.assistance                                        -30257
## - age65.69                                                                     -30257
## - Pyr.Real.estate.and.rental.and.leasing                                       -30257
## - age15.19                                                                     -30256
## - rNativeHawaiian.OtherPacificIslander                                         -30256
## - Emp.Finance.and.insurance                                                    -30254
## - h.1person                                                                    -30253
## - Emp.Wholesale.trade                                                          -30252
## - total.population                                                             -30251
## - Pyr.Wholesale.trade                                                          -30251
## - rOther                                                                       -30251
## - Emp.Manufacturing                                                            -30250
## - rBlack.AfricanAmerican                                                       -30249
## - Pyr.Other.services..except.public.administration.                            -30249
## - h.2person                                                                    -30249
## - age20.24                                                                     -30248
## - family.households                                                            -30246
## - Pyr.Retail.trade                                                             -30243
## - age50.54                                                                     -30242
## - age10.14                                                                     -30241
## - Emp.Other.services..except.public.administration.                            -30239
## - age70.74                                                                     -30239
## - male                                                                         -30238
## - age85.89                                                                     -30237
## - rAmericanIndian.AlaskaNative                                                 -30231
## - age55.59                                                                     -30229
## - rAsian                                                                       -30224
## 
## Step:  AIC=-30261.19
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age25.29 + age30.34 + age35.39 + age40.44 + age50.54 + 
##     age55.59 + age60.64 + age65.69 + age70.74 + age75.79 + age80.84 + 
##     age85.89 + rBlack.AfricanAmerican + rAmericanIndian.AlaskaNative + 
##     rAsian + rNativeHawaiian.OtherPacificIslander + rOther + 
##     total.households + family.households + h.1person + h.2person + 
##     h.3person + h.4person + h.5person + Pyr.Educational.services + 
##     Pyr.Finance.and.insurance + Pyr.Health.care.and.social.assistance + 
##     Pyr.Information + Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Transportation.and.warehousing.104. + 
##     Pyr.Utilities + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Educational.services + Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Information + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Transportation.and.warehousing.104. + Emp.Utilities + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - age25.29                                                                      1
## - Pyr.Transportation.and.warehousing.104.                                       1
## - Emp.Transportation.and.warehousing.104.                                       1
## - age80.84                                                                      1
## - Emp.Information                                                               1
## - Pyr.Educational.services                                                      1
## - Pyr.Professional..scientific..and.technical.services                          1
## - age40.44                                                                      1
## - age60.64                                                                      1
## - Emp.Professional..scientific..and.technical.services                          1
## - Emp.Educational.services                                                      1
## - Emp.Health.care.and.social.assistance                                         1
## - Pyr.Utilities                                                                 1
## - Pyr.Manufacturing                                                             1
## - Emp.Utilities                                                                 1
## - total.households                                                              1
## - Emp.Accommodation.and.food.services                                           1
## - Pyr.Finance.and.insurance                                                     1
## <none>                                                                           
## - h.5person                                                                     1
## - h.4person                                                                     1
## - h.3person                                                                     1
## - Pyr.Information                                                               1
## - age75.79                                                                      1
## - age35.39                                                                      1
## - age30.34                                                                      1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## + age0.4                                                                        1
## + age45.49                                                                      1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + age90.over                                                                    1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + Emp.Retail.trade                                                              1
## + Emp.Arts..entertainment..and.recreation                                       1
## + age5.9                                                                        1
## + Pyr.Accommodation.and.food.services                                           1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - age65.69                                                                      1
## - Pyr.Health.care.and.social.assistance                                         1
## - age15.19                                                                      1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - Emp.Finance.and.insurance                                                     1
## - h.1person                                                                     1
## - Emp.Wholesale.trade                                                           1
## - total.population                                                              1
## - Pyr.Wholesale.trade                                                           1
## - rOther                                                                        1
## - Emp.Manufacturing                                                             1
## - rBlack.AfricanAmerican                                                        1
## - Pyr.Other.services..except.public.administration.                             1
## - h.2person                                                                     1
## - age20.24                                                                      1
## - family.households                                                             1
## - Pyr.Retail.trade                                                              1
## - age50.54                                                                      1
## - age10.14                                                                      1
## - Emp.Other.services..except.public.administration.                             1
## - age70.74                                                                      1
## - male                                                                          1
## - age85.89                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - age55.59                                                                      1
## - rAsian                                                                        1
##                                                                                 Sum of Sq
## - age25.29                                                                     0.00001117
## - Pyr.Transportation.and.warehousing.104.                                      0.00001249
## - Emp.Transportation.and.warehousing.104.                                      0.00001438
## - age80.84                                                                     0.00002935
## - Emp.Information                                                              0.00003216
## - Pyr.Educational.services                                                     0.00003627
## - Pyr.Professional..scientific..and.technical.services                         0.00004609
## - age40.44                                                                     0.00004630
## - age60.64                                                                     0.00004840
## - Emp.Professional..scientific..and.technical.services                         0.00005041
## - Emp.Educational.services                                                     0.00005158
## - Emp.Health.care.and.social.assistance                                        0.00005451
## - Pyr.Utilities                                                                0.00005739
## - Pyr.Manufacturing                                                            0.00006988
## - Emp.Utilities                                                                0.00007430
## - total.households                                                             0.00007706
## - Emp.Accommodation.and.food.services                                          0.00007893
## - Pyr.Finance.and.insurance                                                    0.00009008
## <none>                                                                                   
## - h.5person                                                                    0.00010852
## - h.4person                                                                    0.00013084
## - h.3person                                                                    0.00013255
## - Pyr.Information                                                              0.00013824
## - age75.79                                                                     0.00014101
## - age35.39                                                                     0.00014374
## - age30.34                                                                     0.00014883
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00015907
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00000891
## - Emp.Real.estate.and.rental.and.leasing                                       0.00017772
## + age0.4                                                                       0.00000642
## + age45.49                                                                     0.00000608
## + h.6person                                                                    0.00000452
## + h.7person.more                                                               0.00000452
## + rWhite                                                                       0.00000190
## + rMultiple                                                                    0.00000190
## + age90.over                                                                   0.00000050
## + Pyr.Arts..entertainment..and.recreation                                      0.00000008
## + Emp.Retail.trade                                                             0.00000004
## + Emp.Arts..entertainment..and.recreation                                      0.00000000
## + age5.9                                                                       0.00000000
## + Pyr.Accommodation.and.food.services                                          0.00000000
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00020942
## - age65.69                                                                     0.00021701
## - Pyr.Health.care.and.social.assistance                                        0.00021864
## - age15.19                                                                     0.00024857
## - rNativeHawaiian.OtherPacificIslander                                         0.00026509
## - Emp.Finance.and.insurance                                                    0.00033884
## - h.1person                                                                    0.00037346
## - Emp.Wholesale.trade                                                          0.00041647
## - total.population                                                             0.00046706
## - Pyr.Wholesale.trade                                                          0.00049201
## - rOther                                                                       0.00050508
## - Emp.Manufacturing                                                            0.00054080
## - rBlack.AfricanAmerican                                                       0.00056497
## - Pyr.Other.services..except.public.administration.                            0.00056772
## - h.2person                                                                    0.00059776
## - age20.24                                                                     0.00062354
## - family.households                                                            0.00070102
## - Pyr.Retail.trade                                                             0.00084930
## - age50.54                                                                     0.00089352
## - age10.14                                                                     0.00094096
## - Emp.Other.services..except.public.administration.                            0.00103974
## - age70.74                                                                     0.00107140
## - male                                                                         0.00108566
## - age85.89                                                                     0.00116185
## - rAmericanIndian.AlaskaNative                                                 0.00139590
## - age55.59                                                                     0.00154474
## - rAsian                                                                       0.00176781
##                                                                                    RSS
## - age25.29                                                                     0.14137
## - Pyr.Transportation.and.warehousing.104.                                      0.14137
## - Emp.Transportation.and.warehousing.104.                                      0.14137
## - age80.84                                                                     0.14139
## - Emp.Information                                                              0.14139
## - Pyr.Educational.services                                                     0.14139
## - Pyr.Professional..scientific..and.technical.services                         0.14140
## - age40.44                                                                     0.14140
## - age60.64                                                                     0.14141
## - Emp.Professional..scientific..and.technical.services                         0.14141
## - Emp.Educational.services                                                     0.14141
## - Emp.Health.care.and.social.assistance                                        0.14141
## - Pyr.Utilities                                                                0.14141
## - Pyr.Manufacturing                                                            0.14143
## - Emp.Utilities                                                                0.14143
## - total.households                                                             0.14143
## - Emp.Accommodation.and.food.services                                          0.14144
## - Pyr.Finance.and.insurance                                                    0.14145
## <none>                                                                         0.14136
## - h.5person                                                                    0.14147
## - h.4person                                                                    0.14149
## - h.3person                                                                    0.14149
## - Pyr.Information                                                              0.14150
## - age75.79                                                                     0.14150
## - age35.39                                                                     0.14150
## - age30.34                                                                     0.14151
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14152
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14135
## - Emp.Real.estate.and.rental.and.leasing                                       0.14153
## + age0.4                                                                       0.14135
## + age45.49                                                                     0.14135
## + h.6person                                                                    0.14135
## + h.7person.more                                                               0.14135
## + rWhite                                                                       0.14136
## + rMultiple                                                                    0.14136
## + age90.over                                                                   0.14136
## + Pyr.Arts..entertainment..and.recreation                                      0.14136
## + Emp.Retail.trade                                                             0.14136
## + Emp.Arts..entertainment..and.recreation                                      0.14136
## + age5.9                                                                       0.14136
## + Pyr.Accommodation.and.food.services                                          0.14136
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14157
## - age65.69                                                                     0.14157
## - Pyr.Health.care.and.social.assistance                                        0.14158
## - age15.19                                                                     0.14161
## - rNativeHawaiian.OtherPacificIslander                                         0.14162
## - Emp.Finance.and.insurance                                                    0.14170
## - h.1person                                                                    0.14173
## - Emp.Wholesale.trade                                                          0.14177
## - total.population                                                             0.14182
## - Pyr.Wholesale.trade                                                          0.14185
## - rOther                                                                       0.14186
## - Emp.Manufacturing                                                            0.14190
## - rBlack.AfricanAmerican                                                       0.14192
## - Pyr.Other.services..except.public.administration.                            0.14192
## - h.2person                                                                    0.14195
## - age20.24                                                                     0.14198
## - family.households                                                            0.14206
## - Pyr.Retail.trade                                                             0.14221
## - age50.54                                                                     0.14225
## - age10.14                                                                     0.14230
## - Emp.Other.services..except.public.administration.                            0.14240
## - age70.74                                                                     0.14243
## - male                                                                         0.14244
## - age85.89                                                                     0.14252
## - rAmericanIndian.AlaskaNative                                                 0.14275
## - age55.59                                                                     0.14290
## - rAsian                                                                       0.14313
##                                                                                   AIC
## - age25.29                                                                     -30263
## - Pyr.Transportation.and.warehousing.104.                                      -30263
## - Emp.Transportation.and.warehousing.104.                                      -30263
## - age80.84                                                                     -30263
## - Emp.Information                                                              -30263
## - Pyr.Educational.services                                                     -30262
## - Pyr.Professional..scientific..and.technical.services                         -30262
## - age40.44                                                                     -30262
## - age60.64                                                                     -30262
## - Emp.Professional..scientific..and.technical.services                         -30262
## - Emp.Educational.services                                                     -30262
## - Emp.Health.care.and.social.assistance                                        -30262
## - Pyr.Utilities                                                                -30262
## - Pyr.Manufacturing                                                            -30262
## - Emp.Utilities                                                                -30262
## - total.households                                                             -30262
## - Emp.Accommodation.and.food.services                                          -30262
## - Pyr.Finance.and.insurance                                                    -30261
## <none>                                                                         -30261
## - h.5person                                                                    -30261
## - h.4person                                                                    -30260
## - h.3person                                                                    -30260
## - Pyr.Information                                                              -30260
## - age75.79                                                                     -30260
## - age35.39                                                                     -30260
## - age30.34                                                                     -30260
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30260
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30259
## - Emp.Real.estate.and.rental.and.leasing                                       -30259
## + age0.4                                                                       -30259
## + age45.49                                                                     -30259
## + h.6person                                                                    -30259
## + h.7person.more                                                               -30259
## + rWhite                                                                       -30259
## + rMultiple                                                                    -30259
## + age90.over                                                                   -30259
## + Pyr.Arts..entertainment..and.recreation                                      -30259
## + Emp.Retail.trade                                                             -30259
## + Emp.Arts..entertainment..and.recreation                                      -30259
## + age5.9                                                                       -30259
## + Pyr.Accommodation.and.food.services                                          -30259
## - Pyr.Real.estate.and.rental.and.leasing                                       -30259
## - age65.69                                                                     -30259
## - Pyr.Health.care.and.social.assistance                                        -30259
## - age15.19                                                                     -30258
## - rNativeHawaiian.OtherPacificIslander                                         -30258
## - Emp.Finance.and.insurance                                                    -30256
## - h.1person                                                                    -30255
## - Emp.Wholesale.trade                                                          -30254
## - total.population                                                             -30253
## - Pyr.Wholesale.trade                                                          -30253
## - rOther                                                                       -30252
## - Emp.Manufacturing                                                            -30252
## - rBlack.AfricanAmerican                                                       -30251
## - Pyr.Other.services..except.public.administration.                            -30251
## - h.2person                                                                    -30250
## - age20.24                                                                     -30250
## - family.households                                                            -30248
## - Pyr.Retail.trade                                                             -30245
## - age50.54                                                                     -30244
## - age10.14                                                                     -30243
## - Emp.Other.services..except.public.administration.                            -30241
## - age70.74                                                                     -30240
## - male                                                                         -30240
## - age85.89                                                                     -30238
## - rAmericanIndian.AlaskaNative                                                 -30233
## - age55.59                                                                     -30230
## - rAsian                                                                       -30225
## 
## Step:  AIC=-30262.95
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age30.34 + age35.39 + age40.44 + age50.54 + age55.59 + 
##     age60.64 + age65.69 + age70.74 + age75.79 + age80.84 + age85.89 + 
##     rBlack.AfricanAmerican + rAmericanIndian.AlaskaNative + rAsian + 
##     rNativeHawaiian.OtherPacificIslander + rOther + total.households + 
##     family.households + h.1person + h.2person + h.3person + h.4person + 
##     h.5person + Pyr.Educational.services + Pyr.Finance.and.insurance + 
##     Pyr.Health.care.and.social.assistance + Pyr.Information + 
##     Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Transportation.and.warehousing.104. + 
##     Pyr.Utilities + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Educational.services + Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Information + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Transportation.and.warehousing.104. + Emp.Utilities + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - Pyr.Transportation.and.warehousing.104.                                       1
## - Emp.Transportation.and.warehousing.104.                                       1
## - age80.84                                                                      1
## - Emp.Information                                                               1
## - Pyr.Educational.services                                                      1
## - Pyr.Professional..scientific..and.technical.services                          1
## - Emp.Educational.services                                                      1
## - Emp.Professional..scientific..and.technical.services                          1
## - Emp.Health.care.and.social.assistance                                         1
## - Pyr.Utilities                                                                 1
## - age60.64                                                                      1
## - total.households                                                              1
## - Emp.Utilities                                                                 1
## - Pyr.Manufacturing                                                             1
## - Emp.Accommodation.and.food.services                                           1
## - age40.44                                                                      1
## - Pyr.Finance.and.insurance                                                     1
## <none>                                                                           
## - h.5person                                                                     1
## - h.3person                                                                     1
## - age35.39                                                                      1
## - h.4person                                                                     1
## - Pyr.Information                                                               1
## - age30.34                                                                      1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - age75.79                                                                      1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## + age0.4                                                                        1
## + age25.29                                                                      1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + age5.9                                                                        1
## + age45.49                                                                      1
## + age90.over                                                                    1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + Emp.Arts..entertainment..and.recreation                                       1
## + Pyr.Accommodation.and.food.services                                           1
## + Emp.Retail.trade                                                              1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - Pyr.Health.care.and.social.assistance                                         1
## - age65.69                                                                      1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - Emp.Finance.and.insurance                                                     1
## - h.1person                                                                     1
## - age15.19                                                                      1
## - Emp.Wholesale.trade                                                           1
## - total.population                                                              1
## - Pyr.Wholesale.trade                                                           1
## - rOther                                                                        1
## - Emp.Manufacturing                                                             1
## - rBlack.AfricanAmerican                                                        1
## - Pyr.Other.services..except.public.administration.                             1
## - h.2person                                                                     1
## - age20.24                                                                      1
## - family.households                                                             1
## - Pyr.Retail.trade                                                              1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
## - age50.54                                                                      1
## - age70.74                                                                      1
## - age10.14                                                                      1
## - age85.89                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - rAsian                                                                        1
## - age55.59                                                                      1
##                                                                                 Sum of Sq
## - Pyr.Transportation.and.warehousing.104.                                      0.00001314
## - Emp.Transportation.and.warehousing.104.                                      0.00001405
## - age80.84                                                                     0.00002321
## - Emp.Information                                                              0.00003141
## - Pyr.Educational.services                                                     0.00003569
## - Pyr.Professional..scientific..and.technical.services                         0.00004734
## - Emp.Educational.services                                                     0.00005078
## - Emp.Professional..scientific..and.technical.services                         0.00005101
## - Emp.Health.care.and.social.assistance                                        0.00005314
## - Pyr.Utilities                                                                0.00005729
## - age60.64                                                                     0.00006870
## - total.households                                                             0.00007335
## - Emp.Utilities                                                                0.00007411
## - Pyr.Manufacturing                                                            0.00007415
## - Emp.Accommodation.and.food.services                                          0.00007543
## - age40.44                                                                     0.00007799
## - Pyr.Finance.and.insurance                                                    0.00008729
## <none>                                                                                   
## - h.5person                                                                    0.00011078
## - h.3person                                                                    0.00012327
## - age35.39                                                                     0.00013270
## - h.4person                                                                    0.00013508
## - Pyr.Information                                                              0.00014014
## - age30.34                                                                     0.00014520
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00015749
## - age75.79                                                                     0.00015805
## - Emp.Real.estate.and.rental.and.leasing                                       0.00017267
## + age0.4                                                                       0.00001263
## + age25.29                                                                     0.00001117
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00000854
## + h.6person                                                                    0.00000447
## + h.7person.more                                                               0.00000447
## + rWhite                                                                       0.00000291
## + rMultiple                                                                    0.00000291
## + age5.9                                                                       0.00000262
## + age45.49                                                                     0.00000211
## + age90.over                                                                   0.00000151
## + Pyr.Arts..entertainment..and.recreation                                      0.00000034
## + Emp.Arts..entertainment..and.recreation                                      0.00000011
## + Pyr.Accommodation.and.food.services                                          0.00000005
## + Emp.Retail.trade                                                             0.00000001
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00020895
## - Pyr.Health.care.and.social.assistance                                        0.00021506
## - age65.69                                                                     0.00025994
## - rNativeHawaiian.OtherPacificIslander                                         0.00026129
## - Emp.Finance.and.insurance                                                    0.00033617
## - h.1person                                                                    0.00036550
## - age15.19                                                                     0.00040831
## - Emp.Wholesale.trade                                                          0.00041777
## - total.population                                                             0.00048680
## - Pyr.Wholesale.trade                                                          0.00049281
## - rOther                                                                       0.00052251
## - Emp.Manufacturing                                                            0.00055321
## - rBlack.AfricanAmerican                                                       0.00055380
## - Pyr.Other.services..except.public.administration.                            0.00056808
## - h.2person                                                                    0.00062846
## - age20.24                                                                     0.00071311
## - family.households                                                            0.00074910
## - Pyr.Retail.trade                                                             0.00084283
## - Emp.Other.services..except.public.administration.                            0.00103353
## - male                                                                         0.00107583
## - age50.54                                                                     0.00110735
## - age70.74                                                                     0.00114735
## - age10.14                                                                     0.00119752
## - age85.89                                                                     0.00125610
## - rAmericanIndian.AlaskaNative                                                 0.00139502
## - rAsian                                                                       0.00180246
## - age55.59                                                                     0.00180672
##                                                                                    RSS
## - Pyr.Transportation.and.warehousing.104.                                      0.14138
## - Emp.Transportation.and.warehousing.104.                                      0.14138
## - age80.84                                                                     0.14139
## - Emp.Information                                                              0.14140
## - Pyr.Educational.services                                                     0.14140
## - Pyr.Professional..scientific..and.technical.services                         0.14142
## - Emp.Educational.services                                                     0.14142
## - Emp.Professional..scientific..and.technical.services                         0.14142
## - Emp.Health.care.and.social.assistance                                        0.14142
## - Pyr.Utilities                                                                0.14142
## - age60.64                                                                     0.14144
## - total.households                                                             0.14144
## - Emp.Utilities                                                                0.14144
## - Pyr.Manufacturing                                                            0.14144
## - Emp.Accommodation.and.food.services                                          0.14144
## - age40.44                                                                     0.14145
## - Pyr.Finance.and.insurance                                                    0.14145
## <none>                                                                         0.14137
## - h.5person                                                                    0.14148
## - h.3person                                                                    0.14149
## - age35.39                                                                     0.14150
## - h.4person                                                                    0.14150
## - Pyr.Information                                                              0.14151
## - age30.34                                                                     0.14151
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14153
## - age75.79                                                                     0.14153
## - Emp.Real.estate.and.rental.and.leasing                                       0.14154
## + age0.4                                                                       0.14136
## + age25.29                                                                     0.14136
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14136
## + h.6person                                                                    0.14136
## + h.7person.more                                                               0.14136
## + rWhite                                                                       0.14136
## + rMultiple                                                                    0.14136
## + age5.9                                                                       0.14136
## + age45.49                                                                     0.14137
## + age90.over                                                                   0.14137
## + Pyr.Arts..entertainment..and.recreation                                      0.14137
## + Emp.Arts..entertainment..and.recreation                                      0.14137
## + Pyr.Accommodation.and.food.services                                          0.14137
## + Emp.Retail.trade                                                             0.14137
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14158
## - Pyr.Health.care.and.social.assistance                                        0.14158
## - age65.69                                                                     0.14163
## - rNativeHawaiian.OtherPacificIslander                                         0.14163
## - Emp.Finance.and.insurance                                                    0.14170
## - h.1person                                                                    0.14173
## - age15.19                                                                     0.14178
## - Emp.Wholesale.trade                                                          0.14179
## - total.population                                                             0.14186
## - Pyr.Wholesale.trade                                                          0.14186
## - rOther                                                                       0.14189
## - Emp.Manufacturing                                                            0.14192
## - rBlack.AfricanAmerican                                                       0.14192
## - Pyr.Other.services..except.public.administration.                            0.14194
## - h.2person                                                                    0.14200
## - age20.24                                                                     0.14208
## - family.households                                                            0.14212
## - Pyr.Retail.trade                                                             0.14221
## - Emp.Other.services..except.public.administration.                            0.14240
## - male                                                                         0.14244
## - age50.54                                                                     0.14247
## - age70.74                                                                     0.14252
## - age10.14                                                                     0.14257
## - age85.89                                                                     0.14262
## - rAmericanIndian.AlaskaNative                                                 0.14276
## - rAsian                                                                       0.14317
## - age55.59                                                                     0.14317
##                                                                                   AIC
## - Pyr.Transportation.and.warehousing.104.                                      -30265
## - Emp.Transportation.and.warehousing.104.                                      -30265
## - age80.84                                                                     -30265
## - Emp.Information                                                              -30264
## - Pyr.Educational.services                                                     -30264
## - Pyr.Professional..scientific..and.technical.services                         -30264
## - Emp.Educational.services                                                     -30264
## - Emp.Professional..scientific..and.technical.services                         -30264
## - Emp.Health.care.and.social.assistance                                        -30264
## - Pyr.Utilities                                                                -30264
## - age60.64                                                                     -30264
## - total.households                                                             -30263
## - Emp.Utilities                                                                -30263
## - Pyr.Manufacturing                                                            -30263
## - Emp.Accommodation.and.food.services                                          -30263
## - age40.44                                                                     -30263
## - Pyr.Finance.and.insurance                                                    -30263
## <none>                                                                         -30263
## - h.5person                                                                    -30263
## - h.3person                                                                    -30262
## - age35.39                                                                     -30262
## - h.4person                                                                    -30262
## - Pyr.Information                                                              -30262
## - age30.34                                                                     -30262
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30262
## - age75.79                                                                     -30262
## - Emp.Real.estate.and.rental.and.leasing                                       -30261
## + age0.4                                                                       -30261
## + age25.29                                                                     -30261
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30261
## + h.6person                                                                    -30261
## + h.7person.more                                                               -30261
## + rWhite                                                                       -30261
## + rMultiple                                                                    -30261
## + age5.9                                                                       -30261
## + age45.49                                                                     -30261
## + age90.over                                                                   -30261
## + Pyr.Arts..entertainment..and.recreation                                      -30261
## + Emp.Arts..entertainment..and.recreation                                      -30261
## + Pyr.Accommodation.and.food.services                                          -30261
## + Emp.Retail.trade                                                             -30261
## - Pyr.Real.estate.and.rental.and.leasing                                       -30261
## - Pyr.Health.care.and.social.assistance                                        -30260
## - age65.69                                                                     -30259
## - rNativeHawaiian.OtherPacificIslander                                         -30259
## - Emp.Finance.and.insurance                                                    -30258
## - h.1person                                                                    -30257
## - age15.19                                                                     -30256
## - Emp.Wholesale.trade                                                          -30256
## - total.population                                                             -30255
## - Pyr.Wholesale.trade                                                          -30254
## - rOther                                                                       -30254
## - Emp.Manufacturing                                                            -30253
## - rBlack.AfricanAmerican                                                       -30253
## - Pyr.Other.services..except.public.administration.                            -30253
## - h.2person                                                                    -30251
## - age20.24                                                                     -30250
## - family.households                                                            -30249
## - Pyr.Retail.trade                                                             -30247
## - Emp.Other.services..except.public.administration.                            -30243
## - male                                                                         -30242
## - age50.54                                                                     -30241
## - age70.74                                                                     -30240
## - age10.14                                                                     -30239
## - age85.89                                                                     -30238
## - rAmericanIndian.AlaskaNative                                                 -30235
## - rAsian                                                                       -30226
## - age55.59                                                                     -30226
## 
## Step:  AIC=-30264.67
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age30.34 + age35.39 + age40.44 + age50.54 + age55.59 + 
##     age60.64 + age65.69 + age70.74 + age75.79 + age80.84 + age85.89 + 
##     rBlack.AfricanAmerican + rAmericanIndian.AlaskaNative + rAsian + 
##     rNativeHawaiian.OtherPacificIslander + rOther + total.households + 
##     family.households + h.1person + h.2person + h.3person + h.4person + 
##     h.5person + Pyr.Educational.services + Pyr.Finance.and.insurance + 
##     Pyr.Health.care.and.social.assistance + Pyr.Information + 
##     Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Utilities + Pyr.Wholesale.trade + 
##     Emp.Accommodation.and.food.services + Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Educational.services + Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Information + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Transportation.and.warehousing.104. + Emp.Utilities + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - age80.84                                                                      1
## - Emp.Information                                                               1
## - Pyr.Educational.services                                                      1
## - Pyr.Professional..scientific..and.technical.services                          1
## - Emp.Educational.services                                                      1
## - Emp.Health.care.and.social.assistance                                         1
## - Emp.Professional..scientific..and.technical.services                          1
## - Pyr.Utilities                                                                 1
## - age60.64                                                                      1
## - total.households                                                              1
## - Emp.Accommodation.and.food.services                                           1
## - Emp.Utilities                                                                 1
## - Pyr.Manufacturing                                                             1
## - age40.44                                                                      1
## - Pyr.Finance.and.insurance                                                     1
## <none>                                                                           
## - h.5person                                                                     1
## - h.3person                                                                     1
## - age35.39                                                                      1
## - h.4person                                                                     1
## - Pyr.Information                                                               1
## - age30.34                                                                      1
## - age75.79                                                                      1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## + Pyr.Transportation.and.warehousing.104.                                       1
## + age0.4                                                                        1
## + age25.29                                                                      1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + age5.9                                                                        1
## + age45.49                                                                      1
## + age90.over                                                                    1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + Emp.Arts..entertainment..and.recreation                                       1
## + Emp.Retail.trade                                                              1
## + Pyr.Accommodation.and.food.services                                           1
## - Pyr.Health.care.and.social.assistance                                         1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - age65.69                                                                      1
## - Emp.Finance.and.insurance                                                     1
## - h.1person                                                                     1
## - age15.19                                                                      1
## - Emp.Wholesale.trade                                                           1
## - Emp.Transportation.and.warehousing.104.                                       1
## - total.population                                                              1
## - Pyr.Wholesale.trade                                                           1
## - rOther                                                                        1
## - Emp.Manufacturing                                                             1
## - rBlack.AfricanAmerican                                                        1
## - Pyr.Other.services..except.public.administration.                             1
## - h.2person                                                                     1
## - age20.24                                                                      1
## - family.households                                                             1
## - Pyr.Retail.trade                                                              1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
## - age50.54                                                                      1
## - age70.74                                                                      1
## - age10.14                                                                      1
## - age85.89                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - age55.59                                                                      1
## - rAsian                                                                        1
##                                                                                 Sum of Sq
## - age80.84                                                                     0.00002329
## - Emp.Information                                                              0.00003547
## - Pyr.Educational.services                                                     0.00003625
## - Pyr.Professional..scientific..and.technical.services                         0.00004908
## - Emp.Educational.services                                                     0.00004996
## - Emp.Health.care.and.social.assistance                                        0.00005229
## - Emp.Professional..scientific..and.technical.services                         0.00005293
## - Pyr.Utilities                                                                0.00005911
## - age60.64                                                                     0.00006945
## - total.households                                                             0.00007071
## - Emp.Accommodation.and.food.services                                          0.00007469
## - Emp.Utilities                                                                0.00007629
## - Pyr.Manufacturing                                                            0.00007700
## - age40.44                                                                     0.00008090
## - Pyr.Finance.and.insurance                                                    0.00008742
## <none>                                                                                   
## - h.5person                                                                    0.00011402
## - h.3person                                                                    0.00012172
## - age35.39                                                                     0.00012874
## - h.4person                                                                    0.00013832
## - Pyr.Information                                                              0.00014193
## - age30.34                                                                     0.00014702
## - age75.79                                                                     0.00016056
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00017133
## + Pyr.Transportation.and.warehousing.104.                                      0.00001314
## + age0.4                                                                       0.00001217
## + age25.29                                                                     0.00001182
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00000801
## - Emp.Real.estate.and.rental.and.leasing                                       0.00018144
## + h.6person                                                                    0.00000409
## + h.7person.more                                                               0.00000409
## + rWhite                                                                       0.00000324
## + rMultiple                                                                    0.00000324
## + age5.9                                                                       0.00000261
## + age45.49                                                                     0.00000169
## + age90.over                                                                   0.00000154
## + Pyr.Arts..entertainment..and.recreation                                      0.00000046
## + Emp.Arts..entertainment..and.recreation                                      0.00000018
## + Emp.Retail.trade                                                             0.00000002
## + Pyr.Accommodation.and.food.services                                          0.00000000
## - Pyr.Health.care.and.social.assistance                                        0.00021285
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00023387
## - rNativeHawaiian.OtherPacificIslander                                         0.00025906
## - age65.69                                                                     0.00026053
## - Emp.Finance.and.insurance                                                    0.00033254
## - h.1person                                                                    0.00035933
## - age15.19                                                                     0.00041524
## - Emp.Wholesale.trade                                                          0.00042159
## - Emp.Transportation.and.warehousing.104.                                      0.00046860
## - total.population                                                             0.00048239
## - Pyr.Wholesale.trade                                                          0.00049734
## - rOther                                                                       0.00052054
## - Emp.Manufacturing                                                            0.00055874
## - rBlack.AfricanAmerican                                                       0.00056257
## - Pyr.Other.services..except.public.administration.                            0.00057690
## - h.2person                                                                    0.00063487
## - age20.24                                                                     0.00071756
## - family.households                                                            0.00074821
## - Pyr.Retail.trade                                                             0.00083130
## - Emp.Other.services..except.public.administration.                            0.00106733
## - male                                                                         0.00107527
## - age50.54                                                                     0.00109699
## - age70.74                                                                     0.00114929
## - age10.14                                                                     0.00120144
## - age85.89                                                                     0.00127515
## - rAmericanIndian.AlaskaNative                                                 0.00139172
## - age55.59                                                                     0.00182132
## - rAsian                                                                       0.00182637
##                                                                                    RSS
## - age80.84                                                                     0.14140
## - Emp.Information                                                              0.14142
## - Pyr.Educational.services                                                     0.14142
## - Pyr.Professional..scientific..and.technical.services                         0.14143
## - Emp.Educational.services                                                     0.14143
## - Emp.Health.care.and.social.assistance                                        0.14143
## - Emp.Professional..scientific..and.technical.services                         0.14143
## - Pyr.Utilities                                                                0.14144
## - age60.64                                                                     0.14145
## - total.households                                                             0.14145
## - Emp.Accommodation.and.food.services                                          0.14146
## - Emp.Utilities                                                                0.14146
## - Pyr.Manufacturing                                                            0.14146
## - age40.44                                                                     0.14146
## - Pyr.Finance.and.insurance                                                    0.14147
## <none>                                                                         0.14138
## - h.5person                                                                    0.14150
## - h.3person                                                                    0.14150
## - age35.39                                                                     0.14151
## - h.4person                                                                    0.14152
## - Pyr.Information                                                              0.14152
## - age30.34                                                                     0.14153
## - age75.79                                                                     0.14154
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14155
## + Pyr.Transportation.and.warehousing.104.                                      0.14137
## + age0.4                                                                       0.14137
## + age25.29                                                                     0.14137
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14137
## - Emp.Real.estate.and.rental.and.leasing                                       0.14156
## + h.6person                                                                    0.14138
## + h.7person.more                                                               0.14138
## + rWhite                                                                       0.14138
## + rMultiple                                                                    0.14138
## + age5.9                                                                       0.14138
## + age45.49                                                                     0.14138
## + age90.over                                                                   0.14138
## + Pyr.Arts..entertainment..and.recreation                                      0.14138
## + Emp.Arts..entertainment..and.recreation                                      0.14138
## + Emp.Retail.trade                                                             0.14138
## + Pyr.Accommodation.and.food.services                                          0.14138
## - Pyr.Health.care.and.social.assistance                                        0.14159
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14161
## - rNativeHawaiian.OtherPacificIslander                                         0.14164
## - age65.69                                                                     0.14164
## - Emp.Finance.and.insurance                                                    0.14171
## - h.1person                                                                    0.14174
## - age15.19                                                                     0.14180
## - Emp.Wholesale.trade                                                          0.14180
## - Emp.Transportation.and.warehousing.104.                                      0.14185
## - total.population                                                             0.14186
## - Pyr.Wholesale.trade                                                          0.14188
## - rOther                                                                       0.14190
## - Emp.Manufacturing                                                            0.14194
## - rBlack.AfricanAmerican                                                       0.14194
## - Pyr.Other.services..except.public.administration.                            0.14196
## - h.2person                                                                    0.14202
## - age20.24                                                                     0.14210
## - family.households                                                            0.14213
## - Pyr.Retail.trade                                                             0.14221
## - Emp.Other.services..except.public.administration.                            0.14245
## - male                                                                         0.14246
## - age50.54                                                                     0.14248
## - age70.74                                                                     0.14253
## - age10.14                                                                     0.14258
## - age85.89                                                                     0.14266
## - rAmericanIndian.AlaskaNative                                                 0.14277
## - age55.59                                                                     0.14320
## - rAsian                                                                       0.14321
##                                                                                   AIC
## - age80.84                                                                     -30266
## - Emp.Information                                                              -30266
## - Pyr.Educational.services                                                     -30266
## - Pyr.Professional..scientific..and.technical.services                         -30266
## - Emp.Educational.services                                                     -30266
## - Emp.Health.care.and.social.assistance                                        -30266
## - Emp.Professional..scientific..and.technical.services                         -30266
## - Pyr.Utilities                                                                -30265
## - age60.64                                                                     -30265
## - total.households                                                             -30265
## - Emp.Accommodation.and.food.services                                          -30265
## - Emp.Utilities                                                                -30265
## - Pyr.Manufacturing                                                            -30265
## - age40.44                                                                     -30265
## - Pyr.Finance.and.insurance                                                    -30265
## <none>                                                                         -30265
## - h.5person                                                                    -30264
## - h.3person                                                                    -30264
## - age35.39                                                                     -30264
## - h.4person                                                                    -30264
## - Pyr.Information                                                              -30264
## - age30.34                                                                     -30264
## - age75.79                                                                     -30263
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30263
## + Pyr.Transportation.and.warehousing.104.                                      -30263
## + age0.4                                                                       -30263
## + age25.29                                                                     -30263
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30263
## - Emp.Real.estate.and.rental.and.leasing                                       -30263
## + h.6person                                                                    -30263
## + h.7person.more                                                               -30263
## + rWhite                                                                       -30263
## + rMultiple                                                                    -30263
## + age5.9                                                                       -30263
## + age45.49                                                                     -30263
## + age90.over                                                                   -30263
## + Pyr.Arts..entertainment..and.recreation                                      -30263
## + Emp.Arts..entertainment..and.recreation                                      -30263
## + Emp.Retail.trade                                                             -30263
## + Pyr.Accommodation.and.food.services                                          -30263
## - Pyr.Health.care.and.social.assistance                                        -30262
## - Pyr.Real.estate.and.rental.and.leasing                                       -30262
## - rNativeHawaiian.OtherPacificIslander                                         -30261
## - age65.69                                                                     -30261
## - Emp.Finance.and.insurance                                                    -30260
## - h.1person                                                                    -30259
## - age15.19                                                                     -30258
## - Emp.Wholesale.trade                                                          -30258
## - Emp.Transportation.and.warehousing.104.                                      -30257
## - total.population                                                             -30256
## - Pyr.Wholesale.trade                                                          -30256
## - rOther                                                                       -30256
## - Emp.Manufacturing                                                            -30255
## - rBlack.AfricanAmerican                                                       -30255
## - Pyr.Other.services..except.public.administration.                            -30254
## - h.2person                                                                    -30253
## - age20.24                                                                     -30251
## - family.households                                                            -30251
## - Pyr.Retail.trade                                                             -30249
## - Emp.Other.services..except.public.administration.                            -30244
## - male                                                                         -30244
## - age50.54                                                                     -30243
## - age70.74                                                                     -30242
## - age10.14                                                                     -30241
## - age85.89                                                                     -30239
## - rAmericanIndian.AlaskaNative                                                 -30237
## - age55.59                                                                     -30228
## - rAsian                                                                       -30228
## 
## Step:  AIC=-30266.17
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age30.34 + age35.39 + age40.44 + age50.54 + age55.59 + 
##     age60.64 + age65.69 + age70.74 + age75.79 + age85.89 + rBlack.AfricanAmerican + 
##     rAmericanIndian.AlaskaNative + rAsian + rNativeHawaiian.OtherPacificIslander + 
##     rOther + total.households + family.households + h.1person + 
##     h.2person + h.3person + h.4person + h.5person + Pyr.Educational.services + 
##     Pyr.Finance.and.insurance + Pyr.Health.care.and.social.assistance + 
##     Pyr.Information + Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Utilities + Pyr.Wholesale.trade + 
##     Emp.Accommodation.and.food.services + Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Educational.services + Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Information + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Transportation.and.warehousing.104. + Emp.Utilities + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - Emp.Information                                                               1
## - Pyr.Educational.services                                                      1
## - Pyr.Professional..scientific..and.technical.services                          1
## - Emp.Educational.services                                                      1
## - Emp.Professional..scientific..and.technical.services                          1
## - Emp.Health.care.and.social.assistance                                         1
## - Pyr.Utilities                                                                 1
## - total.households                                                              1
## - Emp.Accommodation.and.food.services                                           1
## - Emp.Utilities                                                                 1
## - age60.64                                                                      1
## - Pyr.Manufacturing                                                             1
## - age40.44                                                                      1
## - Pyr.Finance.and.insurance                                                     1
## <none>                                                                           
## - h.5person                                                                     1
## - h.3person                                                                     1
## - age35.39                                                                      1
## - age75.79                                                                      1
## - h.4person                                                                     1
## - Pyr.Information                                                               1
## + age80.84                                                                      1
## - age30.34                                                                      1
## + age0.4                                                                        1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## + Pyr.Transportation.and.warehousing.104.                                       1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## + age25.29                                                                      1
## + age5.9                                                                        1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + age45.49                                                                      1
## + age90.over                                                                    1
## + Emp.Arts..entertainment..and.recreation                                       1
## + Pyr.Accommodation.and.food.services                                           1
## + Emp.Retail.trade                                                              1
## - Pyr.Health.care.and.social.assistance                                         1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - age65.69                                                                      1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - Emp.Finance.and.insurance                                                     1
## - h.1person                                                                     1
## - Emp.Wholesale.trade                                                           1
## - age15.19                                                                      1
## - Emp.Transportation.and.warehousing.104.                                       1
## - total.population                                                              1
## - Pyr.Wholesale.trade                                                           1
## - rOther                                                                        1
## - Emp.Manufacturing                                                             1
## - Pyr.Other.services..except.public.administration.                             1
## - rBlack.AfricanAmerican                                                        1
## - h.2person                                                                     1
## - family.households                                                             1
## - age20.24                                                                      1
## - Pyr.Retail.trade                                                              1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
## - age70.74                                                                      1
## - age50.54                                                                      1
## - age10.14                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - age85.89                                                                      1
## - age55.59                                                                      1
## - rAsian                                                                        1
##                                                                                 Sum of Sq
## - Emp.Information                                                              0.00003545
## - Pyr.Educational.services                                                     0.00003650
## - Pyr.Professional..scientific..and.technical.services                         0.00004776
## - Emp.Educational.services                                                     0.00005020
## - Emp.Professional..scientific..and.technical.services                         0.00005145
## - Emp.Health.care.and.social.assistance                                        0.00005190
## - Pyr.Utilities                                                                0.00005856
## - total.households                                                             0.00006669
## - Emp.Accommodation.and.food.services                                          0.00007383
## - Emp.Utilities                                                                0.00007511
## - age60.64                                                                     0.00007873
## - Pyr.Manufacturing                                                            0.00008061
## - age40.44                                                                     0.00008301
## - Pyr.Finance.and.insurance                                                    0.00008620
## <none>                                                                                   
## - h.5person                                                                    0.00011736
## - h.3person                                                                    0.00011926
## - age35.39                                                                     0.00012071
## - age75.79                                                                     0.00013742
## - h.4person                                                                    0.00013824
## - Pyr.Information                                                              0.00014193
## + age80.84                                                                     0.00002329
## - age30.34                                                                     0.00016413
## + age0.4                                                                       0.00002010
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00016990
## + Pyr.Transportation.and.warehousing.104.                                      0.00001323
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00000820
## + age25.29                                                                     0.00000545
## + age5.9                                                                       0.00000522
## + h.6person                                                                    0.00000382
## + h.7person.more                                                               0.00000382
## - Emp.Real.estate.and.rental.and.leasing                                       0.00018428
## + rWhite                                                                       0.00000155
## + rMultiple                                                                    0.00000155
## + Pyr.Arts..entertainment..and.recreation                                      0.00000047
## + age45.49                                                                     0.00000046
## + age90.over                                                                   0.00000034
## + Emp.Arts..entertainment..and.recreation                                      0.00000020
## + Pyr.Accommodation.and.food.services                                          0.00000009
## + Emp.Retail.trade                                                             0.00000000
## - Pyr.Health.care.and.social.assistance                                        0.00021343
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00023525
## - age65.69                                                                     0.00028825
## - rNativeHawaiian.OtherPacificIslander                                         0.00030774
## - Emp.Finance.and.insurance                                                    0.00033075
## - h.1person                                                                    0.00034811
## - Emp.Wholesale.trade                                                          0.00042108
## - age15.19                                                                     0.00043300
## - Emp.Transportation.and.warehousing.104.                                      0.00046827
## - total.population                                                             0.00049475
## - Pyr.Wholesale.trade                                                          0.00050063
## - rOther                                                                       0.00051254
## - Emp.Manufacturing                                                            0.00056607
## - Pyr.Other.services..except.public.administration.                            0.00056993
## - rBlack.AfricanAmerican                                                       0.00058715
## - h.2person                                                                    0.00064083
## - family.households                                                            0.00074285
## - age20.24                                                                     0.00074863
## - Pyr.Retail.trade                                                             0.00084289
## - Emp.Other.services..except.public.administration.                            0.00105733
## - male                                                                         0.00109618
## - age70.74                                                                     0.00112751
## - age50.54                                                                     0.00113131
## - age10.14                                                                     0.00124957
## - rAmericanIndian.AlaskaNative                                                 0.00136864
## - age85.89                                                                     0.00147313
## - age55.59                                                                     0.00180518
## - rAsian                                                                       0.00180528
##                                                                                    RSS
## - Emp.Information                                                              0.14144
## - Pyr.Educational.services                                                     0.14144
## - Pyr.Professional..scientific..and.technical.services                         0.14145
## - Emp.Educational.services                                                     0.14145
## - Emp.Professional..scientific..and.technical.services                         0.14146
## - Emp.Health.care.and.social.assistance                                        0.14146
## - Pyr.Utilities                                                                0.14146
## - total.households                                                             0.14147
## - Emp.Accommodation.and.food.services                                          0.14148
## - Emp.Utilities                                                                0.14148
## - age60.64                                                                     0.14148
## - Pyr.Manufacturing                                                            0.14148
## - age40.44                                                                     0.14149
## - Pyr.Finance.and.insurance                                                    0.14149
## <none>                                                                         0.14140
## - h.5person                                                                    0.14152
## - h.3person                                                                    0.14152
## - age35.39                                                                     0.14153
## - age75.79                                                                     0.14154
## - h.4person                                                                    0.14154
## - Pyr.Information                                                              0.14155
## + age80.84                                                                     0.14138
## - age30.34                                                                     0.14157
## + age0.4                                                                       0.14138
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14157
## + Pyr.Transportation.and.warehousing.104.                                      0.14139
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14140
## + age25.29                                                                     0.14140
## + age5.9                                                                       0.14140
## + h.6person                                                                    0.14140
## + h.7person.more                                                               0.14140
## - Emp.Real.estate.and.rental.and.leasing                                       0.14159
## + rWhite                                                                       0.14140
## + rMultiple                                                                    0.14140
## + Pyr.Arts..entertainment..and.recreation                                      0.14140
## + age45.49                                                                     0.14140
## + age90.over                                                                   0.14140
## + Emp.Arts..entertainment..and.recreation                                      0.14140
## + Pyr.Accommodation.and.food.services                                          0.14140
## + Emp.Retail.trade                                                             0.14140
## - Pyr.Health.care.and.social.assistance                                        0.14162
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14164
## - age65.69                                                                     0.14169
## - rNativeHawaiian.OtherPacificIslander                                         0.14171
## - Emp.Finance.and.insurance                                                    0.14173
## - h.1person                                                                    0.14175
## - Emp.Wholesale.trade                                                          0.14183
## - age15.19                                                                     0.14184
## - Emp.Transportation.and.warehousing.104.                                      0.14187
## - total.population                                                             0.14190
## - Pyr.Wholesale.trade                                                          0.14191
## - rOther                                                                       0.14192
## - Emp.Manufacturing                                                            0.14197
## - Pyr.Other.services..except.public.administration.                            0.14197
## - rBlack.AfricanAmerican                                                       0.14199
## - h.2person                                                                    0.14205
## - family.households                                                            0.14215
## - age20.24                                                                     0.14215
## - Pyr.Retail.trade                                                             0.14225
## - Emp.Other.services..except.public.administration.                            0.14246
## - male                                                                         0.14250
## - age70.74                                                                     0.14253
## - age50.54                                                                     0.14254
## - age10.14                                                                     0.14265
## - rAmericanIndian.AlaskaNative                                                 0.14277
## - age85.89                                                                     0.14288
## - age55.59                                                                     0.14321
## - rAsian                                                                       0.14321
##                                                                                   AIC
## - Emp.Information                                                              -30267
## - Pyr.Educational.services                                                     -30267
## - Pyr.Professional..scientific..and.technical.services                         -30267
## - Emp.Educational.services                                                     -30267
## - Emp.Professional..scientific..and.technical.services                         -30267
## - Emp.Health.care.and.social.assistance                                        -30267
## - Pyr.Utilities                                                                -30267
## - total.households                                                             -30267
## - Emp.Accommodation.and.food.services                                          -30267
## - Emp.Utilities                                                                -30267
## - age60.64                                                                     -30267
## - Pyr.Manufacturing                                                            -30266
## - age40.44                                                                     -30266
## - Pyr.Finance.and.insurance                                                    -30266
## <none>                                                                         -30266
## - h.5person                                                                    -30266
## - h.3person                                                                    -30266
## - age35.39                                                                     -30266
## - age75.79                                                                     -30265
## - h.4person                                                                    -30265
## - Pyr.Information                                                              -30265
## + age80.84                                                                     -30265
## - age30.34                                                                     -30265
## + age0.4                                                                       -30265
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30265
## + Pyr.Transportation.and.warehousing.104.                                      -30265
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30264
## + age25.29                                                                     -30264
## + age5.9                                                                       -30264
## + h.6person                                                                    -30264
## + h.7person.more                                                               -30264
## - Emp.Real.estate.and.rental.and.leasing                                       -30264
## + rWhite                                                                       -30264
## + rMultiple                                                                    -30264
## + Pyr.Arts..entertainment..and.recreation                                      -30264
## + age45.49                                                                     -30264
## + age90.over                                                                   -30264
## + Emp.Arts..entertainment..and.recreation                                      -30264
## + Pyr.Accommodation.and.food.services                                          -30264
## + Emp.Retail.trade                                                             -30264
## - Pyr.Health.care.and.social.assistance                                        -30264
## - Pyr.Real.estate.and.rental.and.leasing                                       -30263
## - age65.69                                                                     -30262
## - rNativeHawaiian.OtherPacificIslander                                         -30262
## - Emp.Finance.and.insurance                                                    -30261
## - h.1person                                                                    -30261
## - Emp.Wholesale.trade                                                          -30259
## - age15.19                                                                     -30259
## - Emp.Transportation.and.warehousing.104.                                      -30258
## - total.population                                                             -30258
## - Pyr.Wholesale.trade                                                          -30257
## - rOther                                                                       -30257
## - Emp.Manufacturing                                                            -30256
## - Pyr.Other.services..except.public.administration.                            -30256
## - rBlack.AfricanAmerican                                                       -30256
## - h.2person                                                                    -30254
## - family.households                                                            -30252
## - age20.24                                                                     -30252
## - Pyr.Retail.trade                                                             -30250
## - Emp.Other.services..except.public.administration.                            -30246
## - male                                                                         -30245
## - age70.74                                                                     -30244
## - age50.54                                                                     -30244
## - age10.14                                                                     -30241
## - rAmericanIndian.AlaskaNative                                                 -30239
## - age85.89                                                                     -30237
## - age55.59                                                                     -30230
## - rAsian                                                                       -30230
## 
## Step:  AIC=-30267.4
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age30.34 + age35.39 + age40.44 + age50.54 + age55.59 + 
##     age60.64 + age65.69 + age70.74 + age75.79 + age85.89 + rBlack.AfricanAmerican + 
##     rAmericanIndian.AlaskaNative + rAsian + rNativeHawaiian.OtherPacificIslander + 
##     rOther + total.households + family.households + h.1person + 
##     h.2person + h.3person + h.4person + h.5person + Pyr.Educational.services + 
##     Pyr.Finance.and.insurance + Pyr.Health.care.and.social.assistance + 
##     Pyr.Information + Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Utilities + Pyr.Wholesale.trade + 
##     Emp.Accommodation.and.food.services + Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Educational.services + Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Transportation.and.warehousing.104. + Emp.Utilities + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - Pyr.Educational.services                                                      1
## - Pyr.Professional..scientific..and.technical.services                          1
## - Emp.Professional..scientific..and.technical.services                          1
## - Emp.Health.care.and.social.assistance                                         1
## - Emp.Educational.services                                                      1
## - Pyr.Utilities                                                                 1
## - total.households                                                              1
## - Emp.Accommodation.and.food.services                                           1
## - Emp.Utilities                                                                 1
## - Pyr.Manufacturing                                                             1
## - age60.64                                                                      1
## - age40.44                                                                      1
## <none>                                                                           
## - Pyr.Information                                                               1
## - h.3person                                                                     1
## - Pyr.Finance.and.insurance                                                     1
## - h.5person                                                                     1
## - age35.39                                                                      1
## - age75.79                                                                      1
## - h.4person                                                                     1
## + Emp.Information                                                               1
## + age80.84                                                                      1
## - age30.34                                                                      1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## + age0.4                                                                        1
## + Pyr.Transportation.and.warehousing.104.                                       1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## + age25.29                                                                      1
## + age5.9                                                                        1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + age90.over                                                                    1
## + age45.49                                                                      1
## + Emp.Arts..entertainment..and.recreation                                       1
## + Emp.Retail.trade                                                              1
## + Pyr.Accommodation.and.food.services                                           1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## - Pyr.Health.care.and.social.assistance                                         1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - age65.69                                                                      1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - h.1person                                                                     1
## - Emp.Wholesale.trade                                                           1
## - age15.19                                                                      1
## - Emp.Finance.and.insurance                                                     1
## - Emp.Transportation.and.warehousing.104.                                       1
## - Pyr.Wholesale.trade                                                           1
## - rOther                                                                        1
## - total.population                                                              1
## - Emp.Manufacturing                                                             1
## - Pyr.Other.services..except.public.administration.                             1
## - rBlack.AfricanAmerican                                                        1
## - h.2person                                                                     1
## - age20.24                                                                      1
## - family.households                                                             1
## - Pyr.Retail.trade                                                              1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
## - age70.74                                                                      1
## - age50.54                                                                      1
## - age10.14                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - age85.89                                                                      1
## - rAsian                                                                        1
## - age55.59                                                                      1
##                                                                                 Sum of Sq
## - Pyr.Educational.services                                                     0.00003082
## - Pyr.Professional..scientific..and.technical.services                         0.00003169
## - Emp.Professional..scientific..and.technical.services                         0.00004815
## - Emp.Health.care.and.social.assistance                                        0.00005006
## - Emp.Educational.services                                                     0.00005110
## - Pyr.Utilities                                                                0.00005565
## - total.households                                                             0.00006573
## - Emp.Accommodation.and.food.services                                          0.00007154
## - Emp.Utilities                                                                0.00007204
## - Pyr.Manufacturing                                                            0.00007801
## - age60.64                                                                     0.00007861
## - age40.44                                                                     0.00008580
## <none>                                                                                   
## - Pyr.Information                                                              0.00011179
## - h.3person                                                                    0.00011541
## - Pyr.Finance.and.insurance                                                    0.00011616
## - h.5person                                                                    0.00011903
## - age35.39                                                                     0.00012166
## - age75.79                                                                     0.00013440
## - h.4person                                                                    0.00014415
## + Emp.Information                                                              0.00003545
## + age80.84                                                                     0.00002327
## - age30.34                                                                     0.00016360
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00016519
## + age0.4                                                                       0.00001855
## + Pyr.Transportation.and.warehousing.104.                                      0.00001730
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00000998
## + age25.29                                                                     0.00000497
## + age5.9                                                                       0.00000470
## + h.6person                                                                    0.00000390
## + h.7person.more                                                               0.00000390
## + rWhite                                                                       0.00000187
## + rMultiple                                                                    0.00000187
## + Pyr.Arts..entertainment..and.recreation                                      0.00000046
## + age90.over                                                                   0.00000039
## + age45.49                                                                     0.00000031
## + Emp.Arts..entertainment..and.recreation                                      0.00000031
## + Emp.Retail.trade                                                             0.00000004
## + Pyr.Accommodation.and.food.services                                          0.00000002
## - Emp.Real.estate.and.rental.and.leasing                                       0.00019708
## - Pyr.Health.care.and.social.assistance                                        0.00019771
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00024393
## - age65.69                                                                     0.00029349
## - rNativeHawaiian.OtherPacificIslander                                         0.00030735
## - h.1person                                                                    0.00034620
## - Emp.Wholesale.trade                                                          0.00042460
## - age15.19                                                                     0.00043317
## - Emp.Finance.and.insurance                                                    0.00043542
## - Emp.Transportation.and.warehousing.104.                                      0.00047182
## - Pyr.Wholesale.trade                                                          0.00050475
## - rOther                                                                       0.00051113
## - total.population                                                             0.00051465
## - Emp.Manufacturing                                                            0.00055933
## - Pyr.Other.services..except.public.administration.                            0.00056029
## - rBlack.AfricanAmerican                                                       0.00057837
## - h.2person                                                                    0.00065473
## - age20.24                                                                     0.00075844
## - family.households                                                            0.00076101
## - Pyr.Retail.trade                                                             0.00086032
## - Emp.Other.services..except.public.administration.                            0.00104259
## - male                                                                         0.00109118
## - age70.74                                                                     0.00112715
## - age50.54                                                                     0.00113281
## - age10.14                                                                     0.00124237
## - rAmericanIndian.AlaskaNative                                                 0.00139152
## - age85.89                                                                     0.00149519
## - rAsian                                                                       0.00179408
## - age55.59                                                                     0.00181802
##                                                                                    RSS
## - Pyr.Educational.services                                                     0.14147
## - Pyr.Professional..scientific..and.technical.services                         0.14147
## - Emp.Professional..scientific..and.technical.services                         0.14149
## - Emp.Health.care.and.social.assistance                                        0.14149
## - Emp.Educational.services                                                     0.14149
## - Pyr.Utilities                                                                0.14150
## - total.households                                                             0.14151
## - Emp.Accommodation.and.food.services                                          0.14151
## - Emp.Utilities                                                                0.14151
## - Pyr.Manufacturing                                                            0.14152
## - age60.64                                                                     0.14152
## - age40.44                                                                     0.14153
## <none>                                                                         0.14144
## - Pyr.Information                                                              0.14155
## - h.3person                                                                    0.14155
## - Pyr.Finance.and.insurance                                                    0.14156
## - h.5person                                                                    0.14156
## - age35.39                                                                     0.14156
## - age75.79                                                                     0.14157
## - h.4person                                                                    0.14158
## + Emp.Information                                                              0.14140
## + age80.84                                                                     0.14142
## - age30.34                                                                     0.14160
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14161
## + age0.4                                                                       0.14142
## + Pyr.Transportation.and.warehousing.104.                                      0.14142
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14143
## + age25.29                                                                     0.14144
## + age5.9                                                                       0.14144
## + h.6person                                                                    0.14144
## + h.7person.more                                                               0.14144
## + rWhite                                                                       0.14144
## + rMultiple                                                                    0.14144
## + Pyr.Arts..entertainment..and.recreation                                      0.14144
## + age90.over                                                                   0.14144
## + age45.49                                                                     0.14144
## + Emp.Arts..entertainment..and.recreation                                      0.14144
## + Emp.Retail.trade                                                             0.14144
## + Pyr.Accommodation.and.food.services                                          0.14144
## - Emp.Real.estate.and.rental.and.leasing                                       0.14164
## - Pyr.Health.care.and.social.assistance                                        0.14164
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14168
## - age65.69                                                                     0.14173
## - rNativeHawaiian.OtherPacificIslander                                         0.14175
## - h.1person                                                                    0.14179
## - Emp.Wholesale.trade                                                          0.14186
## - age15.19                                                                     0.14187
## - Emp.Finance.and.insurance                                                    0.14188
## - Emp.Transportation.and.warehousing.104.                                      0.14191
## - Pyr.Wholesale.trade                                                          0.14194
## - rOther                                                                       0.14195
## - total.population                                                             0.14195
## - Emp.Manufacturing                                                            0.14200
## - Pyr.Other.services..except.public.administration.                            0.14200
## - rBlack.AfricanAmerican                                                       0.14202
## - h.2person                                                                    0.14209
## - age20.24                                                                     0.14220
## - family.households                                                            0.14220
## - Pyr.Retail.trade                                                             0.14230
## - Emp.Other.services..except.public.administration.                            0.14248
## - male                                                                         0.14253
## - age70.74                                                                     0.14257
## - age50.54                                                                     0.14257
## - age10.14                                                                     0.14268
## - rAmericanIndian.AlaskaNative                                                 0.14283
## - age85.89                                                                     0.14294
## - rAsian                                                                       0.14323
## - age55.59                                                                     0.14326
##                                                                                   AIC
## - Pyr.Educational.services                                                     -30269
## - Pyr.Professional..scientific..and.technical.services                         -30269
## - Emp.Professional..scientific..and.technical.services                         -30268
## - Emp.Health.care.and.social.assistance                                        -30268
## - Emp.Educational.services                                                     -30268
## - Pyr.Utilities                                                                -30268
## - total.households                                                             -30268
## - Emp.Accommodation.and.food.services                                          -30268
## - Emp.Utilities                                                                -30268
## - Pyr.Manufacturing                                                            -30268
## - age60.64                                                                     -30268
## - age40.44                                                                     -30268
## <none>                                                                         -30267
## - Pyr.Information                                                              -30267
## - h.3person                                                                    -30267
## - Pyr.Finance.and.insurance                                                    -30267
## - h.5person                                                                    -30267
## - age35.39                                                                     -30267
## - age75.79                                                                     -30267
## - h.4person                                                                    -30266
## + Emp.Information                                                              -30266
## + age80.84                                                                     -30266
## - age30.34                                                                     -30266
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30266
## + age0.4                                                                       -30266
## + Pyr.Transportation.and.warehousing.104.                                      -30266
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30266
## + age25.29                                                                     -30266
## + age5.9                                                                       -30266
## + h.6person                                                                    -30266
## + h.7person.more                                                               -30266
## + rWhite                                                                       -30265
## + rMultiple                                                                    -30265
## + Pyr.Arts..entertainment..and.recreation                                      -30265
## + age90.over                                                                   -30265
## + age45.49                                                                     -30265
## + Emp.Arts..entertainment..and.recreation                                      -30265
## + Emp.Retail.trade                                                             -30265
## + Pyr.Accommodation.and.food.services                                          -30265
## - Emp.Real.estate.and.rental.and.leasing                                       -30265
## - Pyr.Health.care.and.social.assistance                                        -30265
## - Pyr.Real.estate.and.rental.and.leasing                                       -30264
## - age65.69                                                                     -30263
## - rNativeHawaiian.OtherPacificIslander                                         -30263
## - h.1person                                                                    -30262
## - Emp.Wholesale.trade                                                          -30260
## - age15.19                                                                     -30260
## - Emp.Finance.and.insurance                                                    -30260
## - Emp.Transportation.and.warehousing.104.                                      -30259
## - Pyr.Wholesale.trade                                                          -30259
## - rOther                                                                       -30258
## - total.population                                                             -30258
## - Emp.Manufacturing                                                            -30257
## - Pyr.Other.services..except.public.administration.                            -30257
## - rBlack.AfricanAmerican                                                       -30257
## - h.2person                                                                    -30255
## - age20.24                                                                     -30253
## - family.households                                                            -30253
## - Pyr.Retail.trade                                                             -30251
## - Emp.Other.services..except.public.administration.                            -30247
## - male                                                                         -30246
## - age70.74                                                                     -30245
## - age50.54                                                                     -30245
## - age10.14                                                                     -30243
## - rAmericanIndian.AlaskaNative                                                 -30240
## - age85.89                                                                     -30237
## - rAsian                                                                       -30231
## - age55.59                                                                     -30231
## 
## Step:  AIC=-30268.74
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age30.34 + age35.39 + age40.44 + age50.54 + age55.59 + 
##     age60.64 + age65.69 + age70.74 + age75.79 + age85.89 + rBlack.AfricanAmerican + 
##     rAmericanIndian.AlaskaNative + rAsian + rNativeHawaiian.OtherPacificIslander + 
##     rOther + total.households + family.households + h.1person + 
##     h.2person + h.3person + h.4person + h.5person + Pyr.Finance.and.insurance + 
##     Pyr.Health.care.and.social.assistance + Pyr.Information + 
##     Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Utilities + Pyr.Wholesale.trade + 
##     Emp.Accommodation.and.food.services + Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Educational.services + Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Transportation.and.warehousing.104. + Emp.Utilities + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - Emp.Educational.services                                                      1
## - Pyr.Professional..scientific..and.technical.services                          1
## - Emp.Health.care.and.social.assistance                                         1
## - Emp.Professional..scientific..and.technical.services                          1
## - Pyr.Utilities                                                                 1
## - total.households                                                              1
## - Emp.Accommodation.and.food.services                                           1
## - Emp.Utilities                                                                 1
## - Pyr.Manufacturing                                                             1
## - age60.64                                                                      1
## - age40.44                                                                      1
## <none>                                                                           
## - Pyr.Information                                                               1
## - h.3person                                                                     1
## - h.5person                                                                     1
## - age35.39                                                                      1
## - Pyr.Finance.and.insurance                                                     1
## - age75.79                                                                      1
## - h.4person                                                                     1
## + Pyr.Educational.services                                                      1
## + Emp.Information                                                               1
## - age30.34                                                                      1
## + age80.84                                                                      1
## + age0.4                                                                        1
## + Pyr.Transportation.and.warehousing.104.                                       1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## + age25.29                                                                      1
## + age5.9                                                                        1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## - Pyr.Health.care.and.social.assistance                                         1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + Emp.Arts..entertainment..and.recreation                                       1
## + age45.49                                                                      1
## + Pyr.Accommodation.and.food.services                                           1
## + age90.over                                                                    1
## + Emp.Retail.trade                                                              1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - age65.69                                                                      1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - h.1person                                                                     1
## - Emp.Wholesale.trade                                                           1
## - age15.19                                                                      1
## - Emp.Finance.and.insurance                                                     1
## - Emp.Transportation.and.warehousing.104.                                       1
## - rOther                                                                        1
## - total.population                                                              1
## - Pyr.Wholesale.trade                                                           1
## - Pyr.Other.services..except.public.administration.                             1
## - Emp.Manufacturing                                                             1
## - rBlack.AfricanAmerican                                                        1
## - h.2person                                                                     1
## - age20.24                                                                      1
## - family.households                                                             1
## - Pyr.Retail.trade                                                              1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
## - age50.54                                                                      1
## - age70.74                                                                      1
## - age10.14                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - age85.89                                                                      1
## - rAsian                                                                        1
## - age55.59                                                                      1
##                                                                                 Sum of Sq
## - Emp.Educational.services                                                     0.00002405
## - Pyr.Professional..scientific..and.technical.services                         0.00003570
## - Emp.Health.care.and.social.assistance                                        0.00004403
## - Emp.Professional..scientific..and.technical.services                         0.00005327
## - Pyr.Utilities                                                                0.00005757
## - total.households                                                             0.00006729
## - Emp.Accommodation.and.food.services                                          0.00007278
## - Emp.Utilities                                                                0.00007364
## - Pyr.Manufacturing                                                            0.00007817
## - age60.64                                                                     0.00007920
## - age40.44                                                                     0.00008492
## <none>                                                                                   
## - Pyr.Information                                                              0.00011356
## - h.3person                                                                    0.00011547
## - h.5person                                                                    0.00011938
## - age35.39                                                                     0.00012060
## - Pyr.Finance.and.insurance                                                    0.00013479
## - age75.79                                                                     0.00013485
## - h.4person                                                                    0.00014392
## + Pyr.Educational.services                                                     0.00003082
## + Emp.Information                                                              0.00002977
## - age30.34                                                                     0.00016104
## + age80.84                                                                     0.00002350
## + age0.4                                                                       0.00001898
## + Pyr.Transportation.and.warehousing.104.                                      0.00001753
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00017140
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00000987
## + age25.29                                                                     0.00000465
## + age5.9                                                                       0.00000453
## + h.6person                                                                    0.00000398
## + h.7person.more                                                               0.00000398
## - Pyr.Health.care.and.social.assistance                                        0.00018398
## + rWhite                                                                       0.00000173
## + rMultiple                                                                    0.00000173
## + Pyr.Arts..entertainment..and.recreation                                      0.00000110
## + Emp.Arts..entertainment..and.recreation                                      0.00000083
## + age45.49                                                                     0.00000034
## + Pyr.Accommodation.and.food.services                                          0.00000034
## + age90.over                                                                   0.00000025
## + Emp.Retail.trade                                                             0.00000000
## - Emp.Real.estate.and.rental.and.leasing                                       0.00019527
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00023575
## - age65.69                                                                     0.00029402
## - rNativeHawaiian.OtherPacificIslander                                         0.00031124
## - h.1person                                                                    0.00035167
## - Emp.Wholesale.trade                                                          0.00043152
## - age15.19                                                                     0.00043562
## - Emp.Finance.and.insurance                                                    0.00045104
## - Emp.Transportation.and.warehousing.104.                                      0.00047512
## - rOther                                                                       0.00050627
## - total.population                                                             0.00051167
## - Pyr.Wholesale.trade                                                          0.00051288
## - Pyr.Other.services..except.public.administration.                            0.00055882
## - Emp.Manufacturing                                                            0.00056100
## - rBlack.AfricanAmerican                                                       0.00057121
## - h.2person                                                                    0.00065665
## - age20.24                                                                     0.00075281
## - family.households                                                            0.00076770
## - Pyr.Retail.trade                                                             0.00087301
## - Emp.Other.services..except.public.administration.                            0.00104576
## - male                                                                         0.00108632
## - age50.54                                                                     0.00112286
## - age70.74                                                                     0.00112618
## - age10.14                                                                     0.00123296
## - rAmericanIndian.AlaskaNative                                                 0.00139523
## - age85.89                                                                     0.00149044
## - rAsian                                                                       0.00180724
## - age55.59                                                                     0.00181532
##                                                                                    RSS
## - Emp.Educational.services                                                     0.14150
## - Pyr.Professional..scientific..and.technical.services                         0.14151
## - Emp.Health.care.and.social.assistance                                        0.14152
## - Emp.Professional..scientific..and.technical.services                         0.14152
## - Pyr.Utilities                                                                0.14153
## - total.households                                                             0.14154
## - Emp.Accommodation.and.food.services                                          0.14154
## - Emp.Utilities                                                                0.14154
## - Pyr.Manufacturing                                                            0.14155
## - age60.64                                                                     0.14155
## - age40.44                                                                     0.14156
## <none>                                                                         0.14147
## - Pyr.Information                                                              0.14158
## - h.3person                                                                    0.14159
## - h.5person                                                                    0.14159
## - age35.39                                                                     0.14159
## - Pyr.Finance.and.insurance                                                    0.14161
## - age75.79                                                                     0.14161
## - h.4person                                                                    0.14161
## + Pyr.Educational.services                                                     0.14144
## + Emp.Information                                                              0.14144
## - age30.34                                                                     0.14163
## + age80.84                                                                     0.14145
## + age0.4                                                                       0.14145
## + Pyr.Transportation.and.warehousing.104.                                      0.14145
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14164
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14146
## + age25.29                                                                     0.14147
## + age5.9                                                                       0.14147
## + h.6person                                                                    0.14147
## + h.7person.more                                                               0.14147
## - Pyr.Health.care.and.social.assistance                                        0.14166
## + rWhite                                                                       0.14147
## + rMultiple                                                                    0.14147
## + Pyr.Arts..entertainment..and.recreation                                      0.14147
## + Emp.Arts..entertainment..and.recreation                                      0.14147
## + age45.49                                                                     0.14147
## + Pyr.Accommodation.and.food.services                                          0.14147
## + age90.over                                                                   0.14147
## + Emp.Retail.trade                                                             0.14147
## - Emp.Real.estate.and.rental.and.leasing                                       0.14167
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14171
## - age65.69                                                                     0.14177
## - rNativeHawaiian.OtherPacificIslander                                         0.14178
## - h.1person                                                                    0.14182
## - Emp.Wholesale.trade                                                          0.14190
## - age15.19                                                                     0.14191
## - Emp.Finance.and.insurance                                                    0.14192
## - Emp.Transportation.and.warehousing.104.                                      0.14195
## - rOther                                                                       0.14198
## - total.population                                                             0.14198
## - Pyr.Wholesale.trade                                                          0.14198
## - Pyr.Other.services..except.public.administration.                            0.14203
## - Emp.Manufacturing                                                            0.14203
## - rBlack.AfricanAmerican                                                       0.14204
## - h.2person                                                                    0.14213
## - age20.24                                                                     0.14222
## - family.households                                                            0.14224
## - Pyr.Retail.trade                                                             0.14234
## - Emp.Other.services..except.public.administration.                            0.14252
## - male                                                                         0.14256
## - age50.54                                                                     0.14259
## - age70.74                                                                     0.14260
## - age10.14                                                                     0.14270
## - rAmericanIndian.AlaskaNative                                                 0.14287
## - age85.89                                                                     0.14296
## - rAsian                                                                       0.14328
## - age55.59                                                                     0.14329
##                                                                                   AIC
## - Emp.Educational.services                                                     -30270
## - Pyr.Professional..scientific..and.technical.services                         -30270
## - Emp.Health.care.and.social.assistance                                        -30270
## - Emp.Professional..scientific..and.technical.services                         -30270
## - Pyr.Utilities                                                                -30270
## - total.households                                                             -30269
## - Emp.Accommodation.and.food.services                                          -30269
## - Emp.Utilities                                                                -30269
## - Pyr.Manufacturing                                                            -30269
## - age60.64                                                                     -30269
## - age40.44                                                                     -30269
## <none>                                                                         -30269
## - Pyr.Information                                                              -30268
## - h.3person                                                                    -30268
## - h.5person                                                                    -30268
## - age35.39                                                                     -30268
## - Pyr.Finance.and.insurance                                                    -30268
## - age75.79                                                                     -30268
## - h.4person                                                                    -30268
## + Pyr.Educational.services                                                     -30267
## + Emp.Information                                                              -30267
## - age30.34                                                                     -30267
## + age80.84                                                                     -30267
## + age0.4                                                                       -30267
## + Pyr.Transportation.and.warehousing.104.                                      -30267
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30267
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30267
## + age25.29                                                                     -30267
## + age5.9                                                                       -30267
## + h.6person                                                                    -30267
## + h.7person.more                                                               -30267
## - Pyr.Health.care.and.social.assistance                                        -30267
## + rWhite                                                                       -30267
## + rMultiple                                                                    -30267
## + Pyr.Arts..entertainment..and.recreation                                      -30267
## + Emp.Arts..entertainment..and.recreation                                      -30267
## + age45.49                                                                     -30267
## + Pyr.Accommodation.and.food.services                                          -30267
## + age90.over                                                                   -30267
## + Emp.Retail.trade                                                             -30267
## - Emp.Real.estate.and.rental.and.leasing                                       -30267
## - Pyr.Real.estate.and.rental.and.leasing                                       -30266
## - age65.69                                                                     -30264
## - rNativeHawaiian.OtherPacificIslander                                         -30264
## - h.1person                                                                    -30263
## - Emp.Wholesale.trade                                                          -30262
## - age15.19                                                                     -30261
## - Emp.Finance.and.insurance                                                    -30261
## - Emp.Transportation.and.warehousing.104.                                      -30261
## - rOther                                                                       -30260
## - total.population                                                             -30260
## - Pyr.Wholesale.trade                                                          -30260
## - Pyr.Other.services..except.public.administration.                            -30259
## - Emp.Manufacturing                                                            -30259
## - rBlack.AfricanAmerican                                                       -30259
## - h.2person                                                                    -30257
## - age20.24                                                                     -30255
## - family.households                                                            -30254
## - Pyr.Retail.trade                                                             -30252
## - Emp.Other.services..except.public.administration.                            -30248
## - male                                                                         -30248
## - age50.54                                                                     -30247
## - age70.74                                                                     -30247
## - age10.14                                                                     -30244
## - rAmericanIndian.AlaskaNative                                                 -30241
## - age85.89                                                                     -30239
## - rAsian                                                                       -30232
## - age55.59                                                                     -30232
## 
## Step:  AIC=-30270.22
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age30.34 + age35.39 + age40.44 + age50.54 + age55.59 + 
##     age60.64 + age65.69 + age70.74 + age75.79 + age85.89 + rBlack.AfricanAmerican + 
##     rAmericanIndian.AlaskaNative + rAsian + rNativeHawaiian.OtherPacificIslander + 
##     rOther + total.households + family.households + h.1person + 
##     h.2person + h.3person + h.4person + h.5person + Pyr.Finance.and.insurance + 
##     Pyr.Health.care.and.social.assistance + Pyr.Information + 
##     Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Professional..scientific..and.technical.services + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Utilities + Pyr.Wholesale.trade + 
##     Emp.Accommodation.and.food.services + Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Transportation.and.warehousing.104. + Emp.Utilities + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - Pyr.Professional..scientific..and.technical.services                          1
## - Emp.Health.care.and.social.assistance                                         1
## - Emp.Professional..scientific..and.technical.services                          1
## - Pyr.Utilities                                                                 1
## - total.households                                                              1
## - Emp.Utilities                                                                 1
## - Emp.Accommodation.and.food.services                                           1
## - Pyr.Manufacturing                                                             1
## - age60.64                                                                      1
## - age40.44                                                                      1
## <none>                                                                           
## - Pyr.Information                                                               1
## - h.3person                                                                     1
## - h.5person                                                                     1
## - age35.39                                                                      1
## - age75.79                                                                      1
## - Pyr.Finance.and.insurance                                                     1
## - h.4person                                                                     1
## + Emp.Information                                                               1
## + Emp.Educational.services                                                      1
## + age80.84                                                                      1
## - age30.34                                                                      1
## - Pyr.Health.care.and.social.assistance                                         1
## + age0.4                                                                        1
## + Pyr.Transportation.and.warehousing.104.                                       1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## + age25.29                                                                      1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## + Pyr.Educational.services                                                      1
## + age5.9                                                                        1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + Pyr.Accommodation.and.food.services                                           1
## + age90.over                                                                    1
## + age45.49                                                                      1
## + Emp.Arts..entertainment..and.recreation                                       1
## + Emp.Retail.trade                                                              1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - age65.69                                                                      1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - h.1person                                                                     1
## - Emp.Wholesale.trade                                                           1
## - age15.19                                                                      1
## - Emp.Transportation.and.warehousing.104.                                       1
## - Emp.Finance.and.insurance                                                     1
## - rOther                                                                        1
## - Pyr.Wholesale.trade                                                           1
## - total.population                                                              1
## - Pyr.Other.services..except.public.administration.                             1
## - Emp.Manufacturing                                                             1
## - rBlack.AfricanAmerican                                                        1
## - h.2person                                                                     1
## - age20.24                                                                      1
## - family.households                                                             1
## - Pyr.Retail.trade                                                              1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
## - age70.74                                                                      1
## - age50.54                                                                      1
## - age10.14                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - age85.89                                                                      1
## - rAsian                                                                        1
## - age55.59                                                                      1
##                                                                                 Sum of Sq
## - Pyr.Professional..scientific..and.technical.services                         0.00003170
## - Emp.Health.care.and.social.assistance                                        0.00003549
## - Emp.Professional..scientific..and.technical.services                         0.00005656
## - Pyr.Utilities                                                                0.00005736
## - total.households                                                             0.00007108
## - Emp.Utilities                                                                0.00007349
## - Emp.Accommodation.and.food.services                                          0.00007722
## - Pyr.Manufacturing                                                            0.00007828
## - age60.64                                                                     0.00007895
## - age40.44                                                                     0.00008283
## <none>                                                                                   
## - Pyr.Information                                                              0.00010626
## - h.3person                                                                    0.00011513
## - h.5person                                                                    0.00011636
## - age35.39                                                                     0.00012138
## - age75.79                                                                     0.00013552
## - Pyr.Finance.and.insurance                                                    0.00014272
## - h.4person                                                                    0.00014372
## + Emp.Information                                                              0.00003973
## + Emp.Educational.services                                                     0.00002405
## + age80.84                                                                     0.00002345
## - age30.34                                                                     0.00016284
## - Pyr.Health.care.and.social.assistance                                        0.00016485
## + age0.4                                                                       0.00001841
## + Pyr.Transportation.and.warehousing.104.                                      0.00001572
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00001144
## - Emp.Real.estate.and.rental.and.leasing                                       0.00017945
## + age25.29                                                                     0.00000437
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00018168
## + h.6person                                                                    0.00000411
## + h.7person.more                                                               0.00000411
## + Pyr.Educational.services                                                     0.00000378
## + age5.9                                                                       0.00000357
## + rWhite                                                                       0.00000199
## + rMultiple                                                                    0.00000199
## + Pyr.Arts..entertainment..and.recreation                                      0.00000063
## + Pyr.Accommodation.and.food.services                                          0.00000047
## + age90.over                                                                   0.00000014
## + age45.49                                                                     0.00000013
## + Emp.Arts..entertainment..and.recreation                                      0.00000006
## + Emp.Retail.trade                                                             0.00000005
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00022721
## - age65.69                                                                     0.00029556
## - rNativeHawaiian.OtherPacificIslander                                         0.00031220
## - h.1person                                                                    0.00036138
## - Emp.Wholesale.trade                                                          0.00042831
## - age15.19                                                                     0.00043705
## - Emp.Transportation.and.warehousing.104.                                      0.00045963
## - Emp.Finance.and.insurance                                                    0.00047380
## - rOther                                                                       0.00050737
## - Pyr.Wholesale.trade                                                          0.00050832
## - total.population                                                             0.00051492
## - Pyr.Other.services..except.public.administration.                            0.00054652
## - Emp.Manufacturing                                                            0.00056040
## - rBlack.AfricanAmerican                                                       0.00057125
## - h.2person                                                                    0.00065264
## - age20.24                                                                     0.00075938
## - family.households                                                            0.00079377
## - Pyr.Retail.trade                                                             0.00085414
## - Emp.Other.services..except.public.administration.                            0.00102249
## - male                                                                         0.00108136
## - age70.74                                                                     0.00112355
## - age50.54                                                                     0.00112422
## - age10.14                                                                     0.00122523
## - rAmericanIndian.AlaskaNative                                                 0.00139505
## - age85.89                                                                     0.00148239
## - rAsian                                                                       0.00179961
## - age55.59                                                                     0.00181176
##                                                                                    RSS
## - Pyr.Professional..scientific..and.technical.services                         0.14153
## - Emp.Health.care.and.social.assistance                                        0.14153
## - Emp.Professional..scientific..and.technical.services                         0.14155
## - Pyr.Utilities                                                                0.14155
## - total.households                                                             0.14157
## - Emp.Utilities                                                                0.14157
## - Emp.Accommodation.and.food.services                                          0.14157
## - Pyr.Manufacturing                                                            0.14157
## - age60.64                                                                     0.14157
## - age40.44                                                                     0.14158
## <none>                                                                         0.14150
## - Pyr.Information                                                              0.14160
## - h.3person                                                                    0.14161
## - h.5person                                                                    0.14161
## - age35.39                                                                     0.14162
## - age75.79                                                                     0.14163
## - Pyr.Finance.and.insurance                                                    0.14164
## - h.4person                                                                    0.14164
## + Emp.Information                                                              0.14145
## + Emp.Educational.services                                                     0.14147
## + age80.84                                                                     0.14147
## - age30.34                                                                     0.14166
## - Pyr.Health.care.and.social.assistance                                        0.14166
## + age0.4                                                                       0.14148
## + Pyr.Transportation.and.warehousing.104.                                      0.14148
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14148
## - Emp.Real.estate.and.rental.and.leasing                                       0.14167
## + age25.29                                                                     0.14149
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14168
## + h.6person                                                                    0.14149
## + h.7person.more                                                               0.14149
## + Pyr.Educational.services                                                     0.14149
## + age5.9                                                                       0.14149
## + rWhite                                                                       0.14149
## + rMultiple                                                                    0.14149
## + Pyr.Arts..entertainment..and.recreation                                      0.14149
## + Pyr.Accommodation.and.food.services                                          0.14149
## + age90.over                                                                   0.14150
## + age45.49                                                                     0.14150
## + Emp.Arts..entertainment..and.recreation                                      0.14150
## + Emp.Retail.trade                                                             0.14150
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14172
## - age65.69                                                                     0.14179
## - rNativeHawaiian.OtherPacificIslander                                         0.14181
## - h.1person                                                                    0.14186
## - Emp.Wholesale.trade                                                          0.14192
## - age15.19                                                                     0.14193
## - Emp.Transportation.and.warehousing.104.                                      0.14195
## - Emp.Finance.and.insurance                                                    0.14197
## - rOther                                                                       0.14200
## - Pyr.Wholesale.trade                                                          0.14200
## - total.population                                                             0.14201
## - Pyr.Other.services..except.public.administration.                            0.14204
## - Emp.Manufacturing                                                            0.14205
## - rBlack.AfricanAmerican                                                       0.14207
## - h.2person                                                                    0.14215
## - age20.24                                                                     0.14225
## - family.households                                                            0.14229
## - Pyr.Retail.trade                                                             0.14235
## - Emp.Other.services..except.public.administration.                            0.14252
## - male                                                                         0.14258
## - age70.74                                                                     0.14262
## - age50.54                                                                     0.14262
## - age10.14                                                                     0.14272
## - rAmericanIndian.AlaskaNative                                                 0.14289
## - age85.89                                                                     0.14298
## - rAsian                                                                       0.14329
## - age55.59                                                                     0.14331
##                                                                                   AIC
## - Pyr.Professional..scientific..and.technical.services                         -30272
## - Emp.Health.care.and.social.assistance                                        -30272
## - Emp.Professional..scientific..and.technical.services                         -30271
## - Pyr.Utilities                                                                -30271
## - total.households                                                             -30271
## - Emp.Utilities                                                                -30271
## - Emp.Accommodation.and.food.services                                          -30271
## - Pyr.Manufacturing                                                            -30271
## - age60.64                                                                     -30271
## - age40.44                                                                     -30270
## <none>                                                                         -30270
## - Pyr.Information                                                              -30270
## - h.3person                                                                    -30270
## - h.5person                                                                    -30270
## - age35.39                                                                     -30270
## - age75.79                                                                     -30269
## - Pyr.Finance.and.insurance                                                    -30269
## - h.4person                                                                    -30269
## + Emp.Information                                                              -30269
## + Emp.Educational.services                                                     -30269
## + age80.84                                                                     -30269
## - age30.34                                                                     -30269
## - Pyr.Health.care.and.social.assistance                                        -30269
## + age0.4                                                                       -30269
## + Pyr.Transportation.and.warehousing.104.                                      -30269
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30269
## - Emp.Real.estate.and.rental.and.leasing                                       -30268
## + age25.29                                                                     -30268
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30268
## + h.6person                                                                    -30268
## + h.7person.more                                                               -30268
## + Pyr.Educational.services                                                     -30268
## + age5.9                                                                       -30268
## + rWhite                                                                       -30268
## + rMultiple                                                                    -30268
## + Pyr.Arts..entertainment..and.recreation                                      -30268
## + Pyr.Accommodation.and.food.services                                          -30268
## + age90.over                                                                   -30268
## + age45.49                                                                     -30268
## + Emp.Arts..entertainment..and.recreation                                      -30268
## + Emp.Retail.trade                                                             -30268
## - Pyr.Real.estate.and.rental.and.leasing                                       -30267
## - age65.69                                                                     -30266
## - rNativeHawaiian.OtherPacificIslander                                         -30266
## - h.1person                                                                    -30265
## - Emp.Wholesale.trade                                                          -30263
## - age15.19                                                                     -30263
## - Emp.Transportation.and.warehousing.104.                                      -30262
## - Emp.Finance.and.insurance                                                    -30262
## - rOther                                                                       -30261
## - Pyr.Wholesale.trade                                                          -30261
## - total.population                                                             -30261
## - Pyr.Other.services..except.public.administration.                            -30261
## - Emp.Manufacturing                                                            -30260
## - rBlack.AfricanAmerican                                                       -30260
## - h.2person                                                                    -30258
## - age20.24                                                                     -30256
## - family.households                                                            -30255
## - Pyr.Retail.trade                                                             -30254
## - Emp.Other.services..except.public.administration.                            -30250
## - male                                                                         -30249
## - age70.74                                                                     -30248
## - age50.54                                                                     -30248
## - age10.14                                                                     -30246
## - rAmericanIndian.AlaskaNative                                                 -30242
## - age85.89                                                                     -30241
## - rAsian                                                                       -30234
## - age55.59                                                                     -30234
## 
## Step:  AIC=-30271.54
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age30.34 + age35.39 + age40.44 + age50.54 + age55.59 + 
##     age60.64 + age65.69 + age70.74 + age75.79 + age85.89 + rBlack.AfricanAmerican + 
##     rAmericanIndian.AlaskaNative + rAsian + rNativeHawaiian.OtherPacificIslander + 
##     rOther + total.households + family.households + h.1person + 
##     h.2person + h.3person + h.4person + h.5person + Pyr.Finance.and.insurance + 
##     Pyr.Health.care.and.social.assistance + Pyr.Information + 
##     Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Real.estate.and.rental.and.leasing + Pyr.Retail.trade + 
##     Pyr.Utilities + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Professional..scientific..and.technical.services + Emp.Real.estate.and.rental.and.leasing + 
##     Emp.Transportation.and.warehousing.104. + Emp.Utilities + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - Emp.Professional..scientific..and.technical.services                          1
## - Emp.Health.care.and.social.assistance                                         1
## - Pyr.Utilities                                                                 1
## - total.households                                                              1
## - Emp.Utilities                                                                 1
## - Pyr.Manufacturing                                                             1
## - age60.64                                                                      1
## - Emp.Accommodation.and.food.services                                           1
## - age40.44                                                                      1
## <none>                                                                           
## - h.5person                                                                     1
## - h.3person                                                                     1
## - age35.39                                                                      1
## - age75.79                                                                      1
## - h.4person                                                                     1
## + Pyr.Professional..scientific..and.technical.services                          1
## - Pyr.Information                                                               1
## + age80.84                                                                      1
## + Emp.Information                                                               1
## - age30.34                                                                      1
## + Emp.Educational.services                                                      1
## + age0.4                                                                        1
## - Pyr.Health.care.and.social.assistance                                         1
## + Pyr.Transportation.and.warehousing.104.                                       1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## + age25.29                                                                      1
## + age5.9                                                                        1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## + Pyr.Educational.services                                                      1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + Pyr.Accommodation.and.food.services                                           1
## + Emp.Arts..entertainment..and.recreation                                       1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## + age45.49                                                                      1
## + age90.over                                                                    1
## + Emp.Retail.trade                                                              1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - Pyr.Finance.and.insurance                                                     1
## - age65.69                                                                      1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - h.1person                                                                     1
## - Emp.Wholesale.trade                                                           1
## - age15.19                                                                      1
## - Emp.Transportation.and.warehousing.104.                                       1
## - Pyr.Wholesale.trade                                                           1
## - rOther                                                                        1
## - Emp.Finance.and.insurance                                                     1
## - Pyr.Other.services..except.public.administration.                             1
## - total.population                                                              1
## - Emp.Manufacturing                                                             1
## - rBlack.AfricanAmerican                                                        1
## - h.2person                                                                     1
## - age20.24                                                                      1
## - family.households                                                             1
## - Pyr.Retail.trade                                                              1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
## - age70.74                                                                      1
## - age50.54                                                                      1
## - age10.14                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - age85.89                                                                      1
## - rAsian                                                                        1
## - age55.59                                                                      1
##                                                                                 Sum of Sq
## - Emp.Professional..scientific..and.technical.services                         0.00003070
## - Emp.Health.care.and.social.assistance                                        0.00004096
## - Pyr.Utilities                                                                0.00005679
## - total.households                                                             0.00007237
## - Emp.Utilities                                                                0.00007326
## - Pyr.Manufacturing                                                            0.00007613
## - age60.64                                                                     0.00007949
## - Emp.Accommodation.and.food.services                                          0.00008075
## - age40.44                                                                     0.00008724
## <none>                                                                                   
## - h.5person                                                                    0.00011353
## - h.3person                                                                    0.00011661
## - age35.39                                                                     0.00011745
## - age75.79                                                                     0.00014260
## - h.4person                                                                    0.00014299
## + Pyr.Professional..scientific..and.technical.services                         0.00003170
## - Pyr.Information                                                              0.00016054
## + age80.84                                                                     0.00002235
## + Emp.Information                                                              0.00002156
## - age30.34                                                                     0.00016524
## + Emp.Educational.services                                                     0.00002005
## + age0.4                                                                       0.00001979
## - Pyr.Health.care.and.social.assistance                                        0.00016774
## + Pyr.Transportation.and.warehousing.104.                                      0.00001641
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00001525
## + age25.29                                                                     0.00000527
## + age5.9                                                                       0.00000373
## + h.6person                                                                    0.00000322
## + h.7person.more                                                               0.00000322
## + rWhite                                                                       0.00000249
## + rMultiple                                                                    0.00000249
## - Emp.Real.estate.and.rental.and.leasing                                       0.00018406
## + Pyr.Educational.services                                                     0.00000200
## + Pyr.Arts..entertainment..and.recreation                                      0.00000085
## + Pyr.Accommodation.and.food.services                                          0.00000067
## + Emp.Arts..entertainment..and.recreation                                      0.00000024
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00018590
## + age45.49                                                                     0.00000013
## + age90.over                                                                   0.00000009
## + Emp.Retail.trade                                                             0.00000008
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00023108
## - Pyr.Finance.and.insurance                                                    0.00023205
## - age65.69                                                                     0.00029465
## - rNativeHawaiian.OtherPacificIslander                                         0.00032405
## - h.1person                                                                    0.00036645
## - Emp.Wholesale.trade                                                          0.00040860
## - age15.19                                                                     0.00044702
## - Emp.Transportation.and.warehousing.104.                                      0.00046948
## - Pyr.Wholesale.trade                                                          0.00048591
## - rOther                                                                       0.00050730
## - Emp.Finance.and.insurance                                                    0.00053262
## - Pyr.Other.services..except.public.administration.                            0.00053719
## - total.population                                                             0.00054020
## - Emp.Manufacturing                                                            0.00055761
## - rBlack.AfricanAmerican                                                       0.00057614
## - h.2person                                                                    0.00065043
## - age20.24                                                                     0.00076414
## - family.households                                                            0.00079959
## - Pyr.Retail.trade                                                             0.00086023
## - Emp.Other.services..except.public.administration.                            0.00100596
## - male                                                                         0.00108451
## - age70.74                                                                     0.00112620
## - age50.54                                                                     0.00113097
## - age10.14                                                                     0.00122773
## - rAmericanIndian.AlaskaNative                                                 0.00137956
## - age85.89                                                                     0.00148531
## - rAsian                                                                       0.00176873
## - age55.59                                                                     0.00180988
##                                                                                    RSS
## - Emp.Professional..scientific..and.technical.services                         0.14156
## - Emp.Health.care.and.social.assistance                                        0.14157
## - Pyr.Utilities                                                                0.14158
## - total.households                                                             0.14160
## - Emp.Utilities                                                                0.14160
## - Pyr.Manufacturing                                                            0.14160
## - age60.64                                                                     0.14161
## - Emp.Accommodation.and.food.services                                          0.14161
## - age40.44                                                                     0.14161
## <none>                                                                         0.14153
## - h.5person                                                                    0.14164
## - h.3person                                                                    0.14164
## - age35.39                                                                     0.14164
## - age75.79                                                                     0.14167
## - h.4person                                                                    0.14167
## + Pyr.Professional..scientific..and.technical.services                         0.14150
## - Pyr.Information                                                              0.14169
## + age80.84                                                                     0.14150
## + Emp.Information                                                              0.14150
## - age30.34                                                                     0.14169
## + Emp.Educational.services                                                     0.14151
## + age0.4                                                                       0.14151
## - Pyr.Health.care.and.social.assistance                                        0.14169
## + Pyr.Transportation.and.warehousing.104.                                      0.14151
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14151
## + age25.29                                                                     0.14152
## + age5.9                                                                       0.14152
## + h.6person                                                                    0.14152
## + h.7person.more                                                               0.14152
## + rWhite                                                                       0.14152
## + rMultiple                                                                    0.14152
## - Emp.Real.estate.and.rental.and.leasing                                       0.14171
## + Pyr.Educational.services                                                     0.14152
## + Pyr.Arts..entertainment..and.recreation                                      0.14153
## + Pyr.Accommodation.and.food.services                                          0.14153
## + Emp.Arts..entertainment..and.recreation                                      0.14153
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14171
## + age45.49                                                                     0.14153
## + age90.over                                                                   0.14153
## + Emp.Retail.trade                                                             0.14153
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14176
## - Pyr.Finance.and.insurance                                                    0.14176
## - age65.69                                                                     0.14182
## - rNativeHawaiian.OtherPacificIslander                                         0.14185
## - h.1person                                                                    0.14189
## - Emp.Wholesale.trade                                                          0.14194
## - age15.19                                                                     0.14197
## - Emp.Transportation.and.warehousing.104.                                      0.14200
## - Pyr.Wholesale.trade                                                          0.14201
## - rOther                                                                       0.14203
## - Emp.Finance.and.insurance                                                    0.14206
## - Pyr.Other.services..except.public.administration.                            0.14206
## - total.population                                                             0.14207
## - Emp.Manufacturing                                                            0.14208
## - rBlack.AfricanAmerican                                                       0.14210
## - h.2person                                                                    0.14218
## - age20.24                                                                     0.14229
## - family.households                                                            0.14233
## - Pyr.Retail.trade                                                             0.14239
## - Emp.Other.services..except.public.administration.                            0.14253
## - male                                                                         0.14261
## - age70.74                                                                     0.14265
## - age50.54                                                                     0.14266
## - age10.14                                                                     0.14275
## - rAmericanIndian.AlaskaNative                                                 0.14291
## - age85.89                                                                     0.14301
## - rAsian                                                                       0.14330
## - age55.59                                                                     0.14334
##                                                                                   AIC
## - Emp.Professional..scientific..and.technical.services                         -30273
## - Emp.Health.care.and.social.assistance                                        -30273
## - Pyr.Utilities                                                                -30272
## - total.households                                                             -30272
## - Emp.Utilities                                                                -30272
## - Pyr.Manufacturing                                                            -30272
## - age60.64                                                                     -30272
## - Emp.Accommodation.and.food.services                                          -30272
## - age40.44                                                                     -30272
## <none>                                                                         -30272
## - h.5person                                                                    -30271
## - h.3person                                                                    -30271
## - age35.39                                                                     -30271
## - age75.79                                                                     -30271
## - h.4person                                                                    -30271
## + Pyr.Professional..scientific..and.technical.services                         -30270
## - Pyr.Information                                                              -30270
## + age80.84                                                                     -30270
## + Emp.Information                                                              -30270
## - age30.34                                                                     -30270
## + Emp.Educational.services                                                     -30270
## + age0.4                                                                       -30270
## - Pyr.Health.care.and.social.assistance                                        -30270
## + Pyr.Transportation.and.warehousing.104.                                      -30270
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30270
## + age25.29                                                                     -30270
## + age5.9                                                                       -30270
## + h.6person                                                                    -30270
## + h.7person.more                                                               -30270
## + rWhite                                                                       -30270
## + rMultiple                                                                    -30270
## - Emp.Real.estate.and.rental.and.leasing                                       -30270
## + Pyr.Educational.services                                                     -30270
## + Pyr.Arts..entertainment..and.recreation                                      -30270
## + Pyr.Accommodation.and.food.services                                          -30270
## + Emp.Arts..entertainment..and.recreation                                      -30270
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30270
## + age45.49                                                                     -30270
## + age90.over                                                                   -30270
## + Emp.Retail.trade                                                             -30270
## - Pyr.Real.estate.and.rental.and.leasing                                       -30269
## - Pyr.Finance.and.insurance                                                    -30269
## - age65.69                                                                     -30267
## - rNativeHawaiian.OtherPacificIslander                                         -30267
## - h.1person                                                                    -30266
## - Emp.Wholesale.trade                                                          -30265
## - age15.19                                                                     -30264
## - Emp.Transportation.and.warehousing.104.                                      -30264
## - Pyr.Wholesale.trade                                                          -30263
## - rOther                                                                       -30263
## - Emp.Finance.and.insurance                                                    -30262
## - Pyr.Other.services..except.public.administration.                            -30262
## - total.population                                                             -30262
## - Emp.Manufacturing                                                            -30262
## - rBlack.AfricanAmerican                                                       -30261
## - h.2person                                                                    -30260
## - age20.24                                                                     -30257
## - family.households                                                            -30256
## - Pyr.Retail.trade                                                             -30255
## - Emp.Other.services..except.public.administration.                            -30252
## - male                                                                         -30250
## - age70.74                                                                     -30249
## - age50.54                                                                     -30249
## - age10.14                                                                     -30247
## - rAmericanIndian.AlaskaNative                                                 -30244
## - age85.89                                                                     -30242
## - rAsian                                                                       -30236
## - age55.59                                                                     -30235
## 
## Step:  AIC=-30272.88
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age30.34 + age35.39 + age40.44 + age50.54 + age55.59 + 
##     age60.64 + age65.69 + age70.74 + age75.79 + age85.89 + rBlack.AfricanAmerican + 
##     rAmericanIndian.AlaskaNative + rAsian + rNativeHawaiian.OtherPacificIslander + 
##     rOther + total.households + family.households + h.1person + 
##     h.2person + h.3person + h.4person + h.5person + Pyr.Finance.and.insurance + 
##     Pyr.Health.care.and.social.assistance + Pyr.Information + 
##     Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Real.estate.and.rental.and.leasing + Pyr.Retail.trade + 
##     Pyr.Utilities + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Finance.and.insurance + Emp.Health.care.and.social.assistance + 
##     Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Real.estate.and.rental.and.leasing + Emp.Transportation.and.warehousing.104. + 
##     Emp.Utilities + Emp.Wholesale.trade
## 
##                                                                                Df
## - Emp.Health.care.and.social.assistance                                         1
## - Pyr.Utilities                                                                 1
## - Emp.Utilities                                                                 1
## - Pyr.Manufacturing                                                             1
## - total.households                                                              1
## - age60.64                                                                      1
## - Emp.Accommodation.and.food.services                                           1
## - age40.44                                                                      1
## <none>                                                                           
## - h.5person                                                                     1
## - age35.39                                                                      1
## - h.3person                                                                     1
## - Pyr.Information                                                               1
## - h.4person                                                                     1
## - age75.79                                                                      1
## + Emp.Information                                                               1
## - Pyr.Health.care.and.social.assistance                                         1
## + Emp.Educational.services                                                      1
## + Emp.Professional..scientific..and.technical.services                          1
## + age80.84                                                                      1
## + age0.4                                                                        1
## - age30.34                                                                      1
## + Pyr.Transportation.and.warehousing.104.                                       1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## + Pyr.Educational.services                                                      1
## + Pyr.Professional..scientific..and.technical.services                          1
## + age25.29                                                                      1
## + age5.9                                                                        1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + Pyr.Accommodation.and.food.services                                           1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + age45.49                                                                      1
## + Emp.Retail.trade                                                              1
## + Emp.Arts..entertainment..and.recreation                                       1
## + age90.over                                                                    1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - Pyr.Finance.and.insurance                                                     1
## - age65.69                                                                      1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - h.1person                                                                     1
## - Emp.Wholesale.trade                                                           1
## - age15.19                                                                      1
## - Emp.Transportation.and.warehousing.104.                                       1
## - Pyr.Wholesale.trade                                                           1
## - rOther                                                                        1
## - Pyr.Other.services..except.public.administration.                             1
## - Emp.Manufacturing                                                             1
## - total.population                                                              1
## - rBlack.AfricanAmerican                                                        1
## - Emp.Finance.and.insurance                                                     1
## - h.2person                                                                     1
## - age20.24                                                                      1
## - family.households                                                             1
## - Pyr.Retail.trade                                                              1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
## - age70.74                                                                      1
## - age50.54                                                                      1
## - age10.14                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - age85.89                                                                      1
## - rAsian                                                                        1
## - age55.59                                                                      1
##                                                                                 Sum of Sq
## - Emp.Health.care.and.social.assistance                                        0.00003411
## - Pyr.Utilities                                                                0.00005573
## - Emp.Utilities                                                                0.00007241
## - Pyr.Manufacturing                                                            0.00007630
## - total.households                                                             0.00007661
## - age60.64                                                                     0.00008224
## - Emp.Accommodation.and.food.services                                          0.00008508
## - age40.44                                                                     0.00008982
## <none>                                                                                   
## - h.5person                                                                    0.00010981
## - age35.39                                                                     0.00011843
## - h.3person                                                                    0.00012138
## - Pyr.Information                                                              0.00013268
## - h.4person                                                                    0.00013833
## - age75.79                                                                     0.00014428
## + Emp.Information                                                              0.00004177
## - Pyr.Health.care.and.social.assistance                                        0.00014743
## + Emp.Educational.services                                                     0.00003203
## + Emp.Professional..scientific..and.technical.services                         0.00003070
## + age80.84                                                                     0.00002197
## + age0.4                                                                       0.00001955
## - age30.34                                                                     0.00016719
## + Pyr.Transportation.and.warehousing.104.                                      0.00001806
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00001194
## - Emp.Real.estate.and.rental.and.leasing                                       0.00017855
## + Pyr.Educational.services                                                     0.00000635
## + Pyr.Professional..scientific..and.technical.services                         0.00000584
## + age25.29                                                                     0.00000441
## + age5.9                                                                       0.00000267
## + h.6person                                                                    0.00000253
## + h.7person.more                                                               0.00000253
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00018367
## + rWhite                                                                       0.00000185
## + rMultiple                                                                    0.00000185
## + Pyr.Accommodation.and.food.services                                          0.00000072
## + Pyr.Arts..entertainment..and.recreation                                      0.00000065
## + age45.49                                                                     0.00000010
## + Emp.Retail.trade                                                             0.00000009
## + Emp.Arts..entertainment..and.recreation                                      0.00000008
## + age90.over                                                                   0.00000007
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00022919
## - Pyr.Finance.and.insurance                                                    0.00023828
## - age65.69                                                                     0.00029715
## - rNativeHawaiian.OtherPacificIslander                                         0.00031958
## - h.1person                                                                    0.00037574
## - Emp.Wholesale.trade                                                          0.00041500
## - age15.19                                                                     0.00045010
## - Emp.Transportation.and.warehousing.104.                                      0.00045557
## - Pyr.Wholesale.trade                                                          0.00049250
## - rOther                                                                       0.00049972
## - Pyr.Other.services..except.public.administration.                            0.00052645
## - Emp.Manufacturing                                                            0.00055857
## - total.population                                                             0.00056713
## - rBlack.AfricanAmerican                                                       0.00057835
## - Emp.Finance.and.insurance                                                    0.00060286
## - h.2person                                                                    0.00064297
## - age20.24                                                                     0.00077005
## - family.households                                                            0.00080055
## - Pyr.Retail.trade                                                             0.00085428
## - Emp.Other.services..except.public.administration.                            0.00098304
## - male                                                                         0.00107297
## - age70.74                                                                     0.00112972
## - age50.54                                                                     0.00113816
## - age10.14                                                                     0.00123004
## - rAmericanIndian.AlaskaNative                                                 0.00136515
## - age85.89                                                                     0.00151265
## - rAsian                                                                       0.00176327
## - age55.59                                                                     0.00181130
##                                                                                    RSS
## - Emp.Health.care.and.social.assistance                                        0.14159
## - Pyr.Utilities                                                                0.14161
## - Emp.Utilities                                                                0.14163
## - Pyr.Manufacturing                                                            0.14163
## - total.households                                                             0.14163
## - age60.64                                                                     0.14164
## - Emp.Accommodation.and.food.services                                          0.14164
## - age40.44                                                                     0.14165
## <none>                                                                         0.14156
## - h.5person                                                                    0.14167
## - age35.39                                                                     0.14168
## - h.3person                                                                    0.14168
## - Pyr.Information                                                              0.14169
## - h.4person                                                                    0.14170
## - age75.79                                                                     0.14170
## + Emp.Information                                                              0.14152
## - Pyr.Health.care.and.social.assistance                                        0.14170
## + Emp.Educational.services                                                     0.14153
## + Emp.Professional..scientific..and.technical.services                         0.14153
## + age80.84                                                                     0.14153
## + age0.4                                                                       0.14154
## - age30.34                                                                     0.14172
## + Pyr.Transportation.and.warehousing.104.                                      0.14154
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14155
## - Emp.Real.estate.and.rental.and.leasing                                       0.14174
## + Pyr.Educational.services                                                     0.14155
## + Pyr.Professional..scientific..and.technical.services                         0.14155
## + age25.29                                                                     0.14155
## + age5.9                                                                       0.14155
## + h.6person                                                                    0.14155
## + h.7person.more                                                               0.14155
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14174
## + rWhite                                                                       0.14155
## + rMultiple                                                                    0.14155
## + Pyr.Accommodation.and.food.services                                          0.14156
## + Pyr.Arts..entertainment..and.recreation                                      0.14156
## + age45.49                                                                     0.14156
## + Emp.Retail.trade                                                             0.14156
## + Emp.Arts..entertainment..and.recreation                                      0.14156
## + age90.over                                                                   0.14156
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14179
## - Pyr.Finance.and.insurance                                                    0.14180
## - age65.69                                                                     0.14185
## - rNativeHawaiian.OtherPacificIslander                                         0.14188
## - h.1person                                                                    0.14193
## - Emp.Wholesale.trade                                                          0.14197
## - age15.19                                                                     0.14201
## - Emp.Transportation.and.warehousing.104.                                      0.14201
## - Pyr.Wholesale.trade                                                          0.14205
## - rOther                                                                       0.14206
## - Pyr.Other.services..except.public.administration.                            0.14208
## - Emp.Manufacturing                                                            0.14212
## - total.population                                                             0.14212
## - rBlack.AfricanAmerican                                                       0.14214
## - Emp.Finance.and.insurance                                                    0.14216
## - h.2person                                                                    0.14220
## - age20.24                                                                     0.14233
## - family.households                                                            0.14236
## - Pyr.Retail.trade                                                             0.14241
## - Emp.Other.services..except.public.administration.                            0.14254
## - male                                                                         0.14263
## - age70.74                                                                     0.14269
## - age50.54                                                                     0.14269
## - age10.14                                                                     0.14279
## - rAmericanIndian.AlaskaNative                                                 0.14292
## - age85.89                                                                     0.14307
## - rAsian                                                                       0.14332
## - age55.59                                                                     0.14337
##                                                                                   AIC
## - Emp.Health.care.and.social.assistance                                        -30274
## - Pyr.Utilities                                                                -30274
## - Emp.Utilities                                                                -30273
## - Pyr.Manufacturing                                                            -30273
## - total.households                                                             -30273
## - age60.64                                                                     -30273
## - Emp.Accommodation.and.food.services                                          -30273
## - age40.44                                                                     -30273
## <none>                                                                         -30273
## - h.5person                                                                    -30273
## - age35.39                                                                     -30272
## - h.3person                                                                    -30272
## - Pyr.Information                                                              -30272
## - h.4person                                                                    -30272
## - age75.79                                                                     -30272
## + Emp.Information                                                              -30272
## - Pyr.Health.care.and.social.assistance                                        -30272
## + Emp.Educational.services                                                     -30272
## + Emp.Professional..scientific..and.technical.services                         -30272
## + age80.84                                                                     -30271
## + age0.4                                                                       -30271
## - age30.34                                                                     -30271
## + Pyr.Transportation.and.warehousing.104.                                      -30271
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30271
## - Emp.Real.estate.and.rental.and.leasing                                       -30271
## + Pyr.Educational.services                                                     -30271
## + Pyr.Professional..scientific..and.technical.services                         -30271
## + age25.29                                                                     -30271
## + age5.9                                                                       -30271
## + h.6person                                                                    -30271
## + h.7person.more                                                               -30271
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30271
## + rWhite                                                                       -30271
## + rMultiple                                                                    -30271
## + Pyr.Accommodation.and.food.services                                          -30271
## + Pyr.Arts..entertainment..and.recreation                                      -30271
## + age45.49                                                                     -30271
## + Emp.Retail.trade                                                             -30271
## + Emp.Arts..entertainment..and.recreation                                      -30271
## + age90.over                                                                   -30271
## - Pyr.Real.estate.and.rental.and.leasing                                       -30270
## - Pyr.Finance.and.insurance                                                    -30270
## - age65.69                                                                     -30269
## - rNativeHawaiian.OtherPacificIslander                                         -30268
## - h.1person                                                                    -30267
## - Emp.Wholesale.trade                                                          -30266
## - age15.19                                                                     -30265
## - Emp.Transportation.and.warehousing.104.                                      -30265
## - Pyr.Wholesale.trade                                                          -30264
## - rOther                                                                       -30264
## - Pyr.Other.services..except.public.administration.                            -30264
## - Emp.Manufacturing                                                            -30263
## - total.population                                                             -30263
## - rBlack.AfricanAmerican                                                       -30263
## - Emp.Finance.and.insurance                                                    -30262
## - h.2person                                                                    -30261
## - age20.24                                                                     -30258
## - family.households                                                            -30258
## - Pyr.Retail.trade                                                             -30257
## - Emp.Other.services..except.public.administration.                            -30254
## - male                                                                         -30252
## - age70.74                                                                     -30251
## - age50.54                                                                     -30251
## - age10.14                                                                     -30249
## - rAmericanIndian.AlaskaNative                                                 -30246
## - age85.89                                                                     -30243
## - rAsian                                                                       -30237
## - age55.59                                                                     -30236
## 
## Step:  AIC=-30274.15
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age30.34 + age35.39 + age40.44 + age50.54 + age55.59 + 
##     age60.64 + age65.69 + age70.74 + age75.79 + age85.89 + rBlack.AfricanAmerican + 
##     rAmericanIndian.AlaskaNative + rAsian + rNativeHawaiian.OtherPacificIslander + 
##     rOther + total.households + family.households + h.1person + 
##     h.2person + h.3person + h.4person + h.5person + Pyr.Finance.and.insurance + 
##     Pyr.Health.care.and.social.assistance + Pyr.Information + 
##     Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Real.estate.and.rental.and.leasing + Pyr.Retail.trade + 
##     Pyr.Utilities + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Finance.and.insurance + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Real.estate.and.rental.and.leasing + Emp.Transportation.and.warehousing.104. + 
##     Emp.Utilities + Emp.Wholesale.trade
## 
##                                                                                Df
## - Pyr.Utilities                                                                 1
## - Emp.Utilities                                                                 1
## - total.households                                                              1
## - Pyr.Manufacturing                                                             1
## - age60.64                                                                      1
## - Emp.Accommodation.and.food.services                                           1
## - age40.44                                                                      1
## <none>                                                                           
## - h.5person                                                                     1
## - age35.39                                                                      1
## - h.3person                                                                     1
## - Pyr.Information                                                               1
## - h.4person                                                                     1
## - age75.79                                                                      1
## + Emp.Information                                                               1
## + Emp.Health.care.and.social.assistance                                         1
## + Emp.Professional..scientific..and.technical.services                          1
## + age80.84                                                                      1
## - age30.34                                                                      1
## + Emp.Educational.services                                                      1
## + age0.4                                                                        1
## + Pyr.Transportation.and.warehousing.104.                                       1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## + age25.29                                                                      1
## + Pyr.Educational.services                                                      1
## + Pyr.Professional..scientific..and.technical.services                          1
## + age5.9                                                                        1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + Pyr.Accommodation.and.food.services                                           1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + age90.over                                                                    1
## + age45.49                                                                      1
## + Emp.Arts..entertainment..and.recreation                                       1
## + Emp.Retail.trade                                                              1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - age65.69                                                                      1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - h.1person                                                                     1
## - Pyr.Finance.and.insurance                                                     1
## - Pyr.Health.care.and.social.assistance                                         1
## - Emp.Wholesale.trade                                                           1
## - age15.19                                                                      1
## - Emp.Transportation.and.warehousing.104.                                       1
## - Pyr.Wholesale.trade                                                           1
## - rOther                                                                        1
## - Pyr.Other.services..except.public.administration.                             1
## - total.population                                                              1
## - Emp.Manufacturing                                                             1
## - rBlack.AfricanAmerican                                                        1
## - h.2person                                                                     1
## - Emp.Finance.and.insurance                                                     1
## - age20.24                                                                      1
## - family.households                                                             1
## - Pyr.Retail.trade                                                              1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
## - age70.74                                                                      1
## - age50.54                                                                      1
## - age10.14                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - age85.89                                                                      1
## - rAsian                                                                        1
## - age55.59                                                                      1
##                                                                                 Sum of Sq
## - Pyr.Utilities                                                                0.00005124
## - Emp.Utilities                                                                0.00006610
## - total.households                                                             0.00007604
## - Pyr.Manufacturing                                                            0.00007654
## - age60.64                                                                     0.00008077
## - Emp.Accommodation.and.food.services                                          0.00008321
## - age40.44                                                                     0.00008863
## <none>                                                                                   
## - h.5person                                                                    0.00010845
## - age35.39                                                                     0.00011667
## - h.3person                                                                    0.00012566
## - Pyr.Information                                                              0.00013469
## - h.4person                                                                    0.00013902
## - age75.79                                                                     0.00014754
## + Emp.Information                                                              0.00003418
## + Emp.Health.care.and.social.assistance                                        0.00003411
## + Emp.Professional..scientific..and.technical.services                         0.00002385
## + age80.84                                                                     0.00002160
## - age30.34                                                                     0.00016504
## + Emp.Educational.services                                                     0.00002047
## + age0.4                                                                       0.00002025
## + Pyr.Transportation.and.warehousing.104.                                      0.00001732
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00001451
## + age25.29                                                                     0.00000398
## + Pyr.Educational.services                                                     0.00000309
## + Pyr.Professional..scientific..and.technical.services                         0.00000270
## + age5.9                                                                       0.00000186
## + rWhite                                                                       0.00000139
## + rMultiple                                                                    0.00000139
## + Pyr.Accommodation.and.food.services                                          0.00000137
## + h.6person                                                                    0.00000107
## + h.7person.more                                                               0.00000107
## + Pyr.Arts..entertainment..and.recreation                                      0.00000081
## + age90.over                                                                   0.00000024
## + age45.49                                                                     0.00000016
## + Emp.Arts..entertainment..and.recreation                                      0.00000016
## + Emp.Retail.trade                                                             0.00000000
## - Emp.Real.estate.and.rental.and.leasing                                       0.00018906
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00019905
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00023584
## - age65.69                                                                     0.00029097
## - rNativeHawaiian.OtherPacificIslander                                         0.00031196
## - h.1person                                                                    0.00037257
## - Pyr.Finance.and.insurance                                                    0.00037655
## - Pyr.Health.care.and.social.assistance                                        0.00038021
## - Emp.Wholesale.trade                                                          0.00041145
## - age15.19                                                                     0.00044569
## - Emp.Transportation.and.warehousing.104.                                      0.00046352
## - Pyr.Wholesale.trade                                                          0.00048566
## - rOther                                                                       0.00049527
## - Pyr.Other.services..except.public.administration.                            0.00051425
## - total.population                                                             0.00055748
## - Emp.Manufacturing                                                            0.00056231
## - rBlack.AfricanAmerican                                                       0.00058774
## - h.2person                                                                    0.00064259
## - Emp.Finance.and.insurance                                                    0.00076500
## - age20.24                                                                     0.00076635
## - family.households                                                            0.00080050
## - Pyr.Retail.trade                                                             0.00088109
## - Emp.Other.services..except.public.administration.                            0.00096336
## - male                                                                         0.00108366
## - age70.74                                                                     0.00113415
## - age50.54                                                                     0.00114049
## - age10.14                                                                     0.00121644
## - rAmericanIndian.AlaskaNative                                                 0.00135729
## - age85.89                                                                     0.00151893
## - rAsian                                                                       0.00173736
## - age55.59                                                                     0.00179801
##                                                                                    RSS
## - Pyr.Utilities                                                                0.14164
## - Emp.Utilities                                                                0.14166
## - total.households                                                             0.14167
## - Pyr.Manufacturing                                                            0.14167
## - age60.64                                                                     0.14167
## - Emp.Accommodation.and.food.services                                          0.14167
## - age40.44                                                                     0.14168
## <none>                                                                         0.14159
## - h.5person                                                                    0.14170
## - age35.39                                                                     0.14171
## - h.3person                                                                    0.14172
## - Pyr.Information                                                              0.14173
## - h.4person                                                                    0.14173
## - age75.79                                                                     0.14174
## + Emp.Information                                                              0.14156
## + Emp.Health.care.and.social.assistance                                        0.14156
## + Emp.Professional..scientific..and.technical.services                         0.14157
## + age80.84                                                                     0.14157
## - age30.34                                                                     0.14176
## + Emp.Educational.services                                                     0.14157
## + age0.4                                                                       0.14157
## + Pyr.Transportation.and.warehousing.104.                                      0.14157
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14158
## + age25.29                                                                     0.14159
## + Pyr.Educational.services                                                     0.14159
## + Pyr.Professional..scientific..and.technical.services                         0.14159
## + age5.9                                                                       0.14159
## + rWhite                                                                       0.14159
## + rMultiple                                                                    0.14159
## + Pyr.Accommodation.and.food.services                                          0.14159
## + h.6person                                                                    0.14159
## + h.7person.more                                                               0.14159
## + Pyr.Arts..entertainment..and.recreation                                      0.14159
## + age90.over                                                                   0.14159
## + age45.49                                                                     0.14159
## + Emp.Arts..entertainment..and.recreation                                      0.14159
## + Emp.Retail.trade                                                             0.14159
## - Emp.Real.estate.and.rental.and.leasing                                       0.14178
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14179
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14183
## - age65.69                                                                     0.14188
## - rNativeHawaiian.OtherPacificIslander                                         0.14190
## - h.1person                                                                    0.14196
## - Pyr.Finance.and.insurance                                                    0.14197
## - Pyr.Health.care.and.social.assistance                                        0.14197
## - Emp.Wholesale.trade                                                          0.14200
## - age15.19                                                                     0.14204
## - Emp.Transportation.and.warehousing.104.                                      0.14205
## - Pyr.Wholesale.trade                                                          0.14208
## - rOther                                                                       0.14209
## - Pyr.Other.services..except.public.administration.                            0.14211
## - total.population                                                             0.14215
## - Emp.Manufacturing                                                            0.14215
## - rBlack.AfricanAmerican                                                       0.14218
## - h.2person                                                                    0.14223
## - Emp.Finance.and.insurance                                                    0.14236
## - age20.24                                                                     0.14236
## - family.households                                                            0.14239
## - Pyr.Retail.trade                                                             0.14247
## - Emp.Other.services..except.public.administration.                            0.14255
## - male                                                                         0.14267
## - age70.74                                                                     0.14272
## - age50.54                                                                     0.14273
## - age10.14                                                                     0.14281
## - rAmericanIndian.AlaskaNative                                                 0.14295
## - age85.89                                                                     0.14311
## - rAsian                                                                       0.14333
## - age55.59                                                                     0.14339
##                                                                                   AIC
## - Pyr.Utilities                                                                -30275
## - Emp.Utilities                                                                -30275
## - total.households                                                             -30275
## - Pyr.Manufacturing                                                            -30275
## - age60.64                                                                     -30274
## - Emp.Accommodation.and.food.services                                          -30274
## - age40.44                                                                     -30274
## <none>                                                                         -30274
## - h.5person                                                                    -30274
## - age35.39                                                                     -30274
## - h.3person                                                                    -30273
## - Pyr.Information                                                              -30273
## - h.4person                                                                    -30273
## - age75.79                                                                     -30273
## + Emp.Information                                                              -30273
## + Emp.Health.care.and.social.assistance                                        -30273
## + Emp.Professional..scientific..and.technical.services                         -30273
## + age80.84                                                                     -30273
## - age30.34                                                                     -30273
## + Emp.Educational.services                                                     -30273
## + age0.4                                                                       -30273
## + Pyr.Transportation.and.warehousing.104.                                      -30273
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30273
## + age25.29                                                                     -30272
## + Pyr.Educational.services                                                     -30272
## + Pyr.Professional..scientific..and.technical.services                         -30272
## + age5.9                                                                       -30272
## + rWhite                                                                       -30272
## + rMultiple                                                                    -30272
## + Pyr.Accommodation.and.food.services                                          -30272
## + h.6person                                                                    -30272
## + h.7person.more                                                               -30272
## + Pyr.Arts..entertainment..and.recreation                                      -30272
## + age90.over                                                                   -30272
## + age45.49                                                                     -30272
## + Emp.Arts..entertainment..and.recreation                                      -30272
## + Emp.Retail.trade                                                             -30272
## - Emp.Real.estate.and.rental.and.leasing                                       -30272
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30272
## - Pyr.Real.estate.and.rental.and.leasing                                       -30271
## - age65.69                                                                     -30270
## - rNativeHawaiian.OtherPacificIslander                                         -30269
## - h.1person                                                                    -30268
## - Pyr.Finance.and.insurance                                                    -30268
## - Pyr.Health.care.and.social.assistance                                        -30268
## - Emp.Wholesale.trade                                                          -30267
## - age15.19                                                                     -30267
## - Emp.Transportation.and.warehousing.104.                                      -30266
## - Pyr.Wholesale.trade                                                          -30266
## - rOther                                                                       -30266
## - Pyr.Other.services..except.public.administration.                            -30265
## - total.population                                                             -30264
## - Emp.Manufacturing                                                            -30264
## - rBlack.AfricanAmerican                                                       -30264
## - h.2person                                                                    -30262
## - Emp.Finance.and.insurance                                                    -30260
## - age20.24                                                                     -30260
## - family.households                                                            -30259
## - Pyr.Retail.trade                                                             -30257
## - Emp.Other.services..except.public.administration.                            -30256
## - male                                                                         -30253
## - age70.74                                                                     -30252
## - age50.54                                                                     -30252
## - age10.14                                                                     -30250
## - rAmericanIndian.AlaskaNative                                                 -30247
## - age85.89                                                                     -30244
## - rAsian                                                                       -30239
## - age55.59                                                                     -30238
## 
## Step:  AIC=-30275.05
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age30.34 + age35.39 + age40.44 + age50.54 + age55.59 + 
##     age60.64 + age65.69 + age70.74 + age75.79 + age85.89 + rBlack.AfricanAmerican + 
##     rAmericanIndian.AlaskaNative + rAsian + rNativeHawaiian.OtherPacificIslander + 
##     rOther + total.households + family.households + h.1person + 
##     h.2person + h.3person + h.4person + h.5person + Pyr.Finance.and.insurance + 
##     Pyr.Health.care.and.social.assistance + Pyr.Information + 
##     Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Real.estate.and.rental.and.leasing + Pyr.Retail.trade + 
##     Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Finance.and.insurance + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Real.estate.and.rental.and.leasing + Emp.Transportation.and.warehousing.104. + 
##     Emp.Utilities + Emp.Wholesale.trade
## 
##                                                                                Df
## - Emp.Utilities                                                                 1
## - Pyr.Manufacturing                                                             1
## - age60.64                                                                      1
## - total.households                                                              1
## - Emp.Accommodation.and.food.services                                           1
## - age40.44                                                                      1
## <none>                                                                           
## - h.5person                                                                     1
## - age35.39                                                                      1
## - h.3person                                                                     1
## + Pyr.Utilities                                                                 1
## - h.4person                                                                     1
## - Pyr.Information                                                               1
## - age75.79                                                                      1
## + Emp.Information                                                               1
## + Emp.Health.care.and.social.assistance                                         1
## + Emp.Professional..scientific..and.technical.services                          1
## + age0.4                                                                        1
## + age80.84                                                                      1
## + Emp.Educational.services                                                      1
## + Pyr.Transportation.and.warehousing.104.                                       1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## - age30.34                                                                      1
## + age25.29                                                                      1
## + Pyr.Educational.services                                                      1
## + Pyr.Professional..scientific..and.technical.services                          1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + age5.9                                                                        1
## + Pyr.Accommodation.and.food.services                                           1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## + age90.over                                                                    1
## + age45.49                                                                      1
## + Emp.Retail.trade                                                              1
## + Emp.Arts..entertainment..and.recreation                                       1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - age65.69                                                                      1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - Pyr.Finance.and.insurance                                                     1
## - Pyr.Health.care.and.social.assistance                                         1
## - h.1person                                                                     1
## - Emp.Wholesale.trade                                                           1
## - age15.19                                                                      1
## - Emp.Transportation.and.warehousing.104.                                       1
## - rOther                                                                        1
## - Pyr.Wholesale.trade                                                           1
## - Pyr.Other.services..except.public.administration.                             1
## - Emp.Manufacturing                                                             1
## - total.population                                                              1
## - rBlack.AfricanAmerican                                                        1
## - h.2person                                                                     1
## - Emp.Finance.and.insurance                                                     1
## - age20.24                                                                      1
## - family.households                                                             1
## - Pyr.Retail.trade                                                              1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
## - age70.74                                                                      1
## - age50.54                                                                      1
## - age10.14                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - age85.89                                                                      1
## - rAsian                                                                        1
## - age55.59                                                                      1
##                                                                                 Sum of Sq
## - Emp.Utilities                                                                0.00002418
## - Pyr.Manufacturing                                                            0.00007973
## - age60.64                                                                     0.00008152
## - total.households                                                             0.00008283
## - Emp.Accommodation.and.food.services                                          0.00008448
## - age40.44                                                                     0.00008621
## <none>                                                                                   
## - h.5person                                                                    0.00010191
## - age35.39                                                                     0.00011854
## - h.3person                                                                    0.00013124
## + Pyr.Utilities                                                                0.00005124
## - h.4person                                                                    0.00013605
## - Pyr.Information                                                              0.00014353
## - age75.79                                                                     0.00015093
## + Emp.Information                                                              0.00003178
## + Emp.Health.care.and.social.assistance                                        0.00002962
## + Emp.Professional..scientific..and.technical.services                         0.00002336
## + age0.4                                                                       0.00002148
## + age80.84                                                                     0.00002116
## + Emp.Educational.services                                                     0.00002076
## + Pyr.Transportation.and.warehousing.104.                                      0.00001908
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00001380
## - age30.34                                                                     0.00017313
## + age25.29                                                                     0.00000403
## + Pyr.Educational.services                                                     0.00000291
## + Pyr.Professional..scientific..and.technical.services                         0.00000266
## + rWhite                                                                       0.00000196
## + rMultiple                                                                    0.00000196
## + age5.9                                                                       0.00000177
## + Pyr.Accommodation.and.food.services                                          0.00000166
## + Pyr.Arts..entertainment..and.recreation                                      0.00000098
## + h.6person                                                                    0.00000097
## + h.7person.more                                                               0.00000097
## + age90.over                                                                   0.00000028
## + age45.49                                                                     0.00000027
## + Emp.Retail.trade                                                             0.00000014
## + Emp.Arts..entertainment..and.recreation                                      0.00000011
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00018815
## - Emp.Real.estate.and.rental.and.leasing                                       0.00019805
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00024430
## - age65.69                                                                     0.00028989
## - rNativeHawaiian.OtherPacificIslander                                         0.00031187
## - Pyr.Finance.and.insurance                                                    0.00035987
## - Pyr.Health.care.and.social.assistance                                        0.00038169
## - h.1person                                                                    0.00038849
## - Emp.Wholesale.trade                                                          0.00042816
## - age15.19                                                                     0.00044618
## - Emp.Transportation.and.warehousing.104.                                      0.00046379
## - rOther                                                                       0.00049886
## - Pyr.Wholesale.trade                                                          0.00050361
## - Pyr.Other.services..except.public.administration.                            0.00050401
## - Emp.Manufacturing                                                            0.00057619
## - total.population                                                             0.00058103
## - rBlack.AfricanAmerican                                                       0.00060069
## - h.2person                                                                    0.00062768
## - Emp.Finance.and.insurance                                                    0.00075084
## - age20.24                                                                     0.00076834
## - family.households                                                            0.00081521
## - Pyr.Retail.trade                                                             0.00086553
## - Emp.Other.services..except.public.administration.                            0.00094399
## - male                                                                         0.00108514
## - age70.74                                                                     0.00113341
## - age50.54                                                                     0.00114666
## - age10.14                                                                     0.00121763
## - rAmericanIndian.AlaskaNative                                                 0.00133141
## - age85.89                                                                     0.00150198
## - rAsian                                                                       0.00173026
## - age55.59                                                                     0.00178667
##                                                                                    RSS
## - Emp.Utilities                                                                0.14167
## - Pyr.Manufacturing                                                            0.14172
## - age60.64                                                                     0.14172
## - total.households                                                             0.14172
## - Emp.Accommodation.and.food.services                                          0.14173
## - age40.44                                                                     0.14173
## <none>                                                                         0.14164
## - h.5person                                                                    0.14174
## - age35.39                                                                     0.14176
## - h.3person                                                                    0.14177
## + Pyr.Utilities                                                                0.14159
## - h.4person                                                                    0.14178
## - Pyr.Information                                                              0.14179
## - age75.79                                                                     0.14179
## + Emp.Information                                                              0.14161
## + Emp.Health.care.and.social.assistance                                        0.14161
## + Emp.Professional..scientific..and.technical.services                         0.14162
## + age0.4                                                                       0.14162
## + age80.84                                                                     0.14162
## + Emp.Educational.services                                                     0.14162
## + Pyr.Transportation.and.warehousing.104.                                      0.14162
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14163
## - age30.34                                                                     0.14182
## + age25.29                                                                     0.14164
## + Pyr.Educational.services                                                     0.14164
## + Pyr.Professional..scientific..and.technical.services                         0.14164
## + rWhite                                                                       0.14164
## + rMultiple                                                                    0.14164
## + age5.9                                                                       0.14164
## + Pyr.Accommodation.and.food.services                                          0.14164
## + Pyr.Arts..entertainment..and.recreation                                      0.14164
## + h.6person                                                                    0.14164
## + h.7person.more                                                               0.14164
## + age90.over                                                                   0.14164
## + age45.49                                                                     0.14164
## + Emp.Retail.trade                                                             0.14164
## + Emp.Arts..entertainment..and.recreation                                      0.14164
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14183
## - Emp.Real.estate.and.rental.and.leasing                                       0.14184
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14189
## - age65.69                                                                     0.14193
## - rNativeHawaiian.OtherPacificIslander                                         0.14195
## - Pyr.Finance.and.insurance                                                    0.14200
## - Pyr.Health.care.and.social.assistance                                        0.14202
## - h.1person                                                                    0.14203
## - Emp.Wholesale.trade                                                          0.14207
## - age15.19                                                                     0.14209
## - Emp.Transportation.and.warehousing.104.                                      0.14211
## - rOther                                                                       0.14214
## - Pyr.Wholesale.trade                                                          0.14215
## - Pyr.Other.services..except.public.administration.                            0.14215
## - Emp.Manufacturing                                                            0.14222
## - total.population                                                             0.14222
## - rBlack.AfricanAmerican                                                       0.14224
## - h.2person                                                                    0.14227
## - Emp.Finance.and.insurance                                                    0.14239
## - age20.24                                                                     0.14241
## - family.households                                                            0.14246
## - Pyr.Retail.trade                                                             0.14251
## - Emp.Other.services..except.public.administration.                            0.14259
## - male                                                                         0.14273
## - age70.74                                                                     0.14278
## - age50.54                                                                     0.14279
## - age10.14                                                                     0.14286
## - rAmericanIndian.AlaskaNative                                                 0.14297
## - age85.89                                                                     0.14314
## - rAsian                                                                       0.14337
## - age55.59                                                                     0.14343
##                                                                                   AIC
## - Emp.Utilities                                                                -30277
## - Pyr.Manufacturing                                                            -30275
## - age60.64                                                                     -30275
## - total.households                                                             -30275
## - Emp.Accommodation.and.food.services                                          -30275
## - age40.44                                                                     -30275
## <none>                                                                         -30275
## - h.5person                                                                    -30275
## - age35.39                                                                     -30275
## - h.3person                                                                    -30274
## + Pyr.Utilities                                                                -30274
## - h.4person                                                                    -30274
## - Pyr.Information                                                              -30274
## - age75.79                                                                     -30274
## + Emp.Information                                                              -30274
## + Emp.Health.care.and.social.assistance                                        -30274
## + Emp.Professional..scientific..and.technical.services                         -30274
## + age0.4                                                                       -30274
## + age80.84                                                                     -30274
## + Emp.Educational.services                                                     -30274
## + Pyr.Transportation.and.warehousing.104.                                      -30274
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30273
## - age30.34                                                                     -30273
## + age25.29                                                                     -30273
## + Pyr.Educational.services                                                     -30273
## + Pyr.Professional..scientific..and.technical.services                         -30273
## + rWhite                                                                       -30273
## + rMultiple                                                                    -30273
## + age5.9                                                                       -30273
## + Pyr.Accommodation.and.food.services                                          -30273
## + Pyr.Arts..entertainment..and.recreation                                      -30273
## + h.6person                                                                    -30273
## + h.7person.more                                                               -30273
## + age90.over                                                                   -30273
## + age45.49                                                                     -30273
## + Emp.Retail.trade                                                             -30273
## + Emp.Arts..entertainment..and.recreation                                      -30273
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30273
## - Emp.Real.estate.and.rental.and.leasing                                       -30273
## - Pyr.Real.estate.and.rental.and.leasing                                       -30272
## - age65.69                                                                     -30271
## - rNativeHawaiian.OtherPacificIslander                                         -30270
## - Pyr.Finance.and.insurance                                                    -30269
## - Pyr.Health.care.and.social.assistance                                        -30269
## - h.1person                                                                    -30269
## - Emp.Wholesale.trade                                                          -30268
## - age15.19                                                                     -30268
## - Emp.Transportation.and.warehousing.104.                                      -30267
## - rOther                                                                       -30266
## - Pyr.Wholesale.trade                                                          -30266
## - Pyr.Other.services..except.public.administration.                            -30266
## - Emp.Manufacturing                                                            -30265
## - total.population                                                             -30265
## - rBlack.AfricanAmerican                                                       -30264
## - h.2person                                                                    -30264
## - Emp.Finance.and.insurance                                                    -30261
## - age20.24                                                                     -30261
## - family.households                                                            -30260
## - Pyr.Retail.trade                                                             -30259
## - Emp.Other.services..except.public.administration.                            -30257
## - male                                                                         -30254
## - age70.74                                                                     -30253
## - age50.54                                                                     -30253
## - age10.14                                                                     -30251
## - rAmericanIndian.AlaskaNative                                                 -30249
## - age85.89                                                                     -30245
## - rAsian                                                                       -30240
## - age55.59                                                                     -30239
## 
## Step:  AIC=-30276.53
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age30.34 + age35.39 + age40.44 + age50.54 + age55.59 + 
##     age60.64 + age65.69 + age70.74 + age75.79 + age85.89 + rBlack.AfricanAmerican + 
##     rAmericanIndian.AlaskaNative + rAsian + rNativeHawaiian.OtherPacificIslander + 
##     rOther + total.households + family.households + h.1person + 
##     h.2person + h.3person + h.4person + h.5person + Pyr.Finance.and.insurance + 
##     Pyr.Health.care.and.social.assistance + Pyr.Information + 
##     Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Real.estate.and.rental.and.leasing + Pyr.Retail.trade + 
##     Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Finance.and.insurance + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Real.estate.and.rental.and.leasing + Emp.Transportation.and.warehousing.104. + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - age60.64                                                                      1
## - Pyr.Manufacturing                                                             1
## - Emp.Accommodation.and.food.services                                           1
## - age40.44                                                                      1
## - total.households                                                              1
## <none>                                                                           
## - h.5person                                                                     1
## - age35.39                                                                      1
## - h.4person                                                                     1
## - h.3person                                                                     1
## - Pyr.Information                                                               1
## + Emp.Information                                                               1
## - age75.79                                                                      1
## + Emp.Health.care.and.social.assistance                                         1
## + Emp.Professional..scientific..and.technical.services                          1
## + Emp.Utilities                                                                 1
## + age0.4                                                                        1
## + Emp.Educational.services                                                      1
## + age80.84                                                                      1
## + Pyr.Transportation.and.warehousing.104.                                       1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## - age30.34                                                                      1
## + Pyr.Utilities                                                                 1
## + age25.29                                                                      1
## + Pyr.Educational.services                                                      1
## + Pyr.Professional..scientific..and.technical.services                          1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + age5.9                                                                        1
## + Pyr.Accommodation.and.food.services                                           1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + Emp.Retail.trade                                                              1
## + age45.49                                                                      1
## + age90.over                                                                    1
## + Emp.Arts..entertainment..and.recreation                                       1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - age65.69                                                                      1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - Pyr.Finance.and.insurance                                                     1
## - Pyr.Health.care.and.social.assistance                                         1
## - h.1person                                                                     1
## - Emp.Wholesale.trade                                                           1
## - age15.19                                                                      1
## - Emp.Transportation.and.warehousing.104.                                       1
## - rOther                                                                        1
## - Pyr.Wholesale.trade                                                           1
## - Pyr.Other.services..except.public.administration.                             1
## - total.population                                                              1
## - Emp.Manufacturing                                                             1
## - rBlack.AfricanAmerican                                                        1
## - h.2person                                                                     1
## - Emp.Finance.and.insurance                                                     1
## - age20.24                                                                      1
## - family.households                                                             1
## - Pyr.Retail.trade                                                              1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
## - age70.74                                                                      1
## - age50.54                                                                      1
## - age10.14                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - age85.89                                                                      1
## - rAsian                                                                        1
## - age55.59                                                                      1
##                                                                                 Sum of Sq
## - age60.64                                                                     0.00008095
## - Pyr.Manufacturing                                                            0.00008164
## - Emp.Accommodation.and.food.services                                          0.00008330
## - age40.44                                                                     0.00008537
## - total.households                                                             0.00008947
## <none>                                                                                   
## - h.5person                                                                    0.00009725
## - age35.39                                                                     0.00011857
## - h.4person                                                                    0.00013271
## - h.3person                                                                    0.00013843
## - Pyr.Information                                                              0.00014194
## + Emp.Information                                                              0.00003264
## - age75.79                                                                     0.00015428
## + Emp.Health.care.and.social.assistance                                        0.00002617
## + Emp.Professional..scientific..and.technical.services                         0.00002438
## + Emp.Utilities                                                                0.00002418
## + age0.4                                                                       0.00002169
## + Emp.Educational.services                                                     0.00002155
## + age80.84                                                                     0.00001981
## + Pyr.Transportation.and.warehousing.104.                                      0.00001961
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00001225
## - age30.34                                                                     0.00017408
## + Pyr.Utilities                                                                0.00000932
## + age25.29                                                                     0.00000408
## + Pyr.Educational.services                                                     0.00000330
## + Pyr.Professional..scientific..and.technical.services                         0.00000289
## + rWhite                                                                       0.00000228
## + rMultiple                                                                    0.00000228
## + age5.9                                                                       0.00000157
## + Pyr.Accommodation.and.food.services                                          0.00000104
## + h.6person                                                                    0.00000090
## + h.7person.more                                                               0.00000090
## + Pyr.Arts..entertainment..and.recreation                                      0.00000078
## + Emp.Retail.trade                                                             0.00000053
## + age45.49                                                                     0.00000031
## + age90.over                                                                   0.00000028
## + Emp.Arts..entertainment..and.recreation                                      0.00000011
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00018814
## - Emp.Real.estate.and.rental.and.leasing                                       0.00019839
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00024337
## - age65.69                                                                     0.00028632
## - rNativeHawaiian.OtherPacificIslander                                         0.00031401
## - Pyr.Finance.and.insurance                                                    0.00035771
## - Pyr.Health.care.and.social.assistance                                        0.00038423
## - h.1person                                                                    0.00040407
## - Emp.Wholesale.trade                                                          0.00043075
## - age15.19                                                                     0.00044442
## - Emp.Transportation.and.warehousing.104.                                      0.00045654
## - rOther                                                                       0.00049226
## - Pyr.Wholesale.trade                                                          0.00050685
## - Pyr.Other.services..except.public.administration.                            0.00053066
## - total.population                                                             0.00057152
## - Emp.Manufacturing                                                            0.00058110
## - rBlack.AfricanAmerican                                                       0.00060587
## - h.2person                                                                    0.00061532
## - Emp.Finance.and.insurance                                                    0.00074715
## - age20.24                                                                     0.00077165
## - family.households                                                            0.00082371
## - Pyr.Retail.trade                                                             0.00084797
## - Emp.Other.services..except.public.administration.                            0.00099617
## - male                                                                         0.00108114
## - age70.74                                                                     0.00113434
## - age50.54                                                                     0.00115833
## - age10.14                                                                     0.00122578
## - rAmericanIndian.AlaskaNative                                                 0.00132020
## - age85.89                                                                     0.00149573
## - rAsian                                                                       0.00173542
## - age55.59                                                                     0.00178056
##                                                                                    RSS
## - age60.64                                                                     0.14175
## - Pyr.Manufacturing                                                            0.14175
## - Emp.Accommodation.and.food.services                                          0.14175
## - age40.44                                                                     0.14175
## - total.households                                                             0.14176
## <none>                                                                         0.14167
## - h.5person                                                                    0.14176
## - age35.39                                                                     0.14178
## - h.4person                                                                    0.14180
## - h.3person                                                                    0.14180
## - Pyr.Information                                                              0.14181
## + Emp.Information                                                              0.14163
## - age75.79                                                                     0.14182
## + Emp.Health.care.and.social.assistance                                        0.14164
## + Emp.Professional..scientific..and.technical.services                         0.14164
## + Emp.Utilities                                                                0.14164
## + age0.4                                                                       0.14164
## + Emp.Educational.services                                                     0.14164
## + age80.84                                                                     0.14165
## + Pyr.Transportation.and.warehousing.104.                                      0.14165
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14165
## - age30.34                                                                     0.14184
## + Pyr.Utilities                                                                0.14166
## + age25.29                                                                     0.14166
## + Pyr.Educational.services                                                     0.14166
## + Pyr.Professional..scientific..and.technical.services                         0.14166
## + rWhite                                                                       0.14166
## + rMultiple                                                                    0.14166
## + age5.9                                                                       0.14167
## + Pyr.Accommodation.and.food.services                                          0.14167
## + h.6person                                                                    0.14167
## + h.7person.more                                                               0.14167
## + Pyr.Arts..entertainment..and.recreation                                      0.14167
## + Emp.Retail.trade                                                             0.14167
## + age45.49                                                                     0.14167
## + age90.over                                                                   0.14167
## + Emp.Arts..entertainment..and.recreation                                      0.14167
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14186
## - Emp.Real.estate.and.rental.and.leasing                                       0.14186
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14191
## - age65.69                                                                     0.14195
## - rNativeHawaiian.OtherPacificIslander                                         0.14198
## - Pyr.Finance.and.insurance                                                    0.14202
## - Pyr.Health.care.and.social.assistance                                        0.14205
## - h.1person                                                                    0.14207
## - Emp.Wholesale.trade                                                          0.14210
## - age15.19                                                                     0.14211
## - Emp.Transportation.and.warehousing.104.                                      0.14212
## - rOther                                                                       0.14216
## - Pyr.Wholesale.trade                                                          0.14217
## - Pyr.Other.services..except.public.administration.                            0.14220
## - total.population                                                             0.14224
## - Emp.Manufacturing                                                            0.14225
## - rBlack.AfricanAmerican                                                       0.14227
## - h.2person                                                                    0.14228
## - Emp.Finance.and.insurance                                                    0.14241
## - age20.24                                                                     0.14244
## - family.households                                                            0.14249
## - Pyr.Retail.trade                                                             0.14252
## - Emp.Other.services..except.public.administration.                            0.14266
## - male                                                                         0.14275
## - age70.74                                                                     0.14280
## - age50.54                                                                     0.14283
## - age10.14                                                                     0.14289
## - rAmericanIndian.AlaskaNative                                                 0.14299
## - age85.89                                                                     0.14316
## - rAsian                                                                       0.14340
## - age55.59                                                                     0.14345
##                                                                                   AIC
## - age60.64                                                                     -30277
## - Pyr.Manufacturing                                                            -30277
## - Emp.Accommodation.and.food.services                                          -30277
## - age40.44                                                                     -30277
## - total.households                                                             -30277
## <none>                                                                         -30277
## - h.5person                                                                    -30276
## - age35.39                                                                     -30276
## - h.4person                                                                    -30276
## - h.3person                                                                    -30276
## - Pyr.Information                                                              -30276
## + Emp.Information                                                              -30275
## - age75.79                                                                     -30275
## + Emp.Health.care.and.social.assistance                                        -30275
## + Emp.Professional..scientific..and.technical.services                         -30275
## + Emp.Utilities                                                                -30275
## + age0.4                                                                       -30275
## + Emp.Educational.services                                                     -30275
## + age80.84                                                                     -30275
## + Pyr.Transportation.and.warehousing.104.                                      -30275
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30275
## - age30.34                                                                     -30275
## + Pyr.Utilities                                                                -30275
## + age25.29                                                                     -30275
## + Pyr.Educational.services                                                     -30275
## + Pyr.Professional..scientific..and.technical.services                         -30275
## + rWhite                                                                       -30275
## + rMultiple                                                                    -30275
## + age5.9                                                                       -30275
## + Pyr.Accommodation.and.food.services                                          -30275
## + h.6person                                                                    -30275
## + h.7person.more                                                               -30275
## + Pyr.Arts..entertainment..and.recreation                                      -30275
## + Emp.Retail.trade                                                             -30275
## + age45.49                                                                     -30275
## + age90.over                                                                   -30275
## + Emp.Arts..entertainment..and.recreation                                      -30275
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30275
## - Emp.Real.estate.and.rental.and.leasing                                       -30274
## - Pyr.Real.estate.and.rental.and.leasing                                       -30273
## - age65.69                                                                     -30272
## - rNativeHawaiian.OtherPacificIslander                                         -30272
## - Pyr.Finance.and.insurance                                                    -30271
## - Pyr.Health.care.and.social.assistance                                        -30270
## - h.1person                                                                    -30270
## - Emp.Wholesale.trade                                                          -30269
## - age15.19                                                                     -30269
## - Emp.Transportation.and.warehousing.104.                                      -30269
## - rOther                                                                       -30268
## - Pyr.Wholesale.trade                                                          -30268
## - Pyr.Other.services..except.public.administration.                            -30267
## - total.population                                                             -30266
## - Emp.Manufacturing                                                            -30266
## - rBlack.AfricanAmerican                                                       -30266
## - h.2person                                                                    -30265
## - Emp.Finance.and.insurance                                                    -30263
## - age20.24                                                                     -30262
## - family.households                                                            -30261
## - Pyr.Retail.trade                                                             -30260
## - Emp.Other.services..except.public.administration.                            -30257
## - male                                                                         -30255
## - age70.74                                                                     -30254
## - age50.54                                                                     -30254
## - age10.14                                                                     -30252
## - rAmericanIndian.AlaskaNative                                                 -30250
## - age85.89                                                                     -30247
## - rAsian                                                                       -30242
## - age55.59                                                                     -30241
## 
## Step:  AIC=-30276.79
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age30.34 + age35.39 + age40.44 + age50.54 + age55.59 + 
##     age65.69 + age70.74 + age75.79 + age85.89 + rBlack.AfricanAmerican + 
##     rAmericanIndian.AlaskaNative + rAsian + rNativeHawaiian.OtherPacificIslander + 
##     rOther + total.households + family.households + h.1person + 
##     h.2person + h.3person + h.4person + h.5person + Pyr.Finance.and.insurance + 
##     Pyr.Health.care.and.social.assistance + Pyr.Information + 
##     Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Real.estate.and.rental.and.leasing + Pyr.Retail.trade + 
##     Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Finance.and.insurance + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Real.estate.and.rental.and.leasing + Emp.Transportation.and.warehousing.104. + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - age40.44                                                                      1
## - Pyr.Manufacturing                                                             1
## - Emp.Accommodation.and.food.services                                           1
## <none>                                                                           
## - total.households                                                              1
## - h.5person                                                                     1
## + age60.64                                                                      1
## - age35.39                                                                      1
## - age75.79                                                                      1
## - h.4person                                                                     1
## - age30.34                                                                      1
## - Pyr.Information                                                               1
## + Emp.Information                                                               1
## + age80.84                                                                      1
## + Emp.Professional..scientific..and.technical.services                          1
## + Emp.Health.care.and.social.assistance                                         1
## + Emp.Utilities                                                                 1
## + Emp.Educational.services                                                      1
## + Pyr.Transportation.and.warehousing.104.                                       1
## + age25.29                                                                      1
## - h.3person                                                                     1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## + Pyr.Utilities                                                                 1
## + age45.49                                                                      1
## + Pyr.Professional..scientific..and.technical.services                          1
## + Pyr.Educational.services                                                      1
## + age0.4                                                                        1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + age5.9                                                                        1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + Emp.Retail.trade                                                              1
## + Pyr.Accommodation.and.food.services                                           1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## + age90.over                                                                    1
## + Emp.Arts..entertainment..and.recreation                                       1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - Pyr.Finance.and.insurance                                                     1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - Pyr.Health.care.and.social.assistance                                         1
## - age15.19                                                                      1
## - h.1person                                                                     1
## - Emp.Wholesale.trade                                                           1
## - Emp.Transportation.and.warehousing.104.                                       1
## - rOther                                                                        1
## - Pyr.Wholesale.trade                                                           1
## - age65.69                                                                      1
## - Pyr.Other.services..except.public.administration.                             1
## - total.population                                                              1
## - Emp.Manufacturing                                                             1
## - h.2person                                                                     1
## - rBlack.AfricanAmerican                                                        1
## - age20.24                                                                      1
## - Emp.Finance.and.insurance                                                     1
## - family.households                                                             1
## - Pyr.Retail.trade                                                              1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
## - age50.54                                                                      1
## - age10.14                                                                      1
## - age70.74                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - age85.89                                                                      1
## - rAsian                                                                        1
## - age55.59                                                                      1
##                                                                                 Sum of Sq
## - age40.44                                                                     0.00006687
## - Pyr.Manufacturing                                                            0.00008238
## - Emp.Accommodation.and.food.services                                          0.00008393
## <none>                                                                                   
## - total.households                                                             0.00009876
## - h.5person                                                                    0.00009928
## + age60.64                                                                     0.00008095
## - age35.39                                                                     0.00011136
## - age75.79                                                                     0.00011398
## - h.4person                                                                    0.00012793
## - age30.34                                                                     0.00012959
## - Pyr.Information                                                              0.00013813
## + Emp.Information                                                              0.00003353
## + age80.84                                                                     0.00002858
## + Emp.Professional..scientific..and.technical.services                         0.00002693
## + Emp.Health.care.and.social.assistance                                        0.00002490
## + Emp.Utilities                                                                0.00002362
## + Emp.Educational.services                                                     0.00002202
## + Pyr.Transportation.and.warehousing.104.                                      0.00002074
## + age25.29                                                                     0.00001887
## - h.3person                                                                    0.00016866
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00001173
## + Pyr.Utilities                                                                0.00000891
## + age45.49                                                                     0.00000416
## + Pyr.Professional..scientific..and.technical.services                         0.00000364
## + Pyr.Educational.services                                                     0.00000335
## + age0.4                                                                       0.00000294
## + rWhite                                                                       0.00000180
## + rMultiple                                                                    0.00000180
## + age5.9                                                                       0.00000112
## + Pyr.Arts..entertainment..and.recreation                                      0.00000060
## + Emp.Retail.trade                                                             0.00000054
## + Pyr.Accommodation.and.food.services                                          0.00000048
## + h.6person                                                                    0.00000041
## + h.7person.more                                                               0.00000041
## + age90.over                                                                   0.00000015
## + Emp.Arts..entertainment..and.recreation                                      0.00000004
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00019296
## - Emp.Real.estate.and.rental.and.leasing                                       0.00020560
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00025387
## - Pyr.Finance.and.insurance                                                    0.00035932
## - rNativeHawaiian.OtherPacificIslander                                         0.00036793
## - Pyr.Health.care.and.social.assistance                                        0.00039066
## - age15.19                                                                     0.00041421
## - h.1person                                                                    0.00041717
## - Emp.Wholesale.trade                                                          0.00042347
## - Emp.Transportation.and.warehousing.104.                                      0.00045507
## - rOther                                                                       0.00048334
## - Pyr.Wholesale.trade                                                          0.00050726
## - age65.69                                                                     0.00051985
## - Pyr.Other.services..except.public.administration.                            0.00053150
## - total.population                                                             0.00056489
## - Emp.Manufacturing                                                            0.00057512
## - h.2person                                                                    0.00058453
## - rBlack.AfricanAmerican                                                       0.00059846
## - age20.24                                                                     0.00070245
## - Emp.Finance.and.insurance                                                    0.00075114
## - family.households                                                            0.00079215
## - Pyr.Retail.trade                                                             0.00082440
## - Emp.Other.services..except.public.administration.                            0.00099945
## - male                                                                         0.00104970
## - age50.54                                                                     0.00109422
## - age10.14                                                                     0.00116045
## - age70.74                                                                     0.00116943
## - rAmericanIndian.AlaskaNative                                                 0.00131321
## - age85.89                                                                     0.00143996
## - rAsian                                                                       0.00168533
## - age55.59                                                                     0.00234207
##                                                                                    RSS
## - age40.44                                                                     0.14181
## - Pyr.Manufacturing                                                            0.14183
## - Emp.Accommodation.and.food.services                                          0.14183
## <none>                                                                         0.14175
## - total.households                                                             0.14185
## - h.5person                                                                    0.14185
## + age60.64                                                                     0.14167
## - age35.39                                                                     0.14186
## - age75.79                                                                     0.14186
## - h.4person                                                                    0.14188
## - age30.34                                                                     0.14188
## - Pyr.Information                                                              0.14189
## + Emp.Information                                                              0.14171
## + age80.84                                                                     0.14172
## + Emp.Professional..scientific..and.technical.services                         0.14172
## + Emp.Health.care.and.social.assistance                                        0.14172
## + Emp.Utilities                                                                0.14172
## + Emp.Educational.services                                                     0.14173
## + Pyr.Transportation.and.warehousing.104.                                      0.14173
## + age25.29                                                                     0.14173
## - h.3person                                                                    0.14192
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14174
## + Pyr.Utilities                                                                0.14174
## + age45.49                                                                     0.14174
## + Pyr.Professional..scientific..and.technical.services                         0.14174
## + Pyr.Educational.services                                                     0.14174
## + age0.4                                                                       0.14175
## + rWhite                                                                       0.14175
## + rMultiple                                                                    0.14175
## + age5.9                                                                       0.14175
## + Pyr.Arts..entertainment..and.recreation                                      0.14175
## + Emp.Retail.trade                                                             0.14175
## + Pyr.Accommodation.and.food.services                                          0.14175
## + h.6person                                                                    0.14175
## + h.7person.more                                                               0.14175
## + age90.over                                                                   0.14175
## + Emp.Arts..entertainment..and.recreation                                      0.14175
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14194
## - Emp.Real.estate.and.rental.and.leasing                                       0.14195
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14200
## - Pyr.Finance.and.insurance                                                    0.14211
## - rNativeHawaiian.OtherPacificIslander                                         0.14212
## - Pyr.Health.care.and.social.assistance                                        0.14214
## - age15.19                                                                     0.14216
## - h.1person                                                                    0.14217
## - Emp.Wholesale.trade                                                          0.14217
## - Emp.Transportation.and.warehousing.104.                                      0.14220
## - rOther                                                                       0.14223
## - Pyr.Wholesale.trade                                                          0.14225
## - age65.69                                                                     0.14227
## - Pyr.Other.services..except.public.administration.                            0.14228
## - total.population                                                             0.14231
## - Emp.Manufacturing                                                            0.14232
## - h.2person                                                                    0.14233
## - rBlack.AfricanAmerican                                                       0.14235
## - age20.24                                                                     0.14245
## - Emp.Finance.and.insurance                                                    0.14250
## - family.households                                                            0.14254
## - Pyr.Retail.trade                                                             0.14257
## - Emp.Other.services..except.public.administration.                            0.14275
## - male                                                                         0.14280
## - age50.54                                                                     0.14284
## - age10.14                                                                     0.14291
## - age70.74                                                                     0.14292
## - rAmericanIndian.AlaskaNative                                                 0.14306
## - age85.89                                                                     0.14319
## - rAsian                                                                       0.14343
## - age55.59                                                                     0.14409
##                                                                                   AIC
## - age40.44                                                                     -30277
## - Pyr.Manufacturing                                                            -30277
## - Emp.Accommodation.and.food.services                                          -30277
## <none>                                                                         -30277
## - total.households                                                             -30277
## - h.5person                                                                    -30277
## + age60.64                                                                     -30277
## - age35.39                                                                     -30276
## - age75.79                                                                     -30276
## - h.4person                                                                    -30276
## - age30.34                                                                     -30276
## - Pyr.Information                                                              -30276
## + Emp.Information                                                              -30276
## + age80.84                                                                     -30275
## + Emp.Professional..scientific..and.technical.services                         -30275
## + Emp.Health.care.and.social.assistance                                        -30275
## + Emp.Utilities                                                                -30275
## + Emp.Educational.services                                                     -30275
## + Pyr.Transportation.and.warehousing.104.                                      -30275
## + age25.29                                                                     -30275
## - h.3person                                                                    -30275
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30275
## + Pyr.Utilities                                                                -30275
## + age45.49                                                                     -30275
## + Pyr.Professional..scientific..and.technical.services                         -30275
## + Pyr.Educational.services                                                     -30275
## + age0.4                                                                       -30275
## + rWhite                                                                       -30275
## + rMultiple                                                                    -30275
## + age5.9                                                                       -30275
## + Pyr.Arts..entertainment..and.recreation                                      -30275
## + Emp.Retail.trade                                                             -30275
## + Pyr.Accommodation.and.food.services                                          -30275
## + h.6person                                                                    -30275
## + h.7person.more                                                               -30275
## + age90.over                                                                   -30275
## + Emp.Arts..entertainment..and.recreation                                      -30275
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30275
## - Emp.Real.estate.and.rental.and.leasing                                       -30274
## - Pyr.Real.estate.and.rental.and.leasing                                       -30273
## - Pyr.Finance.and.insurance                                                    -30271
## - rNativeHawaiian.OtherPacificIslander                                         -30271
## - Pyr.Health.care.and.social.assistance                                        -30270
## - age15.19                                                                     -30270
## - h.1person                                                                    -30270
## - Emp.Wholesale.trade                                                          -30270
## - Emp.Transportation.and.warehousing.104.                                      -30269
## - rOther                                                                       -30268
## - Pyr.Wholesale.trade                                                          -30268
## - age65.69                                                                     -30268
## - Pyr.Other.services..except.public.administration.                            -30267
## - total.population                                                             -30267
## - Emp.Manufacturing                                                            -30267
## - h.2person                                                                    -30266
## - rBlack.AfricanAmerican                                                       -30266
## - age20.24                                                                     -30264
## - Emp.Finance.and.insurance                                                    -30263
## - family.households                                                            -30262
## - Pyr.Retail.trade                                                             -30261
## - Emp.Other.services..except.public.administration.                            -30257
## - male                                                                         -30256
## - age50.54                                                                     -30255
## - age10.14                                                                     -30254
## - age70.74                                                                     -30254
## - rAmericanIndian.AlaskaNative                                                 -30251
## - age85.89                                                                     -30248
## - rAsian                                                                       -30243
## - age55.59                                                                     -30229
## 
## Step:  AIC=-30277.35
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age30.34 + age35.39 + age50.54 + age55.59 + age65.69 + 
##     age70.74 + age75.79 + age85.89 + rBlack.AfricanAmerican + 
##     rAmericanIndian.AlaskaNative + rAsian + rNativeHawaiian.OtherPacificIslander + 
##     rOther + total.households + family.households + h.1person + 
##     h.2person + h.3person + h.4person + h.5person + Pyr.Finance.and.insurance + 
##     Pyr.Health.care.and.social.assistance + Pyr.Information + 
##     Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Real.estate.and.rental.and.leasing + Pyr.Retail.trade + 
##     Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Finance.and.insurance + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Real.estate.and.rental.and.leasing + Emp.Transportation.and.warehousing.104. + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - age35.39                                                                      1
## - h.4person                                                                     1
## - age30.34                                                                      1
## - Pyr.Manufacturing                                                             1
## - h.5person                                                                     1
## - Emp.Accommodation.and.food.services                                           1
## <none>                                                                           
## - age75.79                                                                      1
## + age40.44                                                                      1
## + age60.64                                                                      1
## - Pyr.Information                                                               1
## - total.households                                                              1
## + age25.29                                                                      1
## + Emp.Information                                                               1
## + age80.84                                                                      1
## + Emp.Professional..scientific..and.technical.services                          1
## + Emp.Health.care.and.social.assistance                                         1
## + Pyr.Transportation.and.warehousing.104.                                       1
## + Emp.Utilities                                                                 1
## + Emp.Educational.services                                                      1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## + age5.9                                                                        1
## + Pyr.Utilities                                                                 1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + age0.4                                                                        1
## + Pyr.Professional..scientific..and.technical.services                          1
## + Pyr.Educational.services                                                      1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + age90.over                                                                    1
## + Emp.Retail.trade                                                              1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## + Pyr.Accommodation.and.food.services                                           1
## + age45.49                                                                      1
## + Emp.Arts..entertainment..and.recreation                                       1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - h.3person                                                                     1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - Pyr.Health.care.and.social.assistance                                         1
## - age15.19                                                                      1
## - Pyr.Finance.and.insurance                                                     1
## - Emp.Wholesale.trade                                                           1
## - Emp.Transportation.and.warehousing.104.                                       1
## - h.1person                                                                     1
## - rOther                                                                        1
## - Pyr.Wholesale.trade                                                           1
## - age65.69                                                                      1
## - h.2person                                                                     1
## - total.population                                                              1
## - Pyr.Other.services..except.public.administration.                             1
## - rBlack.AfricanAmerican                                                        1
## - Emp.Manufacturing                                                             1
## - age20.24                                                                      1
## - family.households                                                             1
## - Emp.Finance.and.insurance                                                     1
## - Pyr.Retail.trade                                                              1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
## - age50.54                                                                      1
## - age10.14                                                                      1
## - age70.74                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - age85.89                                                                      1
## - rAsian                                                                        1
## - age55.59                                                                      1
##                                                                                 Sum of Sq
## - age35.39                                                                     0.00007043
## - h.4person                                                                    0.00008169
## - age30.34                                                                     0.00008320
## - Pyr.Manufacturing                                                            0.00008499
## - h.5person                                                                    0.00008695
## - Emp.Accommodation.and.food.services                                          0.00009178
## <none>                                                                                   
## - age75.79                                                                     0.00009603
## + age40.44                                                                     0.00006687
## + age60.64                                                                     0.00006245
## - Pyr.Information                                                              0.00013464
## - total.households                                                             0.00013591
## + age25.29                                                                     0.00004777
## + Emp.Information                                                              0.00003530
## + age80.84                                                                     0.00002948
## + Emp.Professional..scientific..and.technical.services                         0.00002880
## + Emp.Health.care.and.social.assistance                                        0.00002429
## + Pyr.Transportation.and.warehousing.104.                                      0.00002422
## + Emp.Utilities                                                                0.00002294
## + Emp.Educational.services                                                     0.00002057
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00001524
## + age5.9                                                                       0.00001422
## + Pyr.Utilities                                                                0.00000872
## + rWhite                                                                       0.00000724
## + rMultiple                                                                    0.00000724
## + age0.4                                                                       0.00000524
## + Pyr.Professional..scientific..and.technical.services                         0.00000369
## + Pyr.Educational.services                                                     0.00000292
## + Pyr.Arts..entertainment..and.recreation                                      0.00000078
## + age90.over                                                                   0.00000058
## + Emp.Retail.trade                                                             0.00000048
## + h.6person                                                                    0.00000040
## + h.7person.more                                                               0.00000040
## + Pyr.Accommodation.and.food.services                                          0.00000030
## + age45.49                                                                     0.00000024
## + Emp.Arts..entertainment..and.recreation                                      0.00000012
## - Emp.Real.estate.and.rental.and.leasing                                       0.00020193
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00020919
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00025279
## - h.3person                                                                    0.00025938
## - rNativeHawaiian.OtherPacificIslander                                         0.00031829
## - Pyr.Health.care.and.social.assistance                                        0.00038170
## - age15.19                                                                     0.00038710
## - Pyr.Finance.and.insurance                                                    0.00039173
## - Emp.Wholesale.trade                                                          0.00041169
## - Emp.Transportation.and.warehousing.104.                                      0.00043505
## - h.1person                                                                    0.00047616
## - rOther                                                                       0.00049441
## - Pyr.Wholesale.trade                                                          0.00049606
## - age65.69                                                                     0.00049909
## - h.2person                                                                    0.00052509
## - total.population                                                             0.00053011
## - Pyr.Other.services..except.public.administration.                            0.00053435
## - rBlack.AfricanAmerican                                                       0.00058089
## - Emp.Manufacturing                                                            0.00059146
## - age20.24                                                                     0.00064644
## - family.households                                                            0.00072614
## - Emp.Finance.and.insurance                                                    0.00079991
## - Pyr.Retail.trade                                                             0.00080659
## - Emp.Other.services..except.public.administration.                            0.00101313
## - male                                                                         0.00106600
## - age50.54                                                                     0.00109433
## - age10.14                                                                     0.00110540
## - age70.74                                                                     0.00113222
## - rAmericanIndian.AlaskaNative                                                 0.00133712
## - age85.89                                                                     0.00137654
## - rAsian                                                                       0.00168211
## - age55.59                                                                     0.00227903
##                                                                                    RSS
## - age35.39                                                                     0.14189
## - h.4person                                                                    0.14190
## - age30.34                                                                     0.14190
## - Pyr.Manufacturing                                                            0.14190
## - h.5person                                                                    0.14190
## - Emp.Accommodation.and.food.services                                          0.14191
## <none>                                                                         0.14181
## - age75.79                                                                     0.14191
## + age40.44                                                                     0.14175
## + age60.64                                                                     0.14175
## - Pyr.Information                                                              0.14195
## - total.households                                                             0.14195
## + age25.29                                                                     0.14177
## + Emp.Information                                                              0.14178
## + age80.84                                                                     0.14178
## + Emp.Professional..scientific..and.technical.services                         0.14179
## + Emp.Health.care.and.social.assistance                                        0.14179
## + Pyr.Transportation.and.warehousing.104.                                      0.14179
## + Emp.Utilities                                                                0.14179
## + Emp.Educational.services                                                     0.14179
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14180
## + age5.9                                                                       0.14180
## + Pyr.Utilities                                                                0.14181
## + rWhite                                                                       0.14181
## + rMultiple                                                                    0.14181
## + age0.4                                                                       0.14181
## + Pyr.Professional..scientific..and.technical.services                         0.14181
## + Pyr.Educational.services                                                     0.14181
## + Pyr.Arts..entertainment..and.recreation                                      0.14181
## + age90.over                                                                   0.14181
## + Emp.Retail.trade                                                             0.14181
## + h.6person                                                                    0.14181
## + h.7person.more                                                               0.14181
## + Pyr.Accommodation.and.food.services                                          0.14181
## + age45.49                                                                     0.14181
## + Emp.Arts..entertainment..and.recreation                                      0.14181
## - Emp.Real.estate.and.rental.and.leasing                                       0.14202
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14202
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14207
## - h.3person                                                                    0.14207
## - rNativeHawaiian.OtherPacificIslander                                         0.14213
## - Pyr.Health.care.and.social.assistance                                        0.14220
## - age15.19                                                                     0.14220
## - Pyr.Finance.and.insurance                                                    0.14221
## - Emp.Wholesale.trade                                                          0.14223
## - Emp.Transportation.and.warehousing.104.                                      0.14225
## - h.1person                                                                    0.14229
## - rOther                                                                       0.14231
## - Pyr.Wholesale.trade                                                          0.14231
## - age65.69                                                                     0.14231
## - h.2person                                                                    0.14234
## - total.population                                                             0.14234
## - Pyr.Other.services..except.public.administration.                            0.14235
## - rBlack.AfricanAmerican                                                       0.14239
## - Emp.Manufacturing                                                            0.14241
## - age20.24                                                                     0.14246
## - family.households                                                            0.14254
## - Emp.Finance.and.insurance                                                    0.14261
## - Pyr.Retail.trade                                                             0.14262
## - Emp.Other.services..except.public.administration.                            0.14283
## - male                                                                         0.14288
## - age50.54                                                                     0.14291
## - age10.14                                                                     0.14292
## - age70.74                                                                     0.14295
## - rAmericanIndian.AlaskaNative                                                 0.14315
## - age85.89                                                                     0.14319
## - rAsian                                                                       0.14350
## - age55.59                                                                     0.14409
##                                                                                   AIC
## - age35.39                                                                     -30278
## - h.4person                                                                    -30278
## - age30.34                                                                     -30278
## - Pyr.Manufacturing                                                            -30278
## - h.5person                                                                    -30278
## - Emp.Accommodation.and.food.services                                          -30277
## <none>                                                                         -30277
## - age75.79                                                                     -30277
## + age40.44                                                                     -30277
## + age60.64                                                                     -30277
## - Pyr.Information                                                              -30277
## - total.households                                                             -30276
## + age25.29                                                                     -30276
## + Emp.Information                                                              -30276
## + age80.84                                                                     -30276
## + Emp.Professional..scientific..and.technical.services                         -30276
## + Emp.Health.care.and.social.assistance                                        -30276
## + Pyr.Transportation.and.warehousing.104.                                      -30276
## + Emp.Utilities                                                                -30276
## + Emp.Educational.services                                                     -30276
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30276
## + age5.9                                                                       -30276
## + Pyr.Utilities                                                                -30276
## + rWhite                                                                       -30276
## + rMultiple                                                                    -30276
## + age0.4                                                                       -30276
## + Pyr.Professional..scientific..and.technical.services                         -30275
## + Pyr.Educational.services                                                     -30275
## + Pyr.Arts..entertainment..and.recreation                                      -30275
## + age90.over                                                                   -30275
## + Emp.Retail.trade                                                             -30275
## + h.6person                                                                    -30275
## + h.7person.more                                                               -30275
## + Pyr.Accommodation.and.food.services                                          -30275
## + age45.49                                                                     -30275
## + Emp.Arts..entertainment..and.recreation                                      -30275
## - Emp.Real.estate.and.rental.and.leasing                                       -30275
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30275
## - Pyr.Real.estate.and.rental.and.leasing                                       -30274
## - h.3person                                                                    -30274
## - rNativeHawaiian.OtherPacificIslander                                         -30273
## - Pyr.Health.care.and.social.assistance                                        -30271
## - age15.19                                                                     -30271
## - Pyr.Finance.and.insurance                                                    -30271
## - Emp.Wholesale.trade                                                          -30271
## - Emp.Transportation.and.warehousing.104.                                      -30270
## - h.1person                                                                    -30269
## - rOther                                                                       -30269
## - Pyr.Wholesale.trade                                                          -30269
## - age65.69                                                                     -30269
## - h.2person                                                                    -30268
## - total.population                                                             -30268
## - Pyr.Other.services..except.public.administration.                            -30268
## - rBlack.AfricanAmerican                                                       -30267
## - Emp.Manufacturing                                                            -30267
## - age20.24                                                                     -30266
## - family.households                                                            -30264
## - Emp.Finance.and.insurance                                                    -30262
## - Pyr.Retail.trade                                                             -30262
## - Emp.Other.services..except.public.administration.                            -30258
## - male                                                                         -30257
## - age50.54                                                                     -30256
## - age10.14                                                                     -30256
## - age70.74                                                                     -30255
## - rAmericanIndian.AlaskaNative                                                 -30251
## - age85.89                                                                     -30250
## - rAsian                                                                       -30244
## - age55.59                                                                     -30231
## 
## Step:  AIC=-30277.84
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age30.34 + age50.54 + age55.59 + age65.69 + age70.74 + 
##     age75.79 + age85.89 + rBlack.AfricanAmerican + rAmericanIndian.AlaskaNative + 
##     rAsian + rNativeHawaiian.OtherPacificIslander + rOther + 
##     total.households + family.households + h.1person + h.2person + 
##     h.3person + h.4person + h.5person + Pyr.Finance.and.insurance + 
##     Pyr.Health.care.and.social.assistance + Pyr.Information + 
##     Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Real.estate.and.rental.and.leasing + Pyr.Retail.trade + 
##     Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Finance.and.insurance + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Real.estate.and.rental.and.leasing + Emp.Transportation.and.warehousing.104. + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - age30.34                                                                      1
## - Pyr.Manufacturing                                                             1
## - h.5person                                                                     1
## <none>                                                                           
## - total.households                                                              1
## - Emp.Accommodation.and.food.services                                           1
## + age35.39                                                                      1
## + age60.64                                                                      1
## - age75.79                                                                      1
## - Pyr.Information                                                               1
## + Emp.Information                                                               1
## - h.4person                                                                     1
## + Emp.Professional..scientific..and.technical.services                          1
## + age40.44                                                                      1
## + Emp.Health.care.and.social.assistance                                         1
## + Emp.Utilities                                                                 1
## + Emp.Educational.services                                                      1
## + age80.84                                                                      1
## + Pyr.Transportation.and.warehousing.104.                                       1
## + age25.29                                                                      1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## + Pyr.Utilities                                                                 1
## + Pyr.Professional..scientific..and.technical.services                          1
## + Pyr.Educational.services                                                      1
## + age0.4                                                                        1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + age5.9                                                                        1
## + age45.49                                                                      1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## + Pyr.Accommodation.and.food.services                                           1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + Emp.Retail.trade                                                              1
## + age90.over                                                                    1
## + Emp.Arts..entertainment..and.recreation                                       1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## - h.3person                                                                     1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - Pyr.Finance.and.insurance                                                     1
## - Pyr.Health.care.and.social.assistance                                         1
## - Emp.Wholesale.trade                                                           1
## - Emp.Transportation.and.warehousing.104.                                       1
## - h.1person                                                                     1
## - age15.19                                                                      1
## - Pyr.Wholesale.trade                                                           1
## - rOther                                                                        1
## - age65.69                                                                      1
## - Pyr.Other.services..except.public.administration.                             1
## - total.population                                                              1
## - Emp.Manufacturing                                                             1
## - rBlack.AfricanAmerican                                                        1
## - h.2person                                                                     1
## - Emp.Finance.and.insurance                                                     1
## - Pyr.Retail.trade                                                              1
## - family.households                                                             1
## - Emp.Other.services..except.public.administration.                             1
## - male                                                                          1
## - age20.24                                                                      1
## - age10.14                                                                      1
## - age70.74                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - age50.54                                                                      1
## - age85.89                                                                      1
## - rAsian                                                                        1
## - age55.59                                                                      1
##                                                                                 Sum of Sq
## - age30.34                                                                     0.00006930
## - Pyr.Manufacturing                                                            0.00008548
## - h.5person                                                                    0.00008645
## <none>                                                                                   
## - total.households                                                             0.00010341
## - Emp.Accommodation.and.food.services                                          0.00010454
## + age35.39                                                                     0.00007043
## + age60.64                                                                     0.00006270
## - age75.79                                                                     0.00012627
## - Pyr.Information                                                              0.00012705
## + Emp.Information                                                              0.00003678
## - h.4person                                                                    0.00015114
## + Emp.Professional..scientific..and.technical.services                         0.00002894
## + age40.44                                                                     0.00002594
## + Emp.Health.care.and.social.assistance                                        0.00002327
## + Emp.Utilities                                                                0.00002321
## + Emp.Educational.services                                                     0.00002216
## + age80.84                                                                     0.00002138
## + Pyr.Transportation.and.warehousing.104.                                      0.00001868
## + age25.29                                                                     0.00001387
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00001369
## + Pyr.Utilities                                                                0.00000867
## + Pyr.Professional..scientific..and.technical.services                         0.00000448
## + Pyr.Educational.services                                                     0.00000359
## + age0.4                                                                       0.00000320
## + rWhite                                                                       0.00000286
## + rMultiple                                                                    0.00000286
## + age5.9                                                                       0.00000274
## + age45.49                                                                     0.00000115
## + h.6person                                                                    0.00000047
## + h.7person.more                                                               0.00000047
## + Pyr.Accommodation.and.food.services                                          0.00000033
## + Pyr.Arts..entertainment..and.recreation                                      0.00000019
## + Emp.Retail.trade                                                             0.00000009
## + age90.over                                                                   0.00000000
## + Emp.Arts..entertainment..and.recreation                                      0.00000000
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00019765
## - Emp.Real.estate.and.rental.and.leasing                                       0.00019809
## - h.3person                                                                    0.00020574
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00024567
## - rNativeHawaiian.OtherPacificIslander                                         0.00036210
## - Pyr.Finance.and.insurance                                                    0.00037667
## - Pyr.Health.care.and.social.assistance                                        0.00039828
## - Emp.Wholesale.trade                                                          0.00041204
## - Emp.Transportation.and.warehousing.104.                                      0.00042530
## - h.1person                                                                    0.00042689
## - age15.19                                                                     0.00043656
## - Pyr.Wholesale.trade                                                          0.00049262
## - rOther                                                                       0.00050358
## - age65.69                                                                     0.00053178
## - Pyr.Other.services..except.public.administration.                            0.00054231
## - total.population                                                             0.00059138
## - Emp.Manufacturing                                                            0.00059182
## - rBlack.AfricanAmerican                                                       0.00063553
## - h.2person                                                                    0.00063633
## - Emp.Finance.and.insurance                                                    0.00078440
## - Pyr.Retail.trade                                                             0.00079315
## - family.households                                                            0.00079954
## - Emp.Other.services..except.public.administration.                            0.00102013
## - male                                                                         0.00105552
## - age20.24                                                                     0.00109734
## - age10.14                                                                     0.00117250
## - age70.74                                                                     0.00122334
## - rAmericanIndian.AlaskaNative                                                 0.00128175
## - age50.54                                                                     0.00135290
## - age85.89                                                                     0.00164770
## - rAsian                                                                       0.00166271
## - age55.59                                                                     0.00246785
##                                                                                    RSS
## - age30.34                                                                     0.14195
## - Pyr.Manufacturing                                                            0.14197
## - h.5person                                                                    0.14197
## <none>                                                                         0.14189
## - total.households                                                             0.14199
## - Emp.Accommodation.and.food.services                                          0.14199
## + age35.39                                                                     0.14181
## + age60.64                                                                     0.14182
## - age75.79                                                                     0.14201
## - Pyr.Information                                                              0.14201
## + Emp.Information                                                              0.14185
## - h.4person                                                                    0.14204
## + Emp.Professional..scientific..and.technical.services                         0.14186
## + age40.44                                                                     0.14186
## + Emp.Health.care.and.social.assistance                                        0.14186
## + Emp.Utilities                                                                0.14186
## + Emp.Educational.services                                                     0.14186
## + age80.84                                                                     0.14186
## + Pyr.Transportation.and.warehousing.104.                                      0.14187
## + age25.29                                                                     0.14187
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14187
## + Pyr.Utilities                                                                0.14188
## + Pyr.Professional..scientific..and.technical.services                         0.14188
## + Pyr.Educational.services                                                     0.14188
## + age0.4                                                                       0.14188
## + rWhite                                                                       0.14188
## + rMultiple                                                                    0.14188
## + age5.9                                                                       0.14188
## + age45.49                                                                     0.14188
## + h.6person                                                                    0.14189
## + h.7person.more                                                               0.14189
## + Pyr.Accommodation.and.food.services                                          0.14189
## + Pyr.Arts..entertainment..and.recreation                                      0.14189
## + Emp.Retail.trade                                                             0.14189
## + age90.over                                                                   0.14189
## + Emp.Arts..entertainment..and.recreation                                      0.14189
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14208
## - Emp.Real.estate.and.rental.and.leasing                                       0.14208
## - h.3person                                                                    0.14209
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14213
## - rNativeHawaiian.OtherPacificIslander                                         0.14225
## - Pyr.Finance.and.insurance                                                    0.14226
## - Pyr.Health.care.and.social.assistance                                        0.14228
## - Emp.Wholesale.trade                                                          0.14230
## - Emp.Transportation.and.warehousing.104.                                      0.14231
## - h.1person                                                                    0.14231
## - age15.19                                                                     0.14232
## - Pyr.Wholesale.trade                                                          0.14238
## - rOther                                                                       0.14239
## - age65.69                                                                     0.14242
## - Pyr.Other.services..except.public.administration.                            0.14243
## - total.population                                                             0.14248
## - Emp.Manufacturing                                                            0.14248
## - rBlack.AfricanAmerican                                                       0.14252
## - h.2person                                                                    0.14252
## - Emp.Finance.and.insurance                                                    0.14267
## - Pyr.Retail.trade                                                             0.14268
## - family.households                                                            0.14269
## - Emp.Other.services..except.public.administration.                            0.14291
## - male                                                                         0.14294
## - age20.24                                                                     0.14298
## - age10.14                                                                     0.14306
## - age70.74                                                                     0.14311
## - rAmericanIndian.AlaskaNative                                                 0.14317
## - age50.54                                                                     0.14324
## - age85.89                                                                     0.14353
## - rAsian                                                                       0.14355
## - age55.59                                                                     0.14435
##                                                                                   AIC
## - age30.34                                                                     -30278
## - Pyr.Manufacturing                                                            -30278
## - h.5person                                                                    -30278
## <none>                                                                         -30278
## - total.households                                                             -30278
## - Emp.Accommodation.and.food.services                                          -30278
## + age35.39                                                                     -30277
## + age60.64                                                                     -30277
## - age75.79                                                                     -30277
## - Pyr.Information                                                              -30277
## + Emp.Information                                                              -30277
## - h.4person                                                                    -30277
## + Emp.Professional..scientific..and.technical.services                         -30277
## + age40.44                                                                     -30276
## + Emp.Health.care.and.social.assistance                                        -30276
## + Emp.Utilities                                                                -30276
## + Emp.Educational.services                                                     -30276
## + age80.84                                                                     -30276
## + Pyr.Transportation.and.warehousing.104.                                      -30276
## + age25.29                                                                     -30276
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30276
## + Pyr.Utilities                                                                -30276
## + Pyr.Professional..scientific..and.technical.services                         -30276
## + Pyr.Educational.services                                                     -30276
## + age0.4                                                                       -30276
## + rWhite                                                                       -30276
## + rMultiple                                                                    -30276
## + age5.9                                                                       -30276
## + age45.49                                                                     -30276
## + h.6person                                                                    -30276
## + h.7person.more                                                               -30276
## + Pyr.Accommodation.and.food.services                                          -30276
## + Pyr.Arts..entertainment..and.recreation                                      -30276
## + Emp.Retail.trade                                                             -30276
## + age90.over                                                                   -30276
## + Emp.Arts..entertainment..and.recreation                                      -30276
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30276
## - Emp.Real.estate.and.rental.and.leasing                                       -30276
## - h.3person                                                                    -30275
## - Pyr.Real.estate.and.rental.and.leasing                                       -30275
## - rNativeHawaiian.OtherPacificIslander                                         -30272
## - Pyr.Finance.and.insurance                                                    -30272
## - Pyr.Health.care.and.social.assistance                                        -30271
## - Emp.Wholesale.trade                                                          -30271
## - Emp.Transportation.and.warehousing.104.                                      -30271
## - h.1person                                                                    -30271
## - age15.19                                                                     -30271
## - Pyr.Wholesale.trade                                                          -30269
## - rOther                                                                       -30269
## - age65.69                                                                     -30269
## - Pyr.Other.services..except.public.administration.                            -30268
## - total.population                                                             -30267
## - Emp.Manufacturing                                                            -30267
## - rBlack.AfricanAmerican                                                       -30266
## - h.2person                                                                    -30266
## - Emp.Finance.and.insurance                                                    -30263
## - Pyr.Retail.trade                                                             -30263
## - family.households                                                            -30263
## - Emp.Other.services..except.public.administration.                            -30258
## - male                                                                         -30257
## - age20.24                                                                     -30256
## - age10.14                                                                     -30255
## - age70.74                                                                     -30254
## - rAmericanIndian.AlaskaNative                                                 -30253
## - age50.54                                                                     -30251
## - age85.89                                                                     -30245
## - rAsian                                                                       -30244
## - age55.59                                                                     -30227
## 
## Step:  AIC=-30278.35
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age50.54 + age55.59 + age65.69 + age70.74 + age75.79 + 
##     age85.89 + rBlack.AfricanAmerican + rAmericanIndian.AlaskaNative + 
##     rAsian + rNativeHawaiian.OtherPacificIslander + rOther + 
##     total.households + family.households + h.1person + h.2person + 
##     h.3person + h.4person + h.5person + Pyr.Finance.and.insurance + 
##     Pyr.Health.care.and.social.assistance + Pyr.Information + 
##     Pyr.Manufacturing + Pyr.Other.services..except.public.administration. + 
##     Pyr.Real.estate.and.rental.and.leasing + Pyr.Retail.trade + 
##     Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Finance.and.insurance + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Real.estate.and.rental.and.leasing + Emp.Transportation.and.warehousing.104. + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - Pyr.Manufacturing                                                             1
## - h.5person                                                                     1
## - age75.79                                                                      1
## <none>                                                                           
## - Emp.Accommodation.and.food.services                                           1
## - total.households                                                              1
## + age30.34                                                                      1
## - Pyr.Information                                                               1
## + age35.39                                                                      1
## + age60.64                                                                      1
## + Emp.Information                                                               1
## + age80.84                                                                      1
## + Emp.Professional..scientific..and.technical.services                          1
## + Emp.Utilities                                                                 1
## + Emp.Educational.services                                                      1
## + Emp.Health.care.and.social.assistance                                         1
## - h.4person                                                                     1
## + Pyr.Transportation.and.warehousing.104.                                       1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## + Pyr.Utilities                                                                 1
## + age5.9                                                                        1
## + age45.49                                                                      1
## + age40.44                                                                      1
## + Pyr.Educational.services                                                      1
## + Pyr.Professional..scientific..and.technical.services                          1
## + age25.29                                                                      1
## + age0.4                                                                        1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## + age90.over                                                                    1
## + Pyr.Accommodation.and.food.services                                           1
## + Emp.Arts..entertainment..and.recreation                                       1
## + Emp.Retail.trade                                                              1
## + Pyr.Arts..entertainment..and.recreation                                       1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - h.3person                                                                     1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - age15.19                                                                      1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - Pyr.Finance.and.insurance                                                     1
## - Emp.Transportation.and.warehousing.104.                                       1
## - Emp.Wholesale.trade                                                           1
## - Pyr.Health.care.and.social.assistance                                         1
## - h.1person                                                                     1
## - age65.69                                                                      1
## - Pyr.Wholesale.trade                                                           1
## - rOther                                                                        1
## - Pyr.Other.services..except.public.administration.                             1
## - total.population                                                              1
## - Emp.Manufacturing                                                             1
## - h.2person                                                                     1
## - rBlack.AfricanAmerican                                                        1
## - Emp.Finance.and.insurance                                                     1
## - family.households                                                             1
## - Pyr.Retail.trade                                                              1
## - Emp.Other.services..except.public.administration.                             1
## - age20.24                                                                      1
## - age10.14                                                                      1
## - male                                                                          1
## - age70.74                                                                      1
## - age50.54                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - age85.89                                                                      1
## - rAsian                                                                        1
## - age55.59                                                                      1
##                                                                                 Sum of Sq
## - Pyr.Manufacturing                                                            0.00007782
## - h.5person                                                                    0.00007934
## - age75.79                                                                     0.00009133
## <none>                                                                                   
## - Emp.Accommodation.and.food.services                                          0.00010214
## - total.households                                                             0.00011574
## + age30.34                                                                     0.00006930
## - Pyr.Information                                                              0.00012900
## + age35.39                                                                     0.00005654
## + age60.64                                                                     0.00003607
## + Emp.Information                                                              0.00003600
## + age80.84                                                                     0.00003053
## + Emp.Professional..scientific..and.technical.services                         0.00002900
## + Emp.Utilities                                                                0.00002422
## + Emp.Educational.services                                                     0.00002406
## + Emp.Health.care.and.social.assistance                                        0.00002236
## - h.4person                                                                    0.00016469
## + Pyr.Transportation.and.warehousing.104.                                      0.00001944
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00001742
## + Pyr.Utilities                                                                0.00000867
## + age5.9                                                                       0.00000746
## + age45.49                                                                     0.00000553
## + age40.44                                                                     0.00000540
## + Pyr.Educational.services                                                     0.00000454
## + Pyr.Professional..scientific..and.technical.services                         0.00000442
## + age25.29                                                                     0.00000347
## + age0.4                                                                       0.00000181
## + rWhite                                                                       0.00000160
## + rMultiple                                                                    0.00000160
## + h.6person                                                                    0.00000115
## + h.7person.more                                                               0.00000115
## + age90.over                                                                   0.00000062
## + Pyr.Accommodation.and.food.services                                          0.00000056
## + Emp.Arts..entertainment..and.recreation                                      0.00000035
## + Emp.Retail.trade                                                             0.00000003
## + Pyr.Arts..entertainment..and.recreation                                      0.00000000
## - Emp.Real.estate.and.rental.and.leasing                                       0.00019826
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00020209
## - h.3person                                                                    0.00023026
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00024031
## - age15.19                                                                     0.00036754
## - rNativeHawaiian.OtherPacificIslander                                         0.00036853
## - Pyr.Finance.and.insurance                                                    0.00037841
## - Emp.Transportation.and.warehousing.104.                                      0.00040138
## - Emp.Wholesale.trade                                                          0.00040403
## - Pyr.Health.care.and.social.assistance                                        0.00041589
## - h.1person                                                                    0.00045774
## - age65.69                                                                     0.00046409
## - Pyr.Wholesale.trade                                                          0.00048867
## - rOther                                                                       0.00050900
## - Pyr.Other.services..except.public.administration.                            0.00051960
## - total.population                                                             0.00056139
## - Emp.Manufacturing                                                            0.00056488
## - h.2person                                                                    0.00060742
## - rBlack.AfricanAmerican                                                       0.00063986
## - Emp.Finance.and.insurance                                                    0.00078397
## - family.households                                                            0.00079860
## - Pyr.Retail.trade                                                             0.00081462
## - Emp.Other.services..except.public.administration.                            0.00098887
## - age20.24                                                                     0.00106341
## - age10.14                                                                     0.00111257
## - male                                                                         0.00114528
## - age70.74                                                                     0.00116229
## - age50.54                                                                     0.00139960
## - rAmericanIndian.AlaskaNative                                                 0.00143368
## - age85.89                                                                     0.00159726
## - rAsian                                                                       0.00168266
## - age55.59                                                                     0.00243081
##                                                                                    RSS
## - Pyr.Manufacturing                                                            0.14203
## - h.5person                                                                    0.14203
## - age75.79                                                                     0.14205
## <none>                                                                         0.14195
## - Emp.Accommodation.and.food.services                                          0.14206
## - total.households                                                             0.14207
## + age30.34                                                                     0.14189
## - Pyr.Information                                                              0.14208
## + age35.39                                                                     0.14190
## + age60.64                                                                     0.14192
## + Emp.Information                                                              0.14192
## + age80.84                                                                     0.14192
## + Emp.Professional..scientific..and.technical.services                         0.14192
## + Emp.Utilities                                                                0.14193
## + Emp.Educational.services                                                     0.14193
## + Emp.Health.care.and.social.assistance                                        0.14193
## - h.4person                                                                    0.14212
## + Pyr.Transportation.and.warehousing.104.                                      0.14194
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14194
## + Pyr.Utilities                                                                0.14195
## + age5.9                                                                       0.14195
## + age45.49                                                                     0.14195
## + age40.44                                                                     0.14195
## + Pyr.Educational.services                                                     0.14195
## + Pyr.Professional..scientific..and.technical.services                         0.14195
## + age25.29                                                                     0.14195
## + age0.4                                                                       0.14195
## + rWhite                                                                       0.14195
## + rMultiple                                                                    0.14195
## + h.6person                                                                    0.14195
## + h.7person.more                                                               0.14195
## + age90.over                                                                   0.14195
## + Pyr.Accommodation.and.food.services                                          0.14195
## + Emp.Arts..entertainment..and.recreation                                      0.14195
## + Emp.Retail.trade                                                             0.14195
## + Pyr.Arts..entertainment..and.recreation                                      0.14195
## - Emp.Real.estate.and.rental.and.leasing                                       0.14215
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14216
## - h.3person                                                                    0.14219
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14219
## - age15.19                                                                     0.14232
## - rNativeHawaiian.OtherPacificIslander                                         0.14232
## - Pyr.Finance.and.insurance                                                    0.14233
## - Emp.Transportation.and.warehousing.104.                                      0.14236
## - Emp.Wholesale.trade                                                          0.14236
## - Pyr.Health.care.and.social.assistance                                        0.14237
## - h.1person                                                                    0.14241
## - age65.69                                                                     0.14242
## - Pyr.Wholesale.trade                                                          0.14244
## - rOther                                                                       0.14246
## - Pyr.Other.services..except.public.administration.                            0.14247
## - total.population                                                             0.14252
## - Emp.Manufacturing                                                            0.14252
## - h.2person                                                                    0.14256
## - rBlack.AfricanAmerican                                                       0.14259
## - Emp.Finance.and.insurance                                                    0.14274
## - family.households                                                            0.14275
## - Pyr.Retail.trade                                                             0.14277
## - Emp.Other.services..except.public.administration.                            0.14294
## - age20.24                                                                     0.14302
## - age10.14                                                                     0.14307
## - male                                                                         0.14310
## - age70.74                                                                     0.14312
## - age50.54                                                                     0.14335
## - rAmericanIndian.AlaskaNative                                                 0.14339
## - age85.89                                                                     0.14355
## - rAsian                                                                       0.14364
## - age55.59                                                                     0.14439
##                                                                                   AIC
## - Pyr.Manufacturing                                                            -30279
## - h.5person                                                                    -30279
## - age75.79                                                                     -30278
## <none>                                                                         -30278
## - Emp.Accommodation.and.food.services                                          -30278
## - total.households                                                             -30278
## + age30.34                                                                     -30278
## - Pyr.Information                                                              -30278
## + age35.39                                                                     -30278
## + age60.64                                                                     -30277
## + Emp.Information                                                              -30277
## + age80.84                                                                     -30277
## + Emp.Professional..scientific..and.technical.services                         -30277
## + Emp.Utilities                                                                -30277
## + Emp.Educational.services                                                     -30277
## + Emp.Health.care.and.social.assistance                                        -30277
## - h.4person                                                                    -30277
## + Pyr.Transportation.and.warehousing.104.                                      -30277
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30277
## + Pyr.Utilities                                                                -30277
## + age5.9                                                                       -30277
## + age45.49                                                                     -30277
## + age40.44                                                                     -30277
## + Pyr.Educational.services                                                     -30277
## + Pyr.Professional..scientific..and.technical.services                         -30276
## + age25.29                                                                     -30276
## + age0.4                                                                       -30276
## + rWhite                                                                       -30276
## + rMultiple                                                                    -30276
## + h.6person                                                                    -30276
## + h.7person.more                                                               -30276
## + age90.over                                                                   -30276
## + Pyr.Accommodation.and.food.services                                          -30276
## + Emp.Arts..entertainment..and.recreation                                      -30276
## + Emp.Retail.trade                                                             -30276
## + Pyr.Arts..entertainment..and.recreation                                      -30276
## - Emp.Real.estate.and.rental.and.leasing                                       -30276
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30276
## - h.3person                                                                    -30275
## - Pyr.Real.estate.and.rental.and.leasing                                       -30275
## - age15.19                                                                     -30273
## - rNativeHawaiian.OtherPacificIslander                                         -30273
## - Pyr.Finance.and.insurance                                                    -30272
## - Emp.Transportation.and.warehousing.104.                                      -30272
## - Emp.Wholesale.trade                                                          -30272
## - Pyr.Health.care.and.social.assistance                                        -30271
## - h.1person                                                                    -30271
## - age65.69                                                                     -30270
## - Pyr.Wholesale.trade                                                          -30270
## - rOther                                                                       -30270
## - Pyr.Other.services..except.public.administration.                            -30269
## - total.population                                                             -30268
## - Emp.Manufacturing                                                            -30268
## - h.2person                                                                    -30267
## - rBlack.AfricanAmerican                                                       -30267
## - Emp.Finance.and.insurance                                                    -30264
## - family.households                                                            -30263
## - Pyr.Retail.trade                                                             -30263
## - Emp.Other.services..except.public.administration.                            -30259
## - age20.24                                                                     -30258
## - age10.14                                                                     -30257
## - male                                                                         -30256
## - age70.74                                                                     -30256
## - age50.54                                                                     -30251
## - rAmericanIndian.AlaskaNative                                                 -30250
## - age85.89                                                                     -30246
## - rAsian                                                                       -30245
## - age55.59                                                                     -30229
## 
## Step:  AIC=-30278.69
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age50.54 + age55.59 + age65.69 + age70.74 + age75.79 + 
##     age85.89 + rBlack.AfricanAmerican + rAmericanIndian.AlaskaNative + 
##     rAsian + rNativeHawaiian.OtherPacificIslander + rOther + 
##     total.households + family.households + h.1person + h.2person + 
##     h.3person + h.4person + h.5person + Pyr.Finance.and.insurance + 
##     Pyr.Health.care.and.social.assistance + Pyr.Information + 
##     Pyr.Other.services..except.public.administration. + Pyr.Real.estate.and.rental.and.leasing + 
##     Pyr.Retail.trade + Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Finance.and.insurance + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Real.estate.and.rental.and.leasing + Emp.Transportation.and.warehousing.104. + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - age75.79                                                                      1
## - h.5person                                                                     1
## <none>                                                                           
## - Emp.Accommodation.and.food.services                                           1
## + Pyr.Manufacturing                                                             1
## - total.households                                                              1
## - Pyr.Information                                                               1
## + age30.34                                                                      1
## + age35.39                                                                      1
## + age60.64                                                                      1
## + Emp.Information                                                               1
## + age80.84                                                                      1
## + Emp.Professional..scientific..and.technical.services                          1
## + Emp.Utilities                                                                 1
## + Emp.Educational.services                                                      1
## + Pyr.Transportation.and.warehousing.104.                                       1
## + Emp.Health.care.and.social.assistance                                         1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## + Pyr.Utilities                                                                 1
## + age5.9                                                                        1
## - h.4person                                                                     1
## + age40.44                                                                      1
## + age25.29                                                                      1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## + Pyr.Professional..scientific..and.technical.services                          1
## + Pyr.Educational.services                                                      1
## + age45.49                                                                      1
## + Pyr.Accommodation.and.food.services                                           1
## + age0.4                                                                        1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## + Emp.Arts..entertainment..and.recreation                                       1
## + age90.over                                                                    1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + Emp.Retail.trade                                                              1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## - h.3person                                                                     1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - age15.19                                                                      1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - Pyr.Finance.and.insurance                                                     1
## - Emp.Transportation.and.warehousing.104.                                       1
## - Pyr.Health.care.and.social.assistance                                         1
## - Emp.Wholesale.trade                                                           1
## - h.1person                                                                     1
## - age65.69                                                                      1
## - rOther                                                                        1
## - Pyr.Other.services..except.public.administration.                             1
## - Pyr.Wholesale.trade                                                           1
## - total.population                                                              1
## - h.2person                                                                     1
## - rBlack.AfricanAmerican                                                        1
## - Emp.Finance.and.insurance                                                     1
## - Pyr.Retail.trade                                                              1
## - family.households                                                             1
## - Emp.Other.services..except.public.administration.                             1
## - age20.24                                                                      1
## - age10.14                                                                      1
## - male                                                                          1
## - age70.74                                                                      1
## - age50.54                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - age85.89                                                                      1
## - Emp.Manufacturing                                                             1
## - rAsian                                                                        1
## - age55.59                                                                      1
##                                                                                 Sum of Sq
## - age75.79                                                                     0.00008155
## - h.5person                                                                    0.00008517
## <none>                                                                                   
## - Emp.Accommodation.and.food.services                                          0.00010110
## + Pyr.Manufacturing                                                            0.00007782
## - total.households                                                             0.00011510
## - Pyr.Information                                                              0.00012109
## + age30.34                                                                     0.00006165
## + age35.39                                                                     0.00005765
## + age60.64                                                                     0.00003747
## + Emp.Information                                                              0.00003438
## + age80.84                                                                     0.00003393
## + Emp.Professional..scientific..and.technical.services                         0.00002922
## + Emp.Utilities                                                                0.00002602
## + Emp.Educational.services                                                     0.00002420
## + Pyr.Transportation.and.warehousing.104.                                      0.00002274
## + Emp.Health.care.and.social.assistance                                        0.00002236
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00002196
## + Pyr.Utilities                                                                0.00000944
## + age5.9                                                                       0.00000745
## - h.4person                                                                    0.00017932
## + age40.44                                                                     0.00000672
## + age25.29                                                                     0.00000598
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00018147
## + Pyr.Professional..scientific..and.technical.services                         0.00000486
## + Pyr.Educational.services                                                     0.00000458
## + age45.49                                                                     0.00000334
## + Pyr.Accommodation.and.food.services                                          0.00000221
## + age0.4                                                                       0.00000216
## + rWhite                                                                       0.00000150
## + rMultiple                                                                    0.00000150
## + h.6person                                                                    0.00000090
## + h.7person.more                                                               0.00000090
## + Emp.Arts..entertainment..and.recreation                                      0.00000031
## + age90.over                                                                   0.00000004
## + Pyr.Arts..entertainment..and.recreation                                      0.00000002
## + Emp.Retail.trade                                                             0.00000000
## - Emp.Real.estate.and.rental.and.leasing                                       0.00020202
## - h.3person                                                                    0.00022546
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00024649
## - age15.19                                                                     0.00035990
## - rNativeHawaiian.OtherPacificIslander                                         0.00036357
## - Pyr.Finance.and.insurance                                                    0.00038859
## - Emp.Transportation.and.warehousing.104.                                      0.00041271
## - Pyr.Health.care.and.social.assistance                                        0.00041427
## - Emp.Wholesale.trade                                                          0.00043282
## - h.1person                                                                    0.00045925
## - age65.69                                                                     0.00046742
## - rOther                                                                       0.00049739
## - Pyr.Other.services..except.public.administration.                            0.00051826
## - Pyr.Wholesale.trade                                                          0.00052394
## - total.population                                                             0.00057911
## - h.2person                                                                    0.00061869
## - rBlack.AfricanAmerican                                                       0.00062640
## - Emp.Finance.and.insurance                                                    0.00079191
## - Pyr.Retail.trade                                                             0.00080376
## - family.households                                                            0.00082759
## - Emp.Other.services..except.public.administration.                            0.00099930
## - age20.24                                                                     0.00106652
## - age10.14                                                                     0.00110657
## - male                                                                         0.00115312
## - age70.74                                                                     0.00118772
## - age50.54                                                                     0.00138712
## - rAmericanIndian.AlaskaNative                                                 0.00141613
## - age85.89                                                                     0.00160329
## - Emp.Manufacturing                                                            0.00166620
## - rAsian                                                                       0.00167758
## - age55.59                                                                     0.00240126
##                                                                                    RSS
## - age75.79                                                                     0.14211
## - h.5person                                                                    0.14212
## <none>                                                                         0.14203
## - Emp.Accommodation.and.food.services                                          0.14213
## + Pyr.Manufacturing                                                            0.14195
## - total.households                                                             0.14215
## - Pyr.Information                                                              0.14215
## + age30.34                                                                     0.14197
## + age35.39                                                                     0.14197
## + age60.64                                                                     0.14200
## + Emp.Information                                                              0.14200
## + age80.84                                                                     0.14200
## + Emp.Professional..scientific..and.technical.services                         0.14200
## + Emp.Utilities                                                                0.14201
## + Emp.Educational.services                                                     0.14201
## + Pyr.Transportation.and.warehousing.104.                                      0.14201
## + Emp.Health.care.and.social.assistance                                        0.14201
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14201
## + Pyr.Utilities                                                                0.14202
## + age5.9                                                                       0.14203
## - h.4person                                                                    0.14221
## + age40.44                                                                     0.14203
## + age25.29                                                                     0.14203
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14221
## + Pyr.Professional..scientific..and.technical.services                         0.14203
## + Pyr.Educational.services                                                     0.14203
## + age45.49                                                                     0.14203
## + Pyr.Accommodation.and.food.services                                          0.14203
## + age0.4                                                                       0.14203
## + rWhite                                                                       0.14203
## + rMultiple                                                                    0.14203
## + h.6person                                                                    0.14203
## + h.7person.more                                                               0.14203
## + Emp.Arts..entertainment..and.recreation                                      0.14203
## + age90.over                                                                   0.14203
## + Pyr.Arts..entertainment..and.recreation                                      0.14203
## + Emp.Retail.trade                                                             0.14203
## - Emp.Real.estate.and.rental.and.leasing                                       0.14223
## - h.3person                                                                    0.14226
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14228
## - age15.19                                                                     0.14239
## - rNativeHawaiian.OtherPacificIslander                                         0.14240
## - Pyr.Finance.and.insurance                                                    0.14242
## - Emp.Transportation.and.warehousing.104.                                      0.14244
## - Pyr.Health.care.and.social.assistance                                        0.14245
## - Emp.Wholesale.trade                                                          0.14247
## - h.1person                                                                    0.14249
## - age65.69                                                                     0.14250
## - rOther                                                                       0.14253
## - Pyr.Other.services..except.public.administration.                            0.14255
## - Pyr.Wholesale.trade                                                          0.14256
## - total.population                                                             0.14261
## - h.2person                                                                    0.14265
## - rBlack.AfricanAmerican                                                       0.14266
## - Emp.Finance.and.insurance                                                    0.14282
## - Pyr.Retail.trade                                                             0.14284
## - family.households                                                            0.14286
## - Emp.Other.services..except.public.administration.                            0.14303
## - age20.24                                                                     0.14310
## - age10.14                                                                     0.14314
## - male                                                                         0.14319
## - age70.74                                                                     0.14322
## - age50.54                                                                     0.14342
## - rAmericanIndian.AlaskaNative                                                 0.14345
## - age85.89                                                                     0.14364
## - Emp.Manufacturing                                                            0.14370
## - rAsian                                                                       0.14371
## - age55.59                                                                     0.14443
##                                                                                   AIC
## - age75.79                                                                     -30279
## - h.5person                                                                    -30279
## <none>                                                                         -30279
## - Emp.Accommodation.and.food.services                                          -30279
## + Pyr.Manufacturing                                                            -30278
## - total.households                                                             -30278
## - Pyr.Information                                                              -30278
## + age30.34                                                                     -30278
## + age35.39                                                                     -30278
## + age60.64                                                                     -30278
## + Emp.Information                                                              -30277
## + age80.84                                                                     -30277
## + Emp.Professional..scientific..and.technical.services                         -30277
## + Emp.Utilities                                                                -30277
## + Emp.Educational.services                                                     -30277
## + Pyr.Transportation.and.warehousing.104.                                      -30277
## + Emp.Health.care.and.social.assistance                                        -30277
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30277
## + Pyr.Utilities                                                                -30277
## + age5.9                                                                       -30277
## - h.4person                                                                    -30277
## + age40.44                                                                     -30277
## + age25.29                                                                     -30277
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30277
## + Pyr.Professional..scientific..and.technical.services                         -30277
## + Pyr.Educational.services                                                     -30277
## + age45.49                                                                     -30277
## + Pyr.Accommodation.and.food.services                                          -30277
## + age0.4                                                                       -30277
## + rWhite                                                                       -30277
## + rMultiple                                                                    -30277
## + h.6person                                                                    -30277
## + h.7person.more                                                               -30277
## + Emp.Arts..entertainment..and.recreation                                      -30277
## + age90.over                                                                   -30277
## + Pyr.Arts..entertainment..and.recreation                                      -30277
## + Emp.Retail.trade                                                             -30277
## - Emp.Real.estate.and.rental.and.leasing                                       -30276
## - h.3person                                                                    -30276
## - Pyr.Real.estate.and.rental.and.leasing                                       -30275
## - age15.19                                                                     -30273
## - rNativeHawaiian.OtherPacificIslander                                         -30273
## - Pyr.Finance.and.insurance                                                    -30272
## - Emp.Transportation.and.warehousing.104.                                      -30272
## - Pyr.Health.care.and.social.assistance                                        -30272
## - Emp.Wholesale.trade                                                          -30271
## - h.1person                                                                    -30271
## - age65.69                                                                     -30271
## - rOther                                                                       -30270
## - Pyr.Other.services..except.public.administration.                            -30270
## - Pyr.Wholesale.trade                                                          -30270
## - total.population                                                             -30268
## - h.2person                                                                    -30268
## - rBlack.AfricanAmerican                                                       -30267
## - Emp.Finance.and.insurance                                                    -30264
## - Pyr.Retail.trade                                                             -30264
## - family.households                                                            -30263
## - Emp.Other.services..except.public.administration.                            -30259
## - age20.24                                                                     -30258
## - age10.14                                                                     -30257
## - male                                                                         -30256
## - age70.74                                                                     -30255
## - age50.54                                                                     -30251
## - rAmericanIndian.AlaskaNative                                                 -30251
## - age85.89                                                                     -30247
## - Emp.Manufacturing                                                            -30245
## - rAsian                                                                       -30245
## - age55.59                                                                     -30230
## 
## Step:  AIC=-30278.94
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age50.54 + age55.59 + age65.69 + age70.74 + age85.89 + 
##     rBlack.AfricanAmerican + rAmericanIndian.AlaskaNative + rAsian + 
##     rNativeHawaiian.OtherPacificIslander + rOther + total.households + 
##     family.households + h.1person + h.2person + h.3person + h.4person + 
##     h.5person + Pyr.Finance.and.insurance + Pyr.Health.care.and.social.assistance + 
##     Pyr.Information + Pyr.Other.services..except.public.administration. + 
##     Pyr.Real.estate.and.rental.and.leasing + Pyr.Retail.trade + 
##     Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Finance.and.insurance + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Real.estate.and.rental.and.leasing + Emp.Transportation.and.warehousing.104. + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## - h.5person                                                                     1
## <none>                                                                           
## + age35.39                                                                      1
## - Emp.Accommodation.and.food.services                                           1
## + age75.79                                                                      1
## + Pyr.Manufacturing                                                             1
## - Pyr.Information                                                               1
## - total.households                                                              1
## + Emp.Information                                                               1
## + age30.34                                                                      1
## + Emp.Professional..scientific..and.technical.services                          1
## + Emp.Utilities                                                                 1
## + Emp.Health.care.and.social.assistance                                         1
## + Emp.Educational.services                                                      1
## + Pyr.Transportation.and.warehousing.104.                                       1
## + age60.64                                                                      1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## + age25.29                                                                      1
## + age5.9                                                                        1
## - h.4person                                                                     1
## + Pyr.Utilities                                                                 1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## + Pyr.Educational.services                                                      1
## + Pyr.Professional..scientific..and.technical.services                          1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + age40.44                                                                      1
## + age45.49                                                                      1
## + age80.84                                                                      1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## + Pyr.Accommodation.and.food.services                                           1
## + age90.over                                                                    1
## + Emp.Arts..entertainment..and.recreation                                       1
## + age0.4                                                                        1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + Emp.Retail.trade                                                              1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## - h.3person                                                                     1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - age15.19                                                                      1
## - Pyr.Health.care.and.social.assistance                                         1
## - Pyr.Finance.and.insurance                                                     1
## - Emp.Transportation.and.warehousing.104.                                       1
## - Emp.Wholesale.trade                                                           1
## - age65.69                                                                      1
## - rOther                                                                        1
## - h.1person                                                                     1
## - Pyr.Wholesale.trade                                                           1
## - Pyr.Other.services..except.public.administration.                             1
## - total.population                                                              1
## - h.2person                                                                     1
## - rBlack.AfricanAmerican                                                        1
## - Pyr.Retail.trade                                                              1
## - Emp.Finance.and.insurance                                                     1
## - family.households                                                             1
## - Emp.Other.services..except.public.administration.                             1
## - age20.24                                                                      1
## - age10.14                                                                      1
## - male                                                                          1
## - age50.54                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - Emp.Manufacturing                                                             1
## - rAsian                                                                        1
## - age70.74                                                                      1
## - age55.59                                                                      1
## - age85.89                                                                      1
##                                                                                 Sum of Sq
## - h.5person                                                                    0.00008093
## <none>                                                                                   
## + age35.39                                                                     0.00008290
## - Emp.Accommodation.and.food.services                                          0.00010458
## + age75.79                                                                     0.00008155
## + Pyr.Manufacturing                                                            0.00006805
## - Pyr.Information                                                              0.00012585
## - total.households                                                             0.00014325
## + Emp.Information                                                              0.00003134
## + age30.34                                                                     0.00003086
## + Emp.Professional..scientific..and.technical.services                         0.00002939
## + Emp.Utilities                                                                0.00002860
## + Emp.Health.care.and.social.assistance                                        0.00002464
## + Emp.Educational.services                                                     0.00002420
## + Pyr.Transportation.and.warehousing.104.                                      0.00002302
## + age60.64                                                                     0.00002047
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00002027
## + age25.29                                                                     0.00001263
## + age5.9                                                                       0.00001212
## - h.4person                                                                    0.00017582
## + Pyr.Utilities                                                                0.00001082
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00018178
## + Pyr.Educational.services                                                     0.00000447
## + Pyr.Professional..scientific..and.technical.services                         0.00000419
## + rWhite                                                                       0.00000387
## + rMultiple                                                                    0.00000387
## + age40.44                                                                     0.00000325
## + age45.49                                                                     0.00000271
## + age80.84                                                                     0.00000201
## + h.6person                                                                    0.00000173
## + h.7person.more                                                               0.00000173
## + Pyr.Accommodation.and.food.services                                          0.00000153
## + age90.over                                                                   0.00000042
## + Emp.Arts..entertainment..and.recreation                                      0.00000034
## + age0.4                                                                       0.00000003
## + Pyr.Arts..entertainment..and.recreation                                      0.00000001
## + Emp.Retail.trade                                                             0.00000000
## - Emp.Real.estate.and.rental.and.leasing                                       0.00019661
## - h.3person                                                                    0.00022133
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00024026
## - rNativeHawaiian.OtherPacificIslander                                         0.00029717
## - age15.19                                                                     0.00034463
## - Pyr.Health.care.and.social.assistance                                        0.00040850
## - Pyr.Finance.and.insurance                                                    0.00040888
## - Emp.Transportation.and.warehousing.104.                                      0.00041404
## - Emp.Wholesale.trade                                                          0.00044791
## - age65.69                                                                     0.00046041
## - rOther                                                                       0.00046833
## - h.1person                                                                    0.00052774
## - Pyr.Wholesale.trade                                                          0.00053335
## - Pyr.Other.services..except.public.administration.                            0.00053835
## - total.population                                                             0.00057203
## - h.2person                                                                    0.00058886
## - rBlack.AfricanAmerican                                                       0.00061333
## - Pyr.Retail.trade                                                             0.00080855
## - Emp.Finance.and.insurance                                                    0.00082517
## - family.households                                                            0.00094451
## - Emp.Other.services..except.public.administration.                            0.00103165
## - age20.24                                                                     0.00108838
## - age10.14                                                                     0.00109041
## - male                                                                         0.00109786
## - age50.54                                                                     0.00137392
## - rAmericanIndian.AlaskaNative                                                 0.00141331
## - Emp.Manufacturing                                                            0.00163217
## - rAsian                                                                       0.00176043
## - age70.74                                                                     0.00198229
## - age55.59                                                                     0.00236491
## - age85.89                                                                     0.00241791
##                                                                                    RSS
## - h.5person                                                                    0.14219
## <none>                                                                         0.14211
## + age35.39                                                                     0.14203
## - Emp.Accommodation.and.food.services                                          0.14222
## + age75.79                                                                     0.14203
## + Pyr.Manufacturing                                                            0.14205
## - Pyr.Information                                                              0.14224
## - total.households                                                             0.14226
## + Emp.Information                                                              0.14208
## + age30.34                                                                     0.14208
## + Emp.Professional..scientific..and.technical.services                         0.14208
## + Emp.Utilities                                                                0.14208
## + Emp.Health.care.and.social.assistance                                        0.14209
## + Emp.Educational.services                                                     0.14209
## + Pyr.Transportation.and.warehousing.104.                                      0.14209
## + age60.64                                                                     0.14209
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14209
## + age25.29                                                                     0.14210
## + age5.9                                                                       0.14210
## - h.4person                                                                    0.14229
## + Pyr.Utilities                                                                0.14210
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14230
## + Pyr.Educational.services                                                     0.14211
## + Pyr.Professional..scientific..and.technical.services                         0.14211
## + rWhite                                                                       0.14211
## + rMultiple                                                                    0.14211
## + age40.44                                                                     0.14211
## + age45.49                                                                     0.14211
## + age80.84                                                                     0.14211
## + h.6person                                                                    0.14211
## + h.7person.more                                                               0.14211
## + Pyr.Accommodation.and.food.services                                          0.14211
## + age90.over                                                                   0.14211
## + Emp.Arts..entertainment..and.recreation                                      0.14211
## + age0.4                                                                       0.14211
## + Pyr.Arts..entertainment..and.recreation                                      0.14211
## + Emp.Retail.trade                                                             0.14211
## - Emp.Real.estate.and.rental.and.leasing                                       0.14231
## - h.3person                                                                    0.14233
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14235
## - rNativeHawaiian.OtherPacificIslander                                         0.14241
## - age15.19                                                                     0.14246
## - Pyr.Health.care.and.social.assistance                                        0.14252
## - Pyr.Finance.and.insurance                                                    0.14252
## - Emp.Transportation.and.warehousing.104.                                      0.14253
## - Emp.Wholesale.trade                                                          0.14256
## - age65.69                                                                     0.14257
## - rOther                                                                       0.14258
## - h.1person                                                                    0.14264
## - Pyr.Wholesale.trade                                                          0.14265
## - Pyr.Other.services..except.public.administration.                            0.14265
## - total.population                                                             0.14269
## - h.2person                                                                    0.14270
## - rBlack.AfricanAmerican                                                       0.14273
## - Pyr.Retail.trade                                                             0.14292
## - Emp.Finance.and.insurance                                                    0.14294
## - family.households                                                            0.14306
## - Emp.Other.services..except.public.administration.                            0.14314
## - age20.24                                                                     0.14320
## - age10.14                                                                     0.14320
## - male                                                                         0.14321
## - age50.54                                                                     0.14349
## - rAmericanIndian.AlaskaNative                                                 0.14353
## - Emp.Manufacturing                                                            0.14375
## - rAsian                                                                       0.14387
## - age70.74                                                                     0.14410
## - age55.59                                                                     0.14448
## - age85.89                                                                     0.14453
##                                                                                   AIC
## - h.5person                                                                    -30279
## <none>                                                                         -30279
## + age35.39                                                                     -30279
## - Emp.Accommodation.and.food.services                                          -30279
## + age75.79                                                                     -30279
## + Pyr.Manufacturing                                                            -30278
## - Pyr.Information                                                              -30278
## - total.households                                                             -30278
## + Emp.Information                                                              -30278
## + age30.34                                                                     -30278
## + Emp.Professional..scientific..and.technical.services                         -30278
## + Emp.Utilities                                                                -30278
## + Emp.Health.care.and.social.assistance                                        -30278
## + Emp.Educational.services                                                     -30278
## + Pyr.Transportation.and.warehousing.104.                                      -30277
## + age60.64                                                                     -30277
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30277
## + age25.29                                                                     -30277
## + age5.9                                                                       -30277
## - h.4person                                                                    -30277
## + Pyr.Utilities                                                                -30277
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30277
## + Pyr.Educational.services                                                     -30277
## + Pyr.Professional..scientific..and.technical.services                         -30277
## + rWhite                                                                       -30277
## + rMultiple                                                                    -30277
## + age40.44                                                                     -30277
## + age45.49                                                                     -30277
## + age80.84                                                                     -30277
## + h.6person                                                                    -30277
## + h.7person.more                                                               -30277
## + Pyr.Accommodation.and.food.services                                          -30277
## + age90.over                                                                   -30277
## + Emp.Arts..entertainment..and.recreation                                      -30277
## + age0.4                                                                       -30277
## + Pyr.Arts..entertainment..and.recreation                                      -30277
## + Emp.Retail.trade                                                             -30277
## - Emp.Real.estate.and.rental.and.leasing                                       -30277
## - h.3person                                                                    -30276
## - Pyr.Real.estate.and.rental.and.leasing                                       -30276
## - rNativeHawaiian.OtherPacificIslander                                         -30275
## - age15.19                                                                     -30274
## - Pyr.Health.care.and.social.assistance                                        -30272
## - Pyr.Finance.and.insurance                                                    -30272
## - Emp.Transportation.and.warehousing.104.                                      -30272
## - Emp.Wholesale.trade                                                          -30271
## - age65.69                                                                     -30271
## - rOther                                                                       -30271
## - h.1person                                                                    -30270
## - Pyr.Wholesale.trade                                                          -30270
## - Pyr.Other.services..except.public.administration.                            -30269
## - total.population                                                             -30269
## - h.2person                                                                    -30268
## - rBlack.AfricanAmerican                                                       -30268
## - Pyr.Retail.trade                                                             -30264
## - Emp.Finance.and.insurance                                                    -30263
## - family.households                                                            -30261
## - Emp.Other.services..except.public.administration.                            -30259
## - age20.24                                                                     -30258
## - age10.14                                                                     -30258
## - male                                                                         -30258
## - age50.54                                                                     -30252
## - rAmericanIndian.AlaskaNative                                                 -30251
## - Emp.Manufacturing                                                            -30246
## - rAsian                                                                       -30244
## - age70.74                                                                     -30239
## - age55.59                                                                     -30231
## - age85.89                                                                     -30230
## 
## Step:  AIC=-30279.2
## growthRate ~ total.population + male + age10.14 + age15.19 + 
##     age20.24 + age50.54 + age55.59 + age65.69 + age70.74 + age85.89 + 
##     rBlack.AfricanAmerican + rAmericanIndian.AlaskaNative + rAsian + 
##     rNativeHawaiian.OtherPacificIslander + rOther + total.households + 
##     family.households + h.1person + h.2person + h.3person + h.4person + 
##     Pyr.Finance.and.insurance + Pyr.Health.care.and.social.assistance + 
##     Pyr.Information + Pyr.Other.services..except.public.administration. + 
##     Pyr.Real.estate.and.rental.and.leasing + Pyr.Retail.trade + 
##     Pyr.Wholesale.trade + Emp.Accommodation.and.food.services + 
##     Emp.Administrative.and.support.and.waste.management.and.remediation.services + 
##     Emp.Finance.and.insurance + Emp.Manufacturing + Emp.Other.services..except.public.administration. + 
##     Emp.Real.estate.and.rental.and.leasing + Emp.Transportation.and.warehousing.104. + 
##     Emp.Wholesale.trade
## 
##                                                                                Df
## <none>                                                                           
## + age35.39                                                                      1
## - Emp.Accommodation.and.food.services                                           1
## - h.4person                                                                     1
## + h.5person                                                                     1
## + age75.79                                                                      1
## + Pyr.Manufacturing                                                             1
## - Pyr.Information                                                               1
## + Emp.Information                                                               1
## + h.6person                                                                     1
## + h.7person.more                                                                1
## + age30.34                                                                      1
## + Pyr.Transportation.and.warehousing.104.                                       1
## + Emp.Professional..scientific..and.technical.services                          1
## + Emp.Health.care.and.social.assistance                                         1
## + Emp.Utilities                                                                 1
## + age60.64                                                                      1
## + Emp.Educational.services                                                      1
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services  1
## + age25.29                                                                      1
## + Pyr.Utilities                                                                 1
## + age5.9                                                                        1
## + age45.49                                                                      1
## + rWhite                                                                        1
## + rMultiple                                                                     1
## + Pyr.Professional..scientific..and.technical.services                          1
## + Pyr.Educational.services                                                      1
## + age80.84                                                                      1
## + age0.4                                                                        1
## + age40.44                                                                      1
## + Pyr.Accommodation.and.food.services                                           1
## + Emp.Retail.trade                                                              1
## + age90.over                                                                    1
## + Pyr.Arts..entertainment..and.recreation                                       1
## + Emp.Arts..entertainment..and.recreation                                       1
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services  1
## - Emp.Real.estate.and.rental.and.leasing                                        1
## - Pyr.Real.estate.and.rental.and.leasing                                        1
## - rNativeHawaiian.OtherPacificIslander                                          1
## - age15.19                                                                      1
## - Pyr.Finance.and.insurance                                                     1
## - Emp.Transportation.and.warehousing.104.                                       1
## - Pyr.Health.care.and.social.assistance                                         1
## - Emp.Wholesale.trade                                                           1
## - rOther                                                                        1
## - age65.69                                                                      1
## - total.households                                                              1
## - Pyr.Wholesale.trade                                                           1
## - Pyr.Other.services..except.public.administration.                             1
## - total.population                                                              1
## - rBlack.AfricanAmerican                                                        1
## - h.2person                                                                     1
## - Pyr.Retail.trade                                                              1
## - Emp.Finance.and.insurance                                                     1
## - h.3person                                                                     1
## - family.households                                                             1
## - male                                                                          1
## - Emp.Other.services..except.public.administration.                             1
## - age10.14                                                                      1
## - age20.24                                                                      1
## - age50.54                                                                      1
## - rAmericanIndian.AlaskaNative                                                  1
## - h.1person                                                                     1
## - Emp.Manufacturing                                                             1
## - rAsian                                                                        1
## - age70.74                                                                      1
## - age85.89                                                                      1
## - age55.59                                                                      1
##                                                                                 Sum of Sq
## <none>                                                                                   
## + age35.39                                                                     0.00008244
## - Emp.Accommodation.and.food.services                                          0.00010522
## - h.4person                                                                    0.00010526
## + h.5person                                                                    0.00008093
## + age75.79                                                                     0.00007731
## + Pyr.Manufacturing                                                            0.00007360
## - Pyr.Information                                                              0.00013302
## + Emp.Information                                                              0.00003126
## + h.6person                                                                    0.00003019
## + h.7person.more                                                               0.00002955
## + age30.34                                                                     0.00002669
## + Pyr.Transportation.and.warehousing.104.                                      0.00002625
## + Emp.Professional..scientific..and.technical.services                         0.00002614
## + Emp.Health.care.and.social.assistance                                        0.00002417
## + Emp.Utilities                                                                0.00002391
## + age60.64                                                                     0.00002344
## + Emp.Educational.services                                                     0.00002136
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.00001928
## + age25.29                                                                     0.00001312
## + Pyr.Utilities                                                                0.00000870
## + age5.9                                                                       0.00000770
## + age45.49                                                                     0.00000593
## + rWhite                                                                       0.00000546
## + rMultiple                                                                    0.00000546
## + Pyr.Professional..scientific..and.technical.services                         0.00000360
## + Pyr.Educational.services                                                     0.00000337
## + age80.84                                                                     0.00000310
## + age0.4                                                                       0.00000187
## + age40.44                                                                     0.00000170
## + Pyr.Accommodation.and.food.services                                          0.00000140
## + Emp.Retail.trade                                                             0.00000025
## + age90.over                                                                   0.00000019
## + Pyr.Arts..entertainment..and.recreation                                      0.00000017
## + Emp.Arts..entertainment..and.recreation                                      0.00000006
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.00018843
## - Emp.Real.estate.and.rental.and.leasing                                       0.00020493
## - Pyr.Real.estate.and.rental.and.leasing                                       0.00024765
## - rNativeHawaiian.OtherPacificIslander                                         0.00028651
## - age15.19                                                                     0.00032785
## - Pyr.Finance.and.insurance                                                    0.00040364
## - Emp.Transportation.and.warehousing.104.                                      0.00042640
## - Pyr.Health.care.and.social.assistance                                        0.00043521
## - Emp.Wholesale.trade                                                          0.00045175
## - rOther                                                                       0.00047124
## - age65.69                                                                     0.00050133
## - total.households                                                             0.00053865
## - Pyr.Wholesale.trade                                                          0.00054365
## - Pyr.Other.services..except.public.administration.                            0.00054469
## - total.population                                                             0.00054816
## - rBlack.AfricanAmerican                                                       0.00061381
## - h.2person                                                                    0.00064161
## - Pyr.Retail.trade                                                             0.00080458
## - Emp.Finance.and.insurance                                                    0.00083069
## - h.3person                                                                    0.00085768
## - family.households                                                            0.00089571
## - male                                                                         0.00103849
## - Emp.Other.services..except.public.administration.                            0.00104555
## - age10.14                                                                     0.00107831
## - age20.24                                                                     0.00108948
## - age50.54                                                                     0.00135460
## - rAmericanIndian.AlaskaNative                                                 0.00139554
## - h.1person                                                                    0.00139579
## - Emp.Manufacturing                                                            0.00164255
## - rAsian                                                                       0.00173723
## - age70.74                                                                     0.00199470
## - age85.89                                                                     0.00237498
## - age55.59                                                                     0.00239202
##                                                                                    RSS
## <none>                                                                         0.14219
## + age35.39                                                                     0.14211
## - Emp.Accommodation.and.food.services                                          0.14230
## - h.4person                                                                    0.14230
## + h.5person                                                                    0.14211
## + age75.79                                                                     0.14212
## + Pyr.Manufacturing                                                            0.14212
## - Pyr.Information                                                              0.14233
## + Emp.Information                                                              0.14216
## + h.6person                                                                    0.14216
## + h.7person.more                                                               0.14217
## + age30.34                                                                     0.14217
## + Pyr.Transportation.and.warehousing.104.                                      0.14217
## + Emp.Professional..scientific..and.technical.services                         0.14217
## + Emp.Health.care.and.social.assistance                                        0.14217
## + Emp.Utilities                                                                0.14217
## + age60.64                                                                     0.14217
## + Emp.Educational.services                                                     0.14217
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services 0.14217
## + age25.29                                                                     0.14218
## + Pyr.Utilities                                                                0.14219
## + age5.9                                                                       0.14219
## + age45.49                                                                     0.14219
## + rWhite                                                                       0.14219
## + rMultiple                                                                    0.14219
## + Pyr.Professional..scientific..and.technical.services                         0.14219
## + Pyr.Educational.services                                                     0.14219
## + age80.84                                                                     0.14219
## + age0.4                                                                       0.14219
## + age40.44                                                                     0.14219
## + Pyr.Accommodation.and.food.services                                          0.14219
## + Emp.Retail.trade                                                             0.14219
## + age90.over                                                                   0.14219
## + Pyr.Arts..entertainment..and.recreation                                      0.14219
## + Emp.Arts..entertainment..and.recreation                                      0.14219
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services 0.14238
## - Emp.Real.estate.and.rental.and.leasing                                       0.14240
## - Pyr.Real.estate.and.rental.and.leasing                                       0.14244
## - rNativeHawaiian.OtherPacificIslander                                         0.14248
## - age15.19                                                                     0.14252
## - Pyr.Finance.and.insurance                                                    0.14260
## - Emp.Transportation.and.warehousing.104.                                      0.14262
## - Pyr.Health.care.and.social.assistance                                        0.14263
## - Emp.Wholesale.trade                                                          0.14265
## - rOther                                                                       0.14267
## - age65.69                                                                     0.14270
## - total.households                                                             0.14273
## - Pyr.Wholesale.trade                                                          0.14274
## - Pyr.Other.services..except.public.administration.                            0.14274
## - total.population                                                             0.14274
## - rBlack.AfricanAmerican                                                       0.14281
## - h.2person                                                                    0.14284
## - Pyr.Retail.trade                                                             0.14300
## - Emp.Finance.and.insurance                                                    0.14303
## - h.3person                                                                    0.14305
## - family.households                                                            0.14309
## - male                                                                         0.14323
## - Emp.Other.services..except.public.administration.                            0.14324
## - age10.14                                                                     0.14327
## - age20.24                                                                     0.14328
## - age50.54                                                                     0.14355
## - rAmericanIndian.AlaskaNative                                                 0.14359
## - h.1person                                                                    0.14359
## - Emp.Manufacturing                                                            0.14384
## - rAsian                                                                       0.14393
## - age70.74                                                                     0.14419
## - age85.89                                                                     0.14457
## - age55.59                                                                     0.14459
##                                                                                   AIC
## <none>                                                                         -30279
## + age35.39                                                                     -30279
## - Emp.Accommodation.and.food.services                                          -30279
## - h.4person                                                                    -30279
## + h.5person                                                                    -30279
## + age75.79                                                                     -30279
## + Pyr.Manufacturing                                                            -30279
## - Pyr.Information                                                              -30278
## + Emp.Information                                                              -30278
## + h.6person                                                                    -30278
## + h.7person.more                                                               -30278
## + age30.34                                                                     -30278
## + Pyr.Transportation.and.warehousing.104.                                      -30278
## + Emp.Professional..scientific..and.technical.services                         -30278
## + Emp.Health.care.and.social.assistance                                        -30278
## + Emp.Utilities                                                                -30278
## + age60.64                                                                     -30278
## + Emp.Educational.services                                                     -30278
## + Pyr.Administrative.and.support.and.waste.management.and.remediation.services -30278
## + age25.29                                                                     -30278
## + Pyr.Utilities                                                                -30277
## + age5.9                                                                       -30277
## + age45.49                                                                     -30277
## + rWhite                                                                       -30277
## + rMultiple                                                                    -30277
## + Pyr.Professional..scientific..and.technical.services                         -30277
## + Pyr.Educational.services                                                     -30277
## + age80.84                                                                     -30277
## + age0.4                                                                       -30277
## + age40.44                                                                     -30277
## + Pyr.Accommodation.and.food.services                                          -30277
## + Emp.Retail.trade                                                             -30277
## + age90.over                                                                   -30277
## + Pyr.Arts..entertainment..and.recreation                                      -30277
## + Emp.Arts..entertainment..and.recreation                                      -30277
## - Emp.Administrative.and.support.and.waste.management.and.remediation.services -30277
## - Emp.Real.estate.and.rental.and.leasing                                       -30277
## - Pyr.Real.estate.and.rental.and.leasing                                       -30276
## - rNativeHawaiian.OtherPacificIslander                                         -30275
## - age15.19                                                                     -30274
## - Pyr.Finance.and.insurance                                                    -30273
## - Emp.Transportation.and.warehousing.104.                                      -30272
## - Pyr.Health.care.and.social.assistance                                        -30272
## - Emp.Wholesale.trade                                                          -30272
## - rOther                                                                       -30271
## - age65.69                                                                     -30271
## - total.households                                                             -30270
## - Pyr.Wholesale.trade                                                          -30270
## - Pyr.Other.services..except.public.administration.                            -30270
## - total.population                                                             -30270
## - rBlack.AfricanAmerican                                                       -30268
## - h.2person                                                                    -30268
## - Pyr.Retail.trade                                                             -30264
## - Emp.Finance.and.insurance                                                    -30264
## - h.3person                                                                    -30263
## - family.households                                                            -30262
## - male                                                                         -30259
## - Emp.Other.services..except.public.administration.                            -30259
## - age10.14                                                                     -30258
## - age20.24                                                                     -30258
## - age50.54                                                                     -30252
## - rAmericanIndian.AlaskaNative                                                 -30252
## - h.1person                                                                    -30252
## - Emp.Manufacturing                                                            -30246
## - rAsian                                                                       -30244
## - age70.74                                                                     -30239
## - age85.89                                                                     -30231
## - age55.59                                                                     -30230
```

--- .class #id 

## 3. Result
- Variables having significant t-value (Pr(>|t|) < 0.001)
 - Total population (positive): larger county tends to grow more
 - Male (negative): i.e. Female (positive)
 - Age 10-14, 15-19, 20-24 (negative): this may mean that famlies having those ages have fewer new babies, although oppositve age bands (having positive impact) do not exist.
 - Age 55-59, 65-69, 70-74, 85-89 (negative)
 - Black or African American (negative)
 - Asian, American Indian and Alaskan Native (positive)
 - Total households, 2-person households (poistive)
 - Family household, 1-person households, 3-person households (negative)
 - Empolyee of Finance and insurance (positive)
 - Payroll of Retail trade and Wholsesale trade (positive)
 - Employee of Manufacturing (negative)

--- .class #id 

## 4. Error Analysis


- This model explained about 39% in R squared measure. It would be 35% if we only use demographic data.

![plot of chunk unnamed-chunk-10](assets/fig/unnamed-chunk-10-1.png) 
- Residuals are similar scale as fitted value, which is aligned with small R-squared.
- Normal Q-Q plot indicates that this model does not explain enough for higher growth side. Those top 3 outliers are all North Dakota which still seem to come from oil industry boom.
- Three strong leverage poitns have all extreme attribute. Exluding them may help further generalization of the model. Los Angels (9.8M population, almost twice than next largest county), Kalawao County (90 population, tiny), District of Columbia (large goverment presence)

