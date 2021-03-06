class ChatroomsController < ApplicationController
  
  layout 'alternative'
  # GET /chatrooms
  # GET /chatrooms.xml
  def index
    @chatrooms = Chatroom.all
    @users = User.logged_in.all
    @bunch = User.order("created_at DESC").limit(30)
    @group = []
    @bunch.each do |u|
      if u.avatar.exists? && u.dj_name != nil
        @group << u
      end
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @chatrooms }
    end
  end

  # GET /chatrooms/1
  # GET /chatrooms/1.xml
  def show
    @chatroom = Chatroom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @chatroom }
    end
  end

  # GET /chatrooms/new
  # GET /chatrooms/new.xml
  def new
    @chatroom = Chatroom.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @chatroom }
    end
  end

  # GET /chatrooms/1/edit
  def edit
    @chatroom = Chatroom.find(params[:id])
  end

  # POST /chatrooms
  # POST /chatrooms.xml
  def create
    @chatroom = Chatroom.new(params[:chatroom])

    respond_to do |format|
      if @chatroom.save
        format.html { redirect_to(@chatroom, :notice => 'Chatroom was successfully created.') }
        format.xml  { render :xml => @chatroom, :status => :created, :location => @chatroom }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @chatroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chatrooms/1
  # PUT /chatrooms/1.xml
  def update
    @chatroom = Chatroom.find(params[:id])

    respond_to do |format|
      if @chatroom.update_attributes(params[:chatroom])
        format.html { redirect_to(@chatroom, :notice => 'Chatroom was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @chatroom.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chatrooms/1
  # DELETE /chatrooms/1.xml
  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy

    respond_to do |format|
      format.html { redirect_to(chatrooms_url) }
      format.xml  { head :ok }
    end
  end
  
end
