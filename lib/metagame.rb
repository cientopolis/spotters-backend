module Metagame
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
      user_id: current_user.id,
      arguments: arguments
    }.to_json)
    message.send!
  end
end
