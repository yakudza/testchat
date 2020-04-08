<#import "parts/common.ftl" as common>
<#import "parts/login.ftl" as login>

<@common.page>
    <div class="container mt-5">
        <div class="mr-1">Registration page</div>

            ${message?ifExists}

        <@login.login "/registration" true />
    </div>
</@common.page>