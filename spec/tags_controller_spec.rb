require './models/tag'
require './controllers/tags_controller'

RSpec.describe TagsController do
    before :each do
        @tag = TagsController.create(1, "tag test")
        @tag_list = [] 
        @tag_list << @tag
    end
    context "create" do
        it "returns a tag object" do
            expect(@tag).to be_an_instance_of Tag
        end

        it "successful create" do
            expect(@tag.id).to eq 1
            expect(@tag.name).to eq "tag test"
        end
    end

    context "read" do
        it "sucessful read" do
            @found_tag = TagsController.read(@tag_list, 1)
            expect(@found_tag.id).to eq 1
            expect(@found_tag.name).to eq "tag test"
        end

        it "unsuccessful read" do
            @found_tag = TagsController.read(@tag_list, 2)
            expect(@found_tag).to eq nil
        end
    end

    context "update" do
        it "sucessful update" do
            @updated_tag = TagsController.update(@tag_list, 1, "name", "tag test2")
            expect(@updated_tag.id).to eq 1
            expect(@updated_tag.name).to eq "tag test2"
        end

        it "unsucessful update" do
            @updated_tag = TagsController.update(@tag_list, 2, "name", "test2")
            expect(@updated_tag).to eq nil
        end
    end

    context "delete" do
        it "successful delete" do
            @updated_tag_list = TagsController.delete(@tag_list, 1)
            expect(@updated_tag_list).to be_empty
        end

        it "unsuccessful delete" do
            @updated_tag_list = TagsController.delete(@tag_list, 2)
            expect(@updated_tag_list).not_to be_empty
        end
    end
end