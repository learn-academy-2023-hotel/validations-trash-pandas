require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'is not valid without these three things' do 
    account = Account.create(
      username: 'ghost cod',
      password: '1234567',
      email: 'lazypanda@fbi.gov'
    )
    expect(account).to be_valid
  end

  it 'is not valid without a username' do
    account = Account.create(
      email: 'lazypanda@fbi.gov',
      password: '123',
    )
    expect(account.errors[:username]).to_not be_empty
  end

  it 'does not allow usernames to be less than 5 characters' do
    account = Account.create(
      username: 'gho',
      email: 'lazypanda@fbi.gov',
      password: "123"
    )
    expect(account.errors[:username]).to_not be_empty
  end

    it 'is not valid without a email' do
      account = Account.create(
        username: 'gho',
        password: '123',
      )
      expect(account.errors[:email]).to_not be_empty
    end

    it 'is not valid without a password' do
      account = Account.create(
        username: 'gho',
        email: 'lazypanda@fbi.gov',
      )
      expect(account.errors[:password]).to_not be_empty
    end

    it 'does not allow passwords to be less than 5 characters' do
      account = Account.create(
        username: 'gho',
        email: 'lazypanda@fbi.gov',
        password: "123"
      )
      expect(account.errors[:password]).to_not be_empty
    end

    it 'does not allow duplicate usernames' do
      account = Account.create(
        username: 'gho',
        password: '123',
        email: 'lazypanda@fbi.gov'
      )
      account2 = Account.create(
        username: 'gho3',
        password: '123',
        email: 'lazypanda@fbi.gov'
      )
      expect(account1.errors[:username]).to_not be_empty
    end

    it 'does not allow multiple usernames to have the same passwords' do
      account = Account.create(
        username: 'ghoa',
        password: '123',
        email: 'lazypanda@fbi.gov'
      )
      account2 = Account.create(
        username: 'gho',
        password: '123',
        email: 'lazypanda@fbi.gov'
      )
      expect(account1.errors[:password]).to_not be_empty
    end
      
  end

# The application data should be managed by a PostgreSQL database in a Rails application.
# The model should be called Account with username, password, and email attributes.
# Every account should require entries for username, password, and email.
# Every username should be at least five (5) characters long.
# Every username should be unique.
# Every password should be at least six (6) characters long.
# Every password should be unique.
# The Account model has an associated model called Addresses where an account can have many addresses.
# The Address model should have a street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.
# Every address should require entries for street_number, street_name, city, state, and zip.