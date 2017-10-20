var y i k a c;
varexo e;

parameters alpha beta delta rho sigma sigmae;
alpha = 0.33;
beta = 0.99;
delta = 0.025;
rho = 0.95;
sigma = 1;
sigmae = 0.01;

model;

exp(c)^(-sigma) = beta*(exp(c(+1))^(-sigma)*(alpha*exp(a(+1))*exp(k)^(alpha-1)+(1-delta)));
exp(y) = exp(a)*exp(k(-1))^(alpha);
exp(k) = exp(i) + (1-delta)*exp(k(-1));
exp(y) = exp(c) + exp(i);
a = rho*a(-1) + e;

end;

initval;
    
k = log(29);
y = log(3);
a = 0;
c = log(2.5);
i = log(1.5);
end;

shocks;
var e = sigmae^2;
end;

steady;

stoch_simul(hp_filter=1600,order=1,irf=40);
