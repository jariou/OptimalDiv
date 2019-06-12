g=0
c=0.01
B=5000
h=0.1
x=seq(from =0, to=B, by=h)
Vold=300*rep(1,length(x))
p=5
lambda=3
alpha=2

t=1
for (t in 1:1000){
Vnew=vector()
  Vnew[1]=exp(-c*h/p)*Vold[2]
    k=2
  for (k in 2:(length(Vold)-1)){
    m=1 
    Vsum=0
    for (m in 1:(k-1)){
      Vsum=Vsum+Vold[k-m]*exp(-alpha*m*h)*(1-exp(-alpha*h))
    }
    if((1-lambda*h/p)*exp(-c*h/p)*Vold[k+1]+Vsum*lambda*h/p*exp(-c*h/p)>Vold[k-1]+h){
      Vnew[k]=(1-lambda*h/p)*exp(-c*h/p)*Vold[k+1]+Vsum*lambda*h/p*exp(-c*h/p)
    }else{
      Vnew[k]= Vold[k-1]+h
    }
  }
  Vold<-Vold[-length(Vold)]
  g[i]=max(abs(Vold-Vnew))
  Vold=Vnew
}