# 📸 Project Screenshots

A visual tour of the Azure 3-Tier Web Application — architecture, configuration, data layer, security, CI/CD, and the live app itself.

Click any section below to expand and view the screenshot.

---

## 🏗️ Architecture

<details>
<summary><strong>System architecture diagram</strong></summary>

![Architecture diagram](./01-architecture-diagram.png)

Users and two CI/CD pipelines — GitHub Actions and Azure DevOps — both deploy to Azure App Service, which connects to Azure SQL Database, Blob Storage, and Queue Storage.

</details>

---

## ☁️ Azure Resources

<details>
<summary><strong>Resource group — all provisioned resources</strong></summary>

![Resource group overview](./02-resource-group-overview.png)

All resources in `rg-3tier-app`, Sweden Central: App Service, App Service Plan, SQL Server + Database, Storage Account, and two Managed Identities used by Azure DevOps.

</details>

<details>
<summary><strong>App Service overview</strong></summary>

![App Service overview](./03-app-service-overview.png)

`webapp-3tier-mr` — Linux, F1 Free tier, connected to the GitHub repository for continuous deployment.

</details>

<details>
<summary><strong>Environment variables</strong></summary>

![Environment variables](./04-environment-variables.png)

All secrets — database credentials and the storage connection string — are stored as App Service environment variables, never in source code. Values are hidden in this view.

</details>

---

## 🗄️ Data & Storage

<details>
<summary><strong>Azure SQL — query editor</strong></summary>

![SQL query editor](./05-sql-query-editor.png)

Running `SELECT * FROM Items` directly against `app-database` using the Azure Portal Query Editor.

</details>

<details>
<summary><strong>SQL firewall rules</strong></summary>

![SQL firewall rules](./06-sql-firewall-rules.png)

"Allow Azure services and resources to access this server" is enabled, so App Service can reach the database without exposing it to the public internet.

</details>

<details>
<summary><strong>Blob Storage — app-assets container</strong></summary>

![Blob storage containers](./07-blob-storage-containers.png)

Uploaded files are stored in the private `app-assets` container inside the `str3tierapp` storage account.

</details>

<details>
<summary><strong>Queue Storage — item-notifications</strong></summary>

![Queue storage message](./08-queue-storage-message.png)

Every new item creates a JSON message in the `item-notifications` queue — the async, decoupled notification layer.

</details>

---

## 🔐 Security & Access

<details>
<summary><strong>RBAC — role assignments</strong></summary>

![RBAC IAM](./09-rbac-iam.png)

Access control for `rg-3tier-app`: Owner roles plus a Reader role assigned via Microsoft Entra ID.

</details>

---

## ⚙️ CI/CD Pipelines

<details>
<summary><strong>Azure DevOps — pipeline run</strong></summary>

![Azure DevOps pipeline run](./10-azure-devops-pipeline.png)

A multi-stage pipeline: Build & Test, then Deploy to Production — gated behind a manual approval step.

</details>

<details>
<summary><strong>Azure DevOps — service connection</strong></summary>

![Azure DevOps service connection](./11-azure-devops-service-connection.png)

`azure-connection` — an Azure Resource Manager service connection authenticated via Workload Identity Federation, with no stored passwords or secrets.

</details>

---

## 🖥️ Live Application

<details>
<summary><strong>Application dashboard</strong></summary>

![Live app UI](./12-live-app-ui.png)

The deployed application: live health status, architecture summary, item form, file upload, and real data from Azure SQL.

</details>

---

[← Back to main README](../../README.md)
