<#import "parts/common.ftl"  as common>
<@common.page>

    <div class="container-fluid">
        <div class="row">
      <nav class="col-md-2 d-none d-md-block bg-light sidebar">
          User online:
          <ul>
          <#list users as user>
              <#if user.online>
              <p class="onlineUser">${user.username}</p>
              </#if>
          </#list>
          </ul>
          User offline:
          <ul>
              <#list users as user>
                  <#if !user.online>
                      <p class="offlineUser">${user.username}</p>
                  </#if>
              </#list>
          </ul>
      </nav>
        <main class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4" role="main">
                <textarea class="form-control" id="textarea" rows="28" readonly="readonly">
                <#list messages as message>
 ${message.authorName} ${message.createdDate} :
                ${message.text}
                <#else >
                    No message
                </#list>
                </textarea>

                    <form  id="messageForm" method="post" action="/main" enctype="multipart/form-data">
                        <div class="form-group">
                            <input type="text" name="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                                   value="<#if message??>${message.text}</#if>" placeholder="Введите сообщение" />
                            <#if textError??>
                                <div class="invalid-feedback">
                                    ${textError}
                                </div>
                            </#if>
                        </div>
                       <input type="hidden" name="_csrf" value="${_csrf.token}" />
                        <button type="submit" class="btn btn-primary">Send</button>
                    </form>
        </main>
        </div>
    </div>

</@common.page>