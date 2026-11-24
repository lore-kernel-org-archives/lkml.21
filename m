Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.127.142
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795513174;
	b=jziRrlELKNKMAMwNw7F3tjbtDzqTBqYNKIe6X4XD6ttcfGl3MjpDuiyshSK5qyMiFR5D
	 Iqkm2zVwokWp54mjbQZfMJkAtRf9SmQFvb2osPMflRqQ5mPqhHLGFYYNgGdz9LK/ZQ6Lo
	 TIVrRaqQ1fqflier3BE8EJqtpRcZpySoR1aV4pVQAXLeqQgSk6FyueHOQ0zCNh31/5eFx
	 YtAR/XmOWd0vciDY4vcKig+57bNeK7q0Mm926nlyLaKIqPDZnZvZ8/pBXCvSOp+QuttLk
	 UKO96AhKfQ61RWGHpKAiX0l/VrPxVLi60OyFflsExDBJx07B4G08PVD2hxTds5M2rtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513174;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=HMbR/+UYAsUUQqoIFylh6GXgKw+3iKCC7fBGfQpl/qM=;
	b=VBq9K+yyQT9/IhdpFIIllfo8GtxcTvgFEdSp4BpArpXrPwxYzWKo3rdkZ0os1oe/fz+Z
	 CQz2Nq/gBfbD6A95garWS34MMYHo82hBn9HjMXInr6ojsHjCoDL5eHdDvpymw5TmxPfRV
	 7vhR1BPpj4IimCgbU7CPowjF/rJmf1j/Gbo/EWFY25zhljj10QoOkrM1MUSPJkeTDxdS0
	 t1QMKiXIGGIh/u1LXt4f2oU1vQ5qObg6pLanW06Fu8qrI7sYJq71oMAE7iu75mBjmC7VR
	 2VrpmnaRnNloAT517Nb6d9mICq/Mjz2c+nOa0cy95oDVW5aerG9SI9V5iXtOT/nYckA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=fail smtp.remote-ip=52.101.127.142
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023142.outbound.protection.outlook.com [52.101.127.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A96606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08A96606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWWyeBRHaQOEdR/jSbJcp3+rlNpe169OngBX+hWdL+PMigqCt+UVyMslJs19v7/33bAOykbCTO7qlBilG0SS6bbtOI2LE0+lc3Ta5PuGxTxbm3anHa5ZTytZtxYOGX8I27YnnBuzsAwANB+nTBO+ohqAdUQaLJM9m+jqJMfAG3C7xVDWntgjrNHIKO/NdHXpRYPntC+Emrm4N16voEf/HeA0w2GQo++rkan3QFFYcI3H6wYmPZJ4yiZS4zP83rINw1tgP2RDWaOcKn1wJKReMNRaA32Miv1eGqA4uLSjbycVSewvGUENIwU9lEgYRxx/G2wPHO24Mi3UafSvf9Cd6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMbR/+UYAsUUQqoIFylh6GXgKw+3iKCC7fBGfQpl/qM=;
 b=p/CsCi8oEVYgTOx7bGGvTyRK3HA9AvHNXs9cOfZDEQUtQdRUeTXO2pxQv+raRKRxMYppI7obGnTo3TJplbbIt8YbdHT/TUqj4uIhrjX8TmZtlzTnhoanF7Z1F/hUJxiw8nEtfPGGirx9G4wVbo2VoW2fIM68F/a10cHr1WWfVEMa4cUsl3aIgKMDR/tkPIn2xORk2eaTZosoAOO7ADwJPNJL1wuWrnMyC95qzH2ad2VxZ0oSOzAbpJ55o+bTrBcgccdqcaIMRMcsXQ/PVrE0hNKezHR++ak3pQWMOa2/6hRX7iks9dpSv6C08DUP8UqC8P/FLOVAJ6WmxZyPS4cQ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI6PR03CA0012.apcprd03.prod.outlook.com (2603:1096:4:285::18)
 by TY1PPFA3F3F1487.apcprd06.prod.outlook.com (2603:1096:408::921) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Tue, 24 Nov
 2026 09:39:30 +0000
Received: from SG1PEPF000082E2.apcprd02.prod.outlook.com
 (2603:1096:4:285:cafe::a) by SI6PR03CA0012.outlook.office365.com
 (2603:1096:4:285::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 09:39:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E2.mail.protection.outlook.com (10.167.240.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 09:39:29 +0000
Received: from localhost.localdomain (unknown [172.16.66.33])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 36BA7427EFD4;
	Tue, 24 Nov 2026 17:39:28 +0800 (CST)
From: Luo Liu <Luo.Liu@cixtech.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	dri-devel@lists.freedesktop.org
Cc: Ayan Halder <Ayan.Halder@arm.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] drm/komeda: Use the bridge connector
Date: Tue, 24 Nov 2026 17:39:25 +0800
Message-Id: <20261124093928.3220071-2-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261124093928.3220071-1-Luo.Liu@cixtech.com>
References: <20261124093928.3220071-1-Luo.Liu@cixtech.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E2:EE_|TY1PPFA3F3F1487:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3fda1087-32c5-460e-3274-08df4a0ed62b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|23010399003|42112799006|36860700016|261028144727099003|10067099003|261026140227099003|56012099006|261009223027099003|261022075727099003|261009221227099003|261021123027099003|261009220027099003|261102123227099003|261022105027099003|261009223327099003|261021121427099003|261009221727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4o9/NeVs29l1pvrPC/b6afhBiXux2dwc7M+ECPf2MwbKUz1JmJIvAdnqZd2q6clRk1O2bBgYqYsghHAjegOCI6VPwlXA+oQ72FV7Lg4lydLWGg2a1xDrkNI8bZdz98AbqHr/O++20WapCRvnq439Dmwjn1v27XxvA4AeiDXFVXkMOVbK7K2JgHjg6LPmwyCK1JKVxYvsURrUF7C53eGmL8feqoL7/Cj5BolcTf8NrRMjY9RDdisbKg/kOOSTPGLft4xsix8Du7rgc9hqVpkB4v+UGsvZUrsldFSA/e0M4fpBl78c3kEi9+Ei8eycY4iH8Izvn5Wy3BWaXM0KF6zyeoigAdQu4evhya8VC9SCAJzMUKe4rUFPbDsY+qA6U+geZqVNcAmU6veqVuM4b2ccgF8rAqml6KPxPFRlf/OWWw87QvRWWxXBZRztD+TjqxpRV93TeJlPJ72UujgS7uNn37p9+5p1hYc/FZwg95YgwPMgs6XEhFrmKgX3dx2guKVj5EL+ddNiNuyOdPGDt3Os503fWeUzUY25ukswsqU3Zk7C7ffHwq08Rqf/HHKNux710Q1MDIgz3QHAhvouW65m3552rEsWlFEUs6JmmfLxfKU89O2t6SyXsbZXFZ4xRPqxeAIELEdSEVZldel9BE2CdD9+vJQoe5hwQGNnNsKBdnxQxn3A9xYkXih26591LvPqysB3bgCibHyuWASBAW+p9g==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(23010399003)(42112799006)(36860700016)(261028144727099003)(10067099003)(261026140227099003)(56012099006)(261009223027099003)(261022075727099003)(261009221227099003)(261021123027099003)(261009220027099003)(261102123227099003)(261022105027099003)(261009223327099003)(261021121427099003)(261009221727099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ald3pRFDnndQmz4DnyJS0bxiOt2EOO1wcNHkUSHI70Dmnr/yinCibn8lwno4/brmrTqm6M89floKgbQ9NZ/5Rshuj/CaZXXCtHITnhr3je3eeinD73xUS9MyZg6uuLUUO3uUO1A1859PJXr5asFnA8AQQ1nr58Ez50xAPMbJKnYahg2U59iZ0yJxopee94tdh99+JVKOQwIMCozpe8t6o9byP6kmcY4Zq+j61pIhORdjuR3GpYKd7eG4fUoz3fLkh1DF+IMott1rsp4EuuFwhJVCLD5wDHUj211BxaVBG2TRouqCByiU9kCr6+38xyRL6IA1O7WegopF8iGrw5HJ0Dq3/aRrP99F6SyT4qmZ5gKbRPvIKDlmDI6FhVaSGuYm1YMQ1axCHvZppwPeeu1oBLi9HRECxAifg2nwOynZh/VVQ5z2jNSB+b1J2BJqlWx+
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 09:39:29.1314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fda1087-32c5-460e-3274-08df4a0ed62b
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPFA3F3F1487

Bridges following the new DRM bridge model no longer create a connector
themselves: the display driver has to attach them with
DRM_BRIDGE_ATTACH_NO_CONNECTOR and create one connector for the whole
chain with drm_bridge_connector_init().

Convert komeda to that model, so it keeps working with bridges that
have moved to the new one. The bridges komeda binds to in mainline
support connector-less attach, so boards using them are unaffected.

Select DRM_BRIDGE_CONNECTOR for drm_bridge_connector_init() and
DRM_DISPLAY_HELPER, as the bridge connector is only visible when the
display helper is enabled.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
---
 drivers/gpu/drm/arm/display/Kconfig            |  2 ++
 .../gpu/drm/arm/display/komeda/komeda_crtc.c   | 18 +++++++++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/Kconfig b/drivers/gpu/drm/arm/display/Kconfig
index 415c10a6374b..d88fdd3808be 100644
--- a/drivers/gpu/drm/arm/display/Kconfig
+++ b/drivers/gpu/drm/arm/display/Kconfig
@@ -6,6 +6,8 @@ config DRM_KOMEDA
 	select DRM_CLIENT_SELECTION
 	select DRM_KMS_HELPER
 	select DRM_GEM_DMA_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	select VIDEOMODE_HELPERS
 	help
 	  Choose this option if you want to compile the ARM Komeda display
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
index 0fd069fc3386..3d5f06e085fa 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_crtc.c
@@ -15,6 +15,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_panel.h>
 
 #include "komeda_dev.h"
@@ -617,6 +618,7 @@ static int komeda_attach_bridge(struct device *dev,
 				struct drm_encoder *encoder)
 {
 	struct drm_device *drm = encoder->dev;
+	struct drm_connector *connector;
 	struct drm_bridge *bridge;
 	int err;
 
@@ -626,12 +628,22 @@ static int komeda_attach_bridge(struct device *dev,
 		return dev_err_probe(dev, PTR_ERR(bridge), "remote bridge not found for pipe: %s\n",
 				     of_node_full_name(pipe->of_node));
 
-	err = drm_bridge_attach(encoder, bridge, NULL, 0);
-	if (err)
+	err = drm_bridge_attach(encoder, bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (err) {
 		drm_err(drm, "bridge_attach() failed for pipe: %s\n",
 			of_node_full_name(pipe->of_node));
+		return err;
+	}
 
-	return err;
+	connector = drm_bridge_connector_init(drm, encoder);
+	if (IS_ERR(connector)) {
+		drm_err(drm, "bridge connector init failed for pipe: %s\n",
+			of_node_full_name(pipe->of_node));
+		return PTR_ERR(connector);
+	}
+
+	return 0;
 }
 
 static const struct drm_encoder_funcs komeda_encoder_funcs = {
-- 
2.25.1

