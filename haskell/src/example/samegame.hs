data Ball = Red | Blue | Yellow

type Board = [[Ball]]
-- 座標
type Pt = (Int, Int)

--- Board から Ballを一つ取得
pickBall :: Board -> Pt -> Board
pickBall board pt = 
     where marks = markBoard board pt

-- 取り除かれる玉のリストを生成する
markBoard :: Board -> Pt -> [Pt]

