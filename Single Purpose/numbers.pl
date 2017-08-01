#!/usr/bin/perl

$newext = "001";

while ( $newext < 200 ) {
  printf "exten => %.3d,1,Goto(internal,%3d,1)\n", $newext, $newext + 500;
  $newext++;
}
