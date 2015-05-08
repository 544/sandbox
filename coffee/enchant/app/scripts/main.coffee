###
intとかの配列でボードを管理して、
描画だけ受け持つみたいなのって出来ないのかな。
->出来ました。surface.contextでcanvasAPIを直接呼び出しています。
###
enchant()
isUnitTest=false
SCREEN_WIDTH = 500
SCREEN_HEIGHT= 320
BLOCK_LENGTH=18
CELL_WIDTH=8+2
CELL_HEIGHT=12+2
BLOCK_DROP_FRAME=5
#盤面情報
#落下しているブロック以外の情報を保持する
_cell=new Array()
_surface=null
#落下しているブロック
_block=null
_scene =null
_vx=0
_vy=0
_isGenerateNextBlock=false
isPause =false
BLOCK_TYPE=
    NONE:0
    WALL:-1
    RED_BLOCK:1
    GREEN_BLOCK:2
    YELLOW_BLOCK:3
    BLUE_BLOCK:4

window.onload =->
    if isUnitTest
        return
    game = new Game SCREEN_WIDTH,SCREEN_HEIGHT
    game.fps = 20
    _scene=game.rootScene
    _scene.backgroundColor = "rgb(255,255,255)"

    sprite = new Sprite SCREEN_WIDTH,SCREEN_HEIGHT
    _surface = new Surface SCREEN_WIDTH, SCREEN_HEIGHT
    sprite.image = _surface
    _scene.addChild sprite

    pause = new Label()
    pause.width =100
    pause.text ="pause"
    pause.moveTo 200,10
    pause.backgroundColor ="red"
    pause.font = "32px 'Consolas', 'Monaco', 'ＭＳ ゴシック'"
    pause.addEventListener "touchstart",(e)->
        isPause =!isPause
    _scene.addChild pause

    init()

    _scene.addEventListener "enterframe",->
        hasDelete =false
        if isPause
            return
        #移動処理など
        if not _block #and game.frame % BLOCK_DROP_FRAME==0
            hasDelete=deleteLine _cell
            type = parseInt(Math.random()*7)+1
            _block=new Block(type)
        if game.frame % BLOCK_DROP_FRAME == 0
            _vy+=1

        #元の配列をcopyに保持する
        copy=copyCell _cell
        if not hasDelete and merge _block
            #衝突時
            #再mergeするので再度copyする
            _cell = copyCell copy
            merge _block
            if _isGenerateNextBlock
                _isGenerateNextBlock=false
                _block=null
                copy=_cell
        #描画処理
        draw(_cell)
        _cell = copy
        if _block
            _block.x+=_vx
            _block.y+=_vy
        _vx=0
        _vy=0

        #横移動処理
        #入力値を貯めておき、次フレームで処理をする
        input =game.input
        if input.left
            _vx=-1
        else if input.right
            _vx=1
        if input.up
            if _block
                copy = copyCell _cell
                _block.rotate(copy)
    game.start()

###
# 引数の二次元配列通りに描画をする
###
draw=(targetCell)->
    y=0
    x=0
    for sideLine in targetCell
        for block in sideLine
            if block == -1
                continue
            _surface.context.fillStyle="rgb(240,240,240)"
            _surface.context.fillRect(x*BLOCK_LENGTH, y*BLOCK_LENGTH, BLOCK_LENGTH, BLOCK_LENGTH)
            if block == 1
                _surface.context.fillStyle = "red"
            else if block ==2
                _surface.context.fillStyle = "green"
            else if block==3
                _surface.context.fillStyle = "blue"
            else if block==4
                _surface.context.fillStyle = "yellow"
            else if block==5
                _surface.context.fillStyle = "purple"
            else if block==6
                _surface.context.fillStyle = "orange"
            else if block == 7
                _surface.context.fillStyle = "aqua"
            else
                _surface.context.fillStyle = "gray"
            _surface.context.fillRect(x*BLOCK_LENGTH+1, y*BLOCK_LENGTH+1, BLOCK_LENGTH-2, BLOCK_LENGTH-2)
            x++
        y++
        x=0

###
# 二次元配列の初期化
###
init = ->
    for i in[0..CELL_HEIGHT-1]
        tmp=new Array()
        for j in [0..CELL_WIDTH-1]
            if(i == 0 || i == 13 || j==0 || j ==9)
                tmp.push(BLOCK_TYPE.WALL)
            else
                tmp.push(BLOCK_TYPE.NONE)
        _cell.push(tmp)

