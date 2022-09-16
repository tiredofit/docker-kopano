## 2.13.3 2022-09-16 <dave at tiredofit dot ca>

   ### Changed
      - Fix for Webapp Plugin Files not generating 64 character keys


## 2.13.2 2022-08-11 <dave at tiredofit dot ca>

   ### Changed
      - Fix some shellcheck issues
      - Don't recursively change ownership on the attachments folder


## 2.13.1 2022-08-06 <dave at tiredofit dot ca>

   ### Changed
      - Bugfix for Fail2ban


## 2.13.0 2022-08-05 <dave at tiredofit dot ca>

   ### Changed
      - Remove Fail2ban from image and reconfigure based on upstream base image


## 2.12.10 2022-07-06 <dave at tiredofit dot ca>

   ### Added
      - Update to support tiredofit/nginx:7.xx and nginx-php-fpm/6.x.x featureset


## 2.12.9 2022-06-03 <dave at tiredofit dot ca>

   ### Added
      - Improve logging of Z-Push sync deletions script


## 2.12.8 2022-06-03 <dave at tiredofit dot ca>

   ### Reverted
      - Removal of traces of Kopano Meet as it's been discontinued


## 2.12.7 2022-06-02 <dave at tiredofit dot ca>

   ### Changed
      - Update remove_stale_devices.sh to read container environment variables and not be so self contained


## 2.12.6 2022-06-02 <dave at tiredofit dot ca>

   ### Added
      - Add remove_stale_devices.sh for Zpush state cleanup

   ### Changed
      - Fix Z-Push version from not showing


## 2.12.5 2022-05-14 <dave at tiredofit dot ca>

   ### Changed
      - Change user scripts environment variables to support both KC8.7 and 10/11 - Defaults are now 'default' and will automatically adjust. If using a script name, all will still work the same way as before.


## 2.12.4 2022-05-14 <dave at tiredofit dot ca>

   ### Changed
      - Additional version changes


## 2.12.3 2022-05-14 <dave at tiredofit dot ca>

   ### Changed
      - Bugfix for 2.12.2


## 2.12.2 2022-05-14 <dave at tiredofit dot ca>

   ### Added
      - Add some startup differences for KC 8.7/10/11 versions


## 2.12.1 2022-05-14 <dave at tiredofit dot ca>

   ### Added
      - Add Z_PUSH_OVERRIDE environment variable to quickly swap between Z_PUSH versions for a running container for troubleshootnig purposes.


## 2.12.0 2022-03-04 <dave at tiredofit dot ca>

   ### Added
      - BUmp version to 2.12.0 to support branching


## 2.11.0 2022-03-01 <dave at tiredofit dot ca>

   ### Added
      - tiredofit/kopano-core:2.4.0


## 2.10.14 2022-03-01 <dave at tiredofit dot ca>

   ### Added
      - Update to tiredofit/kopano-webservices:2.3.5


## 2.10.13 2021-12-27 <dave at tiredofit dot ca>

   ### Added
      - Add Apache 2 zabbix monitoring functionality


## 2.10.12 2021-12-22 <dave at tiredofit dot ca>

   ### Changed
      - Fixup for sending version number via Zabbix Agent


## 2.10.11 2021-12-21 <dave at tiredofit dot ca>

   ### Changed
      - Monitoring fixes


## 2.10.10 2021-12-21 <dave at tiredofit dot ca>

   ### Changed
      - More Monitoring :)


## 2.10.9 2021-12-21 <dave at tiredofit dot ca>

   ### Changed
      - Tweaks to Zabbix Agents


## 2.10.8 2021-12-21 <dave at tiredofit dot ca>

   ### Changed
      - Fix for Statistics


## 2.10.7 2021-12-21 <dave at tiredofit dot ca>

   ### Changed
      - Fix for Prometheus exporter startup


## 2.10.6 2021-12-21 <dave at tiredofit dot ca>

   ### Changed
      - Fixups for monitoring


## 2.10.5 2021-12-16 <dave at tiredofit dot ca>

   ### Changed
      - Fix for Zabbix Autoregistration


## 2.10.4 2021-12-16 <dave at tiredofit dot ca>

   ### Changed
      - Patchup for Zabbix Autoregistration


## 2.10.3 2021-12-16 <dave at tiredofit dot ca>

   ### Added
      - Update Fail2ban Zabbix monitoring template


## 2.10.2 2021-12-16 <dave at tiredofit dot ca>

   ### Added
      - Add Zabbix Autoregistration support for each module


