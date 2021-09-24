package org.example;

import io.netty.channel.epoll.Epoll;

public class App {
	public static void main(String[] args) {
		System.out.println("\tEpoll.isAvailable: " + Epoll.isAvailable());

		try {
			Epoll.ensureAvailability();
			System.out.println("\tEpoll.ensureAvailability: OK");
		}
		catch (Throwable throwable) {
			System.out.println("\tEpoll.ensureAvailability: FAILED - " + throwable);
		}
	}
}
