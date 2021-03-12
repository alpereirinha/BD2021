-- ---- LIVROS ------

-- Livros no inventário de um dado genero
DELIMITER $$
CREATE PROCEDURE livrosGenero
	(nomeG VARCHAR(45))
BEGIN
	SELECT IL.id_ilivro AS ID, L.titulo AS TITULO, L.estante AS ESTANTE
		FROM inventario_livro as IL
			INNER JOIN livro as L ON IL.livro = L.isbn
			INNER JOIN livro_genero as LG ON LG.livro_isbn = L.isbn
			INNER JOIN genero as G ON LG.id_genero = G.id_genero
		WHERE G.nome = nomeG
;
END $$

CALL livrosGenero('Fantástico');

DROP PROCEDURE livrosGenero;


-- Livros no inventário de um dado autor
DELIMITER $$
CREATE PROCEDURE livrosAutor
	(nomeA VARCHAR(45))
BEGIN
	SELECT IL.id_ilivro AS ID, L.titulo AS TITULO, L.estante AS ESTANTE
		FROM inventario_livro as IL
			INNER JOIN livro as L ON IL.livro = L.isbn
			INNER JOIN autor_livro as AL ON AL.isbn = L.isbn
			INNER JOIN autor as A ON AL.id_aut = A.id_aut
		WHERE A.nome = nomeA
		ORDER BY 2
;
END $$

CALL livrosAutor('José Saramago');

DROP PROCEDURE livrosAutor;

-- Livros no inventário de uma certa linguagem
DELIMITER $$
CREATE PROCEDURE livrosLinguagem
	(nomeL VARCHAR(45))
BEGIN
	SELECT IL.id_ilivro AS ID, L.titulo AS TITULO, A.nome as AUTOR, L.estante AS ESTANTE
		FROM inventario_livro as IL
			INNER JOIN livro as L ON IL.livro = L.isbn
			INNER JOIN autor_livro as AL ON AL.isbn = L.isbn
			INNER JOIN autor as A ON A.id_aut = AL.id_aut
			INNER JOIN linguagem as LIN ON LIN.id_ling = L.id_ling
		WHERE LIN.nome = nomeL
		ORDER BY 2;
END $$

CALL livrosLinguagem('Ingles');

DROP PROCEDURE livroslinguagem;

-- ---- FILMES ------

-- Filmes no inventário de um dado genero
DELIMITER $$
CREATE PROCEDURE dvdGenero
	(dvdG VARCHAR(45)) 
BEGIN
	SELECT IDVD.id_idvd AS ID, D.Ano as ANO, D.titulo as TITULO
		FROM inventario_dvd as IDVD
			INNER JOIN dvd as D ON IDVD.dvd = D.id_dvd
			INNER JOIN dvd_genero as DG ON DG.id_dvd = D.id_dvd
			INNER JOIN genero as G ON DG.id_genero = G.id_genero
		WHERE G.nome = dvdG
		ORDER BY 2
;
END $$

CALL dvdGenero('Crime');

DROP PROCEDURE dvdGenero;


-- Filmes no inventário de um dado ator
DELIMITER $$
CREATE PROCEDURE dvdAtor
	(dvdA VARCHAR(45))
BEGIN
    SELECT IDVD.id_idvd AS ID, D.Ano as ANO, D.titulo as TITULO
		FROM inventario_dvd as IDVD
			INNER JOIN dvd as D ON IDVD.dvd = D.id_dvd
            INNER JOIN dvd_ator as DA ON DA.id_dvd = D.id_dvd
            INNER JOIN ator as A ON A.id_ator = DA.id_ator
		WHERE A.nome = dvdA
        ORDER BY 2
;
END $$

CALL dvdAtor('Christian Bale');

DROP PROCEDURE dvdAtor;


-- Filmes no inventário de um dado realizador
DELIMITER $$
CREATE PROCEDURE dvdRealizador
	(dvdR VARCHAR(45))
BEGIN
    SELECT IDVD.id_idvd AS ID, D.Ano as ANO, D.titulo as TITULO
		FROM inventario_dvd as IDVD
			INNER JOIN dvd as D ON IDVD.dvd = D.id_dvd
            INNER JOIN dvd_realizador AS DR ON DR.id_dvd = D.id_dvd
            INNER JOIN realizador AS R ON R.id_real = DR.id_real
		WHERE R.nome = dvdR
        ORDER BY 2
;
END $$

CALL dvdRealizador('Damien Chazelle');

DROP PROCEDURE dvdRealizador;

