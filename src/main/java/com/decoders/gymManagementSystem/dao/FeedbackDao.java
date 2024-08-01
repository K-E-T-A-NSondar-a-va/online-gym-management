package com.decoders.gymManagementSystem.dao;

import java.util.List;

import com.decoders.gymManagementSystem.bean.Feedback;

public interface FeedbackDao {

	void saveFeedback(Feedback feedback);
	
	void deleteFeedBackById(Long feedbackId);
	
	List<Feedback> getFeedbackList();
	
}
