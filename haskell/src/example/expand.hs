main = do cs <- getContents
          putStr $ expand cs

expand :: String -> String
expand cs = concatMap translate cs

translate :: Char -> String
translate '\t' = replicate 3 '@'
translate c = [c]
