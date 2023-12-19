mph:{[dx;dy;dz;fr;fps]((sqrt(sum (dx;dy;dz) xexp 2))%(fr%fps))*(3600%5280)}
rpm:{[fr;fps](fps*60)%fr}