# Rollback Plan

**Date:** March 24, 2026
**Site:** BigDIAMOND (Local staging copy)

## Available Rollback Assets

Before any destructive operation (which are strictly forbidden in this read-only phase, but prepared for future execution), the following assets have been identified and verified on the local filesystem:

1. **Primary Full SQL Dump:**
   - Path: `app/sql/local.sql`
   - Size: ~313 MB
   - Date: March 23, 2026
   - Contains: Complete structure and data, including all custom tables.

2. **Secondary SQL Dump:**
   - Path: `app/sql/twoja-baza.sql`
   - Size: ~323 KB
   - Date: March 20, 2026
   - Contains: Partial or older backup.

3. **Filesystem SQL Backup:**
   - Path: `app/public/backup.sql`
   - Size: ~277 MB
   - Date: March 20, 2026

4. **UpdraftPlus Backups:**
   - Directory: `app/public/wp-content/updraft/`
   - Status: Active logs found, actual backup archives may be stored remotely or previously downloaded.

5. **All-In-One WP Security Backups:**
   - Directory: `app/public/wp-content/aiowps_backups/`
   - Status: Contains `.htaccess` backups and `backup.wp-config.php`.

## Rollback Procedures

### Scenario 1: Table Deletion Reversal
If an orphaned table (e.g., `ab12CD34_woo_mailerlite_carts`) is dropped and needs to be restored:
1. Extract the specific `CREATE TABLE` and `INSERT INTO` statements from `app/sql/local.sql`.
2. Execute the extracted SQL against the local database via WP-CLI or MySQL client.
   ```bash
   wp db query < extracted_table.sql
   ```

### Scenario 2: Option Deletion Reversal
If an autoloaded option is deleted and breaks functionality:
1. Locate the option in `app/sql/local.sql` within the `ab12CD34_options` table dump.
2. Manually re-insert the option using WP-CLI:
   ```bash
   wp option add <option_name> '<option_value>' --autoload=yes
   ```

### Scenario 3: Cron Hook Reversal
If a deleted cron hook is required by a re-activated plugin:
1. The safest rollback is simply to re-activate the plugin via the WordPress admin or WP-CLI. Most plugins re-register their cron hooks upon activation.
2. Alternatively, use WP-CLI to manually schedule the event if the parameters are known.

### Scenario 4: Catastrophic Failure
If multiple operations cause the site to crash:
1. Drop all tables in the local database.
2. Perform a full import from the primary SQL dump:
   ```bash
   wp db import app/sql/local.sql
   ```
3. Flush object cache (if applicable) and verify site functionality.
