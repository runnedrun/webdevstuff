class PlacesController < ApplicationController
  # GET /places
  # GET /places.xml
  skip_before_filter :verify_authenticity_token
  def index
    @places = Place.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @places }
    end
  end

  # GET /places/1
  # GET /places/1.xml
  def show
    @place = Place.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/new
  # GET /places/new.xml
  def new
    @place = Place.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id])
  end

  # POST /places
  # POST /places.xml
  def new_rating
    @place = Place.find(params[:id])    
  end

  def parse_rate
    current_place = Place.find(params["id"])
    up = [params["up"]]
    down = [params["down"]]
    
    
    for helper in current_place.helpers.all 
      place = helper.comparison.place
      if up.include(place.title)
        helper.comparison.times +=1
        helper.comparison.save
        up.delete(place.title)
        Place.find(:first, :conditions => ["title =:c",{:c => place.title}]).rating+=1
      
      elsif down.include(place.title)
        helper.comparison.times +=1
        helper.comparison.save 
        down.delete(place.title)
        Place.find(:first, :conditions => ["title =:c",{:c => place.title}]).rating-=1

      end
    end

    for title in up
      place = Place.find(:first, :conditions => ["title =:c",{:c => title}])
      help = Helper.create(:place => current_place)
      comp = Comparison.create(:helper => help, :times =>1, :place => place)
      place.rating+=1
      place.save
    end
    for title in down
      place = Place.find(:first, :conditions => ["title =:c",{:c => title}])
      help = Helper.create(:place => current_place)
      comp = Comparison.create(:helper => help, :times =>1, :place => place)
      place.rating-=1
      place.save
    end
    
    
    current_place.save
    redirect_to :action => "show", :id => current_place.id
    return
    
  end

  def create
    comp = params[:place][:comparison]
    ncomp = false
    if not comp.length ==0
      ncomp = Place.find(:first, :conditions => ["title = :c", {:c => comp}])  
    end
    params[:place].delete(:comparison)
    @place = Place.new(params[:place])
    if ncomp
      help = Helper.new(:place => @place)
      r = Comparison.new(:helper => help,:place => ncomp, :times =>1)
      
      help.save
      r.save
    end
    

    
    respond_to do |format|
      if @place.save
        format.html { redirect_to(@place, :notice => 'Place was successfully created.') }
        format.xml  { render :xml => @place, :status => :created, :location => @place }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /places/1
  # PUT /places/1.xml
  def update
    @place = Place.find(params[:id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to(@place, :notice => 'Place was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.xml
  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to(places_url) }
      format.xml  { head :ok }
    end
  end
end
