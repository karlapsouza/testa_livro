require 'selenium-webdriver'
driver = Selenium::WebDriver.for :firefox
#driver = Selenium::WebDriver.for :phantomjs

#ACESSANDO SUBMARINO
puts "Acessando site submarino."
driver.navigate.to "http://www.submarino.com.br"
#CLICANDO LINK LIVROS
puts "Acessando menu de livros."
element = driver.find_element(:link, "Livros")
element.click
#CLICANDO NO PRIMEIRO LIVRO
puts "Click no primeiro livro da lista."
product = driver.find_element(:class, "link-product")
product.click
#ARMAZENA NOME DO AUTOR
puts "Obtendo nome do autor"
author_name = driver.find_element(:xpath,  "//span[@itemprop='author']/a").text
puts "Encontrado autor #{author_name}"

#ARMAZENA IBNS NO LIVRO
ibns = driver.find_element(:xpath, "//tr[th[contains(.,'ISBN')]]/td").text
puts "Encontrado cod IBNS #{ibns}"

#ACESSANDO AMERICANAS
puts "Acessando site americanas."
driver.navigate.to "www.americanas.com.br"
#PREENCHE CAMPO DE BUSCA NO IBNS DO LIVRO
puts "buscando por ibns #{ibns}"
buscaA = driver.find_element(:name, "q")
buscaA.send_keys ibns
#CLICA NO BOTÃO DE BUSCA
btnBuscaA = driver.find_element(:css, "input.doSearch")
btnBuscaA.click
#CLICA NO LIVRO
puts "Click no primeiro livro encontrado"
livroA = driver.find_element(:css, "img.photo")
livroA.click
#BUSCAR NOME AUTOR
puts "Obtendo nome do autor."
nomeAutorA = driver.find_element(:xpath,  "//p[contains(.,'Veja lista completa de produtos de')]/a").text
    if (nomeAutorA == author_name)
         puts "Teste passou na primeira busca!!! Encontrado autor #{nomeAutorA}"
    else
         puts "Teste falhou na primeira busca. Encontrado autor #{nomeAutorA} invés de #{author_name}"
    end
#ACESSANDO LIVRARIA CULTURA
puts "Acessando site livrariacultura"
driver.navigate.to "www.livrariacultura.com.br"
#PREENCHENDO CAMPO DE BUSCA COM IBNS DO LIVRO
puts "Buscando por ibsn #{ibns}"
buscaLC = driver.find_element(:id, "palavra")
buscaLC.send_keys ibns
btnBuscarLC = driver.find_element(:xpath, "//input[@type='image']")
btnBuscarLC.click
#CLICAR LIVRO
puts "click no primeiro livro encontrado."
livroLC = driver.find_element(:xpath,"//div[@class='img_capa']/a")
livroLC.click
#BUSCAR NOME AUTOR
nomeAutorLC =  driver.find_element(:xpath,  "//p[strong[contains(.,'Autor')]]/a").text

     if (nomeAutorLC == author_name)
          puts "Teste passou na segunda busca!!! Encontrado autor #{nomeAutorLC}"
     else
          puts "Teste falhou na segunda busca. Encontrado autor #{nomeAutorLC} ao invés de #{author_name}"
     end

driver.quit
