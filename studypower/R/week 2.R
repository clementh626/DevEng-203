sample_size <- function(var, significance, power, mde){
  n=2*(var)*((qnorm(1-(significance/2))+qnorm(power))**2)/(mde**2)
  return(ceiling(n))
}
print(sample_size(500**2, 0.05, 0.8, 100))