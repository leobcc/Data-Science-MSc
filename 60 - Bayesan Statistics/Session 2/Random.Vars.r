# --------------------------------------------------------------------------------------------------
#
#	Discrete random variables
#
# --------------------------------------------------------------------------------------------------
plotmassdist<-function(x,d,cexmax=1.3){
	op<-par(bg="aliceblue",mfrow=c(1,2))
	plotmass(x,d,cexmax=cexmax,pmax=FALSE)
	plotdist(x,d,cexmax=cexmax)
	par(op)
	}
plotmass<-function(x,d,cexmax=1.3,pmax=TRUE){
	k<-length(x)
	op<-par(bg="aliceblue",lab=c(3, 3, 7))
	if(k==1){
		a<-x-1
		b<-x+1
		cex<-cexmax
		}
	else{
		a<-min(x)
		b<-max(x)
		Delta<-(b-a)/10
		a<-a-Delta
		b<-b+Delta
		cex<-cexmax/log(k)
		}
	n<-300
	u<-seq(a,b,length=n)
	if (pmax){
		y1<-max(d)
		delta<-y1/10
		y0<--delta
		y1<-y1+delta
		ylim<-c(y0,y1)
		}
		else
		ylim<-c(-0.1,1.1)
	plot(u,rep(0,n),type="l",col="red",lwd=3,xlab="x",ylab="f(x)",ylim=ylim,main="Probability mass function (pmf)")
	points(x,d,col="red",pch=19,cex=cex)
	points(x,rep(0,k),col="aliceblue",pch=19,cex=cex)
	par(op)
	}
plotmasspoints<-function(x,d,maxcex=25){
	k<-length(x)
	op<-par(bg="palegoldenrod",lab=c(3, 3, 7))
	if(k==1){
		a<-x-1
		b<-x+1
		}
	else{
		a<-min(x)
		b<-max(x)
		Delta<-(b-a)/10
		a<-a-Delta
		b<-b+Delta
		}
	n<-300
	u<-seq(a,b,length=n)
	ylim<-c(-0.5,0.5)
	plot(u,rep(0,n),type="l",col="blue",lwd=3,xlab="x",ylab="",ylim=ylim,yaxt="n",main="Probability mass")
	points(x,rep(0,k),pch=19,col="orange",cex=maxcex*d)
	par(op)
}
plotdist<-function(x,d,cexmax=1.3){
	k<-length(x)
	op<-par(bg="aliceblue",lab=c(3, 3, 7))
	if (k==1){a<-x-1;b<-x+1} else {a<-min(x);	b<-max(x)}
	Delta<-(b-a)/10
	a<-a-Delta
	b<-b+Delta
	n<-300
	u<-seq(a,b,length=n)
	p0<-cumsum(d)
	p<-c(0,p0)
	st<-stepfun(x,p)
	if(k==1) cex<-cexmax else cex<-cexmax/log(k)
	plot(st,col="red",lwd=3,vert=FALSE,do.points=TRUE,pch=19,xlim=c(a,b),cex=cex,xlab="x",ylab="F(x)",main="Probability distribution (cdf)")
	points(x,p0,col="red",pch=19,cex=cex)
	par(op)
	}
