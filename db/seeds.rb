# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

include CandidatesHelper

admin = Admin.create! :email => 'admin@admin.com', :password => 'adminadmin', :password_confirmation => 'adminadmin'

News.create([{
  :title => 'Lanzamiento del proyecto (1/8/2016)',
  :text => 'Esta semana se inicia este proyecto, en el que todos colaboraremos para catalogar y estudiar parte del patrimonio cultural de nuestra ciudad.',
  :author_id => admin.id
}, {
  :title => 'Semana del barrio Meridiano (10/8/2016)',
  :text => 'Esta semana el objetivo es conocer mas de este tradicional barrio, corazón cultural de La Plata.',
  :author_id => admin.id
}, {
  :title => 'Cientopolis en los medios (16/8/2016)',
  :text => 'Interesante nota en el diario el Día sobre nuestro proyecto: http://go.gl/vffatrs',
  :author_id => admin.id
}, {
  :title => 'Voluntarios del mes (1/9/2016)',
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

users = User.create([{
  :name => 'Test1',
  :email => 'test1@test.com',
  :password => 'testtest',
  :password_confirmation => 'testtest'
}, {
  :name => 'Test2',
  :email => 'test2@test.com',
  :password => 'testtest',
  :password_confirmation => 'testtest'
}, {
  :name => 'Test3',
  :email => 'test3@test.com',
  :password => 'testtest',
  :password_confirmation => 'testtest'
}])

workflow = Workflow.create({
  :name => 'Workflow Principal',
})

task3 = Task.create({
  :multiple => false,
  :widget_type => 'text',
  :content => '{
    question: \'Qué otras observaciones puede agregar?\'
  }',
  :workflow_id => workflow.id
})

task2 = Task.create({
  :multiple => true,
  :widget_type => 'choice',
  :content => "{
    question: \'Qué materiales cree que conforman el elemento?\',
    next_id: #{task3.id},
    answers: [
      {label: \'Mármol\'},
      {label: \'Cemento\'},
      {label: \'Hormigón\'},
      {label: \'Marfil\'},
      {label: \'Ladrillos\'}
    ]
  }",
  :workflow_id => workflow.id,
})

task1 = Task.create({
  :multiple => false,
  :widget_type => 'choice',
  :content => "{
    question: \'Qué tipo de elemento ve en el panorama?\',
    answers: [
      {
        label: \'Escultura\',
        next_id: #{task2.id}
      },
      {
        label: \'Monumento\',
        next_id: #{task2.id}
      }
    ]
  }",
  :workflow_id => workflow.id
})

workflow.first_task_id = task1.id
workflow.save!

points = [{
  :x => -57.95813798904419,
  :y => -34.923061847053205
}, {
  :x => -57.960476875305176,
  :y => -34.92202381766965
}, {
  :x => -57.95283794403076,
  :y => -34.92288591079369
}, {
  :x => -57.96339511871338,
  :y => -34.92307944065842
}, {
  :x => -57.95554161071777,
  :y => -34.92336093782872
}, {
  :x => -57.95835256576538,
  :y => -34.91961342761163
}, {
  :x => -57.95813798904419,
  :y => -34.923061847053205
}]

candidate_status = [:active, :locked, :discarded]
classification_status = [:created, :confirmed, :rejected]

factory = RGeo::Geographic.spherical_factory(srid: 4326)

candidates = []

points.each do |point|
  candidates += [Candidate.create({
    :status => candidate_status.sample,
    :location => factory.point(point[:x], point[:y]),
    :heading => 0,
    :pitch => 0,
    :picture => download_picture(point[:y], point[:x]),
    :owner_id => users.sample.id
  })]
end

candidates.each do |candidate|
  classification = Classification.create({
    :status => classification_status.sample,
    :candidate_id => candidate.id,
    :user_id => users.sample.id,
    :data => "[
      {
        question: #{task1.id},
        answer: \'Escultura\'
      },
      {
        question: #{task2.id},
        answer: [
          \'Mármol\',
          \'Cemento\'
        ]
      },
      {
        question: #{task3.id},
        answer: \'Escultura de mediados de la década del 90\'
      }
    ]"
  })

  4.times do |i|
    ClassificationVote.create({
      :positive => [true, false].sample,
      :classification_id => classification.id,
      :user_id => users.sample.id
    })
  end

  messages = Message.create([{
    :text => 'Mensaje de prueba',
    :candidate_id => candidate.id,
    :user_id => users.sample.id
  }, {
    :text => 'Otro mensaje de prueba',
    :candidate_id => candidate.id,
    :user_id => users.sample.id
  }, {
    :text => 'Más mensajes de prueba',
    :candidate_id => candidate.id,
    :user_id => users.sample.id
  }])

  messages.each do |message|
    MessageVote.create({
      :positive => [true, false].sample,
      :message_id => message.id,
      :user_id => users.sample.id
    })
  end
end
