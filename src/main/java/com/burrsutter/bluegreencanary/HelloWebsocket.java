package com.burrsutter.bluegreencanary;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.enterprise.context.ApplicationScoped;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.jboss.logging.Logger;

import io.quarkus.scheduler.Scheduled;

/**
 * HelloWebsocket
 */
@ServerEndpoint("/wsendpoint")
@ApplicationScoped
public class HelloWebsocket {
    private static final Logger LOG = Logger.getLogger(HelloWebsocket.class);
    int userCount = 0;
    int msgCount = 0;
    String color = "#6bbded"; // blue
    // String color = "#5bbf45"; // green
    // String color = "#f2f25e"; // canary
    Map<String, Session> sessions = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session) {
      LOG.info("onOpen");
      LOG.info("onOpen ID: " + session.getId());    
      sessions.put(session.getId(),session);
      userCount++;
    }
  
    @OnClose
    public void onClose(Session session) {
        LOG.info("onClose");
        sessions.remove(session.getId());
        userCount--;
    }
  
    @OnError
    public void onError(Session session, Throwable throwable) {        
        LOG.error("onError", throwable);        
    }
  
    @OnMessage
    public void onMessage(String message, Session session) {      
      LOG.info("onMessage: " + message);
      LOG.info("onMessage ID:" + session.getId());
      // broadcast(userCount + " " + message);
    }

    @Scheduled(every="2s")
    void send() {
        msgCount++;
        broadcast(color);
    }

    private void broadcast(String message) {
        StringBuffer msg = new StringBuffer();
        msg.append("{");
        msg.append("\"msgCount\" :" + msgCount);
        msg.append(", \"userCount\" :" + userCount);
        msg.append(", \"color\" : \"" + message + "\"");
        msg.append("}");
        sessions.values().forEach(s -> {
            s.getAsyncRemote().sendObject(msg.toString(), result ->  {
                if (result.getException() != null) {
                    System.out.println("Unable to send message: " + result.getException());
                }
            });
        });
    }

}