## 2.10.1 2021-12-07 <dave at tiredofit dot ca>

   ### Changed
      - Bugfix for 2.10.1 specifically relating around Prometheus Exporter


## 2.10.0 2021-12-06 <dave at tiredofit dot ca>

   ### Added
      - Add Prometheus Exporter for Statistics


## 2.9.8 2021-11-08 <dave at tiredofit dot ca>

   ### Changed
      - Cleanup another logrotate anomaly


## 2.9.7 2021-10-28 <dave at tiredofit dot ca>

   ### Changed
      - More Fixes for Fail2ban


## 2.9.6 2021-10-28 <dave at tiredofit dot ca>

   ### Changed
      - Fix for Fail2ban logrotation


## 2.9.5 2021-10-27 <dave at tiredofit dot ca>

   ### Added
      - Fluent Bit log parsing changes


## 2.9.4 2021-10-24 <dave at tiredofit dot ca>

   ### Changed
      - Delete extra apache2 logrotate file


## 2.9.3 2021-10-24 <dave at tiredofit dot ca>

   ### Changed
      - Fix for fluent-bit failing due to extra logrotate.d files
      - Fix for Nginx ZPush Logs


## 2.9.2 2021-09-28 <dave at tiredofit dot ca>

   ### Changed
      - Fix parsers for zpush and kopano


## 2.9.1 2021-09-25 <dave at tiredofit dot ca>

   ### Changed
      - tiredofit/kopano-core:2.2.3
      - tiredofit/kopano-webservices:2.3.3


## 2.9.0 2021-09-24 <dave at tiredofit dot ca>

   ### Added
      - Add Log Parsing regular expressions for Fluent-bit logshipping functionality in base image

   ### Changed
      - Remove "global" logrotate configuration when using Apache


## 2.8.9 2021-09-15 <jihnmki@github.com>

   ### Fixed
      - FIx calendar defaults from loading


## 2.8.8 2021-09-15 <jihnmki@github.com>

   ### Fixed
      - Calendar configuration was failing looking for wrong value


## 2.8.7 2021-09-15 <dave at tiredofit dot ca>

   ### Changed
      - More adjustments to Fusiondirectory LDAP configuration


## 2.8.6 2021-09-15 <dave at tiredofit dot ca>

   ### Changed
      - Change LDAP default attribute for OpenLDAP / FusionDirectory


## 2.8.5 2021-09-05 <dave at tiredofit dot ca>

   ### Added
      - Add blocked logs configuration location


## 2.8.4 2021-09-04 <dave at tiredofit dot ca>

   ### Changed
      - Adjustments to Apache Log Format
      - Changed the way that Logrotate occurs to accomodate for log shipping and differnet types of parsers


## 2.8.3 2021-08-18 <dave at tiredofit dot ca>

   ### Changed
      - Apache fixes


## 2.8.2 2021-08-18 <dave at tiredofit dot ca>

   ### Changed
      - More Apache Changes


## 2.8.1 2021-08-18 <dave at tiredofit dot ca>

   ### Changed
      - Fix for Zpush Apache Serving


## 2.8.0 2021-08-18 <dave at tiredofit dot ca>

   ### Added
      - Add Apache mode for Z-Push

   ### Changed
      - Tweaks to Z-Push configuration for nginx specifically autodiscover
      - Rework Apache confgiuration to not create duplicate configuration files if using KDAV and ZPUSH under Apache
      - Stopped overwriting ldap-propmap.cfg if already existed


## 2.7.3 2021-08-17 <dave at tiredofit dot ca>

   ### Changed
      - Fix LDAP_GROUP_ATTRIBUTE issue showing as Boolean instead of an actual attribute
      - Add additional configuration to nginx for Z-Push


## 2.7.2 2021-08-13 <dave at tiredofit dot ca>

   ### Changed
      - Add KDAV Custom Listening Port to Apache


## 2.7.1 2021-08-13 <dave at tiredofit dot ca>

   ### Changed
      - Fix ZPush Custom Template from not activating


## 2.7.0 2021-08-12 <dave at tiredofit dot ca>

   ### Added
      - Add *_LISTENING_PORT environment variables if you want to run differnet web servers on different ports


## 2.6.8 2021-08-12 <dave at tiredofit dot ca>

   ### Added
      - Add more safety checks for KDAV to operate effectively when using Apache Hack
      - Zpush Clear Loop states on startup

   ### Reverted


## 2.6.7 2021-08-05 <dave at tiredofit dot ca>

   ### Changed
      - Hardcode Configuration path for Zpush Policies


