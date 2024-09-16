#RCODE

rm(list=ls())
 
library(ggplot2)
library(grid)
library(png)  


curve_equation <- function(x, y) {
  return((x^2 + y^2 - 1)^3 - x^2 * y^3)
}

# Generate x and y values for plotting
x = seq(-2, 2, length.out = 400)  
y = seq(-2, 2, length.out = 400)  
df = expand.grid(x = x, y = y)    

df$z = curve_equation(df$x, df$y)

# Loading Image
image_path = "D:/Akash Projects/r/girl.png"  # Replace with the correct path to your image
img = rasterGrob(png::readPNG(image_path), interpolate = TRUE)


# Plot the curve
ggplot(df, aes(x = x, y = y, z = z)) +
  geom_contour(aes(z = z), breaks = 0, color = "red") +
  # Adjust the size of the image by modifying xmin, xmax, ymin, ymax
  annotation_custom(img, xmin = -1, xmax = 1, ymin = -0.55, ymax = 1) +  # Adjust these coordinates to resize
  labs(title = expression((x^2 + y^2 - 1)^3 - x^2 * y^3 == 0),
       x = "x", y = "y") +
  theme_minimal()

