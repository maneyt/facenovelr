class SearchesController < ApplicationController
  def show
    @search = Search.new(search_params)
    @users = @search.results
  end

  private

  def search_params
    params.require(:search).permit(
      :user_name
    )
  end
end
