package com.likits.service.front;

import java.util.List;
import java.util.Map;

import com.likits.model.front.UserJson;


public interface RecommendService {
	
	List<Map<String, Object>> getRecommendUser();
	
	List<Map<String, Object>> getRecommendArticle(); 
}
