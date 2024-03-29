########################
# Author: Linlin Tian
########################

# TODO: Add a summary description of what problem 
#       we are trying to solve here


########################
# set up model parameters
########################

# TODO: Add a human readable description
#       for each parameter
nSteps = 1000
g      = 0
c      = 0.01
B      = 5000
h      = 0.1   # step size

p      = 5
lambda = 3
alpha  = 2

echp = exp(-c * h / p)
lhp  = lambda * h / p
lhp1 = 1 - lhp
eah  = exp(-alpha * h)

x    = seq(from = 0, to = B, by = h)

# Why 300 here? Give it a meaningful
# name and set it at the top,
# with the other defined constants
Vold = 300 * rep(1, length(x))

Vnew    = vector()

# Explain what this outer loop is doing
for (t in 1:nSteps){ 
   Vnew[1] = echp * Vold[2]
  
   # Explain what this inner loop is doing
   for (k in 2:(length( Vold ) - 1)){
      m    = 1:(k-1)   
      Vsum = sum(Vold[k-m] * (1 - eah) *  eah^m)
      
      # What is this test about?
      # What does it mean? Why?
      if((lhp1 * Vold[k + 1] + Vsum * lhp ) * echp > Vold[k - 1] + h){
         Vnew[k] = ( lhp1 * Vold[k + 1] + Vsum * lhp ) * echp
      }
      else{
         Vnew[k] = Vold[k - 1] + h
      }
   }

   Vold <- Vold[-length(Vold)]
   g[i] = max(abs(Vold - Vnew))
   Vold = Vnew
}
