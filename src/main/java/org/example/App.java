package org.example;

import io.netty.channel.epoll.Epoll;
import io.netty.channel.kqueue.KQueue;

public class App {
	public static void main(String[] args) {
		System.out.println("Epoll (Linux): " + Epoll.isAvailable());
		System.out.println("KQueue (OSX): " + KQueue.isAvailable());
	}
}
