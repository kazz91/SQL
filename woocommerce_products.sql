SELECT
        cast(p.ID AS CHAR) as ID_Produto,
        p.post_title as Nome_produto,
        max( CASE WHEN pm.meta_key = '_price' and p.ID = pm.post_id THEN pm.meta_value END ) as Preco_produto,
        max( CASE WHEN pm.meta_key = '_sku' and p.ID = pm.post_id THEN pm.meta_value END ) as SKU,
        max( CASE WHEN pm.meta_key = '_alg_ean' and p.ID = pm.post_id THEN pm.meta_value END ) as EAN,
        max( CASE WHEN pm.meta_key = '_stock' and p.ID = pm.post_id THEN pm.meta_value END ) as Estoque_atual      
    FROM
        wp_posts as p
        LEFT join wp_postmeta as pm on p.ID = pm.post_id
    WHERE
        post_type = 'product'
    group by
        p.ID        
