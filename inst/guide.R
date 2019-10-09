## This file creates a list of (x,y) coordinates of the points on the
## megaminx net.  File "net_coords.txt" is derived from the positions
## of the guidelines in megaminx_net_guides.svg; use something like


## cat megaminx_net_guides.svg | egrep 'position="'

## and then tidy up with emacs.  The numbers are the (x,y) coordinates
## of the guide *label*; I put number '20' in there so the labels
## lined up nicely.  Lines like 'position="248.922,20" are vertical
## guidelines (this one at x=248.922) and lines like
## 'position="20,582.933"' are horizontal guidelines (this one at
## y=582.933).  Use emacs to tidy the format of the egrep command
## above.

library(permutations)
data(megaminx)


a <- read.table("net_coords.txt")
colnames(a) <- c("x","y")

x <- sort(a$x[a$y=='20'])
y <- sort(a$y[a$x=='20'])

pentagons <-  list()
pentagons[[010]] <- cbind(
    x = c(34, 37, 36, 33, 32),
    y = c(26, 25, 24, 24, 25)
)

pentagons[[020]] <- cbind(
    x = c(33, 36, 37, 34, 32),
    y = c(20, 20, 18, 17, 18)
)

pentagons[[030]] <- cbind(
    x = c(17, 21, 23, 19, 16),
    y = c(24, 24, 23, 22, 23)
)

pentagons[[040]] <- cbind(
    x = c(24, 27, 28, 26, 23),
    y = c(30, 30, 29, 28, 29)
)

pentagons[[050]] <- cbind(
    x = c(43, 47, 49, 45, 42),
    y = c(30, 30, 29, 28, 29)
)

pentagons[[060]] <- cbind(
    x = c(50, 53, 54, 52, 49),
    y = c(24, 24, 23, 22, 23)
)

pentagons[[070]] <- cbind(
    x = c(08, 11, 10, 07, 06),
    y = c(10, 09, 08, 08, 09)
)

pentagons[[080]] <- cbind(
    x = c(26, 28, 27, 24, 23),
    y = c(15, 14, 12, 12, 14)
)

pentagons[[090]] <- cbind(
    x = c(41, 44, 43, 39, 37),
    y = c(10, 09, 08, 08, 09)
)

pentagons[[100]] <- cbind(
    x = c(34, 37, 36, 33, 32),
    y = c(04, 03, 02, 02, 03)
)

pentagons[[110]] <- cbind(
    x = c(15, 18, 17, 13, 11),
    y = c(04, 03, 02, 02, 03)
)

pentagons[[120]] <- cbind(
    x = c(24, 27, 28, 26, 23),
    y = c(08, 08, 07, 06, 07)
)        

triangles <- list()
triangles[[010]] <- cbind(
    x = c(30,34,32),
    x = c(27,26,25)
)

triangles[[012]] <- cbind(
    x = c(40,37,34),
    x = c(27,25,26)
)

triangles[[014]] <- cbind(
    x = c(37,43,36),
    x = c(25,24,24)
)

triangles[[016]] <- cbind(
    x = c(33,36,34),
    x = c(24,24,22)
)

triangles[[018]] <- cbind(
    x = c(32,33,27),
    x = c(25,24,24)
)

triangles[[020]] <- cbind(
    x = c(32,33,27),
    x = c(18,20,20)
)

triangles[[022]] <- cbind(
    x = c(34,36,33),
    x = c(22,20,20)
)

triangles[[024]] <- cbind(
    x = c(36,43,37),
    x = c(20,20,18)
)

triangles[[026]] <- cbind(
    x = c(37,40,34),
    x = c(18,16,17)
)

triangles[[028]] <- cbind(
    x = c(32,34,30),
    x = c(18,17,16)
)

triangles[[030]] <- cbind(
    x = c(10,17,16),
    x = c(24,24,23)
)

triangles[[032]] <- cbind(
    x = c(19,21,17),
    x = c(26,24,24)
)

triangles[[034]] <- cbind(
    x = c(21,27,23),
    x = c(24,24,23)
)

triangles[[036]] <- cbind(
    x = c(23,25,19),
    x = c(23,21,22)
)

