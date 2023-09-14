SELECT
  MAX( d.id) AS id,
  MAX( d.amount_montly) AS amount_montly,
  MAX( d.amount_total) AS amount_total,
  MAX( d.amount_unique) AS amount_unique,
  MAX( d.campaign_created_at) AS campaign_created_at,
  MAX( d.campaign_updated_at) AS campaign_updated_at,
  MAX( d.last_activity_at) AS last_activity_at,
  MAX( d.last_activity_content) AS last_activity_content,
  MAX( d.interactions) AS interactions,
  MAX( d.created_at) AS data_criacao,
  MAX( d.closed_at) AS data_fechamento,
  MAX( d.markup) AS markup,
  MAX( d.markup_created) AS markup_created,
  MAX( d.markup_last_activities) AS markup_last_activities,
  MAX( d.name) AS oportunidade,
  MAX( d.next_task_date) AS next_task_date,
  MAX( d.next_task_hour) AS next_task_hour,
  MAX( d.next_task_id) AS next_task_id,
  MAX( d.next_task_subject) AS next_task_subject,
  MAX( d.next_task_type) AS next_task_type,
  MAX( d.organization_address) AS organization_address,
  MAX( d.organization_address_latitude) AS organization_address_latitude,
  MAX( d.organization_address_longitude) AS organization_address_longitude,
  MAX( d.organization_id) AS organization_id,
  MAX( d.organization_name) AS nome_contato,
  MAX( d.organization_user_email) AS organization_user_email,
  MAX( d.organization_user_id) AS organization_user_id,
  MAX( d.organization_user_name) AS organization_user_name,
  MAX( d.prediction_date) AS prediction_date,
  MAX( d.deal_lost_reason_created_at) AS deal_lost_reason_created_at,
  MAX( d.deal_lost_reason_updated_at) AS deal_lost_reason_updated_at,
  MAX( d.deal_source_created_at) AS deal_source_created_at,
  MAX( d.deal_source_name) AS deal_source_name,
  MAX( d.deal_source_updated_at) AS deal_source_updated_at,
  MAX( d.deal_stage_created_at) AS deal_stage_created_at,
  MAX( d.deal_stage_name) AS etapa_funil,
  MAX( d.deal_stage_nickname) AS deal_stage_nickname,
  MAX( d.deal_stage_updated_at) AS deal_stage_updated_at,
  MAX( d.hold) AS hold,
  MAX( d.rating) AS rating,
  MAX( d.updated_at) AS updated_at,
  MAX( d.user_changed) AS user_changed,
  MAX( d.user_email) AS user_email,
  MAX( d.user_id) AS user_id,
  MAX( d.user_name) AS user_name,
  MAX( d.user_nickname) AS user_nickname,
  MAX( d.win) AS win,
  MAX(a.text) AS anotacao,
  MAX(a.date) AS data_anotacao,
  MAX(CASE
      WHEN d.win = TRUE THEN 1
    ELSE
    0
  END
    ) AS conversao,
  MAX(CASE
      WHEN cf.custom_fields_key = 'email' AND d.organization_id = cf.organization_id THEN cf.custom_fields_value
  END
    ) AS email_contato,
  MAX(CASE
      WHEN cf.custom_fields_key = 'tipo_de_animal' AND d.organization_id = cf.organization_id THEN cf.custom_fields_value
  END
    ) AS animal,
  MAX(CASE
      WHEN cf.custom_fields_key = 'telefone' AND d.organization_id = cf.organization_id THEN cf.custom_fields_value
  END
    ) AS telefone,
  MAX(CASE
      WHEN cf.custom_fields_key = 'temperamento' AND d.organization_id = cf.organization_id THEN cf.custom_fields_value
  END
    ) AS temperamento,
  MAX(CASE
      WHEN cf.custom_fields_key = 'raca' AND d.organization_id = cf.organization_id THEN cf.custom_fields_value
  END
    ) AS raca,
  MAX(CASE
      WHEN cf.custom_fields_key = 'pelagem' AND d.organization_id = cf.organization_id THEN cf.custom_fields_value
  END
    ) AS pelagem,
  MAX(CASE
      WHEN cf.custom_fields_key = 'origem' AND d.organization_id = cf.organization_id THEN cf.custom_fields_value
  END
    ) AS origem,
  MAX(CASE
      WHEN cf.custom_fields_key = 'genero' AND d.organization_id = cf.organization_id THEN cf.custom_fields_value
  END
    ) AS genero,
  MAX(CASE
      WHEN cf.custom_fields_key = 'data_nascimento' AND d.organization_id = cf.organization_id THEN cf.custom_fields_value
  END
    ) AS data_nascimento_pet,
  MAX(CASE
      WHEN cf.custom_fields_key = 'castrado' AND d.organization_id = cf.organization_id THEN cf.custom_fields_value
  END
    ) AS castrado,
  MAX(CASE
      WHEN cf.custom_fields_key = 'cep' AND d.organization_id = cf.organization_id THEN cf.custom_fields_value
  END
    ) AS cep,
  MAX(CASE
      WHEN cf.custom_fields_key = 'cidade' AND d.organization_id = cf.organization_id THEN cf.custom_fields_value
  END
    ) AS cidade,
  MAX(CASE
      WHEN cf.custom_fields_key = 'status-cliente-funil' AND d.organization_id = cf.organization_id THEN cf.custom_fields_value
  END
    ) AS status_cliente_funil
FROM
  `[your-path].rdstationcrm_deals` AS d
LEFT JOIN `[your-path].rdstationcrm_organizations_custom_fields` AS cf
ON
  d.organization_id = cf.organization_id
LEFT JOIN
  `[your-path].rdstationcrm_activities` AS a
ON
  d.id = a.deal_id
GROUP BY
  d.id
