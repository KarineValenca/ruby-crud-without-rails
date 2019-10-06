require "./controllers/pages_controller"
require "./controllers/tags_controller"

class Main

    page = PagesController.create(1, "teste", "teste", "titulo", "description", "bla bla")
    #page2 = PagesController.create(2, "testes", "testes", "titulos", "descriptions", "bla blas")

    page_list = []
    page_list << page
    #page_list << page2

    #PagesController.read(page_list, 1)

    PagesController.update(page_list, 2, "slug", "novo teste")
    #PagesController.delete(page_list, 1)

    tag = TagsController.create(1, "tag test")
    # tag2 = TagsController.create(2, "tag new")

    tag_list = []
     tag_list << tag
    # tag_list << tag2

    TagsController.read(tag_list, 2)
    TagsController.update(tag_list, 1, "name", "new name")
    # # TagsController.delete(tag_list, 2)
    # PagesController.add_tag(page_list, 1, tag_list, 1)
    # PagesController.add_tag(page_list, 1, tag_list, 2)

    
end