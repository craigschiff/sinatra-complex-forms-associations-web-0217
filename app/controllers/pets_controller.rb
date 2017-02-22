class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    erb :'/pets/new'
  end

  post '/pets' do
    @new_pet = Pet.create(params[:pet])
    if params[:pet][:owner_id].empty?
      @new_owner = Owner.create(params[:owner])
      @new_pet.owner_id = @new_owner.id
    end
    @new_pet.save
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    erb :edit
  end

  post '/pets/:id' do
    @pet = Pet.find(params[:id])
    @pet.update(params[:pet])
    if !params[:owner][:name].empty?
      @pet.owner = Owner.create(params[:owner])
    end
    @pet.save
    redirect to "/pets/#{@pet.id}"

    # erb :'/pets/show'
  end


  post '/pets/:id' do

    redirect to "pets/#{@pet.id}"
  end
end
