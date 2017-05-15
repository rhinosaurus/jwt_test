module Api::V1

    class ItemsController < ApiController
        before_action :set_item, only: [:show, :update, :destroy]

=begin
@api {get} /items/index Request Items
@apiName GetItems
@apiGroup Item

@apiSuccess {String} id ID of the Item.
@apiSuccess {String} name  Name of the Item.
=end
        def index
            @items = Item.all

            render json: @items
        end


=begin
@api {get} /items/:id Request Item
@apiName GetItem
@apiGroup Item

@apiParam {Number} id Items unique ID.

@apiSuccess {String} id ID of the Item.
@apiSuccess {String} name  Name of the Item.
=end
        def show
            render json: @item
        end


=begin
@api {post} /items Create Item
@apiName CreateItem
@apiGroup Item

@apiParam {String} name Items unique name.
@apiParam {String} description Items description.

@apiSuccess {String} id ID of the Item.
@apiSuccess {String} name  Name of the Item.
=end
        def create
            @item = Item.new(item_params)

            if @item.save
                render json: @item, status: :created #, location: item_url( @item )
            else
                render json: @item.errors, status: :unprocessable_entity
            end
        end


=begin
@api {post} /items/:id Update Item
@apiName CreateItem
@apiGroup Item

@apiParam {Number} id Items unique id.
@apiParam {String} [name] Items unique name.
@apiParam {String} [description] Items description.

@apiSuccess {String} id ID of the Item.
@apiSuccess {String} name  Name of the Item.
=end
        def update
            if @item.update(item_params)
                render json: @item
            else
                render json: @item.errors, status: :unprocessable_entity
            end
        end


=begin
@api {delete} /items/:id Delete Item
@apiName DeleteItem
@apiGroup Item

@apiParam {Number} id Items unique id.

@apiSuccess {Boolean} success  Whether or not the destroy was a success.
=end
        def destroy
            if @item.destroy
                render json: { :success => true }
            else
                render json: { :success => false }
            end
        end

        private
        # Use callbacks to share common setup or constraints between actions.
        def set_item
            begin
                @item = Item.find(params[:id])
            rescue Exception => ex
                render json: { :success => false, :error => "Could not locate item." }
            end
        end

        # Only allow a trusted parameter "white list" through.
        def item_params
            params.require(:item).permit(:name, :description)
        end
    end

end
