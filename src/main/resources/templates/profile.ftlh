<#import "parts/general.ftlh" as g>

<@g.page>
    <link rel="stylesheet" href="/static/fonOther.css" />
    <h5 style="color: black"><p class="text-center" >Here you can change your profile password.</p></h5><br />

    <div class="mb-3"><span class="badge rounded-pill text-bg-secondary text-black"><h2>${username}</h2></span></div>

    ${message?ifExists}

    <form class="was-validated" method="post">

        <div class="form-group row mb-3">
            <label for="exampleInputEmail1" class="col-sm-2 col-form-label">
                <span class="badge text-bg-secondary">Email address:</span></label>
            <div class="col-sm-6">
                <input type="email" name="email" class="form-control" id="exampleInputEmail1"
                       aria-describedby="emailHelp"
                       placeholder="Please enter your correct email address to send a link to confirm password change."
                       required="" />
                <div class="invalid-feedback">
                    Please enter your email.
                </div>
            </div>
        </div>

        <div class="form-group row mb-3">
                <label for="exampleInputPassword1" class="col-sm-2 col-form-label">
                    <span class="badge text-bg-secondary">New password:</span></label>
            <div class="col-sm-6 mb-3">
                <input type="password" name="password" class="form-control" id="exampleInputPassword1"
                       placeholder="Please enter your new password." required="" />
                <div class="invalid-feedback">
                    Please enter your new password.
                </div>
            </div>
        </div>

        <input type="hidden" name="_csrf" value="${_csrf.token!}" />
        <button class="btn btn-dark mt-4" type="submit">Save changes</button>

        <div class="row" id="div1">
            <h7>After saving check your email and follow the link to confirm your new password.</h7>
        </div>

    </form>

</@g.page>

