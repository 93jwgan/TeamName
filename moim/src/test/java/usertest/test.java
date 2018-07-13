package usertest;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

public class test {

	public static void main(String[] args) throws Exception{
		
		request();
		
	}
	
	public static void request() throws Exception{
		HttpClient httpClient = new DefaultHttpClient();	
		
		String url = "https://maps.googleapis.com/maps/api/directions/json?origin=Disneyland&destination=Universal+Studios+Hollywood4&key=AIzaSyAfkFqWArB8a77fiEJuJN80OW9TFtfoJhY";
		HttpGet httpGet = new HttpGet(url);

//		httpGet.setHeader("Accept","application/json");
//		httpGet.setHeader("Content-Type","application/json");
		


		System.out.println("------------------");
		System.out.println(httpGet);
		System.out.println("------------------");
		
		
		
		HttpResponse httpResponse = httpClient.execute(httpGet);
		System.out.println(httpResponse);
		System.out.println();
		
		HttpEntity responsHttpEntity = httpResponse.getEntity();
		
		InputStream is = responsHttpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		System.out.println("[Server 에서 받은 Data 확인]");
		String serverData = br.readLine();
		System.out.println(serverData);
		
		JSONObject jsonobj = (JSONObject)JSONValue.parse(serverData);
		System.out.println(jsonobj);
		
	}

}
