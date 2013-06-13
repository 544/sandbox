{- 60行で折り返す -}

main = do cs <- getContents
          putStr $ fold cs

fold cs = unlines $ concatMap foldLine $ lines cs

foldLine line = case splitAt 60 line of
                  (s, []) -> [s]
                  (s, cout) -> s : foldLine cout 
