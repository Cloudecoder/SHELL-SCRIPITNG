#!/bin/bash


sample () {
  echo the value of sample function
  echo value of a = $a
  b=20
  echo first argument =$1

}
 a=10
 sample
 sample xyz
 sample $1
 echo value of b = $b