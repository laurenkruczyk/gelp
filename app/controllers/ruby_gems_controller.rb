class RubyGemsController < ApplicationController
  def new
    @ruby_gem = RubyGem.new
  end

  def create
    @ruby_gem = RubyGem.new(ruby_gem_params)

      if @ruby_gem.save
        redirect_to @ruby_gem
        flash[:notice] = "Successfully added gem"
      else
        render 'new'
      end
  end

  def show
    @ruby_gem = RubyGem.find(params[:id])
  end


  private

  def ruby_gem_params
    params.require(:ruby_gem).permit(:name, :author, :description, :github_url)
  end
end