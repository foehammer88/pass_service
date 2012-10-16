require 'rubygems'
require 'twilio-ruby'

class MessagesController < ApplicationController 

  # GET /messages
  # GET /messages.json
  def index
    #@messages = Message.all
    @messages = Message.order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    if request.headers["Authorization"] == "Basic 78f91d346838110d9edb6be3996624a9"
      @message = Message.find(params[:id])
    end
  end

  # POST /messages
  # POST /messages.json
  def create
    params[:message][:ip] = request.remote_ip
    p request.headers["Authorization"]
    if request.headers["Authorization"] == "Basic 78f91d346838110d9edb6be3996624a9"
    @message = Message.new(params[:message])
    @to = params[:message][:to]
    @from = params[:message][:from]
    @body = params[:message][:body]
    
    send_text_message @to, @from, @body

    #params[:message][:ip] = request.remote_ip
    #p params[:message][:ip]

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    if request.headers["Authorization"] == "Basic 78f91d346838110d9edb6be3996624a9"
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    if request.headers["Authorization"] == "Basic 78f91d346838110d9edb6be3996624a9"
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
    end
  end

  def send_text_message(to, from, body)
    
    @account_sid = 'ACa19ce2e4d0a7d4ae466a387de9379b31'
    @auth_token = 'c3b513b6191b3de507e8f2602d3680a8'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    
    @account = @client.account
    @smmessage = @account.sms.messages.create({:from => '+14253294880', :to => to, :body => body})
  end
end
