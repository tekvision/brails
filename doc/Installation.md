# Install Brails


* Login as root (with provided credentials)

## Setup deploy user and ssh-key pair authentication

* Ensure that `/etc/ssh/sshd_config` is configured with these settings

    RSAAuthentication yes
    PubkeyAuthentication yes
    AuthorizedKeysFile      %h/.ssh/authorized_keys

Incase we have to change the files, restart it `service ssh restart`. Now create the deploy user

    # useradd -m -s/bin/bash deploy
    # passwd deploy

Now, ensure that deploy has full sudo rights. Issue the command `visudo` and ensure this setting exists

    deploy ALL = (ALL) NOPASSWD: ALL

Now, become deploy using `su - deploy` and we should be in /home/deploy as user deploy. Now setup ssh-key pair

    ssh-keygen

This creates ~/.ssh/id_rsa and ~/.ssh/id_rsa.pub. Create authorized_keys

    cd ~/.ssh
    cat id_rsa.pub > authorized_key

Now, on your local-machine you can set this configuration in your ~/.ssh/config 

Host brails
  Hostname <ip address>
  User deploy
  IdentityFile ~/.ssh/id_rsa.brails

Now, you can simply login as `$ ssh brails` **and** this will also be used for our auto-deployment

## Setup Ruby using RVM

    sudo apt-get update # update the sources
    sudo apt-get install build-essential
    sudo apt-get install git
    sudo apt-get install libmagick++-dev  # For image manipulation
    sudo apt-get install libcurl4-openssl-dev
    sudo apt-get install libxslt-dev

Now, we are set to install Ruby

    curl -L https://get.rvm.io | bash -s stable --ruby

This installs ruby-2.0.0-p247. Ensure that you delete the newly created `.bash_profile` as it interfers with `.bashrc`. Add the following to the end of `.bashrc`

    PATH=$PATH:/opt/mongo/bin:$HOME/.rvm/bin # Add RVM to PATH for scripting
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

## Setup MongoDB

    wget http://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.4.5.tgz
    tar xzf mongodb-linux-x86_64-2.4.5.tgz
    sudo mkdir -p /opt/mongo
    sudo cp -r mongodb-linux-x86_64-2.4.5/bin /opt/mongo

## Setup Nginx / Passenger
    
    gem install passenger
    rvmsudo passenger-install-nginx-module

Now, ensure you have these settings in `nginx.conf`

    user deploy;

    gzip on;
    client_max_body_size 15M;

    server {
      listen 80;
      server_name _;
      root /home/deploy/current/public;
      passenger_enabled on;
    }

## Mina deployment 

Ensure that the private key is in `doc/id_rsa` as mina expects it there. **NOTE: DO NOT COMMIT the Private key to repository**

    mina deploy
    


