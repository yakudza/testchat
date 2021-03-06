<#import "parts/common.ftl" as common>

<@common.page>
    <div class="container mt-5">
        ${message?ifExists}
            <h5>${username}</h5>
            <form method="post" xmlns="http://www.w3.org/1999/html">

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label"> E-mail: </label>
                    <div class="col-sm-6">
                        <input type="email" name="email" placeholder="some@some.com" class="form-control" value="${email!''}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label"> Password: </label>
                    <div class="col-sm-6">
                        <input type="password" name="password" class="form-control"/>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button type="submit" class="btn btn-primary"/>Save</button>
            </form>
    </div>
</@common.page>