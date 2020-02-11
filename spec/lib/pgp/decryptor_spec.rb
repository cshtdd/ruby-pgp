require 'spec_helper'

describe PGP::Decryptor do
  include KeysHelper

  let(:private_key_path)  { Fixtures_Path.join('private_key.asc').to_s }
  let(:public_key_path)   { Fixtures_Path.join('public_key.asc').to_s }

  let(:decryptor) { PGP::Decryptor.new }

  let(:encrypted_file)    { Fixtures_Path.join('unencrypted_file.txt.asc') }
  let(:encrypted_text)    { File.read(encrypted_file) }
  let(:file_path)         { Fixtures_Path.join('unencrypted_file.txt') }
  let(:unencrypted_text)  { File.read(file_path) }

  before { remove_all_keys }

  describe '#decrypt' do
    before {
      decryptor.add_keys_from_file(private_key_path)
    }

    it "should successfully decrypt an encrypted file" do
      expect(decryptor.decrypt(encrypted_text)).to eq(unencrypted_text)
    end

    describe 'ruby_decryptor' do
      it 'should successfully decrypt an encrypted file' do
        actual_text = PGP::RubyDecryptor.decrypt(encrypted_text, private_key_path)
        expect(actual_text).to eq(unencrypted_text)
      end
    end
  end

  describe "decrypt with private key and passphrase" do
    let(:private_key_with_passphrase_path) { Fixtures_Path.join('private_key_with_passphrase.asc') }
    let(:encrypted_with_passphrase_file)    { Fixtures_Path.join('encrypted_with_passphrase_key.txt.asc') }
    let(:encrypted_text) { File.read(encrypted_with_passphrase_file) }
    let(:unencrypted_text) { File.read(Fixtures_Path.join('encrypted_with_passphrase_key.txt'))}
    let(:passphrase) { "testingpgp" }

    before do
      decryptor.passphrase = passphrase
      decryptor.add_keys_from_file(private_key_with_passphrase_path)
    end

    it "should decrypt" do
      expect(decryptor.decrypt(encrypted_text)).to eq(unencrypted_text)
    end

    describe 'ruby_decryptor' do
      it 'should decrypt' do
        actual_text = PGP::RubyDecryptor.decrypt(encrypted_text, private_key_path, passphrase)
        expect(actual_text).to eq(unencrypted_text)
      end
    end
  end
end
