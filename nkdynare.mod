//Preamble
//----------------------------------------
// Variables
var y i pi g u;
varexo e e_g e_u;

// Parameters
parameters rho rho_g rho_u chi_pi chi_y sig_e sig_u sig_g;

// Model
model(linear);
y = y(+1) - i + pi(+1) + g;
pi = 0.99*pi(+1) + 0.1*y + u;
i = rho*i(-1) + (1-rho)*(chi_pi*pi + chi_y*y) + e;
g = rho_g*g(-1) + e_g;
u = rho_u*u(-1) + e_u;
end;

initval;
y = 0;
i = 0;
pi = 0;
g = 1;
u = 1;
end;

shocks;
var e;
stderr sig_e;
var e_g;
stderr sig_g;
var e_u;
stderr sig_u;
end;

//--------------------------
//Estimation
//--------------------------
varobs y pi i;

estimated_params;
rho, uniform_pdf,,,0,1;
rho_g, uniform_pdf,,,0,1;
rho_u, uniform_pdf,,,0,1;
chi_pi, normal_pdf, 1.5,0.25;
chi_y, normal_pdf, 0.25, 0.125;
stderr e, inv_gamma_pdf, 0.5, 0.35;
stderr e_g, inv_gamma_pdf, 0.5, 0.35;  
stderr e_u, inv_gamma_pdf, 0.5, 0.35;
end;


estimation(datafile=nkdata, mh_replic=2000, mode_compute=4);
