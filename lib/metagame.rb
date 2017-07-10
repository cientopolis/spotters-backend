module Metagame
  class Metagame
    def self.get_badges(current_user)
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
            image_url: "ionic"
          },
          {
            name:"Back and Forth",
            description: "This is a badge obtained for supporting other players of Spotters",
            level: 20,
            image_url: "beer"
          }
        ]
      }.to_json
    end

    def self.send_login(current_user)
      data = {
        type: 'login',
        current_user: current_user
      }
      self.send_message(data)
    end

    def self.send_contribution(current_user, candidate)
      data = {
        type: 'contribution',
        current_user: current_user,
        candidate: candidate
      }
      self.send_message(data)
    end

    def self.send_reinforcement(current_user, candidate)
      data = {
        type: 'reinforcement',
        current_user: current_user,
        candidate: candidate
      }
      self.send_message(data)
    end

    def self.send_social(current_user)
      data = {
        type: 'social',
        current_user: current_user
      }
      self.send_message(data)
    end

    def self.send_message(data)
      conf = Conf.all.first

      arguments = []
      if data[:candidate].nil?
        arguments = [
          {
            candidate_id: data[:candidate].id
          }
        ]
      end

      message = WaterDrop::Message.new('topic', {
        project: conf.title,
        event: data[:type],
        timestamp: DateTime.now.to_s,
        user_id: data[:current_user].email,
        arguments: arguments
      }.to_json)
      message.send!
    end
  end
end
