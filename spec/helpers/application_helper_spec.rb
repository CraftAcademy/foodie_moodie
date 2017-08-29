RSpec.describe ApplicationHelper do
  describe '#get_order_items_count' do

    context 'order has items' do
      let!(:order) { create(:order) }
      let!(:product_1) { create(:dish) }
      let!(:product_2) { create(:dish) }

      before do
        order.add(product_1, 50, 1)
        order.add(product_2, 50, 1)
        session[:order_id] = order.id
      end

      it 'returns 2' do
        expect(Order.last.total_unique_items).to eq 2
      end
    end
  end
end
