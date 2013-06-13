main = do cs <- getContents
          putStr $ lastNLines 3 cs

lastNLines :: Int -> String -> String
lastNLines n cs = unlines $ takeLast n $ lines cs

takeLast n ss = reverse $ take n $ reverse ss