triangles[[038]] <- cbind(
    x = c(16,19,14),
    x = c(23,22,21)
)

triangles[[040]] <- cbind(
    x = c(17,24,23),
    x = c(30,30,29)
)

triangles[[042]] <- cbind(
    x = c(26,27,24),
    x = c(31,30,30)
)

triangles[[044]] <- cbind(
    x = c(27,33,28),
    x = c(30,30,29)
)

triangles[[046]] <- cbind(
    x = c(28,30,26),
    x = c(29,27,28)
)

triangles[[048]] <- cbind(
    x = c(23,26,20),
    x = c(29,28,27)
)

triangles[[050]] <- cbind(
    x = c(36,43,42),
    x = c(30,30,29)
)

triangles[[052]] <- cbind(
    x = c(45,47,43),
    x = c(31,30,30)
)

triangles[[054]] <- cbind(
    x = c(47,53,49),
    x = c(30,30,29)
)

triangles[[056]] <- cbind(
    x = c(49,51,45),
    x = c(29,27,28)
)

triangles[[058]] <- cbind(
    x = c(42,45,40),
    x = c(29,28,27)
)

triangles[[060]] <- cbind(
    x = c(43,50,49),
    x = c(24,24,23)
)

triangles[[062]] <- cbind(
    x = c(52,53,50),
    x = c(26,24,24)
)

triangles[[064]] <- cbind(
    x = c(53,58,54),
    x = c(24,24,23)
)

triangles[[066]] <- cbind(
    x = c(54,56,52),
    x = c(23,21,22)
)

triangles[[068]] <- cbind(
    x = c(49,52,46),
    x = c(23,22,21)
)

triangles[[070]] <- cbind(
    x = c(04,08,06),
    x = c(11,10,09)
)

triangles[[072]] <- cbind(
    x = c(14,11,08),
    x = c(11,09,10)
)

triangles[[074]] <- cbind(
    x = c(11,17,10),
    x = c(09,08,08)
)

triangles[[076]] <- cbind(
    x = c(07,10,08),
    x = c(08,08,06)
)

triangles[[078]] <- cbind(
    x = c(06,07,02),
    x = c(09,08,08)
)


triangles[[080]] <- cbind(
    x = c(20,26,23),
    x = c(16,15,14)
)

triangles[[082]] <- cbind(
    x = c(30,28,26),
    x = c(16,14,15)
)

triangles[[084]] <- cbind(
    x = c(28,33,27),
    x = c(14,12,12)
)

triangles[[086]] <- cbind(
    x = c(24,27,26),
    x = c(12,12,10)
)

triangles[[088]] <- cbind(
    x = c(23,24,17),
    x = c(14,12,12)
)


triangles[[090]] <- cbind(
    x = c(35,41,37),
    x = c(11,10,09)
)

triangles[[092]] <- cbind(
    x = c(46,44,41),
    x = c(11,09,10)
)

triangles[[094]] <- cbind(
    x = c(44,50,43),
    x = c(09,08,08)
)

triangles[[096]] <- cbind(
    x = c(39,43,41),
    x = c(08,08,06)
)

triangles[[098]] <- cbind(
    x = c(37,39,33),
    x = c(09,08,08)
)


triangles[[100]] <- cbind(
    x = c(30,34,32),
    x = c(05,04,03)
)

triangles[[102]] <- cbind(
    x = c(40,37,34),
    x = c(05,03,04)
)

triangles[[104]] <- cbind(
    x = c(37,43,36),
    x = c(03,02,02)
)

triangles[[106]] <- cbind(
    x = c(33,36,34),
    x = c(02,02,01)
)

triangles[[108]] <- cbind(
    x = c(32,33,27),
    x = c(03,02,02)
)


triangles[[110]] <- cbind(
    x = c(09,15,11),
    x = c(05,04,03)
)

triangles[[112]] <- cbind(
    x = c(20,18,15),
    x = c(05,03,04)
)

triangles[[114]] <- cbind(
    x = c(18,24,17),
    x = c(03,02,02)
)

triangles[[116]] <- cbind(
    x = c(13,17,15),
    x = c(02,02,01)
)

triangles[[118]] <- cbind(
    x = c(11,13,07),
    x = c(03,02,02)
)


