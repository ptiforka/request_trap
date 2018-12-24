class RoomsController < ApplicationController
  protect_from_forgery except: :trap

  def index; end

  def trap
    p params
    message = Message.create({
                                 method: request.request_method,
                                 ip: request.ip,
                                 scheme: request.scheme,
                                 query_parameters: request.query_parameters,
                                 query: request.query_string,
                                 cookies: request.cookies,
                                 headers: headers,
                                 trap_id: params[:trap_id]
                             })

    MessageBroadcastJob.perform_later(message) if message.persisted?

  end

  def show
    @messages = Message.where(:trap_id => params['trap_id'])
  end
end