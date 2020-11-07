# See read.me

# This file, 'code.R', is an R batch file that converts the table in
# data.txt into sage commands that create the megaminx group.  It
# writes the sage commands to a file called "megaminx.py" which can be
# read by sage.

# Most of the dicking about with commas and brackets is to include
# correct sage syntax in megaminx.py

# This file is called by code2.R which adds solid-body rotation and
# reflection functionality to megaminx.py

# The last few lines (which create the superflip) appear in
# jeremy_clark.txt and indeed megaminx.Rd in the package.

# This file may easily be modified to create the kilominx group
# instead of the megaminx group.  Function f() reads file 'data.txt'
# but by commenting out two lines we effectively ignore the edges
# [which have even-numbered facets] and create the kilominx group
# instead.  If you do this, it might be a good idea to change the
# filename from "megaminx.py" to "kilominx.py"; also look at the
# commented lines at the bottom which distinguish kilo- from mega-.

  filename <- "megaminx.py"
# filename <- "kilominx.py"

write(paste("# This file is not intended to be human-readable; it is readable by sage.  It is created by executing 'code.R'"),
            file=filename, append=FALSE)

a <- as.matrix(read.table("data.txt"),header=FALSE)


comma <- ","
open  <- "("
close <- ")"
opensquare <- "["
closesquare <- "]"


putcommas <- function(s){
  jj <- cbind(s,",")
  jj <- c(t(jj))
## remove final comma:
  jj <- jj[-length(jj)]
  paste(jj,collapse="")
}

f <- function(x){
  paste(c(
          opensquare,
          open,putcommas(x[ 1: 5]),close,comma,  # comment out this line for kilominx
          open,putcommas(x[ 6:10]),close,comma,
          open,putcommas(x[11:15]),close,comma,
          open,putcommas(x[16:20]),close,comma,  # comment out this line for kilominx
          open,putcommas(x[21:25]),close,
          closesquare),collapse="")
}

middlebit <- NULL
for(i in 1:11){
  middlebit <- paste(middlebit,f(a[i,]),comma)
}

jj <- " = PermutationGroupElement"

write(paste("c01", jj, open, f(a[ 1,]),close,sep=""),file=filename,append=TRUE)
write(paste("c02", jj, open, f(a[ 2,]),close,sep=""),file=filename,append=TRUE)
write(paste("c03", jj, open, f(a[ 3,]),close,sep=""),file=filename,append=TRUE)
write(paste("c04", jj, open, f(a[ 4,]),close,sep=""),file=filename,append=TRUE)
write(paste("c05", jj, open, f(a[ 5,]),close,sep=""),file=filename,append=TRUE)
write(paste("c06", jj, open, f(a[ 6,]),close,sep=""),file=filename,append=TRUE)
write(paste("c07", jj, open, f(a[ 7,]),close,sep=""),file=filename,append=TRUE)
write(paste("c08", jj, open, f(a[ 8,]),close,sep=""),file=filename,append=TRUE)
write(paste("c09", jj, open, f(a[ 9,]),close,sep=""),file=filename,append=TRUE)
write(paste("c10", jj, open, f(a[10,]),close,sep=""),file=filename,append=TRUE)
write(paste("c11", jj, open, f(a[11,]),close,sep=""),file=filename,append=TRUE)
write(paste("c12", jj, open, f(a[12,]),close,sep=""),file=filename,append=TRUE)

write("
a01 = c01.inverse()
a02 = c02.inverse()
a03 = c03.inverse()
a04 = c04.inverse()
a05 = c05.inverse()
a06 = c06.inverse()
a07 = c07.inverse()
a08 = c08.inverse()
a09 = c09.inverse()
a10 = c10.inverse()
a11 = c11.inverse()
a12 = c12.inverse()
",file=filename,append=TRUE)

  write("megaminx = PermutationGroup([c01,c02,c03,c04,c05,c06,c07,c08,c09,c10,c11,c12])",file=filename,append=TRUE)
# write("kilominx = PermutationGroup([c01,c02,c03,c04,c05,c06,c07,c08,c09,c10,c11,c12])",file=filename,append=TRUE)


  write("superflip = megaminx.center().gens()[0]",file=filename,append=TRUE)
# write("superflip = kilominx.center().gens()[0]",file=filename,append=TRUE)  # kilominx has trivial center

write("big = c01*c02*c03*c04*c05*c06*c07*c08*c09*c10*c11*c12",file=filename,append=TRUE) # moves every facet
write("(a06*a09*c04*c07)*(c01*a02*c01*c02^2*a03^2)^6*(a07*a04*c09*c06)*(a12^2*c09*a07*a11*a10)^9",file=filename,append=TRUE)


