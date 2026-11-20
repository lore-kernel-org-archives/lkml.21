Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795183015;
	b=C4DTnIZyyrA3qeOSCDr7og13phL2GbIewd6NzGU6ED/kxt4/24mDZQb69xe9nGxKkIrH
	 iwSgq1ZZjbg37Iea/irAGOzJNgGL6C11ZH2YR30ei1BnVBAz51U0jarYgzeQxpeNhACr/
	 pWm495iFXzDgfNwZ2anS4N/wnC6KsA7jcx65XYboKArw3VUHFNmeCnmM8oCyPI8cj98w3
	 hr9U+TUtblcjmsUbFK+2LIjVJ/xxvzHMRqtvtoZMeKqTjvOwT2doHCvD7diTodmWiaj94
	 K6CibhR7GzA6ORAHdzLR5gyminDArH7e7CHjm59gn8d4F8YvZ66W1kK2m0H2GdHVILQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795183015;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pVPluKZtYy7M1tPr/9/4MzyWZceNTmYLTiqehR1Hpuk=;
	b=OlOvdcu6KtP48ZevdXmYAcOhx4CsZbHIlpI5VxG3ensRG1JUuBhyY8VacJ4fuZhCjVNG
	 JexjHPCbMa9KcYDvdnxlDUXYLa4Zjivw8pZnyYjZmER1ckFgQ/RPuCsk2zHlIiUQenGsI
	 bcvIue5L/c2t5M9yApQXhlz0C/FIVZHuslXomiG1hYVWOI7nQWVdFDq6P7aU9X7fXpYeH
	 jXliwf2kJ3spJyGZFrLvx12nGjk8dwFeOug4eihCoThQ3Nev6EK8tTdw5wN4NS//jTgWa
	 rFRNWazoepxTbV4wcVTIxrJatze2686ugfCDnZm5bcOfmKezCNYQP9NrFG3MyHFoBaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=E5L0iyf7;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=ksOjSMBG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD159606ABD8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD159606ABD8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=E5L0iyf7;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=ksOjSMBG
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkC303505222;
	Fri, 20 Nov 2026 07:56:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=pVPluKZtYy7M1tP
	r/9/4MzyWZceNTmYLTiqehR1Hpuk=; b=E5L0iyf7OpKrgq9tOYjluTdf2pzRpXT
	gWm+xbErohcX4frWvcaIbJ4P+9LCarRqFXRjd76mJaRkzo/UbzNDE6fH7va/T1zN
	tL+0FRee2Ym1m/VK2ZZZwrpJuqfuBjX5bdo/8hLKV0L8UFfnDbt6Bf3qupbw3o/R
	+9RQiGdTcF4w3kPhT1xo6K2aTph78jMFkIikLNfR8qUcElc30wxTEK0zezykQ6bc
	Eu4rA/gT0yo0QGyZi9VV4E1tcT3sPhP7LSPbR5JG+6U8OnQ/wQPtzq9cbfXzUEEZ
	537wh/0d2ZBqDi3fxJ/CGE1useQhzRcd1UZrirWDRTBG5SzeTt7AbNg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013060.outbound.protection.outlook.com [40.93.201.60])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j281nmp1y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 07:56:38 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8Zl3dGi1nXcwP+6UIHJnj18G0NtNYTppKy1RF2syiY+F+hyT0+dSET6nPMu3rt+nlWZmM1FX7+b8ZobjAsUUb0kgz6zZNtp0O6WYrIpE37KHH2XIwL78MGoMeL/S2u4Lr2yGuq0HLtqNr68Y30E4dr9JQSTTkNQOv71RiD2QeqlTiSemQtyfMKosVec3z1ymmofMETE7a08f8etJ/PXotmXyoO9z8UhUbxphmDwqe/EbRzPmGaZMnnqDfDRxuPVFjORsSuR7BWhFGTkDx+kmwDu80LzNiYrjNTlTzx1eLLwm48gqe/U5anyM2b7hwQRAlrAzloTCRoWl6VCVYGSEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVPluKZtYy7M1tPr/9/4MzyWZceNTmYLTiqehR1Hpuk=;
 b=c9gJYHQ3MNNlSqXlAYhMKOuhLAVM5mggyGyxdFY5TQAaz/UoxY2XcZRJtIA0WS3h7x4F/mMggN1sO6zlIpPX9LKktV3U9P6z89SVpq4u2faZPaI12iVpha8DxmkBc7JD49Q3MXtXQRVnPDMmDhYqM3TVisciQyn1Vrom4u90tl6eM2/RXYQvvsnN6b6OqekrYLa0RbPNaZJXCDs6iCBid2Ihyyp9xT4Ejy1IVDpbg55wzrk9JGK6YWOlUZK4bQGu5nESid37aC+beMt8Skg4ff7f/ysIJNizzrnh1LrCrnCBvTC1vGhw3W91ugWWobos4Xz2DJh8XKxsTVI+cjfUZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVPluKZtYy7M1tPr/9/4MzyWZceNTmYLTiqehR1Hpuk=;
 b=ksOjSMBGBlwn2NsnT7w8/DrRITOC/6WRxeArX5+stTjP8wCzHqxhDN7U3d8u+OHe5dfwYmWSyDQryaG0PA50u2AMCJZF5MVdeV+ct221+GhjnkhM0dDfRbQWCoJdxoNokS5iIonMdue9CppsT/eWLwdhPoWdpADQLCKrVLpHeHA=
