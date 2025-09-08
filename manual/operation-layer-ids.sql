-- Flows:
-- 3c6cdddf-2944-493d-bc7f-2769fd87b1d6 > Ocean Nomads: Delete Nomad
-- cb772a2c-150c-4cca-bc2c-1f8498a5cd92 > Ocean Nomads: Update Nomad
-- 8b79cca0-d346-4d05-8bb2-c4b3c45d0721 > Ocean Nomads: Create Nomad
-- 77f1fc79-d0fd-4f5d-a168-50fa3948a945 > Ocean Nomads: Create Location

-- Layer: Event
-- Flow: Ocean Nomads: Create Event
UPDATE public.directus_operations
SET options = jsonb_set(options::jsonb,'{payload,layer}', to_jsonb((SELECT id FROM layers WHERE name = 'Events')), true)
WHERE key IN ('item_create_tsz05_xukmd', 'item_create_tsz05');

-- Layer: Nomads Base
-- Flow: Ocean Nomads: Create Nomad
-- Flow: Ocean Nomads: Update Nomad
-- Flow: Ocean Nomads: Delete Nomad
UPDATE public.directus_operations
SET options = jsonb_set(options::jsonb,'{payload,layer}', to_jsonb((SELECT id FROM layers WHERE name = 'Nomads Base')), true)
WHERE key IN ('item_create_oym38', 'item_create_oym38_epxyf');

UPDATE public.directus_operations
SET options = jsonb_set(options::jsonb,'{query,filter,_and,0,layer,_eq}', to_jsonb((SELECT id FROM layers WHERE name = 'Nomads Base')), true)
WHERE key IN ('item_delete_rasrd', 'item_update_e3pl5_wansj', 'item_update_o6cn8', 'item_update_o6cn8_nitpl');

-- Layer: Nomads Location
-- Flow: Ocean Nomads: Create Location
-- Flow: Ocean Nomads: Update Nomad
-- Flow: Ocean Nomads: Delete Nomad
UPDATE public.directus_operations
SET options = jsonb_set(options::jsonb,'{query,filter,_and,0,layer,_eq}', to_jsonb((SELECT id FROM layers WHERE name = 'Nomads Location')), true)
WHERE key IN ('item_delete_rasrd_boace','item_update_5eu19', 'item_update_5eu19_prdze');

UPDATE public.directus_operations
SET options = jsonb_set(options::jsonb,'{filter,$trigger,payload,_or,0,layer,_eq}', to_jsonb((SELECT id FROM layers WHERE name = 'Nomads Location')), true)
WHERE key IN ('condition_vvsgp');
UPDATE public.directus_operations
SET options = jsonb_set(options::jsonb,'{filter,$trigger,payload,_or,1,layer,_eq}', to_jsonb((SELECT id FROM layers WHERE name = 'Nomads Base')), true)
WHERE key IN ('condition_vvsgp');