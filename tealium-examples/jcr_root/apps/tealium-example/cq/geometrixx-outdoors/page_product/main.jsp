<%@ include file="/libs/foundation/global.jsp" %><%
%><%@ page contentType="text/html; charset=utf-8" %>
<div class="page-content">

    <c:set var="currency" value="USD" scope="request" />

    <!-- Content for response from Tealium -->
    <cq:include path="content-component" resourceType="/apps/tealium-example/content-component"/>

    <!-- Component with asynchronous requeste for price information -->
    <cq:include path="price-caller" resourceType="/apps/tealium-example/cq/components/price-caller"/>

    <cq:include path="breadcrumb" resourceType="geometrixx-outdoors/components/page/breadcrumb"/>
    <cq:include path="par" resourceType="foundation/components/parsys"/>
</div>
<div class="page-footer">
    <cq:include script="footer.jsp"/>
</div>

<!-- Tealium asynchronous JS plugin component -->
<cq:include path="tealium-async-js-plugin" resourceType="/apps/tealium-plugin/components/tealium-async-js-plugin"/>

<!-- Component which enabling TealiumAsyncJsManager processing -->
<cq:include path="async-plugin-launcher" resourceType="/apps/tealium-example/cq/components/async-plugin-launcher"/>