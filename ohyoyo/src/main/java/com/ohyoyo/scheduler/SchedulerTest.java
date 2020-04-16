package com.ohyoyo.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SchedulerTest {
	// cron 표기법
	// @Scheduled(cron = "0 52 9 * * *")
	public void Test() {
		log.info("Welcome Scheduling  :)");
	}
}
