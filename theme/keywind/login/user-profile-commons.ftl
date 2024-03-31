<#macro userProfileFormFields>
	<#assign currentGroup="">
	
	<#list profile.attributes as attribute>

		<#assign group = (attribute.group)!"">
		<#if group != currentGroup>
			<#assign currentGroup=group>
			<#if currentGroup != "">
				<div>
					<#assign groupDisplayHeader=group.displayHeader!"">
					<#if groupDisplayHeader != "">
						<#assign groupHeaderText=advancedMsg(groupDisplayHeader)!group>
					<#else>
						<#assign groupHeaderText=group.name!"">
					</#if>

					<div>
						
						<div class="relative flex items-center">
							<div id="header-${attribute.group.name}" class="flex-shrink mr-4">${groupHeaderText}</div>
							<div class="flex-grow border-t border-gray-300"></div>
						</div>
					
						<#assign groupDisplayDescription=group.displayDescription!"">
						<#if groupDisplayDescription != "">
							<#assign groupDescriptionText=advancedMsg(groupDisplayDescription)!"">
							<div id="description-${group.name}" class="text-sm text-gray-700">${groupDescriptionText}</div>
						</#if>
					</div>
				</div>
			</#if>
		</#if>


		<#nested "beforeField" attribute>
		<div>
			<div class="px-4 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
				<dt class="text-sm font-medium leading-6">${advancedMsg(attribute.displayName!'')}</dt>
				<dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">
					<#if attribute.multivalued && attribute.values?has_content>
						<span>${attribute.values?join(", ", "-")}</span>
					<#else>
						<span>${advancedMsg(attribute.value!'-')}</span>
					</#if>
				</dd>
			</div>

			<#if attribute.multivalued && attribute.values?has_content>
				<#list attribute.values as value>
					<input type="hidden" id="${attribute.name}" name="${attribute.name}[]" value="${(value!'')}" />
				</#list>
			<#else>
				<input type="hidden" id="${attribute.name}" name="${attribute.name}" value="${(attribute.value!'')}" />
			</#if>

		</div>
		<#nested "afterField" attribute>

	</#list>
</#macro>