Received: from DS7PR03CA0056.namprd03.prod.outlook.com (2603:10b6:5:3b5::31)
 by SJ5PPFDEBD75B51.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 13:56:29 +0000
Received: from CY5PEPF00000E76.namprd02.prod.outlook.com
 (2603:10b6:5:3b5:cafe::66) by DS7PR03CA0056.outlook.office365.com
 (2603:10b6:5:3b5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 13:56:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY5PEPF00000E76.mail.protection.outlook.com (10.167.247.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 13:56:28 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 07:56:11 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 07:56:11 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 20 Nov 2026 07:56:11 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AKDuBKe2222304;
	Fri, 20 Nov 2026 07:56:11 -0600
Date: Fri, 20 Nov 2026 07:56:11 -0600
From: Nishanth Menon <nm@ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 18/22] firmware: ti: ti_sci_device: Move device ops
 into its own file
Message-ID: <20261120135611.x7wax3jnjorjpgbk@sworn>
References: <20261029181147.266771-1-b-padhi@ti.com>
 <20261029181147.266771-19-b-padhi@ti.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261029181147.266771-19-b-padhi@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E76:EE_|SJ5PPFDEBD75B51:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b2926d-e020-46f4-e01c-08df470e135d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|18002099003|22082099003|261009223027099003|3023799007|13003099007|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	mO0iN6ZWrYubsOxC+3RGtmw5hIlHaDz0Hv/hX+i3QiIbpoet9fq3KMXv9kZFtuxQUFmxv0MXWzxnWuOHP6OfxIaXfOp5XurDmwyGmX//aooN7qOvCIdG/xJp37XiO3a/cDeKVeOL3Qpdm6p8KAY9O5fgOC6rhmuImhDjxxFFMq+mykTzcZezF2Md/NIIMlvQeVVENYj29VpaI1GkP3bVNo+hkYAcODdP3XroGMyBOjD0CLh7KZ/NfkAltWpKiiZ9P2JX4dmtG73GrlOFVPVbbbmosZZ2wHdVqiJ58p2R+j7DwnqZ7SbW+12iXAgcLgD22uug8bBRLDCG7rnAJAGlVWTs/j+Zd2dRP514IGSI3UnvoLV7HjUfUsQ+vDiefe2cIzIWYHtzSnyTAVRMuM8ciS6gsUtWwxnRCqj750vKHZC1kxtcWZUHTn39k3foVV8bmzbuNLlowPiWNwRJIHUWz6IczMc2WsLoMe/IzLMf+VncDaZeRn5/ftIR3YTf2BRYxi/aIXbkqoo3PJsPg9J36XkTCZ+5RdBDBgY3wEXyf2cJo5vSrwtTfGvYJqxRY+7wgUc+2r/xm9iHx89Io4ZYvZHGSiqwnjCN2TC1scHqj/vRzINFqG5ACSGjuJEx15qB4FU7xNJIeaxvJep0yd/YsBjK2vEqNSCfyIW1AUYPxFtLEs5a2kKogbQvlidgp+saDgGyva3JIjvKJiX+NKiNpw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(18002099003)(22082099003)(261009223027099003)(3023799007)(13003099007)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iedWKJE3xomP/771bNLk62sBBSiiFguJXs4XmPpHE52Hf0fyY2kwsVZouCNPKhADq/FeJ0Tp99w0rGwPbRKdvgW93zsVIEJLzfjPb8pSkvVYVn89s+LCIn+EAv9BFdna86M2oRIZT75rD0QLqHeFkyjDhG2SKilnDYPbm5ZR15vWo9wNZFLanMjHs/iiOuPH/QA1IMy/J+JD0uXXGX/IOwTCXMwJJ25m/0beW6WitsGH1GR3pIpOLuFlV/7FCrKOBHUZXjMvd8DZyJIq9/3LAjPOT69TS7Ktl3FezlOOfIeC5SdpxdZWSu+Wu9MtpbBKdWYduiE8Xlq1RNBPOqEqsBX/ZX7TvI2r1umusjf+2Z5iPnH11ijMER6mlau2dEaWB/c3YBwGzi8NNs8703k5dRvEwYU1T5V4WJwsNCl/8UTlZYZOnspoRZR8+vJrzrVc
X-Exchange-RoutingPolicyChecked:
	IHfFvNuCiCgcOaJBE8xIR4NzVkIlakW/UA5DDXMeyLO48L1JGQ6DnIkh0UEgxz1/gMdi/zOwqEaITSui1rCm+fi7yS6n3gK82RT5xk8qJloPXTrziJ5humHkvBpDERJMrFTbYUR1M8RhnbqSNX5+h0bQ183dakG57qM70lZclRV61d/rws0K3dsdoNqlk8E70Yrlt6sfPQemvH9iGbUGT6vOkVEdop4yzCiIXIvwEE9i6SsAlBfp3ylplT9uDsh8lWVKRw8uQO0wtW4xYr8Xz/MwL54NiUvPXxVUNRIogIGbGAKqqh6pfCINHlNCym/th2ZJ8UNmUpWLqFdypf4y3w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 13:56:28.9118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b2926d-e020-46f4-e01c-08df470e135d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY5PEPF00000E76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDEBD75B51
X-Authority-Analysis: v=2.4 cv=aIZlOr9m c=1 sm=1 tr=0 ts=6b005196 cx=c_pps
 a=7wCTOXyfr6KSlQaUtw4X3A==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=42mjkADebmWaW0i5W7sA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NSBTYWx0ZWRfXyy9dcIjv1WSN
 4EPwCs7vg0llpiRDUi+C3H1vRP7tz83QYh0T5MsD36Gb03ma/nbGujXXyfq5/z8PsC2hMqUSVRJ
 3BAi7RZG9KZERnnpUsuLslI9I+LeNTA=
X-Proofpoint-ORIG-GUID: 2e-ZwIyod6bI9xb4CgJ6-h86V4oVlcs7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NSBTYWx0ZWRfX9lRwZLj6sr6N
 jwCZ7RZDxVxinj+KsfcbZcWw1+fyFwkLUUA0lKThmuiP11SrweJSJH7McT/jMqXWkZKk7zr0MjZ
 89XcdJToHYGM4Sz0L1x2LeXY0gHZIqbawWsyO9gJ6BIzwn4GJxhbPAkBROVoUS2B1X1qSDj6C4c
 XsgPoOCxunSK79a2H3pfPmzdGSkZfP6SpK3GS4dE8hXP87cAHztcJgujyK4t/E5KcReqaneYA9N
 SyHb+I2mP/HT3hAT/UIFZ9rUJHPpDBjNZscJG+v9yu8PZB/CbrKBt33nchI9RxNHhC81Ob1nfbm
 nBrvvBP9GckUKB1A9zD/JsAvF3vE/xAnl2BEOyIybO14trMSlnztouXu+ZwiCOg6/u+8unkY31t
 xFk4p8zrHmKrCUcEtRLvvki+Rx7h7j73tD5gGRF0yXn7BK0oiiiSKuSeLf7jvKpYms172cJ16i5
 E+JGYKwc9q97jOpfOgg==
X-Proofpoint-GUID: 2e-ZwIyod6bI9xb4CgJ6-h86V4oVlcs7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200055

On 23:41-20261029, Beleswar Padhi wrote:
> diff --git a/drivers/firmware/ti/ti_sci_device.c b/drivers/firmware/ti/ti_sci_device.c
> new file mode 100644
> index 0000000000000..cb9888ca54a35
> --- /dev/null
> +++ b/drivers/firmware/ti/ti_sci_device.c
> @@ -0,0 +1,388 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Texas Instruments System Control Interface Protocol Driver

^^ Fix this please while at it, please state what the driver is for
(device control for example here)



btw, Andrew, Beleswar, thank you for cleaning this up.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
