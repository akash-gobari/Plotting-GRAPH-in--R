 # R-CODE:
rm(list=ls())
library(ggplot2)

curve_equation = function(x, y) {
  return((x^2 + y^2 - 1)^3 - x^2 * y^3)
}

# Generate x and y values for plotting
x <- seq(-2, 2, length.out = 400)  
y <- seq(-2, 2, length.out = 400)  
df <- expand.grid(x = x, y = y)    

df$z <- curve_equation(df$x, df$y)


# Plot 
ggplot(df, aes(x = x, y = y, z = z)) +
  geom_contour(aes(z = z), breaks = 0, color = "red") +
  labs(title = expression((x^2 + y^2 - 1)^3 - x^2 * y^3 == 0),
       x = "x", y = "y") +
  theme_minimal()