## 2.6.6 2021-08-05 <dave at tiredofit dot ca>

   ### Changed
      - Spelling mistake enabling an extension


## 2.6.5 2021-08-05 <dave at tiredofit dot ca>

   ### Changed
      - Fix for initial Zpush Policies file


## 2.6.4 2021-08-05 <dave at tiredofit dot ca>

   ### Added
      - tiredofit/kopano-webservices:2.3.1
      - Change defaults with Zpush
      - Move Z-Push provisioning policy to be with rest of persistent configuration
      - Fix Zpush states on each container start


## 2.6.3 2021-08-04 <dave at tiredofit dot ca>

   ### Added
      - Add additional PHP dependencies


## 2.6.2 2021-08-04 <dave at tiredofit dot ca>

   ### Changed
      - Add variable for KDAV PHP Library hack


## 2.6.1 2021-08-04 <dave at tiredofit dot ca>

   ### Added
      - tiredofit/kopano-core:2.2.1


## 2.6.0 2021-08-05 <dave at tiredofit dot ca>

   ### Changed
      - Change the way that PHP is called to support multiple version builds


## 2.5.0 2021-08-03 <dave at tiredofit dot ca>

   ### Added
      - Split MODE=ZPUSH and MODE=ZPUSH_AUTODISCOVER. All ZPUSH Options remain the same


## 2.4.4 2021-07-29 <dave at tiredofit dot ca>

   ### Changed
      - Remove LLNG Authentication from Zpush


## 2.4.3 2021-07-20 <dave at tiredofit dot ca>

   ### Changed
      - Fix Cron issues referencing files that don't exist


## 2.4.2 2021-07-20 <dave at tiredofit dot ca>

   ### Changed
      - Reworked cron settings
      - Rewrote Fail2ban Regex and modified log output
      - Forced KDAV log to be owned by webserver
      - Safety net around DAgent forwarding whitelist options
      - Fix Z-Push Search Backend Default


## 2.4.1 2021-07-20 <dave at tiredofit dot ca>

   ### Added
      - Add more options to kopano spooler auto configuration


## 2.4.0 2021-07-20 <dave at tiredofit dot ca>

   ### Added
      - Add independent (SERVICE)_LOG_LEVEL override capabilities from LOG_LEVEL


## 2.3.5 2021-07-12 <dave at tiredofit dot ca>

   ### Changed
      - Change the way that LLNG Authentication works

## 2.3.4 2021-07-08 <dave at tiredofit dot ca>

   ### Changed
      - tiredofit/kopano-webservices:2.2.0 base

## 2.3.3 2021-05-18 <dave at tiredofit dot ca>

   ### Changed
      - tiredofit/kopano-core:2.1.2 base

## 2.3.2 2021-05-17 <dave at tiredofit dot ca>

   ### Changed
      - tiredofit/kopano-core:2.1.1 base
      - tiredofit/kopano-webservices:2.1.2 base

## 2.3.1 2021-05-17 <dave at tiredofit dot ca>

   ### Changed
      - Fix for enabling themes and iconsets inside of the webapp


## 2.3.0 2021-05-16 <dave at tiredofit dot ca>

   ### Changed
      - tiredofit/kopano-core:2.1.0 base


## 2.2.0 2021-05-04 <dave at tiredofit dot ca>

   ### Added
      - Support inhibiting auto reply or forwarding based on specific message headers

   ### Changed
      - tiredofit/kopano-webservices:2.1.1 base
      - Fix for PHP Mapi extension being loaded twice


## 2.1.0 2021-05-01 <dave at tiredofit dot ca>

   ### Added
      - Added support for Webapp Plugin Jitsi Meet
      - Added support for Webapp Plugin Text Templates
   ### Changed
      - tiredofit/kopano-webservices: 2.1.0

## 2.0.0 2021-04-18 <dave at tiredofit dot ca>

   ### Changed
      - Split image into 3 builds
      - Runtime tiredofit/nginx-php-fpm:7.3-debian-buster
      - tiredofit/kopano-core: 2.0.0
      - tiredofit/kopano-webservices: 2.0.0


## 1.1.0 2021-04-13 <dave at tiredofit dot ca>

   ### Changed
      - Kopano Core 11.x
      - Additional OIDC Settings
      - Fix Rocketchat Plugin with ordering
      - Debian Base due to issues with Alpine and Go


## 0.92.0 2020-12-19 <dave at tiredofit dot ca>

   ### Changed
      - Change the way Build Assets are loaded

