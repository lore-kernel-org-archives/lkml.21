Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795174041;
	b=fbTUJ/3HiwFEaxGQg9x6aUulLUFWzV3S8OwwWy6NvPth8mJDHheAiHm9tQt2tP2SPU8p
	 Y1HeZp1lFDsYyQEjndOOAjN6qpnia0KxozsG9CBQXaBO8FrAECvy3Mk67BR3p0hYkNo0b
	 KMPfARlWDw1Blskqx/Xnl63fjnnC7l4CLITRQr4ARYIZey/ZyukjDv5pm7Hf4ucSSe3R3
	 0cARuQRCyQKVWXW+FvAu7U/UGNQIMQTvDLjtlX23e9qLY0creIMjG2lUX9ftTH9g1AXk7
	 1rF1NcYugA4kqEWj4MAqCPl19rz1LoLwYPEskLosFEwAWvu0FASqANzjfu5ATsNlhvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174041;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
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
	bh=bEpii6cdlCphRzX12KymX/PlYQnXf7sDL0nHny5wUWA=;
	b=vcCLDrnNk14znjylP0dWg6XFfbuSQGbfyHE/SxHbjKK7VHcq83vdKWUWD40KNDsKreXs
	 K0rtN7x7hQQKHlsILu/7vAUYHlfs/cji04LuMcrzLX/un0WhUabjAdX6Dpxi7qn5g63Yo
	 xlvJ/TzjGf6FVb7dTme5HXsfhlAfXZJarC0KSiZc12MF3s8bVP1lniyG3aXmiyrD+7Ng7
	 Noggl2dRPexScOLgLpiwQwnjzikTYQhJWKEHhVG9m/ULZHiOHprWUdecGaMUcbDPRC0Mk
	 RXd0mH6YNi5dMdspvTTXZHLTae518WfOn72LndBdXOPetChkVkj3uhqwrmEQHCrolfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=ZVJmLWRQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.52
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010052.outbound.protection.outlook.com [52.101.84.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2004606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2004606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=ZVJmLWRQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZiECy2ICJF0QkSzI+D2yiRrvlQfd9rrc2JruR6yRneC0S/KGZX/CInakGfVrFr0wvT9eKsgvS/ksHueK9+j3wK615cvAvAr/20faRLviIpaF4vi4EeqwwxN10EXcmgniK/9uamLqNYwf1lt+tsAMtmsJLu6jyZMeOEeHaiXbppuuF2Rv5pFumUhQCwo3i/+B20sbWqX2RG/3Tnizl1XYI9WX8YgQ3LbtmL0m059TMG/nuYRXqcfmTGzkluu3daera6EonNp6pzM8q+Nll2uAZjFydvkvjRspuLb4OGHFTM/JDMkFMcGCSn6PhuHjeyxZNRcOdyW1mT5RqEp/GUFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEpii6cdlCphRzX12KymX/PlYQnXf7sDL0nHny5wUWA=;
 b=avIksY9kkhWLlD98/WKuW/UV5TggWNXcbkVbvDRxg8kXTx6icN1x9AFkMgBOGC61Y3ZXVPUws7cn023ijCe2Ty1W/jBQdzTgCvMQqKsJOPXLY9mFTnChInhMOW1TIIxzh0Z/hAL0WS4IkNUFG/v/qDG2LJfdvQEIqaLt6WSos2/e/VgtoBWRcQTmJK1IqsxJUHJI5Y83WcWvr7GU4jICVwbWjnlvd5vx9K0/WJLU6K0U3i+WulERCprLD4FDyqCCZDchRKU/UwlkSeLVz/LJScWJwW+OaFVEmoDxhJ5dfn2zrsgpsbFCsODlwqqjVnqS6U1TUXOXPxgOgEi/hXqRDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEpii6cdlCphRzX12KymX/PlYQnXf7sDL0nHny5wUWA=;
 b=ZVJmLWRQDmscT0pMAz6RAlTgyeqv6njM+C7ld4eRgRj7ODk/PN5F1ZReP4sCzcZQ8c7DOc9XurSI1DT/uQu/orWQZfm+y9nnZkdaWmxlujG957ZUmKByF4+hf7cwjTfPPCArEWx66kczrud52mddDYRZm3btzTjp01p6isUoaEaKxCRU60w4MsHXueB0+SLLzVpoFsW8wpM67XHowGMBtdz6le64A2xNWEx53936raIO+Cx0sM9WJsEOgTmBbbPfVp/M37a/c6pnx9WPYgfY/5a7uO1ZlqqoCaFUS7MVB7Z93EicqJ8C6aNrNjyKaZGkiVCo2ydgSEjYomE3dtFhdg==
Received: from DUZPR01CA0201.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::12) by PA4PR10MB5706.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:264::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Fri, 20 Nov
 2026 11:27:16 +0000
