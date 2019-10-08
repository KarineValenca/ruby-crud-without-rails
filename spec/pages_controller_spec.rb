require './controllers/pages_controller'
require './models/page'
require './controllers/tags_controller'

RSpec.describe PagesController do
    before :each do
        @page = PagesController.create(1, "test", "slug", "title", "description", "keyword")
    end
    context "create" do
        it "returns a page object" do
            expect(@page).to be_an_instance_of Page
        end

        it "successful create" do
            expect(@page.id).to eq 1
            expect(@page.name).to eq "test"
            expect(@page.slug).to eq "slug"
            expect(@page.config.title).to eq "title"
            expect(@page.config.description).to eq "description"
            expect(@page.config.keywords).to eq "keyword"
        end
    end

    context "read" do
        it "sucessful read" do
            @found_page = PagesController.read(1)
            expect(@found_page.id).to eq 1
            expect(@found_page.name).to eq "test"
            expect(@found_page.slug).to eq "slug"
            expect(@found_page.config.title).to eq "title"
            expect(@found_page.config.description).to eq "description"
            expect(@found_page.config.keywords).to eq "keyword"
        end

        it "unsuccessful read" do
            @found_page = PagesController.read(2)
            expect(@found_page).to eq nil
        end
    end

    context "update" do
        it "sucessful update" do
            @updated_page = PagesController.update(1, "name", "test2")
            expect(@updated_page.id).to eq 1
            expect(@updated_page.name).to eq "test2"
            expect(@updated_page.slug).to eq "slug"
            expect(@updated_page.config.title).to eq "title"
            expect(@updated_page.config.description).to eq "description"
            expect(@updated_page.config.keywords).to eq "keyword"
        end

        it "unsucessful update" do
            @updated_page = PagesController.update(2, "name", "test2")
            expect(@updated_page).to eq nil
        end
    end

    context "delete" do
        it "successful delete" do
            @updated_page_list = PagesController.delete(1)
            expect(@updated_page_list).to be_empty
        end

        it "unsuccessful delete" do
            @updated_page_list = PagesController.delete(2)
            expect(@updated_page_list).to eq nil
        end
    end

    context "add tag to page" do
        before :each do
            @tag = TagsController.create(1, "tag test")
        end

        it "successful add tag" do
            @updated_page = PagesController.add_tag(1, 1)
            expect(@updated_page.tags.first.name).to eq "tag test"
        end
        
        it "unsuccessful add tag with invalid page" do
            @updated_page = PagesController.add_tag(2, 3)
            expect(@updated_page).to eq nil
        end

        it "unsuccessful add tag with invalid tag" do
            @updated_page = PagesController.add_tag(1, 2)
            expect(@updated_page.tags.length).to eq 1
        end
    end
end