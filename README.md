# README

## Part 1

## Part 2

What types of questions come to mind?
Where should the date be saved?
How do you add and remove products from the offered products?
How many calls are made to list products?
When I load the products offered in the state, do I have to change to search using state?
How do I confirm that my changes do not break production?
How do I test these changes in my codebase?

How would you model this change?
Create a new table Rule and store the state and product_id. When I search for products, I remove those that are not offered in the state.

## Part 3

What types of questions come to mind?
Could we use the same solution in Part 2?
How do I update my rule without breaking the changes in Part 2?
How can we improve the response?
How can I add and remove products without changing the code base?
Can I use my solution for different rules in the future?
Can I use a cache?
How can I query this information from the database?


How would you model this change?
I added two columns in the Rule table, rule_type and minimum_age. In rule_type, I store NOT_OFFERED or MINIMUM_AGE, and in minimum_age, I store the age as an integer.

