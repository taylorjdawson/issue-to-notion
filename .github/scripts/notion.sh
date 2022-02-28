generate_post_data() {
  cat <<EOF
{
  "parent":{
    "type": "database_id",
    "database_id":"29876f9a9b864ca39a984f42e17fd345"
  },
  "icon": {
    "type": "emoji",
    "emoji": "🐛"
  },
  "properties":{
    "Name": {
      "type": "title",
      "title": [{ "type": "text", "text": { "content":  "$TITLE" } }]
    },
    "Assigned": {
      "people": [
        {
          "object": "user",
          "id": "f6cbb362-4908-4138-9ef0-434003d9a9f8"
        }
      ]
    },
    "Status":{
      "select":{
        "name":"Current Sprint"
      }
    },
    "Type":{
      "multi_select":[
        {
          "name":"bug"
        }
      ]
    }
  }
}
EOF
}

curl 'https://api.notion.com/v1/pages' \
  -H 'Authorization: Bearer '"$NOTION_TOKEN"'' \
  -H "Content-Type: application/json" \
  -H "Notion-Version: 2021-08-16" \
  --data "$(generate_post_data)"

