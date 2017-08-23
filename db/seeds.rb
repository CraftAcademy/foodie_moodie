
Restaurant.create(name: 'Indian Fun', address1: 'Snorgatan 12', postal_code: '164 55', city: 'Kista', cuisine: 'Indian Food')
Restaurant.create(name: 'Italian Fun', address1: 'Leyongatan 14', postal_code: '164 55', city: 'Kista', cuisine: 'Italian Food')
Restaurant.create(name: 'Chinese Fun', address1: 'Potatisgatan 20', postal_code: '164 55', city: 'Kista', cuisine: 'Chinese Food')
Restaurant.create(name: 'American Fun', address1: 'Snigelgatan 69', postal_code: '164 55', city: 'Kista', cuisine: 'American Food')

Dish.create(title: 'papadom', description: 'deep fried crunchy things', price: 100, restaurant: Restaurant.first)

