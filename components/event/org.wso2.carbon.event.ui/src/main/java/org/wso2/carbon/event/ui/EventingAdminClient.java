package org.wso2.carbon.event.ui;

import org.apache.axis2.AxisFault;
import org.apache.axis2.client.Options;
import org.apache.axis2.client.ServiceClient;
import org.apache.axis2.context.ConfigurationContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.wso2.carbon.event.stub.service.EventingAdminServiceStub;
import org.wso2.carbon.event.stub.service.dto.SubscriptionDTO;

@Deprecated
public class EventingAdminClient {

	private static final Log log = LogFactory.getLog(EventingAdminClient.class);

	private org.wso2.carbon.event.stub.service.EventingAdminServiceStub stub;

	/**
	 * 
	 * @param cookie
	 * @param backendServerURL
	 * @param configCtx
	 * @throws AxisFault
	 */
	public EventingAdminClient(String cookie, String backendServerURL,
			ConfigurationContext configCtx) throws AxisFault {
		String serviceURL = backendServerURL + "EventingAdminService";
		stub = new EventingAdminServiceStub(configCtx, serviceURL);
		ServiceClient client = stub._getServiceClient();
		Options option = client.getOptions();
		option.setManageSession(true);
		option.setProperty(org.apache.axis2.transport.http.HTTPConstants.COOKIE_STRING, cookie);
	}

	/**
	 * 
	 * @param serviceName
	 * @return
	 * @throws AxisFault
	 */
	public String[] getValidSubscriptions(String serviceName) throws AxisFault {
		try {
			if (serviceName == null) {
				return null;
			}
			return stub.getValidSubscriptions(serviceName);
		} catch (Exception e) {
			String msg = "无法获取的有效订阅: " + serviceName;
			handleException(msg, e);
		}

		return null;
	}

	/**
	 * 
	 * @param serviceName
	 * @return
	 * @throws AxisFault
	 */
	public String[] getExpiredSubscriptions(String serviceName) throws AxisFault {
		try {
			if (serviceName == null) {
				return null;
			}
			return stub.getExpiredSubscriptions(serviceName);
		} catch (Exception e) {
			String msg = "无法获取的过期订阅:" + serviceName;
			handleException(msg, e);
		}

		return null;
	}

	/**
	 * 
	 * @param serviceName
	 * @param subscriptionId
	 * @return
	 * @throws AxisFault
	 */
	public SubscriptionDTO getSubscriptionDetails(String serviceName, String subscriptionId)
			throws AxisFault {
		try {
			if (serviceName == null || subscriptionId == null) {
				return null;
			}
			return stub.getSubscriptionDetails(serviceName, subscriptionId);
		} catch (Exception e) {
			String msg = "无法获取的详细信息订阅: " + serviceName;
			handleException(msg, e);
		}

		return null;
	}

	private void handleException(String msg, Exception e) throws AxisFault {
		log.error(msg, e);
		throw new AxisFault(msg, e);
	}
}