triangles[[120]] <- cbind(
    x = c(17,24,23),
    x = c(08,08,07)
)

triangles[[122]] <- cbind(
    x = c(26,27,24),
    x = c(10,08,08)
)

triangles[[124]] <- cbind(
    x = c(27,33,28),
    x = c(08,08,07)
)

triangles[[126]] <- cbind(
    x = c(28,30,26),
    x = c(07,05,06)
)

triangles[[128]] <- cbind(
    x = c(23,26,20),
    x = c(07,06,05)
)

quads <-  list()
quads[[011]] <- cbind(
    x = c(34,40,34,30),
    y = c(28,27,26,27)
)

quads[[013]] <- cbind(
    x = c(40,45,43,37),
    y = c(27,26,24,25)
)

quads[[015]] <- cbind(
    x = c(36,43,41,34),
    y = c(24,24,22,22)
)

quads[[017]] <- cbind(
    x = c(27,33,34,29),
    y = c(24,24,22,22)
)

quads[[019]] <- cbind(
    x = c(30,32,27,26),
    y = c(27,25,24,26)
)

quads[[021]] =cbind(
    x = c(29,34,33,27),
    y = c(22,22,20,20)
)

quads[[023]] =cbind(
    x = c(34,41,43,36),
    y = c(22,22,20,20)
)

quads[[025]] =cbind(
    x = c(43,45,40,37),
    y = c(20,17,16,18)
)

quads[[027]] =cbind(
    x = c(34,40,34,30),
    y = c(17,16,15,16)
)

quads[[029]] =cbind(
    x = c(27,32,30,26),
    y = c(20,18,16,17)
)

quads[[031]] =cbind(
    x = c(12,19,17,10),
    y = c(26,26,24,24)
)

quads[[033]] =cbind(
    x = c(19,26,27,21),
    y = c(26,26,24,24)
)

quads[[035]] =cbind(
    x = c(27,29,25,23),
    y = c(24,22,21,23)
)

quads[[037]] =cbind(
    x = c(19,25,19,14),
    y = c(22,21,19,21)
)

quads[[039]] =cbind(
    x = c(10,16,14,08),
    y = c(24,23,21,22)
)

quads[[041]] =cbind(
    x = c(19,26,24,17),
    y = c(31,31,30,30)
)

quads[[043]] =cbind(
    x = c(26,31,33,27),
    y = c(31,31,30,30)
)

quads[[045]] =cbind(
    x = c(33,34,30,28),
    y = c(30,28,27,29)
)

quads[[047]] =cbind(
    x = c(26,30,26,20),
    y = c(28,27,26,27)
)

quads[[049]] =cbind(
    x = c(17,23,20,15),
    y = c(30,29,27,28)
)

quads[[051]] =cbind(
    x = c(38,45,43,36),
    y = c(31,31,30,30)
)

quads[[053]] =cbind(
    x = c(45,52,53,47),
    y = c(31,31,30,30)
)

quads[[055]] =cbind(
    x = c(53,55,51,49),
    y = c(30,28,27,29)
)

quads[[057]] =cbind(
    x = c(45,51,45,40),
    y = c(28,27,26,27)
)

quads[[059]] =cbind(
    x = c(36,42,40,34),
    y = c(30,29,27,28)
)

quads[[061]] =cbind(
    x = c(45,52,50,43),
    y = c(26,26,24,24)
)

quads[[063]] =cbind(
    x = c(52,57,58,53),
    y = c(26,26,24,24)
)

quads[[065]] =cbind(
    x = c(58,59,56,54),
    y = c(24,22,21,23)
)

quads[[067]] =cbind(
    x = c(52,56,52,46),
    y = c(22,21,19,21)
)

quads[[069]] =cbind(
    x = c(43,49,46,41),
    y = c(24,23,21,22)
)

quads[[071]] =cbind(
    x = c(08,14,08,04),
    y = c(13,11,10,11)
)

quads[[073]] =cbind(
    x = c(14,19,17,11),
    y = c(11,10,08,09)
)

quads[[075]] =cbind(
    x = c(10,17,15,08),
    y = c(08,08,06,06)
)

