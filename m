Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795094295;
	b=goN/BRkQc137W64FoPXvkMdPFYWEV9pQpK2MkNwDztDcTsAbpWYc10W3PDz5AoS/Q8xc
	 s/DeR+rWn1cd4svRM/QSx14DXN+/FyTJhif0MtPbTodPK1Z1WuSuuLkQHPCAeWgrU0Tso
	 s7ubzi6WzjlVdt9WYsUMSWc/CBcDnqVi5cPSwh7IEacPB3kt2BOdNWU+tzgf2YOiR+5CF
	 /iHuLBOA0vDSUQy4uR6zI2RufNVmrQpPH2SGJM+y/gXPGlMW2QtntGziF9VKktd7/VZLJ
	 4gz5aWO4t9M4c/F/NhuV7AfGK/7SWPD4LAk7TztQ7OE85Xay5lRY4EcFQCBXzDYbZnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094295;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=8jUxgPl4HvjIJEKGyO4/SBiaKmdzG1JADbTf7SYef5Y=;
	b=O9y7UvDgNsPr3XU1KWpK45H//FgpM8fl0EuRSTv7d5lnPEL0pCPFi7hOlOrObgU0T+8C
	 7Z/cFCAdZKhNXVHwHl75bdcXYkCbxnx4QYeMuy6OzqUFxPIQJ04qmBa57s1T1MYIFlUhY
	 5jmN/vgt/FZEzvOihRfvco+kcQq5WJZ22B6B67yVFIJQAjD2BCQDVHs7x0lSuu3gtu3ro
	 13CtDmrcI1Cy/AlMU6kFJlaIgG71zBVRJtMShDRUDt4gkAw9S/xefiIupT86RwVpp36mg
	 UOoEc4XxFUCIr03WMO304Bn3M51Y+zQGxUPSdq0BokD545fO9nTwAMXu3OjN7MvyL/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ynO+5BzY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.7
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADC2606A339
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ADC2606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ynO+5BzY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8c78ijd/ZzUJDBXtqOgChtEutYShZygSAqWz2BCHBq7xIQiB0dOhogfUKdVJZHBjsUQsH0o2zAdDhdeNGHb+6FMVy3Hejf0SrXmxUF7iK+XEKz9xGeHAJ9TJljZepVbf7mkSK3oTl0e59m4A1VnqI9eNL4FxscvQ5n8dMXiKkPLShOqTDKFq6ihwyAn620iZEw+PJPGIiVgfxy/Yk5pTq577d3I0FGRTa5tqO9JmGD0OtjBXFOCthPVb+6WS3LLxoweFxmQT2TF3jb0BOL5sh31b90+3pLcG40KfAdYGRQ4TVn9j2L14i7qYO+6zOq2VGfbuWX6o6TyxWgyyLfu2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jUxgPl4HvjIJEKGyO4/SBiaKmdzG1JADbTf7SYef5Y=;
 b=GNayjj54UutkzOhjrG5aCJsuNMWJcEzTO5fyg4B4XHwPX1NsN0koWfL0cBaIrp9/6o33KYZ/FvVHG7nGcXiseRnuv7V3ZkxcF2cdfT9wiobxTGcKnnzYPf2q3N2+Jj1LA8QRQuGY3Z2GZOhpHe4eE4nM/82VuqfPkiVWULjOOWLGwc9L0ef/eV787x+1Z6otmSOVgxceYlS+xJyQl10G9r7yNsuckyar/flf5l8g4fQ1yp4elUuRqyHTwzJvSbUWpcEhC0CKFdx8VxjHSr3YxFXprQL01Of3oXPjap4Z7fe5EeBP2796NoC+rgFQw8vXY04WAiKnLmWlyKd33R7jTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jUxgPl4HvjIJEKGyO4/SBiaKmdzG1JADbTf7SYef5Y=;
 b=ynO+5BzYAsg80cx241lz4qkGy0+6rt27ro97OJs6481be4xIc9jpTb9l+4xxgs0amI6DlK9tW3OaAZv4gJYgp+8j9oIuZl6Oej5SxfxxnmQMw8pbc73Jy80YA2o+TN1X8zejtDJcyTDbeiy/7C4S2aguqEagUk2bC8/NgWgkEOc=
