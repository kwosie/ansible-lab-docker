CREATE TABLE IF NOT EXISTS jboss_ops_stage.aggr_responses (
    id varchar(255) NOT NULL, 
    exchange longblob NOT NULL,
    constraint aggregation_pk PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS jboss_ops_stage.aggr_responses_completed (
    id varchar(255) NOT NULL, 
    exchange longblob NOT NULL,
    constraint aggregation_pk PRIMARY KEY (id)
);
