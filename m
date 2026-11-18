Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795044746;
	b=3o2l0UoXsgN3z/gSF/DvPNV1rXdkqssk8v41Dt2XHaUYEaAKvp6vt8gtFJRNHClXl1gr
	 mC3YfKx0bsdUg0AqHcuQVImjudXAC99TkP7vlGK9Xadc4I+lmSf/rIGM3s97IIvPMSHuC
	 qs76n74UKLhhz/aJBVNiAaGIgPV7dtwqtxNK9NXwH+4synREIEYDBeB0c95BbQpL+ihtp
	 aTqSYmj7rAYYjoPbucnErv0eH/vtF8M3r+eKcnKfnXa3GmD09fXD99L9QBJhZWP7u4juY
	 LvfoWx37I9YuYGFtJyEaH7ntaUIJ1BgW76/KkBev9k0VP3ig79mJtWDA94gs1E51G2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044746;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=JorPTiacwS74P1OKvh5U1c+yCkBeFH5wY6zitGMy7QE=;
	b=XPGAuU3CK4wfbGek9sfGYSc1e439grXjx592whZ/yPMKSTA140hJe64oaGN3vFaOcQW+
	 ma6oDpvkrvFmrRoyl71xpABjjKr0zAXVjJL2tTP05HQ2heYpigaZQOT6kV5YeecXuCTDp
	 3q7S7Rzlgj9QF6Q8qkn4dYFsjedLrkKOHafvWC2RM0fFFAl2LmQz4kUHgkyfgiKMjrR/b
	 ikyIczwLZwgWai2ZtFLX2avivhM3Mk37ukXNSdQ6xIKXVFdUbYgxBtzYkrcO+jcUHm1Ug
	 h2Z6kkSg/hR8/WxbvgRtf2qQhXa0sgqicOB3E/5JzvQwMW+5Lio3lTazNDX+148BrjA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fu9jL5m7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.34
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013034.outbound.protection.outlook.com [40.107.201.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D29D60A2619
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D29D60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fu9jL5m7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIQkWJU5CgY7izHFbYPFkSaHxWk6LdCq2Z9pdfv5ZMhtQSQf9VDiSYMTrccWkVaY8Ios559jOuI3uOrE0vqSp8DS/e/J4IZZUalXmz7+tiOGnhoSc/UZQXgepy/+E+nO1YLC72OeTTI0VNbuyCmpLn433KdWG4L4bkAxqIQ0f+YdCiAL8ieGCr6Lv24lSwDI6TcGJfVu4XtzJPafoAIHsVwXrCDi5YR2VyYGyXDNHl+6s9K50r4uDNBWhmLlNwxiutrskG+svPtH7/9Vi9i2L+RLzmgS4W/zTjUo8HSWeG3eJ+iSkV8G7xv72rOJ12EjqhLMug1aMWC+DlMaVLCWwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JorPTiacwS74P1OKvh5U1c+yCkBeFH5wY6zitGMy7QE=;
 b=o2raEEu++/T6/9ONBjDLuYZe/xEypi7yAqDl+a7EyQmdgzRy3nsWcbbpsZN3d8ZN6LJBSjVJixwFq02wJ6DxsgNfgqUZU9PkZyLicZpiORJDoPe6H5sA8h9EcOdlhJgk5twQ0WevJOPnfXfs8H3IU9MNQGXtWn0qhuOp2hwEzpS+Fue0VxSLnDFwRJZghInhGFTt42RONKgQ2yU0TYrM0EKaJEABDVW0VY2znC0uUGxVrNR9FK+ltiDZtgS6fUbMfyFIB/DumKM1pWrfiJfmU9A5muYKEvIQbGoXg7zGxG27x+RsDhf91UwA+15If53rz6/naqTPp9OynLPyAxqruQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JorPTiacwS74P1OKvh5U1c+yCkBeFH5wY6zitGMy7QE=;
 b=fu9jL5m7Mry7XJRrMBReXufv8Ta6eS/ie5dpoi+FxzeX4BH4hPDntqvw7W6PJSROSzyRkAffoLcut9+XM6BzHnbKZrJuHhE9xXds8IcoilGKwMfHWLIz5wg+3I5gHzaOLxaGzg4dwTc7MzuxwoX8qbWJTbVQIFL8Hle8XsbX5jA=
Received: from BL1PR13CA0145.namprd13.prod.outlook.com (2603:10b6:208:2bb::30)
 by IA4PR12MB9811.namprd12.prod.outlook.com (2603:10b6:208:54e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 23:32:21 +0000
Received: from IA0PEPF0000003E.namprd03.prod.outlook.com
 (2603:10b6:208:2bb:cafe::7a) by BL1PR13CA0145.outlook.office365.com
 (2603:10b6:208:2bb::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Wed, 18
 Nov 2026 23:32:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 IA0PEPF0000003E.mail.protection.outlook.com (10.167.249.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 23:32:21 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:20 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 17:32:20 -0600
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 17:32:19 -0600
From: Gregory Williams <gregory.williams@amd.com>
To: Michal Simek <michal.simek@amd.com>
CC: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 05/15] firmware: xilinx: Rename zynqmp_pm_invoke_fw_fn()
Date: Wed, 18 Nov 2026 15:32:01 -0800
Message-ID: <20261118233211.4121361-6-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118233211.4121361-1-gregory.williams@amd.com>
References: <20261118233211.4121361-1-gregory.williams@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF0000003E:EE_|IA4PR12MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: 11deb09b-3155-48c8-6bf6-08df45cc31b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|261102123227099003|261026140227099003|261026121527099003|261028144727099003|11063799006|261022075727099003|261021121427099003|261021123027099003|261022105027099003|261102130727099003|5023799004|56012099006|10067099003|18002099003|22082099003|261009223027099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	sElF/Lf4+BBDJk7wiK7TRyxvQVSlgq4IDsh+zkv8BSO+Gsne81SkMHSCFW5aQ2tknEDXScZl3YxvwT/2ln8W7LaHX8J1sY+C7WS0rwJWk3eRIBCAG9IaxtQtCA/EzXZdxmJ4A290WzPfor3AU9D9bWsw7kRDvwKZ28FyqrWXqfoHnEFZ0LE4NhsyPLrOBlA51kUfybRLVOmStJDDkA35nw33bFeQxwYEnkKLIwsFTa4DTmtYQ+ToApG+bDaH5Uh/3Mt8LTPblwY0L6ZqieE3hlU19HDbykwvdg8bROHzNKspJj6Hz+tE4GXhuFIUmVHsMrhVpW4ANOF9XdZ2dgXETbsvUZ26WxQWE7vUxFO5k5groShXZoW/u9BrKuksp/Tb8uOTYzAoxyFznct8BLd2h3TR7vSJjN9OeTgH2b4Yc3b38kWdkLFQPdbRSvKrjlZcapf5t2dxUHohZYSgJjvc9bPi5hkhBKq0ORAx8nbpDBklwL9RqgvI5gbCk7Y40MuH1sY+nGFGYuVZE/m4tANXOgNl52tBSO0mQHdadm+sxZy+kaJk5HYGVBjcm7aACKJF45hTI6OGbuBmoVheBsKvXzS4uqafTqgpvP2oBL1DxyT5Xg15aW27VO93of7me+2VNt2g4e95fGBnQSGvD0OfUzlXB6x5cjkU1cZ/3+BztNkK6ESuDSSQMB9O5LXN+EX2IEJqeNSomEEpm+F8MWxw4g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(11063799006)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261102130727099003)(5023799004)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	01pXQi2JR3srvYKhZ/vUz/moVv2OHhz8UG+znLvCAyWB4qb7s+8o31v7PhRXs5W46NKbdZyb+UzL79cKYYprHFbbVpo9RbxOTHEnOxU8zXg18521fyXiJX5SCPeT8/HPbf2nF06USYYX1/gDItt/mXWhHyTDPkdEoKQLeGI0RhCHhL7IArGCkixD+t3IOUewoih8xplv6YQv5xCS1eGCXmGNgtwNGeUAVjNlvyqRRVe9rJFCJQTIrVn71IRZVlrha/kwJnM65Tpa7iZom++bZHX1lMR6UlM9Em9MLv7R386OuK8xRr2ZpX0A2A+TvpnTiJDxnxsMlQKx8atZFHb3QF32iPHJJySrrfWPjp7dXyhmaJnft7j+VRkGFNj38oLR5ULjaP9i7lTCoLf6nVv71OyZsRUENeupJDFXNDOo+l3Exoc2DfHoeXeP4roVOpX8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:32:21.9105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11deb09b-3155-48c8-6bf6-08df45cc31b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	IA0PEPF0000003E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9811

From: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>

The function name zynqmp_pm_invoke_fw_fn() doesn't really reflect what this
function does, so rename it to zynqmp_pm_fw_call_extended(), which reflects
which firmware format is used.

Signed-off-by: Michal Simek <michal.simek@amd.com>
Signed-off-by: Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c     | 10 +++++-----
 include/linux/firmware/xlnx-zynqmp.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index f5ad99e0026c..709370933741 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -440,7 +440,7 @@ int zynqmp_pm_is_function_supported(const u32 api_id, const u32 id)
 EXPORT_SYMBOL_GPL(zynqmp_pm_is_function_supported);
 
 /**
- * zynqmp_pm_invoke_fw_fn() - Invoke the system-level platform management layer
+ * zynqmp_pm_fw_call_extended() - Invoke the system-level platform management layer
  *			caller function depending on the configuration
  * @pm_api_id:		Requested PM-API call
  * @ret_payload:	Returned value array
@@ -461,7 +461,7 @@ EXPORT_SYMBOL_GPL(zynqmp_pm_is_function_supported);
  *
  * Return: Returns status, either success or error+reason
  */
-int zynqmp_pm_invoke_fw_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
+int zynqmp_pm_fw_call_extended(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 {
 	/*
 	 * Added SIP service call Function Identifier
@@ -796,9 +796,9 @@ int zynqmp_pm_query_data(struct zynqmp_pm_query_data qdata, u32 *out)
 	u32 ret_payload[PAYLOAD_ARG_CNT] = {0};
 
 	if (sip_svc_version >= SIP_SVC_PASSTHROUGH_VERSION) {
-		ret = zynqmp_pm_invoke_fw_fn(PM_QUERY_DATA, ret_payload, 4,
-					     qdata.qid, qdata.arg1,
-					     qdata.arg2, qdata.arg3);
+		ret = zynqmp_pm_fw_call_extended(PM_QUERY_DATA, ret_payload, 4,
+						 qdata.qid, qdata.arg1,
+						 qdata.arg2, qdata.arg3);
 		/* To support backward compatibility */
 		if (!ret && !ret_payload[0]) {
 			/*
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 681ab99ceffc..58f2e3fddfaf 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -578,7 +578,7 @@ struct zynqmp_pm_query_data {
 };
 
 int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...);
-int zynqmp_pm_invoke_fw_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...);
+int zynqmp_pm_fw_call_extended(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...);
 
 #if IS_REACHABLE(CONFIG_ZYNQMP_FIRMWARE)
 int zynqmp_pm_get_api_version(u32 *version);
-- 
2.34.1

