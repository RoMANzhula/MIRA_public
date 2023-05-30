<#include "security.ftlh">

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token!}" />
        <button class="btn btn-outline-light me-2" type="submit"><#if user??>Sign Out<#else>Log In</#if></button>
    </form>
</#macro>