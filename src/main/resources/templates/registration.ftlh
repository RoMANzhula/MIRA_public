<#import "parts/general.ftlh" as g>
<#import "parts/login.ftlh" as l>

<@g.page>
    <div class="mb-1">Add new user</div>
    ${message?ifExists}

    <@l.login "/registration" true />
</@g.page>
