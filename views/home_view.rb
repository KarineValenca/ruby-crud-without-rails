require "./views/pages_view"
require "./views/tags_view"

class HomeView
    
    def self.main_menu
        option = 0

        loop do
            print "=================================\n"
            print "Gerenciador de páginas web \n"
            print "=================================\n"
            print "Escolha o que deseja fazer\n
            1. Gerenciar Páginas\n
            2. Gerenciar Tags\n"
            option = gets.to_i
            break if option == 1 || option == 2
        end
            
        if option == 1 
            PagesView.print_view
        elsif option == 2
            TagsView.print_view
        end
    end
end