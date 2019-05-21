<%@ taglib uri="http://wso2.org/projects/carbon/taglibs/carbontags.jar" prefix="carbon" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="org.wso2.carbon.utils.ServerConstants"%>
<%@ page import="org.apache.axis2.context.ConfigurationContext"%>
<%@ page import="org.wso2.carbon.ui.CarbonUIUtil"%>
<%@ page import="org.wso2.carbon.CarbonConstants"%>
<%@ page import="org.wso2.carbon.ui.CarbonUIMessage" %>

<%@page import="org.wso2.carbon.event.client.broker.BrokerClient"%>

<%@page import="org.wso2.carbon.event.client.stub.generated.SubscriptionDetails"%>

<%@page import="org.wso2.carbon.event.ui.UIUtils"%>
<%@page import="org.apache.axiom.om.OMAbstractFactory"%>
<%@page import="org.apache.axiom.om.OMFactory"%>
<%@page import="javax.xml.namespace.QName"%>
<%@page import="org.apache.axiom.om.OMElement"%>


<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%><fmt:bundle basename="org.wso2.carbon.eventing.ui.i18n.Resources">


    <script type="text/javascript" src="../admin/js/breadcrumbs.js"></script>
    <script type="text/javascript" src="../admin/js/cookies.js"></script>
    <script type="text/javascript" src="../admin/js/main.js"></script>
    <script type="text/javascript" src="eventing.js"></script>
    <script type="text/javascript" src="js/subscriptions.js"></script>
    <script type="text/javascript" src="js/eventing_utils.js"></script>


    <!--EditArea javascript syntax hylighter -->
<script language="javascript" type="text/javascript" src="../editarea/edit_area_full.js"></script>
<!--Yahoo includes for dom event handling-->
<script src="../yui/build/yahoo-dom-event/yahoo-dom-event.js" type="text/javascript"></script>
<script type="text/javascript">
    YAHOO.util.Event.onAvailable("JScript", function() {
        editAreaLoader.init({
            id : "JScript"        // textarea id
            ,syntax: "js"            // syntax to be uses for highgliting
            ,start_highlight: true        // to display with highlight mode on start-up
            ,allow_resize: "both"
            ,min_height:250
        });
    });
     function handleFocus(obj,txt){
            if(obj.value == txt) {
                obj.value = '';
                YAHOO.util.Dom.removeClass(obj,'defaultText');

            }
        }
        function handleBlur(obj,txt){
            if (obj.value == '') {
                obj.value = txt;
                YAHOO.util.Dom.addClass(obj,'defaultText');
            }
        }
         YAHOO.util.Event.onDOMReady(
                function(){
                    document.getElementById("hhid").value="HH";
                    document.getElementById("mmid").value="mm";
                    document.getElementById("ssid").value="ss";
                }
         )


</script>

    <%-- YUI Calendar includes--%>
    <link rel="stylesheet" type="text/css" href="../yui/build/fonts/fonts-min.css"/>
    <link rel="stylesheet" type="text/css" href="../yui/build/calendar/assets/skins/sam/calendar.css"/>
    <script type="text/javascript" src="../yui/build/calendar/calendar-min.js"></script>

    <style type="text/css">

        #cal1Container {
            display: none;
            position: absolute;
            font-size: 12px;
            z-index: 1
        }
        .defaultText{
            color: #666666;
            font-style:italic;
        }
    </style>

<div id="middle">
  <div id="workArea">
	<h3>添加新订阅</h3>
	
