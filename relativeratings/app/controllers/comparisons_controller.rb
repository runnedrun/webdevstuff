class ComparisonsController < ApplicationController
  # GET /comparisons
  # GET /comparisons.xml
  def index
    @comparisons = Comparison.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comparisons }
    end
  end

  # GET /comparisons/1
  # GET /comparisons/1.xml
  def show
    @comparison = Comparison.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comparison }
    end
  end

  # GET /comparisons/new
  # GET /comparisons/new.xml
  def new
    @comparison = Comparison.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comparison }
    end
  end

  # GET /comparisons/1/edit
  def edit
    @comparison = Comparison.find(params[:id])
  end

  # POST /comparisons
  # POST /comparisons.xml
  def create
    @comparison = Comparison.new(params[:comparison])

    respond_to do |format|
      if @comparison.save
        format.html { redirect_to(@comparison, :notice => 'Comparison was successfully created.') }
        format.xml  { render :xml => @comparison, :status => :created, :location => @comparison }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comparison.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comparisons/1
  # PUT /comparisons/1.xml
  def update
    @comparison = Comparison.find(params[:id])

    respond_to do |format|
      if @comparison.update_attributes(params[:comparison])
        format.html { redirect_to(@comparison, :notice => 'Comparison was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comparison.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comparisons/1
  # DELETE /comparisons/1.xml
  def destroy
    @comparison = Comparison.find(params[:id])
    @comparison.destroy

    respond_to do |format|
      format.html { redirect_to(comparisons_url) }
      format.xml  { head :ok }
    end
  end
end
