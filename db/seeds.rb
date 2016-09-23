# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.create! :email => 'admin@admin.com', :password => 'adminadmin', :password_confirmation => 'adminadmin'

icon_unknown = File.new(File.join(Rails.root, '/app/assets/images/unknown.png'))
icon_negative_confirmed = File.new(File.join(Rails.root, '/app/assets/images/negative-confirmed.png'))
icon_negative_rejected = File.new(File.join(Rails.root, '/app/assets/images/negative-rejected.png'))
icon_negative_unknown = File.new(File.join(Rails.root, '/app/assets/images/negative-unknown.png'))
icon_positive_confirmed = File.new(File.join(Rails.root, '/app/assets/images/positive-confirmed.png'))
icon_positive_rejected = File.new(File.join(Rails.root, '/app/assets/images/positive-rejected.png'))
icon_positive_unknown = File.new(File.join(Rails.root, '/app/assets/images/positive-unknown.png'))

candidate_types = CandidateType.create!([{
  :name => 'Monumento',
  :points_success => 100,
  :points_failure => -50,
  :points_confirmed => 500,
  :points_rejected => -100,
  :icon_unknown => ActionDispatch::Http::UploadedFile.new(
    :filename => File.basename(icon_unknown),
    :tempfile => icon_unknown,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(icon_unknown.path).first.content_type
  ),
  :icon_negative_confirmed => ActionDispatch::Http::UploadedFile.new(
    :filename => File.basename(icon_negative_confirmed),
    :tempfile => icon_negative_confirmed,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(icon_negative_confirmed.path).first.content_type
  ),
  :icon_negative_rejected => ActionDispatch::Http::UploadedFile.new(
    :filename => File.basename(icon_negative_rejected),
    :tempfile => icon_negative_rejected,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(icon_negative_rejected.path).first.content_type
  ),
  :icon_negative_unknown => ActionDispatch::Http::UploadedFile.new(
    :filename => File.basename(icon_negative_unknown),
    :tempfile => icon_negative_unknown,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(icon_negative_unknown.path).first.content_type
  ),
  :icon_positive_confirmed => ActionDispatch::Http::UploadedFile.new(
    :filename => File.basename(icon_positive_confirmed),
    :tempfile => icon_positive_confirmed,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(icon_positive_confirmed.path).first.content_type
  ),
  :icon_positive_rejected => ActionDispatch::Http::UploadedFile.new(
    :filename => File.basename(icon_positive_rejected),
    :tempfile => icon_positive_rejected,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(icon_positive_rejected.path).first.content_type
  ),
  :icon_positive_unknown => ActionDispatch::Http::UploadedFile.new(
    :filename => File.basename(icon_positive_unknown),
    :tempfile => icon_positive_unknown,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(icon_positive_unknown.path).first.content_type
  )
}, {
  :name => 'Escultura',
  :points_success => 100,
  :points_failure => -50,
  :points_confirmed => 500,
  :points_rejected => -100,
  :icon_unknown => ActionDispatch::Http::UploadedFile.new(
    :filename => File.basename(icon_unknown),
    :tempfile => icon_unknown,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(icon_unknown.path).first.content_type
  ),
  :icon_negative_confirmed => ActionDispatch::Http::UploadedFile.new(
    :filename => File.basename(icon_negative_confirmed),
    :tempfile => icon_negative_confirmed,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(icon_negative_confirmed.path).first.content_type
  ),
  :icon_negative_rejected => ActionDispatch::Http::UploadedFile.new(
    :filename => File.basename(icon_negative_rejected),
    :tempfile => icon_negative_rejected,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(icon_negative_rejected.path).first.content_type
  ),
  :icon_negative_unknown => ActionDispatch::Http::UploadedFile.new(
    :filename => File.basename(icon_negative_unknown),
    :tempfile => icon_negative_unknown,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(icon_negative_unknown.path).first.content_type
  ),
  :icon_positive_confirmed => ActionDispatch::Http::UploadedFile.new(
    :filename => File.basename(icon_positive_confirmed),
    :tempfile => icon_positive_confirmed,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(icon_positive_confirmed.path).first.content_type
  ),
  :icon_positive_rejected => ActionDispatch::Http::UploadedFile.new(
    :filename => File.basename(icon_positive_rejected),
    :tempfile => icon_positive_rejected,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(icon_positive_rejected.path).first.content_type
  ),
  :icon_positive_unknown => ActionDispatch::Http::UploadedFile.new(
    :filename => File.basename(icon_positive_unknown),
    :tempfile => icon_positive_unknown,
    # detect the image's mime type with MIME if you can't provide it yourself.
    :type => MIME::Types.type_for(icon_positive_unknown.path).first.content_type
  )
}])

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
    :candidate_type_id => candidate_types.sample.id,
    :owner_id => users.sample.id
  })]
end

candidates.each do |candidate|
  CandidateVote.create([{
    :positive => [true, false].sample,
    :candidate_id => candidate.id,
    :user_id => users[0].id
  }, {
    :positive => [true, false].sample,
    :candidate_id => candidate.id,
    :user_id => users[1].id
  }, {
    :positive => [true, false].sample,
    :candidate_id => candidate.id,
    :user_id => users[2].id
  }])

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
