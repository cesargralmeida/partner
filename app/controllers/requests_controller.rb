class RequestsController < ApplicationController
    before_action :authenticate_partner!
    before_action :set_partner

    # GET /requests/new
    def new
        @new_request = Request.new()
    end

    # POST /requests
    # POST /requests.json
    def create
        @new_request = @partner.requests.new(request_params)
        respond_to do |format|
          if @new_request.valid?
            format.html { redirect_to new_request_path, notice: "Request was successfully created." }
            #format.json { render :show, status: :created, location: @request }
          else
            format.html { render :new }
            format.json { render json: @new_request.errors, status: :unprocessable_entity }
          end
        end
    end

    private

    def request_params
        params.require(:request).permit(:organization_id, :partner_id, :comments,
                                        items_attributes: [:id, :name, :quantity, :_destroy])
    end

    def set_partner
        @partner = current_partner
    end
end
  