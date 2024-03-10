#import "../typst-ifsc/template/article.typ": article


  #show: doc => article(
    title: "Relatorio 01",
    subtitle: "DISPOSITIVOS LÓGICOS PROGRAMÁVEIS II (DLP029007 )",
    // Se apenas um autor colocar , no final para indicar que é um array
    authors:("Rhenzo Hideki Silva Kajikawa",),
    date: "20 de Setembro de 2023",
    doc,
  )

= Caminho crítico dos operadores

Faça a implementação de um somador para valores de 16 bits sem sinal. Escreva 5 implementações em VHDL para as operações abaixo. Sintetize usando o Quartus e o dispositivo da DE2-115.

a) a+b

b) a + "0000000000000001"

c) a + "0000000010000000"

d) a + "1000000000000000"

e) a + "1010101010101010"

Verifique a área (LE) e atraso (ns) para cada implementação.

Discussão:

Qual implementação usou menos área? Por quê? Como o delay se comportou?

Comente as diferenças entre os valores de área e delay obtidos nas operações a), b) e c).

#pagebreak()
= Resultados
#align(center)[
#table(
  columns: (auto,auto,auto),
  align: center,
  [],[Área(LE)],[Delay(ns)],
  [a) a+b],[16 / 114,480 ( < 1 % )],[9.24],
  [b) a + "0000000000000001],[15 / 114,480 ( < 1 % )],[6.966],
  [c) a + "0000000010000000],[8 / 114,480 ( < 1 % )],[5.803],
  [d) a + "1000000000000000],[0 / 114,480 ( 0 % )],[3.455],
  [e) a + "1010101010101010],[14 / 114,480 ( < 1 % )],[7.515],
)
]
== Qual implementação usou menos área? Por quê? Como o delay se comportou?
A implementação com menos área e delay é a implementação _D_. Isso ocorre pois ela é uma implementação que pode acontecer com somadores localizados nos buffers de IO da placa. Por esse motivo , não aparece no relatorio gerado pelo Quartus nenhum elemento lógico sendo utilizado e também por não depender de nenhum somador seu delay acaba sendo baixo.

== Comente as diferenças entre os valores de área e delay obtidos nas operações a), b) e c)
A diferenças das operações de _A_, _B_ e _C_ se devem ao fato das diferentes posições possiveis com o valor de bit 1. A operação _A_ tem a maior área pois é necessária garantir que a soma cubra todos o valores de bits. A operação _B_ tem o valor de _b_ fixo , dessa forma foi utilizado 1 somador a menos. Por fim a operação c como os bits que precedem o 1 são 0 não irão gerar nenhum Carry para a soma então é apenas necessário garantir somadores apartir do bit 1.