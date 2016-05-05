class SheetTemplatesController < ApplicationController
  def show
    @sheet = SheetTemplate.find(params.fetch(:id))
  end
end
