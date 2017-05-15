class Webhook < ApplicationRecord
    has_secure_token :token
#    after_initialize :gen_hash
#
#    private
#    def gen_hash
#        hash = Digest::SHA1.hexdigest([Time.now, rand].join)
#        if Webhook.find( :hash => hash ).present?
#            self.gen_hash
#        else
#            self.hash = hash
#        end
#    end
end
