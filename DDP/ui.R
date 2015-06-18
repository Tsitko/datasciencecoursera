shinyUI(pageWithSidebar(
        headerPanel("Let's play with mtcars"),
        sidebarPanel(
                sliderInput(inputId="text1", label = "Wt degree",
                            value=1,min=1,max=15,step=1),
                sliderInput(inputId="text2", label = "Disp degree",
                          value=1,min=1,max=15,step=1),
                p('You can change the degrees of polynomials 
                  (P(wt) and P(disp)) and look how will RMSE
                  on the test set change.'),
                p('On the plots you can see linear models:
                   hp=P(wt), hp=P(disp), hp=P(wt)+P(disp) on the
                   training set (points are for hp and lines for
                   predictions). Under the plots there are RMSE 
                  for that predictions on the test set.'),
                p('This is an illustration of overfitting. 
                   You can see, that perfect fit on the training
                   set could give you a realy huge RMSE
                   on the test set.')
        ),
        mainPanel(
                p('hp~wt'),
                plotOutput('plot1',height = "250px"),
                p('hp~disp'),
                plotOutput('plot2',height = "250px"),
                p('hp~disp+wt'),
                plotOutput('plot3',height = "250px")

        )
))