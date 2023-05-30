<div style="min-height: 5px;" data-bs-theme="dark">
    <div class="collapse collapse-horizontal <#if message??>show</#if>" id="collapseWidthExample">
        <div class="card card-body mt-2" style="width: 1300px;">
            <form method="post" enctype="multipart/form-data">
                <div class="input-group was-validated mb-3">
                    <span class="input-group-text" id="basic-addon1">Input text</span>
                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                           value="<#if message??>${message.text}</#if>" name="text" placeholder="Input message"
                           aria-describedby="basic-addon1" required="" />
                    <#if textError??>
                        <div class="invalid-feedback">
                            ${textError}
                        </div>
                    </#if>
                </div>
                <div class="input-group was-validated mb-3">
                    <span class="input-group-text" id="basic-addon2">Input tag</span>
                    <input type="text" class="form-control"
                           value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Tag"
                           aria-describedby="basic-addon2" required="" />
                    <#if textError??>
                        <div class="invalid-feedback">
                            ${tagError}
                        </div>
                    </#if>
                </div>
                <div class="input-group mb-3">
                    <input type="file" name="file" class="form-control" id="inputGroupFile04"
                           aria-describedby="inputGroupFileAddon04" aria-label="Upload" />
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <input type="hidden" name="id" value="<#if message??>${message.id}</#if>" />
                    <button type="submit" class="btn btn-outline-danger">Save message</button>
                </div>
            </form>

        </div>
    </div>
</div>
