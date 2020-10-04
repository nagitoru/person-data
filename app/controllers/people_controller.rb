class PeopleController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @people = current_user.people
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to root_path
    else
      render :new
    end
  end

  def search
    if params[:keyword] == ""
      redirect_to root_path
    else
      @people = Person.search(params[:keyword]).where(user_id: current_user.id)
    end
  end

  def show
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :first_name_reading, :last_name_reading, :hobby, :free_space, :email, :birthday).merge(user_id: current_user.id)
  end

  def set_item
    @person = Person.find(params[:id])
  end
end
