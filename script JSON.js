//A clase Produto que é utilizada para cadastro de todos os produtos no sistema
class Produto{
    constructor(codProduto, descricao, preco, qtdEstoque, disponivel, emDestaque, idDepto, nomeDepto){
        this.codProduto = codProduto;
        this.descricao = descricao;
        this.preco = preco;
        this.qtdEstoque = qtdEstoque;
        this.disponivel = disponivel;
        this.emDestaque = emDestaque;
        this.idDepto = idDepto;
        this.nomeDepto = nomeDepto;
    }
}

//Os produtos que ja estao na base, cada um com sua informação
let Prod1 = new Produto(1234, "Computador Dell Inspiron XS 12000 8Gb RAM 1 TB HD Intel i5 4g NVidia 1080", 3500.00, 5, "Sim", "Sim", 987,"Informatica e acessórios");
let Prod2 = new Produto(2345, "Caneta Azul Bic", 1.00, 50, "Sim", "Não", 15,"Papelaria");
let Prod3 = new Produto(3456, "Motora V3 Preto", 1000.00, 7, "Sim", "Sim", 77,"Celulares e acessórios");
let Prod4 = new Produto(4567, "Energético Monster Azul Mango", 10.00, 48, "Sim", "Sim", 17,"Bebidas não Alcoolicas");
let Prod5 = new Produto(5678, "Moedinha de Chocolate", 0.20, 100, "Não", "Não", 123,"Doces e Balas");
var Produtos = [Prod1, Prod2, Prod3, Prod4, Prod5]

//Vendo as caracteristicas dos produtos
console.log(Prod1);
console.log(Prod2);
console.log(Prod3);
console.log(Prod4);

//#region - 1 - Quantidade total de itens em estoque (somatória das quantidades de todos os produtos)
//Metodo facil
console.log(`1. O total de itens em estoque é de ${Prod1.qtdEstoque + Prod2.qtdEstoque + Prod3.qtdEstoque + Prod4.qtdEstoque + Prod5.qtdEstoque}`);

//Metodo complexo
var i=0;var totalEstoque = 0;
for(i; i < Produtos.length; i++){
    totalEstoque += Produtos[i].qtdEstoque;
}
console.log(`1. O total de itens em estoque é de ${totalEstoque}`);
//#endregion

//#region - 2 - Quantidade total de itens em destaque (somatória das quantidades dos itens marcados como "emDestaque : sim")
var i=0;var totalEmDestaque = 0;
for(i; i < Produtos.length; i++){
    if(Produtos[i].emDestaque == "Sim"){
        totalEmDestaque += Produtos[i].qtdEstoque;
    }
}
console.log(`2. O total de itens em destaque em estoque é de ${totalEmDestaque}`);
//#endregion

//#region - 3 - Quantidade total de itens disponíveis (similar ao anterior)
var i = 0;var totalDisponivel = 0;
for(i; i < Produtos.length; i++){
    if(Produtos[i].disponivel == "Sim"){
        totalDisponivel += Produtos[i].qtdEstoque;
    }
}
console.log(`3. O total de itens disponiveis em estoque é de ${totalDisponivel}`);
//#endregion

//#region - 4 - Valor total do inventário da empresa (somatória dos valores individuais multiplicado pela quantidade em estoque)
var i = 0; var valorTotalInventario = 0;
for(i; i < Produtos.length; i++){
    valorTotalInventario += Produtos[i].qtdEstoque * Produtos[i].preco;
}
console.log(`4. O valor total do inventário é de R$ ${valorTotalInventario}`);
//#endregion

//#region - 5 - Somatória de itens por departamento (você deverá retornar um objeto contendo o nome do departamento e o total de itens nele)
var i=0;
for(i; i < Produtos.length; i++){
    var j=0; var totalItensDepartamento = 0;
    for(j; j < Produtos.length; j++){
        if(Produtos[j].idDepto == Produtos[i].idDepto){
            totalItensDepartamento+=Produtos[j].qtdEstoque;
        }
    }
    console.log(`5.${i+1}. O total de itens no departamento ${Produtos[i].idDepto} - ${Produtos[i].nomeDepto} é de ${totalItensDepartamento}`);
}
//#endregion

