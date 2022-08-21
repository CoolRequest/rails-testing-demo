require 'rails_helper'

RSpec.describe "/to_dos", type: :request do
  
  let(:valid_attributes) {
    {
      title: 'to-do title',
      description: 'do something',
      due_date: Date.today + 10
    }
  }

  let(:invalid_attributes) {
    {
      title: '',
      description: 'do something',
      due_date: Date.today + 10
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      ToDo.create! valid_attributes
      get to_dos_path
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      to_do = ToDo.create! valid_attributes
      get to_do_path(to_do)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_to_do_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      to_do = ToDo.create! valid_attributes
      get edit_to_do_path(to_do)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do

    context "with valid parameters" do
      it "creates a new ToDo" do
        expect {
          post to_dos_path, params: { to_do: valid_attributes }

        }.to change(ToDo, :count).by(1)
      end

      it "redirects to the created to_do" do
        post to_dos_path, params: { to_do: valid_attributes }

        expect(response).to redirect_to(to_do_path(ToDo.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ToDo" do
        expect {
          post to_dos_path, params: { to_do: invalid_attributes }

        }.to change(ToDo, :count).by(0)
      end

      it "renders a response with http status 422" do
        post to_dos_path, params: { to_do: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    
    context "with valid parameters" do
      it "updates the requested to_do" do
        to_do = ToDo.create! valid_attributes
        
        patch to_do_path(to_do), params: { to_do: { title: 'new title' } }
        
        to_do.reload
        expect(to_do.title).to eq 'new title'
      end

      it "redirects to the to_do" do
        to_do = ToDo.create! valid_attributes

        patch to_do_path(to_do), params: { to_do: { title: 'new title' } }

        to_do.reload
        expect(response).to redirect_to(to_do_path(to_do))
      end
    end

    context "with invalid parameters" do

      it "renders a response with http status 422" do
        to_do = ToDo.create! valid_attributes
        
        patch to_do_path(to_do), params: { to_do: invalid_attributes }
        
        expect(response).to have_http_status(:unprocessable_entity)
      end

    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested to_do" do
      to_do = ToDo.create! valid_attributes
      expect {
        delete to_do_path(to_do)
      }.to change(ToDo, :count).by(-1)
    end

    it "redirects to the to_dos list" do
      to_do = ToDo.create! valid_attributes
      delete to_do_path(to_do)
      expect(response).to redirect_to(to_dos_path)
    end
  end

  describe "POST /export" do
    it "enqueues a ExportToDoJob" do
      to_do = ToDo.create! valid_attributes
      
      post export_to_do_path(to_do)
      
      expect(ExportToDoJob).to have_been_enqueued
    end
  end
end
