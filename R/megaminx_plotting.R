`megaminx_plotter` <- function(megperm=id){ # megaminx_plotter(LY*R)"

  `megaminx_colours` <-
    structure(c("Black", "Black", "Black", "Black", "Black", "Black", 
                "Black", "Black", "Black", "White", "White", "White", "White", 
                "White", "White", "White", "White", "White", "White", "Purple", 
                "Purple", "Purple", "Purple", "Purple", "Purple", "Purple", "Purple", 
                "Purple", "Purple", "DarkYellow", "DarkYellow", "DarkYellow", 
                "DarkYellow", "DarkYellow", "DarkYellow", "DarkYellow", "DarkYellow", 
                "DarkYellow", "DarkYellow", "DarkBlue", "DarkBlue", "DarkBlue", 
                "DarkBlue", "DarkBlue", "DarkBlue", "DarkBlue", "DarkBlue", "DarkBlue", 
                "DarkBlue", "Red", "Red", "Red", "Red", "Red", "Red", "Red", 
                "Red", "Red", "Red", "DarkGreen", "DarkGreen", "DarkGreen", "DarkGreen", 
                "DarkGreen", "DarkGreen", "DarkGreen", "DarkGreen", "DarkGreen", 
                "DarkGreen", "LightGreen", "LightGreen", "LightGreen", "LightGreen", 
                "LightGreen", "LightGreen", "LightGreen", "LightGreen", "LightGreen", 
                "LightGreen", "Orange", "Orange", "Orange", "Orange", "Orange", 
                "Orange", "Orange", "Orange", "Orange", "Orange", "LightBlue", 
                "LightBlue", "LightBlue", "LightBlue", "LightBlue", "LightBlue", 
                "LightBlue", "LightBlue", "LightBlue", "LightBlue", "LightYellow", 
                "LightYellow", "LightYellow", "LightYellow", "LightYellow", "LightYellow", 
                "LightYellow", "LightYellow", "LightYellow", "LightYellow", "Pink", 
                "Pink", "Pink", "Pink", "Pink", "Pink", "Pink", "Pink", "Pink", 
                "Pink", "Grey", "Grey", "Grey", "Grey", "Grey", "Grey", "Grey", 
                "Grey", "Grey", "Grey"), class = "noquote")

`megaminx_pentagons` <-
list(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, structure(c(439.936, 
472.414, 459.892, 419.772, 407.144, 831.498, 807.705, 769.246, 
769.246, 807.705), .Dim = c(5L, 2L), .Dimnames = list(NULL, c("x", 
"y"))), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    structure(c(419.772, 459.892, 472.414, 439.936, 407.144, 
    645.254, 645.254, 607.171, 582.933, 607.171), .Dim = c(5L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, structure(c(248.922, 
    289.137, 301.68, 269.077, 236.3, 769.246, 769.246, 730.888, 
    707.232, 730.888), .Dim = c(5L, 2L), .Dimnames = list(NULL, 
        c("x", "y"))), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, structure(c(314.126, 354.517, 366.985, 334.274, 
    301.68, 970.16, 970.16, 931.802, 908.015, 931.802), .Dim = c(5L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, structure(c(525.147, 
    565.557, 578.025, 545.37, 512.72, 970.16, 970.16, 931.802, 
    908.015, 931.802), .Dim = c(5L, 2L), .Dimnames = list(NULL, 
        c("x", "y"))), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, structure(c(589.991, 630.812, 643.296, 610.641, 
    578.025, 769.246, 769.246, 730.888, 707.232, 730.888), .Dim = c(5L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, structure(c(163.294, 
    195.934, 183.541, 143.132, 130.664, 382.312, 358.615, 320.397, 
    320.397, 358.615), .Dim = c(5L, 2L), .Dimnames = list(NULL, 
        c("x", "y"))), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, structure(c(334.274, 366.985, 354.517, 314.126, 
    301.68, 506.617, 482.199, 444.245, 444.245, 482.199), .Dim = c(5L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, structure(c(505.054, 
    537.428, 525.147, 484.876, 472.414, 382.312, 358.615, 320.397, 
    320.397, 358.615), .Dim = c(5L, 2L), .Dimnames = list(NULL, 
        c("x", "y"))), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, structure(c(439.936, 472.414, 459.892, 419.772, 
    407.144, 181.2, 157.751, 119.235, 119.235, 157.751), .Dim = c(5L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, NULL, structure(c(228.742, 
    261.306, 248.922, 208.438, 195.934, 181.2, 157.751, 119.235, 
    119.235, 157.751), .Dim = c(5L, 2L), .Dimnames = list(NULL, 
        c("x", "y"))), NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    NULL, NULL, structure(c(314.126, 354.517, 366.985, 334.274, 
    301.68, 320.397, 320.397, 281.802, 258.135, 281.802), .Dim = c(5L, 
    2L), .Dimnames = list(NULL, c("x", "y"))))

`megaminx_triangles` <-
list(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, structure(c(387.177, 
439.936, 407.144, 869.706, 831.498, 807.705), .Dim = 3:2, .Dimnames = list(
    NULL, c("x", "x"))), NULL, structure(c(492.505, 472.414, 
439.936, 869.706, 807.705, 831.498), .Dim = 3:2, .Dimnames = list(
    NULL, c("x", "x"))), NULL, structure(c(472.414, 525.147, 
459.892, 807.705, 769.246, 769.246), .Dim = 3:2, .Dimnames = list(
    NULL, c("x", "x"))), NULL, structure(c(419.772, 459.892, 
439.936, 769.246, 769.246, 707.232), .Dim = 3:2, .Dimnames = list(
    NULL, c("x", "x"))), NULL, structure(c(407.144, 419.772, 
354.517, 807.705, 769.246, 769.246), .Dim = 3:2, .Dimnames = list(
    NULL, c("x", "x"))), NULL, structure(c(407.144, 419.772, 
354.517, 607.171, 645.254, 645.254), .Dim = 3:2, .Dimnames = list(
    NULL, c("x", "x"))), NULL, structure(c(439.936, 459.892, 
419.772, 707.232, 645.254, 645.254), .Dim = 3:2, .Dimnames = list(
    NULL, c("x", "x"))), NULL, structure(c(459.892, 525.147, 
472.414, 645.254, 645.254, 607.171), .Dim = 3:2, .Dimnames = list(
    NULL, c("x", "x"))), NULL, structure(c(472.414, 492.505, 
439.936, 607.171, 545.006, 582.933), .Dim = 3:2, .Dimnames = list(
    NULL, c("x", "x"))), NULL, structure(c(407.144, 439.936, 
387.177, 607.171, 582.933, 545.006), .Dim = 3:2, .Dimnames = list(
    NULL, c("x", "x"))), NULL, structure(c(183.541, 248.922, 
236.3, 769.246, 769.246, 730.888), .Dim = 3:2, .Dimnames = list(
    NULL, c("x", "x"))), NULL, structure(c(269.077, 289.137, 
248.922, 831.498, 769.246, 769.246), .Dim = 3:2, .Dimnames = list(
    NULL, c("x", "x"))), NULL, structure(c(289.137, 354.517, 
301.68, 769.246, 769.246, 730.888), .Dim = 3:2, .Dimnames = list(
    NULL, c("x", "x"))), NULL, structure(c(301.68, 321.797, 269.077, 
730.888, 668.793, 707.232), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(236.3, 269.077, 216.14, 
730.888, 707.232, 668.793), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(248.922, 314.126, 301.68, 
970.16, 970.16, 931.802), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(334.274, 354.517, 314.126, 
1032.358, 970.16, 970.16), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(354.517, 419.772, 366.985, 
970.16, 970.16, 931.802), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(366.985, 387.177, 334.274, 
931.802, 869.706, 908.015), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(301.68, 334.274, 281.518, 
931.802, 908.015, 869.706), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(459.892, 525.147, 512.72, 
970.16, 970.16, 931.802), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(545.37, 565.557, 525.147, 
1032.358, 970.16, 970.16), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(565.557, 630.812, 578.025, 
970.16, 970.16, 931.802), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(578.025, 598.199, 545.37, 
931.802, 869.706, 908.015), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(512.72, 545.37, 492.505, 
931.802, 908.015, 869.706), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(525.147, 589.991, 578.025, 
769.246, 769.246, 730.888), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(610.641, 630.812, 589.991, 
831.498, 769.246, 769.246), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(630.812, 696.084, 643.296, 
769.246, 769.246, 730.888), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(643.296, 663.47, 610.641, 
730.888, 668.793, 707.232), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(578.025, 610.641, 557.83, 
730.888, 707.232, 668.793), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(110.529, 163.294, 130.664, 
420.631, 382.312, 358.615), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(216.14, 195.934, 163.294, 
420.631, 358.615, 382.312), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(195.934, 248.922, 183.541, 
358.615, 320.397, 320.397), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(143.132, 183.541, 163.294, 
320.397, 320.397, 258.135), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(130.664, 143.132, 77.856, 
358.615, 320.397, 320.397), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(281.518, 334.274, 301.68, 
545.006, 506.617, 482.199), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(387.177, 366.985, 334.274, 
545.006, 482.199, 506.617), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(366.985, 419.772, 354.517, 
482.199, 444.245, 444.245), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(314.126, 354.517, 334.274, 
444.245, 444.245, 382.312), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(301.68, 314.126, 248.922, 
482.199, 444.245, 444.245), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(452.412, 505.054, 472.414, 
420.631, 382.312, 358.615), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(557.83, 537.428, 505.054, 
420.631, 358.615, 382.312), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(537.428, 589.991, 525.147, 
358.615, 320.397, 320.397), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(484.876, 525.147, 505.054, 
320.397, 320.397, 258.135), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(472.414, 484.876, 419.772, 
358.615, 320.397, 320.397), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(387.177, 439.936, 407.144, 
219.659, 181.2, 157.751), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(492.505, 472.414, 439.936, 
219.659, 157.751, 181.2), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(472.414, 525.147, 459.892, 
157.751, 119.235, 119.235), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(419.772, 459.892, 439.936, 
119.235, 119.235, 57.295), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(407.144, 419.772, 354.517, 
157.751, 119.235, 119.235), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(175.841, 228.742, 195.934, 
219.659, 181.2, 157.751), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(281.518, 261.306, 228.742, 
219.659, 157.751, 181.2), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(261.306, 314.126, 248.922, 
157.751, 119.235, 119.235), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(208.438, 248.922, 228.742, 
119.235, 119.235, 57.295), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(195.934, 208.438, 143.132, 
157.751, 119.235, 119.235), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(248.922, 314.126, 301.68, 
320.397, 320.397, 281.802), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(334.274, 354.517, 314.126, 
382.312, 320.397, 320.397), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(354.517, 419.772, 366.985, 
320.397, 320.397, 281.802), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(366.985, 387.177, 334.274, 
281.802, 219.659, 258.135), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))), NULL, structure(c(301.68, 334.274, 281.518, 
281.802, 258.135, 219.659), .Dim = 3:2, .Dimnames = list(NULL, 
    c("x", "x"))))

`megaminx_quads` <-
list(NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    structure(c(439.936, 492.505, 439.936, 387.177, 908.015, 
    869.706, 831.498, 869.706), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(492.505, 545.37, 
    525.147, 472.414, 869.706, 831.498, 769.246, 807.705), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(459.892, 
    525.147, 505.054, 439.936, 769.246, 769.246, 707.232, 707.232
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(354.517, 419.772, 439.936, 374.451, 769.246, 
    769.246, 707.232, 707.232), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(387.177, 407.144, 
    354.517, 334.274, 869.706, 807.705, 769.246, 831.498), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(374.451, 
    439.936, 419.772, 354.517, 707.232, 707.232, 645.254, 645.254
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(439.936, 505.054, 525.147, 459.892, 707.232, 
    707.232, 645.254, 645.254), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(525.147, 545.37, 
    492.505, 472.414, 645.254, 582.933, 545.006, 607.171), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(439.936, 
    492.505, 439.936, 387.177, 582.933, 545.006, 506.617, 545.006
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(354.517, 407.144, 387.177, 334.274, 645.254, 
    607.171, 545.006, 582.933), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(203.697, 269.077, 
    248.922, 183.541, 831.498, 831.498, 769.246, 769.246), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(269.077, 
    334.274, 354.517, 289.137, 831.498, 831.498, 769.246, 769.246
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(354.517, 374.451, 321.797, 301.68, 769.246, 
    707.232, 668.793, 730.888), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(269.077, 321.797, 
    269.077, 216.14, 707.232, 668.793, 630.503, 668.793), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(183.541, 
    236.3, 216.14, 163.294, 769.246, 730.888, 668.793, 707.232
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(269.077, 334.274, 314.126, 248.922, 1032.358, 
    1032.358, 970.16, 970.16), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(334.274, 399.601, 
    419.772, 354.517, 1032.358, 1032.358, 970.16, 970.16), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(419.772, 
    439.936, 387.177, 366.985, 970.16, 908.015, 869.706, 931.802
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(334.274, 387.177, 334.274, 281.518, 908.015, 
    869.706, 831.498, 869.706), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(248.922, 301.68, 
    281.518, 228.742, 970.16, 931.802, 869.706, 908.015), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(480.115, 
    545.37, 525.147, 459.892, 1032.358, 1032.358, 970.16, 970.16
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(545.37, 610.641, 630.812, 565.557, 1032.358, 
    1032.358, 970.16, 970.16), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(630.812, 650.976, 
    598.199, 578.025, 970.16, 908.015, 869.706, 931.802), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(545.37, 
    598.199, 545.37, 492.505, 908.015, 869.706, 831.498, 869.706
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(459.892, 512.72, 492.505, 439.936, 970.16, 
    931.802, 869.706, 908.015), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(545.37, 610.641, 
    589.991, 525.147, 831.498, 831.498, 769.246, 769.246), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(610.641, 
    675.913, 696.084, 630.812, 831.498, 831.498, 769.246, 769.246
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(696.084, 716.247, 663.47, 643.296, 769.246, 
    707.232, 668.793, 730.888), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(610.641, 663.47, 
    610.641, 557.83, 707.232, 668.793, 630.503, 668.793), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(525.147, 
    578.025, 557.83, 505.054, 769.246, 730.888, 668.793, 707.232
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(163.294, 216.14, 163.294, 110.529, 458.993, 
    420.631, 382.312, 420.631), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(216.14, 269.077, 
    248.922, 195.934, 420.631, 382.312, 320.397, 358.615), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(183.541, 
    248.922, 228.742, 163.294, 320.397, 320.397, 258.135, 258.135
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(77.856, 143.132, 163.294, 98.031, 320.397, 
    320.397, 258.135, 258.135), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(110.529, 130.664, 
    77.856, 57.752, 420.631, 358.615, 320.397, 382.312), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(334.274, 
    387.177, 334.274, 281.518, 582.933, 545.006, 506.617, 545.006
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(387.177, 439.936, 419.772, 366.985, 545.006, 
    506.617, 444.245, 482.199), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(354.517, 419.772, 
    399.601, 334.274, 444.245, 444.245, 382.312, 382.312), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(248.922, 
    314.126, 334.274, 269.077, 444.245, 444.245, 382.312, 382.312
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(281.518, 301.68, 248.922, 228.742, 545.006, 
    482.199, 444.245, 506.617), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(505.054, 557.83, 
    505.054, 452.412, 458.993, 420.631, 382.312, 420.631), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(557.83, 
    610.641, 589.991, 537.428, 420.631, 382.312, 320.397, 358.615
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(525.147, 589.991, 570.341, 505.054, 320.397, 
    320.397, 258.135, 258.135), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(419.772, 484.876, 
    505.054, 439.936, 320.397, 320.397, 258.135, 258.135), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(452.412, 
    472.414, 419.772, 399.601, 420.631, 358.615, 320.397, 382.312
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(439.936, 492.505, 439.936, 387.177, 258.135, 
    219.659, 181.2, 219.659), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(492.505, 545.37, 
    525.147, 472.414, 219.659, 181.2, 119.235, 157.751), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(459.892, 
    525.147, 505.054, 439.936, 119.235, 119.235, 57.295, 57.295
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(354.517, 419.772, 439.936, 374.451, 119.235, 
    119.235, 57.295, 57.295), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(387.177, 407.144, 
    354.517, 334.274, 219.659, 157.751, 119.235, 181.2), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(228.742, 
    281.518, 228.742, 175.841, 258.135, 219.659, 181.2, 219.659
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(281.518, 334.274, 314.126, 261.306, 219.659, 
    181.2, 119.235, 157.751), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(248.922, 314.126, 
    293.917, 228.742, 119.235, 119.235, 57.295, 57.295), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(143.132, 
    208.438, 228.742, 163.294, 119.235, 119.235, 57.295, 57.295
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(175.841, 195.934, 143.132, 123.009, 219.659, 
    157.751, 119.235, 181.2), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(269.077, 334.274, 
    314.126, 248.922, 382.312, 382.312, 320.397, 320.397), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(334.274, 
    399.601, 419.772, 354.517, 382.312, 382.312, 320.397, 320.397
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))), 
    NULL, structure(c(419.772, 439.936, 387.177, 366.985, 320.397, 
    258.135, 219.659, 281.802), .Dim = c(4L, 2L), .Dimnames = list(
        NULL, c("x", "y"))), NULL, structure(c(334.274, 387.177, 
    334.274, 281.518, 258.135, 219.659, 181.2, 219.659), .Dim = c(4L, 
    2L), .Dimnames = list(NULL, c("x", "y"))), NULL, structure(c(248.922, 
    301.68, 281.518, 228.742, 320.397, 281.802, 219.659, 258.135
    ), .Dim = c(4L, 2L), .Dimnames = list(NULL, c("x", "y"))))


  plot(c(0,1000), c(0,1000), type="n",asp=1,axes=FALSE,xlab="",ylab="")

  `poly_num` <- function(x,n, num=TRUE, ...){
    polygon(x,...)
    if(num){
      text(mean(x[,1]),mean(x[,2]),n,cex=0.4)
    }
  }

  m <- megaminx_colours
  m[m=="DarkYellow"] <- "gold"
  mm <- m[as.word(megperm,129)]

  for(i in seq_along(megaminx_pentagons)){
    jj <- megaminx_pentagons[[i]]
    if(!is.null(jj)){
      poly_num(jj,n=i/10,col=m[i])
    }
  }

  for(i in seq_along(megaminx_triangles)){
    jj <- megaminx_triangles[[i]]
    if(!is.null(jj)){
      poly_num(jj,n=i,col=mm[i])
    }
  }

  for(i in seq_along(megaminx_quads)){
    jj <- megaminx_quads[[i]]
    if(!is.null(jj)){
      poly_num(jj,n=i,col=mm[i])
    }
  }
}

