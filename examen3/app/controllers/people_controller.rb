class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]


  def index
    @people = Person.all
  end


  def new
    @person = Person.new
  end
  
  
  def show
  end

  
  def edit
  end


  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Persona registrada exitosamente.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Datos actualizados exitosamente.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Persona elimindad correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:identification, :first_name, :second_name, :first_last_name, :second_last_name, :document_id, :role_id)
    end
end
