<#include "security.ftlh">
<#import "login.ftlh" as l>
<#import "logout.ftlh" as e>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand ms-3"><h1>MIRA</h1></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-3">

            <li class="nav-item">
                <p class="fs-3">
                    <a class="nav-link ms-3" href="/"><i class="fa-solid fa-house-chimney"></i></a>
                </p>
            </li>

            <#if user??>
                <li class="nav-item">
                    <p class="fs-3">
                        <a class="nav-link ms-3" href="/main"><i class="fa-solid fa-people-group"></i></a>
                    </p>
                </li>
                <li class="nav-item">
                    <p class="fs-3">
                        <a class="nav-link ms-3" href="/user-messages/${currentUserId}"><i class="fa-solid fa-child"></i></a>
                    </p>
                </li>

                <li class="nav-item">
                    <p class="fs-3">
                        <a class="nav-link ms-3" href="/newMessage"><i class="fa-regular fa-pen-to-square"></i></a>
                    </p>
                </li>

                <li class="nav-item">
                    <p class="fs-3">
                        <a class="nav-link ms-3" href="/user/profile"><i class="fa-solid fa-address-card"></i></a>
                    </p>
                </li>
            </#if>

            <#if isAdmin>
                <li class="nav-item">
                    <p class="fs-3">
                        <a class="nav-link ms-3" href="/user"><i class="fa-solid fa-elevator"></i></a>
                    </p>
                </li>
            </#if>
        </ul>

        <div class="navbar-text ms-auto me-4">
            <body>
                <input class="btn btn-outline-light me-5" type="button" value="DateAndTime" onclick="alert(new Date())" />
            </body>

            <#if user??><i class="fa-solid fa-user"> ${name}</i>
            <#else><i class="fa-regular fa-user"></i><i class="fa-solid fa-question"></i>
            </#if>
        </div>

        <@e.logout />

    </div>
</nav>