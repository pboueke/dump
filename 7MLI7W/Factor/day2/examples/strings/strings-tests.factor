USING: examples.strings tools.test ;
IN: examples.strings.tests

{ t } [ "abcdcba" palindrome? ] unit-test
{ f } [ "abcdefg" palindrome? ] unit-test