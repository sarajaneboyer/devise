class HobbiesController < ApplicationController

  before_action :set_hobby, only: [:show, :edit, :update]

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

  def update
    if @hobby.update(hobby_params)
      redirect_to hobbies_path
    else
      render :edit
    end
  end

  def destroy
    @hobby.destroy
    redirect_to hobbies_path
  end

  private

  def hobby_params
    params.require(:hobby).permit(:name)
  end

  def set_hobby
    @hobby = current_user.hobbies.find(params[:id])
  end
end
