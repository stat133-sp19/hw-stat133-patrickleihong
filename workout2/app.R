library(shiny)
library(ggplot2)

ui <- fluidPage(
  
  titlePanel("Savings Accounts Simulator"),
  
  fluidRow(column(3, sliderInput("initial",
                       "Initial Amount",
                       min = 0,
                       max = 100000,
                       value = 1000,
                       step = 500),
           sliderInput("annual",
                       "Annual Contribution",
                       min = 0,
                       max = 50000,
                       value = 2000,
                       step = 500), offset = 2),
           column(3, sliderInput("return",
                       "Return Rate",
                       min = 0,
                       max = 20,
                       value = 5,
                       step = 0.1),
           sliderInput("growth",
                       "Growth Rate",
                       min = 0,
                       max = 20,
                       value = 2,
                       step = 0.1)),
          column(3, sliderInput("years",
                       "Years",
                       min = 0,
                       max = 50,
                       value = 20,
                       step = 1),
           selectInput("facet",
                       "Facet?",
                       c("No", "Yes")))),
  fluidRow(hr()),
  fluidRow(column(6, h4("Timelines"), offset = 3)),
  fluidRow(column(6, plotOutput("distPlot"), offset = 3)),
  fluidRow(column(6, h4("Balances"), offset = 3)),
  fluidRow(column(6, verbatimTextOutput("datatable"), offset = 3))
)


server <- function(input, output) {
  modalities <- reactive({
    future_value <-  function(amount, rate, years){
      return(amount*(1+rate)^years)
    }
    annuity <- function(contrib, rate, years){
      return(contrib *(((1+rate)^(years)-1)/(rate)))
    }
    growing_annuity <- function(contrib, rate, growth, years){
      return(contrib * (((1+rate)^(years)-(1+growth)^(years))/(rate-growth)))
    }
    years <- 0
    no_contrib <- 0
    fixed_contrib <- 0
    growing_contrib <- 0
    return <- input$return / 100
    growth <- input$growth / 100
    for(i in 0:input$years){
      years[i+1] <- i
      no_contrib[i+1] <- future_value(amount = input$initial, rate = return, years = i) 
      fixed_contrib[i+1] <- no_contrib[i+1] + annuity(contrib = input$annual, rate = return, years = i)
      growing_contrib[i+1] <- no_contrib[i+1] + growing_annuity(contrib = input$annual, rate = return, growth = growth, years = i)
    }
    
    data.frame("year" = years, "no_contrib" = no_contrib, "fixed_contrib" = fixed_contrib, "growing_contrib" = growing_contrib)
  })
  
  output$distPlot <- renderPlot({
    dat <- modalities()
    dat1 <- data.frame("type" = rep("no_contrib", length(dat$year)), "year" = dat[,1], "amount" = dat[,2])
    dat2 <- data.frame("type" = rep("fixed_contrib", length(dat$year)), "year" = dat[,1], "amount" = dat[,3])
    dat3 <- data.frame("type" = rep("growing_contrib", length(dat$year)), "year" = dat[,1], "amount" = dat[,4])
    datA <- rbind(dat1, dat2, dat3)

    facet <- function(number){
      if(input$facet == "Yes"){
        ggplot(datA, aes(year, amount)) +
          geom_line(aes(color = type), size = 1) +
          geom_point(aes(color = type)) +
          geom_area(mapping = aes(fill = type), alpha = 0.5) +
          facet_wrap(~ type) +
          scale_alpha(guide = 'none') +
          labs(title = "Three modes of investing", color = "variable", fill = "variable") +
          theme_bw()
      }
      else{
        ggplot(dat, aes(x= year)) +
          geom_line(aes(y = no_contrib, color = "no_contrib"), size = 1) + 
          geom_line(aes(y = fixed_contrib, color = "fixed_contrib"), size = 1) +
          geom_line(aes(y = growing_contrib, color = "growing_contrib"), size = 1) + 
          geom_point(aes(y = no_contrib, color = "no_contrib")) +
          geom_point(aes(y = fixed_contrib, color = "fixed_contrib")) +
          geom_point(aes(y = growing_contrib, color = "growing_contrib")) +
          labs(title = "Three modes of investing", x = "Year", y = "Balance", color = "variable") + 
          scale_color_manual(values = c("no_contrib" = "red", "fixed_contrib" = "green", "growing_contrib" = "blue"), 
                             breaks = c("no_contrib", "fixed_contrib", "growing_contrib"), guide = "legend") 
      }
    }
    
    facet(number = return)
    
  })
  
  output$datatable <- renderPrint({
    modalities()
    
  })
    
}

shinyApp(ui = ui, server = server)