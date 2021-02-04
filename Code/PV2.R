# This function calculates PV value 
# PV = Present value 
# FV = Future value 
# r = interest rate 
# n = years

PV2 <- function(FV = 1000, r = .08, n = 5) {
  PV2 <- FV / (1 + r)^n
  round(PV2, 2)
}