class InvitesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  # GET /invites
  # GET /invites.json
  def index
    # @invites = Invite.all
    username = params[:username]
    cur_user = User.where(username: username).first
    @invite = cur_user.invites.last #change this to use list?
    cur_user.invites.destroy_all #deletes all invites currently
    #check if it was a recent invite
    respond_to do |format|
      # format.html # index.html.erb
      format.html { render json: @invite }
      format.json { render json: @invite }
    end
  end

  # GET /invites/1
  # GET /invites/1.json
  def show
    @invite = Invite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @invite }
    end
  end

  # GET /invites/new
  # GET /invites/new.json
  def new
    @invite = Invite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @invite }
    end
  end

  # GET /invites/1/edit
  def edit
    @invite = Invite.find(params[:id])
  end

  # POST /invites
  # POST /invites.json
  def create
    username = params[:username]
    new_group = Group.create()
    group_id = new_group.id
    @invite = Invite.new()
    @invite.accept = false
    @invite.username = username
    @invite.group_id = group_id
    respond_to do |format|
      if @invite.save
        invited_usernames = params[:invited_usernames]
        invited_usernames.each do |invited_username|
          #messed this up, oh well
          new_invite = Invite.new()
          new_invite.accept = false
          new_invite.username = username
          new_invite.group_id = group_id
          invited_user = User.where(username: invited_username).first
          invited_user.invites << new_invite
          invited_user.save
        end
        cur_user = User.where(username: username).first
        cur_user.invites << @invite
        cur_user.save
        # format.html { redirect_to @invite, notice: 'Invite was successfully created.' }
        format.html { render json: @invite } #might work
        format.json { render json: @invite }
      else
        format.html { render action: "new" }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /invites/1
  # PUT /invites/1.json
  def update
    @invite = Invite.find(params[:id])

    respond_to do |format|
      if @invite.update_attributes(params[:invite])
        format.html { redirect_to @invite, notice: 'Invite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.json
  def destroy
    @invite = Invite.find(params[:id])
    @invite.destroy

    respond_to do |format|
      format.html { redirect_to invites_url }
      format.json { head :no_content }
    end
  end
end
