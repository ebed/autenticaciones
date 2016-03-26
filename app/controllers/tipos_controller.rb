class TiposController < ApplicationController


def index
  @tipos = Tipo.all
end

def show
end


def edit
end

def new

     p "En new tipos"
    @tipo = Tipo.new
end

def create
end

def destroy
end

def update
end

end
