require 'bcrypt'

class UserStack
  module AuthType
    module Password
      def self.included(base)
        base.class_eval do
          attr_accessor :password_confirmation
          attr_reader   :password

          klass = Veneer(base)

          klass.validates_presence_of     :password, :if => Proc.new{|m| !m.has_credentials?}
          klass.validates_confirmation_of :password, :if => Proc.new{|m| m.password         }
        end

        def password=(pass)
          ensure_auth
          @password = pass
          unless pass.blank?
            r = ::BCrypt::Password.create("#{pass}#{password_salt}", :cost => 10)
            self.auth_data["password"] = r
          end
          @password
        end

        def has_credentials?
          ensure_auth
          !auth_data["password"].nil?
        end

        private
        def crypted_password
          ensure_auth
          @crypted_password ||= begin
                                  ep = auth_data["password"]
                                  ep.nil? ? nil : ::BCrypt::Password.new(ep)
                                end
        end

        def password_salt
          ensure_auth
          @password_salt ||= begin
                               pws = auth_data['password_salt']
                               pws.nil? ? (auth_data['password_salt'] = Digest::SHA512.hexdigest(unique_token)) : pws
                             end
        end


        def unique_token
          Time.now.to_s + (1..10).collect{ rand.to_s }.join
      end

        def ensure_auth
          self.auth_data ||= {}
        end
      end
    end
  end
end
