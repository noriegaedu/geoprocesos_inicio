library(epanet2toolkit)
library(epanetReader)

inp_ej <-  file.path( find.package("epanetReader"), "extdata","Net1.inp")
ej <- read.inp( file.path( find.package("epanetReader"), "extdata","Net1.inp"))

ej_practica <- "H:/Dropbox/proyectos_r_envy/epanet_pruebas/datos_epanet/Practica Simulacion.inp"
ej_rpt <- "H:/Dropbox/proyectos_r_envy/epanet_pruebas/datos_epanet/Practica Simulacion.rpt"

read.inp(ej_practica)
read.inp(file.path( find.package("epanetReader"), "extdata","Net1.inp"))
read.inp2(file.path( find.package("epanetReader"), "extdata","Net1.inp"))


inp <- file.path( find.package("epanetReader"), "extdata","Net1.inp") 
n1 <- read.inp(inp)

asd <- ENepanet(ej_practica, ej_rpt)
ENopen(ej_practica, ej_rpt)

ile.path( find.package("epanetReader"), "extdata","Net1.inp") 