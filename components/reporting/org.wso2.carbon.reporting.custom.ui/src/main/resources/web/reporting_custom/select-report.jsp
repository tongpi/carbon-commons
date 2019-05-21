<!--
~ Copyright (c) 2005-2010, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
~
~ WSO2 Inc. licenses this file to you under the Apache License,
~ Version 2.0 (the "License"); you may not use this file except
~ in compliance with the License.
~ You may obtain a copy of the License at
~
~ http://www.apache.org/licenses/LICENSE-2.0
~
~ Unless required by applicable law or agreed to in writing,
~ software distributed under the License is distributed on an
~ "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
~ KIND, either express or implied. See the License for the
~ specific language governing permissions and limitations
~ under the License.
-->
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://wso2.org/projects/carbon/taglibs/carbontags.jar" prefix="carbon" %>
<fmt:bundle basename="org.wso2.carbon.reporting.custom.ui.i18n.Resources">

<carbon:breadcrumb label="select.report.type"
                   resourceBundle="org.wso2.carbon.reporting.custom.ui.i18n.Resources"
                   topPage="false" request="<%=request%>"/>


<div id="middle">
<h2>选择图表类型</h2>

<div id="workArea">

    <form id="select-type" name="select-type" action="" method="POST">
        <table id="reportOptions" class="styledLeft" cellpadding="2" cellspacing="2">
            <thead>
            <tr>
                <th colspan="6"><span style="float: left; position: relative; margin-top: 2px;">
                            <fmt:message key="select.report.type"/></span>
                </th>
            </tr>
            </thead>
            <tbody>

            <%
                boolean isTemplate = true;
                try {
                    Class.forName("org.wso2.carbon.reporting.template.ui.client.ReportTemplateClient");
                } catch (ClassNotFoundException e) {
                    isTemplate = false;
                }
                if (isTemplate) {
            %>
            <tr>
                <td colspan="4"><label><a href="../reporting-template/add-table-report.jsp"><fmt:message
                        key="table.type.report"/></a></label>
                </td>
                <td valign="middle">
                    <a href="images/table.png" title="点击放大">
                        <img src="images/table.png" height="180" width="180" align="middle"/>
                    </a>
                </td>
                <td valign="middle"> 可以从首选数据源生成表报告。可以指定数据源、表的列名,
                    只需几个步骤即可格式化表设计等，并在表报告中获取数据.</td>
            </tr>

            <tr>
                <td colspan="4"><label><a
                        href="../reporting-template/add-chart-report.jsp?reportType=bar_chart_type_report"><fmt:message
                        key="bar.chart.type"/></a></label>
                </td>
                <td valign="middle">
                    <a href="images/barchart.png" title="点击放大">
                        <img src="images/barchart.png" height="180" width="180" align="middle">
                    </a>
                </td>
                <td valign="middle">  可以创建包含一个或多个序列的条形图报告。您可以通过几个步骤自定义序列数、要绘制的数据等，并获得条形图报告.</td>
            </tr>

            <tr>
                <td colspan="4"><label><a
                        href="../reporting-template/add-chart-report.jsp?reportType=xy_bar_chart_type_report"><fmt:message
                        key="xy.bar.chart.report"/></a></label>
                </td>
                <td valign="middle">
                    <a href="images/xy_barchart.png" title="点击放大">
                        <img src="images/xy_barchart.png" height="180" width="180" align="middle">
                    </a>
                </td>
                <td valign="middle"> 可以创建包含一个或多个序列的xy条形图报告。您可以通过几个步骤自定义序列数、要绘制的数据等，并获得xy条形图报告。图表绘图要求X和Y轴都在数字字段中.</td>
            </tr>

            <tr>
                <td colspan="4">
                    <label><a
                            href="../reporting-template/add-chart-report.jsp?reportType=stacked_bar_chart_type_report"><fmt:message
                            key="stacked.bar.chart.type"/></a></label>
                </td>
                <td valign="middle">
                    <a href="images/stacked_bar_chart.png" title="点击放大">
                        <img src="images/stacked_bar_chart.png" height="180" width="180" align="middle">
                    </a>
                </td>
                <td valign="middle">可以创建包含一个或多个序列的堆积条形图报表。顾名思义，该系列将堆叠在系列顶部。您可以通过选择系列并通过几个步骤定义自己的格式来设计报表.</td>
            </tr>


            <tr>
                <td colspan="4"><label><a
                        href="../reporting-template/add-chart-report.jsp?reportType=line_chart_type_report"><fmt:message
                        key="line.chart.type"/></a></label>
                </td>
                <td valign="middle">
                    <a href="images/line_chart.png" title="点击放大">
                        <img src="images/line_chart.png" height="180" width="180" align="middle">
                    </a>

                </td>
                   <td valign="middle">可以创建包含一个或多个系列的折线图报表。您可以通过几个步骤自定义序列数、要绘制的数据等，并获得折线图报告.</td>
            </tr>

            <tr>
                <td colspan="4"><label><a
                        href="../reporting-template/add-chart-report.jsp?reportType=xy_line_chart_type_report"><fmt:message
                        key="xy.line.chart.report"/></a></label>
                </td>
                <td valign="middle">
                    <a href="images/xy_line_chart.png" title="点击放大">
                        <img src="images/xy_line_chart.png" height="180" width="180" align="middle">
                    </a>
                </td>
                <td valign="middle">
                    可以创建包含一个或多个系列的xy折线图报告。您可以通过几个步骤自定义序列数、要绘制的数据等，并获得xy折线图报告。图表绘图要求X和Y轴都在数字字段中.
                </td>
            </tr>

            <tr>
                <td colspan="4"><label><a
                        href="../reporting-template/add-chart-report.jsp?reportType=area_chart_type_report"><fmt:message
                        key="area.chart.type"/></a></label>
                </td>
                <td valign="middle">
                    <a href="images/areachart.png" title="点击放大">
                        <img src="images/areachart.png" height="180" width="180" align="middle">
                    </a>
                </td>
                <td valign="middle">
                    可以创建包含一个或多个系列的面积图报告。您可以通过几个步骤自定义序列数、要绘制的数据等，并获得面积图报告.
                </td>
            </tr>


            <tr>
                <td colspan="4"><label><a
                        href="../reporting-template/add-chart-report.jsp?reportType=xy_area_chart_type_report"><fmt:message
                        key="xy.area.chart.report"/></a></label>
                </td>
                <td valign="middle">
                    <a href="images/xy_area_chart.png" title="点击放大">
                        <img src="images/xy_area_chart.png" height="180" width="180" align="middle">
                    </a>
                </td>
                <td valign="middle">
                    可以创建包含一个或多个系列的xy面积图报告。您可以通过几个步骤自定义序列数、要绘制的数据等，并获得xy面积图报告。图表绘图要求X和Y轴都在数字字段中.
                </td>
            </tr>

            <tr>
                <td colspan="4">
                    <label><a
                            href="../reporting-template/add-chart-report.jsp?reportType=stacked_area_chart_type_report"><fmt:message
                            key="stacked.area.chart.type"/></a></label>
                </td>
                <td valign="middle">

                    <a href="images/stacked_area_chart.png" title="点击放大">
                        <img src="images/stacked_area_chart.png" height="180" width="180" align="middle">
                    </a>
                 </td>
                <td valign="middle">
                     可以创建包含一个或多个系列的堆积面积图报表。顾名思义，该系列将堆叠在系列顶部。您可以通过选择系列并通过几个步骤定义自己的格式来设计报表.
                </td>
            </tr>


            <tr>
                <td colspan="4"><label><a
                        href="../reporting-template/add-chart-report.jsp?reportType=pie_chart_type_report"><fmt:message
                        key="pie.chart.type"/></a></label>
                </td>
                <td valign="middle">
                    <a href="images/pie-chart.png" title="点击放大">
                        <img src="images/pie-chart.png" height="180" width="180" align="middle">
                    </a>
                </td>
                <td valign="middle">
                      可以从数据中生成的饼图报表。您可以通过几个步骤为报表提供更多格式详细信息来设计报表.
                </td>
            </tr>

            <tr>
                <td colspan="4"><label><a href="../reporting-template/add-composite-report.jsp"><fmt:message
                        key="composite.report"/></a></label>
                </td>
                <td valign="middle">

                    <a href="images/composite.png" title="点击放大">
                        <img src="images/composite.png" height="180" width="180" align="middle">
                    </a>
                </td>
                <td valign="middle">
                    您可以从主报表中获取您所定义的所选报表的组成，并生成所述报表格式的组合.
                </td>
            </tr>

            <%
                }
            %>
            <tr>
                <td colspan="4" width="180px"><label><a href="upload-jrxml.jsp"><fmt:message
                        key="custom.report"/></a></label>
                </td>
                <td valign="middle">
                    <a href="images/custom.jpeg" title="点击放大">
                        <img src="images/custom.jpeg" height="180" width="180" border="1px" align="middle">
                    </a>
                </td>
                <td valign="middle">
                     您可以定义自己的.jrxml文件并上载该文件以生成报告.
                </td>
            </tr>

            </tbody>
        </table>

    </form>
</div>
</div>
<script type="text/javascript">
    alternateTableRows('reportOptions', 'tableEvenRow', 'tableOddRow');
</script>

</fmt:bundle>