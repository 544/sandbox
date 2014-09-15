window.onload = -> (
  elm = document.createElement("input")
  elm.type = "button"
  elm.value = "ボタン"
  elm.onclick = -> (
    alert("hoge")
    document.body.appendChild(elm)
  )
  document.body.appendChild(elm)
)