# --------------------------------------------------------------------------------------------------
#
#	Continuous probability distributions
#
# --------------------------------------------------------------------------------------------------
plotdensdist<-function(f,F,xmin,xmax,...){
	op<-par(bg="aliceblue",mfrow=c(1,2))
	n<-500
	u<-seq(xmin,xmax,length=n)
	d<-f(u,...)
	y1<-max(d)
	if (y1>1){
		delta<-y1/10
		y0<--delta
		y1<-y1+delta
		ylim<-c(y0,y1)
		}
		else
		ylim<-c(-0.1,1.1)
	p<-F(u,...)
	plot(u,d,type="l",col="red",lwd=3,xlab="x",ylab="f(x)",ylim=ylim,main="Density (pdf)")
	plot(u,p,type="l",col="red",lwd=3,xlab="x",ylab="F(x)",ylim=ylim,main="Cumulative distribution (cdf)")
	par(op)
}
plotdens<-function(f,xmin,xmax,pmax=TRUE,...){
	op<-par(bg="aliceblue",lab=c(3, 3, 7))
	n<-500
	u<-seq(xmin,xmax,length=n)
	d<-f(u,...)
	y1<-max(d)
	if (pmax){
		delta<-y1/10
		y0<--delta
		y1<-y1+delta
		ylim<-c(y0,y1)
		}
		else
		ylim<-c(-0.1,1.1)
	plot(u,d,type="l",col="red",lwd=3,xlab="x",ylab="f(x)",ylim=ylim,main="Probability density function (pdf)")
	par(op)
	return(y1)
}
plotdistcont<-function(F,xmin,xmax,...){
	op<-par(bg="aliceblue",lab=c(3, 3, 7))
	n<-500
	u<-seq(xmin,xmax,length=n)
	p<-F(u,...)
	ylim<-c(-0.1,1.1)
	plot(u,p,type="l",col="red",lwd=3,xlab="x",ylab="F(x)",ylim=ylim,main="Probability distribution function (cdf)")
	par(op)
}
# --------------------------------------------------------------------------------------------------
# Uniform distribution on [0,2]
# --------------------------------------------------------------------------------------------------
f<-function(x){dunif(x,0,2)}
F<-function(x){punif(x,0,2)}
xmin<--1
xmax<-3
# --------------------------------------------------------------------------------------------------
#	Exponential distribution with lambda=2
# --------------------------------------------------------------------------------------------------
f<-function(x){dexp(x,rate=2)}
F<-function(x){pexp(x,rate=2)}
xmin<--1
xmax<-6
# --------------------------------------------------------------------------------------------------
#
#
#
# --------------------------------------------------------------------------------------------------
# n<-15
# x<-1:n
# d<-(6/pi^2)*(1/x^2)
# plotmassdist(x,d,2)
##> sum(d)
##[1] 0.9607925
# p<-d[1]
# q<-1-p
# d2<-q^(x-1)*p
# plotmassdist(x,d2,2)
# --------------------------------------------------------------------------------------------------
#
#	Coin tossing demo
#
# --------------------------------------------------------------------------------------------------
coin.demo<-function(nmax=300){
	op = par(bg="paleturquoise1",lab=c(4,3,7))
	D<-rbinom(nmax,size=1,prob=0.5)
	Freq.abs<-cumsum(D)
	N<-1:nmax
	Freq.rel<-Freq.abs/N
	for (i in N){
		dev.hold()
		plot(N[1:i],Freq.rel[1:i],type="l",xlim=c(1,nmax),ylim=c(0,1),xlab="",ylab="",col="blue")
		abline(h=0.5,lwd=2.5,col="black")
		dev.flush()
		}
	par(op)
	}
# --------------------------------------------------------------------------------------------------
#
#	Random numbers following a discrete distribution
#
# --------------------------------------------------------------------------------------------------
rdisc<-function(n,x,d){
	return(sample(x=x,size=n,replace=TRUE,prob=d))
	}
# --------------------------------------------------------------------------------------------------
#
#	Plot of a pmf with lines
#
# --------------------------------------------------------------------------------------------------
plotmasslines<-function(x,d,xlim=NULL,cexmax=1.3,pmax=TRUE){
	k<-length(x)
	op<-par(bg="aliceblue",lab=c(3, 3, 7))
	if(k==1){
		a<-x-1
		b<-x+1
		cex<-cexmax
		}
	else{
		if (is.null(xlim)){
			a<-min(x)
			b<-max(x)
			Delta<-(b-a)/10
			a<-a-Delta
			b<-b+Delta
			}
		else{
			a<-xlim[1]
			b<-xlim[2]
			}
		cex<-cexmax/log(k)
		}
	n<-300
	u<-seq(a,b,length=n)
	if (pmax){
		y1<-max(d)
		delta<-y1/10
		y0<--delta
		y1<-y1+delta
		ylim<-c(y0,y1)
		}
		else
		ylim<-c(-0.1,1.1)
	plot(u,rep(0,n),type="n",col="white",lwd=3,xlab="x",ylab="f(x)",ylim=ylim,main="Pmf")
	lines(x,d,lwd=2,col="blue",pch=19,cex=cex)
	points(x,rep(0,k),col="aliceblue",pch=19,cex=cex)
	par(op)
	}