<%

    String topic = request.getParameter("topic");
    if (topic != null) {
        String eventSink = request.getParameter("eventSinkURL");
        String expirationTime = request.getParameter("expirationTime");
        
        String hours = request.getParameter("hours");
        if ((hours == null) || (hours.equals("HH"))){
            hours = "00";
        }
        String minites = request.getParameter("minites");
        if ((minites == null) || (minites.equals("mm"))){
            minites = "00";
        }
        String seconds = request.getParameter("seconds");
        if ((seconds == null) || (seconds.equals("ss"))){
            seconds = "00";
        }

        BrokerClient brokerClient = UIUtils.getBrokerClient(config, session, request);
        String message = "";
        if (topic != null && eventSink != null) {
            topic = topic.trim();


            long time = -1;
            if (expirationTime != null && expirationTime.trim().length() > 0) {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd/HH/mm/ss");
                time = dateFormat.parse(expirationTime.trim() + "/" + hours + "/" + minites + "/" + seconds).getTime();
            }

            eventSink = eventSink.trim();

            try {
                brokerClient.subscribe(topic, eventSink, time, null);

                message = "订阅主题 " + topic + " 为 " + eventSink + " 成功";
                %>
      <script type="text/javascript">CARBON.showInfoDialog('<%=message%>', function() {
          location.href = "../eventing/index.jsp"
      });</script>
      <%
            } catch (Exception e) {
                message = "订阅到主题 " + topic + " 为 " + eventSink + " 出错了";
                %>
      <script type="text/javascript">CARBON.showErrorDialog('<%=message%>', function() {
          location.href = "../eventing/index.jsp"
      });</script>
      <%
            }
        } else {
            throw new Exception("主题和事件目的地不能为空");
        }

          }
%>

<form name="input" action="" method="get" id="addSub">
    <table style="width:100%" id="userAdd" class="styledLeft">
                <thead>
                    <tr>
                        <th>指定订阅参数</th>
                    </tr>
                </thead>
                <tbody><tr>
                    <td class="formRaw">
                        <table class="normal-nopadding" style="width:100%">
                            <tbody>
                            <tr>
                                <td class="leftCol-med">主题<span class="required">*</span></td>
                                <td colspan="3"><input type="text" name="topic" class="initE" title="你需要订阅的主题。例如： foo/bar"/></td>
                            </tr>
                            <tr >
                                <td class="leftCol-med">事件目的地 URL<span class="required">*</span></td>
                                <td colspan="3"><input type="text" style="width:500px" name="eventSinkURL" class="initE" title="指向发送匹配消息的位置。例如： http://yourhost:7777/services/MessageCollector"/></td>
                            </tr>
                            <tr>
                                <td>到期时间</td>
                                <td style="width:170px;">
                                    日期:<br />
                                    <input type="text" id="expirationTime" name="expirationTime" class="initE" onclick="clearTextIn(this)" onblur="fillTextIn(this)" value="" title="此订阅的活动时间段, 如果是 -1 则永不过期"/>
                                 	<a style="cursor:pointer" onclick="showCalendar()"><img src="../admin/images/calendar.gif" border="0" align="top" /> </a>
                                    <div class="yui-skin-sam"><div id="cal1Container" style="display:none;"></div></div>
                                </td>
                                <td style="width:150px">
                                     时间:<br/>
                                     <input type="text" id="hhid" name="hours"  onFocus="handleFocus(this,'HH')" onBlur="handleBlur(this,'HH');" class="defaultText" style="width:30px;"  />
                                     <input type="text" id="mmid" name="minites"  onFocus="handleFocus(this,'mm')" onBlur="handleBlur(this,'mm');" class="defaultText" style="width:30px;"  />
                                     <input type="text" id="ssid" name="seconds" onFocus="handleFocus(this,'ss')" onBlur="handleBlur(this,'ss');" class="defaultText" style="width:30px;" />
                                </td>
                                <td>

                                </td>
                            </tr>

                        </tbody></table>
                    </td>
                </tr>
                <tr>
                    <td class="buttonRow">
                        <input type="submit" value="Subscribe" onClick="performSubscribe(document.getElementById('addSub'))"/>
                    </td>
                </tr>
            </tbody></table>
</form>	
</div>
</div>	
</fmt:bundle>