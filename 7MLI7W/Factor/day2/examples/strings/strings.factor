! START:full
USING: kernel sequences ;
! START:init
IN: examples.strings

: palindrome? ( str -- b ) [ ] [ reverse ] bi = ; 
! END:init
! END:full