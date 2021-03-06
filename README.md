# PGP [![Build Status](https://travis-ci.org/cshtdd/ruby-pgp.svg?branch=mri)](https://travis-ci.org/cshtdd/ruby-pgp)  

This a [GnuPG](https://gnupg.org/) wrapper built with Ruby.  
The gem api is modeled after [jruby-pgp](https://github.com/sgonyea/jruby-pgp) for compatibility reasons with a legacy application.  
This gem is validated with multiple versions of gpg and multiple operating systems.  

## Installation

Add this line to your application's Gemfile:

    gem 'ruby-pgp'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-pgp

## Feature Support:

The feature set is very bare, and restricted to the following operations:

- Encrypt a file to a known list of Public Key(s).

- Decrypt a file using a given set of Private Key(s).

- Public and Private keys may be read in from disk or from memory.

- Verify the signature of a file that you are decrypting. (thanks, @superchris)

- Use password-protected Private Keys. (thanks, @superchris)

- Sign a file from the file system. (thanks, @superchris)

Currently, you **cannot** do the following (These are TODO items):

- Verify any signatures of public / private keys.

- Create new Private Keys / generate public keys from a given Private Key.

- Sign a file that you are encrypting.

- Obtain the name of the file that was encrypted. (Should be an easy feature to add.)

- Obtain the "modificationTime" (timestamp) of the encrypted data / file.

- Verify a public key based on information from a key server.

## Notes

This gem currently features everything I need and nothing I don't. Pull requests are very much welcome;
feature requests will be considered.  

## Usage

For usage examples, see the below test files:

    Encryption: spec/lib/pgp/encryptor_spec.rb
    Decryption: spec/lib/pgp/decryptor_spec.rb

## Contributors

@superchris

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Testing:

Just run:

    $ rspec

The [.travis.yml](.travis.yml) file describes our testing strategy for multiple OS.  
We run the test suite against multiple OS versions with Ruby installed.   