Received: from MAD0EPF000008BD.eurprd04.prod.outlook.com
 (2603:10a6:10:4b6:cafe::aa) by DUZPR01CA0201.outlook.office365.com
 (2603:10a6:10:4b6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 11:27:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008BD.mail.protection.outlook.com (10.167.241.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 11:27:16 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 20 Nov
 2026 12:28:18 +0100
Received: from [10.252.3.211] (10.252.3.211) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 20 Nov
 2026 12:27:14 +0100
Message-ID: <5dd92812-f44c-47aa-a8e5-94b0c1fd018a@foss.st.com>
Date: Fri, 20 Nov 2026 12:27:13 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/stm: ltdc: create blend mode property
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, Yannick Fertre
	<yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>
CC: <michael@amarulasolutions.com>, <linux-amarula@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Daniel Stone
	<daniels@collabora.com>, David Airlie <airlied@gmail.com>, Leandro Ribeiro
	<leandro.ribeiro@collabora.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, "Pekka
 Paalanen" <pekka.paalanen@collabora.com>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20261028131823.2649142-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20261028131823.2649142-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008BD:EE_|PA4PR10MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a370496-6fd3-42ab-8b6b-08df46f93b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|7416014|18002099003|22082099003|6133799003|11063799006|10067099003|261026140227099003|56012099006|261021121427099003|261028144727099003|261102123227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	Vvrjwgz2dvwTy3bInW07vLwJiEAuZp7kwF4GgpfaD1lsVMEklKZ34ugwdl28fZZm09Dmk/xmJShvxJA7iDZ7VlgxUZsyTM+P55CppF19e9O08KzXgTb6pbSFxa/I0pUGncgZcGV6V9Mp9iXARrU6jApeA1JVDSj81KjCz6X+vPxqg1NZBJVkiRvMrece2jTv6HNuScreuJquH2t3l2F+pGm/MfiXHvtT5R+wr1r55rDCaAIxTb56ikYQMDp8qiFDMHP5pUtY+dzoDRDRzH4z5JHnsswUoKY6eyrSgeAICu+ZgKk1dsykzk/m5nhAnRStqG1GYIGwVJw6AmafaOaLnzSAF7iuehhA6y9SxxNMG1BWcHkB49TZmb/DhIi/ZDVdHYtl1d2L2EfG+YkCNdxqpcAbnW5CZQQmWsY40iafhYBoD3L8ZcrSEsBOc2H3EyG52vR3yCCM8065vsqbodtwO72UWS1lk/IQSfCYiWR2Y9bySR5wE2ouWH74E/VQt4gxjv81/19qSltU3O6u4uwvGgHqGQ3iEkxZJVMXUoyetcbwUtA35RDAb36VXS2JqwT7RLvYzEM++Zau8EX5gwY4WFMtIA6iPHXaBe38z/udqwaM67gpT6tMmmd6wxSfKeh4T7KhePcaeXsE5jbM4k6oGVgtzQOVZu0drZwLSWueJ5QLUebzzaYrzP15zuh76vpG
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(7416014)(18002099003)(22082099003)(6133799003)(11063799006)(10067099003)(261026140227099003)(56012099006)(261021121427099003)(261028144727099003)(261102123227099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IplYWouaCDpX55SCDGxByJIXTfT6rpY5AK9bfKoMVur8cyps6arw1w9yuDzyN0BeKtxQZrg0NmhcCGjsOY67iQBQ5ySroc+NpduGosscJ2V58eV08iNSwmwN7hjbxVm3sMSDW8Lxg0hopXyFvmKm/6/8PdVY5vMHulSZskYIKC0z5QZA1OQEvPfSx2rFYxy9Sf260wLWnAqrtns9x5YwbItqGnicmKVwz6b+97Yu/++U5HRofgHVKX4cw8zvTab6QzRuTHlCmmaYcsRqubHkMYRzgfnRCSepjnxwWjF7PCvrnAeafyimukISuZ3R21Qer3S9cirdGyBSB6pTJ2gDlHKgGkLzdzDBFcD018mIU09FNcDE+GJvcrOr3QTqRbSR2H4rayWgzWbo2nfkrPnmmF3BxMlZ9dF3rUOhxcnC3F1SWa3WUv3z4Gz9LTelKXbk
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:27:16.3031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a370496-6fd3-42ab-8b6b-08df46f93b37
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008BD.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5706



On 10/28/26 14:18, Dario Binacchi wrote:
> After commit 860e748bddcc ("drm: ensure blend mode supported if pixel
> format with alpha exposed") we get warnings at boot:
>
> stm32-display 48010000.display-controller: [drm] [PLANE:37:plane-0] pixel format with alpha exposed but blend mode not setup. Please fix.
>
> The LTDC blends the pixel formats with alpha by straight alpha, the
> only mode implemented in the driver. Create the blend mode property
> with DRM_MODE_BLEND_COVERAGE only.
>
> Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format with alpha exposed")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
Hi Dario, 

Reviewed-by: Raphaël Gallais-Pou <raphael.gallais-pou@foss.st.com>

Best regards,
Raphaël
