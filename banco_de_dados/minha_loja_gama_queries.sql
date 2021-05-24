-- 1.Consulta contemplando contagem ou totalização
-- Contabilização do total de pedidos no sistema
use minha_loja_gama;
SELECT count(*) from pedidos;

-- 2.Consulta contemplando a junção entre 2 tabelas
-- Consulta sobre o endereço de cada cliente
use minha_loja_gama;
SELECT * from clientes
inner join enderecos
on clientes.idCliente = enderecos.clienteEndereco_Cliente;

-- Consulta sobre o pedido de cada cliente
SELECT * from clientes
inner join pedidos
on clientes.idCliente = pedidos.clientePedido_Cliente;

-- 3.Consulta contemplando a junção entre 3 tabelas
use minha_loja_gama;
-- Consulta sobre o endereço de cada cliente e sua cidade e estado
use minha_loja_gama;
SELECT * from clientes
inner join enderecos
on clientes.idCliente = enderecos.clienteEndereco_Cliente
inner join cidadeestado
on enderecos.cidadeestadoEndereco_CidadeEstado = cidadeestado.idCidadeestado;

-- Consulta sobre o pedido de cada cliente e qual o produto do pedido
SELECT * from clientes
inner join pedidos
on clientes.idCliente = pedidos.clientePedido_Cliente
inner join produtospedido
on produtospedido.idProdutoPedido_Pedido = pedidos.idPedido;

-- 4.Consulta contemplando a junção entre 2 tabelas + uma operação de totalização e agrupamento
-- Calculo do total do inventário de cada produto
use minha_loja_gama;
SELECT produtos.idProduto, produtos.codProduto, produtos.nomeProduto, produtos.precoProduto, estoque.qtdEstoque, SUM(precoProduto * qtdEstoque) as totalInvetario 
from produtos inner join estoque
on produtos.idProduto = estoque.produtoEstoque_Produto
group by produtos.idProduto;

-- 5.Consulta contemplando a junção entre 3 ou mais tabelas + uma operação de totalização e agrupamento
-- Calculo do total do inventário de cada produto com o seu respectivo departamento
use minha_loja_gama;
SELECT produtos.idProduto, produtos.codProduto, produtos.nomeProduto, produtos.precoProduto, estoque.qtdEstoque, departamentos.nomeDepartamento, SUM(precoProduto * qtdEstoque) as totalInvetario 
from produtos inner join estoque
on produtos.idProduto = estoque.produtoEstoque_Produto inner join departamentos
on produtos.departamentoProduto_Departamento = departamentos.idDepartamento
group by produtos.idProduto;
