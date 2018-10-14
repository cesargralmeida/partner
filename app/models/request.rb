class Request < ApplicationRecord
    has_many :items
    belongs_to :partner
    accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true
    validates_presence_of :comments, :items

    def to_json_request
        items_attributes = items.map do |item|
            "\"#{item.name}\":#{item.quantity.to_s}"
        end.join(',')
        request_attributes = "\"partner_id\":#{partner_id},\"organization_id\":#{organization_id},\"comments\":\"#{comments}\",\"request_items\":{ #{items_attributes} }"
        request = "{ \"request\": { #{request_attributes} } }"
    end
end