<#import "parts/general.ftlh" as g>

<@g.page>

    <link rel="stylesheet" href="/static/fonEditMessage.css" />

    <div class="container text-center"><span
                class="badge rounded-pill text-bg-secondary text-black mb-2"><h2>${userMessageOwner.username}</h2></span></div>

    <#if !isCurrentUser>
        <#if isSubscriber>
            <div class="container text-center mb-2">
                <a class="btn btn-dark text-danger" href="/user/unsubscribe/${userMessageOwner.id}">Unsubscribe</a>
            </div>
        <#else>
            <div class="container text-center mb-2">
                <a class="btn btn-dark text-info" href="/user/subscribe/${userMessageOwner.id}">Subscribe</a>
            </div>
        </#if>
    </#if>

    <div class="container text-center my-auto" data-bs-theme="dark">
        <div class="row justify-content-center">
            <div class="col-2">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title text-light">Subscriptions</div>
                        <h3 class="card-text">
                            <a href="/user/subscriptions/${userMessageOwner.id}/list">${subscriptionsCount}</a>
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col-2">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title text-light">Subscribers</div>
                        <h3 class="card-text">
                            <a href="/user/subscribers/${userMessageOwner.id}/list">${subscribersCount}</a>
                        </h3>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <link rel="stylesheet" href="/static/fonOther.css" />

    <#if isCurrentUser>
        <#include "parts/messageEdit.ftlh" />
    </#if>

    <#include "parts/messageList.ftlh" />
</@g.page>