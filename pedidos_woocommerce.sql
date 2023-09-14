SELECT
        cast(p.ID AS CHAR) as ID_Pedido,
        p.post_date as Data_Compra,
        oi.order_item_name as Item_comprado,
        max( CASE WHEN pm.meta_key = '_customer_user' and p.ID = pm.post_id THEN pm.meta_value END ) as ID_Cliente,
        max( CASE WHEN pm.meta_key = '_dokan_vendor_id' and p.ID = pm.post_id THEN pm.meta_value END ) as Vendor_ID,
        max( CASE WHEN pm.meta_key = '_billing_email' and p.ID = pm.post_id THEN pm.meta_value END ) as Email,
        max( CASE WHEN pm.meta_key = '_billing_phone' and p.ID = pm.post_id THEN pm.meta_value END ) as Telefone,
        max( CASE WHEN pm.meta_key = '_billing_cnpj' and p.ID = pm.post_id THEN pm.meta_value END ) as CNPJ,
        max( CASE WHEN pm.meta_key = '_billing_cpf' and p.ID = pm.post_id THEN pm.meta_value END ) as CPF,
        max( CASE WHEN pm.meta_key = '_billing_first_name' and p.ID = pm.post_id THEN pm.meta_value END ) as Nome,
        max( CASE WHEN pm.meta_key = '_billing_last_name' and p.ID = pm.post_id THEN pm.meta_value END ) as Sobrenome,
        max( CASE WHEN pm.meta_key = '_billing_address_1' and p.ID = pm.post_id THEN pm.meta_value END ) as Endereco,
        max( CASE WHEN pm.meta_key = '_billing_number' and p.ID = pm.post_id THEN pm.meta_value END ) as Numero,
        max( CASE WHEN pm.meta_key = '_billing_neighborhood' and p.ID = pm.post_id THEN pm.meta_value END ) as Bairro,
        max( CASE WHEN pm.meta_key = '_payment_method_title' and p.ID = pm.post_id THEN pm.meta_value END ) as Metodo_pago,
        max( CASE WHEN pm.meta_key = '_billing_city' and p.ID = pm.post_id THEN pm.meta_value END ) as Cidade,
        max( CASE WHEN pm.meta_key = '_billing_state' and p.ID = pm.post_id THEN pm.meta_value END ) as UF,
        max( CASE WHEN pm.meta_key = '_billing_postcode' and p.ID = pm.post_id THEN pm.meta_value END ) as CEP,
        max( CASE WHEN pm.meta_key = '_order_total' and p.ID = pm.post_id THEN pm.meta_value END ) as Total_Pedido,
        max( CASE WHEN pm.meta_key = '_paid_date' and p.ID = pm.post_id THEN pm.meta_value END ) as Data_Pagamento,
        max( CASE WHEN pm.meta_key = '_completed_date' and p.ID = pm.post_id THEN pm.meta_value END ) as Data_Conclusao_pedido,
        max( CASE WHEN pm.meta_key = 'ddwc_driver_id' and p.ID = pm.post_id THEN pm.meta_value END ) as Driver_Assigned,    
        max( CASE WHEN m.meta_key = '_product_id' and p.ID = pm.post_id THEN m.meta_value END ) as Produto_ID,
        max( CASE WHEN m.meta_key = '_qty' and p.ID = pm.post_id THEN m.meta_value END ) as Quantidade,
        max( CASE WHEN m.meta_key = '_line_subtotal ' and p.ID = pm.post_id THEN m.meta_value END ) as SubTotal,
        max( CASE WHEN m.meta_key = '_line_total ' and p.ID = pm.post_id THEN m.meta_value END ) as Total_com_desc      
    FROM
    wp_posts AS p
    LEFT JOIN wp_postmeta AS pm ON p.ID = pm.post_id
    LEFT JOIN wp_woocommerce_order_items AS oi ON p.ID = oi.order_id
    LEFT JOIN wp_woocommerce_order_itemmeta AS m ON oi.order_item_id = m.order_item_id
WHERE
    p.post_type = 'shop_order'
    AND p.post_status IN ('wc-completed', 'wc-processing', 'wc-driver-assigned')
    AND oi.order_item_type = 'line_item'
GROUP BY
    p.ID, oi.order_item_id;
