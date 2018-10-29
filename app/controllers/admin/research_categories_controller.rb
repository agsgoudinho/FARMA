class Admin::ResearchCategoriesController < Admin::AdminApplicationController
  def index
    @categories = Admin::ResearchCategory.all
  end

  def new
    @category = Admin::ResearchCategory.new
  end

  def create
    @category = Admin::ResearchCategory.new(category_params)
    if @category.save
      redirect_to admin_research_categories_path, flash: { success:
      'Categoria criada com sucesso.' }
    else
      flash.now[:error] = 'Existem dados incorretos.'
      render :new
    end
  end

  def edit
    @category = Admin::ResearchCategory.find(params[:id])
  end

  def update
    @category = Admin::ResearchCategory.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to admin_research_categories_path, flash: { success:
      'Categoria atualizada com sucesso.' }
    else
      flash.now[:error] = 'Existem dados incorretos.'
      render :edit
    end
  end

  def destroy
    @category = Admin::ResearchCategory.find(params[:id])
    if @category.destroy
      redirect_to admin_research_categories_path, flash: { success:
        'Categoria removida com sucesso.' }
    else
      flash[:error] = 'Não é permitdo remover uma categoria vinculada a uma ou mais pesquisas.'
      redirect_to admin_research_categories_path
    end
  end

  private

  def category_params
    strip_params params.require(:admin_research_category).permit(:name)
  end
end
