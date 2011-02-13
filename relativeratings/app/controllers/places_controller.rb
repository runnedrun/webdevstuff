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
    up = params["up"]
    down = params["down"]

    for comp in current_place.comparisons.all
      place = comp.compared_to
      if up.include?(place)
        comp.times +=1
        comp.save
        up.delete(place)
        p = Place.find(place)
        p.rating +=1
        p.save
      end
      if down.include?(place)
        comp.times +=1
        comp.save 
        down.delete(place)
        p = Place.find(place)
        p.rating-=1
        p.save
      end
    end

    for id in up
      place = Place.find(id)
      comp = Comparison.create(:compared_to => id, :times =>1, :place => current_place)
      place.rating+=1
      place.save
    end
    for id in down
      place = Place.find(id)
      comp = Comparison.create(:compared_to => id, :times =>1, :place => current_place)
      place.rating-=1
      place.save
    end
    
    
    current_place.save
    redirect_to :action => "show", :id => current_place.id
    return 
    
  end

  def rated_against
    id = params[:id]
    place = Place.find(id)
    against = Hash.new
    for comp in place.comparisons.all
      against[Place.find(comp.compared_to).title] = comp.times
    end
    
    render :json => against
    return
  end

  def all_places
    render :json =>  Place.all
  end

  def create
    comp = params[:place][:comparisons]
    ncomp = false
    if not comp.length ==0
      ncomp = Place.find(:first, :conditions => ["title = :c", {:c => comp}])  
    end
    params[:place].delete(:comparisons)
    @place = Place.new(params[:place])
    if ncomp
     
      r = Comparison.new(:compared_to => ncomp.id,:place => @place, :times =>1)
      
      
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
    bad_comps = Comparison.find(:all, :conditions => "compared_to = #{params[:id]}")
    for comp in bad_comps
      comp.destroy
    end

    respond_to do |format|
      format.html { redirect_to(places_url) }
      format.xml  { head :ok }
    end
  end
end
