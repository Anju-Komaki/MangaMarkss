# frozen_string_literal: true

class SearchesController < ApplicationController
  def form
  end

  def search
    @column = params['search']['column']
    @content = params['search']['content']
    @method = params['search']['method']
    @records = search_for(@column, @content, @method)
  end

  private

  def search_for(column, content, method)
    if column == 'title'
      if method == 'perfect'
        Comic.where(title: content)
      else
        Comic.where('title LIKE ?', '%' + content + '%')
      end
    elsif column == 'author'
      if method == 'perfect'
        Comic.where(author: content)
      else
        Comic.where('author LIKE ?', '%' + content + '%')
      end
    elsif column == 'title_en'
      if method == 'perfect'
        Comic.where(title_en: content)
      else
        Comic.where('title_en LIKE ?', '%' + content + '%')
      end
    elsif column == 'author_en'
      if method == 'perfect'
        Comic.where(author_en: content)
      else
        Comic.where('author_en LIKE ?', '%' + content + '%')
      end
    end
  end
end
