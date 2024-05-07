
#import "@preview/klaro-ifsc-sj:0.1.0": report


  #show: doc => report(
    title: "Modificações Timer",
    subtitle: "DISPOSITIVOS LÓGICOS PROGRAMÁVEIS II (DLP029007)",
    // Se apenas um autor colocar , no final para indicar que é um array
    authors:("Matheus Pires Salazar,Rhenzo Hideki Silva Kajikawa",),
    date: "2 de abril de 2024",
    doc,
  )

= Introdução
No relatório será apresentado o desenvolvimento de um relógio digital, utilizando diferentes metodos e evoluções do código, começando com um clock de 50MHz e posteriormente utilizando um PLL para a geração de um sinal de clock de 10 kHz.

#pagebreak()
= Resolução
== Adicionar o centesimo
A primeira parte do projeto foi a adição do centésio de segundo.
Inicialmente foi-se dado um código para ser adaptado. O código trabalhado tinha os contadores de segundos e de minutos.

Esta parte foi a adição do centésio de segundo.

A visualização do rtl ficou da seguinte maneira:

#figure(
  image("./Figuras/q1.png",width:90%),
  caption: [
   Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

== Adicionar PLL
A segunda parte do projeto foi a adição de um coponente que converte de um clock de 50MHz para um de 10 KHz 

#figure(
  image("./Figuras/q2.png",width:90%),
  caption: [
     Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

== Modificar contadores para o BCD
A terceira parte do projeto foi a remoção do conversores BCD e contando diretamente os valores em BCD 

#figure(
  image("./Figuras/q3.png",width:90%),
  caption: [
     Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

== Modificar para o LFSR
A quartar parte é remover os contadores e substitui-los por LFSR
#figure(
  image("./Figuras/q4.png",width:90%),
  caption: [
     Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
== Comparativos
Como pedido , foi analizada as diferenças entres os resultados feitos nas diferentes partes.
#align(center)[
#table(
  columns: (auto,auto,auto,auto,auto),
  align: center,
  [],[Binario],[Binario],[BCD],[BCD],
[],[50M],[FreqGrupo],[FreqGrupo],[FreqGrupo LFSR],
  [LE],[262],[249],[86],[73],
  [Register],[124],[129],[37],[37],

)
]
== Conclusão
A partir da implementação das diferentes partes foi possível analizar a otimização dos sistemas.

A utilização e redução de elementes mostra diretamente como a otimização pode afetar o espaço oculpado pelo código. 

A primeira etapa do Binario transicionando da primeira parte para a utilização do PLL reduzil a utilização de alguns elementos lógicos.

A transição da segunda parte para a terceira foi a maior otimização , evitar códigos que convertem binário para BCD economizaram vários elementos lógicos.

A terceita para quarta teve uma leve otimização , optando por não utilizar um contador convencional mas sim um contador LFSR