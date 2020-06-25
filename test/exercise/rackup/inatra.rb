module Inatra
  class << self
    def routes(&block)
      @routes ||= {}
      instance_eval(&block)
    end

    def call(env)
      req = Rack::Request.new(env)
      method = req.request_method.downcase.to_sym
      path = req.path_info
      return missing if @routes[method][path].nil?
      @routes[method][path].call
    end

    def add_route(method, path, &block)
      @routes[method] ||= {}
      @routes[method][path] = block
    end

    def method_missing(method, *args, &block)
      if [:get, :post].include?(method)
        add_route(method, *args, &block)
      else
        super
      end
    end

    def missing
      [404, {}, ['Not Found']]
    end
  end
end
