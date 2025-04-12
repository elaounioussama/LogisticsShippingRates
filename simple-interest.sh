#!/bin/bash
# This script calculates simple interest given principal,
# annual rate of interest, and time period in years.

# Do not use this in production. Sample purpose only.

# Author: Upkar Lidder (IBM)
# Additional Authors:
# osama-aouni

# Input:
# p, principal amount
# t, time period in years
# r, annual rate of interest

# Output:
# simple interest = (p * t * r) / 100

# Function to check if input is a number
is_number() {
    [[ $1 =~ ^[0-9]+([.][0-9]+)?$ ]]
}

read -p "Enter the principal amount: " p
if ! is_number "$p"; then
    echo "Invalid input. Principal must be a number."
    exit 1
fi

read -p "Enter the annual rate of interest: " r
if ! is_number "$r"; then
    echo "Invalid input. Rate must be a number."
    exit 1
fi

read -p "Enter the time period in years: " t
if ! is_number "$t"; then
    echo "Invalid input. Time must be a number."
    exit 1
fi

# Calculating simple interest using bc for floating point support
s=$(echo "scale=2; $p * $r * $t / 100" | bc)

echo "The simple interest is: $s"
echo "Calculation completed successfully."
