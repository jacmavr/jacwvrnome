let palavra;

function setup() {
  createCanvas(400, 400);

  palavra = palavraAleatoria();
  
}

function palavraAleatoria() {
  
  let palavras = ["Motobike", "Bikemoto", "Motoplus"];
  
  return random(palavras);
}

function inicializaCores() {
  background("green");
  fill("white");
  textSize(60);
  textAlign(CENTER, CENTER);
}

function palavraParcial(minimo, maximo) {
  let quantidade = map(mouseX, minimo, maximo, 11, palavra.length);
  let parcial = palavra.substring(0, quantidade);
  return parcial;
}

function draw() {
  
  inicializaCores();

  let parcial = palavraParcial(0, width);
    
  text(parcial, 200, 200);
  
}
