//Script modifies process input message handler .z.pi to change the console size upon changes to the terminal window size.  The consize function exists as a visual demonstration of this functionality.


//print grid with console row+col dims
consize:
	{lc:count string c:first -1#-3+src:"I"$" " vs first system"stty size";
	r:first 1#src;
	pc:"i"$.5*-4+c-lc;
	{`$enlist x} each 
		(
		 (
		  (enlist ("|"),
		  ((pc)#"-"),
		  ("C x ",string c+3),
                  (pc)#"-"
		  )
		 )
		),
		(hr,
		(enlist "R x ",string r)
		,hr:(-2+"i"$.5*r-1)#enlist (("|"),c#" ")
		)
	}

//dynamically update console size based on changes to window 
.z.pi:{system "c ", first system"stty size";show value x}

/
//initial
q)consize[]
|----------------C x 40----------------
|                                      
|                                      
|                                      
R x 11                                 
|                                      
|                                      
|                                      
//after manually shrinking window
q)consize[]
|------------C x 33------------
|                              
R x 6                          
|                              
\
