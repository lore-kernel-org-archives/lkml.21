Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795692505;
	b=Pm1KMdx3jWotqRSd5f1jmjQ05X+r+s+yj9Aj0hu69q+Hm5Lv6vDsqMPR0LdYPc2Lqi4c
	 7FxOyD3Shc4qukvExViBzLkcZP3qH9dS43mk3iK6HC9b0+FpgckuhwKDiBDj3u2j9AvoG
	 Y4XU0wpPnLxjNG0RWxPncEyUI1sicXQnwgY3h1Vp6vnle+Px8CyHVCDZ07FMV6VP8HB0/
	 IaSWajDfkghaBi6gh0DylLobGPuQJRu0YSUNHSSQxYikzH3uChhM1SVos3UbANNgZ+BnY
	 7TudhuEBfjF5m6kbSDUA7taEQmboYFrOe2//aaAiEGg3me6pK8BJjDnPpLAVoZc6r2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692505;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
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
	bh=UCc4VFep4IEKwOk9M4oKJyowwijB1wqwaF7WgKf1WAs=;
	b=MtrTObppUirr6piD/969ql6L+xWl6eBMpZkSxOuYJuylGiPdXWpv/VIhotzEvSkQY45T
	 qMq5HPI4Vf+ahK4QSY2BU6f3wzghJimLGirFxnGzskR3CmVRejHg9apoDdL4CgTS8P3jy
	 GytkEBENny+H2CStYsyHbSDc+gX6FKzLsFmCZKQ9VZPD/fvS4fJKuyW0dH9nJbszHZUZp
	 NtAJtXY26hfsKm5Uo6hCdYq7RFrxWUHF1Bv4p9VrTsB8V3VHAblx4lZPYUvVsru4R3bId
	 XO2Q2SnUcI329iK4SNhq5ON4ISp3c38hF6k8U4y/d0bT+Yvc7Iq/h18dm8OxtcAPdDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gCA6Z8AL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.53
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011053.outbound.protection.outlook.com [40.93.194.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6710B606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6710B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gCA6Z8AL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLd8z7sTDPsnL3Yl+RrsXJBsNadMKHtKV+eoyiMACw1Mxlx/PX9+rBxBxEeFsHylKcvxkrlbDnPOyOoOjrKSyc7nIDKHSArT2/aXp2CjTd8M8o7tq7KSWmB6VFGaCU6U7uaKldIJk7yzcUxGkJ425rrZtZQQa+wISRh7w8q+gYhBf471u5gE4hNVaLlke5oH3rzc6jVyV1ggeKjc2Rqn5cbOpFdtuWGuMdMZkG6TYC7HmYJicQ1gPbjpkdDqSc839S2lt+fdRQOQ4zUt4LvQ3XhBvAC3vi9du0oYvH0Lu02CXVMuk82aqMXECiDrdELW9fz9HwxnXPnnDqBU5723Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCc4VFep4IEKwOk9M4oKJyowwijB1wqwaF7WgKf1WAs=;
 b=j4OnCmc0WYHkUdmd+ij8d+wOhM1KY/s8L4zindnvirALRDUGMyqRWiPFihfe3vQ4bKFv8vO/P7O/jhAcJrtiu7yGtFr7RC8+AWK8aBj0+ZEB7b4V05NsGvzX1bGbysQ4Eu0GNIqZ/8XSUPJz82Sn6Mxoyn0Kuu5KESLHGHVf/+LaSq8CVNzPdvXGKvMMhGqheeq10DfUDKBlCcxALAljIseZ72CtlZW9TvpS39OsTXVwDXgY0DzkjeF0w1uxlqOgapTpho2u30p84ZhHgQj3QCJdS8PPumfIj7z/Rbgq/JFwoxbanGYM1GjVnuSsexb3r9riA0q5Q+bydxnwoU0qMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCc4VFep4IEKwOk9M4oKJyowwijB1wqwaF7WgKf1WAs=;
 b=gCA6Z8ALDAiAikIdOdxB1P+GyPtnNrx/x4MvW17KD5DmqSZ70VYn3KdUdkYMoWsPzRe62T2NfqElMWEz5k7Xj5Q88uoLyuieLN//H0sNHE+epBsxpn152Snhs43Wb/yYcpN1fY34tO2V5dZB0J4/Vo5VydVy/9oNBO3tAMkcq0c=
Received: from CH2PR20CA0028.namprd20.prod.outlook.com (2603:10b6:610:58::38)
 by PH7PR12MB6396.namprd12.prod.outlook.com (2603:10b6:510:1fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 11:28:22 +0000
Received: from DS8PEPF000000E0.namprd05.prod.outlook.com
 (2603:10b6:610:58:cafe::4f) by CH2PR20CA0028.outlook.office365.com
 (2603:10b6:610:58::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 11:28:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS8PEPF000000E0.mail.protection.outlook.com (10.167.23.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 11:28:21 +0000
Received: from xhdlc220225.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 05:28:18 -0600
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>, <ajay.neeli@amd.com>,
	<sai.krishna.potthuri@amd.com>, <git@amd.com>, <linux-kernel@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Jay Buddhabhatti
	<jay.buddhabhatti@amd.com>
Subject: [PATCH] MAINTAINERS: Add AMD Versal2 UFS firmware files
Date: Thu, 26 Nov 2026 16:57:54 +0530
Message-ID: <20261126112754.907756-1-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.16.0
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
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS8PEPF000000E0:EE_|PH7PR12MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: d67960ce-b61a-416f-3911-08df4bb060ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|261022105027099003|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Do3DsH97l7yNRTjsYK5U+7XgHhxQsOYLaJyKxCbRVkXZwFJdzoCJn8DqL0hslhxDJwS4Q5XLZ4eVK8iL9BhxU5CRP4W8zRRzsZwD8LPMdbLwV3dUj67/fAAq8mG8kKKLadpwsed0hHYi8Xz7dW5evH/nPRYb4lMacgDSZ+nYjkX5SqAO95CGIm/VeWAVdZsvunfWDvNu/8u9DNgs+jGANc+Z5TA32C1RDhSCoK28zHIMtsyDQcfvgIRiCdXGazIEnzY3DHRBxhzuCpV9JZ453N8oJH/u+3fAkFMdWQWQaS+8IHFv8EnzIw3xCmvHWbRdAwv9sv0LLylef/DhWVshnjn255RnnB2UDsY9hW5QVhsN1RS9i+ZabA9uitoxRejog+LsSEDiSHus6+Kl9UMBcRxDPFObI2Upknk8BKJfETH+e72xRXGe01y4K+BP7scI2rxFZpGhgS4JYoBq6ipwJzP9im38KhUXQW69sO05K8gnlpfqI9GZWfl7+B+6rW8QDXc14YfkQzlQbGSeKX9CAht9fYHYvIAt2M9BP3NFLHF8Id21v65sH4T30becoJxWRCLpLDkXmA1uOCA00GQrvZXPeley12nIGDMZ3DYgBZUUVLiX3nrHo2Bq7/AKEtlOqFuix/1jkFhM9kFFgrLsanNtpfg0WXviuWLPOzf/oCiqjxAMWPtait+t9QFYa1E4RM98Z665gFVhALefXeOhLA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(261022105027099003)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MOtqP25PE7wXjMCgSwgbrs7dMB2m5kBEiMZcyRjmwiUt8N6mM5Y5015ZihRE6+3G0UbJ9z9tsMvhuBdlKyh/Jq2RK15p0e63Zhm9knyFYCLM7woU+xB4XulzaRlYeLfllka5GHUJpCLBEmDMm9PX0eQFqG76JXjruegKgGKmlJKpiwa8wwb0whrELrOkSao09ht7rYZ9Zq6nQEdAW2sPLTAz6kIFqtiLabBvOyY0QIPFz+sZaqnRLhdii+QrSkaKuM51TBTWS9eO98czJ0b62wCnyZNOXXvHilJbtVudzVuM3TB0KOga5iavesO1peoaaiMgYhS+HzBSmBPWpKOxMBh/PtNE3/mGe9X5aY66TyAv2qczTvn8zaq8g9iZ/gNyS0IFkpPh/vjUuYeNzPwpipz6D/1h83gCT3zrxOgD5GKR4LxJtA8WahLtIKXxe0BP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 11:28:21.7391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d67960ce-b61a-416f-3911-08df4bb060ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS8PEPF000000E0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6396

Add the AMD Versal2 UFS firmware files to the existing AMD Versal2 UFS
host controller entry.

Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 742c4e6b291f..3c0dcd9feb94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28818,7 +28818,9 @@ M:	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
 M:	Ajay Neeli <ajay.neeli@amd.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/ufs/amd,versal2-ufs.yaml
+F:	drivers/firmware/xilinx/zynqmp-ufs.c
 F:	drivers/ufs/host/ufs-amd-versal2.c
+F:	include/linux/firmware/xlnx-zynqmp-ufs.h
 
 UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER DWC HOOKS
 M:	Pedro Sousa <pedrom.sousa@synopsys.com>
-- 
2.43.0

