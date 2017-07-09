FROM centos:centos6
MAINTAINER tachibanayu24@gmail.com

ENV http_proxy http://cache.cc.kogakuin.ac.jp:8080/
ENV https_proxy http://cache.cc.kogakuin.ac.jp:8080/
ENV ftp_proxy http://cache.cc.kogakuin.ac.jp:8080/

RUN echo 'export http_proxy=http://cache.cc.kogakuin.ac.jp:8080/' >> ~/.bash_profile
RUN echo 'export https_proxy=http://cache.cc.kogakuin.ac.jp:8080/' >> ~/.bash_profile
RUN echo 'export ftp_proxy=http://cache.cc.kogakuin.ac.jp:8080/' >> ~/.bash_profile
RUN source ~/.bash_profile

RUN yum -y install git
RUN git config --global http.proxy http://cache.cc.kogakuin.ac.jp:8080/
RUN git config --global https.proxy http://cache.cc.kogakuin.ac.jp:8080/
RUN git config --global url."https://".insteadOf git://

RUN git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
RUN echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
RUN source ~/.bash_profile
RUN exec $SHELL

RUN git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

RUN yum -y install gcc
RUN yum -y install make
RUN yum -y install bzip2
# その他必要に応じてもろもろのパッケージを予めインストールしておく
# 必要なパッケージがないとrubyのインストールで怒られる

RUN rbenv install 2.3.1
RUN rbenv rehash
RUN rbenv global 2.3.1

RUN gem install rails
RUN rbenv rehash

RUN gem install bundler

RUN yum -y install http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
RUN yum install -y mysql-server mysql-devel
RUN service mysqld start
RUN chkconfig mysqld on

RUN git clone https://github.com/tachibanayu24/exp2 exp2/
RUN cd exp2/
RUN rails s

CMD ["/bin/bash"]