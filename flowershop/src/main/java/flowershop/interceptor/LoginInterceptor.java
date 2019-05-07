package flowershop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	/*
	 * 登录拦截，权限校验
	 * @see org.springframework.web.servlet.HandlerInterceptor#preHandle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object)
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//System.out.println("aaaaaaaaaaaaaaaaaaaaaa");
		String url=request.getRequestURI();
		//System.out.println(url);
		String page=(url.substring(url.lastIndexOf("/"),url.lastIndexOf("."))).substring(1);
		//System.out.println(page);
		if(page.equals("home"))
		{
			//System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbb");
			Object object=request.getSession().getAttribute("adminid");
		    if(object==null)
		    {
		    	//System.out.println("cccccccccccccccccccccc");
		    	response.sendRedirect(request.getContextPath()+"/blogin.action");
		    }
		    else
		    {
		    	//System.out.println("ddddddddddddddddddddd");
		    	return true;
		    }
		}
		
		return true;    	    		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
