class DocsController < ApplicationController

  before_action :find_doc, only: [:show, :update, :edit, :delete, :destroy]

  def new
    @doc = Doc.new
  end

  def create
    @doc = Doc.new(docs_params)
    if @doc.save
      redirect_to(docs_path)
    else
      render 'new'
    end
  end

  def index
    @docs = Doc.all.order('updated_at DESC')
  end

  def show
  end

  def edit
  end

  def update
    if @doc.update(docs_params)
      redirect_to(docs_path)
    else
      render 'edit'
    end
  end

  def delete
  end

  def destroy
    if @doc.destroy
      redirect_to(docs_path)
    else
      render 'delete'
    end
  end

  private

  def find_doc
    @doc = Doc.find(params[:id])
  end

  def docs_params
    params.require(:doc).permit(:title, :content)
  end

end
