function love.load()
  playerY = 0;
  playerYT = 0;
  playerV = 3;
  enemyY = 0;
  enemyYT = 0;
  enemyD = love.math.random( 0, 1 );
  enemyDr = 0;
  enemyV = love.math.random( 3, 5 );
  ballX = 225;
  ballY = 175;
  ballV = 2;
  ballD = love.math.random( 0, 1 );
  ballDY = love.math.random( 0, 1 );
  playerP = 0;
  enemyP = 0;

end

function love.update(dt)
  playerY = playerYT;
  enemyYT = ballY;

  if love.keyboard.isDown( "down" ) and playerY < 255 then
    playerYT = playerYT + playerV
  end

  if love.keyboard.isDown( "up" ) and playerY > 0 then
    playerYT = playerYT - playerV
  end

  if enemyD == 0 then
    if enemyY <= 0 then
      enemyDr = 1;
    end
    if enemyY >= 255 then
      enemyDr = 0;
    end

    if enemyDr == 1 then
      enemyY = enemyY + enemyV
    end
    if enemyDr == 0 then
      enemyY = enemyY - enemyV
    end

  elseif enemyD == 1 then
    if enemyY > enemyYT then
      enemyY = enemyY - enemyV;
    end
    if enemyY < enemyYT then
      enemyY = enemyY + enemyV;
    end
  end

  if ballD == 0 then
    ballX = ballX - ballV;
  end
  if ballD == 1 then
    ballX = ballX + ballV;
  end
  if ballDY == 0 then
    ballY = ballY - ballV;
  end
  if ballDY == 1 then
    ballY = ballY + ballV;
  end

  if enemyY >= 255 then
    enemyY = 255;
  end
  if enemyY <= 0 then
    enemyY = 0;
  end

  if ballY >= 335 then
    ballDY = 0
  end
  if ballY <= 0 then
    ballDY = 1
  end

  if ballX <= 20 + 16 and ballY > playerY and ballY < playerY + 80 then
    ballD = 1
    ballV = ballV + 0.1
    enemyV = enemyV + 0.2
    playerV = playerV + 0.8
  end
  if ballX >= 410 - 16 and ballY > enemyY and ballY < enemyY + 80 then
    ballD = 0
    ballV = ballV + 0.1
    enemyV = enemyV + 0.2
    playerV = playerV + 0.2
  end

  if ballX < -20 then
    ballX = 225;
    ballY = 175;
    ballV = 2;
    ballD = love.math.random( 0, 1 );
    ballDY = love.math.random( 0, 1 );
    enemyV = 3;
    playerV = 3;
    enemyP = enemyP + 1;
  end
  if ballX > 450 then
    ballX = 225;
    ballY = 175;
    ballV = 2;
    ballD = love.math.random( 0, 1 );
    ballDY = love.math.random( 0, 1 );
    enemyV = 3;
    playerV = 3;
    playerP = playerP + 1;
  end

  if playerP > 9 then
    playerP = 0;
    love.window.showMessageBox("Match Results", "You Win!");
    love.event.quit()
  end
  if enemyP > 9 then
    enemyP = 0;
    love.window.showMessageBox("Match Results", "You Loose :(");
    love.event.quit()
  end
end

