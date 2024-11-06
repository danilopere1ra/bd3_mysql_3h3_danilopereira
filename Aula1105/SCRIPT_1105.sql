delimiter //
create function calcula_inss(renda decimal(10, 2))
returns decimal(10, 2)
deterministic
begin
	declare desconto_inss decimal(10,2);
    
    set desconto_inss =
		case
			when (renda <=1412) then (renda * 0.075)
			when (renda >=1412.01 and renda <2666.68) then (renda * 0.09)
			when (renda >=2666.69 and renda <4000.03) then (renda * 0.12)
			when (renda >=4000.04 and renda <7786.02) then (renda * 0.14)
		else 856.46
        end;
	return desconto_inss;
end //
delimiter ;

select *, calcula_inss(salario) as INSS, (salario-calcula_inss(salario)) as liquido_renda from empregado;

delimiter //
create function calcula_irpf(renda decimal(10, 2))
returns decimal(10, 2)
deterministic
begin
	declare desconto_irpf decimal(10,2);
    
    set desconto_irpf =
		case
			when (renda <=2112) then 0
			when (renda >=2112.01 and renda <2826.66) then (renda * 0.075)
			when (renda >=2826.66 and renda <3751.06) then (renda * 0.15)
			when (renda >=3751.07 and renda <4664.68) then (renda * 0.225)
			when (renda >4664.69) then (renda * 0.275)
        end;
	return desconto_irpf;
end //
delimiter ;