quads[[077]] =cbind(
    x = c(02,07,08,03),
    y = c(08,08,06,06)
)

quads[[079]] =cbind(
    x = c(04,06,02,01),
    y = c(11,09,08,10)
)

quads[[081]] =cbind(
    x = c(26,30,26,20),
    y = c(17,16,15,16)
)

quads[[083]] =cbind(
    x = c(30,34,33,28),
    y = c(16,15,12,14)
)

quads[[085]] =cbind(
    x = c(27,33,31,26),
    y = c(12,12,10,10)
)

quads[[087]] =cbind(
    x = c(17,24,26,19),
    y = c(12,12,10,10)
)

quads[[089]] =cbind(
    x = c(20,23,17,15),
    y = c(16,14,12,15)
)

quads[[091]] =cbind(
    x = c(41,46,41,35),
    y = c(13,11,10,11)
)

quads[[093]] =cbind(
    x = c(46,52,50,44),
    y = c(11,10,08,09)
)

quads[[095]] =cbind(
    x = c(43,50,48,41),
    y = c(08,08,06,06)
)

quads[[097]] =cbind(
    x = c(33,39,41,34),
    y = c(08,08,06,06)
)

quads[[099]] =cbind(
    x = c(35,37,33,31),
    y = c(11,09,08,10)
)

quads[[101]] =cbind(
    x = c(34,40,34,30),
    y = c(06,05,04,05)
)

quads[[103]] =cbind(
    x = c(40,45,43,37),
    y = c(05,04,02,03)
)

quads[[105]] =cbind(
    x = c(36,43,41,34),
    y = c(02,02,01,01)
)

quads[[107]] =cbind(
    x = c(27,33,34,29),
    y = c(02,02,01,01)
)

quads[[109]] =cbind(
    x = c(30,32,27,26),
    y = c(05,03,02,04)
)

quads[[111]] =cbind(
    x = c(15,20,15,09),
    y = c(06,05,04,05)
)

quads[[113]] =cbind(
    x = c(20,26,24,18),
    y = c(05,04,02,03)
)

quads[[115]] =cbind(
    x = c(17,24,22,15),
    y = c(02,02,01,01)
)

quads[[117]] =cbind(
    x = c(07,13,15,08),
    y = c(02,02,01,01)
)

quads[[119]] =cbind(
    x = c(09,11,07,05),
    y = c(05,03,02,04)
)

quads[[121]] =cbind(
    x = c(19,26,24,17),
    y = c(10,10,08,08)
)

quads[[123]] =cbind(
    x = c(26,31,33,27),
    y = c(10,10,08,08)
)

quads[[125]] =cbind(
    x = c(33,34,30,28),
    y = c(08,06,05,07)
)

quads[[127]] =cbind(
    x = c(26,30,26,20),
    y = c(06,05,04,05)
)

quads[[129]] =cbind(
    x = c(17,23,20,15),
    y = c(08,07,05,06)

)

n_pent <- 12
n_tri <- 60
n_quad <- 60


f <- function(o){
    o[,1] <- x[o[,1]]
    o[,2] <- y[o[,2]]
    return(o)
}


pentagons <- lapply(pentagons ,f)
triangles <- lapply(triangles ,f)
quads <- lapply(quads ,f)

plot(c(0,1000), c(0,1000), type="n",asp=1,axes=FALSE,xlab="",ylab="")

poly_num <- function(x,n,...){
    polygon(x,...)
    text(mean(x[,1]),mean(x[,2]),n,cex=0.4)
}

m <- megaminx_colours
m[m=="DarkYellow"] <- "gold"
mm <- m[as.word(LY,129)]

for(i in seq_along(pentagons)){
    print(i)
    jj <- pentagons[[i]]
    if(!is.null(jj)){
        poly_num(jj,n=i,col=m[i])
    }
}

for(i in seq_along(triangles)){
    jj <- triangles[[i]]
    if(!is.null(jj)){
        poly_num(jj,n=i,col=mm[i])
    }
}

for(i in seq_along(quads)){
    jj <- quads[[i]]
    if(!is.null(jj)){
        poly_num(jj,n=i,col=mm[i])
    }
}

   
