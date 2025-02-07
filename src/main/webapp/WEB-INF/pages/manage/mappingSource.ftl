<#escape x as x?html>
<#include "/WEB-INF/pages/inc/header.ftl">
<title><@s.text name='manage.mapping.title'/></title>
<#assign currentMenu = "manage"/>
<#include "/WEB-INF/pages/inc/menu.ftl">
<#include "/WEB-INF/pages/macros/forms.ftl"/>
<script>
    $(document).ready(function(){
        $("#save").on("click", displayProcessing);
    });
</script>

<div class="container-fluid bg-body border-bottom">
    <div class="container my-3">
        <#include "/WEB-INF/pages/inc/action_alerts.ftl">
    </div>

    <div class="container my-3 p-3">
        <div class="text-center text-uppercase fw-bold fs-smaller-2">
            <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="${baseURL}/manage/"><@s.text name="breadcrumb.manage"/></a></li>
                    <li class="breadcrumb-item"><a href="resource?r=${resource.shortname}"><@s.text name="breadcrumb.manage.overview"/></a></li>
                    <li class="breadcrumb-item active" aria-current="page"><@s.text name="breadcrumb.manage.overview.mapping"/></li>
                </ol>
            </nav>
        </div>

        <div class="text-center">
            <h1 class="pb-2 mb-0 pt-2 text-gbif-header fs-2 fw-normal">
                <@s.text name="manage.mapping.title"/>
            </h1>

            <div class="text-center fs-smaller">
                <a href="resource.do?r=${resource.shortname}" title="${resource.title!resource.shortname}">${resource.title!resource.shortname}</a>
            </div>

            <div class="my-2">
                <@s.submit form="mapping" cssClass="button btn btn-sm btn-outline-gbif-primary top-button" name="save" key="button.save"/>
                <@s.submit form="mapping" cssClass="button btn btn-sm btn-outline-secondary top-button" name="cancel" key="button.cancel"/>
            </div>
        </div>
    </div>
</div>

<main class="container">
    <form id="mapping" class="topForm" action="mapping.do" method="post">
        <input type="hidden" name="r" value="${resource.shortname}" />
        <input type="hidden" name="id" value="${mapping.extension.rowType}" />
        <input type="hidden" name="mid" value="${mid!}" />
        <input id="showAllValue" type="hidden" name="showAll" value="${Parameters.showAll!"true"}" />

        <div class="my-3 p-3 text-center">
            <p class="fst-italic">${mapping.extension.description}</p>

            <#if mapping.extension.link?has_content>
                <p><@s.text name="basic.link"/>: <a href="${mapping.extension.link}">${mapping.extension.link}</a></p>
            </#if>

            <p><@s.text name='manage.mapping.source.help'/></p>

            <div class="container" style="max-width: 600px;">
                <div class="row">
                    <div class="col-sm-12">
                        <@selectList name="source" options=resource.sources objValue="name" objTitle="name" i18nkey="manage.mapping.source" withLabel=false />
                    </div>
                </div>
            </div>
        </div>
    </form>
</main>

    <#include "/WEB-INF/pages/inc/footer.ftl">
</#escape>
