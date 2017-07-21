class Seed

  def self.begin
    seed = Seed.new
    seed.generate_shops
    seed.generate_reviews
  end

  def generate_shops
    Shop.destroy_all
    30.times do |i|
      shop = Shop.create!(
        name: Faker::Company.name,
        address: Faker::Address.street_address + ", " + Faker::Address.city,
        description: Faker::Commerce.department,
        url: "http://lorempixel.com/250/250/nightlife",
        hours: (Faker::Number.between(1, 12)).to_s + ":" + (Faker::Number.between(1, 59)).to_s + "am" +
        " - " + (Faker::Number.between(1, 12)).to_s + ":" + (Faker::Number.between(1, 59)).to_s + "pm"
      )
    end
    puts "Generated #{Shop.count} shops."
  end

  def generate_reviews
    Review.destroy_all
    60.times do |i|
      review = Review.create!(
        author: Faker::LordOfTheRings.character,
        price: Faker::Number.between(1, 5),
        rating: Faker::Number.between(1, 5),
        content: Faker::Lorem.sentence(3),
        shop_id: rand(1..30)
      )
    end
    puts "Generated #{Review.count} reviews."
  end
end


Seed.begin
