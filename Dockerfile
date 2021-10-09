FROM ruby:3.0.0

RUN wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list
RUN set -x && apt-get update -y -qq && apt-get install -yq nodejs yarn

RUN mkdir /forza_app

#作成したディレクトリを作業用のディレクトリに指定する。
WORKDIR /forza_app

#GemfileとGemfile.lockをCOPY
COPY Gemfile /forza_app/Gemfile   
COPY Gemfile.lock /forza_app/Gemfile.lock

#gemをインストールするために、bundle install
RUN bundle install

COPY . /forza_app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

