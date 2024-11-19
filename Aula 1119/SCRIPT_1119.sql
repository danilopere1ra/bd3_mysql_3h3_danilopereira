select e.nome as empregado, 
calcula_inss(e.salario) as inss, 
calcula_irpf(e.salario) as irpf, 
count(d.cod_dep) as dependente,
format((count(d.cod_dep)*2275.08)/12,2) as abatimento_mes,
format((e.salario-(calcula_inss(e.salario)+calcula_irpf(e.salario))) + ((count(d.cod_dep)*2275.08)/12),2) as renda_liquida
from 
dependente d
right join empregado e
on e.cod_emp = d.cod_emp
group by 
e.nome,
e.salario;

/*Gatilhos*/
delimiter $$
create trigger tg_remover_dependente before delete
on empregado
for each row
begin 
	delete from dependente
    where cod_emp = old.cod_emp;
end $$
delimiter ;
drop trigger tg_remover_dependente;
select * from dependente where cod_emp=5;
delete from empregado where cod_emp = 5;
select * from empregado;