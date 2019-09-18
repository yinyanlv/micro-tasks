select LAC_Question.AutoId,
LACQuestionCode as LacQuestionCode,
replace(replace(replace(LACQuestionNote,char(10),' '),char(13),' '),char(9),' ') as LacQuestionNote,
DeliverDate,
ReceiveDate,
DealerCode,
DealerDescription,
DeliverNumber,
ResponsiblePerson,
ResponsiblePersonCallNumber,
WarehouseCode,
LAC_Warehouse.Description as WarehouseName,
LACQuestionStateCode as LacQuestionStateCode,
LAC_LACQuestionState.description as LacQuestionStateName,
LACQuestionNoteStateCode as LacQuestionNoteStateCode,
LAC_LACQuestionNoteState.Description as LacQuestionNoteStateName,
LACQuestionStateDate as LacQuestionStateDate,
TreatmentOpinionTypeCode,
LAC_TreatmentOpinionType.Description as TreatmentOpinionTypeName,
LAC_Question.CreateDate as LacCreateDate,
LAC_Question.CreatedBy as LacCreatedBy,
SubmitDate,
SubmitYear,
SubmitMonth,
ThatMonthWhichWeeks,
ThatYearWhichWeeks,
TreatmentOpinionDate,
FirstReplyDate,
FirstRepliedBy,
LastReplyDate,
LastRepliedBy,
CloseDate as ClosDate,
LACLastVisitTime as LacLastVisitTime,
DealerLastVisitTime,
LAC_Question.IsEnabled,
BrandCode
from LAC_Question
left join LAC_LACQuestionState on LAC_Question.LACQuestionStateCode=LAC_LACQuestionState.Code
left join LAC_LACQuestionNoteState on LAC_Question.LACQuestionNoteStateCode=LAC_LACQuestionNoteState.code
left join LAC_Warehouse on LAC_Warehouse.Code=LAC_Question.WarehouseCode
left join LAC_TreatmentOpinionType on LAC_TreatmentOpinionType.Code=LAC_Question.TreatmentOpinionTypeCode
where LAC_Question.CreateDate between ? and ?