<p xmlns="http://www.w3.org/1999/html">
    <div class="d-grid gap-2 col-6 mx-auto">
        <button class="btn btn-dark btn-lg" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWidthExample"
            aria-expanded="false" aria-controls="collapseWidthExample">
            Create New Message
        </button>
    </div>
</p>


<div style="min-height: 5px;" data-bs-theme="dark">
    <div class="collapse collapse-horizontal <#if message??>show</#if>" id="collapseWidthExample">
        <div class="card card-body" style="width: 1300px;">
            <form method="post" enctype="multipart/form-data">
                <div class="input-group was-validated mb-4 mt-4">
                    <span class="input-group-text" id="basic-addon1">Input text</span>
                    <textarea class="form-control ${(textError??)?string('is-invalid', '')}" aria-label="With textarea"
                           value="<#if message??>${message.text}</#if>" name="text"
                           placeholder="Be sure to enter the text of the message."
                           aria-describedby="basic-addon1" required="" ></textarea>
                    <#if textError??>
                        <div class="invalid-feedback">
                            ${textError}
                        </div>
                    </#if>
                </div>

                <div class="input-group was-validated mb-3 mt-5">
                    <span class="input-group-text" id="basic-addon2">Input tag</span>
                    <input type="text" class="form-control"
                           value="<#if message??>${message.tag}</#if>" name="tag"
                           placeholder="Be sure to enter the tag of the message."
                           aria-describedby="basic-addon2" required="" />
                    <#if textError??>
                        <div class="invalid-feedback">
                            ${tagError}
                        </div>
                    </#if>
                </div>

                <div class="input-group mb-3 mt-5" >
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
