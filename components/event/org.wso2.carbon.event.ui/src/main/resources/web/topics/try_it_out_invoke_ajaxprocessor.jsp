<%@ page import="org.apache.axiom.om.OMElement" %>
<%@ page import="org.apache.axiom.om.impl.builder.StAXOMBuilder" %>
<%@ page import="org.wso2.carbon.event.client.broker.BrokerClient" %>
<%@ page import="org.wso2.carbon.event.ui.UIUtils" %>
<%@ page import="java.io.ByteArrayInputStream" %>
<%@ page import="org.wso2.carbon.event.client.broker.BrokerClientException" %>

<%

    BrokerClient brokerClient = UIUtils.getBrokerClient(config, session, request);
    String topic = request.getParameter("topic");
    String textMsg = request.getParameter("xmlMessage");
    session.setAttribute("errorTopic", topic);
    session.setAttribute("xmlMessage", textMsg);
    String messageToBePrinted = null;
    try {
        brokerClient.publish(topic, textMsg);
    } catch (Exception e) {
        messageToBePrinted = "错误: 发布消息出错了。 " + e.getMessage();
    }

    if (messageToBePrinted == null) {
        messageToBePrinted = "消息成功发不到主题 :" + topic;
    }
%>
<%=messageToBePrinted%>



