--
-- Table API Activity
DROP TABLE IF EXISTS public.at_api_activity
CASCADE;
CREATE TABLE public.at_api_activity
(
  id serial,
  ac_user_id integer NOT NULL DEFAULT 0,
  ac_token character varying(255),
  ac_api_date timestamp(6)
  without time zone NOT NULL DEFAULT now
  (),
  ac_api_name character varying
  (255) NOT NULL,
  ac_request text NOT NULL,
  ac_error_request character varying
  (255) NOT NULL,
  ac_response text,
  ac_error_response character varying
  (255),
  ac_created_by integer NOT NULL DEFAULT 0,
  ac_created_at timestamp
  (6) without time zone NOT NULL DEFAULT now
  (),
  CONSTRAINT ut_at_api_activity_pkey PRIMARY KEY
  (id)
)
  WITH
  (
  OIDS=FALSE
);

  CREATE INDEX idx_at_api_activity_1 ON public.at_api_activity (ac_created_by, ac_created_at);
  CREATE INDEX idx_at_api_activity_2 ON public.at_api_activity (ac_user_id, ac_api_name);
  CREATE INDEX idx_at_api_activity_3 ON public.at_api_activity (ac_api_name);