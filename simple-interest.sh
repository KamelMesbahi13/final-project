#!/bin/bash
# Simple Interest Calculator
# Formula: Simple Interest = (Principal * Rate * Time) / 100

echo "Simple Interest Calculator"
echo "========================="

# Input validation function
validate_number() {
    if ! [[ $1 =~ ^[0-9]+([.][0-9]+)?$ ]]; then
        echo "Error: Please enter a valid positive number"
        exit 1
    fi
}

# Get input from user
read -p "Enter the principal amount: " principal
validate_number $principal

read -p "Enter the rate of interest (per annum): " rate
validate_number $rate

read -p "Enter the time period (in years): " time
validate_number $time

# Calculate simple interest
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc -l)

# Display result
echo ""
echo "Principal Amount: $principal"
echo "Rate of Interest: $rate% per annum"
echo "Time Period: $time years"
echo "Simple Interest: $simple_interest"
echo "Total Amount: $(echo "scale=2; $principal + $simple_interest" | bc -l)"
