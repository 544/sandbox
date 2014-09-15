pos =
  x:100
  y:200
  dump:->
    return "x:#{@x}, y:#{@y}"

data = new pos()
console.log(data.dump())
