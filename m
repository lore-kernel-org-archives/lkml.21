Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795545571;
	b=MLo1T0qmRuHRGkwvKEBouc2nIgtjAJ3V6C+ntpaOa9xgyaj0oX4+l04MuPD37PoSIvY9
	 fkzWM3BdRWToinu13i4HEFa04mQhoNcjU+Qie/aZz4Wu6WP/dACiDpC6PzowM/YDuLnFo
	 87ZuVtBt6s4eXc0DPk7lHIr9hVFMjZu5u1AANIqVVeFbblnmrs6+P4TjwAjv4YPWiA7yl
	 iqUXs9t6bS+9nfByP9xrc6T4ToBxotuR8wupvrI2dJqdV4Wp3DfM4Wd5KE8OfF8sl+525
	 XXmo5LZjmpgsGHdvl0pS0OfEGCKPIJC+HJkRHizZyFloq3zAlHclk4mRvT0Gg+pxPUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545571;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
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
	bh=bgy5XjjkALoDzFe+PXNnhgyb98yMo1dw4iQi3LTBzl4=;
	b=LocQaKp4F2QyEeqi5trwwL/pd/kLxaqT+F8a97+jBuwLugZLHBTr+hGS+Fh9EL3LKW5o
	 OAZAjK++deRjkdukVaHBseyeSgf+VPmWvae6+Y7hNegQLU2xVy8WWGE97NnJkeZdr7jrn
	 WPujbu1XQkCW6jzQqsSYJOa4oyPFgqfmS8E/HL20ELlvHgyxSV+nBFqLbzUnN1ch67u5H
	 ohj1OrP5O1J8d4z+WsGTIXYzRJp+lcn/iCW0ntv02FVrx6sH8/Lr5vKn3Awlux6y6CozV
	 4PEUZgg2Vyv/iwHb9dEcfdSteCke4/5aYnglKtm6YJ4PHvkpWFycLqb/BiqX7AurvgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MvApR0Ub;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.12
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012012.outbound.protection.outlook.com [52.101.53.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D15606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D15606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MvApR0Ub
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMQD8Cj9FipJCZEwtBRkLIts9DCpUzjXfGfhQBVcRo8bE6aLqLq1/KfO4i4ZOAKY3tyrpOz7Elk9VA9/3vyWjYHrdmkyRQyqepABXj5cMuTK7uqzkBwfqm3DTG/owDB5RSJKIuVbxtDISq5AsQr9hufB5xjboXyIx2aIfTsW6nt1SitAzp3i9gvJkNuwbShg27CmQ7gOH5EhgD+XvuM6EkgbuCqEgQtPfiqVI8tLjjw74S9B6FT2pl7pJC+s+wW72h2p7hhSQJA377tbVBF0Rm+mqndv1INt+48vEUiBXdClE/Pf8dBbJ5Eewl5QALBCxkaxhaddqjR6EB/u5nXhyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgy5XjjkALoDzFe+PXNnhgyb98yMo1dw4iQi3LTBzl4=;
 b=n1zvlfTnLWBpRfkkQX5SIeb0/0OJbPT674DgYMYNGMrUPrgo9HBFbWj5ommtPN4+6ut9zIBX9M4fbhIC6gMFp3Ef+w1VTDqfVmm40rEu5aCEWsT09cBFSpnq2tMEZVEkMIw6zACFAxccHIFHcJYAYDdoyJ1PmBUPZfFOMJ070JJFGfiwC/X553ZREFJ0HBlimVOUkCYy+RfwFA1ETlOQ4NUClVTm0W7jhcDz38AJ3MIY5e0m7/OTr+g0s7DXxsmk6GCa+stNuvEUva2g7iZWM8hcMq37WFkZ1CGKoAJmyEzXIv3QPnW/HxIFWTYRwCf0D5zGXtw9BkgXGExIW1Widw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgy5XjjkALoDzFe+PXNnhgyb98yMo1dw4iQi3LTBzl4=;
 b=MvApR0Ub+rizmBWwIBg568biSHBHt9oS3z+S8DnvOHXhNBqA0SFz1hdQERSaYqRrVnm68bwhRz6BydLCXt7/Q9JrKUPfm1ZHyrFqS6Zrb77LXl+W45zP24krUFI8FkN/xizNVPf9f6E9io5UqPOqRaIkeQ/A7YKiOgCXpxxA5CY=
Received: from BN0PR02CA0015.namprd02.prod.outlook.com (2603:10b6:408:e4::20)
 by CY8PR12MB7268.namprd12.prod.outlook.com (2603:10b6:930:54::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 18:39:24 +0000
Received: from BN3PEPF00022BC8.namprd05.prod.outlook.com
 (2603:10b6:408:e4:cafe::43) by BN0PR02CA0015.outlook.office365.com
 (2603:10b6:408:e4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 18:39:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF00022BC8.mail.protection.outlook.com (10.167.248.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 18:39:23 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 12:39:22 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 12:39:22 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 12:39:21 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
	<dri-devel@lists.freedesktop.org>, <mario.limonciello@amd.com>,
	<karol.wachowski@linux.intel.com>, <max.zhen@amd.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
	<sonal.santan@amd.com>
Subject: [PATCH V1] accel/amdxdna: Reject zero length user buffer entry
Date: Tue, 24 Nov 2026 10:39:14 -0800
Message-ID: <20261124183914.1955667-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC8:EE_|CY8PR12MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: f80c4618-9372-40a4-11ab-08df4a5a425f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|18002099003|261009223027099003|11063799006|10067099003|56012099006|261021121427099003|261102123227099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	cEIF4q42qJRsGSlHYL0QvjXSI1a8wDRDhkzy6CQDFZ7pXz5NyqiaGu9OFR4i8TLiZAVVyOGkbC/4PiMdeagTjIJ4XDnpZRv1mgYl2EdtX9YiZq7qtjgCi5IvGBW2tb9jyr8NgXwtukbVt2fHxbSLdw8E4uLe6Ziq7285hTCWX5z4svEGPfkBokslEfBmSpyi2uS5oOHkaiHakePpHN2IPNuDAvYOkdHoYoHFJM9qo8ZnW5UNub5u5V4DcF/6BDRrhLTQzpR75gMquGquWUiyfG/Lnk7vun0fSds72MYnhKRrujkADKI5dCpkcTwMe70gvJshjpLNxLFlOwqI6XCbax9QIERqYfRMm3NBD0bcETm2wy56wtSF5kSvXrDsHyDURfWLlhcqvLCB544LMK0TGJkH8fYK033t5eI8Fj13eHKOLM1jbudnnM4APWjWfHEgZcXWeKfctAsCfrEGGX4WTgXboYOZBd0+apNyWHmdAuY7oKk/Mo9GvpNRCx3IjZbDJwFiRocXB2aMR9hG0W3sdsrJGSmN52nFG66R/1bGxu+TvBpDy+a3bql/rFqjtPb6aYlHr/5B4FK5AKbvPmGdalQEXXuV2n90lynExhb9DY/IXDCvhKYZBqr/+jliGpCEoZIi4g+AVgJiE0NbyfYBrDbkZz857tdJHfMlYtqpMYndM65N+71n3RyNfr2elhERg9qrUIoOloKQUM+Yvhc3KQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(261009223027099003)(11063799006)(10067099003)(56012099006)(261021121427099003)(261102123227099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/98ySDW11dQzBCpqoIYhH27k5WicQf8DXkf5ll1Lb65iAXxMHLW739jf14k22et7xY54hEeRmTy3HleFyuAXHI9qKaa66m7rWgwxW6HTynDQKCMNV0KdyfqsXNMzeKV0Fg/i0PFjq9uEsekpgcG/OeqHhHj5dPBfy5iPAdW+8EIDed8K1vIz5f+PciqvJUC+VhzKNdTk9Qag3kwklRH7OnPS2I2vUK6VGxzLiLhtlwuCy3t6GHfrR+W2Z0GWTg1h65zrLueT0spQxFR8TGOr7EMKQ9L1DIYtN5ANIlo9wVuk2cOw/Sw5OZUQzhVa4mr8jBMGPT9I91YEh6qyv9q8gKwodYym5vgTJpZLqR8Csq1Pobcz3Sj78VsYcUUko6wDsEXllv5xDvo5OpOag2kmqIJfM24DYuwxGLspo97TF3TwG4bhEQ7tt56F2CyFJf5d
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 18:39:23.0359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f80c4618-9372-40a4-11ab-08df4a5a425f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7268

DRM_IOCTL_AMDXDNA_CREATE_BO with DRM_AMDXDNA_BO_SHARE_DEV_MEM takes an
array of user space VA entries. Each entry is validated for page
alignment only. A zero length is page aligned, thus an entry with
length zero is accepted. Such an entry contributes no page to the
buffer.

Reject a zero length entry in the validation loop.

Fixes: bd72d4acda10 ("accel/amdxdna: Support user space allocated buffer")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/amdxdna_ubuf.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/amdxdna_ubuf.c b/drivers/accel/amdxdna/amdxdna_ubuf.c
index 0e0cd69cd1fbf..93b2b6496a0f7 100644
--- a/drivers/accel/amdxdna/amdxdna_ubuf.c
+++ b/drivers/accel/amdxdna/amdxdna_ubuf.c
@@ -111,7 +111,8 @@ struct dma_buf *amdxdna_get_ubuf(struct drm_device *dev,
 
 	for (i = 0, exp_info.size = 0; i < num_entries; i++) {
 		if (!IS_ALIGNED(va_ent[i].vaddr, PAGE_SIZE) ||
-		    !IS_ALIGNED(va_ent[i].len, PAGE_SIZE)) {
+		    !IS_ALIGNED(va_ent[i].len, PAGE_SIZE) ||
+		    !va_ent[i].len) {
 			XDNA_ERR(xdna, "Invalid address or len %llx, %llx",
 				 va_ent[i].vaddr, va_ent[i].len);
 			ret = -EINVAL;
-- 
2.34.1

