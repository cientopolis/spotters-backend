module Metagame
  def get_badges
    #conf = Conf.all.first

    #HTTP.get("http://metagame:9091/badges?email=#{current_user.email}&project=#{conf.title}").to_s

    # Código de ejemplo
    {
      player: current_user.email,
      rank: "Visionary Citizen Scientist",
      badges:[
        {
          name:"Unit of Work",
          description: "This is a badge obtained for contributing to Spotters",
          level: 5,
          image_url: "badge1.jpg"
        },
        {
          name:"Back and Forth",
          description: "This is a badge obtained for supporting other players of Spotters",
          level: 20,
          image_url: "badge2.jpg"
        }
      ]
    }.to_json
  end

  def send_login
    data = {
      type: 'login'
    }
    self.send_message(data)
  end

  def send_contribution(candidate)
    data = {
      type: 'contribution',
      candidate: candidate
    }
    self.send_message(data)
  end

  def send_reinforcement(candidate)
    data = {
      type: 'reinforcement',
      candidate: candidate
    }
    self.send_message(data)
  end

  def send_social
    data = {
      type: 'social'
    }
    self.send_message(data)
  end

  def send_message(data)
    conf = Conf.all.first

    arguments = []
    if data.candidate.nil?
      arguments = [
        {
          candidate_id: data.candidate.id
        }
      ]
    end

    message = WaterDrop::Message.new('topic', {
      project: conf.title,
      event: data.type,
      timestamp: DateTime.now.to_s,
      user_id: current_user.email,
      arguments: arguments
    }.to_json)
    message.send!
  end
end
