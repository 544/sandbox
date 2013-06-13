import List

main = do cs <- getContents
          putStrLn $ sortStr cs

sortStr :: String -> String
sortStr cs = unlines $ sort $ lines cs 
