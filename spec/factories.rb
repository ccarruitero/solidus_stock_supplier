FactoryBot.define do
  factory :supplier, class: 'Spree::Supplier' do
    name FFaker::Company.name
    uid FFaker::CompanyIT.partita_iva
  end
end
