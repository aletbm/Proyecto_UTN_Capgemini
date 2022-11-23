var eventSource  = new EventSource("/game/streamResult");

eventSource.onopen = function() {
  console.log('Yay! its open?');
}

eventSource.onmessage = function(e) {
  let final_data = JSON.parse(e.data)

  if(final_data[0].length > 1){
    myanswer = final_data[0][0] + final_data[0][1]
  }
  else{
    myanswer = final_data[0]
  }
  let questions = final_data[1]
  let options = final_data[2]
  let answer = final_data[3]

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
    document.forms[0].submit()
  }
}

setInterval(getTime, 1000)