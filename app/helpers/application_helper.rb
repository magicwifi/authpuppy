# encoding: utf-8
module ApplicationHelper
  def convert_to_human(bytes)
    kilobytes = bytes/1024
    if kilobytes < 1024
      return kilobytes.to_s + ' KB'
    end
    megabytes = bytes/1024**2
    if megabytes < 1024
      return megabytes.to_s + ' MB'
    end
    gigabytes = bytes/1024**3
    if gigabytes < 1024
      return gigabytes.to_s + ' GB'
    end
    terabytes = bytes/1024**4
    return terabytes.to_s + ' TB'
  end

  def current_admin
    @current_admin ||= Admin.find_by_token(cookies[:token]) if cookies[:token]
  end
  
  def convert_auth(type)
    if type == "local"    
      return "免登陆认证"
    else
      return "短信认证"
    end
  end
  
  def convert_device(device)
    if device    
      return "开启"
    else
      return "关闭"
    end
  end

  def convert_conf_check(checkinterval)
    checkstr = checkinterval/60
    return checkstr.to_s+"分钟"
  end

  def convert_conf_auth(authinterval)
    authstr = authinterval/60
    return authstr.to_s+"分钟"
  end

end
