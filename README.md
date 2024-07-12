# Desafio Flutter
Um aplicativo simples passado como objetivo no desafio.
Devido ao projeto a ser realizado conter apenas uma tela e tendo como objetivo agilizar o desenvolvimento, a maioria das funcionalidades será desenvolvida em uma mesma branch.

## Contexto importante: </br>
Ao realizar testes do genero, é de meu interesse estudar tecnologias que não conheço. Como resultado pode existir código não utilizado, incoerente ou não perfeito. Este projeto foi utilizado para estudo da arquitetura bloc.

## Sobre o Layout:
* Abordei o projeto levando a frase a seguir no sentido literal "Esperamos que o layout fique o mais próximo possível do layout fornecido.". Por isso sacrifiquei um pouco a adaptabilidade da tela, para demonstrar atenção aos detalhes do figma. Isto pode causar imperfeições na tela ao executar em dispositivos com telas muito pequenas ou muito grandes(como tablets). </br>
* Separei a tela disponibilizada no figma em 5 seções, criando widgets reaproveitaveis para algumas partes. As seçõres estão em screens/main_route e estão nomeadas de acordo com a ordem que aparecem no figma de A_ até E_. </br>
* Como informado na seção contexto, como o projeto foi utilizado para estudos a classe _OpenJobsScreenStatefulWidget acabou ficando mais complexa do que o desejado, podendo ser dividida ou refatorada se houver tempo. </br>

## Mudanças importantes pendentes
 * Tratamento de erro das requisições Http e de banco de dados. (Importante, causa telas brancas)
 * Separar a lógica de requisições para um controlador ou usecase fora da Ui na classe OpenJobs
 * Criar constantes para as URI's das imagens assets

## Realizado: </br>
 * Layout fiel ao figma, seguindo as margens e pixels exatos. 
 * Acesso ao WebView demonstrando o item clicado
 * Testes unitários simples de banco de dados e modelo.
 
## Opcionais realizados: </br>
 * Adicionado banco de dados offline SQLite utilizando a biblioteca sqflite.
 * uma forma simples de Paginaçao foi desenvolvida em conjunto com o sqflite.
 * Adicionada uma abordagem "offline first" em conjunto com o banco de dados.

## Opcionais abandonados: </br>
* Tratamento de erros e respostas das chamadas de API e banco de dados não foram adicionados.
* Por falta de tempo animações no layout foram removidas do escopo.
* Orm, para uma melhor organização de tempo optei pelo sqflite que se assemelha ao ROOM do Android.
* Testes automatizados de Interface não foram realizados.
* Injeção de dependencia, por experiência no android DI podem ser simples(Koin, Hilt) ou complexos(dagger2), para evitar problemas relacionados a tempo e garantir uma entrega completa evitei esta opção.

## Problemas detectados: </br>
* Existe um problema no tratamento da requisição do Dio, em que algumas vezes um erro pode acontecer e a tela ficar branca, a solução é o tratamento da requisição do banco de dados e http.

