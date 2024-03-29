! START:definition
USE: kernel

IN: examples.tuples

TUPLE: cart-item name price quantity ;
! END:definition

! START:partial_boa
: <dollar-cart-item> ( name -- cart-item ) 1.00 1 cart-item boa ;
! END:partial_boa

! START:key_value
: <one-cart-item> ( -- cart-item ) T{ cart-item { quantity 1 } } ;
! END:key_value

! 1. 
: <rasberry-pi> ( price -- cart-item ) 1 "rasberry-pi" rot rot cart-item boa ; 

! 2.
: discount ( cart-item prct -- cart-item ) swap dup rot rot price>> * >>price ;