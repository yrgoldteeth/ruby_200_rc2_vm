%w( build-essential
    wget
    vim
    git-core
    curl
    bison
    openssl
    libreadline6
    libreadline6-dev
    zlib1g
    zlib1g-dev
    libssl-dev
    libyaml-dev
    libxml2-dev
    libxslt-dev
    autoconf
    libc6-dev
    ncurses-dev
    libcurl4-openssl-dev
    libopenssl-ruby
    libapr1-dev
    libaprutil1-dev
    libx11-dev
    libffi-dev
    libqt4-dev ).map{|p| package p}

SOURCE_DIR = '/home/vagrant/src'

bash 'create source directory' do
  user 'vagrant'
  code <<-EOH
    mkdir #{SOURCE_DIR}
  EOH
  not_if "test -d #{SOURCE_DIR}"
end

bash 'download ruby' do
  user 'vagrant'
  code <<-EOH
    cd #{SOURCE_DIR}
    wget ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.gz
  EOH
  not_if "test -f #{SOURCE_DIR}/ruby-2.0.0-rc2.tar.gz"
end

bash 'extract, make, make install ruby' do
  code <<-EOH
    cd #{SOURCE_DIR}
    tar -xzvf ruby-2.0.0-rc2.tar.gz
    cd ruby-2.0.0-rc2
    ./configure
    make
    make install
  EOH
  not_if 'ruby -v|grep 2.0.0dev'
end

bash 'download rubygems' do
  user 'vagrant'
  code <<-EOH
    cd #{SOURCE_DIR}
    wget http://production.cf.rubygems.org/rubygems/rubygems-1.8.25.tgz
  EOH
  not_if "test -f #{SOURCE_DIR}/rubygems-1.8.25.tgz"
end

bash 'extract and install rubygems' do
  code <<-EOH
    cd #{SOURCE_DIR}
    tar -zxvf rubygems-1.8.25.tgz
    cd rubygems-1.8.25
    ruby setup.rb
  EOH
  not_if 'gem -v|grep 1.8.25'
end
