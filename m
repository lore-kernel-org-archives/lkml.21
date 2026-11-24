Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.44.135
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795505768;
	b=ztIevs0Qi7OR8VpnCkZ0xH222cudSJ0wxHllSl3ZNKy9HO22xwXiYPGAv6Wp0PbGFy1/
	 w39CBuXkHqOAfOzwAgU211ePdfJXllONEZdvCXflMUWGOEo/Ee3Z+uFjM3Y2iVNimE1Xn
	 j11DDoJCVKNWJKxfbO6JFEzlTjxnGoLph4JDHkjPGlu0kL/6dBHVRHvFXwPGoCFzZc+9J
	 4vOwmbTV+Ovugfb0w9O0R9LaO6KCKjEmv0EXVWecsBcbiJsspXQL7hbiji6dvTjwOLjh5
	 dbbV/hMkTTGeqt0xg9eeAY0NDYKzTOp4u8qXkqTP9NXbHVaEeOdy4qvOjvW6oowb+cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505768;
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
	b=Zq7FYNOXvgjz2xPzgUUEF5y2DA8FFzGZJpD5ByoTzjs3ZuHxB+XdcyqsHDXah3z0Pmv1
	 09aw/uX0KB6vvByo8/6e51yX14tUMRLdhUKKyHiKJaRGSedD2fq0x/wtVxh/cz1euOtPE
	 G+Y2vC2PhI2YhYBLI5O9BLAq2SycWJkxrtEpwee5yuQqKkqO+fm7OBrjVF4z8t8IN1sP2
	 diFCPdAqvrWxAut5xXbWVWDW6ntBBwh6Rgbe5Q1n1cSIlIinXhcwblpnC3uPgGYVwNUox
	 K5wq1rcpOxhejarsj79M/snHHd05YKjjUKjE4zeTFL8NX+LMqyBjTRhgIHzCiGywOIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=fail smtp.remote-ip=40.107.44.135
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023135.outbound.protection.outlook.com [40.107.44.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAD7606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EAD7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4M14kLpY89XkRwQvAakrAY8O1d+V6G42skJeuAv63p6lC0bd9YplLpmvECu7H23ffDCvZJ1PyhH+Zg8I+cmEx0NlwUWRkCSH/dTxSC/EFshAeHz8L1zLeqOfER+GFSnm7Jq3nCCJCB6p16raku0QYjdcKowiS9xXr5FoOcrOHuxvtUDnSU7tzCZzmI5bZPuDJYEYC2OONKHqmfGdxtx4HxhQKOvRSI4NtBu4nigDEtVVPdU9XHrNYMsSuz+FKaiwlqJFhbUEaeWJoP/YpGA/JK6lmUObelGZ86Lz3PW9wd7ZDYcpzrvBSiRqKffF4J/8KIZ6XiVHvFf9LUaOvlRMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMbR/+UYAsUUQqoIFylh6GXgKw+3iKCC7fBGfQpl/qM=;
 b=LpMkEuTk/M+gL3pMJYC7efoOL54hrikFsbOmDJkHKaWSS2OhRANP2Oow6t8VZe9MD4E/ftXbJHmd9tr2Oq1sqvsIsl+mYFyKO8gheus6m5nTkVehJ7hiu100h10GdY6utgghYkXxfOfXQp2XyVCgFPhislo9Rr/riV6djWEMfK8oWOvILTKh/c5u7N6vzkMBw4iYY1Eb1KAcKFNpDNnsAqDCCUoZ5oCIgvv9E08eUZZMPNt5uJHX9SNawu2lCt11Apz2tsuCBu00NYWsO5YoA63aauWKp9Vvxm+bV2M7OStgYJe61bdLXCQKsvNdW8zix7d9NsD7+mLcl8rGLRJGRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:300:2d::34) by TYPPR06MB8136.apcprd06.prod.outlook.com
 (2603:1096:405:385::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Tue, 24 Nov
 2026 07:36:03 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:300:2d:cafe::57) by PS2PR01CA0022.outlook.office365.com
 (2603:1096:300:2d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 07:36:03 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 07:36:02 +0000
Received: from localhost.localdomain (unknown [172.16.66.33])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AA1E340920E2;
	Tue, 24 Nov 2026 15:36:00 +0800 (CST)
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
Subject: [PATCH v2 1/3] drm/komeda: Use the bridge connector
Date: Tue, 24 Nov 2026 15:35:58 +0800
Message-Id: <20261124073600.3124817-2-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261124073600.3124817-1-Luo.Liu@cixtech.com>
References: <20261124073600.3124817-1-Luo.Liu@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|TYPPR06MB8136:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 21548a41-ce43-4e36-ae42-08df49fd9764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|42112799006|36860700016|261009221227099003|261009220027099003|261009223327099003|261009221727099003|18002099003|261009223027099003|22082099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261026140227099003|261028144727099003|56012099006|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	50Hsf5q5vcKqYKEv7lXefPU0rYlXVUBQheY5ikLRqSyuYZPdPkzlDL5IbxyeLZyMhk6P1C7+e8+b2WX0f8XCEAW31uan98exi7CKca6txePgX3AZacNJm6aE6c0CA7IBBZubJ/zjuYxx2MQo24vwWFZsr46r8kZ8DahhRUqDaCrn6XITJr0kf4wv4pcYOWXsgbR3SG1oMKpE2J7UFSbWqiCQRC64qg1y+hz4i8zSzCjTiO17HDvKXdPTYuw5BzzlYWfCWYzpaYs5zl1DThprcw/qgpTbnxfB4wsH1j5SX9OlZNeVbZNY8WSdRGK6f0jmuDywvs5cFLD9ywLciKOAmSAdkfX66AhG+G+zO0//dmfUNadp5IY8/tLiqF07WHxarejhxM6M5NRc05hVdSh2tDQcWeVi//tvecCC5PHqfX8hOt0S6V2NYMfzqWR5c5hKFiMvMJ32kRDV0yXcMxumnFh5l4SXxynZnLRV61/gX5AmjqR3Hq3/7CDgoZmFLC2iao1+lKJSlUmKmtb8FxjihKq08NSa5fRhYpVQxfSmFKiFKkmGblBU7LxboNb2foBVc7AT/Q4FCliWpprMHbk2gbe6NcB0yte+yZ8/XSfx/5oLr516Rxh8pqvfer1XN/xZg0yXdN2R/VmETqJuch2hGXXaP8Uuljxe6ueVnfndeFoikB/3vC5yWy/jEYHWziweQBVGeJkh1UYC8OnIkmJcLA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(42112799006)(36860700016)(261009221227099003)(261009220027099003)(261009223327099003)(261009221727099003)(18002099003)(261009223027099003)(22082099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261026140227099003)(261028144727099003)(56012099006)(10067099003)(261102123227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LcwdfOXv9CpcZ0C9s89yZBqKcgE5edq2xmHkLcML+3l1FEcigHZ8PCy4YLn5uBe0YK8q8CmaM3d+D4P3QvKpNLmDLAmID55accR5fUctgeu9fzfW45JEg8BbTobp13/OFZcgK6aZ63WMTaxwDjgUjk+J2qRtWHuNydUbnMQn2wLtcHyZh0t4SMKJU+1Nn8JBhVZ5fnDEGi6OZVzXW+MmW2+NV3Dt/IXRg2pJr6mdtdkWIs/Ab9XiDK6jfgl/CSs9AJP6Q97YyB9PjBuPDKOZNzvIwQ3m13jdDcsBO+sQXGtHEIjALa3370vjnYBj1PDeI+bPmYXjhHgMEPHWPuQ+AIufwW/c2/BiZw6/Yk67/YHCgl1XlXjUN5vW27nAO2JPlBJ4W525+yZADzhEfLKahPsotNAmrmIxsAd7PXkaa30AgKURoEoyCAZ7g8/uYgcc
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 07:36:02.3159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21548a41-ce43-4e36-ae42-08df49fd9764
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYPPR06MB8136

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