//#region - 6 - Valor total do inventário por departamento (similar ao item anterior)
var i=0;
for(i; i < Produtos.length; i++){
    var j=0; var valorTotalItensDepartamento = 0;
    for(j; j < Produtos.length; j++){
        if(Produtos[j].idDepto == Produtos[i].idDepto){
            valorTotalItensDepartamento+=Produtos[j].preco *Produtos[j].qtdEstoque;
        }
    }
    console.log(`6.${i+1}. O valor total do departamento ${Produtos[i].idDepto} - ${Produtos[i].nomeDepto} é de R$ ${valorTotalItensDepartamento}`);
}
//#endregion

//#region - 7 - Valor do ticket médio dos produtos da empresa (basicamente o valor total do inventário dividido pelo número de itens)
var ticketMedioInventario = valorTotalInventario/totalEstoque;
console.log(`7. O ticket médio dos itens é de R$ ${ticketMedioInventario.toFixed(2)}`);
//#endregion

//#region - 8 - Ticket médio por departamento (similar ao item anterior, porém retornando uma lista de objetos que contenha o nome do departamento e o seu ticket médio)
var i=0;
for(i; i < Produtos.length; i++){
    var j=0; var ticketMedioInventarioDep = 0; var estoqueTotalDepartamento = 0;var ticketMedioProdutoDepartamento=0;
    for(j; j < Produtos.length; j++){
        if(Produtos[j].idDepto == Produtos[i].idDepto){
            ticketMedioProdutoDepartamento+=Produtos[j].preco *Produtos[j].qtdEstoque;
            estoqueTotalDepartamento+=Produtos[j].qtdEstoque;
        }
    }
    ticketMedioInventarioDep = ticketMedioProdutoDepartamento/estoqueTotalDepartamento;
    console.log(`8.${i+1}. O valor total do departamento ${Produtos[i].idDepto} - ${Produtos[i].nomeDepto} é de R$ ${ticketMedioInventarioDep.toFixed(2)}`);
}
//#endregion

//#region - 9 - Departamento mais valioso (qual o departamento que tem a maior somatória dos valores dos itens)
var i = 0;
Valores = [];
Departamento = [];
for (i; i < Produtos.length; i++) {
    var j = 0;
    var valorTotalItensDepartamento = 0;
    for (j; j < Produtos.length; j++) {
        if (Produtos[j].idDepto == Produtos[i].idDepto) {
            valorTotalItensDepartamento += Produtos[j].preco * Produtos[j].qtdEstoque;
        }
    }
    Valores.push(valorTotalItensDepartamento);
    Departamento.push(i);
}

valorMaxDepartamento = Math.max.apply(null, Valores);
idMaxDepartamento = Departamento[Valores.indexOf(valorMaxDepartamento)];
console.log(`9. O departamento mais valioso é o ${Produtos[idMaxDepartamento].idDepto} - ${Produtos[idMaxDepartamento].nomeDepto} com valor de R$ ${valorMaxDepartamento.toFixed(2)}`);
//#endregion

//#region - 10 - Produto mais caro da loja (bem como seu departamento)
var i = 0;
Valores = [];
Indice = [];
for (i; i < Produtos.length; i++) {
    Valores.push(Produtos[i].preco * Produtos[i].qtdEstoque);
    Indice.push(i);
}

valorMaxItem = Math.max.apply(null, Valores);
indiceMaxItem = Indice[Valores.indexOf(valorMaxItem)];
console.log(`10. O produto mais caro é o ${Produtos[indiceMaxItem].codProduto} - ${Produtos[indiceMaxItem].descricao} no departamento ${Produtos[indiceMaxItem].idDepto} - ${Produtos[indiceMaxItem].nomeDepto} com valor de R$ ${valorMaxItem.toFixed(2)}`);
//#endregion

//#region - 11 - Produto mais barato da loja (bem como seu departamento)
var i = 0;
Valores = [];
Indice = [];
for (i; i < Produtos.length; i++) {
    Valores.push(Produtos[i].preco * Produtos[i].qtdEstoque);
    Indice.push(i);
}

valorMinItem = Math.min.apply(null, Valores);
indiceMinItem = Indice[Valores.indexOf(valorMinItem)];
console.log(`11. O produto mais barato é o ${Produtos[indiceMinItem].codProduto} - ${Produtos[indiceMinItem].descricao} no departamento ${Produtos[indiceMinItem].idDepto} - ${Produtos[indiceMinItem].nomeDepto} com valor de R$ ${valorMinItem.toFixed(2)}`);
//#endregion