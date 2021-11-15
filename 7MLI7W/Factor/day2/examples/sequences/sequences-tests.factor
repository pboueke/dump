! START:full
USING: examples.sequences tools.test kernel math sequences ;
IN: examples.sequences.tests

{ 2 } [ { 0 1 2 3 4 5 } [ 1 > ] find-first ] unit-test
! END:full
