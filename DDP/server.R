library(shiny)
library(Metrics)
library(caret)
library(ggplot2)
data(mtcars)
ind<-createDataPartition(mtcars$hp,p=.7,list=F)
dt<-mtcars[ind,]
dv<-mtcars[-ind,]
dt<-dt[order(dt[,4]),]
shinyServer(
        function(input, output) {
                res1<-reactive({ 
                deg1<-renderText({as.numeric(input$text1)})
                
                deg1<-as.numeric(deg1())

                 mod<-lm(dt$hp~poly(dt$wt,deg1))
                res1<-predict(mod,dt)
        })
        res1v<-reactive({ 
                deg1<-renderText({as.numeric(input$text1)})
                
                deg1<-as.numeric(deg1())
                train<-dt
                mod<-lm(train$hp~poly(train$wt,deg1))
                train<-dv
                res1v<-predict(mod,train)
        })
                output$plot1 <- renderPlot(
                        {
                                plot(1:length(dt$hp),dt$hp,xlab="wt",ylab="hp",
                                     lwd=4,col="blue",
                                     sub=paste("RMSE=",round(rmse(dv$hp,res1v()),2)))
                                
                                points(1:length(dt$hp),res1(),type="l",col="red")
                         })
        res2<-reactive({ 
                deg2<-renderText({as.numeric(input$text2)})
                
                deg2<-as.numeric(deg2())
                mod<-lm(dt$hp~poly(dt$disp,deg2))
                
                res2<-predict(mod,dt)
        })
        res2v<-reactive({ 
                deg2<-renderText({as.numeric(input$text2)})
                
                deg2<-as.numeric(deg2())
                train<-dt
                mod<-lm(train$hp~poly(train$disp,deg2))
                train<-dv
                res2v<-predict(mod,train)
        })
        output$plot2 <- renderPlot(
{
        plot(1:length(dt$hp),dt$hp,xlab="disp",ylab="hp",
             lwd=4,col="blue",
             sub=paste("RMSE=",round(rmse(dv$hp,res2v()),2)))
        
        points(1:length(dt$hp),res2(),type="l",col="red")
})
res3<-reactive({ 
        deg1<-renderText({as.numeric(input$text1)})
        
        deg1<-as.numeric(deg1())
        deg2<-renderText({as.numeric(input$text2)})
        
        deg2<-as.numeric(deg2())
        mod<-lm(dt$hp~poly(dt$disp,deg2)+poly(dt$wt,deg1))
        
        res3<-predict(mod,dt)
})
res3v<-reactive({ 
        deg1<-renderText({as.numeric(input$text1)})
        
        deg1<-as.numeric(deg1())
        deg2<-renderText({as.numeric(input$text2)})
        
        deg2<-as.numeric(deg2())
        train<-dt
        mod<-lm(train$hp~poly(train$disp,deg2)+poly(train$wt,deg1))
        train<-dv
        res3v<-predict(mod,train)
})
output$plot3 <- renderPlot(
{
        plot(1:length(dt$hp),dt$hp,xlab="disp",ylab="hp",
             lwd=4,col="blue",
             sub=paste("RMSE=",round(rmse(dv$hp,res3v()),2)))
        
        points(1:length(dt$hp),res3(),type="l",col="red")
})


        }

)