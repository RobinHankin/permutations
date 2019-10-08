a <- read.table("n.txt")
colnames(a) <- c("x","y")

x <- sort(a$x[a$y=='20'])
y <- sort(a$y[a$x=='20'])

pentagons <-  list(
    '010' = cbind(
        x = c(34, 37, 36, 33, 32),
        y = c(26, 25, 24, 24, 25)
        ),
    '020' = cbind(
        x = c(33, 36, 37, 34, 32),
        y = c(20, 20, 18, 17, 18)
        ),
    '030' = cbind(
        x = c(17, 21, 23, 19, 16),
        y = c(24, 24, 23, 22, 23)
        ),
    '040' = cbind(
        x = c(24, 27, 28, 26, 23),
        y = c(30, 30, 29, 28, 29)
        ),
    '050' = cbind(
        x = c(43, 47, 49, 45, 42),
        y = c(30, 30, 29, 28, 29)
        ),
    '060' = cbind(
        x = c(50, 53, 54, 52, 49),
        y = c(24, 24, 23, 22, 23)
        ),
    '070' = cbind(
        x = c(08, 11, 10, 07, 06),
        y = c(10, 09, 08, 08, 09)
        ),
    '080' = cbind(
        x = c(26, 28, 27, 24, 23),
        y = c(15, 14, 12, 12, 14)
        ),
    '090' = cbind(
        x = c(41, 44, 43, 39, 37),
        y = c(10, 09, 08, 08, 09)
        ),
    '100' = cbind(
        x = c(34, 37, 36, 33, 32),
        y = c(04, 03, 02, 02, 03)
        ),
    '110' = cbind(
        x = c(15, 18, 17, 13, 11),
        y = c(04, 03, 02, 02, 03)
        ),
    '120' = cbind(
        x = c(24, 27, 28, 26, 23),
        y = c(08, 08, 07, 06, 07)
        )
) # pentagons <- closes

triangles <- list(
    '010' = cbind(
        x = c(30,34,32),
        x = c(27,26,25)
    ),
    '012' = cbind(
        x = c(40,37,34),
        x = c(27,25,26)
    ),
    '014' = cbind(
        x = c(37,43,36),
        x = c(25,24,24)
    ),
    '016' = cbind(
        x = c(33,36,34),
        x = c(24,24,22)
    ),
    '018' = cbind(
        x = c(32,33,27),
        x = c(25,24,24)
    ),

    '020' = cbind(
        x = c(32,33,27),
        x = c(18,20,20)
    ),
    '022' = cbind(
        x = c(34,36,33),
        x = c(22,20,20)
    ),
    '024' = cbind(
        x = c(36,43,37),
        x = c(20,20,18)
    ),
    '026' = cbind(
        x = c(37,40,34),
        x = c(18,16,17)
    ),
    '028' = cbind(
        x = c(32,34,30),
        x = c(18,17,16)
    ),

    '030' = cbind(
        x = c(10,17,16),
        x = c(24,24,23)
    ),
    '032' = cbind(
        x = c(19,21,17),
        x = c(26,24,24)
    ),
    '034' = cbind(
        x = c(21,27,23),
        x = c(24,24,23)
    ),
    '036' = cbind(
        x = c(23,25,19),
        x = c(23,21,22)
    ),
    '038' = cbind(
        x = c(16,19,14),
        x = c(23,22,21)
    ),

    '040' = cbind(
        x = c(17,24,23),
        x = c(30,30,29)
    ),
    '042' = cbind(
        x = c(26,27,24),
        x = c(31,30,30)
    ),
    '044' = cbind(
        x = c(27,33,28),
        x = c(30,30,29)
    ),
    '046' = cbind(
        x = c(28,30,26),
        x = c(29,27,28)
    ),
    '048' = cbind(
        x = c(23,26,20),
        x = c(29,28,27)
    ),

    '050' = cbind(
        x = c(36,43,42),
        x = c(30,30,29)
    ),
    '052' = cbind(
        x = c(45,47,43),
        x = c(31,30,30)
    ),
    '054' = cbind(
        x = c(47,53,49),
        x = c(30,30,29)
    ),
    '056' = cbind(
        x = c(49,51,45),
        x = c(29,27,28)
    ),
    '058' = cbind(
        x = c(42,45,40),
        x = c(29,28,27)
    ),

    '060' = cbind(
        x = c(43,50,49),
        x = c(24,24,23)
    ),
    '062' = cbind(
        x = c(52,53,50),
        x = c(26,24,24)
    ),
    '064' = cbind(
        x = c(53,58,54),
        x = c(24,24,23)
    ),
    '066' = cbind(
        x = c(54,56,52),
        x = c(23,21,22)
    ),
    '068' = cbind(
        x = c(49,52,46),
        x = c(23,22,21)
    ),

    '070' = cbind(
        x = c(04,08,06),
        x = c(11,10,09)
    ),
    '072' = cbind(
        x = c(14,11,08),
        x = c(11,09,10)
    ),
    '074' = cbind(
        x = c(11,17,10),
        x = c(09,08,08)
    ),
    '076' = cbind(
        x = c(07,10,08),
        x = c(08,08,06)
    ),
    '078' = cbind(
        x = c(06,07,02),
        x = c(09,08,08)
    ),

    '080' = cbind(
        x = c(20,26,23),
        x = c(16,15,14)
    ),
    '082' = cbind(
        x = c(30,28,26),
        x = c(16,14,15)
    ),
    '084' = cbind(
        x = c(28,33,27),
        x = c(14,12,12)
    ),
    '086' = cbind(
        x = c(24,27,26),
        x = c(12,12,10)
    ),
    '088' = cbind(
        x = c(23,24,17),
        x = c(14,12,12)
    ),

    '090' = cbind(
        x = c(35,41,37),
        x = c(11,10,09)
    ),
    '092' = cbind(
        x = c(46,44,41),
        x = c(11,09,10)
    ),
    '094' = cbind(
        x = c(44,50,43),
        x = c(09,08,08)
    ),
    '096' = cbind(
        x = c(39,43,41),
        x = c(08,08,06)
    ),
    '098' = cbind(
        x = c(37,39,33),
        x = c(09,08,08)
    ),

    '100' = cbind(
        x = c(30,34,32),
        x = c(05,04,03)
    ),
    '102' = cbind(
        x = c(40,37,34),
        x = c(05,03,04)
    ),
    '104' = cbind(
        x = c(37,43,36),
        x = c(03,02,02)
    ),
    '106' = cbind(
        x = c(33,36,34),
        x = c(02,02,01)
    ),
    '108' = cbind(
        x = c(32,33,27),
        x = c(03,02,02)
    ),

    '110' = cbind(
        x = c(09,15,11),
        x = c(05,04,03)
    ),
    '112' = cbind(
        x = c(20,18,15),
        x = c(05,03,04)
    ),
    '114' = cbind(
        x = c(18,24,17),
        x = c(03,02,02)
    ),
    '116' = cbind(
        x = c(13,17,15),
        x = c(02,02,01)
    ),
    '118' = cbind(
        x = c(11,13,07),
        x = c(03,02,02)
    ),

    '120' = cbind(
        x = c(17,24,23),
        x = c(08,08,07)
    ),
    '122' = cbind(
        x = c(26,27,24),
        x = c(10,08,08)
    ),
    '124' = cbind(
        x = c(27,33,28),
        x = c(08,08,07)
    ),
    '126' = cbind(
        x = c(28,30,26),
        x = c(07,05,06)
    ),
    '128' = cbind(
        x = c(23,26,20),
        x = c(07,06,05)
    )
)


