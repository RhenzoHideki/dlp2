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

== Implementação somador BCD
Resultados , .do , rtlviwer.

== Comparação somador bin2bcd
Area da implementação

= Conclusão