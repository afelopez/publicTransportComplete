class TracksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tracks = Track.all
  end
end
