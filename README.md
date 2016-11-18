# Spotters

Spotters is a Citicen Science Application Framework.
This repository holds the API/backend part of the framework, where all the data is stored.

## Prerequisites

To run the application it is needed to have the following packages installed:
* Virtualbox
* Vagrant
* Ansible

## Installation

```
cp config/secrets.sample.yml
```

Configure in that file your own API keys and secrets and then:

```
cd railsbox/development
vagrant up
```

Then, from the host, you can go to localhost:3000 to access the API.

## Example Data

The app has a seeds.rb file with some examples. To load those examples follow these steps:
```
cd railsbox/development
vagrant ssh
cd /spotters
rake db:seed
```
