#import "../typst-ifsc/template/article.typ": article


  #show: doc => article(
    title: "Somador BCD - 2 dígitos",
    subtitle: "DISPOSITIVOS LÓGICOS PROGRAMÁVEIS II (DLP029007 )",
    // Se apenas um autor colocar , no final para indicar que é um array
    authors:("Matheus ,Rhenzo Hideki Silva Kajikawa",),
    date: "20 de Setembro de 2023",
    doc,
  )

 = Descrição
\ Muitos painéis de instrumentos usam o formato decimal codificado em binário (BCD), no qual 10 dígitos decimais são codificados usando 4 bits.
\ Durante uma operação de adição BCD, se a soma de um dígito exceder 9, 10 serão subtraídos do dígito atual e um carry será gerado para o próximo dígito.
\ Dessa forma, projete um somador BCD de 2 dígitos que tenha duas entradas de 8 bits, representando dois números BCD de 2 dígitos, e uma saída, que seja um número BCD de 3 dígitos (12 bits).


#pagebreak()
= Resolução
== Diagramação 

Foram feitas 2 diagramações para o projeto. Uma com o enfoque no projeto maior , mostrando todos os componentes utilizados , já o segundo diagrama teve como objetivo mostrar o somador utilizado.

#figure(
  image("./Figuras/EsquematicaAP1.svg",width:90%),
  caption: [
     Esquematica do projeto completo \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

#figure(
  image("./Figuras/somadorBCD-componente.svg",width:90%),
  caption: [
     componente somador BCD \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

Nas figuras é possivel visualizar a maior parte da elaboração da atividade.

A figura 1 demonstra como serão feitas as entradas e saida, por exemplo ambas as entradas são 8 bits utilizando BCD. Existem 2 pares de saídas que são representandas por displays de 7 segmentos para indicar quais valores foram inseridos na entrada , e após a soma existem 3 displays para mostrar o resultado da soma.

Na figura 2 pode ser ver o somador implementado para essa atividade, um somador BCD. Neste é possiveis observar a soma das unidades , uma verificação se existe ou não carry e paralelamente a soma das dezenas com um processo similar.

#pagebreak()
== Implementação somador BCD
Resultados que foram obtidos fazendo o código do somador BCD.
\ Como projetado no diagrama , a implementação do código seguiu de forma similar. A utilização de 2 somadores BCDs ao invés de 1 somador BCD foi feita pois facilitava a adaptação do código.


#figure(
  image("./Figuras/rtlviewer-ap1.png",width:100%),
  caption: [
     rtl viewer projeto completo \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

#figure(
  image("./Figuras/modelsim-adder.png",width:100%),
  caption: [
     modelsim somador bcd \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);

Na figura 4 é possivel observar o teste feito para um somador BCD

#figure(
  image("./Figuras/modelsim-ap1.png",width:100%),
  caption: [
     modelsim projeto completo \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
Na figura 5 foi feito o teste completo , mostrando todas as entradas e saidas do sistema em diferentes situações.


== Implementação somador bin2bcd
Como pedido pelo exercício , foi feita uma segunda versão que não utilizava BCD como entrada , mas sim entradas binárias.

#figure(
  image("./Figuras/rtlviewer-ap2.png",width:100%),
  caption: [
     rtl viewer projeto completo \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
A figura 6 mostra a abordagem feita para o somador de binários.


#figure(
  image("./Figuras/modelsim-ap2.png",width:100%),
  caption: [
     modelsim projeto completo \ Fonte: Elaborada pelo autor
  ],
  supplement: "Figura"
);
A figura 7 mostra o teste feito para certificar que o código está funcionando da forma esperada.

== Comparação
Apesar do somador bin2bcd ter menos componentes pensados na sua implementação, utilizando o relatórios gerados pela compinalção no Quartus 2 , o total de números de elementos lógicos utilizados for de 245 / 114,480 contra os 108 / 114,480 utilizados no somador BCD .

O total de elementos logícos mostra o quão custoso é a conversão de binário para BCD , uma vez que se baseia em calculos como divisão e multiplicação para poder separar a unidade , dezena e centena do valor.

Além disso é possivel analisar a diferença através da analise de tempo , o somador BCD se provou mais rapido que o somador bin2bcd. O somador BCD levou 3.823 ns enquanto o somador bin2bcd levou 11.589 , mais que o dobro de tempo.

#align(center)[
#table(
  columns: (auto,auto,auto,),
  align: center,
  [],[somador BCD],[somador bin2bcd],
  [Área(LE)],[245/114480],[108/114480],
  [Delay sem IO (ns)],[3.823],[11.589],  
  );
]

= Conclusão
Por fim a atividade apresentou como a abordagem de diferentes formas pode impactar a eficiencia de um simples somador.Foram implementados dois somadores BCD em paralelo, permitindo a correta soma dos dígitos individuais e o gerenciamento adequado dos carries entre os dígitos. Além disso, uma implementação alternativa utilizando um somador binário para BCD foi realizada, oferecendo uma opção para lidar com números binários em vez de BCD. A comparação entre os dois métodos revelou a complexidade adicional envolvida na conversão de binário para BCD, destacando a eficiência do projeto BCD original. Em resumo, o projeto demonstrou soluções bem elaboradas para a adição de números BCD de 2 dígitos, mostrando um entendimento sólido dos conceitos de lógica digital e dispositivos programáveis.