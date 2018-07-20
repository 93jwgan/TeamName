package usertest;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

public class test {

	public static void main(String[] args) throws Exception{
		
		youtube();
		
	}
	
	public static void request() throws Exception{
		HttpClient httpClient = new DefaultHttpClient();	
		
		String url = "https://maps.googleapis.com/maps/api/directions/json?origin=sydney,au&destination=perth,au&waypoints=via:-37.81223%2C144.96254%7Cvia:-34.92788%2C138.60008&key=AIzaSyAfkFqWArB8a77fiEJuJN80OW9TFtfoJhY";
		HttpGet httpGet = new HttpGet(url);

		httpGet.setHeader("Accept","application/json");
		httpGet.setHeader("Content-Type","application/json");
		


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

	public static void rrr() throws Exception{
		System.out.println();
    	//웹검색
    	//String apiURL = "https://dapi.kakao.com/v2/search/image?query=java&page=1&size=1";
    	
    	//이미지검색 URL
        String text = URLEncoder.encode("vVLh2Qab+D5tBHbHGawxEw", "UTF-8");
//        String daumOpenAPIURL = "https://api.odsay.com/v1/api/searchPubTransPath?lang=0&SX=126.93737555322481&SY=37.55525165729346&EX=126.88265238619182&EY=37.481440035175375&OPT=1&apiKey="+text;
//        String daumOpenAPIURL = "https://maps.googleapis.com/maps/api/directions/json?origin=37.442898,126.734237&destination=37.522674,126.915114&mode=transit&language=ko&key=AIzaSyAfkFqWArB8a77fiEJuJN80OW9TFtfoJhY";
        String daumOpenAPIURL = "https://maps.googleapis.com/maps/api/directions/json?origin=37.49438,127.02842&destination=37.505014926174276,127.03117681481933&mode=transit&key=AIzaSyAfkFqWArB8a77fiEJuJN80OW9TFtfoJhY";
        // java API 를 이용 HttpRequest
        URL url = new URL(daumOpenAPIURL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        
        
        // Response Code GET
        int responseCode = con.getResponseCode();
        
        BufferedReader br = null;
        
        if(responseCode==200) { 
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        
        //JSON Data 읽기
        String jsonData = "";
        StringBuffer response = new StringBuffer();
        
        while ((jsonData = br.readLine()) != null) {
//        	System.out.println(jsonData);
            response.append(jsonData);
        }
        
        System.out.println(response);
        
        br.close();
        
        // Console 확인
//        System.out.println(response.toString());
	}
	
	public static void youtube() throws Exception{
		System.out.println();

        String text = URLEncoder.encode("페이커", "UTF-8");
        String daumOpenAPIURL = "https://www.googleapis.com/youtube/v3/search?q="+text+"&key=AIzaSyAfkFqWArB8a77fiEJuJN80OW9TFtfoJhY&part=snippet&order=viewCount&regionCode=KR";
        // java API 를 이용 HttpRequest
        URL url = new URL(daumOpenAPIURL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("GET");
        
        
        // Response Code GET
        int responseCode = con.getResponseCode();
        
        BufferedReader br = null;
        
        if(responseCode==200) { 
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        
        //JSON Data 읽기
        String jsonData = "";
        StringBuffer response = new StringBuffer();
        
        while ((jsonData = br.readLine()) != null) {
        	System.out.println(jsonData);
//            response.append(jsonData);
        }
        
//        System.out.println(response);
        
        br.close();
        
        // Console 확인
//        System.out.println(response.toString());
	}
	
}









