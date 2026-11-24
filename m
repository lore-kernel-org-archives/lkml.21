Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.92
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795503292;
	b=UldxSyYc57LC3GxZBuRP3WcFCDGrNf17al7Qh0FLAPY45AkWtPiDU9uRBBEJuvb86AdQ
	 NyuIGWP1OKSpfbl50ss7elQHh2Oq4EyAQKEcv4qAjKLiiA7dMrkPteZmBrekldq2c6qLz
	 weWir3vHstCo1c8NUWXWLS6ABzS2R5S660FNPLdScp4wv3ZdRAMpu6bOro5SzG8/j1uX7
	 8gOIPV1llAzyG3KFwOSZWrpZfXvNNqPo/2zqw5yf1f1+WmDSf8gRJD18/668n0LLzkLyE
	 GoLQDLrbSeMLUqoGFt/wDcfI5UqLRNHbvmov9fl6+tq+cyA/7BXdLIj9DopndRqyEFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795503292;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=MRLuuc4mRFTRVJZYpIW1aQVtaa16HhKWUHq6mKTpPhI=;
	b=cZT3wbMxWiJ0SzLdtthvMXOnu0WWlqUrGMkeQw10hcu88DE8YH/Hd3UNx6zmTeFZfTbU
	 LOgCSNFNzBiiy8M5jqAUiUtmn2N+aS3qzNrs9J84lFRe0aeBLzTwr+41ieZpl63f4Dm8/
	 tMyC8hsTfUJLRbe+saFUHNvt4uL5SqNI9GgGeYXi9MzmJ+yx2hhy0p8n29woHux6uiSG5
	 aJLMY3iZ5xjWVBL499SlYAJbg1taIteRsUIJWjiHLhW8StaZ+alnQSgFQJbT/5PoIX95G
	 6eZpyMXm8WJ4ozHm41qTxhd+8SypwtFimvDAPosEr8zT9qD57jBrnb7L/04ocuQlueA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.92
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022092.outbound.protection.outlook.com [52.101.126.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF355606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF355606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gh5sR2/eEyivsz7AT7Y5DAdYf+fvHHtntsuR8LsB2lbnKfkNPKZUEIOet9OslfO+996Kld3AYKsM8bFTc5JFd8yMm28N+GnE+E9gx7Hd+p7RBb+meHSgOYDXggpYIWEH/whac4yyNtq/nmOVCD0GgcPFDueYf+Q2HhfvI3XPvN/qGpIEAootO1JrvCSU2gJvf2UOTXz72N3uaRTv3WegZ7RnQVDi88DVkfkjzagrV0FStPeUwIR369c+vJ9HypxJTjfHC/PQwryfmlijSfvDZil/XllAWTVJHBMSpu1hoEt26W7hE5CtOP0FK2HjBiJ4tmKU7wbRWNkfkp7jtrtRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRLuuc4mRFTRVJZYpIW1aQVtaa16HhKWUHq6mKTpPhI=;
 b=RTPxLmAcwsSb0LPc6DoG+U79BqX7VtvHsyrVi34Sb5+o5NP40YrjdICPZb9XSUB4g2ymfo+3liDUrC9S3oA4E2NzxHHqzlRWLk2W46cVs/F/uBsK6mbpver3q3RXb56+hwYdA+QE7bfCi3w6Tv0NE12k6Kc1r9yA4ae4B1vey99VdCEb+cosUCiGmFKez9R2D/TE2bcXRuRUO1oda4nLbroSz0g73uLPeGrXSmqUJ9dHQSVEXheui4w95T9FMxeXKUsK1iTwkKaNsblmYEOqjxK6l+MITYArZ6Cy52Vbun6+LFtQesl6e8Vhy28YMQ1VTpaev9orOQMlb3SRlxpXng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0006.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16f::17)
 by SEZPR06MB8973.apcprd06.prod.outlook.com (2603:1096:101:33b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Tue, 24 Nov
 2026 06:54:48 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:301:16f:cafe::2f) by PUVP216CA0006.outlook.office365.com
 (2603:1096:301:16f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 06:54:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 06:54:47 +0000
Received: from localhost.localdomain (unknown [172.16.66.33])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 626C4427EFD6;
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
Subject: [PATCH 0/2] drm/komeda: Use the bridge connector
Date: Tue, 24 Nov 2026 14:54:44 +0800
Message-Id: <20261124065446.3107248-1-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|SEZPR06MB8973:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1d9722ab-7d58-4acf-676b-08df49f7d455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|42112799006|82310400026|1800799024|36860700016|376014|23010399003|6133799003|261009221227099003|261009221727099003|261009223027099003|261009223327099003|261009220027099003|18002099003|56012099006|261021123027099003|261026140227099003|261022075727099003|261022105027099003|261021121427099003|261028144727099003|261026121527099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ZrxGZfFQVNoTzEBmU1yjDwXRaQXpzxhdGErdi2FC+z4OSew0u/5Wm1JTS1Yv5ikBmXRjt46LMYk3rIgvtp0FkquIiEWnn1Z2XvtBCtzj2gY5rue2oY48uSMYZk19TxyZs4M0USDwcfhmU/rOfbI0CkClblZn1LZCgn5vivB51XurooBPC4r+NFDZ+ePX3sEsd+fdsDUWyK9gFvIz2/CS31lGZidYzHud7LVnlk+TPxHz+fTvhg9tutGnmJKSW7AG+Gc5ufVXSQ5/mSI156SlOZtVc5wxomFJndnIt2jGc9NockQt8iw5M035/ZVAkmgvxdtVCNClJFuH0WdkcMry41/fqQKADXwWJGU0tYOWE3xZ2apcNNFT9/KYs7+rq6Rel4XL2/LZUaNuWdBOdEDYIGC7z1aE2/uiS16TPTpKISmJ3XSW4sC4RpxVHD6BBhyx03Kkp+/ZVlXV2f73eLbtJzKk8tm90A1ct/hFJVEH7YCzhquvsKPaoN2y//dJtTfDIfzarSuAopCuhOcgRN5KKCc4utsjKug0g2vdCjX/yVpUQJy0aeYW1OOpDKhw7mYDxrKDKnJ+GdU1Ty1Ns0oyrX0YCReYm4W2JbcV8iKfocN4qi13jECjXHsvFc7hwM5QunrIO0rFugeuhy6Ujy1cNQvzJ8we2Ib57mx5oA1SHUY2FUxP7BTGg3feFqiER+aMduY9tDbCQcQlMgErZcRPJg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(42112799006)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(6133799003)(261009221227099003)(261009221727099003)(261009223027099003)(261009223327099003)(261009220027099003)(18002099003)(56012099006)(261021123027099003)(261026140227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261028144727099003)(261026121527099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/16bxaTM5xcgGeGMfqhfCCpFclRxmxpraGBB4KogvQqJRGCezx1dYjLJOPPz+03EBhyCBCn6UsY6h/g30WNbU/+kAu4jx+aZkKqjsrUwDj505ELMtViR4ihRJrpjo8AFcYPrbjPGepJ4R22Vpf9lO86mWMMW8kXXqRlJwM36i2rGheaK8TKu+RiWWp2T9V/bCKTmIpEVn76wBCJ4jtdSxn/jpYahVJDBi4RPzguJf/EWb1wi/ffFThDG4l/p4rSMrbrOcb9GxwQ1uESwi99W7K+Pt5BTJ+iSf24b2AfwysKz8bcXmNg+CMzhTdECfSYn54bzfP02zKGfCpUv7tl38uBfhne55g7GgQoUq54SOUFicT0SWn0fZ0pk9QCqVtcI22r8P/C8F7wAcFUbj3OYoX1FbFc819zbEOMRZA968h0T3GB+V6VvAUeGtOLDZoa2
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:54:47.3894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9722ab-7d58-4acf-676b-08df49f7d455
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB8973

The first patch converts komeda to the new DRM bridge model. Bridges
following that model no longer create a connector themselves, so the
display driver attaches them with DRM_BRIDGE_ATTACH_NO_CONNECTOR and
creates one connector for the whole chain with
drm_bridge_connector_init().

The second patch fixes the teardown path that the conversion exposes.
drm_bridge_connector_init() creates the connector with
drmm_connector_init(), which provides no ->destroy hook and leaves the
cleanup to a managed action. The drm_mode_config_cleanup() call in
komeda_kms_detach(), and in the komeda_kms_attach() error paths, drops
the connector references directly, so drm_connector_free() ends up
calling the NULL ->destroy pointer.

Switching to drmm_mode_config_init() lets the core release the mode
configuration after the connector cleanup actions have run. The komeda
private objects are then finalized by walking the pipelines instead of
mode_config.privobj_list, which also holds the bridges that the encoder
cleanup releases.

Luo Liu (2):
  drm/komeda: Use the bridge connector
  drm/komeda: Use drmm_mode_config_init()

 drivers/gpu/drm/arm/display/Kconfig           |  2 ++
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 18 ++++++++--
 .../gpu/drm/arm/display/komeda/komeda_kms.c   | 36 +++++++++++--------
 .../gpu/drm/arm/display/komeda/komeda_kms.h   |  2 +-
 .../arm/display/komeda/komeda_private_obj.c   | 23 +++++++++---
 5 files changed, 57 insertions(+), 24 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.25.1