function love.draw()
  love.graphics.rectangle( "fill", 20, playerY, 16, 80, 2, 2)
  love.graphics.rectangle( "fill", 410, enemyY, 16, 80, 2, 2)
  love.graphics.rectangle( "fill", ballX, ballY, 15, 15, 10, 10)
  love.graphics.rectangle("fill", 220, 0, 5, 20, 1, 1)
  love.graphics.rectangle("fill", 220, 40, 5, 20, 1, 1)
  love.graphics.rectangle("fill", 220, 80, 5, 20, 1, 1)
  love.graphics.rectangle("fill", 220, 120, 5, 20, 1, 1)
  love.graphics.rectangle("fill", 220, 160, 5, 20, 1, 1)
  love.graphics.rectangle("fill", 220, 200, 5, 20, 1, 1)
  love.graphics.rectangle("fill", 220, 235, 5, 20, 1, 1)
  love.graphics.rectangle("fill", 220, 275, 5, 20, 1, 1)
  love.graphics.rectangle("fill", 220, 320, 5, 20, 1, 1)

  --Score
  if playerP == 0 then
    love.graphics.rectangle("fill", 160, 0, 40, 10)
    love.graphics.rectangle("fill", 200, 0, 10, 70)
    love.graphics.rectangle("fill", 160, 60, 40, 10)
    love.graphics.rectangle("fill", 160, 0, 10, 70)
  end
  if playerP == 1 then
    love.graphics.rectangle("fill", 180, 0, 20, 10)
    love.graphics.rectangle("fill", 200, 0, 10, 70)
  end
  if playerP == 2 then
    love.graphics.rectangle("fill", 160, 0, 40, 10)
    love.graphics.rectangle("fill", 200, 0, 10, 35)
    love.graphics.rectangle("fill", 160, 25, 40, 10)
    love.graphics.rectangle("fill", 160, 25, 10, 35)
    love.graphics.rectangle("fill", 160, 50, 50, 10)
  end
  if playerP == 3 then
    love.graphics.rectangle("fill", 160, 0, 40, 10)
    love.graphics.rectangle("fill", 200, 0, 10, 55)
    love.graphics.rectangle("fill", 160, 25, 40, 10)
    love.graphics.rectangle("fill", 160, 50, 50, 10)
  end
  if playerP == 4 then
    love.graphics.rectangle("fill", 200, 0, 10, 60)
    love.graphics.rectangle("fill", 160, 25, 40, 10)
    love.graphics.rectangle("fill", 160, 0, 10, 35)
  end
  if playerP == 5 then
    love.graphics.rectangle("fill", 160, 0, 50, 10)
    love.graphics.rectangle("fill", 160, 0, 10, 35)
    love.graphics.rectangle("fill", 160, 25, 40, 10)
    love.graphics.rectangle("fill", 200, 25, 10, 35)
    love.graphics.rectangle("fill", 160, 50, 50, 10)
  end
  if playerP == 6 then
    love.graphics.rectangle("fill", 160, 0, 40, 10)
    love.graphics.rectangle("fill", 200, 0, 10, 55)
    love.graphics.rectangle("fill", 160, 25, 40, 10)
    love.graphics.rectangle("fill", 160, 25, 10, 35)
    love.graphics.rectangle("fill", 160, 50, 50, 10)
  end
  if playerP == 7 then
    love.graphics.rectangle("fill", 160, 0, 40, 10)
    love.graphics.rectangle("fill", 200, 0, 10, 70)
  end
  if playerP == 8 then
    love.graphics.rectangle("fill", 160, 0, 40, 10)
    love.graphics.rectangle("fill", 200, 0, 10, 55)
    love.graphics.rectangle("fill", 160, 25, 40, 10)
    love.graphics.rectangle("fill", 160, 0, 10, 55)
    love.graphics.rectangle("fill", 160, 50, 50, 10)
  end
  if playerP == 9 then
    love.graphics.rectangle("fill", 160, 0, 40, 10)
    love.graphics.rectangle("fill", 200, 0, 10, 60)
    love.graphics.rectangle("fill", 160, 25, 40, 10)
    love.graphics.rectangle("fill", 160, 0, 10, 35)
  end

  --Enemy
  if enemyP == 0 then
    love.graphics.rectangle("fill", 235, 0, 40, 10)
    love.graphics.rectangle("fill", 275, 0, 10, 70)
    love.graphics.rectangle("fill", 235, 60, 40, 10)
    love.graphics.rectangle("fill", 235, 0, 10, 70)
  end
  if enemyP == 1 then
    love.graphics.rectangle("fill", 255, 0, 20, 10)
    love.graphics.rectangle("fill", 275, 0, 10, 70)
  end
  if enemyP == 2 then
    love.graphics.rectangle("fill", 235, 0, 40, 10)
    love.graphics.rectangle("fill", 275, 0, 10, 35)
    love.graphics.rectangle("fill", 235, 25, 40, 10)
    love.graphics.rectangle("fill", 235, 25, 10, 35)
    love.graphics.rectangle("fill", 235, 50, 50, 10)
  end
  if enemyP == 3 then
    love.graphics.rectangle("fill", 235, 0, 40, 10)
    love.graphics.rectangle("fill", 275, 0, 10, 55)
    love.graphics.rectangle("fill", 235, 25, 40, 10)
    love.graphics.rectangle("fill", 235, 50, 50, 10)
  end
  if enemyP == 4 then
    love.graphics.rectangle("fill", 275, 0, 10, 60)
    love.graphics.rectangle("fill", 235, 25, 40, 10)
    love.graphics.rectangle("fill", 235, 0, 10, 35)
  end
  if enemyP == 5 then
    love.graphics.rectangle("fill", 235, 0, 50, 10)
    love.graphics.rectangle("fill", 235, 0, 10, 35)
    love.graphics.rectangle("fill", 235, 25, 40, 10)
    love.graphics.rectangle("fill", 275, 25, 10, 35)
    love.graphics.rectangle("fill", 235, 50, 50, 10)
  end
  if enemyP == 6 then
    love.graphics.rectangle("fill", 235, 0, 40, 10)
    love.graphics.rectangle("fill", 275, 0, 10, 55)
    love.graphics.rectangle("fill", 235, 25, 40, 10)
    love.graphics.rectangle("fill", 235, 25, 10, 35)
    love.graphics.rectangle("fill", 235, 50, 50, 10)
  end
  if enemyP == 7 then
    love.graphics.rectangle("fill", 235, 0, 40, 10)
    love.graphics.rectangle("fill", 275, 0, 10, 70)
  end
  if enemyP == 8 then
    love.graphics.rectangle("fill", 235, 0, 40, 10)
    love.graphics.rectangle("fill", 275, 0, 10, 55)
    love.graphics.rectangle("fill", 235, 25, 40, 10)
    love.graphics.rectangle("fill", 235, 0, 10, 55)
    love.graphics.rectangle("fill", 235, 50, 50, 10)
  end
  if enemyP == 9 then
    love.graphics.rectangle("fill", 235, 0, 40, 10)
    love.graphics.rectangle("fill", 275, 0, 10, 60)
    love.graphics.rectangle("fill", 235, 25, 40, 10)
    love.graphics.rectangle("fill", 235, 0, 10, 35)
  end
end