## 0.91.0 2020-12-19 <dave at tiredofit dot ca>

   ### Changed
      - Move Apache services around
      - Change the way that OIDC is registered in server.config
      - Changed ZPush Default Content body size to not rely on another default environment variable that may or may not exist


## 0.90.0 2020-12-16 <dave at tiredofit dot ca>

   ### Changed
      - Z-Push 2.6.1


## 0.89.0 2020-11-10 <dave at tiredofit dot ca>

   ### Changed
      - Removed Conversation mode for webapp variables based on master changes

## 0.88.0 2020-11-04 <dave at tiredofit dot ca>

   ### Added
      - Kopano Webapp switched to master branch (5.0)
      - Kopano Webapp Files, Owncloud, and SMB plugins updated to 4.0
      - Changed some WEBAPP_DISABLE_* variables to WEBAPP_ENABLE_* variables due to change in Kopano Webapp 5.x

## 0.87.0 2020-11-04 <dave at tiredofit dot ca>

   ### Added
      - Kopano Webapp 4.6.3

## 0.86.0 2020-10-28 <dave at tiredofit dot ca>

   ### Added
      - Z-Push 2.6.0

## 0.86.0 2020-10-22 <dave at tiredofit dot ca>

   ### Added
      - Kopano Webapp 4.6.1

## 0.85.0 2020-10-22 <dave at tiredofit dot ca>

   ### Added
      - Kopano Webapp 4.6.0

## 0.84.0 2020-10-14 <dave at tiredofit dot ca>

   ### Added
      - Kopano Webapp 4.5.1

## 0.83.0 2020-10-14 <dave at tiredofit dot ca>

   ### Added
      - Kopano Webapp 4.5

## 0.82.0 2020-10-13 <dave at tiredofit dot ca>

   ### Added
      - Added Jodit HTML Editor to Webapp

## 0.81.0 2020-10-08 <dave at tiredofit dot ca>

   ### Changed
      - Reverted back to PHP 7.3 due to PDO issues
      - Load Apache2 to handle KDAV queries for now
      - Webapp 4.4

## 0.75.0 2020-09-24 <dave at tiredofit dot ca>

   ### Changed
      - Pin Webapp Version to 4.3
      - Removed File Previewer Plugin
      - Update Quota Defaults
      - Fix Autoresponder
      - Split Autodiscover to its own seperate nginx configuration

## 0.70.0 2020-09-18 <dave at tiredofit dot ca>

   ### Changed
      - Stripped Kopano Meet, Konnect, GRAPI, KWMserver, KAPI from image
      - Switch to PHP 7.4
      - Fix SPAMD DB File
      - Fix TLS issues
      - Fix Kopano Backup Configuration
      - Alter some defaults

## 0.63.0 2020-09-06 <dave at tiredofit dot ca>

   ### Added
      - Perl dependencies for kopano-migration-imap
      - Add MODE=MIGRATE - A copy of Kopano Gateway with authentication disabled for migration purposes
      - Source file and script injection on each service before compiling via /build-assets

   ### Changed
      - Fix to fetching webapp repo tools from git
      - Dirty hacks for Rocketchat Webapp Plugin
      - Fix WEBAPP_ENALE_PLUGINS
      - Fix SpamD configuration enforcing a DB entry
      - Remove Desktop Notifications, Title Counter, Quick Items, Folder Widget plugin routines (embedded in master)
      - Fix Webapp Manual configuration (embedded in master)
      - Update dependencies
      - Do a better job bootstrapping log files and directories

## 0.52.2 2020-08-30 <dave at tiredofit dot ca>

   ### Changed
      - Move Fail2ban Init/Start Order
      - Add routines to check mode for Fail2ban to avoid errors

## 0.52.1 2020-08-30 <dave at tiredofit dot ca>

   ### Changed
      - Bugfixes for multi host/container
      - Fix spelling error in custom user scripts environment variable

## 0.52.0 2020-08-30 <dave at tiredofit dot ca>

   ### Changed
      - Startup Routines to support multi host/container usage

## 0.51.0 2020-08-27 <dave at tiredofit dot ca>

   ### Changed
      - Fix MAPI Extension not loading
      - Permissions Issue for Rocketchat Plugin
      - Fix Fail2ban sourcing of defaults

## 0.50.0 2020-08-27 <dave at tiredofit dot ca>

      - Compile Kopano Core from git sources
      - Compile Kopano Meet from git sources

   ### Changed
      - Support Build Arguments for all environment variables

