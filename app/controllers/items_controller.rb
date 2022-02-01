class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  def delete
    @item = Item.find(params[:id])
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
      #if true
        #format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.html { redirect_to items_path, notice: "Book '#{@item.title} was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
      #if true
      #format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.html { redirect_to items_path, notice: "Book '#{@item.title}' was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    title = @item.title
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_path, notice: "Book '#{title}' was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      #params.require(:item).permit(:title, :author, :price, :date)
      params.require(:item).permit(:title, :author)
    end
end
