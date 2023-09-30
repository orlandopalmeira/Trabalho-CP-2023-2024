## Eliminação de uma multiplicação redundante dentro do ciclo for
Havia uma multiplicação `4*epsilon` dentro do ciclo for. Como a variável
`epsilon` não depende do que acontece dentro do ciclo, então é melhor
que cálculo `4*epsilon` seja feito fora do ciclo. Para isso, criamos a variável
`double epsilon4` cujo valor é `4*epsilon`.

## Eliminação da raíz quadrada e dos `pow`
```c

/*
term1 = quot^12 = (quot^6)^2 = ((quot^3)^2)^2 = (((sigma/rnorm)^3)^2)^2 = 
(sigma/rnorm)^3^2^2 = (sigma/sqrt r2)^3^2^2 = sigma^3^2^2 / (sqrt r2)^3^2^2 = sigma^3^2^2 / r2^3^2 = sigma^6^2 / r2^6 = 
(sigma^6 / r2^3)^2 = term2 * term2

term2 = quot^6 = quot^3^2 = (sigma/rnorm)^3^2 = (sigma/sqrt r2)^3^2 = sigma^3^2 / (sqrt r2)^3^2 = sigma^3^2 / r2^3 = sigma^6 / r2^3

Sejam sigma6 = sigma^6, r2_3 = r2^3

term1 = term2 * term2
term2 = sigma6 / r2_3
*/
```
$
term1 = quot^{12} = (quot^6)^2 = ((quot^3)^2)^2 = (((\frac{sigma}{rnorm})^3)^2)^2 = (((\frac{sigma}{\sqrt{r2}})^3)^2)^2 = \frac{((sigma^3)^2)^2}{(((\sqrt{r2})^3)^2)^2} = \frac{((sigma^3)^2)^2}{(r2^3)^2} = \frac{(sigma^6)^2}{(r2^3)^2} = 
(\frac{sigma^6}{r2^3})^2 = term2 * term2
$

$
term2 = quot^6 = (quot^3)^2 = ((\frac{sigma}{rnorm})^3)^2 = ((\frac{sigma}{\sqrt{r2}})^3)^2 = \frac{(sigma^3)^2}{r2^3} = \frac{sigma^6}{r2^3}
$

## Ainda falta aqui as cenas do `rikMenosrjk` e assim