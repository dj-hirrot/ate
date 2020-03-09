class Admin::CategoriesController < Admin::ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = 'Category was successfuly created.'
      redirect_to admin_categories_url
    else
      flash.now[:alert] = 'Invalid values'
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = 'Category was successfuly updated.'
      redirect_to admin_categories_url
    else
      flash.now[:alert] = 'Invalid values'
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = 'Category was successfuly deleted.'
      redirect_to admin_categories_url
    else
      flash.now[:alert] = 'Destroy failed.'
      render :index
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
