# encoding: utf-8
class AccessNodesController < ApplicationController
  before_filter :check_admin
  
  def index
    @access_nodes = AccessNode.paginate(page: params[:page]);
  end

  def new
    @access_node = AccessNode.new
  end

  def destroy
    @access_node = AccessNode.find(params[:id])
    if @access_node.destroy
      flash[:notice] = "Node Destroyed"
    else
      flash[:error] = "Error Destroy"
    end
    redirect_to :action=>"index"
  end

  def edit
    @access = AccessNode.find(params[:id])
  end

  def create
    @access_node = AccessNode.new(params[:access_node])
    if @access_node.save
      flash[:notice] = "AccessNode was successfully create"
      redirect_to :ation => "index"
    else
      flash[:notice] = "AccessNode was not successfully create"
      render :action => "new"
    end
  end

  def update
    @access_node = AccessNode.find(params[:id]);
    if @access_node.update_attributes(params[:access_node])
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  def show
    page = params[:page] || 1
    timeframe = params[:time] || Time.now - 1.month
    @access = AccessNode.find(params[:id])
    @connections = @access.connections.list_by_date(page, timeframe, @access_node)
    @online_num = @connections.show_online()
    @daily_num = @connections.unique_by_date(Time.now.to_date).length
  end

  def home
    @access = AccessNode.find(params[:id])
  end
  
  def editconfig
    @access_node = AccessNode.find(params[:id]);
  end

  def setconfig
    node = AccessNode.find(params[:id]);
    if node.update_attributes(:configflag => true,
                              :cmdline => params[:cmdline] 
                          );
      redirect_to :action => "index"
    else
      render  :action => "editconfig"  
    end
  end
  
  def showconfig
    node = AccessNode.find_by_mac(params[:mac]);
    render :text => node.cmdline 
  end

end
