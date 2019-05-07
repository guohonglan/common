package flowershop.exceptionresolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

@Component
public class ExceptionResolver implements HandlerExceptionResolver{

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		String msg=null;
		//自定义异常
		if(ex instanceof MyException)
		{
			msg=((MyException)ex).getMsg();
		}
		else
		{
			msg="不好，页面被外星人偷走了！";
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("error");
		return mav;
	}

}
