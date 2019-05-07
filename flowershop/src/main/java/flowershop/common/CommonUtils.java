package flowershop.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

public class CommonUtils {

	//将密码加密成MD5的格式
	public static String GetMD5String(String password)
	{
		try {
			// 得到一个信息摘要器
			MessageDigest digest = MessageDigest.getInstance("md5");
			byte[] result = digest.digest(password.getBytes());
			StringBuffer buffer = new StringBuffer();
			// 把每一个byte 做一个与运算 0xff;
			for (byte b : result) {
				// 与运算
				int number = b & 0xff;// 加盐
				String str = Integer.toHexString(number);
				if (str.length() == 1) {
					buffer.append("0");
				}
				buffer.append(str);
			}

			// 标准的md5加密后的结果
			return buffer.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return "";
		}
	}
	
	//返回n位的Id
	public static String ReturnId(int n)
	{
		Random r=new Random();
		String s="";
		for(int i=0;i<n;i++)
		{
			s+=String.valueOf(r.nextInt(10));
		}
		return s;
	}
	
	//返回32位的字符串
	public static String ReturnImageName()
	{
		return UUID.randomUUID().toString();
	}
	
	//根据生日计算星座
	public static String CaculateConstellation(String birthday)
    {       
        String[] a=birthday.split("-");        
        int month=Integer.parseInt(a[1]);
        int day=Integer.parseInt(a[2]);
        String s = "魔羯水瓶双鱼白羊金牛双子巨蟹狮子处女天秤天蝎射手魔羯";
        int[] arr = { 20, 19, 21, 21, 21, 22, 23, 23, 23, 23, 22, 22 };          
        int num=month * 2 - (day < arr[month - 1] ? 2 : 0);
        String constellation=s.substring(num, num+2) + "座";
        return constellation;
    }
	
	//将date转化成指定的字符串格式
	public  static String TransferDateToString(Date date,String reguler)
	{
		SimpleDateFormat sdf=new SimpleDateFormat(reguler);
		return sdf.format(date);
	}
	
	//校验用户昵称
	public static String validatenickname(String nickname,int size)
	{
		String message = null;
		if(nickname==null||nickname=="")
		{
			message="昵称不能为空!";
		}
		else if(nickname.length()>size)
		{
			message="昵称过长!";
		}
		return message;
	}
	
	//校验密码
	public static String validatepwd(String pwd)
	{
		String message=null;
		if(pwd==null||pwd=="")
		{
			message="密码不能为空！";
		}
		else if(pwd.length()<6||pwd.length()>15)
		{
			message="密码为6-15字母或数字！";
		}
		return message;
	}
}
