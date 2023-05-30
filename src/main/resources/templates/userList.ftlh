<#import "parts/general.ftlh" as g>

<@g.page>
    <link rel="stylesheet" href="/static/fonOther.css" />
    <div class="container text-center mb-2">
        <span class="badge text-bg-light">List of users</span>
    </div>

    <table class="table table-dark table-sm">
        <thead>
            <tr>
                <th scope="col">User_id</th>
                <th scope="col">Name</th>
                <th scope="col">Role</th>
                <th scope="col">Link to Edit</th>
            </tr>
        </thead>
        <tbody>
            <#list users as user>
                <tr>
                    <th scope="row">${user.id}</th>
                    <td>${user.username}</td>
                    <td><#list user.roles as role>${role}<#sep>, </#list></td>
                    <td><a href="/user/${user.id}">edit</a></td>
                </tr>
            </#list>
        </tbody>
    </table>

</@g.page>