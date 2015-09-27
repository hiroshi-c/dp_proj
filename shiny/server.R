library(shiny)

fit <- readRDS("model.rds")
distribution <- readRDS("distribution.rds")

shinyServer(
  function(input, output){
    
    getSourceData <- reactive({
      obs <- data.frame(
        total.population = input$total.population,
        male = input$male / 100,
        age0.4 = input$age0.4 / 100,
        age5.9 = input$age5.9 / 100,
        age10.14 = input$age10.14 / 100,
        age15.19 = input$age15.19 / 100,
        age20.24 = input$age20.24 / 100,
        age25.29 = input$age25.29 / 100,
        age30.34 = input$age30.34 / 100,
        age35.39 = input$age35.39 / 100,
        age40.44 = input$age40.44 / 100,
        age45.49 = input$age45.49 / 100,
        age50.54 = input$age50.54 / 100,
        age55.59 = input$age55.59 / 100,
        age60.64 = input$age60.64 / 100,
        age65.69 = input$age65.69 / 100,
        age70.74 = input$age70.74 / 100,
        age75.79 = input$age75.79 / 100,
        age80.84 = input$age80.84 / 100,
        age85.89 = input$age85.89 / 100,
        age90.over = (100 - input$age0.4 - input$age5.9 - input$age10.14 - input$age15.19 - input$age20.24 - input$age25.29 - input$age30.34 - input$age35.39 - input$age40.44 - input$age45.49 - input$age50.54 - input$age55.59 - input$age60.64 - input$age65.69 - input$age70.74 - input$age75.79 - input$age80.84 - input$age85.89) / 100,
        rWhite = input$rWhite / 100,
        rBlack.AfricanAmerican = input$rBlack.AfricanAmerican / 100,
        rAmericanIndian.AlaskaNative = input$rAmericanIndian.AlaskaNative / 100,
        rAsian = input$rAsian / 100,
        rNativeHawaiian.OtherPacificIslander = input$rNativeHawaiian.OtherPacificIslander / 100,
        rMultiple = input$rMultiple / 100,
        rOther = (100 - input$rWhite - input$rBlack.AfricanAmerican - input$rAmericanIndian.AlaskaNative - input$rAsian - input$rNativeHawaiian.OtherPacificIslander - input$rMultiple) / 100,
        total.households = input$total.households / input$total.population,
        family.households = input$family.households / input$total.population,
        h.1person = input$h.1person / input$total.population,
        h.2person = input$h.2person / input$total.population,
        h.3person = input$h.3person / input$total.population,
        h.4person = input$h.4person / input$total.population,
        Pyr.Accommodation.and.food.services = input$Pyr.Accommodation.and.food.services,
        Pyr.Administrative.and.support.and.waste.management.and.remediation.services = input$Pyr.Administrative.and.support.and.waste.management.and.remediation.services / 1000,
        Pyr.Finance.and.insurance = input$Pyr.Finance.and.insurance / 1000,
        Pyr.Health.care.and.social.assistance = input$Pyr.Health.care.and.social.assistance / 1000,
        Pyr.Information = input$Pyr.Information / 1000,
        Pyr.Manufacturing = input$Pyr.Manufacturing / 1000,
        Pyr.Other.services..except.public.administration. = input$Pyr.Other.services..except.public.administration. / 1000,
        Pyr.Real.estate.and.rental.and.leasing = input$Pyr.Real.estate.and.rental.and.leasing / 1000,
        Pyr.Retail.trade = input$Pyr.Retail.trade / 1000,
        Pyr.Transportation.and.warehousing.104. = input$Emp.Transportation.and.warehousing.104. / 1000,
        Pyr.Wholesale.trade = input$Pyr.Wholesale.trade / 1000,
        Emp.Accommodation.and.food.services = input$Emp.Accommodation.and.food.services / 100,
        Emp.Administrative.and.support.and.waste.management.and.remediation.services = input$Emp.Administrative.and.support.and.waste.management.and.remediation.services / 100,
        Emp.Finance.and.insurance = input$Emp.Finance.and.insurance / 100,
        Emp.Health.care.and.social.assistance = input$Emp.Health.care.and.social.assistance / 100,
        Emp.Information = input$Emp.Information / 100,
        Emp.Manufacturing = input$Emp.Manufacturing / 100,
        Emp.Other.services..except.public.administration. = input$Emp.Other.services..except.public.administration. / 100,
        Emp.Real.estate.and.rental.and.leasing = input$Emp.Real.estate.and.rental.and.leasing / 100,
        Emp.Retail.trade = input$Emp.Retail.trade / 100,
        Emp.Transportation.and.warehousing.104. = input$Emp.Transportation.and.warehousing.104. / 100,
        Emp.Wholesale.trade = input$Emp.Wholesale.trade / 100
      )
    })
    
    getPrediction <- reactive({
      sourceData <- getSourceData()
      predict(fit, sourceData, level = 0.95, interval = "prediction")
    })

    output$predict <- renderPrint({
      getPrediction()
    })
    
    output$resultPlot <- renderPlot({
      result <- getPrediction()
      hist(distribution$growthRate,
           breaks = 50,
           main = "Population growth distribution and Model output",
           xlab = "Annual growth rate",
           ylab = "Number of counties (actual)")
      abline(v = result[1], col = "red") # fit
      abline(v = result[2], col = "blue") #lwr
      abline(v = result[3], col = "blue") #upr
    })
    
    output$resultString <- renderText({
      result <- getPrediction()
      paste(sep = "",
            "Prediction (red): ", result[1] * 100, "% \n",
            "95% CI lower (blue): ", result[2] * 100, "% \n",
            "95% CI upper (blue): ", result[3] * 100, "% \n" )
    })
    
    output$demographicPlot <- renderPlot({
      data <- c(
        input$age0.4,
        input$age5.9,
        input$age10.14,
        input$age15.19,
        input$age20.24,
        input$age25.29,
        input$age30.34,
        input$age35.39,
        input$age40.44,
        input$age45.49,
        input$age50.54,
        input$age55.59,
        input$age60.64,
        input$age65.69,
        input$age70.74,
        input$age75.79,
        input$age80.84,
        input$age85.89,
        100 - input$age0.4 - input$age5.9 - input$age10.14 - input$age15.19 - input$age20.24 - input$age25.29 - input$age30.34 - input$age35.39 - input$age40.44 - input$age45.49 - input$age50.54 - input$age55.59 - input$age60.64 - input$age65.69 - input$age70.74 - input$age75.79 - input$age80.84 - input$age85.89
      )
      labels <- c(
        "0~4",
        "5~9",
        "10~14",
        "15~19",
        "20~24",
        "25~29",
        "30~34",
        "35~39",
        "40~44",
        "45~49",
        "50~54",
        "55~59",
        "60~64",
        "65~69",
        "70~74",
        "75~79",
        "80~84",
        "85~89",
        "90+"
      )
      barplot(data,
              names.arg = labels,
              main = "Population distribution per age bands (%)",
              horiz = TRUE,
              col = "white",
              las = 1)
    })
    
    
  }
)