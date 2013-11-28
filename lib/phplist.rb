require 'net/http'
require 'uri'

module Phplist
  class API

    attr_accessor :domain, :action, :password, :ssl_enabled
    def initialize(default_parameters = {:domain => nil, :action => nil, :password => nil, :ssl_enabled => false})
      @domain = default_parameters[:domain]||self.class.domain
      @action = default_parameters[:action]||self.class.action
      @password = default_parameters[:password]||self.class.password
      @ssl_enabled = default_parameters[:ssl_enabled]||self.class.ssl_enabled
    end

    def subscribe(info = {:id => nil, :subscriber => {:email => nil, :name => nil, :city => nil, :country => nil}})
      return false if info[:id].blank?
      return false if info[:subscriber].blank? || info[:subscriber][:email].blank?
      p_email = info[:subscriber][:email]
      name = info[:subscriber][:name]
      p_name = CGI::escape(name||'')

      p_city = CGI::escape(info[:subscriber][:city]||'')
      p_country = CGI::escape(info[:subscriber][:country]||'')

      start_time = Time.now
      url = "http#{'s' if @ssl_enabled}://#{@domain}/#{@action}?passwd=#{@password}&email=#{p_email.downcase}&name=#{p_name}&city=#{p_city}&country=#{p_country}&makeconfirmed=1&lid=#{info[:id]}"
      url = URI.encode(url)
      uri = URI(url)
      res = Net::HTTP.get_response(uri)
      response_str = res.body.to_s
      if /success/i =~ response_str
      return true
      end
      return false
    end

    def subscribe_list(info = {:id => nil, :subscribers => [{:email => nil, :name => nil, :city => nil, :country => nil}]})
      return false if info[:id].blank?
      return false if info[:subscribers].blank?
      subscribed = false
      info[:subscribers].each do |subscriber|
        subscribed = subscribe({:id => info[:id], :subscriber => subscriber})
        return false unless subscribed
      end
      subscribed
    end

    class << self
      attr_accessor :domain, :action, :password, :ssl_enabled
      def method_missing(sym, *args, &block)
        new({:domain => self.domain, :action => self.action, :password => self.password, :ssl_enabled => self.ssl_enabled}).send(sym, *args, &block)
      end
    end

  end
end
