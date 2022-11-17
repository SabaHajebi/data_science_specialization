Error Codes

Exercise 1:
--Goal: Here we use users table to pull a list of user email addresses. Edit the query to pull email
addresses, but only for non-deleted users.

SELECT email_address
FROM dsv1069.users
WHERE deleted_at ISNULL


Exercise 2:
--Goal: Use the items table to count the number of items for sale in each category

SELECT category, COUNT(id) AS item_count
FROM dsv1069.items
GROUP BY category
ORDER BY item_count DESC



Exercise 3:
--Goal: Select all of the columns from the result when you JOIN the users table to the orders
table

SELECT *
FROM dsv1069.orders
JOIN dsv1069.users ON
orders.user_id = users.id



Exercise 4:
--Goal: Check out the query below. This is not the right way to count the number of viewed_item
events. Determine what is wrong and correct the error.

SELECT COUNT(DISTINCT event_id) as events
FROM dsv1069.events
WHERE event_name = 'view_item'



Exercise 5:
--Goal:Compute the number of items in the items table which have been ordered. The query
below runs, but it isn’t right. Determine what is wrong and correct the error or start from scratch.

SELECT COUNT(DISTINCT item_id)
FROM dsv1069.orders



Exercise 6:
--Goal: For each user figure out IF a user has ordered something, and when their first purchase
was. The query below doesn’t return info for any of the users who haven’t ordered anything.

SELECT users.id AS user_id, MIN(orders.paid_at) AS min_paid_at
FROM dsv1069.users --The larger table
LEFT JOIN dsv1069.orders ON
orders.user_id = users.id
GROUP BY user.id

