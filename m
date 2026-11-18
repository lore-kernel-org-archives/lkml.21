Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795019105;
	b=BJWKyJQgNTq9mPZO5eqDh7pOkbfx8NxFXQNLgJmTZpH4fLwWPZi3UocCepvvauroD+IL
	 WqMYFLa90owYIv+qvha27lBay1VYxCIVHcvnxebjN3CwbLO7UsQYJj7P7qr/B8iqB0oe8
	 jAP7YoIL0HHVAHo+UNGsjgdsHixb9DCXcUO+t42OO8IIrnfNkHgPSsD5CceRHfaSMQzZe
	 xjWtp9KVv5/LH4BmuM6EsDPGlGenhdK/UK7hNRUPNmKcLfI+RNwMrQ/Lf53N/C6tLjNdh
	 exjRzvauQFoeCHgEPHByoZl0ZzPJJEjtSi/RryCVyYoyp7vbZPaEEGlXvRhvjeykbxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019105;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2mTetauaIxH/w+ina27oYpQoUGqmkdI/mPFNVaU5xv0=;
	b=mfvW3CWKQfgnuZf04QF1tiOeSUH8ti+MFMZuPFbEDgyfjkUAE9RKQ4z8GWwYUGAqOO1p
	 n53QNZ2/EdOtk/2kM1IyKGxYvssNDpRbsyuV+RofINjqSaJbkSVzJCZlzue5u8GkjyD/R
	 sr5vuYV2+veWmtRxQfqvIJl79g/ERsT2FyYbg+peQOs5albXImo+SuhbDgv1SKFoe1r16
	 ZXA4lsY6YxV7cesHkp21E3l0ekctQ8TkdjH0dBat2jIvuW+MVdZxCy33hN2YMPGEfxGt0
	 kr12kQQA0H6fqJbpQ6Ob8Gkds/8+8yFjsNIjRfCNlKBD3x6z2EAaoHNwcUyvBQRLshw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=S8bubU1I;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=RttgbQU9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9495E60A260D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:25:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9495E60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=S8bubU1I;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=RttgbQU9
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQX6x2417781;
	Wed, 18 Nov 2026 10:24:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=2mTetauaIxH/w
	+ina27oYpQoUGqmkdI/mPFNVaU5xv0=; b=S8bubU1IwhEtWSG3ibzcxNa15kyaA
	1IS6YfMAaZOnbocw/9m3nY2EvmrnKooIKkOCl/Oet8JEwFJlYRuyhYmhdBL6EuM0
	0D9JVsM5XVVziNLK1GcUuzw+HBOyIR+dhW57OX0evwX99Q08wnTE5yO+Mxfv6Ykm
	UZQt6rWLoYvqhzywDbHOXC06mE3PEHaHslX8aiIRfHeGn9/BEvfq0sTPgCvVRUge
	Ia+1vPopzEED9itoHcdsgEH+TOtTJL8ofsuiVaZrvP9ZCvLSy4AtOU3w/MErSreZ
	CUn/zahBf2M41Ur+SGUA/wQo0WtIun/HREoLJ6mEWCEJVQZU4bC7t6f1A==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012051.outbound.protection.outlook.com [40.93.195.51])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j0yuw5gnp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 10:24:55 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CK211lt0Er5WlxmCF1fuclTucz4HRqxZpTzNN3ZoNF64YL8+eNwgitWldbJllNw+vdhwWZTWIY+okDTND8Yqw2aFGsVbjUAyQegnCZ6JyuaDIRcqk8ixTo5vwe5inPXHFCUXjCesKIpo0xwYu2L2IPBfUiJSyXZpyf4J8p1Hv96o/h7kfdn7lKsy/QWF5M7yF8Fmo7ZrVAO3aohN3dy+H+jMLGeMkHhZ3Z80zM06WohyYvgivF4X3NbUrYgdKusjbvTNL6aOiiDGp4yKmmtLC08b548VKuvyzPE6jXYTKqgWBEyJxH9dS16LA0sDQwHYG/WDTK9iDIlY1nWfdl1C7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mTetauaIxH/w+ina27oYpQoUGqmkdI/mPFNVaU5xv0=;
 b=FAKXqDTc+jXQIVTTXPm5lv8LPViKOiD6nnT201GHBHCthytSOA7crUaT8MtPmaXrFLHPNg6UjrPqYMv3J5rfgMfsDYQQdB86c9qR2OBO2ZalcH+rVInPPUqpkjTFR+r7t2/KuKEz26abJ9gGU1aJI4aE4Cbifab+D5lrP1+ciLkg9AfHTsZrdHFt6zSR7m5NE4i6RAx6BnE+MbTvKW7wj88BRFbrwrclWrPUXMyTEhxCnCqbtaeywqvGdQbt3nw4sKh8LKCoIlgeW7r4pnIYmcBn3sZ6lx0W9k3kASV2m+2kMkJo1vYXEa21K5diV48Cux1JwBujK87UjfWP+FMNtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mTetauaIxH/w+ina27oYpQoUGqmkdI/mPFNVaU5xv0=;
 b=RttgbQU9CNO6EjsJ1S/oWJztkwlTdSOEtcZZdvoHgsTIyYV7ZMdQSUnNkQgANHvhXzcgTDOWGqAw8uApgnkpooxKSiB3+blCsSDm0qNsXT7RrnO5yWNpt7P+K0FhjPXGAWC5OkBQdBsRFe+lytKs7g5GaUUZTXSJ5v+QU6Kf3OA=
