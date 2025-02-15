package com.decoders.gymManagementSystem.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.decoders.gymManagementSystem.bean.Feedback;

public interface FeedbackRepository extends JpaRepository<Feedback, Long> {
	
	@Query("select max(feedbackId) from Feedback")
	public Long findLastFeedbackId();
	
}
