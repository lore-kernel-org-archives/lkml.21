Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795142178;
	b=HWWoZF+raH9QjQ5lHPPH/yfrK+DTI+YJckI1uMfRtLo9BMkJdij08/fTdSPIq45h4D3s
	 0GZeAwPBqTW8eF4pcgRexbJii3QFDBqB1QipC1Hx/nYXF3X8ELbJ4ODJHQWH1I2QF9Agh
	 LRGjrGN8jIr0D5GSmJwTusYKqs+Y6vpmzDeBZzewmKfVH5vBvuTycbjnYOtVJctKarSzb
	 3hDoVZwrR4swt4G6zX6V6dreNPcPEhZabyhu2KuF6JWVXzQMz6sih1YrktVpsZGAyYQ8v
	 XDB+06aa0KijlBbGJxhkmpS/DsV5hLT0ejC8gBYDBssxz4vNj5XXizMwzDNZaIBuApQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795142178;
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
	bh=6HNiTxFvfoUCPr4e9tvsdhmnMKPupztmudlbX8ci/3s=;
	b=CLi8g/zw57HbKQURWChUHm/u2TLx/Gxcii1gA5qr8SGWkFh0uugU4StLway+zqS/69iH
	 DYacM+2dqTw76lkb40IKfB8Q/uRs4DzTqw0aqtyYQ0/dWydjXglQ7kaax5WIITWcRmwZ8
	 UmioR5rpLIRGdEeG9v2HHM70UIXRiMCGkx+xfC0g2cMDv/B55EbaAC4XJAzLmkzXAmYSj
	 PUvUW/2ijDuxQcYYWPADNAjlL+KjHoVIUZ2FfIhKRO9GdyyNQeMhdf8q1qLb/XDgak+6O
	 OidzU2p6jG+lpEizDvcDMUjf3fCfzyAFSyfP0u0wZ20ZGXaGtKQ6SawlQVC5WtGKbvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5O5vTBk7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.45
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010045.outbound.protection.outlook.com [40.93.198.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6112A606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6112A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=5O5vTBk7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjrzKfM8tUYaTsprbhHzfXC6G2UQGCVlGCcw595YrBetdoAXCpnV4fGib+BmPYo7pvUS94RiNcyw+uUs13as+xgy1Qq3GaoFe5ZqFhAsAI9vo9XHedSLvZo2E/RTPiYeFJBKx5ey3ZGo+T7/x2sQ9nwwvecgG6OEZZBrm8lA+17t7NhJ4Z8UezAV/3kYUm3vEKXKYi1Od8S170Sv2WZuz1ljTRRh858zWewxqBsoHQ69Hm9hoYfUHGKwkBGHIG5XqOPo/x/CBc5kWMBmItwvpzfAE9snWpLBmIJ96EP+YW6P5Re0UjsQs1x5P7B1w6XiWYstQ730hTdRv6oJ16hx8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HNiTxFvfoUCPr4e9tvsdhmnMKPupztmudlbX8ci/3s=;
 b=apSkTEcskBE/fJVd4fbKM+U9a9ov6WP9r34CiXoZyX3Lrev9XRqq/EvUVysBlc5pygM6ENCg8jdUonIu5t1kjiZatpeOB0FZUs1l/1+ZN4NfmN2UGU2M1Eq4OlmZmXDXX+/Ox3NUpjlpJYCxD8Z9nO6PDBrSLUJPcCWuEagT3YuZU+T6BKNtyRD3SYMDDfwItFDRU9539DEcXMApz9s87r7iZE522sTHFIfPiG7qJ9sEXS4x3FlN5n/RQn4IZST7RhIXkq/KOrNNbre/CP/7IfNHLlK1rx6h3VSDVFlg/i/P7aGjkMzfWzdDHe8cbf1BM/yvbMmR215G0PTqe5SR7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HNiTxFvfoUCPr4e9tvsdhmnMKPupztmudlbX8ci/3s=;
 b=5O5vTBk70yEZbSPR00t+eodfi/69C29EOjo0Bv2rlmoFScHvRFaBe92Y5pV0hqz8+LrPmMkT0p7oc5MrT6jQr5ikin2e3ftIajeY9OuPDJmti16B1k1dxv2VeWTPY8sUxKJRp4Qf5LTi8rHRnduIGmvI6rcrPJTWp/gtCEUqkH0=
Received: from SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::14)
 by FT1PR12MB777854.namprd12.prod.outlook.com (2603:10b6:170:24::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 02:36:15 +0000
Received: from SJ1PEPF000037AE.namprd03.prod.outlook.com
 (2603:10b6:a03:41b:cafe::5) by SJ0P220CA0010.outlook.office365.com
 (2603:10b6:a03:41b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 02:36:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000037AE.mail.protection.outlook.com (10.167.244.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 02:36:15 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 20:36:15 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 20:36:15 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 20:36:14 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
	<dri-devel@lists.freedesktop.org>, <mario.limonciello@amd.com>,
	<karol.wachowski@linux.intel.com>, <max.zhen@amd.com>,
	<christian.koenig@amd.com>, <linaro-mm-sig@lists.linaro.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
	<sonal.santan@amd.com>
Subject: [PATCH V1] accel/amdxdna: Reject a zero sized buffer in amdxdna_gem_prime_import()
Date: Thu, 19 Nov 2026 18:35:40 -0800
Message-ID: <20261120023540.888381-1-lizhi.hou@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AE:EE_|FT1PR12MB777854:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f682e6-dd67-4d66-74d9-08df46af0cc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|11063799006|261009223027099003|261021121427099003|261102123227099003|261102130727099003|56012099006|261026121527099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	p6tYhiTDr1ykDYpvTPTJWZTXwM8Fa7qIcCitOedNajZ4LBQXEgp7EI+4aFkkO4lAI3K+Y6l7GyCjAAifC3hU8cygItPi4RoqDq24i/43LQEJgUL/DOf+imVtiAzJT/rrIoiv42gqeRTG4+DW/qzkyNnOimLVcv43ctKbkKy4s01F5P1Sdm0dRcyJei574YC6TSBQWpI7kCJEVENk8vmn70FQKRFbBoBbTg36L+9tp38k4SJxXB0fD1bgp7uzwFN5eZHikcg6+ugStyyf4PogXuVjXcWyb/BQvCcC8nZzVzorJ9l18N0+TfMM2XFpvCbwvQf/SMYFvXyj+15nG+5mf1YLSJMD3IfloHQwhPuHDnmTUyLFguSsufbrCD/HxCI7wgKXHI0H0PTf+aqWP+jc4xJMMvqoHsXjD5llp+1etQ6o5r7rma56qtKGcyy8yG6Up8WBBgQxdaeNo9gTeEm9DN/J8tF06qorQ/M/sNo/V9IPigMdsH+TMgzlS5lKne6oVJmX7/Q4oBSoVO3gH73by0WPjiOmYX4hpRH2erQjcKPXoHYbEcw+WH/+Bb0wa5Irq2oi/rK9KUzG078ibsmZGRYOGBkLMIoCknGRHCjqnifemHSnEOEP8HY9eg0Qg1hFl890XNazOp6aZShPp8jaLNx9foP8ZZVlvrcXUPwLF0jMtE6d/OK+Fz6C7Kd9m4YVU2pnUSobmIZj82+9fXjqlQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(11063799006)(261009223027099003)(261021121427099003)(261102123227099003)(261102130727099003)(56012099006)(261026121527099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1th8wmtUAxPoXuwNVKpJiRoDZ+BHWQoWwK1XbNLsrtS6CP+yhyYVRDSC1znyrElYh0ctOTexFhT5IqQqdblnGBINg37dk0hPclSzwH9gpJz44/j8l9uZ4psSj1Q5mZeHmHNsXvJcZHDWT8GTcoQYTq2LnEhmx37rv7d7uE+RBxAgA0jqgsB2Ckvl1Ig3/+i/r41eyjKQOzGwHd5COMQK8hjSpnJeJ3CXSboD9tL6soMV6GO+b/znfeEM9/GMS8CQLFallPBGJWNHJP+O83V93fbeacL4XRyVxgKeOXX3kISkOX+PB9lqEesJhvwhc/y1l1CXh4uV0ySzb0wb8hzNnFEN/ee35Drw8d1SfncLHcMwT+aLBVQJ56ORaMUyPbFfIhjOhnTxXQQ3LO6jAujw0v0ZjS9iIuxotAhASVSSBo8/zu6oTKxqirCo6x9cqrgj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 02:36:15.6289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f682e6-dd67-4d66-74d9-08df46af0cc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR12MB777854

Zero sized buffer is not supported. Check the buffer size and return
-EINVAL if the size is zero.

Fixes: e486147c912f ("accel/amdxdna: Add BO import and export")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/amdxdna_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index ffe12a722dfe..4d7f3de88cd3 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -1133,6 +1133,9 @@ amdxdna_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
 	struct sg_table *sgt;
 	int ret;
 
+	if (!dma_buf->size)
+		return ERR_PTR(-EINVAL);
+
 	get_dma_buf(dma_buf);
 
 	attach = dma_buf_attach(dma_buf, dev->dev);
-- 
2.34.1

