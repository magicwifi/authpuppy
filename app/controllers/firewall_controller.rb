# encoding: utf-8
class FirewallController < ApplicationController
  before_filter :check_admin

  def tmac_add
    if params[:id].nil? and params[:mac].nil?
      redirect_to "/404"
      return;
    end

    @access = AccessNode.find(params[:id])
    if @access.nil?
      redirect_to "/404"
      return;
    end

    if @access.trusted_macs.count >= 5
      @err = "MAC地址白名单已满"
    else
      begin
        @mac = TrustedMac.create!(mac:params[:mac],access_node_id:params[:id]);
      rescue Exception => e
        @err = "添加失败,请检查MAC地址格式"
      end
    end
    
    if !@err.nil?
      respond_to do |format|  
        format.html { render :text=>"Success to create mac address" }
        format.js { render :action=>"addfail", :layout=>false }
      end
    else
      @access.update_attributes( :configflag => true );
      @access.clean_all_conn 
      respond_to do |format|  
        format.html { render :text=>"Success to create mac address" }
        format.js { render :layout=>false }
      end
    end
  end

  def tmac_del
    if params[:id].nil?
      redirect_to "/404"
      return;
    end

    TrustedMac.find(params[:id]).delete
    @mac = params[:id]
    respond_to do |format|  
      format.html { render :text=>"Fail to create mac address" }
      format.js { render :layout=>false }
    end
  end

  def bmac_add
    if params[:id].nil? and params[:mac].nil?
      redirect_to "/404"
      return;
    end

    @access = AccessNode.find(params[:id])
    if @access.nil?
      redirect_to "/404"
      return;
    end

    if @access.black_macs.count >= 5
      @err = "MAC地址黑名单已满"
    else
      begin
        @mac = BlackMac.create!(mac:params[:mac],access_node_id:params[:id]);
      rescue Exception => e
        @err = "添加失败,请检查MAC地址格式"
      end
    end

    if !@err.nil?
      respond_to do |format|  
        format.html { render :text=>"Success to create mac address" }
        format.js { render :action=>"addbfail", :layout=>false }
      end
   else 
     respond_to do |format|  
       format.html { render :text=>"Success to create mac address" }
       format.js { render :layout=>false }
     end
    end
  end

  def ip_add
    if params[:id].nil? and params[:ip].nil?
      redirect_to "/404"
      return;
    end

    @access = AccessNode.find(params[:id])
    if @access.nil?
      redirect_to "/404"
      return;
    end

    if @access.public_ips.count >= 5
      @err = "IP地址白名单已满"
    else
      begin
        @ip = PublicIp.create!(publicip:params[:ip],access_node_id:params[:id]);
      rescue Exception => e
        @err = "添加失败,请检查IP地址格式"
      end
    end

    if !@err.nil?
      respond_to do |format|  
        format.html { render :text=>"Success to create mac address" }
        format.js { render :action=>"addipfail", :layout=>false }
      end
   else 
     @access.update_attributes( :configflag => true );
     @access.clean_all_conn 
     respond_to do |format|  
       format.html { render :text=>"Success to create mac address" }
       format.js { render :layout=>false }
     end
    end
  end

  def bmac_del
    if params[:id].nil?
      redirect_to "/404"
      return;
    end

    BlackMac.find(params[:id]).delete
    @mac = params[:id]
    respond_to do |format|  
      format.html { render :text=>"Fail to create mac address" }
      format.js { render :layout=>false }
    end
  end

  def ip_del
    if params[:id].nil?
      redirect_to "/404"
      return;
    end

    PublicIp.find(params[:id]).delete
    @ip = params[:id]
    respond_to do |format|  
      format.html { render :text=>"Fail to create mac address" }
      format.js { render :layout=>false }
    end
  end

end
