function se = disco(r)
	% Preallocazione di una matrice logica 
	se = zeros(2*r+1 , 2*r+1, 'logical');
	for x = -r:r
		for y = -r:r
			% Controlla se il punto è all'interno del cerchio
			if x^2 + y^2 <= r^2
					se(x+r+1, y+r+1) = 1; 
			end
		end
	end
end