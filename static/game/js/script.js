var eventSource  = new EventSource("/game/streamResult");

eventSource.onopen = function() {
  console.log('Yay! its open?');
}

eventSource.onmessage = function(e) {
  let final_data = JSON.parse(e.data)
  console.log(final_data)

  let myanswer = final_data[0]
  let manoCerrada = final_data[1]
  let questions = final_data[2]
  let options = final_data[3]
  let answer = final_data[4]
  let submit = final_data[5]

  document.getElementById('respuesta').value = myanswer
  document.getElementsByClassName('contenido-pregunta')[0].innerHTML = questions
  lista = document.getElementsByClassName('rounded-list')[0].children

  for(let i=0; i<lista.length; i++){
    lista[i].innerHTML = options[i]
  }

  if(document.getElementsByClassName('selected-option').length > 0){
    document.getElementsByClassName('selected-option')[0].classList.toggle('selected-option')
  }

  if(myanswer > 0){
    lista[myanswer-1].classList.toggle('selected-option')
  }

  if(submit == true){
    document.forms[0].submit()
  }
}

eventSource.onerror = function(e) {
  console.log(`error ${e}`);
}

var n = 15
document.getElementById('seconds').innerHTML = n

function getTime() {
  let aux = n--
  document.getElementById('seconds').innerHTML = aux
  if(aux <= 0){
    n = 15
  }
}

setInterval(getTime, 1000)