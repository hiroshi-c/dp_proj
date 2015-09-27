library(shiny)

shinyUI(fluidPage(
#  title = "Population growth rate in all US counties from April 2010 to July 2014",
  titlePanel("Population growth rate in all US counties from April 2010 to July 2014"),
  
  sidebarLayout(
    sidebarPanel(
      verbatimTextOutput("resultString"),
      plotOutput("resultPlot"),
      plotOutput("demographicPlot")
    ),
    
    mainPanel(
      p("This is a linear regerssion model of population growth rate based on demographic and economic data."),
      p("Initial value is set the actual value of King County, Washington state, where Seattle locates."),
      p("You may modify the input data below and observe how this model changes its prediction."),
      p("Detail explanaiton of source data and model construciton is found here: "),
      fluidRow(
        column(2,
               h3("Popluation"),
               numericInput("total.population", "Total:", 1931249, step=10000),
               numericInput("male", "Male (%):", 49.817, step=0.1),
               h4("Race (%)"),
               numericInput("rWhite", "White:", 68.65, step=0.1),
               numericInput("rBlack.AfricanAmerican", "Black or African American:", 6.20, step=0.1),
               numericInput("rAmericanIndian.AlaskaNative", "American Indian and Alaska Native:", 0.84, step=0.1),
               numericInput("rAsian", "Asian:", 14.61, step=0.1),
               numericInput("rNativeHawaiian.OtherPacificIslander", "Native Hawaiian and Other Pacific Islander:", 0.75, step=0.1),
               numericInput("rMultiple", "Two or More Races:", 5.01, step=0.1)
        ),
        column(2,
               h4("In age bands (%)"),
               numericInput("age0.4", "Age 0 - 4:", 6.229, step=0.1),
               numericInput("age5.9", "Age 5 - 9:", 5.866, step=0.1),
               numericInput("age10.14", "Age 10 - 14:", 5.737, step=0.1),
               numericInput("age15.19", "Age 15 - 19:", 6.085, step=0.1),
               numericInput("age20.24", "Age 20 - 24:", 6.722, step=0.1),
               numericInput("age25.29", "Age 25 - 29:", 8.319, step=0.1),
               numericInput("age30.34", "Age 30 - 34:", 7.874, step=0.1),
               numericInput("age35.39", "Age 35 - 39:", 7.723, step=0.1)
        ),
        column(2,
               numericInput("age40.44", "Age 40 - 44:", 7.644, step=0.1),
               numericInput("age45.49", "Age 45 - 49:", 7.655, step=0.1),
               numericInput("age50.54", "Age 50 - 54:", 7.420, step=0.1),
               numericInput("age55.59", "Age 55 - 59:", 6.538, step=0.1),
               numericInput("age60.64", "Age 60 - 64:", 5.279, step=0.1),
               numericInput("age65.69", "Age 65 - 69:", 3.486, step=0.1),
               numericInput("age70.74", "Age 70 - 74:", 2.352, step=0.1),
               numericInput("age75.79", "Age 75 - 79:", 1.823, step=0.1),
               numericInput("age80.84", "Age 80 - 84:", 1.499, step=0.1),
               numericInput("age85.89", "Age 85 - 89:", 1.109, step=0.1)
        ),
        column(2,
               h3("Households"),
               numericInput("total.households", "Total households:", 789232, step=10000),
               numericInput("family.households", "Family households:", 461510, step=10000),
               numericInput("h.1person", "1-person households:", 244699, step=10000),
               numericInput("h.2person", "2-person households:", 261476, step=10000),
               numericInput("h.3person", "3-person households:", 119067, step=10000),
               numericInput("h.4person", "4-person households:", 99237, step=10000)
        ),
        column(2,
               h3("Payroll"),
               p("(dollars per capita)"),
               numericInput("Pyr.Retail.trade", "Retail trade:", 1636, step=500),
               numericInput("Pyr.Wholesale.trade", "Wholesale trade:", 1648, step=500),
               numericInput("Pyr.Health.care.and.social.assistance", "Health care and social assistance:", 3681, step=500),
               numericInput("Pyr.Finance.and.insurance", "Finance and insurance:", 2061, step=500),
               numericInput("Pyr.Real.estate.and.rental.and.leasing", "Real estate and rental and leasing:", 611, step=500),
               numericInput("Pyr.Information", "Information:", 7322, step=500),
               numericInput("Pyr.Manufacturing", "Manufacturing:", 2494, step=500),
               numericInput("Pyr.Accommodation.and.food.services", "Accommodation and food services:", 965, step=500),
               numericInput("Pyr.Transportation.and.warehousing.104.", "Transportation andwarehousing", 1306, step=500),
               numericInput("Pyr.Administrative.and.support.and.waste.management.and.remediation.services", "Administrative and support and waste management and remediation services:", 1534, step=500),
               numericInput("Pyr.Other.services..except.public.administration.", "Other services (except public administration):", 556, step=500)
        ),
        column(2,
               h3("Employee"),
               p("(% of population)"),
               numericInput("Emp.Retail.trade", "Retail trade:", 5.072, step=0.1),
               numericInput("Emp.Wholesale.trade", "Wholesale trade:", 2.551, step=0.1),
               numericInput("Emp.Health.care.and.social.assistance", "Health care and social assistance:", 7.008, step=0.1),
               numericInput("Emp.Finance.and.insurance", "Finance and insurance:", 2.307, step=0.1),
               numericInput("Emp.Real.estate.and.rental.and.leasing", "Real estate and rental and leasing:", 1.203, step=0.1),
               numericInput("Emp.Information", "Information:", 5.204, step=0.1),
               numericInput("Emp.Manufacturing", "Manufacturing:", 4.123, step=0.1),
               numericInput("Emp.Accommodation.and.food.services", "Accommodation and food services:", 4.836, step=0.1),
               numericInput("Emp.Transportation.and.warehousing.104.", "Transportation andwarehousing", 2.318, step=0.1),
               numericInput("Emp.Administrative.and.support.and.waste.management.and.remediation.services", "Administrative and support and waste management and remediation services:", 3.465, step=0.1),
               numericInput("Emp.Other.services..except.public.administration.", "Other services (except public administration):", 1.515, step=0.1)
        )
      )
    )
  )
))


