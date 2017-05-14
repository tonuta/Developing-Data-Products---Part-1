# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(scatterD3)

shinyUI(
        navbarPage("Car Road Tests",
                   tabPanel("Detailed Description of Variables",
                            h2("Study of mtcars Dataset"),
                            hr(),
                            h3("Data Presentation:"),
                            helpText("The data was taken from the  Motor Trend US magazine (1973-74 models)."),

                            h3("Variables and Units Description:"),
                            p("The data set has 32 observations on 11 variables organized into a data frame."),
                            p("---------------------------------------------------------------------------------------------------"),
                            p("Variable (col-1):  mpg;    Unit:   Miles/(US) gallon"),
                            p("Variable (col-2):  cyl;    Unit:   Number of cylinders"),
                            p("Variable (col-3):  disp;	  Unit:   Displacement (cu.in.)"),
                            p("Variable (col-4):  hp;     Unit:   Gross horsepower"),
                            p("Variable (col-5):  drat;   Unit:   Rear axle ratio"),
                            p("Variable (col-6):  wt;     Unit:	  Weight (lb/1000)"),
                            p("Variable (col-7):  qsec;	  Unit:   1/4 mile time"),
                            p("Variable (col-8):  vs;	  Unit:   V/S"),
                            p("Variable (col-9):  am;	  Unit:   Transmission (0 = automatic, 1 = manual)"),
                            p("Variable (col-10): gear;   Unit:	  Number of forward gears"),
                            p("Variable (col-11): carb;	  Unit:   Number of carburators"),
                            p("----------------------------------------------------------------------------------------------------"),
                            p("The notations col-1, col-2, ..., col-11 represent the numbers of the columns in the mtcars data set.")
                   ),
               
                       
                   tabPanel("Graphical Analysis",
                            fluidPage(
                                    titlePanel("The dependence of the <miles per gallon (mpg)> versus other mtcars variables"),
                                    sidebarLayout(
                                            sidebarPanel(
                                                    selectInput("variable", "Type of 2D Scatter Plot. Regression Model for 2D Data:",
                                                                c("mpg = f(Number of cylinders)" = "cyl",
                                                                  "mpg = f(Displacement (cu.in.))" = "disp",
                                                                  "mpg = f(Gross horsepower)" = "hp",
                                                                  "mpg = f(Rear axle ratio)" = "drat",
                                                                  "mpg = f(Weight (lb/1000))" = "wt",
                                                                  "mpg = f(1/4 mile time)" = "qsec",
                                                                  "mpg = f(V/S)" = "vs",
                                                                  "mpg = f(Transmission)" = "am",
                                                                  "mpg = f(Number of gears)" = "gear",
                                                                  "mpg = f(Number of carburators)" = "carb"
                                                                )),
                                                    
                                                    
                                                    
                                                    checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                                            ),
                                            
                                          
                                          
                                            
                                            mainPanel(
                                                    h3(textOutput("caption")),
                                                    
                                                    tabsetPanel(type = "tabs", 
                                                                tabPanel("2D Scatter Plot", plotOutput("mpgPlot.1")),
                                                                
                                                                tabPanel("Regression Model for 2D Data", 
                                                                         plotOutput("mpgPlot.2"),
                                                                         verbatimTextOutput("fit")),
                                                                tabPanel("Example Of Plot Using ScatterD3", scatterD3Output("mpgPlot.3"))
                                                               
                                                    )
                                            )
                                    )
                            )
                   ),
                   tabPanel("SourceCode",
                            p("Course Project - Part 1: Shiny Application"),
                            a("https://github.com/tonuta/Developing-Data-Products---Part-1")
                   ),
                   
                   
                   tabPanel("Documentation",
                            p(""),
                            a("")
                           
                   )
        )
)