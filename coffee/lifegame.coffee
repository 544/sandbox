#util method
create = (type) -> document.createElement(type)
append = (child) -> document.body.appendChild(child)
br = -> append(create("br"))
text = (type, text) ->
  elm = create(type)
  elm.innerHTML = text
  append(elm)
input = (type, value) ->
  elm = create("input")
  elm.type = type
  elm.value = value
  elm
button = (value, fn) ->
  elm = input("button", value)
  elm.onClick = fn
  append(elm)

# const
CELL_SIZE = 5
BOARD_SIZE = 350
LENGTH = BOARD_SIZE/CELL_SIZE

isStart = false

cells = new Array(Math.pow(LENGTH, 2))
for i in [0..cells.length-1]
  cells[i] = {"now":0, "next":0}

#method
draw = (canvas, context) ->
  context.fillStyle="#eeeeee"
  context.fillRect(0,0, canvas.width, canvas.height)
  context.fill()

  context.fillStyle="#000000"
  context.strokeStyle="#000000"
  context.lineWidth=1
  x = canvas.width/CELL_SIZE
  y = canvas.height/CELL_SIZE
  for i in [0..x]
    context.beginPath()
    context.moveTo(i * CELL_SIZE, 0)
    context.lineTo(i * CELL_SIZE, canvas.height)
    context.stroke()
  for j in [0..y]
    context.beginPath()
    context.moveTo(0, j * CELL_SIZE)
    context.lineTo(canvas.width, j * CELL_SIZE)
    context.fillRect(x * CELL_SIZE, y * CELL_SIZE, CELL_SIZE, CELL_SIZE)

initialize = ->
  canvas = document.createElement("canvas")
  canvas.width = BOARD_SIZE
  canvas.height = BOARD_SIZE
  context = canvas.getContext("2d") #???
  canvas.onmousedown = (e) ->
    x = Math.floor(e.offsetX / CELL_SIZE)
    y = Math.floor(e.offsetY / CELL_SIZE)
    if cells[x + (y * LENGTH) ].now == 0
      cells[x + (y * LENGTH)].now = 1
    else
      cells[x + (y * LENGTH)].now = 0
    draw(canvas, context)
  append(canvas)
  draw(canvas, context)
  br()
  text("span", "speed")
  speed = input("text", "10")
  speed.size = 10
  append(speed)
  br()
  button("start", ->
    if !isStart
      isStart = true
      start(speed.value)
  )
  button("stop", ->
    isStart = false
  )
  button("one step", ->
    if !isStart
      start(speed.value)
  )
  button("reset", ->
    for i in [0..cells.length-1]
      cells[i] = {"now":0, "next":0}
    draw(canvas, context)
  )
  button("randam", ->
    for i in [0..cells.length-1]
      if Math.floor(Math.randam()*10) + 1 > 3
        cells[i].now = 0
      else
        cells[i].now = 1
    draw(canvas, content)
  )

  start = (speed) ->
    calc()
    draw(canvas, content)
    if isStart
      setTimeout(->
        start(speed)
      , 1000/speed
      )
  calc = ->
    for c, i in cells
      count = add(i-1)
      count+= add(i+1)
      count+= add(i-1-LENGTH)
      count+= add(i+1-LENGTH)
      count+= add(i-1+LENGTH)
      count+= add(i+1+LENGTH)
      count+= add(i+LENGTH)
      switch count
        when 0,1,4,5,6,7,8
          c.next = 0
        when 3
          c.next = 1
        when 2
          c.next = c.now
    for c in cells
      c.now = c.next
  add = (index) ->
    if index >= 0 && index < cells.length
      cells[index].now
    else
      0

window.onload = ->
  initialize()

