white100_100 =ones(100, 100);%1-white color
black100_100 =zeros(100, 100);%0-black color
chessboardMatrix = repmat([black100_100 white100_100;white100_100, black100_100], 4,4);
imwrite(chessboardMatrix , 'chessboard.jpg')
