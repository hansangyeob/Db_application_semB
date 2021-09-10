use test;

-- Create index on [customer_account]
CREATE INDEX idx_balance ON customer_account(balance ASC);

-- Create index on [auction_product]
CREATE INDEX idx_price_min ON auction_product(price_min ASC);

-- Check out whether the query is performed with index or not
ALTER TABLE customer_account DROP INDEX idx_balance;
SHOW INDEX FROM customer_account;
EXPLAIN
    SELECT balance FROM customer_account;

-- Show products' closing time ordered by ASC
SELECT B.b_id,A.p_name,A.closing_time
FROM auction_product A,bids B
WHERE A.p_id = B.b_id
ORDER BY A.closing_time ASC;


-- Show maximum bid price ordered by DESC
SELECT B.b_id,A.p_name,B.offer_price
FROM bids B, auction_product A
WHERE B.product_id=A.p_id
ORDER BY B.offer_price DESC ;

-- Show maximum bid price sorting same product_id ordered by DESC
SELECT B.b_id,A.p_name,B.offer_price
FROM bids B, auction_product A
WHERE B.product_id=A.p_id
ORDER BY B.product_id,B.offer_price DESC ;

-- Count the number of bids placed.
SELECT p_name, count(B.product_id) as Number_of_bids
FROM auction_product A, bids B
WHERE A.p_id = B.product_id
GROUP BY B.product_id;