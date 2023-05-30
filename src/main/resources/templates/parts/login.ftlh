<#include "security.ftlh">

<#macro login path isRegisterForm>
    <link rel="stylesheet" href="/static/fonOther.css" />

    <form class="was-validated" action="${path}" method="post">

        <div class="form-group row mb-3">
            <label class="col-sm-2 col-form-label"><span class="badge text-bg-secondary">User Name:</span></label>
            <div class="col-sm-6">
                <input name="username" value="<#if user??>${user.username}</#if>"
                       class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       placeholder="Input your user name" required="" />
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
                <div class="invalid-feedback">
                    Please enter your username.
                </div>
            </div>
        </div>

        <div class="form-group row mb-3">
            <label class="col-sm-2 col-from-label"><span class="badge text-bg-secondary">Password:</span></label>
            <div class="col-sm-6">
                <input type="password" name="password"
                       class="form-control ${(passwordError??)?string('is-invalid', '')}"
                       placeholder="Input your password" required="" />
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
                <div class="invalid-feedback">
                    Please enter your password.
                </div>
            </div>
        </div>

        <#if isRegisterForm>
            <div class="form-group row mb-3">
                <label class="col-sm-2 col-from-label"><span
                            class="badge text-bg-secondary">Retype Password:</span></label>
                <div class="col-sm-6">
                    <input type="password" name="passwordRepeat"
                           class="form-control ${(password2Error??)?string('is-invalid', '')}"
                           placeholder="Retype password" required="" />
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                    <div class="invalid-feedback">
                        Please enter retype your password.
                    </div>
                </div>
            </div>
            <div class="form-group row mb-3">
                <label class="col-sm-2 col-from-label"><span class="badge text-bg-secondary">Email:</span></label>
                <div class="col-sm-6">
                    <input type="email" name="email" value="<#if user??>${user.email}</#if>"
                           class="form-control ${(emailError??)?string('is-invalid', '')}"
                           placeholder="some@some.com" required="" />
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                    <div class="invalid-feedback">
                        Please enter your email.
                    </div>
                </div>
            </div>

            <div class="col-sm-6">
                <div class="g-recaptcha" data-sitekey="6Lc7segkAAAAAGyE9OOfxqz5vBMzKK1uXX3N7UtL"></div>
                <#if captchaError??>
                    <div class="alert alert-danger" role="alert">
                        ${captchaError}
                    </div>
                </#if>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token!}" />
        <button class="btn btn-dark my-2 mt-3" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
        <#if !isRegisterForm>
            <h4>or</h4>
        </#if>
        <div>
            <#if !isRegisterForm>
                <a class="btn btn-light text-dark mt-2" href="/registration">Registration</a>
            </#if>
        </div>

    </form>
</#macro>

