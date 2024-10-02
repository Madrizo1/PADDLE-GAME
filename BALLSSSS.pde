// Variable for pladen
float paddleX;
float paddleWidth = 100;
float paddleHeight = 20;
float paddleSpeed = 7;

// Variable for bvolden
float ballX;
float ballY;
float ballDiameter = 30;
float ballSpeed = 8;

// Score
int score = 0;
boolean gameOver = false;

void setup() {
  size(600, 400);
  
  // Initialize plade position(centered)
  paddleX = width / 2 - paddleWidth / 2;
  
  // Initialize boldens position (tilfældigt på toppen)
  resetBall();
}

void draw() {
  background(51);
  
  // Lave pladen
  fill(255);
  rect(paddleX, height - paddleHeight - 10, paddleWidth, paddleHeight);
  
  // Lave bolden
  fill(150, 0, 255);
  ellipse(ballX, ballY, ballDiameter, ballDiameter);
  
  // Opdatere boldens position
  ballY += ballSpeed;
  
  // Bevæge plandes position med venstre og højre arrow knapper
  if (keyPressed) {
    if (keyCode == LEFT) {
      paddleX -= paddleSpeed;
    } else if (keyCode == RIGHT) {
      paddleX += paddleSpeed;
    }
  }
  
  // Holder pladen indenfor skærmen
  paddleX = constrain(paddleX, 0, width - paddleWidth);
  
  // Tjekker hvis bolden rammer pladen
  if (ballY + ballDiameter / 2 >= height - paddleHeight - 10 &&
      ballX > paddleX && ballX < paddleX + paddleWidth) {
    // If the ball hits the paddle, reset and increase score
    score++;
    resetBall();
  }
  
  // Tjekker hvis bolden ikke rammer pladen (rammer bunden af skærmen)
  if (ballY > height) {
    gameOver = true;
    ballSpeed = 0;
  }
  
  // Viser score
  textSize(20);
  fill(255);
  text("Score: " + score, 10, 30);
  
  // Game over besked
  if (gameOver) {
    textSize(40);
    text("Game Over!", width / 2 - 100, height / 2);
  }
}

// Resetter bolden på toppen af skærmen 
void resetBall() {
  ballX = random(ballDiameter / 2, width - ballDiameter / 2);
  ballY = 0;
}

// HVORDAN SPILLER MAN SPILLET: 
// RYK PLADEN TIL HØJRE ELLER VENSTRE MED ARROW KNAPPERNE 
// RAM BOLDEN MED PLADEN FOR AT FÅ 1 POINT 
// GAME OVER HVIS MAN IKKE RAMMER BOLDEN MED PLADEN
