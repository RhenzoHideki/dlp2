
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

A implementação teve 2 etapas. Primeiramente ajustando o código que foi dado em aula e o adaptando para adicionar mais uma contagem , sendo essa os centisegundos . A segunta parte foi corrigir a contagem do clock , isso ocorreu pois o código original contava para o ciclo de 50 MHz seria igual a 1 segundo, porém agora seria necessário contar valores abaixo de 1 segundo , e como queriamos contra o centisegundo a adaptação foi dividir os contadores que geravam 1 segundo por 100 , dessa forma foi possível obter o centésimo de segundo.

Esta parte foi a adição do centésio de segundo.

A visualização do rtl ficou da seguinte maneira:

#figure(
  image("./Figuras/q1.png",width:90%),
  caption: [
   Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
Visualização do .do para testar o código
#figure(
  image("./Figuras/q1t.png",width:90%),
  caption: [
   Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

== Adicionar PLL
A segunda parte do projeto foi a implementação da componente que converte o clock de 50MHz para 10KHz.
A adição do PLL foi dada da seguinte forma :  
\ Compilar o código, seguir na aba ipcatalog e procurar pelo elemento ALTPLL
#figure(
  image("./Figuras/ipcatalog.png",width:50%),
  caption: [
   Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

Selecionando o elemente ALTPLL será aberto uma aba nova, nesta aba serão configuradas os elementos para ser gerado o pll desejado.
Primeiramente colaca-se a frequência correta de entrada em inclk0 input.
#figure(
  image("./Figuras/ppl1.png",width:90%),
  caption: [
   Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
#pagebreak()
Após colocar a frênquencia de entrada correta , é colocado na terceira pagina das configurações em "Output clock", nessa aba é necessário selecionar "Enter output clock frequency" para ajustar a frequência deseja, no caso deste projeto foi decidida a frequência de 10 MHz
#figure(
  image("./Figuras/ppl2.png",width:90%),
  caption: [
   Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

Após a selecionar a frequência de saída , pula-se para a ultima etapa e seliciona-se tanto os arquivos com final .cmp e .vhd
#figure(
  image("./Figuras/ppl3.png",width:90%),
  caption: [
   Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

Desta forma é gerado o arquivo PLL , que deverá ser inserido no top-level do código do projeto desejado.

Abaixo parte do código gerado , nele é possivel ver os parâmetros para a converção de clock que ocorre
```vhdl
	GENERIC MAP (
		bandwidth_type => "AUTO",
		clk0_divide_by => 5000,
		clk0_duty_cycle => 50,
		clk0_multiply_by => 1,
		clk0_phase_shift => "0",
		compensate_clock => "CLK0",
		inclk0_input_frequency => 20000,
```

Após inserir o pll o novo RTL ficou desta maneira:

#figure(
  image("./Figuras/q2.png",width:90%),
  caption: [
     Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

Uma visualização do .do sendo executado para vizualizar o funcionamento do pll 
#figure(
  image("./Figuras/q2t.png",width:90%),
  caption: [
   Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

#pagebreak()
== Modificar contadores para o BCD
Nesta etapa do projeto foi desejada a remoção dos conversores BCD vistos nos RTLs anteriores.

Para a adaptação do projeto foi primeiramente necessário remover os conversores Bin2BCD. Após esta remoção foi feita uma adaptação no código de contagem timer , esta que envolveu ao invés de contar-se os valores de unidade e decimais juntos , foi alterado para contagens separadas.

Desta forma as contagens sairam de forma separada em unidade e decimal dos centisegundos , segundos e minutos. Dessa forma cumprindo o requisito da parte 3.

Abaixo está o RTL da parte 3 , nele é possivel ver que houve a remoção dos conversores.
#figure(
  image("./Figuras/q3.png",width:90%),
  caption: [
     Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

#figure(
  image("./Figuras/q3t.png",width:90%),
  caption: [
   Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);


#figure(
  image("./Figuras/q3t2.png",width:90%),
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
#pagebreak()
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
= Conclusão
A partir da implementação das diferentes partes foi possível analizar a otimização dos sistemas.

A utilização e redução de elementes mostra diretamente como a otimização pode afetar o espaço oculpado pelo código. 

A primeira etapa do Binario transicionando da primeira parte para a utilização do PLL reduzil a utilização de alguns elementos lógicos.

A transição da segunda parte para a terceira foi a maior otimização , evitar códigos que convertem binário para BCD economizaram vários elementos lógicos.

A terceita para quarta teve uma leve otimização , optando por não utilizar um contador convencional mas sim um contador LFSR