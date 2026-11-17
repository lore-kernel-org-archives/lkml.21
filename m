Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794943329;
	b=j8EQnJL4/V+wRDi+K9Ljy/TdN2Jisa2xgdnZotwXeYejPyPIurhZE0GgEHJ/qwm3BkR4
	 Lz1XBhSGNJzK8KKfRcta0irVbYChV3trbi0dNerK5EGcOC3PN66YJObpgtuBIITp96Fq1
	 /E63ZLbMKwcO5/vCyiE6vIcFzksxz5/vx8tZNwh1qROMm45ULdk7WzBWgki+/Lg8OM4tV
	 dIU9U4vx3UTPnE4cnDirUhilxlOzL2w7nu1HIC8olAuTCG9GaMnjk0ncalj+sN4zd6TSM
	 gERMjCrOOV8ffA3xJhxPx1DwImuFJybkAbrz7MkTUxkd20Ddq6n99EeXDjycpk5B1VQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943329;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-NV-OnPremToCloud:X-EOPAttributedMessage:
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
	bh=kwYuNq0rsIYYEoPTyeYHqWurSvztOd8SDHfNmb7huB4=;
	b=WHCgb1WHNgXg/LyEIlFr4xWovK5fYHpN/awLJFw651Sn0JmJv8e05qJXrvLQ9JZRI8/+
	 jxoCR63RVEpSUpz9D7FTL2UHL2kwLjkcX6VQcZaYpS/WLZNwVerXMAeZUDc+AyjJ5eNaq
	 Vq+Zlp5tGk1RFDIa6UZTABSe0dKUVicA5A+NH+C6yVPzVWZ0bupVXhFTcoUvkrbAswn6i
	 TxKkXZG6p0mwWjVUWHPhqCY3jWl2tG8IdUJNB3cC1On8jClWadGsZREILNlJhqkK5Jaep
	 S9e5Ncudr1RVy3JLnTflweVnx3w+AXxTsLrGrrvO7pA58sGsly4cY6pbigCG17Y0FGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jbyqLA3R;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.36
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012036.outbound.protection.outlook.com [52.101.48.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8137F606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8137F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jbyqLA3R
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4sX6hsGP0sPrYkCvwauQyfuBa8tu3LR0AH4R2WLsHMn+c5miWl7h2WVNmAQKhTeeBAlAYZBYcp1pcUg5T5c73bdvNapuENLbdrqPVOHA9gRwZkETrZQJFMkWaQWmltlFET3cPp0p8BvF39yJI6hoZ+IMNl1zTCIGAZZhILBC6s/tKW/Nm5Ox+w1hTNPkdVl0wrSNVli2sOtzzBDrxisANwgi/kvHdBl/6blkzzRYse7oRxdKXrt1CiJYT6zwTZHW+ZnY9cyu71dLF01Ka7bwItC7k8ezO81eRpFm2Pnytkhwjln6a3ZmJSRdedmWcegIBA4uG2X78GAaTOOsOtYqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwYuNq0rsIYYEoPTyeYHqWurSvztOd8SDHfNmb7huB4=;
 b=lwuCAUc2eyojwSoWrBsg4WMChYVhP7wSBiTiKwuqL44hSNb99n805MJ5FR8WfpYUsPWIV3arU+ZknNLDLo0CCy/iCyXcfWTZy7n9eTR4j6126rrMcWGqYHgZFVMGv+00tmPnirri70KU37L3i0QkGSsRJJk7OBB6uWRXplgyW4ThafV7DNzjTO0u+QV6BpcqAYYO25zq66B9+oSIJs0nSJJ+SyLhd9gaYnhJxktIGIO6nLtF6R1ErnmXk24H+CiPQuR7YzPE/BzPxtt/3mdYLkhgloUl0mgsMEboAR30M7/36vqciL++zPIH0J695OVHtbljZG8vrIjyUQO4B70A5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kwYuNq0rsIYYEoPTyeYHqWurSvztOd8SDHfNmb7huB4=;
 b=jbyqLA3RRrdArb1l1W6vfuFJTqCzwJLQqiLy0hx488qmkUC4Z/mj3o7HeLDRH9nW8gCDGfpaLijsIBL5cb2BCV7goUM6RISwuJbDGjQhFBQRhB/IYhOIcYEt0zRFbj7gW2ODGKg8nWij/h1eoDT6r8PihBF8xw2r/0ATll0NTSwWD56u1jmwXeKOyI8bIjUg520TUjuZsepMaBC+WHNmRF1Mj2dYuXxv0jID9MPexYDt9ElBxBNOUOe14js26GV/J84vEMnQCBs/BV3vD99irX3WJxYcgucbXOqWE8rebxIRqTo5xItOCxmhF50YBejl6rR3E5de76fADlkRD9dQvQ==
Received: from BN9PR03CA0430.namprd03.prod.outlook.com (2603:10b6:408:113::15)
 by PH8PR12MB6722.namprd12.prod.outlook.com (2603:10b6:510:1cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Tue, 17 Nov
 2026 19:22:02 +0000
Received: from BN7PEPF00000097.namprd03.prod.outlook.com
 (2603:10b6:408:113:cafe::94) by BN9PR03CA0430.outlook.office365.com
 (2603:10b6:408:113::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 19:22:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.232) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN7PEPF00000097.mail.protection.outlook.com (10.167.245.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 19:22:01 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 11:21:38 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 17 Nov 2026 11:21:38 -0800
Received: from Asurada-Nvidia.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 11:21:37 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: <will@kernel.org>, <jgg@nvidia.com>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <praan@google.com>,
	<kevin.tian@intel.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <jamien@nvidia.com>, <kas@kernel.org>,
	Cristian Prundeanu <cpru@amazon.com>, Breno Leitao <leitao@kernel.org>,
	<xueshuai@linux.alibaba.com>, <john.garry@arm.com>
Subject: [PATCH v13 03/12] iommu/arm-smmu-v3: Make the ASID space per SMMU instance
Date: Tue, 17 Nov 2026 11:21:20 -0800
Message-ID: <e38a53f480df8adff9ce15ff068cc8cd37b68b0d.1794942324.git.nicolinc@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794942324.git.nicolinc@nvidia.com>
References: <cover.1794942324.git.nicolinc@nvidia.com>
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
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000097:EE_|PH8PR12MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: d4eeb71b-8977-43a3-cca6-08df44e00eae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|36860700016|82310400026|261022105027099003|10067099003|261026140227099003|5023799004|56012099006|11063799006|261021135927099003|261022075727099003|261028144727099003|261021123027099003|261021121427099003|261026121527099003|261102123227099003|261009221227099003|261009223027099003|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	x/C2BYcm9X8OE5aHv37KdALssQ64ZKzVK9QALs+AeuTi39SE9X6AcrtrMTDfjc/PhnVEKoAEVWV8+yz8KD4Pa/u2FQfKc3Zr2e13RBaGE0O3kb+tO7xsowECzUEdQY/SyrWyyKG+Du7lkiyl3gQ4YxoJCoBc82Sxevcc3jxBGE71taT6FKagSS1MuavOC2NVAy9Amwd8o+/YB2KKQZ/+WyfhIxcmxy1kTqpWFzKvX4GNnbUxpgx4X9wvZNZuDA/ZHSjGYvvvkU0aK9XJL+o6mhJzgPD2aBtKGD10hjy+zruGgVgmyyrlHUGsxwt6YAX2hG0lmAEMs9Fgnha7j76ej6btzmVJcwxdSQJvm46qIWrfRx1R6Yml27ewc3i9wl7yvJgPP+UNGNq8SKb96TA3977F8h4m/LUK6jxGsacVoUVz8Hgr9mTkEqMcl4kWzM+rk0tYaOnChsm2LsZZjQSaf1flkDTO92kT8pnnv4e+MhvqFgOC8VMC2gU8Ue+HorIiqx7R3zFydEPzENfu4xHAOXIzgzdrna3ojQFtfBib3oy4gWu87WPPECvpCKaHT6yC2RoTVJQOzE9HDCIBCpHzBhAyyN3B8r2rxsYbRHXaZ/dw6NQzryL6vA87J13hRDNT42VzYee54f82hCK/Ce/l3j4p+BSGyFIy3VHHttERuQxBkc8TH1OCUGWSLiy9STwiTSUQKKaFGW72C+dSSCGAjw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(36860700016)(82310400026)(261022105027099003)(10067099003)(261026140227099003)(5023799004)(56012099006)(11063799006)(261021135927099003)(261022075727099003)(261028144727099003)(261021123027099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009221227099003)(261009223027099003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F06agHp80JY1XK6/8JG4Di5IpIlhItanq/uqHsYkOMjUWgv65kgqEoSs7N3xJwUddO0Quu0RuoSSCezMxQxjR/nPIxh5KsMtKFegptB9BZVwzaV0aZf0rs/PXO0y0F0jrgi6x+aF6ZLAP1rD048oFja3YbmTxjErgHwnwg34nOCLziz3Nb1cyomhIqsmlVbC5IJpBDcOeSVgYknUJRby5DhGpeiWuFDdDxbP4F8uhXv/JcsC3kgfCrq0AFJGbqpoqCoQhsQJN7q1S/HzOa0ddZzvVv+6YNr4EV3oJe2NnETIp1mqUEolllO54YHMMFZLDrmJf3JaxBCKtshiHOSeUjnVmbB4NIq41v9MCICTbmUFUQwKb6FNuHlpK/qG3s0hZd5JdPXe9bO4AZdCAjcooSya7T/si/DUElWP+xFPvepjDLjel4bMe5YEJEz3iWiQ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 19:22:01.7759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4eeb71b-8977-43a3-cca6-08df44e00eae
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000097.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6722

An ASID tags the TLB entries within one SMMU, so two instances can use the
same ASID without ever aliasing each other. Yet the driver allocates them
out of a single global xarray, which makes the instances share a space that
the hardware keeps apart, and lets one instance exhaust the IDs of another.

That global space is a leftover from the BTM support that shared ASIDs with
the CPU. Now ARM_SMMU_FEAT_BTM is never set, nothing looks a domain up by
its ASID, and a domain is pinned to one SMMU at the attach.

Give each SMMU its own asid_map, mirroring the per-SMMU vmid_map, and clean
it up with devres, so that both of the ID maps get the same lifetime as the
SMMU device structure that holds them. An upcoming change will need this,
to reserve the crashed kernel's in-use ASIDs in the new map during a kdump
kernel's stream table adoption.

This also eases the BTM work that Jason's working on:
https://lore.kernel.org/linux-iommu/20261004162219.GA4064@nvidia.com/

Note that arm_smmu_asid_lock stays global, as it serializes the STE and CD
updates against any ASID change rather than guarding the map itself, which
does its own locking. Giving each SMMU its own lock looks possible now, but
that would touch every attach path and belongs to a separate change.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Reviewed-by: John Garry <john.garry@arm.com>
Tested-by: Breno Leitao <leitao@kernel.org>
Tested-by: Cristian Prundeanu <cpru@amazon.com>
Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  2 +-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |  6 +++---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 19 ++++++++++++++++---
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
index bb048e08d613d..8f2c0b1cc4a8d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
@@ -1003,6 +1003,7 @@ struct arm_smmu_device {
 #define ARM_SMMU_MAX_VMIDS		(1 << 16)
 	unsigned int			vmid_bits;
 	struct ida			vmid_map;
+	struct xarray			asid_map;
 
 	unsigned int			ssid_bits;
 	unsigned int			sid_bits;
@@ -1180,7 +1181,6 @@ to_smmu_nested_domain(struct iommu_domain *dom)
 	return container_of(dom, struct arm_smmu_nested_domain, domain);
 }
 
-extern struct xarray arm_smmu_asid_xa;
 extern struct mutex arm_smmu_asid_lock;
 
 struct arm_smmu_domain *arm_smmu_domain_alloc(void);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
index faeec656da9e7..489531e0027bd 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c
@@ -311,7 +311,7 @@ static void arm_smmu_sva_domain_free(struct iommu_domain *domain)
 	 * reused, and if there is a race then it just suffers harmless
 	 * unnecessary invalidation.
 	 */
-	xa_erase(&arm_smmu_asid_xa, smmu_domain->cd.asid);
+	xa_erase(&smmu_domain->smmu->asid_map, smmu_domain->cd.asid);
 
 	/*
 	 * Actual free is defered to the SRCU callback
@@ -352,7 +352,7 @@ struct iommu_domain *arm_smmu_sva_domain_alloc(struct device *dev,
 	smmu_domain->stage = ARM_SMMU_DOMAIN_SVA;
 	smmu_domain->smmu = smmu;
 
-	ret = xa_alloc(&arm_smmu_asid_xa, &asid, smmu_domain,
+	ret = xa_alloc(&smmu->asid_map, &asid, smmu_domain,
 		       XA_LIMIT(1, (1 << smmu->asid_bits) - 1), GFP_KERNEL);
 	if (ret)
 		goto err_free;
@@ -366,7 +366,7 @@ struct iommu_domain *arm_smmu_sva_domain_alloc(struct device *dev,
 	return &smmu_domain->domain;
 
 err_asid:
-	xa_erase(&arm_smmu_asid_xa, smmu_domain->cd.asid);
+	xa_erase(&smmu_domain->smmu->asid_map, smmu_domain->cd.asid);
 err_free:
 	arm_smmu_domain_free(smmu_domain);
 	return ERR_PTR(ret);
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 5cabbe5652dc6..d5938c624c68f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -90,7 +90,7 @@ struct arm_smmu_option_prop {
 	const char *prop;
 };
 
-DEFINE_XARRAY_ALLOC1(arm_smmu_asid_xa);
+/* Global lock serializing the STE/CD updates against ASID changes */
 DEFINE_MUTEX(arm_smmu_asid_lock);
 
 static struct arm_smmu_option_prop arm_smmu_options[] = {
@@ -3015,7 +3015,7 @@ static void arm_smmu_domain_free_paging(struct iommu_domain *domain)
 	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
 		/* Prevent SVA from touching the CD while we're freeing it */
 		mutex_lock(&arm_smmu_asid_lock);
-		xa_erase(&arm_smmu_asid_xa, smmu_domain->cd.asid);
+		xa_erase(&smmu->asid_map, smmu_domain->cd.asid);
 		mutex_unlock(&arm_smmu_asid_lock);
 	} else {
 		struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
@@ -3035,7 +3035,7 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_device *smmu,
 
 	/* Prevent SVA from modifying the ASID until it is written to the CD */
 	mutex_lock(&arm_smmu_asid_lock);
-	ret = xa_alloc(&arm_smmu_asid_xa, &asid, smmu_domain,
+	ret = xa_alloc(&smmu->asid_map, &asid, smmu_domain,
 		       XA_LIMIT(1, (1 << smmu->asid_bits) - 1), GFP_KERNEL);
 	cd->asid	= (u16)asid;
 	mutex_unlock(&arm_smmu_asid_lock);
@@ -4741,6 +4741,13 @@ static void arm_smmu_destroy_vmid_map(void *data)
 	ida_destroy(ida);
 }
 
+static void arm_smmu_destroy_asid_map(void *data)
+{
+	struct xarray *xa = data;
+
+	xa_destroy(xa);
+}
+
 static int arm_smmu_init_queues(struct arm_smmu_device *smmu)
 {
 	int ret;
@@ -4848,6 +4855,12 @@ static int arm_smmu_init_strtab(struct arm_smmu_device *smmu)
 	if (ret)
 		return ret;
 
+	xa_init_flags(&smmu->asid_map, XA_FLAGS_ALLOC1);
+	ret = devm_add_action_or_reset(smmu->dev, arm_smmu_destroy_asid_map,
+				       &smmu->asid_map);
+	if (ret)
+		return ret;
+
 	if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB)
 		ret = arm_smmu_init_strtab_2lvl(smmu);
 	else
-- 
2.43.0

