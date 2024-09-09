use empregados_icoma;
/*Select simples*/
select * from empregado;
/*Filtro de Estado Civil*/ 
select cod_emp from empregado where civil like 'V';
/*Filtro por atributo da tabela extrangeira com uso de subquery*/
select * from dependente where cod_emp in(
	select cod_emp from empregado where civil like 'V'
);
/*Desafio quero os dependentes dos funcionários com mais de 5 anos de empresa.*/
select * from dependente where cod_emp in(
	select cod_emp from empregado where format((datediff(now(), dt_admissao) / 365), 0) >= 5
);
/*Desafio quero os dependentes dos funcionários com mais de 40 anos de idade.*/
select * from dependente where cod_emp in(
	select cod_emp from empregado where format((datediff(now(), dt_nascimento) / 365), 0) >= 40
);
