Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795013387;
	b=hG8vExoesi2aeZauNtmr2v4og4jWOHEKQXsLr8Lwaj1CoGkc3/MAQxZK/oVIkhzxi/66
	 zngqQjLExwmP8x4DYfqlvgSoWG8YTMX3RNZwbrUaIzHynzOl43JvqcM19J7j4ZImF5FJE
	 EIZ8zeufSZvEQ8glkE4EfkYh8KMOk3Y83+RIfGyO4y1E/XOdnfTSHYLetPvO0GoNDTy0I
	 Pfg+e3w1ztn5HNZP5uV8f7ENVU3S3OlDdThLBzgg4wmeDFaQp3HO+5pFVRysnRp+KA/H3
	 Urn7LNas+/DAyq+aunDHI85JC5KqxKQCq7Cy3JUaOEllPcg610wvD/ooViT/foM0NVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013387;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=VlKg3D4fFbSwzdyJI9bQLHAmJpxgP2OcFfGXBZsm5/w=;
	b=ENm9PiH+ntQV11N718ObMDPNmHQTwxTMks/51COD/J616LwO76ZAr1LjNeqLCewbIsiR
	 265uiJ/Vq6wxr0EJjBcES/I6zGd8elkZ80z+9N8dRVGPuSNvZYcPTuXbVjVid6iAW4lV2
	 8oIMHZIEaKUy0gPEpXUtTm8gE2YVc3DlGmQxVo9zkuW7HCjPnRh4zd5GQidEaqI9+AJBh
	 BybOLQskkxM1Qdwly65eLBTU1wV6ip0+I/NVIq7p0k6qV3xIEZZ2FkXc56xk0uSQp2xwU
	 pwFaXi4EvzPJHGk0RtWtBMr5o7O/Xq0rK3+KMKidLJCEl9OyE61PafwYrBvcfalTnqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5C6Hft2H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.21
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012021.outbound.protection.outlook.com [40.93.195.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E745606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E745606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5C6Hft2H
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytAaxHV09biIlRddyG1gADAgzLqrV0YVN6zKP73rextPWekW3ZgVozgMXZO71w6aRuxwuN1z1zbOh5IWKac5PsqWiOqFCnumPPHyY8OOC92mmwHlP4GOKrkAyaDU3+WpFlk3rsDwDEV+fqHvG5vlSHN6pABp/ogs1/VKn8guKS4daVpnMVqHfDglS+KAoBY9Uz/D0S0uB84u75I8FkKVKHTTP40QBLucx5gACpqvG6KteEuJp/AP1QHdpl2Gx8jl8JYw1tWARXVhIGgrkgdAnAkJ0tqkxR5YPHjeVsSuBtnlrfo6ADOddyplJhP5EXxKX8yEwnw9oQJO4pfEIsXviw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlKg3D4fFbSwzdyJI9bQLHAmJpxgP2OcFfGXBZsm5/w=;
 b=JIzQ+CJr/wToyJNWIB39OXkq5knTWfpvQpasWpPpnGqU3phLWE5lfPmtEWH54+z84fJvouEBIAq102BzSUAqyFpIGyDkIkC5kYBWwXP0tv73jsfuKeGcchXkRGlCiePoGC8SXkeNl+9ixaQzLS/N7u5pzAy9/qXDb8EFuvd5JHxSfMOJ7BGYyzdGIFQXIpaj0YV9LOkOzl7cwfJohI/B7R4CSDvEFJXKYzZ9Ku1O62w49+QMKVjB2Xu0zWXfA+IGJdfmsFauzbiJg/nh4buiBZDe0zMSDXyyUEZMRkG6zwRuhxAnDSdoHsYpGaCu7PK3t6YrNirjh6GVGXlPvA5udw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlKg3D4fFbSwzdyJI9bQLHAmJpxgP2OcFfGXBZsm5/w=;
 b=5C6Hft2HACtcY56roNBFlvlekeSnizEeMiQHJKNhzl2HYM6kAU4DxQJO/hT7ueglORgTD0Y4sqf9DKPk+n91e1rh9uOxcSX/ADztwWUp3s9iMAamJ0z+eXMOr1oIi2b+/8S3hv1xW/CdqiIeI2DF1FP6yV1GYBORsE9V/uuS9XY=
Received: from DS7P220CA0122.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:25f::6) by
 DM4PR12MB6010.namprd12.prod.outlook.com (2603:10b6:8:6a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.14; Wed, 18 Nov 2026 14:49:43 +0000
Received: from CH2PEPF000166BC.namprd04.prod.outlook.com
 (2603:10b6:8:25f:cafe::2e) by DS7P220CA0122.outlook.office365.com
 (2603:10b6:8:25f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 14:49:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF000166BC.mail.protection.outlook.com (10.167.252.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 14:49:43 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 18 Nov 2026 08:49:41 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
	<amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1] drm/amdgpu: use a single clear entity on some chips
Date: Wed, 18 Nov 2026 15:49:22 +0100
Message-ID: <20261118144923.1100-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166BC:EE_|DM4PR12MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d22a2a8-1d78-4973-deb0-08df45832e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|11063799006|56012099006|261026140227099003|261028144727099003|261022105027099003|10067099003|261021121427099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ExuoEjkwjvjxJMhtMxewxKsmnnAr5HLfypeu7SEffG08Lvzfq2WUvl5r3vaNiG94PKlyHPwLM44JzDhCgpXlCYt6hcTto9BMja+HAtG6IxEQIkE04zO9sKXONNkYqnY+ypEDgLidsV++fWuQt7WjjLjLickGPC5PK4zAK0rmlEUWlbyyHcgmjJ4osh10ZwvBK5bSkaxYN3dFjgBdgKZixK3iqEHX711beYO0hROQUZeB99PTFRryfsjuJCoj+PF4SlX9wD+BnCYIFBRdPZThQ21CuEom1/D78PwIDeXIUrRwznGcslhXREi6Wgvo0TO6Iz+RqlzFKHl4tdDUskTkg/gxkW3ulW8PPDpV9S1Cff0ki1A01Ykt3RM8bQ0+EQ5c0j+EWP68N9E1xRJskemqqmpCr+aTxSVm8r4UlJxsn/3Yttl0rZV7gfjpk4Z4CadgNpAcDskmXmk+hDrnkzRzQp6FEEgVqmUAK6Y6h7oyirzQq+EHbyWeIXEPuk4tHIi070MAaZvwVcEkYXlcuJtMkz27GAW3EWBXqvxwKCkNcgT7pgJu5Q/RBaqBa7wiLv/5pe78g2M78lqMpdZAqR6bwdQPdzFRKsbDqnkF72nALPuINiEb/RY8gsVQGjvbxyDu3gADbsL5IXKwFt9aCwsx7wX3c4w82YtHg/2FXyPi+O8egRHjVcbiF8CV7St4WqEI0bxFZ1cmdR+ncHscJLgTSQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261022105027099003)(10067099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aUCoUb8yhcH7AZYJ1H2M2zoWHr+Jb8mEbMicax5EGDAly7c6tDmSMOP/JWjKNyFd5PjpE8mCrfCYGT+jwxWWqwnYtftvJKUr4nepZShaTSe0X6vXaAqoCKw60vZfat9AogQnLAVc7lk38SkdHtjyLHRAcra5CqVRaxKd/AYwXGohqVOSEdtLhOXiA/E+bxh9cLG2NrmvvyaiM35LaoL1jzAOgj0Xjvd47M+6mF7R2ztyGVI64rb97rOsqncjP9Kurv2qWs2edzMuHPndkzLMVgPJgCWFw7VQzbO0104sUTSDDVCZ3DKZqJItDqxpV5YaqOXnboPdRR38iz+YdqyPws8T4nimVplVfVjGug0Z2vqhZvscIB9dzGlnRG0HGyzLc1wxCJWy36XF5hN1A81hDDrli9NpvuuYfsJPNl+lcl+btWuyZmWiZ+hQ1xbMgTMu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:49:43.4044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d22a2a8-1d78-4973-deb0-08df45832e97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166BC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6010

Workaround to fix failing tests until the root cause is
understood and fixed.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 8dfa92967b63..d5c1d044403e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2411,6 +2411,13 @@ void amdgpu_ttm_enable_buffer_funcs(struct amdgpu_device *adev)
 	sdma_ip_version = amdgpu_ip_version(adev, SDMA0_HWIP, 0);
 	if (sdma_ip_version == IP_VERSION(7, 0, 0) || sdma_ip_version == IP_VERSION(7, 0, 1))
 		num_move_entities = 1;
+	if (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 1) ||
+	    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 2) ||
+	    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 3) ||
+	    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 4, 4) ||
+	    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(9, 5, 0) ||
+	    amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 1, 0))
+		num_clear_entities = 1;
 
 	adev->mman.clear_entities = kcalloc(num_clear_entities,
 						sizeof(struct amdgpu_ttm_buffer_entity),
-- 
2.43.0

