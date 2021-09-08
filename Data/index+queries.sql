use test;

-- Create index on [customer_account]
CREATE INDEX idx_balance ON customer_account(balance ASC);
-- Create index on [auction_product]
CREATE INDEX idx_price_min ON auction_product(price_min ASC); #price min index
CREATE INDEX idx_p_name ON auction_product(p_name ASC); #product name index
CREATE INDEX idx_closing_time ON auction_product(closing_time ASC); #closing time index
-- Create index on [bids]
CREATE INDEX idx_offer_price ON bids(offer_price DESC);


-- Drop index on [customer_account]
ALTER TABLE customer_account DROP INDEX idx_balance; #price min index
-- Drop index on [auction_product]
ALTER TABLE auction_product DROP INDEX idx_price_min;
ALTER TABLE auction_product DROP INDEX idx_p_name; #product name index
ALTER TABLE auction_product DROP INDEX idx_closing_time; #closing time index
-- Drop index on [bids]
ALTER TABLE bids DROP INDEX idx_offer_price; #closing time index

-- Check out whether the query is performed with index or not
SHOW INDEX FROM customer_account;
EXPLAIN
    SELECT balance FROM customer_account;

-- 1. Show products' closing time ordered by ASC
SELECT B.b_id,A.p_name,A.closing_time
FROM auction_product A,bids B
WHERE A.p_id = B.b_id
ORDER BY A.closing_time ASC;

SELECT B.b_id,A.p_name,A.closing_time
FROM auction_product A
JOIN bids B ON A.p_id = B.b_id
ORDER BY A.closing_time ASC;


-- 2. Show maximum bid price ordered by DESC
SELECT B.b_id,A.p_name,B.offer_price
FROM bids B, auction_product A
WHERE B.product_id=A.p_id
ORDER BY B.offer_price DESC ;

-- 2.1 Show maximum bid price sorting same product_id ordered by DESC
SELECT B.b_id,A.p_name,B.offer_price
FROM bids B, auction_product A
WHERE B.product_id=A.p_id
ORDER BY B.product_id,B.offer_price DESC ;

-- 3. Count the number of bids placed.
SELECT p_name, count(B.product_id) as Number_of_bids
FROM auction_product A, bids B
WHERE A.p_id = B.product_id
GROUP BY B.product_id;

-- 4. Show active auction.
SELECT B.b_id,A.p_name,A.closing_time
FROM auction_product A,bids B
WHERE A.p_id = B.product_id
ORDER BY A.closing_time ASC;

SELECT B.b_id,A.p_name,A.closing_time
FROM auction_product A
JOIN bids B ON A.p_id = B.product_id
ORDER BY A.closing_time ASC;

SELECT B.b_id,A.p_name,B.offer_price
FROM bids B, auction_product A
WHERE B.product_id=A.p_id
ORDER BY B.offer_price DESC ;

-- 5. Show current open auctions.
SELECT B.b_id, A.p_name, B.offer_price,A.current_price, B.bidder, A.closing_time
FROM auction_product A
JOIN bids B ON A.p_id = B.product_id JOIN customer_account C ON B.bidder = C.i_num ;