Received: from CH2PR18CA0011.namprd18.prod.outlook.com (2603:10b6:610:4f::21)
 by CY5PR12MB6180.namprd12.prod.outlook.com (2603:10b6:930:23::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 13:18:07 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::5b) by CH2PR18CA0011.outlook.office365.com
 (2603:10b6:610:4f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 13:18:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 13:18:06 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 07:18:03 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 07:18:02 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 07:18:02 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, "moderated list:ARM/ZYNQ
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 5/6] firmware: xilinx: Change debugfs pm_api_ret size to PAYLOAD_ARG_CNT
Date: Thu, 19 Nov 2026 14:17:29 +0100
Message-ID: <9096ca10ea87d3d56e9be40894a8545eb8b497f1.1795094242.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795094242.git.michal.simek@amd.com>
References: <cover.1795094242.git.michal.simek@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039; i=michal.simek@amd.com; h=from:subject:message-id; bh=qTGZRaMMdZU/Au0bXHxiE8MiRBaoz0tels6SkznW5ks=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9+/bpsTXfxjy1z03bZgUuad9qaL9U6qnm481PdI7cF /iVy6nd0lHKwiDGwSArpsgynUnHYc23a0vFlkfmw8xhZQIZwsDFKQAT6eFg+B+80Z97j8IUl2MT F7x9nLSDpyZ/w58ffq967zzacDK3JfQUI8M5j2KLe56iH+JOHVl54+JEd5Hkte/3laxU2FOT/iC y9DcrAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|CY5PR12MB6180:EE_
X-MS-Office365-Filtering-Correlation-Id: 6492b587-1e16-4ab5-2549-08df463f8cd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|261102123227099003|261026130827099003|261026140227099003|261026121527099003|261028144727099003|11063799006|261022075727099003|261022115727099003|261021123027099003|261021121427099003|261022105027099003|261021135927099003|261022113327099003|56012099006|5023799004|10067099003|261021130227099003|18002099003|22082099003|261009223027099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	QzX+PJa1h+ZLx8j/86cX8GY+rng4oix72NoW+NHsbG6U3PLDJOV5aCCrqGAYrA2RZOMD3PgO7xC87j4ugwnBLW4XBQYcUAWGvtDC0ji/G8n4Ntkz+JXygklDsHdJ08b+YfaA4mKALjoNMS+fdHifjaEJNuWLHgme41AcynH5NTrzYvlG/tcp0QOPdU7D1EH1Vmi5VSYt/POcn/80EEI/ykQO6e3Fo2hV9goC5XDDqbewHVGLdWXnieyoW6FVbh/VAFlIGACotE+NnLftRRGcmnG2HqNqSpcJ87l61sVyd/IzE0wm9F2Ipmr1Hh0P6rrcstM1aFi6oczBpb1qgYDRREPtwJwZeVMpH9JElo+6jJPNJLbQQ2VO85CJsKA5HGpLAin/2j0PjCnWhSPp1zQQ4pMbP99tdMsRCYYYleBKIaUu59xlpqiADIRdkRkHoAH45TushO8VBk+qZlorWkW0PSTfx6kdwiiSOcEBOqe3r9aa9ZSUY10BvHfetB2tqRPLzCuh9UlQWbkxAYe4P0zG5JGjkvqo9wK4mEAoO1hr+lHpzFVGf7EaCGAZVAeMuMLPvT83kAzwIi881/vwNVQumxnXv27fr27DTqQrHqAh04yk5h2/E3Zqu352MjzIX5yes0GtIxh2waSlEqFD0qzivy0Vsh+Vy5ln7baMuEOV2hZ5pdIG2ByNpD2wE/P/joZI60JPy1LVnb0VHA6zowXUxg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(261102123227099003)(261026130827099003)(261026140227099003)(261026121527099003)(261028144727099003)(11063799006)(261022075727099003)(261022115727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261021135927099003)(261022113327099003)(56012099006)(5023799004)(10067099003)(261021130227099003)(18002099003)(22082099003)(261009223027099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L1UWgcQBCqImUKn3JeGlCyy7q1pHYV187YoFxisNC/COoRU0DsLOEvaHI/v28VcaF1D+AumULClmkV/9t4Ye+YY3TcOdzxByN+ZMMQywayl9+v1J8fGsPh8eBGC2AHAqQhHmI0ifr6MlexzTgF4JQcWlZWDVRGUdg3R6ZhbHLJihhY5wrVIJ9BAIioHVFZFJ2rOF/nj1FskyuJOMToGSSsFhOrLyS1hcY/UPB4ZlX5OLVD3S9KBfVqQSbkLFviTXeIo/GI7xEpoMivvFqePvDMec+ZPm0GqD7HMktj0yCBdSf41Yz7fOth8CND14Lhbftkjq3nvkw3RdDcYMnvSKWgzAsAT+3czskNJ84dHjV43OhlXHK51Us+Rwj++zOgGJJc6z+GBUuFlyKoCc+macyNvpIkVgbtNyp9ZQECuCJkfhC+0S1aBuE1RZnmldf/7L
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 13:18:06.8721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6492b587-1e16-4ab5-2549-08df463f8cd2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6180

From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>

The debugfs PM API handler declared u32 pm_api_ret[4] but passes it as
the ret_payload buffer to zynqmp_pm_invoke_fn() and zynqmp_pm_query_data(),
which unconditionally write PAYLOAD_ARG_CNT (7) u32 values via the SMC/HVC
transport. Size the array to match the firmware call contract.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 drivers/firmware/xilinx/zynqmp-debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/xilinx/zynqmp-debug.c b/drivers/firmware/xilinx/zynqmp-debug.c
index 36efb827f3da..f7751912d80a 100644
--- a/drivers/firmware/xilinx/zynqmp-debug.c
+++ b/drivers/firmware/xilinx/zynqmp-debug.c
@@ -325,7 +325,7 @@ static ssize_t zynqmp_pm_debugfs_api_write(struct file *file,
 	u32 pm_id = 0;
 	u64 pm_api_arg[5] = {0, 0, 0, 0, 0};
 	/* Return values from PM APIs calls */
-	u32 pm_api_ret[4] = {0, 0, 0, 0};
+	u32 pm_api_ret[PAYLOAD_ARG_CNT] = {0};
 
 	int ret;
 	int i = 0;
-- 
2.43.0

