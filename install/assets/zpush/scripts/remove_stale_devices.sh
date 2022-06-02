#!/command/with-contenv bash
## Delete Old Devices from Z-Push after a set amount of days

if [ -n "$1" ] ; then SYNC_PURGE_DAYS=$1 ; fi

SYNC_PURGE_DAYS=${SYNC_PURGE_DAYS:-"30"}
LOG_PATH=${LOG_PATH:-"/logs/zpush/"}
LOG_FILE=${LOG_FILE:-"syncpurge.log"}
REMOVE_NEVER=${REMOVE_NEVER:-"TRUE"}

lastsync_report=$(mktemp)
touch "${LOG_PATH}"/"${LOG_FILE}"
zpush-admin -a lastsync | tail -n +7 > "${lastsync_report}"

while IFS= read -r line
do
  deviceid=$(echo ${line} | awk '{print $1}')
  username=$(echo ${line} | awk '{print $2}')
  syncdate=$(echo ${line} | awk '{print $3}')

  if [ "${syncdate}" = "never" ] ; then
     if [ "${REMOVE_NEVER,,}" = "true" ] ; then
        zpush-admin -a remove -u ${username} -d ${deviceid}
        echo "$(TZ=${TIMEZONE} date +'%Y-%m-%d.%H:%M:%S %Z') REMOVE ${username} ${deviceid} NEVER" >> "${LOG_PATH}"/"${LOG_FILE}"
     fi
  fi

  days_diff=$(( (`date -d "00:00" +%s` - `date -d "${syncdate}" +%s`) / (24*3600) ))
  if [[ "${days_diff}" -gt ${SYNC_PURGE_DAYS} ]] ; then
     zpush-admin -a remove -u ${username} -d ${deviceid}
     echo "$(TZ=${TIMEZONE} date +'%Y-%m-%d.%H:%M:%S %Z') REMOVE ${username} ${deviceid} ${days_diff}" >> "${LOG_PATH}"/"${LOG_FILE}"
  fi
done < "$lastsync_report"

rm -rf ${lastsync_report}
