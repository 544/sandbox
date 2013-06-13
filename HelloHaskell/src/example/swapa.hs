main = do cs <- getContents
          putStr $ concatMap swapa cs

swapa :: Char -> String
swapa 'a' = "A"
swapa c = [c]
