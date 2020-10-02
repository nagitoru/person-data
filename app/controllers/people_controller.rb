class PeopleController < ApplicationController
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
    @tweets = Person.search(params[:keyword])
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :first_name_reading, :last_name_reading, :hobby, :free_space, :email, :birthday).merge(user_id: current_user.id)
  end
end
