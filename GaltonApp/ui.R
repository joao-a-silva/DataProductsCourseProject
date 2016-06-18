library(shiny)

shinyUI(fluidPage(
    titlePanel("Height of the Child According on his Parents' Heights"),
    br(), br(),
    
    sidebarLayout(
        sidebarPanel(
            helpText("This application predicts height of child according on the 
                     height of the parents.\n"),
            
            helpText("Please make a combination of parameters for the prediction:"),
            
            sliderInput(inputId = "inFather",
                        label = "Father's height (centimeters):",
                        value = 150,
                        min = 150,
                        max = 200,
                        step = 1),
            
            sliderInput(inputId = "inMother",
                        label = "Mother's height (centimeters):",
                        value = 150,
                        min = 150,
                        max = 200,
                        step = 1)
        ),
        
        mainPanel(plotOutput("barsPlot", width = "70%", height = 338)
            
        )
        
    ),
    
    
    mainPanel(htmlOutput("parentsText"), 
               htmlOutput("predictionMale"),
               htmlOutput("predictionFemale")
               
    )
    
    
))