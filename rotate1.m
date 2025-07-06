function imgRotate = rotate1(img, a)

    % dimensioni dell'immagine iniziale
    [h, w] = size(img);

    % conversione in radianti
    a = deg2rad(a);

    % coordinate massime rispetto al centro
    max_x = floor(w / 2);
    max_y = floor(h / 2);

    % Calcolo delle dimensioni della nuova immagine ruotata
    % Calcolo delle coordinate dei vertici ruotati
    Ax = round((-max_x) * cos(a) - (max_y) * sin(a));
    Ay = round((-max_x) * sin(a) + (max_y) * cos(a));

    Bx = round((-max_x) * cos(a) - (-max_y) * sin(a));
    By = round((-max_x) * sin(a) + (-max_y) * cos(a));

    Cx = round((max_x) * cos(a) - (-max_y) * sin(a));
    Cy = round((max_x) * sin(a) + (-max_y) * cos(a));

    Dx = round((max_x) * cos(a) - (max_y) * sin(a));
    Dy = round((max_x) * sin(a) + (max_y) * cos(a));

    % Trova i massimi valori assoluti per X e Y
    W = 2 * max([abs(Ax), abs(Bx), abs(Cx), abs(Dx)]) + 1;
    H = 2 * max([abs(Ay), abs(By), abs(Cy), abs(Dy)]) + 1;

    % Creazione dell'immagine quadro vuota
    imgRotate = zeros(H, W);

    % Spostamento degli indici per posizionare il centro al centro dell'immagine
    centerX = floor(W / 2) + 1;
    centerY = floor(H / 2) + 1;

    for X = -floor(H / 2) : floor(H / 2)
        for Y = -floor(W / 2) : floor(W / 2)
            % Coordinate inverse per trovare i pixel dell'immagine originale
            x = round(X * cos(a) + Y * sin(a)) + max_y + 1;
            y = round(Y * cos(a) - X * sin(a)) + max_x + 1;

            % Controllo se le coordinate sono all'interno dei limiti dell'immagine originale
            if x >= 1 && x <= h && y >= 1 && y <= w
                imgRotate(X + centerX, Y + centerY) = img(x, y);
            end
        end
    end

    % Conversione dell'immagine ruotata in uint8
    imgRotate = uint8(imgRotate);
end
