import List

main = do cs <- getContents
          putStrLn $ uniq cs

uniq :: String -> String
uniq = unlines $ 
