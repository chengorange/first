# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
FirstApp::Application.config.secret_token = '2797af447cd67f851809b2c560119c620e98170f1b337f49c9196b434c8067539d20ca6c3e3c4d24d509d580c1380960e51950f81ad2646f89c9b39bd87e3ccb'
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

FirstApp::Application.config.secret_key_base = secure_token