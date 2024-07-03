% fuente indec
% inflacion(mes, porcentaje).

inflacion(agosto, 12).
inflacion(septiembre, 12).
inflacion(octubre, 8).
inflacion(noviembre, 12).
inflacion(diciembre, 25).
inflacion(enero, 20).
inflacion(febrero, 13).
inflacion(marzo, 11).
inflacion(abril, 8).

% aumento(?????, mes, porcentaje).

aumento(docente, agosto, 11).
aumento(docente, septiembre, 10).
aumento(docente, octubre, 12).
aumento(docente, noviembre, 9).
aumento(docente, diciembre, 6).
aumento(docente, enero, 0).
aumento(docente, febrero, 16).
aumento(docente, marzo, 12).
aumento(docente, abril, 8).
aumento(docente, mayo, 9).

aumento(informatico, noviembre, 201).
aumento(informatico, diciembre, 301).
aumento(informatico, enero, 1).
aumento(informatico, febrero, 501).
aumento(informatico, marzo, 304).

aumento(empresaFalsa, noviembre, 100).
aumento(empresaFalsa, diciembre, 200).
aumento(empresaFalsa, enero, 50).
aumento(empresaFalsa, febrero, 30).

rubro(docente).
rubro(informatico).
%rubro(jubilado).

mes(noviembre).
mes(diciembre).
mes(enero).
mes(diciembre).

% queremos saber si un rubro perdio ante la inflacion
perdio(Rubro, Mes) :-
    inflacion(Mes, I),
    aumento(Rubro, Mes, A),
    I > A.

% existe algun mes en el que perdieron los docentes
% ?- perdio(docente, M).

%si existe algun rubro que perdio en agosto
% ?- perdio(R, agosto).

% un rubro que nunca perdio (en cualquier mes)
unRubroQueNuncaPerdio(Rubro) :-
    rubro(Rubro),               % es importante aclarar que es un rubro
    not(perdio(Rubro,_)).

% un rubro que siempre perdio (en todos los meses)
siemprePerdio(Rubro) :-
    rubro(Rubro),
    forall(mes(Mes),perdio(Rubro, Mes)). % ¿es cierto que en todos los meses perdio ese rubro consultado?

% un mes es nefasto si NINGUN aumento supero la inflacion
nefasto(Mes) :-
    mes(Mes),
    forall(rubro(Rubro),perdio(Rubro, Mes)). % ¿es cierto que todos los rubros perdieron en ese mes consultado?

% Un ejemplo mas de inversibilidad. (puedo hacer consultas indivuales/hecho puntual y tambien con varialbles para que me arroje resultados que verifican)
digito(1).
digito(2).
digito(3).
digito(4).

claveValida(A,B,C) :-
    digito(A),
    digito(B),
    digito(C),
    A<B,
    B<C.