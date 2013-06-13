main = print $ create []

create :: [String] -> [String]
create cs = zi 4 $ man 4 $ pin 4 $ sou 4 []

zi :: Int -> [String] -> [String]
zi 0 cs = cs
zi c cs = zi (c-1) (cs ++ ["ton","nan","sha","pei","haku","hatu","tyun"])
man :: Int -> [String] -> [String]
man 0 cs = cs
man c cs = man (c-1) (cs ++ ["1m","2m","3m","4m","5m","6m","7m","8m","9m"] )
pin :: Int -> [String] -> [String]
pin 0 cs = cs
pin c cs = pin (c-1) (cs ++ ["1p","2p","3p","4p","5p","6p","7p","8p","9p"] )
sou :: Int -> [String] -> [String]
sou 0 cs = cs
sou c cs = sou (c-1) (cs ++ ["1s","2s","3s","4s","5s","6s","7s","8s","9s"] )
