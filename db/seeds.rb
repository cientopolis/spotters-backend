# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.create! :email => 'admin@admin.com', :password => 'adminadmin', :password_confirmation => 'adminadmin'

levels = Level.create([{
  :name => 'Principainte',
  :required_points => 0
}, {
  :name => 'Avanzado',
  :required_points => 200
}, {
  :name => 'Experto',
  :required_points => 500
}])

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
  :password_confirmation => 'testtest',
  :level_id => levels.first.id
}, {
  :name => 'Test2',
  :email => 'test2@test.com',
  :password => 'testtest',
  :password_confirmation => 'testtest',
  :level_id => levels.first.id
}, {
  :name => 'Test3',
  :email => 'test3@test.com',
  :password => 'testtest',
  :password_confirmation => 'testtest',
  :level_id => levels.first.id
}])

workflow = Workflow.create({
  :name => 'Workflow Principal'
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
  :content => '{
    question: \'Qué materiales cree que conforman el elemento?\',
    answers: [
      \'Mármol\',
      \'Cemento\',
      \'Hormigón\',
      \'Marfil\',
      \'Ladrillos\'
    ]
  }',
  :workflow_id => workflow.id,
  :next_id => task3.id
})

task1 = Task.create({
  :multiple => false,
  :widget_type => 'choice',
  :content => "{
    question: \'Qué tipo de elemento ve en el panorama?\',
    answers: [
      {
        label: \'Escultura\',
        next: #{task2.id}
      },
      {
        label: \'Monumento\',
        next: #{task2.id}
      }
    ]
  }",
  :workflow_id => workflow.id
})

workflow.first_task_id = task1.id
workflow.save!

points = ['POINT(-57.95813798904419 -34.923061847053205)', 'POINT(-57.960476875305176 -34.92202381766965)',
  'POINT(-57.95283794403076 -34.92288591079369)', 'POINT(-57.96339511871338 -34.92307944065842)',
  'POINT(-57.95554161071777 -34.92336093782872)', 'POINT(-57.95835256576538 -34.91961342761163)']

status = ['confirmed', 'rejected', 'new']

candidates = []

points.each do |point|
  candidates += [Candidate.create({
    :status => status.sample,
    :location => point,
    :heading => 0,
    :pitch => 0,
    :owner_id => users.sample.id
  })]
end

candidates.each do |candidate|
  classification = Classification.create({
    :candidate_id => candidate.id,
    :data => "[
      {
        question: \'Qué tipo de elemento ve en el panorama?\',
        answer: \'Escultura\'
      },
      {
        question: \'Qué materiales cree que conforman el elemento?\',
        answer: [
          \'Mármol\',
          \'Cemento\'
        ]
      },
      {
        question: \'Qué otras observaciones puede agregar?\',
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
