require "./controllers/pages_controller"
require './fake_db'

class PagesView
    def self.print_view
        option = 0
        loop do
            print "Escolha o que deseja fazer
                1. Criar página
                2. Mostrar Página
                3. Atualizar Página
                4. Excluir Página
                5. Adicionar tag a uma página\n"

            option = gets.to_i  
            break if option > 0 && option < 6
        end

        if option == 1
            print "Criando página... Passe os seguintes atributos:\n"
            print "id: " 
            id = gets.to_i
            print "Nome: "
            name = gets.chomp
            print "Slug: "
            slug = gets.chomp
            print "Configuração da página\n"
            print "Título: "
            title = gets.chomp
            print "Descrição: "
            description = gets.chomp
            print "Palavras-chave: "
            keywords = gets.chomp
            PagesController.create(id, name, slug, title, description, keywords)
            print_view
        end

        if option == 2
            print "Qual id da página que deseja visualiar?"
            id = gets.to_i
            PagesController.read(FakeDb.list_pages, id)
            print_view
        end

        if option == 3
            print "Atualizando página, passe os atributos:\n"
            print "id: "
            id = gets.to_i
            print "attributo: "
            #TO DO: map do portugues para ingles
            attribute = gets.chomp
            print "valor: "
            value = gets.value
            PagesController.update(FakeDb.list_pages, id, attribute, value)
            print_view
        end

        if option == 4
            print "Qual id da página que deseja excluir?"
            id = gets.to_i
            PagesController.delete(FakeDb.list_pages, id)
            print_view
        end


        # TO DO: Finalizar aqui
        if option == 5

        end
    end
end