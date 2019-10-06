require "./controllers/pages_controller"

class Main

    page = PagesController.create(1, "teste", "teste", "titulo", "description", "bla bla")
    #page2 = PagesController.create(2, "testes", "testes")

    page_list = []
    page_list << page
    #page_list << page2

    PagesController.read(page_list, 1)

    #PagesController.update(page_list, 1, name, "novo teste")
    #PagesController.delete(page_list, 1)
    
end