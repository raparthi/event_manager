class EventsController < ApplicationController
  def index
    @events = Event.all
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @events.as_json(methods: %i[accepted_count rejected_count]) }
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path, notice: 'Event Successfully created'
    else
      render :new
    end
  end

  def new
    @event = Event.new
  end

  def accept
    event = EventUser.find_by(id: params[:id])

    if event
      event.update(status: params[:status])
      redirect_to root_path, notice: 'Event has updated'
    else
      redirect_to root_path, notice: 'Event not found'
    end
  end

  def destroy
    if current_user.id = event.user_id
      event.destroy
      redirect_to root_path, notice: 'Event deleted success fully'

    else
      redirect_to root_path, notice: 'User dont have permission'
    end
  end

  private

  def event_params
    params[:event][:user_id] = current_user.id
    params[:event][:event_users_attributes] = params[:event][:event_users].map { |elem| elem unless elem.empty? }.compact.map { |elem| { "user_id": elem } }
    params.require(:event).permit(:title, :description, :start, :end, :user_id, event_users_attributes: [:user_id])
  end

  def event
    Event.find_by(id: params[:id])
  end
end
