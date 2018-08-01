class AuthorsController < ApplicationController

  def show
    find_author
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.create(author_params)
    if @author.valide?
      redirect_to author_path(@author)
    else 
      render :new 
    end     
  end

  def edit
    find_author
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end

  def find_author
    @author = Author.find(params[:id])
  end
end
