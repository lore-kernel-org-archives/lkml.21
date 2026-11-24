Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.102
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795503292;
	b=LFRryczIlXIwgeC6+TR9cElMow/2SgUDfd2jORb41WFHAqM6Jg/e0oTso9GOYaTuhoQv
	 sOfyf+HFgixTjdHuWzdYmuxboQK+5OSZInqUZU5qhSsFH6k1kFMO4yg89bwhfC4LCl8xI
	 Ksr+fOyMF8MKMBP1pHAZQAtcxJe49ynjy9MnqcNRNQDXwu6A/Qwe18jxU4G+1P7juOoH7
	 rrcWCASJSzguNOEurQ80SBAIpjiIMYxhJr7GPpQT+fIMWhrJKYXFeV568FxLTWIosfk/n
	 0emUzVmQ8QOtRDtOBQ/7HCCrFr3QKZgCfZoi2ytRjPE5PEAnCey1jZma2BYXrNZkbnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503292;
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
	b=OwcX07aPX97VG6lffMxxBobFfCmj9u3rW8lTw7gKyU7Vp8YC0hQHy81LuPutaICTUHRz
	 py+zsJaNG2sAz8oEibN7x7ukhvda2++mNesatAoN8m+nzxkb5/s3uhA8SZZ4zmQzAXq3m
	 rTCkhJ3KPdYMPLanbpfkrMvvTQMIrsl5bSqf0nkN3cEaoTXDA4Rw3N+hNsg49Dtu859Ed
	 M8/BuQUBvMc2OPa8M4yH3xubOembnVZzU+KVRJ2ckEviCpKYFArbMVOUAeO8qL7+FnHm5
	 8Njqm8LVWbYzPsuuP2S6HwyVB/iq6Q+BTuzO5tvNY9r5k6Ewtj325r5GhFMAokQDeeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.102
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022102.outbound.protection.outlook.com [52.101.126.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAB5606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBAB5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpwruvGcIJHiAT9cxJ6ivBPL1Wu1qoX3ikV8l0kp5oU2j4Em0u89UZztLvow/sUoQNDwUpyCxx3cUa/U/Z2m3g1dnBrB3OI1fIaiGyMPXNKPsEjAOA5ectr+P+BLhtAYBozZwum5/W73UaEgNkloHoi1UlSpfGlZ+6LfRleXd21M/jY6BxU4s245m3yqpTWbSNIHVcmZDdcrvtoJpsCfHatkN6c+HUuKM5oLHJIhlmJ8UICYmcXxIISYACI0XRdhidGl5xHLj0AG10fGHQ7/lmNw0Hz33CfgCHkIbG72CywElYM6SkV0+dSm/k+IlvgDzhIvL4fNodYzzBpzXYM0Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMbR/+UYAsUUQqoIFylh6GXgKw+3iKCC7fBGfQpl/qM=;
 b=km0RfeTmOrnPIiz9CmHmmvIrtPCUkzivPxYkkaNW3NWFBx3HWHzc7sEhlPw37NNeSM54SuOp7NCXZYnvdSYm8AKO0tPop1QMPRg4YrjNzMmMCPdMKndoo0c+lMVI9XDgM+ZGlwZtCQ8jhfwzDXjoYq/Jx1iqfDJdxwN1fQO0rLkJbyvft8SSEPpWT475oW4lqxh5rtcRt7X+YnuelMELbzNZbmrOkkERDLu7072J/GZSRv48oVg9iwPYowJa/d5X6QFJVJtTf4I9Isp3CDWLuBFyrLxXZANjsfUV1nJ/2IIA06/bVC26dP5itEPIaebawLzZbAbHH94FtzLeW9wG/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0070.apcprd02.prod.outlook.com (2603:1096:300:5a::34)
 by SE3PR06MB8127.apcprd06.prod.outlook.com (2603:1096:101:2ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Tue, 24 Nov
 2026 06:54:48 +0000
Received: from TY2PEPF0000AB84.apcprd03.prod.outlook.com
 (2603:1096:300:5a:cafe::9e) by PS2PR02CA0070.outlook.office365.com
 (2603:1096:300:5a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 06:54:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB84.mail.protection.outlook.com (10.167.253.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 06:54:47 +0000
Received: from localhost.localdomain (unknown [172.16.66.33])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 664B7427EFD7;
	Tue, 24 Nov 2026 14:54:46 +0800 (CST)
From: Luo Liu <Luo.Liu@cixtech.com>
To: liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	cix-kernel-upstream@cixtech.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	linux-kernel@vger.kernel.org,
	Wuyi.Shen@cixtech.com
Subject: [PATCH 1/2] drm/komeda: Use the bridge connector
Date: Tue, 24 Nov 2026 14:54:45 +0800
Message-Id: <20261124065446.3107248-2-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261124065446.3107248-1-Luo.Liu@cixtech.com>
References: <20261124065446.3107248-1-Luo.Liu@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB84:EE_|SE3PR06MB8127:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ed21158b-4eb9-4918-2d13-08df49f7d453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|42112799006|82310400026|36860700016|10067099003|261009223027099003|56012099006|261021121427099003|261009220027099003|261009221227099003|261022075727099003|261021123027099003|261009221727099003|261009223327099003|261022105027099003|261026140227099003|261102123227099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6aISn6CAKR3A/SK3/3PVFe19q/lFjZqO5QGgZEkue7WQVyWUmW5sWRoLbnxMJHpVCxZQ5wWTfDTFc04Xq6BvRfGcLuBUAxybFWQZQM7/Mdq5qAGf8EoiibcIe5x8Ua3umP5BqcdvFNNSWQBfvna3Yghvqez6ikf37iXSGlpgsqIEU0yJoB8+XP0oVMykBQF3wmjJGZM/aNuEEmM5i74LoynkPuP3VynGqvLGMuYDVedw7kx1e+9eDJ9/eVOGAI1ZKcNzVrAXS6wMA15t4SJq0B9LVilwK7bDYwVm57HvlmojvKAFVFlMB+71YbJ+1QTXU32PH9QY/eaBomBwgDAFD3wW4rs/FQDbBroghItdZ5mdF/NMXZkPRm6D8iVolFVxLcNeYVlDYqMBX0f5nCAvWbRmGXBxshaIHb8UbzCJkbTbjP6dNr31ZCvymka4ie/d9oDOkrER/6vdsWQXv9E12/NHYXlBYWEVqyk14x0RpONnSdm4EIPA+YKPbwhy9TNrOraGFXwu2sSw6Tt4tMtcpzoeHfXhSO+spXwdP7Z2knfVrXn9iKvNY77w4s8Zs0srj9t9thYWVKwjr9nkxiIBhvJgv/HJGkZ9ul/CnmQS9EAoyb6r00obC3HCQ3FU/wWvlpc7R8yKLBk6NtGiKmQodhd/IGeVFix+3DKz/DFe98L4YqG9Vm324pB9OHtQYtGdjBKnh55J0fXJkJYJ0AYGcA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(42112799006)(82310400026)(36860700016)(10067099003)(261009223027099003)(56012099006)(261021121427099003)(261009220027099003)(261009221227099003)(261022075727099003)(261021123027099003)(261009221727099003)(261009223327099003)(261022105027099003)(261026140227099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MvkXlWHlIP176dzwBFvHbqUQwSpvIPplehPw0o98QaB/HwQ6u8/Btv/9b7pzcXJXfCYYABV/1kOHqDwSdK8p9mGQA1PpMk2mM3ieE6nS5tvJ6kXWq2VzzHlSL6go9ZFN7szxhQvKPw6qOv4Xa5iTBw611ce4QwaGiM4wbFLZmcQZAZoH61KZ/f3Z2Ixh3PtlHyAwATMMPHZUd9x/2InPbfwZ1gWg2/AA4BBsb6jcM06PLmKEYT+n0nvviaCeUnQIm7Nofo73zg922kEPzqWbsDGBzonHjIoYefVcaOoxW8hT/qYcTu5MaLwXkr4YJ68t+w55jj9XPwURnrlPvzc7YDxJ03YQBgmCa4x44Zgi24+ytyT2/ERU/ulUIjipRbbiCS9cYEHOJlWOmdz2VGGjUeP5Z/VpLM3ho6Oz60BWPibw6mbC3z+pdYFC9jfSUOvq
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:54:47.5247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed21158b-4eb9-4918-2d13-08df49f7d453
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB84.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8127

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

