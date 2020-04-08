<#macro login path isRegisterForm>
<form action="${path}" method="post" xmlns="http://www.w3.org/1999/html">

    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> User Name: </label>
        <div class="col-sm-6">
            <input type="text" name="username" value="<#if user??>${user.username}</#if>" placeholder="username"
                   class="form-control ${(usernameError??)?string('is-invalid', '')}"/>
            <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
            </#if>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-sm-2 col-form-label"> Password: </label>
        <div class="col-sm-6">
            <input type="password" name="password" placeholder="password"
                   class="form-control ${(passwordError??)?string('is-invalid', '')}"/>
             <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
             </#if>
        </div>
    </div>
    <#if isRegisterForm>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Repeat password: </label>
            <div class="col-sm-6">
                <input type="password" name="passwordConfirm" placeholder="password"
                       class="form-control ${(passwordConfirmError??)?string('is-invalid', '')}"/>
         <#if passwordConfirmError??>
                <div class="invalid-feedback">
                    ${passwordConfirmError}
                </div>
         </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> E-mail: </label>
            <div class="col-sm-6">
                <input type="email" name="email" placeholder="some@some.com" value="<#if user??>${user.email}</#if>"
                       class="form-control ${(emailError??)?string('is-invalid', '')}"/>
                <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                </#if>
            </div>
        </div>
    </#if>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary"/><#if isRegisterForm>Create<#else>Sign In</#if></button>
        <#if !isRegisterForm>
            <br><a href="/registration">Registration</a></#if>
</form>
</#macro>

<#macro logout>
        <form action="/sigout" method="get">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit" class="btn btn-primary"/>Sign Out</button>
        </form>
</#macro>