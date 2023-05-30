<#import "parts/general.ftlh" as g>

<@g.page>
    <link rel="stylesheet" href="/static/fonOther.css" />

    <div class="container text-center mb-4">
        <span class="badge text-bg-dark"><h5>User roles editor</h5></span>
    </div>

    <form action="/user" method="post">

        <div class="form-group row mb-3">
            <label class="col-sm-1 col-form-label"><span class="badge text-bg-secondary">User Name:</span></label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="username" value="${user.username}" />
                </div>
        </div>
        <#list roles as role>
            <div class="form-group row mb-3">
                <label class="col-sm-1 col-form-label"><span class="badge text-bg-secondary">Choose Role:</span></label>
                <div class="col-sm-6">

                    <div class="form-check form-switch mt-2">
                        <input class="form-check-input mt-1" type="checkbox"
                               name="${role}" ${user.roles?seq_contains(role)?string("checked", "")} role="switch"
                               id="flexSwitchCheckDefault" />
                        <label class="form-check-label" style="font-weight: bold" for="flexSwitchCheckDefault">${role}</label>
                    </div>

                </div>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId" />
        <input type="hidden" value="${_csrf.token}" name="_csrf" />
        <button class="btn btn-dark mt-4" type="submit">Save Changes</button>
    </form>
</@g.page>