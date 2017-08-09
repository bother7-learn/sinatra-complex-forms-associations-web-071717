class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    erb :'/pets/edit'
  end

  post '/pets' do
    # binding.pry
    if params[:pet_name] != ""
    @pet = Pet.create(name: params[:pet_name])
    else
    @pet = Pet.create(name: params[:pet][:name])
    end
    # binding.pry
    if params[:owner_name] != ""
      @owner = Owner.create(name: params[:owner_name])
      @pet.owner = @owner
    else
      # binding.pry
      @owner = Owner.find(params[:pet][:owner])
      @pet.owner = @owner
    end
    @pet.save
    @owner.save
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  post '/pets/:id' do
    # binding.pry
    @pet = Pet.find(params[:id])
    @pet.name = params[:pet][:name]
    if params[:owner][:name] != ""
      @owner = Owner.create(name: params[:owner][:name])
    else
      @owner = Owner.find(params[:owner_id])
      # binding.pry
    end
    @pet.owner = @owner
    @pet.save
    # binding.pry
    redirect to "pets/#{@pet.id}"
  end
end
