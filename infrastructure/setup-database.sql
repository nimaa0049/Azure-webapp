-- ─────────────────────────────────────────────────────────────
-- Azure 3-Tier Web App — Database Setup Script
-- Built by Emre & Khaliq — 2026
--
-- Usage:
--   Azure Portal → SQL databases → app-database
--   → Query editor (preview) → SQL authentication
--   → Paste and Run
-- ─────────────────────────────────────────────────────────────


-- ── Step 1: Create Items Table ───────────────────────────────
-- Note: Column name is 'createdAt' (camelCase) to match app.js
-- Do NOT rename to created_at — the Node.js app expects camelCase

CREATE TABLE Items (
    id          INT IDENTITY(1,1) PRIMARY KEY,
    name        NVARCHAR(255)  NOT NULL,
    description NVARCHAR(MAX),
    createdAt   DATETIME2      DEFAULT GETDATE()
);


-- ── Step 2: Insert Sample Data ───────────────────────────────
INSERT INTO Items (name, description) VALUES
    ('Azure App Service',   'Hosts the Node.js + Express web application'),
    ('Azure SQL Database',  'Stores relational data — this table lives here'),
    ('Azure Blob Storage',  'Stores uploaded files in the app-assets container');


-- ── Step 3: Verify ───────────────────────────────────────────
SELECT
    id,
    name,
    description,
    createdAt
FROM Items
ORDER BY id;
