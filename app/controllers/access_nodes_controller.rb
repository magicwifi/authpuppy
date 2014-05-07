#a encoding: utf-8
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
    @auth =@access.auth ||= Auth.first
  end

  def query_lat_long
    if params[:id].nil? 
      flash[:notice] = "调用方式有误"
      redirect_to :action => "index" 
      return;
    end

    @access = AccessNode.find_by_id(params[:id]);

    if params[:place].nil? and params[:place].blank?
      flash[:notice] = "请输入有效的地址"
      redirect_to advance_url(@access) 
      return;
    end

    require"open-uri"
    require"json"
    uri = "http://api.map.baidu.com/geocoder/v2/?address="+params[:place].to_s+"&output=json&ak=5dfe24c4762c0370324d273bc231f45a"
    begin
      encoded_uri = URI::encode(uri)
      baidu_response = open(encoded_uri).read
      json =  ActiveSupport::JSON.decode(baidu_response)
    rescue Exception => e
      flash[:notice] = "请输入有效的地址"
      redirect_to advance_url(@access) 
      return;
    end

    if json["status"] == 0
      lng = json["result"]["location"]["lng"]
      lat = json["result"]["location"]["lat"]

      @access.update_attributes(lat:lat,long:lng)
      flash[:notice] = "改动成功"

      respond_to do |format|  
        format.html { render :text=>"Success Set Long and Lat" }
        format.js { render :layout=>false }
      end

    else
      flash[:notice] = "请输入有效的地址"
      redirect_to advance_url(@access) 
    end
  end

  def advanced
    @access = AccessNode.find(params[:id])
    @auth =@access.auth ||= Auth.first
  end

  def init
    @access = AccessNode.find(params[:id])
    @config =@access.conf ||= Conf.first
  end

  def firewall
    @access = AccessNode.find(params[:id])
    @macs = @access.trusted_macs
    @blackmac = @access.black_macs
    @publicips = @access.public_ips
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
    @online_num = @access.show_online()
    @daily_num = @connections.unique_by_date(Time.now.to_date).length
  end

  def setconfig
    @access = AccessNode.find(params[:id])
    @access.update_attributes(:cmdline=>params[:cmdline],:cmdflag =>true ) 
    flash[:notice] = "远程操作成功！"
    redirect_to access_nodes_url;
  end
  
end
