package org.openmrs.module.kenyaemr.reporting.cohort.definition.evaluator.pmtct.anc;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.openmrs.Cohort;
import org.openmrs.annotation.Handler;
import org.openmrs.api.context.Context;
import org.openmrs.module.kenyaemr.reporting.EmrReportingUtils;
import org.openmrs.module.kenyaemr.reporting.cohort.definition.ANCRegisterCohortDefinition;
import org.openmrs.module.kenyaemr.reporting.cohort.definition.pmtct.anc.AdolescentsStartedHaart_10_19_AtANCCohortDefinition;
import org.openmrs.module.kenyaemr.reporting.cohort.definition.pmtct.anc.AdolescentsTestedPositive_10_19_AtANCCohortDefinition;
import org.openmrs.module.kenyaemr.reporting.library.ETLReports.MOH731Greencard.ETLMoh731GreenCardCohortLibrary;
import org.openmrs.module.reporting.cohort.EvaluatedCohort;
import org.openmrs.module.reporting.cohort.definition.CohortDefinition;
import org.openmrs.module.reporting.cohort.definition.SqlCohortDefinition;
import org.openmrs.module.reporting.cohort.definition.evaluator.CohortDefinitionEvaluator;
import org.openmrs.module.reporting.cohort.definition.service.CohortDefinitionService;
import org.openmrs.module.reporting.common.ObjectUtil;
import org.openmrs.module.reporting.evaluation.EvaluationContext;
import org.openmrs.module.reporting.evaluation.EvaluationException;
import org.openmrs.module.reporting.evaluation.querybuilder.SqlQueryBuilder;
import org.openmrs.module.reporting.evaluation.service.EvaluationService;
import org.openmrs.module.reporting.query.encounter.EncounterQueryResult;
import org.openmrs.module.reporting.query.encounter.definition.EncounterQuery;
import org.openmrs.module.reporting.query.encounter.evaluator.EncounterQueryEvaluator;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Evaluator for patients who are adolescents and started haart  in ANC
 */
@Handler(supports = {AdolescentsStartedHaart_10_19_AtANCCohortDefinition.class})
public class AdolescentsStartedHaart_10_19AtANCCohortDefinitionEvaluator implements CohortDefinitionEvaluator {

	private final Log log = LogFactory.getLog(this.getClass());
	@Autowired
	private ETLMoh731GreenCardCohortLibrary moh731GreencardCohorts;

	@Override
	public EvaluatedCohort evaluate(CohortDefinition cohortDefinition, EvaluationContext context) throws EvaluationException {

		AdolescentsStartedHaart_10_19_AtANCCohortDefinition definition = (AdolescentsStartedHaart_10_19_AtANCCohortDefinition) cohortDefinition;
		String qry = "select\n" +
				"  distinct v.patient_id\n" +
				"from kenyaemr_etl.etl_mch_antenatal_visit v\n" +
				"  inner join kenyaemr_etl.etl_drug_event d on d.patient_id=v.patient_id\n" +
				"  inner join kenyaemr_etl.etl_mchs_delivery ld on ld.patient_id=v.patient_id\n" +
				"  inner join kenyaemr_etl.etl_patient_demographics dm on dm.patient_id=v.patient_id\n" +
				"WHERE date(v.visit_date) between (:startDate) and (:endDate)\n" +
				"  and timestampdiff(year,dm.DOB,v.visit_date) BETWEEN 10 AND 19\n" +
				"      and d.date_started >= v.visit_date and d.date_started < ld.visit_date;";

		SqlCohortDefinition sqlCohortDefinition = new SqlCohortDefinition(qry);
		Calendar calendar = Calendar.getInstance();
		int thisMonth = calendar.get(calendar.MONTH);

		Map<String, Date> dateMap = EmrReportingUtils.getReportDates(thisMonth - 1);
		Date startDate = dateMap.get("startDate");
		Date endDate = dateMap.get("endDate");

		context.addParameterValue("startDate", startDate);
		context.addParameterValue("endDate", endDate);

		Cohort adolescentsStartedHaartANC = Context.getService(CohortDefinitionService.class).evaluate(sqlCohortDefinition, context);


		return new EvaluatedCohort(adolescentsStartedHaartANC, definition, context);
	}
}




