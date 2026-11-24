Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.92
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795513288;
	b=k4N+FcwVZKstY+WBhYiPunKVDEHK9sewQL8/fJNzsMidBGcEw4hkYcgyJR7gAIS3NYpK
	 pIBd+lP55gQ3FE3OMJnLsg63tqso3xVhkZWJwtPPpdCbv17MU9lOGWJTOo8yUeFvb+lZV
	 JH7II/C2i/oJ1YOw7/t5PQBXukQjiDOkiV0N2GkDZqtIpUF5vVuhunkaibdSJZ2C2VtwH
	 5dfgUdP/wrNpfOO0+3qIZNChx7oNFHepqPbO2NA3C3ZWCgSUPxWTOIT6Y5CjXqk7oRruD
	 SejrURIAjGgrKeFoyyBHh9QqYNuVTKyZ3d1GpCn0pux+OYEfbdeZLPSMy2m1JaLVNiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513288;
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
	b=Pn7WR/TCV4mtZqj7vK5/9LJ1sGwHwyPGeyMjlg3Z7557FPaL/APC6tcElQ6oAuLuXZv/
	 Hc8dLNU7YG2dKWnFGRTJc3dJEMr+YzherRo4dZ6vOJV9isS3d4gP2Dh/H144miY0SGwOw
	 38x9J6RAzeJ5FDBASQJUv+Wj4xVNNLg5XCcM6cA812+Hfp1GzRoiyAJkwXNSpkzkp1iq8
	 Tf7TBaa6zDhcAdqaKaj0OBGjgE4fQW9ldKpIgW8dEq8bfkCf8K6ANyvvitLQDKzbs7SKA
	 6i3h+xPrRvehMDXzrLzFgwmpplMmhfl38WO6vSMqwP34amvp+vn2S45jOOXN5LegrYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.92
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022092.outbound.protection.outlook.com [40.107.75.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4170D606A687
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4170D606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i/hxPnUmQBCJJnnnry8NupP9EKPYb10D6uy+8ksF2yazU6+hWWdGApVbQMSd6Xj9kIrKSN8ljbwkcz/tXJ027thTobHzZ2BGFHtP3QNkIlgKFwLMduergtgzv0FOxClyuZFJikUXrYFtKxvrZsVqaRbdwW6XyFrmybqDW+TGcZhtsE5fpcKWhNn/sDv56AnDYqeqX4s4LDj2MKxPp6wicuC4Yq09B+0HTlYZlIE6IVGPE+q88PGzrvw57ij22TEDsZKFmQpYdhdPHabKQPWA6Mx+sUO3+YE9YJe4J+6uryEKritrXFzY8wI3kEKnQ3EArYCCyEn5b+LY1fom7PcmEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMbR/+UYAsUUQqoIFylh6GXgKw+3iKCC7fBGfQpl/qM=;
 b=D/cZrl5N94uS6mak6LeeIyqsp1AdqesXKLnUx2mlFCDsVoH7jkjsWe8wUOiuq0TaZKfH1T3zjfDuAFDiT9vGKbKgazA2899x5nv79XjTQFqwrMuSvCWA2hFDIRFgV6hbO+vBMVt3gJMZadBQidaXVIfNOHiRd5aQCxu6pYuoa5+/r1MiZM3OHj1HX+Z6E26x90JzyhTBe97y+o62SY1IoTWRfr1NJ6SpNSRXM4b/DlQcctTamEGau3P/szodpadvY3gWT00Yr+TI7TY36FU3MtMablxF56SUZSldqZjmk/IgOMAqi7BTmgrrREe3E2wWunnAsaHMJrFtRnfNvswpMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI3PR02CA0004.apcprd02.prod.outlook.com (2603:1096:4:295::17)
 by KUXPR06MB8392.apcprd06.prod.outlook.com (2603:1096:d10:81::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Tue, 24 Nov
 2026 09:41:21 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:295:cafe::41) by SI3PR02CA0004.outlook.office365.com
 (2603:1096:4:295::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 09:41:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 09:41:20 +0000
Received: from localhost.localdomain (unknown [172.16.66.33])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 1CF46427EFD6;
	Tue, 24 Nov 2026 17:41:20 +0800 (CST)
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
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Wuyi.Shen@cixtech.com
Subject: [PATCH v3 1/4] drm/komeda: Use the bridge connector
Date: Tue, 24 Nov 2026 17:41:16 +0800
Message-Id: <20261124094119.3220267-2-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261124094119.3220267-1-Luo.Liu@cixtech.com>
References: <20261124094119.3220267-1-Luo.Liu@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|KUXPR06MB8392:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 155af357-c0e3-4dfe-09e3-08df4a0f18d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|42112799006|7416014|23010399003|10067099003|261022075727099003|56012099006|261022105027099003|261102123227099003|261021121427099003|261026140227099003|261021123027099003|261028144727099003|261009221727099003|261009223027099003|261009220027099003|261009221227099003|22082099003|18002099003|261009223327099003;
X-Microsoft-Antispam-Message-Info:
	fLlhRNxPbPQK4zaXsIOKdVvCZhOsF8d+hsEc5gTWLe65/3O2AClX6EcGToUIXtbEF7kZFE05T+aU6RbxB411FI9w86sbERaYIiYP/VWq6HLm8WKwkWsa9itAgUdGthFm/iRfiv1GLGaUxkkw9N1VJyoQiNyS2eiOc7Ald8rP7805Q+ie95qZ0Nxx9AIrriOCoRojHcW7YH6q2a1pMCmlNGDpSBiuqcg5Rhp3mK946UjVkBDU82hMjFhsCuwEs5vtyrRkmJoe2F9ZAhJejoXn1FXlTTxYbzuYPgP6UKhHE3Flr9N6PqqEd8l2fP+g1/RX4jfuDV41b/6vdBN+2QEhIe1UwziaQzcXHtOoKN+QMaKc/XDWHBCOz6vM1G8JUA8MI4hCinwcu6kjFNpbqohip6KU1EkBurqXfzzD7rx/xNFXIJZYItquUNwsCropoI109vnyLhZmVbXufPxP2ToXlgWlYF6nUyxQyVx8ExRe8w8sbdJ4NE36hFd3GCim3fXQWZ4o2Elai7AdLABtBBoyup9N665BTBqFRv6Hw5LE4OUJoN4TC+PnruKBM7xg1twVNTYdvtpQ1fpZkMiQigYqvfalkoW5m5R9fPIII+hrctykIEL1kf8jJHkA54IfhRzQBOiN/95uveo+IABQsmrcG4P/G7mxn2l8YGdTTeys15cly8o62XmAbLOe0SDvT72mFqtg0SLSyi6TCg4nU2xwWA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(42112799006)(7416014)(23010399003)(10067099003)(261022075727099003)(56012099006)(261022105027099003)(261102123227099003)(261021121427099003)(261026140227099003)(261021123027099003)(261028144727099003)(261009221727099003)(261009223027099003)(261009220027099003)(261009221227099003)(22082099003)(18002099003)(261009223327099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A3GL8R5fL/aMRpuomi0htMCXpA02Ds3wYME9iw7B98TOZCIt9o6l+x/6gp4g17Y3x70jw0HPAzP0Aeme6q72jtcruEvu8+71AFOsNS/IiZNjwSTMoaL4hX+TPttUjlE2lTpF+pGpoLBjGW3bL7p0gk03z21YlHbokDA4zZOmYe/xVlLzrFTk3UtRTSSQdg/gP47dzLy0a/0NMfnS5FVihsfYZFzxf4o0GFQPYz7iu1RrZFgVQONV4WZAsR7Tb8zLIJxh8pAJL053FnEXQKiyL2u+A2yjXeAzWVQdQCYC5KH17nZ3gMrzNdEjPbJJyz1B+XjEKbG/EIUFxP0aj2sVSy8rs41ev2Xc0ERtbw61MlVUyZCzePC0A9W/Vw7a14usO+1tAY4ssrLYY8pwGyRhDwFA4DT/q6rIyqzofo16Ct/oc6Ov51UMQ22Z0XVNBDBE
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 09:41:20.9902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 155af357-c0e3-4dfe-09e3-08df4a0f18d6
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8392

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

