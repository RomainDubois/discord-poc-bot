export DISCORD_IN_CHANNEL_ID=1544390320391716974
export DISCORD_OUT_CHANNEL_ID=1544390251714445494

msg=$(curl -s -H "Authorization: Bot $DISCORD_BOT_TOKEN"   "https://discord.com/api/v10/channels/$DISCORD_IN_CHANNEL_ID/messages?limit=1" | jq .[0].content -r)

content="Hello depuis mon bot:
${msg}"

jq -n \
  --arg content "$content" \
  '{content: $content}' |
curl -X POST \
  -H "Authorization: Bot $DISCORD_BOT_TOKEN" \
  -H "Content-Type: application/json" \
  -d @- \
  "https://discord.com/api/v10/channels/$DISCORD_OUT_CHANNEL_ID/messages" | jq