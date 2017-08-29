RSpec.describe Order, type: :model do
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :name }
  it { is_expected.to have_db_column :address_1 }
  it { is_expected.to have_db_column :address_2 }
  it { is_expected.to have_db_column :postal_code }
  it { is_expected.to have_db_column :city }
  it { is_expected.to have_db_column :phone_number }
  it { is_expected.to have_db_column :email }
  it { is_expected.to have_db_column :payed }

  it 'has 0 tax' do
    expect(subject.tax_pct).to eq 0
  end
end
