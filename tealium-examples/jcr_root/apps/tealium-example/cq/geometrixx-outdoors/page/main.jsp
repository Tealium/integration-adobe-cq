<%@ include file="/libs/foundation/global.jsp" %><%
%><%@ page contentType="text/html; charset=utf-8" %>
<div class="page-header">
    <cq:include script="header.jsp"/>
</div>
<div class="page-content">

    <!-- Content for response from Tealium -->
    <cq:include path="content-component" resourceType="/apps/tealium-example/content-component"/>
    
    <cq:include path="breadcrumb" resourceType="geometrixx-outdoors/components/page/breadcrumb"/>
    <cq:include path="par" resourceType="foundation/components/parsys"/>
</div>
<div class="page-footer">
    <cq:include script="footer.jsp"/>
</div>

<!-- Tealium plugin component -->
<cq:include path="tealium-plugin" resourceType="/apps/tealium-plugin/components/tealium-plugin"/>