Received: from BLAP220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::24)
 by DS0PR10MB7203.namprd10.prod.outlook.com (2603:10b6:8:f5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.10; Wed, 18 Nov 2026 16:23:32 +0000
Received: from BN3PEPF00022BCD.namprd03.prod.outlook.com
 (2603:10b6:208:32c:cafe::a3) by BLAP220CA0019.outlook.office365.com
 (2603:10b6:208:32c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 18
 Nov 2026 16:23:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF00022BCD.mail.protection.outlook.com (10.167.248.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 16:23:32 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 10:22:51 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 10:22:51 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 18 Nov 2026 10:22:51 -0600
Received: from ula0226330.lan ([10.249.36.95])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AIGMpQr1337130;
	Wed, 18 Nov 2026 10:22:51 -0600
From: Andrew Davis <afd@ti.com>
To: Srinivas Kandagatla <srini@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH] nvmem: m24lr: Remove use of i2c_match_id()
Date: Wed, 18 Nov 2026 10:22:51 -0600
Message-ID: <20261118162251.233513-1-afd@ti.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCD:EE_|DS0PR10MB7203:EE_
X-MS-Office365-Filtering-Correlation-Id: f50ec399-7290-4c73-8986-08df459049ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|261009223027099003|18002099003|56012099006|10067099003|261026121527099003|261021123027099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	K6WWYb1FlLGH4KR17TYj3mb2/2abgUke6kv6PhL7uL9vMWKqlQmgyHmBadwj6at1df27MF2W02wWuRfkE8+uOAWP4F7eyL8TPY7oX62rQfl9lUU/cjul646sYPQfxoO0ar01hsOifD65zyBXjGRdQQ4K4cq1gza03zvbhArNALEPuzhux/H/cagKcx/UU55YB7mqGt501jek9rTKVRxBEk4bepjwByj/KEB3f+fgUP+HH/Jl1t8N9jzGbP0if6O8h40zg1wQQcM+QFaZIeeSAKpgbGKxJ17Qdd0r7LadDPLwk6fSc1yBH/lGJO6GtAMP8eU93IPqykKOgWZDu7g7QiWwzgLzLa6561mRr6y7Ty9F2ciw2qgnuPagNnbJLKriSZd3H/6D1QwMLvtDvbc0l7lyEVsdjG38ntj5qu+pKnqAEpQEJO5v3elxcOjEdOYX/uSMuH89eddlOnoK/MzRQk/pIYpTqa/J77JC2hZHUcS+1HxybFgQlriPVL1BBuwmfoVvkMuLgnZUn0u5OdRwDAtuO63Ox4c5Or8qS+TKgOV4N9cqMqt8ss5IaRVhWqFtUha19njtwAW6SCYv+swbAzhzn4X3C03CL79hQkqwn0OfNGdGmhuKZeCRVRpvnXghj9hWwHLZjTeZZHv/R6Dgca7b/hmMeZw1+IE8J9FMKtdIsgpHxc92EKUivrLo0s7JCG9VQwUZTm0swddr+ktHkw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(261009223027099003)(18002099003)(56012099006)(10067099003)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	adZsDY/KSY9KYJDwcrEiSZcfSbapZOI/rQM/Sv/WIpWe/oN0h2r9CiAfT41MfAA7Dt9dk3TxTaMyQyr1QJRyqZQp0mHMmTA8qYe+1qvfP8kzs2Jc5uCuC2uv97VJDEx5/PtdY8RubThbdPKFSHedA5KNUEIy80G20riwJr8TRvxWqBN7GlKFUGaiL/GwcykvXOtSlbEd2q0ASV1WIfReIvu5BY1X03ogc7ZfXJNh9uUaoRzzk/z/Q5tgCXlSUd/fAtHCN4fouGalDfT45k1FvRIKrMQwktfYndS8uF4gDVVO/oOTtHbOr8/zjNvnay6/2tLdv0DRDYKMS5fJI90zXjoLJ8HD5Y5hx+28HA1WhKDJ5Mgj/f1TrAuQoY/0HAuyiqn0MoDQcRMt59BuL2dp5StiVbWeE0ZxCwi/k6M2Qvd4ke7UnJmoSgupsX3LQP2R
X-Exchange-RoutingPolicyChecked:
	YSZeTgiD6Pi5g1ymf7e/I+HVGZT5K02/anr+ljtjuUkZfRM+q5L4RNCifPEM+1QMBVx0aDpWRNAAsZWYct3dOCmF0KsSQBqLYsNAsMvHFWDMApT2rQ12rVzvbCnggFHrjQqgdBQhQSsrYfJ0AZUJRASkqF46hV4Dvgu/79zHhRznZ5XjTUJmzB90E0OY1pk79ACcBkkCJtgeOZPa2AdKT9ugoluhLPLHwZltyFPNcBSUUxutVDvKNMYb7UO7kdruKJxGlVq2Oh131SY60whcsFDBj+cbI1rC0QoKPTBHz8COUQ0cbG3lOPlJJnwqka8VkNkA9e6ddMyqKFhfM6gWdw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 16:23:32.2472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f50ec399-7290-4c73-8986-08df459049ae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7203
X-Authority-Analysis: v=2.4 cv=TJXQ2Fla c=1 sm=1 tr=0 ts=6afdd157 cx=c_pps
 a=W+em2WlbpAENNNrDSTAr1Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=BZu74sByf_Ay_wggyk4A:9
X-Proofpoint-ORIG-GUID: QVsmNG3FNSB-KCroAcPrhsQPHQ8eP834
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NSBTYWx0ZWRfX0RwEuYF0aMi/
 BCdjhsZxEWZ1+gETXpRG8rpJkG0Mt9oaBFjTsiJ8JK6TeSoHFxjS39R/5v5CYlU6AD3SyTITsbR
 iTY81TlqPhubPIRmANBld4iV2n3A0CTe/vxWCHUc3403vU13iPuMy0E1ofas98KN5F6ymnU4+d0
 aRpskLxgECZhwS6Xg8FlfMMrysuuFTG1jN5LLVVnSf4WGywB/b4QjL+xACaWQ4sQnQ0uFuBuZ/K
 8b0SWLzzbWaCtSg6L4nKV8wj4Zmwz0qE772MAihP87h9u0cKkldq2Gdn1WfHVPtgSckQiLAo5HB
 PEXKooEzScd6hXSS1iQoW0e2RZ9Rt2dolbS3NLqvfP2zFnedo/gS+9GoXMRGQ5777+/jz2WBYMA
 rEN5ToFx46JF+1K1qrzUvLcY98K3RpCdxoXYAjB+R2ubz+oTYduwQ7hxkrYE2urDVlPww86csYZ
 U8HAZyN/QGGYdhoCElg==
X-Proofpoint-GUID: QVsmNG3FNSB-KCroAcPrhsQPHQ8eP834
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NSBTYWx0ZWRfX7ro72vo094CQ
 i8GxRhlpSg8QC3K/+G/d9z+GUWF6Xn2hLXOYRMY6miuCrmvgDCV9O74zKU3wE2WWDBy7D0P8fpO
 mEuzpcvPVTkDdv3ZKK9tVPypx/mrVss=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180065

The function i2c_match_id() is used to fetch the matching ID from
the i2c_device_id table. This is often used to then retrieve the
matching driver_data. This can be done in one step with the helper
i2c_get_match_data().

It also checks for device match data, which allows for OF and
ACPI based probing. That means we do not have to manually check
those first and can remove those checks.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/nvmem/m24lr.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/nvmem/m24lr.c b/drivers/nvmem/m24lr.c
index 04bec3a5b1380..769996f401282 100644
--- a/drivers/nvmem/m24lr.c
+++ b/drivers/nvmem/m24lr.c
@@ -468,23 +468,6 @@ static struct attribute *m24lr_ctl_dev_attrs[] = {
 	NULL,
 };
 
-static const struct m24lr_chip *m24lr_get_chip(struct device *dev)
-{
-	const struct m24lr_chip *ret;
-	const struct i2c_device_id *id;
-
-	id = i2c_match_id(m24lr_ids, to_i2c_client(dev));
-
-	if (dev->of_node && of_match_device(m24lr_of_match, dev))
-		ret = of_device_get_match_data(dev);
-	else if (id)
-		ret = (void *)id->driver_data;
-	else
-		ret = acpi_device_get_match_data(dev);
-
-	return ret;
-}
-
 static int m24lr_probe(struct i2c_client *client)
 {
 	struct regmap_config eeprom_regmap_conf = {0};
@@ -502,7 +485,7 @@ static int m24lr_probe(struct i2c_client *client)
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		return -EOPNOTSUPP;
 
-	chip = m24lr_get_chip(dev);
+	chip = i2c_get_match_data(client);
 	if (!chip)
 		return -ENODEV;
 
-- 
2.43.0

