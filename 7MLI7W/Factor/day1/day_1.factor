! IN: scratchpad "day_1.factor" run-file
USE: io
USE: math
USE: math.functions
USE: math.ranges
USE: math.parser
USE: strings
USE: sequences
USE: kernel
USE: ascii

"Hello world" print

! 1.

3 3 * 4 4 * +

clear

! 2.

3 sq 4 sq * + sqrt

clear

! 3.

1 2 swap dup rot

clear

! 4.

"Pedro" "Hello " swap append >upper print

clear

! 5.

 { 1 4 17 9 11 } 0 [ + ] reduce

 clear

 ! 6.

 100 [1,b] 0 [ + ] reduce

 clear

 ! 7.

 10 [1,b] [ sq ] map

 clear

 ! 8.

 42 [ 10 /i ] [ 10 mod ] bi

 clear

 ! 9.

10000 number>string [ 1string string>number ] each

clear