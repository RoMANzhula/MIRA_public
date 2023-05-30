create table user_subscriptions (
    user_message_owner_id bigint not null references users,
    subscriber_id bigint not null references users,
    primary key (channel_id, subscriber_id)
)
