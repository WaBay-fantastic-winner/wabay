# frozen_string_literal: true

module ApplicationCable
  class Connection < ActionCable::Connection::Base
<<<<<<< HEAD
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags 'ActionCable', current_user
    end

    private
      def find_verified_user
        if verified_user = env['warden'].user
          verified_user
        else
          reject_unauthorized_connection
        end
      end
=======
    
>>>>>>> origin/feature/actioncable
  end
end
