main = print $ prime [2..100]

prime :: [Int] -> [Int]
prime [] = []
--prime (x:xs) = x : ( prime $ filter check xs ) 
prime (x:xs) = x : prime [ c | c <- xs, c `mod` x /= 0 ]
--   where 
--     check c = if c `mod` x /= 0 then True else False 
