<#include "security.ftlh">
<#import "pagination.ftlh" as p>

<@p.pager url, page />

<div class="row row-cols-1 row-cols-md-4 g-3" id="message-list">

    <#list page.content as message>
        <div class="card border-danger text-bg-dark" data-id="${message.id}">
            <div class="row mt-2">
                <#if message.filename??>
                    <div class="mb-2">
                        <img src="/img/${message.filename}" class="card-img-top"/>
                    </div>
                </#if>
                <div class="mb-3">
                    <div class="mt-2">
                        <span>${message.text}</span><br/>
                    </div>
                    <div class="mt-2">
                        <i><span class="badge text-bg-info">#${message.tag}</span></i>
                    </div>
                    <#if message.getDate()??>
                        <div class="mt-2">
                            <p>
                                <font size="2 px">
                                    <time pubdate datetime>${message.getDate()}</time>
                                </font>
                            </p>
                        </div>
                    </#if>

                </div>
                <div class="card-footer text-muted container">
                    <div class="row mb-5">
                        <div class="position-absolute bottom-0 end-0 mb-2">
                            <a class="col align-self-center ms-3 text-decoration-none"
                               href="/user-messages/${message.author.id}">${message.authorName}</a>
                            <a class="col align-self-center ms-4 text-decoration-none" href="/messages/${message.id}/like" >
                                <#if message.toLiked>
                                    <span style="font-size: 1em; color: Mediumslateblue;">
                                        <i class="fas fa-thumbs-up"></i>
                                    </span>
                                <#else>
                                    <span style="font-size: 1em; color: Tomato;">
                                        <i class="far fa-thumbs-up"></i>
                                    </span>
                                </#if>
                                <span style="font-size: 1em; color: white;">${message.likes}</span>
                            </a>
                            <#if message.author.id == currentUserId>
                                <a class="col btn btn-outline-light btn-sm ms-5 mb-1"
                                   href="/user-messages/${message.author.id}?message=${message.id}">
                                    Edit
                                </a>
                                <a class="col btn btn-outline-danger btn-sm me-1 ms-1 mb-1"
                                   href="/del-user-messages/${message.author.id}?message=${message.id}">
                                    Delete
                                </a>
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <#else>
        No messages
    </#list>
</div>

<@p.pager url, page />