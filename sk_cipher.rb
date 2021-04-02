require 'rbnacl'
require 'base64'

module ModernSymmetricCipher
  def self.generate_new_key
    # TODO: Return a new key as a Base64 string
    Base64.encode64 RbNaCl::Random
                      .random_bytes(RbNaCl::SecretBox.key_bytes)
  end

  def self.encrypt(document, key)
    # TODO: Return an encrypted string
    #       Use base64 for ciphertext so that it is sendable as text
    Base64.encode64(RbNaCl::SimpleBox
                      .from_secret_key(Base64.decode64(key))
                      .encrypt(document.to_s))
  end

  def self.decrypt(encrypted_cc, key)
    # TODO: Decrypt from encrypted message above
    #       Expect Base64 encrypted message and Base64 key
    RbNaCl::SimpleBox
      .from_secret_key(Base64.decode64(key))
      .decrypt(Base64.decode64(encrypted_cc))
  end
end
