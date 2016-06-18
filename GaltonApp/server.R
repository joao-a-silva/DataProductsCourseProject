library(shiny)
library(HistData)
data(GaltonFamilies)
library(dplyr)
library(ggplot2)

# converting in centimeters
galton <- GaltonFamilies
galton <- galton %>% mutate(father=father*2.54, mother=mother*2.54, childHeight=childHeight*2.54)

# linear model
regmod <- lm(childHeight ~ father + mother + gender, data=galton)

shinyServer(function(input, output) {
    output$parentsText <- renderText({
        paste("When the father's height is", strong(round(input$inFather, 1)),
              "cm and the mother's height is", strong(round(input$inMother, 1)),
              "cm, then:")
    })
    
    output$predictionMale <- renderText({
        dataMale <- data.frame(father=input$inFather, mother=input$inMother,
                               gender=factor("male", levels=levels(galton$gender)))
        child <- predict(regmod, newdata=dataMale)
        paste0("A male child height would be approximately ", em(strong(round(child))), " cm")
    })
                         
    output$predictionFemale <- renderText({
        dataFemale <- data.frame(father=input$inFather, mother=input$inMother,
                                 gender=factor("female", levels=levels(galton$gender)))
        
        child <- predict(regmod, newdata=dataFemale)
        paste0("A female child height would be approximately ", em(strong(round(child))), " cm")
    })
    
    output$barsPlot <- renderPlot({
        
        df <- data.frame(father=input$inFather, mother=input$inMother,
                         gender=factor("male", levels=levels(galton$gender)))
        chMale <- predict(regmod, newdata=df)
        
        df <- data.frame(father=input$inFather, mother=input$inMother,
                         gender=factor("female", levels=levels(galton$gender)))
        chFemale <- predict(regmod, newdata=df)
        
        yvals <- c("Father", "Mother", "Male Child", "Female Child")
        
        df <- data.frame(
            x = factor(yvals, levels = yvals, ordered = TRUE),
            y = c(input$inFather, input$inMother, chMale, chFemale),
            colors = c("blue", "red2", "green", "tomato")
        )
        ggplot(df,aes(x=x, y=y,  fill=colors))+
            geom_bar(stat="identity", width=0.3 ) +
            xlab("") + ylab("Height (cm)")+ylim(0,200) + theme(legend.position="none")
    })
})