###
# ブロックが衝突したら停止する
# 衝突時にtrueを返す。
###
merge=(block)->
    if not block
        return
    tmpCell = copyCell _cell
    for y in [0..block.type.length-1]
        if _vy<0
            break
        for x in [0..block.type[y].length-1]
            #落下がOKかどうか
            if block.type[y][x] == 0
                continue
            #配列範囲外
            if block.y+y+_vy>_cell.length-1 || block.y+y+_vy <0
                return true
            #移動先のブロックが空ではない。
            if _cell[block.y+y+_vy][block.x+x] != BLOCK_TYPE.NONE and block.type[y][x]!=0
                #衝突があった
                _vy=0
                _vx=0
                _isGenerateNextBlock=true
                return true
            if _cell[block.y+y+_vy][block.x+x] == BLOCK_TYPE.WALL
                continue
            if _cell[block.y+y+_vy][block.x+x] == BLOCK_TYPE.NONE
                #移動OKのフラグを立てる？？
               _cell[block.y+y+_vy][block.x+x] =block.type[y][x]
     #vxで判定する
     #vyがOkのときだけ判定する
     if _vx<0 or _vx>0
         for y in [0..block.type.length-1]
            for x in [0..block.type[y].length-1]
                if block.x+x+_vx>_cell[0].length-1 || block.x+x+_vx <0
                    continue
                if tmpCell[block.y+y+_vy][block.x+x+_vx]!= BLOCK_TYPE.NONE and block.type[y][x]!=0
                    #衝突があった
                    _vx=0
                    return true
                if tmpCell[block.y+y+_vy][block.x+x+_vx]==BLOCK_TYPE.WALL
                    continue
                if tmpCell[block.y+y+_vy][block.x+x+_vx]==BLOCK_TYPE>NONE
                    tmpCell[block.y+y+_vy][block.x+x+_vx]=block.type[y][x]
         _cell=tmpCell
    return false


checkCollision=(cell,block,posx,posy)->
    for y in [0..block.length-1]
        for x in [0..block[y].length-1]
            if block[y][x] != 0 && cell[posy+y][posx+x] != BLOCK_TYPE.NONE
                #衝突したので回転できない
                return true
    return false

deleteLine=(cell)->
    hasDelete=false
    for y in [1..cell.length-2]
        canDelete = true
        for x in [1..cell[y].length-2]
            if cell[y][x]==BLOCK_TYPE.WALL
                continue
            else if cell[y][x]==BLOCK_TYPE.NONE
                canDelete = false
                break
        if canDelete
            hasDelete=true
            #列を消す
            for x in[0..cell[y].length-1]
                if cell[y][x]!=BLOCK_TYPE.WALL
                    cell[y][x]=BLOCK_TYPE.NONE
            #列をずらす
            for y2 in [y..1]
                for x in [1..cell[0].length-1]
                    if cell[y2][x]==BLOCK_TYPE.WALL||cell[y2-1][x]==BLOCK_TYPE.WALL
                        continue
                    #入れ替え
                    cell[y2][x]=cell[y2-1][x]
                    cell[y2-1][x]=BLOCK_TYPE.NONE
    return hasDelete
###
# 二次元配列をcopyする。
###
copyCell=(arr)->
    tmp = new Array()
    for i in [0..arr.length-1]
        line = new Array()
        for j in [0..arr[i].length-1]
            line.push(arr[i][j])
        tmp.push(line)
    return tmp

###
# [0][0]の位置をx,yとする。
###
class Block

    @BLOCK_TYPE=
        RIGHT_L:1
        LEFT_L:2
        SQUARE:3
        N:4
        MIRROR_N:5
        T:6
        BAR:7

    constructor:(type)->
        @x=3
        @y=1
        @type=getBlockType(type)

    rotate:(cell)->
        tmpArray = [[0,0,0,0]
                    ,[0,0,0,0]
                    ,[0,0,0,0]
                    ,[0,0,0,0]]
        for y in [0..@type.length-1]
            for x in [0..@type[y].length-1]
                tmpArray[x][3-y]=@type[y][x]
        if not checkCollision cell,tmpArray,@x,@y
            @type=tmpArray

    getBlockType=(type)->
        if type==Block.BLOCK_TYPE.RIGHT_L
            return [[0,type,0,0]
                    ,[0,type,0,0]
                    ,[0,type,type,0]
                    ,[0,0,0,0]]
        else if type==Block.BLOCK_TYPE.LEFT_L
            return [[0,0,type,0]
                   ,[0,0,type,0]
                   ,[0,type,type,0]
                   ,[0,0,0,0]]
        else  if type==Block.BLOCK_TYPE.SQUARE
            return [[0,0,0,0]
                   ,[0,type,type,0]
                   ,[0,type,type,0]
                   ,[0,0,0,0]]
        else if type == Block.BLOCK_TYPE.N
            return [[0,type,0,0]
                   ,[0,type,type,0]
                   ,[0,0,type,0]
                   ,[0,0,0,0]]
        else if type == Block.BLOCK_TYPE.MIRROR_N
            return  [[0,0,type,0]
                   ,[0,type,type,0]
                   ,[0,type,0,0]
                   ,[0,0,0,0]]
        else if type == Block.BLOCK_TYPE.T
            return  [[0,type,0,0]
                   ,[0,type,type,0]
                   ,[0,type,0,0]
                   ,[0,0,0,0]]
        else
            return  [[0,type,0,0]
                   ,[0,type,0,0]
                   ,[0,type,0,0]
                   ,[0,type,0,0]]
