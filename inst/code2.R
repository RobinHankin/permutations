## See read.me; this file is a derivative of code.R, which contains
## documentation.  This file, 'code_body.R', is like code.R but also
## allows the bodily rotation of the whole megaminx.  And reflections.

## Comments in this file refer to the differences between this file and code.R


source("code.R")   # creates c01..c12 and a01..a12


r01 <-
   'PermutationGroupElement([
     (10,12,14,16,18),
     (11,13,15,17,19),

     (20,32,44,56,68),
     (21,33,45,57,69),
     (22,34,46,58,60),
     (23,35,47,59,61),
     (24,36,48,50,62),
     (25,37,49,51,63),
     (26,38,40,52,64),
     (27,39,41,53,65),
     (28,30,42,54,66),
     (29,31,43,55,67),

     (70,118,106,94,82),
     (71,119,107,95,83),
     (72,110,108,96,84),
     (73,111,109,97,85),
     (74,112,100,98,86),
     (75,113,101,99,87),
     (76,114,102,90,88),
     (77,115,103,91,89),
     (78,116,104,92,80),
     (79,117,105,93,81),

     (120,128,126,124,122),
     (121,129,127,125,123),

     (1002,1003,1004,1005,1006),
     (1007,1011,1010,1009,1008)
     ])'

## Preceding line is the effect on all the facets of bodily rotating
## the megaminx 72 degrees clockwise.  The first group shows the
## five-cycles on the facets of the top face (white usually), the
## second group shows the effect on the upper faces, the third group
## shows the effect on the lower faces, and the last group shows the
## effect on the bottom face (gray, usually).


# face2 = PermutationGroupElement([(3,1,2),(6,8,4),(9,7,5),(10,12,11)]) # rotate 120 degrees about corner of faces 1/2/3


r02 <-
   'PermutationGroupElement([

(10,24,38), (40,62,84), (50,94,72),   (100,128,114),
(11,25,39), (41,63,85), (51,95,73),   (101,129,115),
(12,26,30), (42,64,86), (52,96,74),   (102,120,116),
(13,27,31), (43,65,87), (53,97,75),   (103,121,117),
(14,28,32), (44,66,88), (54,98,76),   (104,122,118),
(15,29,33), (45,67,89), (55,99,77),   (105,123,119),
(16,20,34), (46,68,80), (56,90,78),   (106,124,110),
(17,21,35), (47,69,81), (57,91,79),   (107,125,111),
(18,22,36), (48,60,82), (58,92,70),   (108,126,112),
(19,23,37), (49,61,83), (59,93,71),   (109,127,113),

(1001,1002,1003), (1004,1006,1008), (1009,1007,1005),   (1010,1012,1011)
])'


## in the preceding, the last line is the pentagonal center facet on
## each face.  This is not needed in the megaminx group as the centers
## stay fixed when rotating the faces.  But it is needed here.  I have
## numbered them 1001:1012 because 1:12 and c(10,20,30,...,120) and
## 101:120 would create conflicts.


r03 <-
  'PermutationGroupElement([
    ( 10, 12),( 17, 15),( 18, 14),( 19, 13),
    ( 20, 24),( 21, 23),( 28, 26),( 29, 25),
    (110,114),(111,113),(118,116),(119,115),
    (120,126),(121,125),(122,124),(129,127),

    (30,64),
    (31,63),
    (32,62),
    (33,61),
    (34,60),
    (35,69),
    (36,68),
    (37,67),
    (38,66),
    (39,65),

    (40,54),
    (41,53),
    (42,52),
    (43,51),
    (44,50),
    (45,59),
    (46,58),
    (47,57),
    (48,56),
    (49,55),

    (70,104),
    (71,103),
    (72,102),
    (73,101),
    (74,100),
    (75,109),
    (76,108),
    (77,107),
    (78,106),
    (79,105),

    (80,94),
    (81,93),
    (82,92),
    (83,91),
    (84,90),
    (85,99),
    (86,98),
    (87,97),
    (88,96),
    (89,95),

    (1003,1006),(1004,1005),(1007,1010),(1008,1009)

    ])
'
## In the preceding line, the facets are reflected about a plane.  Put
## the megaminx on the desk with face 1 uppermost, and face 2 towards
## you.  Then the reflection is left-right.


write(paste("r01 = ", r01, sep=""), file=filename,append=TRUE)
write(paste("r02 = ", r02, sep=""), file=filename,append=TRUE)
write(paste("r03 = ", r03, sep=""), file=filename,append=TRUE)


write("megaminx_body      = PermutationGroup([c01,c02,c03,c04,c05,c06,c07,c08,c09,c10,c11,c12,r01,r02    ])",file=filename,append=TRUE)
write("megaminx_body_refl = PermutationGroup([c01,c02,c03,c04,c05,c06,c07,c08,c09,c10,c11,c12,r01,r02,r03])",file=filename,append=TRUE)
## in the preceding, megaminx_body is the new one, megaminx is the same as in code.R



## Some tests would be: (in sage):


## PermutationGroup([r01,r02]).order()  == 60
## PermutationGroup([r01,r02,r03]).order()  == 120


## megaminx.order() / megaminx_body.order() == 12
## megaminx.order() / megaminx_body_refl.order() == 120


## Following should evaluate to TRUE (note that is.normal() is a stronger test than is.subgroup()):

## megaminx.is_normal(megaminx_body)   
## megaminx.is_normal(megaminx_body_refl)
## megaminx_body.is_normal(megaminx_body_refl)



## Following should evaluate to TRUE (note that the corresponding is_normal() test is FALSE):

## PermutationGroup([r01,r02,r03]).is_subgroup(megaminx_body_refl)
## PermutationGroup([r01,r02]).is_subgroup(megaminx_body)

