require 'selenium-webdriver'
driver = Selenium::WebDriver.for :firefox
#driver = Selenium::WebDriver.for :phantomjs

#ACESSANDO SUBMARINO
driver.navigate.to "http://www.submarino.com.br"
#CLICANDO LINK LIVROS
element = driver.find_element(:link, "Livros")
element.click
#CLICANDO NO PRIMEIRO LIVRO
product = driver.find_element(:class, "link-product")
product.click
#ARMAZENA NOME DO AUTOR
author_name = driver.find_element(:xpath,  "//span[@itemprop='author']/a").text

#ARMAZENA IBNS NO LIVRO
ibns = driver.find_element(:xpath,  "//p[strong[contains(.,'ISBN')]]").text.split(":").last
#ibns = driver.find_element(:xpath, "//article[@id='productDescription']/div[2]/div/section/article/table/tbody/tr[2]/td").text
#ACESSANDO AMERICANAS
driver.navigate.to "www.americanas.com.br"
#PREENCHE CAMPO DE BUSCA NO IBNS DO LIVRO
buscaA = driver.find_element(:name, "q")
buscaA.send_keys ibns
#CLICA NO BOTÃO DE BUSCA
btnBuscaA = driver.find_element(:css, "input.doSearch")
btnBuscaA.click
semRetornoA = driver.find_element(:class, "searchBox")
#CLICA NO LIVRO
livroA = driver.find_element(:css, "img.photo")
livroA.click
#BUSCAR NOME AUTOR
nomeAutorA = driver.find_element(:xpath,  "//p[contains(.,'Veja lista completa de produtos de')]/a").text
    if (nomeAutorA == author_name)
         puts "Teste passou na primeira busca!!!"
    else
         puts "Teste falhou na primeira busca."
    end
#ACESSANDO LIVRARIA CULTURA
driver.navigate.to "www.livrariacultura.com.br"
#PREENCHENDO CAMPO DE BUSCA COM IBNS DO LIVRO
buscaLC = driver.find_element(:id, "palavra")
buscaLC.send_keys ibns
btnBuscarLC = driver.find_element(:xpath, "//input[@type='image']")
btnBuscarLC.click 
#CLICAR LIVRO
livroLC = driver.find_element(:xpath,"//div[@class='img_capa']/a")
livroLC.click
#BUSCAR NOME AUTOR
nomeAutorLC =  driver.find_element(:xpath,  "//p[strong[contains(.,'Autor')]]/a").text
     if (nomeAutorLC == author_name)
          puts "Teste passou na segunda busca!!!"
     else
          puts "Teste falhou na segunda busca."
     end
end

driver.quit