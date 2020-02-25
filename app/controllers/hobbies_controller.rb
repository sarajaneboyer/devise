class HobbiesController < ApplicationController

  def index
    @hobbies = current_user.hobbies
  end

  def show
    #BEFORE ACTION
  end

  def new
    @hobby = Hobby.new
  end

  def create
    @hobby = current_user.hobbies.new(hobby_params)

    if @hobby.save
      redirect_to hobbies_path
    else
      render :new
    end
  end

  def edit
    #BEFORE ACTION
  end

  private

  def hobby_params
    params.require(:hobby).permit(:name)
  end
end
