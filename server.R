#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)
library(datasets)
library(devtools)
library(scatterD3)

Extracted.Data <- mtcars
Extracted.Data$am <- factor(Extracted.Data$am, labels = c("Automatic", "Manual"))
names <- rownames(mtcars)


shinyServer(function(input, output) {
        
        formulaText.1 <- reactive({
                paste("mpg ~", input$variable)
        })
        
        formulaText.2 <- reactive({
                paste("mpg ~", "as.integer(", input$variable, ")")
        })
        
        formulaText.3 <- reactive({
                paste("mpg ~", input$variable)
        })
        
        
        
        
        fit <- reactive({
                lm(as.formula(formulaText.2()), data = Extracted.Data)
        })
        
        output$caption <- renderText({
                formulaText.1()
        })
        
        output$mpgPlot.1 <- renderPlot({
                plot(as.formula(formulaText.1()), col = 'red', pch = 19,
                        data = Extracted.Data)
                       outline = input$outliers
        })
        
        
        output$mpgPlot.3 <- renderScatterD3({
                mtcars$names <- rownames(mtcars)
                scatterD3(data = mtcars, x = wt, y = mpg, lab = names,
                          col_var = cyl, symbol_var = am,
                          xlab = "Weight", ylab = "Mpg", col_lab = "Cylinders",
                          symbol_lab = "Manual transmission")
        })
        
        
        
        output$fit <- renderPrint({
                summary(fit())
        })
        
        output$mpgPlot.2 <- renderPlot({
                with(Extracted.Data, {
                        plot(as.formula(formulaText.2()), col = 'blue', pch = 22)
                        abline(fit(), col = 2)
        })
                
                
                
                
                
        })
        
})