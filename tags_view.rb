require './controllers/tags_controller'

class TagsView

    def self.print_view
        option = 0
        loop do
            print "Escolha o que deseja fazer
                    1. Criar tag
                    2. Mostrar tag
                    3. Atualizar tag
                    4. Excluir tag"
                    option = gets.to_i  
            break if option > 0 && option < 5
        end

        if option == 1
            print "Criando tag... Passe os seguintes atributos:\n"
            print "id: " 
            id = gets.to_i
            print "Nome: "
            name = gets.chomp
            TagsController.create(id, name)
            print_view
        end

        if option == 2
            print "Qual id da tag que deseja visualizar?\n"
            id = gets.to_i
            TagsController.read(id)
            print_view
        end

        if option == 3
            print "Atualizando tag, passe os atributos:\n"
            print "id: "
            id = gets.to_i
            print "attributo: "
            #TO DO: map do portugues para ingles
            attribute = gets.chomp
            print "valor: "
            value = gets.chomp
            TagsController.update(id, attribute, value)
            print_view
        end

        if option == 4
            print "Qual id da tag que deseja excluir?"
            id = gets.to_i
            TagsController.delete(id)
            print_view
        end
    end
    
end