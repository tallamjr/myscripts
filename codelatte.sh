#!/bin/bash

array[0]="https://softwareengineering.stackexchange.com/questions/395784/how-do-we-avoid-ci-driven-development"
array[1]="https://softwareengineering.stackexchange.com/questions/159637/what-is-the-mars-curiosity-rovers-software-built-in"
array[2]="https://softwareengineering.stackexchange.com/questions/25564/when-should-you-call-yourself-a-senior-developer"

size=${#array[@]}
index=$(($RANDOM % $size))
open ${array[$index]}
