library("permutations")

jj <- array(c(t(as.matrix(read.table("data.txt")))),c(5,5,12))


megaminx <- rep(id,12)

chosen <- seq_len(5)  # For megaminx use seq_len(5); for kilominx, use  chosen <- c(2,3,5) 

for(i in seq_len(12)){
    for(j in chosen){
        megaminx[i] <- megaminx[i] + as.cycle(jj[,j,i])
    }
}
rm(i,j,jj)


names(megaminx) <- c("White", "Purple", "DarkYellow", "DarkBlue", "Red",
                   "DarkGreen", "LightGreen", "Orange", "LightBlue",
                   "LightYellow", "Pink", "Grey")



"W"  <- megaminx[01]  # "White" 
"Pu" <- megaminx[02]  # "Purple" 
"DY" <- megaminx[03]  # "DarkYellow" 
"DB" <- megaminx[04]  # "DarkBlue" 
"R"  <- megaminx[05]  # "Red" 
"DG" <- megaminx[06]  # "DarkGreen" 
"LG" <- megaminx[07]  # "LightGreen" 
"O"  <- megaminx[08]  # "Orange" 
"LB" <- megaminx[09]  # "LightBlue" 
"LY" <- megaminx[10]  # "LightYellow" 
"Pi" <- megaminx[11]  # "Pink" 
"Gy" <- megaminx[12]  # "Grey"; this cannot be 'Gr' as confused with Green. 

megaminx_colours <- noquote(rep("Black",126))
megaminx_colours[010:019] <- "White"
megaminx_colours[020:029] <- "Purple"
megaminx_colours[030:039] <- "DarkYellow"
megaminx_colours[040:049] <- "DarkBlue"
megaminx_colours[050:059] <- "Red"
megaminx_colours[060:069] <- "DarkGreen"
megaminx_colours[070:079] <- "LightGreen"
megaminx_colours[080:089] <- "Orange"
megaminx_colours[090:099] <- "LightBlue"
megaminx_colours[100:109] <- "LightYellow"
megaminx_colours[110:119] <- "Pink"
megaminx_colours[120:129] <- "Grey"

X <- W * Pu^(-1) * W * Pu^2 * DY^(-2) 
Y <- LG^(-1) * DB^(-1) * LB * DG      
Z <- Gy^(-2) * LB * LG^(-1) * Pi^(-1) * LY^(-1)


superflip <- (X^6)^Y * Z^9  # superflip (Jeremy Clark)
rm(X,Y,Z)

save(megaminx,megaminx_colours, "W", "Pu", "DY", "DB", "R", "DG",
"LG", "O", "LB", "LY", "Pi", "Gy", superflip, file="megaminx.rda")
