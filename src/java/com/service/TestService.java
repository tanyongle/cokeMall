package com.service;

import java.util.List;
import java.util.Map;

import com.mapper.TestMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService {
	@Autowired
	private TestMapper testMapper;

	public List<Map<String, Object>> findAll() {
		// TODO Auto-generated method stub
		return testMapper.findAll();
	}
	
}
