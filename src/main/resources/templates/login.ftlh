<#import "parts/general.ftlh" as g>
<#import "parts/login.ftlh" as l>

<@g.page>
    <h3 style="color: black"><p class="text-center" >Please enter your login and password or register</p></h3><br /><br />

    <link rel="stylesheet" href="/static/fonOther.css" />

    <#if Session?? &amp;&amp; Session.SPRING_SECURITY_LAST_EXCEPTION??>
        <div class="alert alert-danger" role="alert">
            ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
        </div>
    </#if>
    <#if message??>
        <div class="alert alert-${messageType}" role="alert">
            ${message}
        </div>
    </#if>
    <@l.login "/login" false/>
</@g.page>