## 0.39.0 2020-08-15 <dave at tiredofit dot ca>

   ### Added
      - Compile Webapp and plugins from git via multistage
      - Add manuals for configuration references

   ### Changed
      - Changes to support latest KC 10.x commits relating to scripts, store creation
      - Lots of tweaks

## 0.25.0 2020-08-10 <dave at tiredofit dot ca>

   ### Added
      - Webapp: Add Mattermost Plugin
      - Webapp: Add HTMLEditor-Quill Plugin

   ### Changed
      - Stop configuring folder widgets, manual and quick items as they are a part of webapp core


## 0.24.0 2020-08-07 <dave at tiredofit dot ca>

   ### Changed
      - Fix Quick Items and Contact Fax plugin configuration


## 0.23.0 2020-08-06 <dave at tiredofit dot ca>

   ### Added
      - Enable DOMPurify by Default for Webapp


## 0.22.0 2020-08-05 <dave at tiredofit dot ca>

   ### Added
      - Add python3-setuptools


## 0.21.0 2020-08-04 <dave at tiredofit dot ca>

   ### Added
      - Allow to cherrypick which services to run for multi container usage


## 0.20.0 2020-08-04 <dave at tiredofit dot ca>

   ### Added
      - Add environment variables to enable or disable individual webapp plugins


## 0.19.0 2020-07-31 <dave at tiredofit dot ca>

   ### Added
      - Add custom assets support (drop files into /assets/custom following folder structure in relation to / to overwrite it)


## 0.18.0 2020-06-27 <dave at tiredofit dot ca>

   ### Changed
      - Run shellcheck against scripts adding quotes around variables
      - Fix misspelled environment variables
      - Fix issue with LDAP_MODE=FUSIONDIRECTORY not picking up groups


## 0.17.0 2020-06-21 <dave at tiredofit dot ca>

   ### Changed
      - DAgent Raw Message directory fix


## 0.16.0 2020-06-21 <dave at tiredofit dot ca>

   ### Changed
      - Fix DAgent Plugin Setting


## 0.15.0 2020-06-21 <dave at tiredofit dot ca>

   ### Added
      - Cleanup Dockerfile


## 0.14.1 2020-06-21 <dave at tiredofit dot ca>

   ### Changed
      - Cleanup Dockerfile


## 0.14.0 2020-06-21 <dave at tiredofit dot ca>

   ### Changed
      - Fix Environment variables for Webapp Plugin Defaults


## 0.13.0 2020-06-21 <dave at tiredofit dot ca>

   ### Added
      - Reduce size of Docker Image by enabling cleanup routines


## 0.0.12 2020-06-21 <dave at tiredofit dot ca>

   ### Changed
      - Fix fail2ban startup
      - Don't look for Kopano Server socket before starting Konnect


## 0.0.11 2020-06-20 <dave at tiredofit dot ca>

   ### Changed
      - Fix generating Konnect PKEY


## 0.0.10 2020-06-20 <dave at tiredofit dot ca>

   ### Changed
      - Updates to Server Backend


## 0.0.9 2020-06-20 <dave at tiredofit dot ca>

   ### Changed
      - Fix for broken case statement


## 0.0.8 2020-06-20 <dave at tiredofit dot ca>

   ### Added
      - Allow "DB" backend


## 0.0.7 2020-06-20 <dave at tiredofit dot ca>

   ### Added
      - Support tiredofit/fusiondirectory-plugin-kopano plugin with hardcoded LDAP attributes (LDAP_TYPE=FUSIONDIRECTORY)


## 0.0.6 2020-06-12 <dave at tiredofit dot ca>

   ### Changed
      - Shuffle around some environment variables for Webapp Plugins


## 0.0.5 2020-06-11 <dave at tiredofit dot ca>

   ### Added
      - Finish off DAgent Configuration
      - Finish off Gateway Configuration
      - Don't create log files if not set to do so
      - Support StartTLS for LDAP
      - Cleanup Dockerfile
      - Misc fixes


## 0.0.4 2020-06-10 <dave at tiredofit dot ca>

   ### Added
      - Allow GRAPI, KAPI, KWMServer, Konnect to Log to File


## 0.0.3 2020-06-10 <dave at tiredofit dot ca>

   ### Added
      - Added checks to hold on starting services until sockets are ready

   ### Changed
      - Removed Backticks in scripting instead using $()


## 0.0.2 2020-06-10 <dave at tiredofit dot ca>

   ### Changed
      - Load all defaults and functions instead of just Kopano for things like nginx / php setup / tweaks


## 0.0.1 2020-05-20 <dave at tiredofit dot ca>

   ### Added
      - Initial Commit


