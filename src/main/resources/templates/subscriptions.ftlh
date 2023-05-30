<#import "parts/general.ftlh" as g>

<@g.page>
    <link rel="stylesheet" href="/static/fonOther.css" />
    <div class="container text-center">
        <h2>
            <span class="badge rounded-pill text-bg-secondary text-black mb-2">${userMessageOwner.username}</span>
        </h2>
    </div>

    <div>
        <h5>
            <span class="badge text-bg-secondary mb-2">${type}</span>
        </h5>
    </div>

    <ul class="list-group">
        <#list users as user>
            <li>
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-6">
                    <div class="col">
                        <span class="badge rounded-pill text-bg-dark">
                            <a href="/user-messages/${user.id}">${user.getUsername()}</a>
                        </span>
                    </div>
                </div>
            </li>
        </#list>
    </ul>
</@g.page>