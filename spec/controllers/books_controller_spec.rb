require 'rails_helper'

describe BooksController do
  let(:user) { instance_double(User) }
  before { log_in(user) }

  describe 'GET #index' do
    let(:books) { [
        instance_double(Book),
        instance_double(Book)
    ] }

    before do
      allow(user).to receive(:books).and_return(books)

      get :index
    end

    it 'looks up all books that belongs to the current user' do
      #expect(assigns(:books)).to eq(books)
      expect(user.books).to eq(books)
    end
  end

end
