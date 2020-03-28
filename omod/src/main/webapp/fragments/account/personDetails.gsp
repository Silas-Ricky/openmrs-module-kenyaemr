<%
	def countyName = []
	countyList.each {
		countyName.add([label: it, value: it])
	}
%>

<div class="ke-panel-frame">
	<div class="ke-panel-heading">Personal Details</div>
	<div class="ke-panel-content">
		${ ui.includeFragment("kenyaui", "widget/dataPoint", [ label: "Real name", value: kenyaui.formatPersonName(person) ]) }
		${ ui.includeFragment("kenyaui", "widget/dataPoint", [ label: "Gender", value: kenyaui.formatPersonGender(person) ]) }
		${ ui.includeFragment("kenyaui", "widget/dataPoint", [ label: "Telephone", value: ui.format(form.telephoneContact) ]) }
		${ ui.includeFragment("kenyaui", "widget/dataPoint", [ label: "Email", value: ui.format(form.emailAddress) ]) }
		${ ui.includeFragment("kenyaui", "widget/dataPoint", [ label: "County", value: ui.format(form.countyName) ]) }
	</div>
	<div class="ke-panel-footer">
		${ ui.includeFragment("kenyaui", "widget/dialogForm", [
				id: "person-details-form",
				buttonConfig: [
						label: "Edit",
						iconProvider: "kenyaui",
						icon: "glyphs/edit.png"
				],
				dialogConfig: [ heading: "Edit personal details" ],
				fragment: "account/personDetails",
				fragmentProvider: "kenyaemr",
				action: "submit",
				prefix: "person",
				commandObject: form,
				hiddenProperties: [ "personId" ],
				properties: [ "personName.givenName", "personName.familyName", "gender", "telephoneContact", "emailAddress", "countyName" ],
				propConfig: [
						"gender": [
								options: [
										[ label: "Female", value: "F" ],
										[ label: "Male", value: "M" ]
								]
						],
						"countyName": [
								options: countyName
						]
				],
				submitLabel: "Save Changes",
				cancelLabel: "Cancel",
				onSuccessCallback: "ui.reloadPage();"
		]) }
	</div>
</div>