quads <-  list(
    '011' = cbind(
        x = c(34,40,34,30),
        y = c(28,27,26,27)
    ),
    '013' = cbind(
        x = c(40,45,43,37),
        y = c(27,26,24,25)
    ),
    '015' = cbind(
        x = c(36,43,41,34),
        y = c(24,24,22,22)
    ),
    '017' = cbind(
        x = c(27,33,34,29),
        y = c(24,24,22,22)
    ),
    '019' = cbind(
        x = c(30,32,27,26),
        y = c(27,25,24,26)
    ),
    '021' =cbind(
        x = c(29,34,33,27),
        y = c(22,22,20,20)
    ),
    '023' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '025' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '027' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '029' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '031' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '033' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '035' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '037' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '039' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '041' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '043' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '045' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '047' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '049' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '051' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '053' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '055' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '057' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '059' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '061' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '063' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '065' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '067' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '069' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '071' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '073' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '075' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '077' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '079' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '081' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '083' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '085' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '087' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '089' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '091' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '093' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '095' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '097' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '099' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '101' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '103' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '105' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '107' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '109' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '111' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '113' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '115' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '117' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '119' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '121' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '123' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '125' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '127' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    ),
    '129' =cbind(
        x = c(NA,NA,NA,NA),
        y = c(NA,NA,NA,NA)
    )
    )





















n_pent <- 12
n_tri <- 60
n_quad <- 6







f <- function(o){
  o[,1] <- x[o[,1]]
  o[,2] <- y[o[,2]]
  return(o)
}


pentagons <- lapply(pentagons ,f)
triangles <- lapply(triangles ,f)

jj <- list()
for(i in seq_len(n_quad)){
  jj[[i]] <- quads[[i]]
}
quads <- jj
quads <- lapply(quads ,f)

plot( c(0,1000),    c(0,1000),type="n",asp=1)

for(i in seq_len(n_pent)){
  polygon(pentagons[[i]],col=rainbow(n_pent)[i])
}

for(i in seq_len(n_tri)){
  polygon(triangles[[i]],col=rainbow(n_tri)[i])
}

for(i in seq_len(n_quad)){
  polygon(quads[[i]],col=rainbow(n_quad)[i])
}
