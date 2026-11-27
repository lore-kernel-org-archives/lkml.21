Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795780163;
	b=ZogOdrWPQql71Hs4RP2FlaXVNolSe8UiGX48CUkaYkVeDvW33yt5h8l4ZpoKFxlT4sbv
	 ggmixXRjJADnX7L+aU4HUkzWwcSON5waoQdHZEzQnKdDrlTKHzdPMWkLtJo5HWZd+Uaip
	 aqv2rGB0wGTaeQQjCS9BaYGhHDcrlGVZEYkKhbVsx6epARW7y4jrWPhewksnB35bPHbJn
	 V/oMj3LB4X3bNkecDLqvua3Ctgc0P4Cnuq8TyAnrFZTy7E3hRDIzTZDamXf86abbGaf3s
	 HBBQRIluNq7+obziJe1ljpdx0+0a6gcXq8luoTNEmr7NK/5Q2R/MEBx8ETGsRjMb8kg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780163;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Originating-IP:X-ClientProxiedBy:
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
	bh=+M2NDpTAK88Z0LDqgM073i2PhmDr3pahaBfpGq1WpkI=;
	b=U/oybrUZDpbVp8wxSEjonUQQtXkKL72UgyZhEOvnFP2JdAjfwGDDcG9Bj6x36WpbN0gj
	 2cd//kYl3GsuTD6/GNSScYpA2TLPH61A+0DcRKIYUa2a3kpt1hZxAeBvfGVMNrQn3V6iJ
	 FTowX15bXarhd6OVqnJaBnkU6U9jav/nJ00hMZS9g4KteIDCKJ1rgdK8zV4qil8mFFMYH
	 YoswvgKaHlZZe95jkVHiXGEM5Ad4nl+R6RTSI15+EVXlrSmHp/ffJJ5seL8qG3+dbAEpO
	 OCeHRRO1bZFQc/1Bh08lEhnGcVmZFZagq7E0QQLTjKiqnu8QlfiqaW91mXOvECsniCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ezb9gxUD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.14
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012014.outbound.protection.outlook.com [52.101.48.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F56606A332
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29F56606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ezb9gxUD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1E/EIrHSTIxoVvHFqAJaUn0aBhF+IuEzh1GJtxdA3VRuHhTgbJl6PQmWXsgiK4Q1wOCaTE/1dahaSQFgg3Ynkw/4om3FJCwdlnLx0Wk4+eA1RLJBiVNVAgTmC65aGveXrkh38kQniQvfFXM2WaH4e6xAxWLikQCnsJelHchCTXcfpbB3LEVzbGPPhwyY16fHO6NfTK6VhKAf05zz/WDI+KhzXTIrZoRaJtG9OpOI6dwk5yYcuR3UWcaDpbjkVxS2z/OrFetnlR1En37RHQfHa9JN6SbRz91pmvKvnsSnck9XxsjtU1x9R/OK0wu8ELBXFgMFhi7+Qj4SnJ1aZev6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+M2NDpTAK88Z0LDqgM073i2PhmDr3pahaBfpGq1WpkI=;
 b=EyP7J2USiFpd4vfP6WOtufI+mnG6hqhNv2hvy09D9CKosNcbeErHRe1MtQxa+SLiVblFh0iufdS1fgJRMdUodZumF0oviKLbnf/I9+sFio35/XSi5hOuYNwAq5xuOSqWH0AyI8blq5+RbX0w+umm/djQTXEP+ZtCFbI1MuKwZeRkiJ2sEGXyixIEyRFRzz4IgQDYuhloez+DgxFKClywYM8ctWd8YReizGieUtMfV2FVRCGrneok16av4Uctrw+m9Ezl7A7EYwa30Z7XAN8P8aC8QaQoEj9VWIy5Avab3AIuoaHdaTaGF45IrXU+gv0SglZEvfL4HsBFlrBX3R+JAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+M2NDpTAK88Z0LDqgM073i2PhmDr3pahaBfpGq1WpkI=;
 b=ezb9gxUDTAjDqHhgtIW0B7lPu695X92jAt0eQG2pqfUlNM+Nz2AIEcSVumRnvu3yj2wbWkm+9GTYYSNrRpwluR3F2t7FXYPOeKnoStCT1q6AsXvrXDawuWsWi5q91trmSGZpLEaxj5A++Tl+E+h79L2o1dLEyxmcPDAKM8Y92yo=
Received: from CY5PR19CA0030.namprd19.prod.outlook.com (2603:10b6:930:15::26)
 by DM4PR12MB5844.namprd12.prod.outlook.com (2603:10b6:8:67::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 27 Nov
 2026 11:49:20 +0000
Received: from CY5PEPF00000E84.namprd05.prod.outlook.com
 (2603:10b6:930:15:cafe::46) by CY5PR19CA0030.outlook.office365.com
 (2603:10b6:930:15::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.11 via Frontend Transport; Fri,
 27 Nov 2026 11:49:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY5PEPF00000E84.mail.protection.outlook.com (10.167.247.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 11:49:20 +0000
Received: from xhdlc220225.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Fri, 27 Nov
 2026 05:49:16 -0600
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: Michal Simek <michal.simek@amd.com>
CC: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, Ronak Jain
	<ronak.jain@amd.com>, Aravind Thokala <Aravind.Thokala@amd.com>, Harsh Jain
	<h.jain@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>
Subject: [PATCH 4/5] drivers: firmware: xilinx: Localize firmware version caches
Date: Fri, 27 Nov 2026 17:18:38 +0530
Message-ID: <20261127114839.1428778-5-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.16.0
In-Reply-To: <20261127114839.1428778-1-jay.buddhabhatti@amd.com>
References: <20261127114839.1428778-1-jay.buddhabhatti@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E84:EE_|DM4PR12MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: 51020ab4-e46e-437e-f359-08df4c7c794a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|6133799003|18002099003|22082099003|11063799006|56012099006|261022105027099003|261022075727099003|261028144727099003|261021121427099003|261102123227099003|5023799004|10067099003|261009223027099003|261021123027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	IiVzZtaUQsX4RL1CYt1cyEv94K4lc6l7xfviL4iKndh2/KjZ4Dr9TRkAS0gPvbljym5uKvCxsgdfGHQdfdKl7y9j/uj9ykr3QFWBw/ZN5GVrQcKR7FqxC/T0f7FUVqMVg9t9AlfMB4erXlSrA2fY7QLPXGvYQkrCHw8SHu1ah4ynW9qd/GcxNRKR9DKpx7XYYo39fkSPr9xWFllhI7Qu3ObQ0SQJQfpLTJhWf30tztJwouGKLUMUt9FeOgxf7uUF0OVReEeYs66safPfhqEvSfLQFITWAMhmQ2tZPIo+OeFqvdZmkFvtSGi6hgUic+dc04NSPGWqu69VLzzEA5gUAKF5EaaI5YFqTti5wYvJELBBrLFfjASt6tyFBZB7xJEWpFb+31FZZnpjkgPgU0Nq/f2UGZLNZZmfTbseZ0jI02FuCR2F4ivocdNP+Ms0NXazIPQJyahdoRFNzkWZGVWfuv2IZXnUs23qi/FQ57iR4ChoMC57r/ZJ3WRiaric4cY2kzQ59aOPTLtONcWXfNdDddbpZXppWpH1XVCmo/4F1gMm2PQiE3//UToyJ7n5x1ridQOFzefhmsy0p80Lde9H5cyBUgvrpYglHxHSUB0zv91mOqzGjL4l1VEjp/pDwzyColxAO1A0s0JM0EqVyqPJeqsIJmNEvXMUAhCDSFCRlPElO8Ym/3hFTMijUAHCnI9Fm2k9c789Fn/dEDdkYAeyQw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261028144727099003)(261021121427099003)(261102123227099003)(5023799004)(10067099003)(261009223027099003)(261021123027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mIUiLLVaBISzQLBWLR5XbPu+1LZGLXg9cGGKXx9zHI3QNtX9jQTokz763rLJMQE4eK2zRuofW+/vgMiqO9LG6ko+HrPVc1/pBmj2J0T4dwX3kuowRW4PY6ELDZKAw4TQHt8XO+5pi7++jgkGORxSMmaOzueBK5AKetiDOiUPr9k3/Q7hQV1SF9ioAv1d68x03eqhVgwSq+VZ7uTn4nAjJZ7r+QKlsOeNiXuycAc154mT+V1SFqnez3DKCFp3KRXnmZdxXRyWeNh1jUeRHibXbTBzZpZWIY8VqvSWMCubdvD/PUD0tCZZ/5rnHnBjxZgl7gCGLJIG5ZgBZFKaCH+8Lb+C4PfDRgrwiUg09gs8n9Mhh9ryfcKULtw4QWNdAM6L1K1f4nzNMywgLJypehFMvu9DfC6oeejqsNzXN28ZrBSL1zuJ1qXLq3eSo+7ph40u
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 11:49:20.3631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51020ab4-e46e-437e-f359-08df4c7c794a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E84.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5844

Keep the PM API version cache local to its getter and populate it after
a successful query. The firmware probe now keeps the returned version in
a local variable instead of passing the address of a file-wide cache.

The firmware probe is the only caller of
zynqmp_pm_get_trustzone_version(). Remove the unnecessary trustzone
version cache and keep the returned version local to the probe.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
 drivers/firmware/xilinx/zynqmp.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 619ead2069c5..374d39f34480 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -488,9 +488,6 @@ int zynqmp_pm_invoke_fn(u32 pm_api_id, u32 *ret_payload, u32 num_args, ...)
 			  smc_arg[4], smc_arg[5], smc_arg[6], smc_arg[7]);
 }
 
-static u32 pm_api_version;
-static u32 pm_tz_version;
-
 int zynqmp_pm_register_sgi(u32 sgi_num, u32 reset)
 {
 	int ret;
@@ -512,6 +509,7 @@ int zynqmp_pm_register_sgi(u32 sgi_num, u32 reset)
 int zynqmp_pm_get_api_version(u32 *version)
 {
 	u32 ret_payload[PAYLOAD_ARG_CNT];
+	static u32 pm_api_version;
 	int ret;
 
 	if (!version)
@@ -524,6 +522,8 @@ int zynqmp_pm_get_api_version(u32 *version)
 	}
 	ret = zynqmp_pm_invoke_fn(PM_GET_API_VERSION, ret_payload, 0);
 	*version = ret_payload[1];
+	if (!ret)
+		pm_api_version = ret_payload[1];
 
 	return ret;
 }
@@ -616,11 +616,6 @@ static int zynqmp_pm_get_trustzone_version(u32 *version)
 	if (!version)
 		return -EINVAL;
 
-	/* Check is PM trustzone version already verified */
-	if (pm_tz_version > 0) {
-		*version = pm_tz_version;
-		return 0;
-	}
 	ret = zynqmp_pm_invoke_fn(PM_GET_TRUSTZONE_VERSION, ret_payload, 0);
 	*version = ret_payload[1];
 
@@ -2178,9 +2173,9 @@ static int zynqmp_clear_pm_state(struct device *dev)
 
 static int zynqmp_firmware_probe(struct platform_device *pdev)
 {
+	u32 pm_api_version, pm_family_code, pm_tz_version;
 	struct device *dev = &pdev->dev;
 	struct zynqmp_devinfo *devinfo;
-	u32 pm_family_code;
 	int ret;
 
 	ret = get_set_conduit_method(dev->of_node);
-- 
2.43.0

