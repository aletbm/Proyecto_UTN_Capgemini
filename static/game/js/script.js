var eventSource  = new EventSource("/game/streamResult");

eventSource.onopen = function() {
  console.log('Comunicacion establecida con exito');
}

eventSource.onmessage = function(e) {
  let final_data = JSON.parse(e.data)

  let myanswer = final_data[0]
  let questions = final_data[1]
  let options = final_data[2]
  let submit = final_data[3]
  let timer = final_data[4].substring(3, 7)

  document.getElementById('seconds').innerHTML = timer
  document.getElementById('respuesta').value = myanswer
  document.getElementsByClassName('contenido-pregunta')[0].innerHTML = questions

  createOptions(options, myanswer)

  if(submit == true && myanswer > 0 && myanswer <= options.length){
    document.forms[0].submit()
  }

  if(timer == "0:00"){
    endGameSubmit()
  }
}

eventSource.onerror = function(e) {
  console.log(`error ${e}`);
}

function createOptions(options, myanswer) {
  lista = document.getElementsByClassName('rounded-list')[0]
  lista.innerHTML = ''

  for(let i=0; i<options.length; i++){
    let option = document.createElement('li')
    option.innerHTML = options[i]
    lista.appendChild(option)
  }

  if(document.getElementsByClassName('selected-option').length > 0){
    document.getElementsByClassName('selected-option')[0].classList.toggle('selected-option')
  }

  if(myanswer > 0 && myanswer <= options.length){
    lista.children[myanswer-1].classList.toggle('selected-option')
  }
}

function endGameSubmit() {
    endGame = document.createElement('input')
    endGame.value = true
    endGame.name = "endGame"
    endGame.classList.add("noVisible")
    document.forms[0].appendChild(endGame)
    document.forms[0].submit()
}

document.getElementById("endGame").addEventListener("click", endGameSubmit)