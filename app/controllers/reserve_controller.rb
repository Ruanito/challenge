class ReserveController < ApplicationController
  before_action :validate_params, :validate_book_status

  # create custom error for bad request 
  # deal bad request and return 400 to user 

  def create
    Reserve.transaction do
      reserve = Reserve.save(book: book, user_email: user.email)
      Book.update(params[:id], {:status => :reserved})
    end

    render json: reserve
  end

  private 

    def validate_params
      raise "Not found" unless Book.exist?(id: params[:id]) || User.exist?(email: params[:email])
    end

    def validate_book_status
      raise "Reserved book" if book.status = :reserved
    end

    def book
      Book.find_by id: params[:id]
    end

    def user
      User.find_by email: params[:email]
    end
end
