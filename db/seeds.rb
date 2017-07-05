# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.create! :email => 'admin@admin.com', :password => 'adminadmin', :password_confirmation => 'adminadmin'

factory = RGeo::Geographic.spherical_factory(srid: 4326)

center = factory.point(-57.9535598, -34.9204897)

point1 = factory.point(-57.99948692, -34.95081986)
point2 = factory.point(-57.91708946, -34.95081986)
point3 = factory.point(-57.91708946, -34.88381872)
point4 = factory.point(-57.99948692, -34.88381872)

Conf.create({
  :title => 'Spotters',
  :zoom => 15,
  :center => center,
  :heading_center => 0,
  :pitch_center => 0,
  :bounds => factory.polygon(factory.linear_ring([point1, point2, point3, point4])),
  :proximity_distance => 300
})

News.create([{
  :title => 'Lanzamiento del proyecto',
  :text => 'Esta semana se inicia este proyecto, en el que todos colaboraremos para catalogar y estudiar parte del patrimonio cultural de nuestra ciudad.',
  :author_id => admin.id
}, {
  :title => 'Semana del barrio Meridiano',
  :text => 'Esta semana el objetivo es conocer mas de este tradicional barrio, corazón cultural de La Plata.',
  :author_id => admin.id
}, {
  :title => 'Cientopolis en los medios',
  :text => 'Interesante nota en el diario el Día sobre nuestro proyecto: http://go.gl/vffatrs',
  :author_id => admin.id
}, {
  :title => 'Voluntarios del mes',
  :text => 'Cumplimos un mes de proyecto. Gracias a todos los ciudadanod científicos, en particular a Pincha49, AleGomez, Rochucraft y Maguila, por ser quienes mas contribuciones han hecho en el último mes.',
  :author_id => admin.id
}])

10.times do |i|
  TutorialStep.create([{
    :title => "Paso #{i + 1}",
    :text => "Texto del paso #{i + 1}",
    :position => i
  }])
end

# users = User.create([{
#   :sub => 'Test1',
#   :name => "Test1",
#   :email => "test1@test1.com"
# }, {
#   :sub => 'Test2',
#   :name => "Test2",
#   :email => "test2@test2.com"
# }, {
#   :sub => 'Test3',
#   :name => "Test3",
#   :email => "test3@test3.com"
# }])

workflow = Workflow.create({
  :name => 'Workflow Principal',
})

task3 = Task.create({
  :multiple => true,
  :widget_type => 'choice',
  :content => "{
    \"question\": \"¿Qué materiales componen la obra?\",
    \"answers\": [
      {\"label\": \"Granito\"},
      {\"label\": \"Mármol\"},
      {\"label\": \"Hierro\"},
      {\"label\": \"Cerámica\"},
      {\"label\": \"Bronce\"},
      {\"label\": \"Metal\"},
      {\"label\": \"Madera\"},
      {\"label\": \"Cemento\"},
      {\"label\": \"Acrílico\"},
      {\"label\": \"Hormigón\"},
      {\"label\": \"Piedra\"},
      {\"label\": \"Ladrillo\"},
      {\"label\": \"Acero\"}
    ]
  }".squish,
  :workflow_id => workflow.id
})

task2 = Task.create({
  :multiple => false,
  :widget_type => 'text',
  :content => "{
    \"question\": \"¿Qué visualiza en la obra?\",
    \"next_id\": #{task3.id}
  }".squish,
  :workflow_id => workflow.id,
})

task1 = Task.create({
  :multiple => false,
  :widget_type => 'choice',
  :content => "{
    \"question\": \"¿Qué es lo que ve en la Imagen?\",
    \"answers\": [
      {
        \"label\": \"Una figura de cuerpo entero\",
        \"next_id\": #{task2.id}
      },
      {
        \"label\": \"Un busto\",
        \"next_id\": #{task2.id}
      },
      {
        \"label\": \"Una cabeza\",
        \"next_id\": #{task2.id}
      },
      {
        \"label\": \"Un objeto inanimado\",
        \"next_id\": #{task2.id}
      },
      {
        \"label\": \"Un animal\",
        \"next_id\": #{task2.id}
      },
      {
        \"label\": \"Un conjunto monumental\",
        \"next_id\": #{task2.id}
      },
      {
        \"label\": \"Un relieve\",
        \"next_id\": #{task2.id}
      },
      {
        \"label\": \"Otro\",
        \"next_id\": #{task2.id}
      }
    ]
  }".squish,
  :workflow_id => workflow.id
})

workflow.first_task_id = task1.id
workflow.save!

# points = [{
#   :x => -57.95813798904419,
#   :y => -34.923061847053205
# }, {
#   :x => -57.960476875305176,
#   :y => -34.92202381766965
# }, {
#   :x => -57.95283794403076,
#   :y => -34.92288591079369
# }, {
#   :x => -57.96339511871338,
#   :y => -34.92307944065842
# }, {
#   :x => -57.95554161071777,
#   :y => -34.92336093782872
# }, {
#   :x => -57.95835256576538,
#   :y => -34.91961342761163
# }, {
#   :x => -57.95813798904419,
#   :y => -34.923061847053205
# }]
#
# candidate_status = [:active, :locked, :discarded]
# classification_status = [:created, :confirmed, :rejected]
#
# candidates = []
#
# points.each do |point|
#   candidates += [Candidate.create({
#     :status => candidate_status.sample,
#     :location => factory.point(point[:x], point[:y]),
#     :heading => 0,
#     :pitch => 0,
#     :owner_id => users.sample.id
#   })]
# end
#
# candidates.each do |candidate|
#   classification = Classification.create({
#     :status => classification_status.sample,
#     :candidate_id => candidate.id,
#     :user_id => users.sample.id,
#     :data => "[
#       {
#         \"question\": #{task1.id},
#         \"answer\": \"Escultura\"
#       },
#       {
#         \"question\": #{task2.id},
#         \"answer\": [
#           \"Mármol\",
#           \"Cemento\"
#         ]
#       },
#       {
#         \"question\": #{task3.id},
#         \"answer\": \"Escultura de mediados de la década del 90\"
#       }
#     ]".squish
#   })
#
#   4.times do |i|
#     ClassificationVote.create({
#       :positive => [true, false].sample,
#       :classification_id => classification.id,
#       :user_id => users.sample.id
#     })
#   end
#
#   messages = Message.create([{
#     :text => 'Mensaje de prueba',
#     :candidate_id => candidate.id,
#     :user_id => users.sample.id
#   }, {
#     :text => 'Otro mensaje de prueba',
#     :candidate_id => candidate.id,
#     :user_id => users.sample.id
#   }, {
#     :text => 'Más mensajes de prueba',
#     :candidate_id => candidate.id,
#     :user_id => users.sample.id
#   }])
#
#   messages.each do |message|
#     MessageVote.create({
#       :positive => [true, false].sample,
#       :message_id => message.id,
#       :user_id => users.sample.id
#     })
#   end
# end
