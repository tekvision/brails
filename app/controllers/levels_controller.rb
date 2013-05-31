class LevelsController < ApplicationController
  def index
    @levels = Level.all


    end

  def new
    @level = Level.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
