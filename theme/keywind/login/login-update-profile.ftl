<#import "template.ftl" as layout>
<#import "user-profile-commons.ftl" as userProfileCommons>
<#import "components/atoms/button.ftl" as button>
<#import "components/atoms/button-group.ftl" as buttonGroup>
<#import "components/atoms/form.ftl" as form>
<#import "components/atoms/input.ftl" as input>

<@layout.registrationLayout displayMessage=false width="max-w-xl"; section>
  <#if section="header">
    ${msg("loginProfileTitle")}
  <#elseif section="form">
    <@form.kw action=url.loginAction method="post">

      <@userProfileCommons.userProfileFormFields/>

      <@buttonGroup.kw>
        <@button.kw color="secondary" component="a" href=msg("doEmailUpdateProfileLink")>
          ${msg("doEmailUpdateProfile")}
        </@button.kw>
        <#if isAppInitiatedAction??>
          <@button.kw color="primary" type="submit">
            ${msg("doSubmitUpdateProfile")}
          </@button.kw>
          <@button.kw color="secondary" name="cancel-aia" type="submit" value="true">
            ${msg("doCancel")}
          </@button.kw>
        <#else>
          <@button.kw color="primary" type="submit">
            ${msg("doSubmitUpdateProfile")}
          </@button.kw>
        </#if>
      </@buttonGroup.kw>
    </@form.kw>
  </#if>
</@layout.registrationLayout>
