Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795094276;
	b=Rj/t5qj9Jaxbu1o9QBDb709HCy4vO+AR4TiGXL7tjHs47Gt3vD/HRbTK+H4ctgKp4FvC
	 1E9Bc/5SMEvyAAB5MNT9eNZq8XOmilf1BnGRSZ6tE3cdlz4ievpRYlDfCDMKF9WeNuzw0
	 3pNS3EmDPS7cBy3cNJ7OF8Yo17569Kgwv+DWf06By8wJU/PYSXxo45NmzanaYWX+C35ef
	 6cXyZLgpSQT39MosBz2pJGgC4ljMrFlS82Z6XLcFRN+Et5aBhKecapq+6v+aK/G0x1d7T
	 WB6dOOKPvE3upDdtZ/8fgXBq4dWbcm70C1bPb+sS1TmPxXDIyR6zy3yCea6WRg6C8wA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094276;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=1imU+HZSc1C6nJ4dNfnINLv0o8s059Gje2Ks/mgYZok=;
	b=FwKLtCeBTfRV1vA7/OZJa5kqejIUdKS7o+AYI6jRMMiZIX6R8k4Z5EO/6iqBX9ncZRpK
	 P2S1v0r2gCqMElkPbPANyED1+TNbwVMU00BAabB4Lk+NAIQQ+DkHcbL3DyLNYIBU9ueFs
	 dlNMTkN2c/7Ya4J2UIhQuqGnUeZfdDzQtq85yhUA9PjBKBJzFJKveV0v/0zWXe4Ac/2YY
	 CVO5XQrR/DoGH3CZoCw/iOLyOqnRLAP9C6eqCq+LNdbUzAMsQ+mAfOi3300glm/i9PAbS
	 8apdO6gUh8qrZds8GVKEd16GCVzRUAQCNClR2ILXuy9vMZ1u5wPs0GfBcmlJl5mZSXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0SwLF8nW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.70
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011070.outbound.protection.outlook.com [40.107.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168A360A2609
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 168A360A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0SwLF8nW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/b3y18s2uVak8WVfyaQrWUUEFUwprkvWSrxXunBguLUZdDuPS6t0k88FE7EeiNE34e4ju0xVxGqD69A5s0j8bEypMxiQZoMLLH6Qo0N4WYlJcX+UHwcd6yGjhZQIrkbczTJIkF7t1BmGXtyWvlgMsEPwvD02Xd5mUoL3ykKP+WM4SjQE5EBD20jDiKVNDJ0m2KRmJqDpJC+Vb5qRTVDDqoGop0Ig0B51mKWnfUJ9rvL4/bHa3CPF4CJWfOyS3g8y+9oQRqg2Ou78K7TjjaY/8QFwj8o91t9M8s5Ld30quxp9KoesTUJOmFjzvvbViFo5X55DJ14FnwFqtYHp3XV4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1imU+HZSc1C6nJ4dNfnINLv0o8s059Gje2Ks/mgYZok=;
 b=Tf2kctV8G563bW7cYi16MdleQFqqawp21O9UPNj33+kYLGHtYPLnFbxUx3SFOTZDwzo7qmM+BbCm6vPKnhgKQd1fOYT0R5HNT2rQNIR88w1/uA6mEBky4CYcRF56MDZn6Mb4BRuinADNo58UyH79oqThbl+3DsvJ63KczUsiWcBvfoTEJ3NcywJwhu7sXbFBVzDJEN76pvZw20MdLIaUQV1/rWfBa1+WWx6o4ixqrht6o5CKKFx1z6TjsDnhDXTRv154xtCRB7/0P5xEdWGR7HbGJ9d/DvSh4P84jfcYd08uS7PRbsoiZKOqqqFgFShbfCmp1PW0ZNmxKM8P8rHXUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1imU+HZSc1C6nJ4dNfnINLv0o8s059Gje2Ks/mgYZok=;
 b=0SwLF8nWcgGgg1sSL/pxlJswTlQK3FiXiM44aCIc+yBPtsl+pwkDXvEMPOIh7ZUcER3uMlfkSk+6ywYn6TaHIOZX/0E2m/6RB2+JfmBjdngVU2HzvKmZsyBsKMlLBHMu8g4cP5K2Cpu5r9qaI/gYwldIfd8/jMfiIuIsP1HhieE=
Received: from CH0PR03CA0212.namprd03.prod.outlook.com (2603:10b6:610:e7::7)
 by DSVPR12MB999172.namprd12.prod.outlook.com (2603:10b6:8:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 13:17:52 +0000
Received: from CH2PEPF00000146.namprd02.prod.outlook.com
 (2603:10b6:610:e7:cafe::19) by CH0PR03CA0212.outlook.office365.com
 (2603:10b6:610:e7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 13:17:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000146.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 13:17:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 07:17:48 -0600
Received: from localhost (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 07:17:47 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@amd.com>, <git@amd.com>
CC: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>, "moderated
 list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/6] firmware: xilinx: Call va_start after pm feature check
Date: Thu, 19 Nov 2026 14:17:26 +0100
Message-ID: <61e18f7a0929eb5d16569c29141ef2a7b75aecfd.1795094242.git.michal.simek@amd.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1511; i=michal.simek@amd.com; h=from:subject:message-id; bh=x8QACq4tebrBpU+csBKTf5v6pNWhd+EP61uFtvDSDyg=; b=owGbwMvMwCG2mv3fB7+vgl8ZT6slMWT9+/ahv9M+utSnQVmdd3eg0UNhB8VDsXqFx198tmxcU D9r5q3KjlIWBjEOBlkxRZbpTDoOa75dWyq2PDIfZg4rE8gQBi5OAZjIeQuG/x5akxZuiDNuN+3n NV61P+bK/hff3K+kdM/jV438M2G18TlGhnPaWtXMVvuneFu+6PPdYNbgfC7n/OH1/1baZKjtaKo 5yAkA
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000146:EE_|DSVPR12MB999172:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c76f0e7-3aee-4755-d6d5-08df463f841b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|6133799003|18002099003|22082099003|11063799006|5023799004|10067099003|56012099006|261022105027099003|261026140227099003|261102123227099003|261028144727099003|261021123027099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	ZWBKhXl4olbR+XXRSpvRLxfxwaICfstOdCkzCr/zr4geMOw/7azW5kbxWlKDHSHvMNvs/AAePqH1P6/wG3p26QmDu7reW87TaqX63a6P2a/VZdWm4IvyEt95rzDDv17BeMHkh4PUUpuXUaRAIw2NvffksYDfMLkQbAShW7RaVr1TOPB157GnyDejzOfocPkV0DmYZxcix2Lp0QEUz7QaxS8IjH9iQY2SPxsnucsz4YvRIl5UsjJ1NZrrwv+hWwDezlLyP6Nid/TpHI5Ao9ysH2A3Ba/zjayGUUzukeKsVgxthAKAG4Ga9GvispSpMabnsMgWfWdM3MK3Irlv7I8vLm678lk2vOjueiitAnCpLwL0tLhX7NIESkzGjS10VatwGolF6CUQSKP14Rlyarh+q2Z5cWhnKAVfK3IoRV+X0JrQ64InzHWRXZsWbVjXAwNa5I2MsFho9+7Vx3Rvbk+k6DSgGgr/0I+OjH//v8HyVOFMQp59yT5SD2cSX7onaEMgfz7YYCJ6LEoaAHsYqSz27QpkQBXbHCF5n3LdyiKf+fQj+CSYhGEchCoARjHguSlel9x6co3TJ4fBnTii/CrA4yh4rrCsge1744aexWODg8W7PjXPnHVzo/5ZEm3zvsy8RzeoHzc7cl5yEJSZAOY6C+N4Wq5S6OEc6G4yGjX+lcEmL7JgoUbujDjhPGdysoMJpCW14uU7i6hnp2ilA3Ef/w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(5023799004)(10067099003)(56012099006)(261022105027099003)(261026140227099003)(261102123227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tHo8EgxqU73gd4ohCO7SHHG6YCB7klaIA8Ba0dP4MNV2Y86+qNVK6uBVrViIpIJUpaCMZtnhk5mIC4s6yCQfawJC3tkdzy7uvi4YykruMNnMInBcIVA5MKbrzhJ2W1Pglqq/Tqp0hrueDy5JSVxpHF7WYt4/khpRCZStXQCsvmtnfXUHZLLz3YvxU7grOnkP4Qs+Nbnmf8zaaDx5MyAMGo+K0KtqTg8YXMJ4N1x+6NB+ScJKfraL9ZRwaiNbxq0qBMRmCtweNjfY4nfgVRGAXbtIHzDi9TrRkYPXrQA10ToBpRMTOeVG3K7uivDWAal/7djcBZnpiSAh3xyanVLPdawW6sWUPcYqoU/GeimviZT8GQM6h4hX1qsHCCit3GlkNrpcQLnsb/rbK82lt3rvXcr5LA/HpD7hkN2KLUpJZTw+RFDcWDkqy3BWkN1YNCdp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 13:17:52.2595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c76f0e7-3aee-4755-d6d5-08df463f841b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000146.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999172

There is no reason to start to process va_list before calling pm feature
check which can still fail. Call it at a time when list can be process.

Co-developed-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
Signed-off-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

 drivers/firmware/xilinx/zynqmp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 22ee6ccdb02c..a0ec904b1819 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -391,13 +391,13 @@ int zynqmp_pm_invoke_fw_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 	if (num_args > SMC_ARG_CNT_32)
 		return -EINVAL;
 
-	va_start(arg_list, num_args);
-
 	/* Check if feature is supported or not */
 	ret = zynqmp_pm_feature(pm_api_id);
 	if (ret < 0)
 		return ret;
 
+	va_start(arg_list, num_args);
+
 	for (i = 0; i < num_args; i++)
 		args[i] = va_arg(arg_list, u32);
 
@@ -454,13 +454,13 @@ int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 	if (num_args > 14)
 		return -EINVAL;
 
-	va_start(arg_list, num_args);
-
 	/* Check if feature is supported or not */
 	ret = zynqmp_pm_feature(pm_api_id);
 	if (ret < 0)
 		return ret;
 
+	va_start(arg_list, num_args);
+
 	for (i = 0; i < num_args; i++)
 		args[i] = va_arg(arg_list, u32);
 
-- 
2.43.0

