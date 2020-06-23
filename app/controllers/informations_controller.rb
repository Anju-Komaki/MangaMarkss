# frozen_string_literal: true

class InformationsController < ApplicationController
  def index
    @informations = if @informations = params[:category_id].present?
                      Category.find(params[:category_id]).informations
                    else
                      Information.all.order("created_at DESC")
                    end
  end

  def show
    @information = Information.find(params[:id])
  end
end
