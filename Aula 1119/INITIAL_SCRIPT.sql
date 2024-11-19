create database empregados_icoma;
use empregados_icoma;

create table departamento(
	cod_depto int not null auto_increment,
    nome varchar(50) not null,
    constraint primary key(cod_depto)
);
create table empregado(
	cod_emp int not null auto_increment,
	cod_depto int not null,
    nome varchar(100) not null,
    dt_nascimento date not null,
    sexo char(1),
    dt_admissao date not null,
    civil char(1),
    salario decimal(10,2) not null,
    constraint primary key (cod_emp),
    constraint fk_depto_emp foreign key (cod_depto) references departamento(cod_depto)
);
create table dependente(
	cod_dep int not null auto_increment,
    cod_emp int not null,
    nome varchar(100) not null,
    dt_nascimento date not null,
    sexo char(1),
    constraint primary key (cod_dep, cod_emp),
    constraint fk_emp_dep foreign key (cod_emp) references empregado(cod_emp)
);
select * from departamento;
select * from empregado;
select * from dependente;
