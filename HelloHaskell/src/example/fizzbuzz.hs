main = print $ fuzzbizz [1..100]

fuzzbizz :: [Int] -> [String]
fuzzbizz cs = map test cs
   where
     test c = if c `mod` 15 == 0 then "fizzbuzz" else
              if c `mod` 5  == 0 then "buzz" else
              if c `mod` 3  == 0 then "fizz" else show c
