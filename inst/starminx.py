## This file uses sage idiom to create a group that corresponds to 


## Following three lines calculate the dodecahedron group by faces
## (loads of documentation in file 'dodecahedron_group.py' and
## 'full_dodecahedron_group.py').

face1 = PermutationGroupElement([(2,3,4,5,6),(7,11,10,9,8)]) 
face2 = PermutationGroupElement([(3,1,2),(6,8,4),(9,7,5),(10,12,11)])
face_reflect = PermutationGroupElement([(3,6),(4,5),(8,9),(7,10)]) 

dod_face  = PermutationGroup([face1,face2])
full_dod_face  = PermutationGroup([face1,face2,face_reflect])

corner01 = PermutationGroupElement([( 1, 2, 3)])
corner02 = PermutationGroupElement([( 1, 3, 4)])
corner03 = PermutationGroupElement([( 1, 4, 5)])
corner04 = PermutationGroupElement([( 1, 5, 6)])
corner05 = PermutationGroupElement([( 1, 6, 2)])
 ## another 10 here...
corner06 = PermutationGroupElement([(12, 7, 8)])
corner07 = PermutationGroupElement([(12, 8, 9)])
corner08 = PermutationGroupElement([(12, 9,10)])
corner09 = PermutationGroupElement([(12,10,11)])
corner10 = PermutationGroupElement([(12,11, 7)])

# Then starminx is the group generated by moves above
dod_face  = PermutationGroup([
    corner01,
    corner02,
    corner03,
    corner04,
    corner05,
    corner06,
    corner07,
    corner08,
    corner09,
    corner10])
