package flowershop.aop;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import flowershop.common.CommonUtils;

@Component
@Aspect
public class ErrorLog {
	
	/*
	 * 异常抛出通知
	 */
	@AfterThrowing(value="execution(* flowershop.service.*.*(..))",throwing="e")
	public void afterThrowing(JoinPoint joinPoint,Throwable e) throws Exception
	{
		System.out.println("进入aftrethrowing:"+e.getMessage());
		String direct = "e:\\errorlog\\"+CommonUtils.TransferDateToString(new Date(),"yyyy-MM-dd");
		File file = new File(direct);
		if(!file.exists()){
			file.mkdir();          
		}
		
		String txtpath=direct+"\\"+CommonUtils.TransferDateToString(new Date(),"HH--mm--ss")+".txt";
		File path=new File(txtpath);
        if(!path.exists()) {
        	path.createNewFile();
        }
		// write
		FileWriter fw = new FileWriter(txtpath, true);
		BufferedWriter bw = new BufferedWriter(fw);
		bw.write(e.getMessage());
		bw.flush();
		bw.close();
		fw.close();
		System.out.println("出atferthrowing:"+path);
		/*System.out.println("StackTrace:"+e.getStackTrace());
		System.out.println("Cause:"+e.getCause());
		System.out.println("Suppressed:"+e.getSuppressed());
		System.out.println("Message:"+e.getMessage());*/
	}		
}
