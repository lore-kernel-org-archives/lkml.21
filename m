Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795528805;
	b=t3wreHVCIupwHQr+FbQrbZtqkjQoSgLPtQnUDhGVrPHH5F8f7g+oXqeFcVEfbwr+YbBz
	 iDwS1hc46JA9YUNgPsAJlUmLKfYTA35Tq4eN2lGfu3C8H+2awwP4SJvOuB61d36L1gF3o
	 iGl9nt0yISaaC3GY61by7Ixcud/dwY78J9n2XfWT+gn3291k1Wx1Fm/mptU4ejqhUjiax
	 edcxHdN95w+XOTFBFi9d2v3NfflDpVLRhwYRWdbZq4Ba36klC3HwQTs8qqav6+tUc/+X6
	 d7Yt0iM5HsAm6/vPB+ife8NGTI0t/Q/QSwhwHp2L2nA6FK3IJ2im2jQx4THOkxdYwew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Reason;
	bh=sgQ/mK4KLjW7lpoX5LfcBP2c4q3gFY88FLafFCYrXLY=;
	b=OERu9M3NLOgZbvcC0NxeJAJKQNKUaq1p2LNnMP1q7/Q1rM5mXtlnvsR9HT3ukvSdMv6n
	 khs0JeLconFwOSkcSBSpy1gnjPyHZWnRCthnkPcW/s8dKehz8FDo2XFRsIEVuT0gGMpCV
	 CY6cU3jDBg8NkZOKPkvq6n554PfBLdgXSFoCMQ2FemNtT5tYdSHkMM4jbGOMkyqf9jtY5
	 48oKuRyaNw6W8hEpX2NNHVtIxTTzNemn7oQowF/+XuW5sFJAeH9tIsStdbldYYS6/1s6j
	 R+A9oE6tnJV14ESVtx4nfUqCQiPWgyWdoxksNOYhW29N19B3MQvYBFLRTHvH8jYbEtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=opensource.cirrus.com;
	spf=pass smtp.mailfrom=opensource.cirrus.com;
	dkim=pass header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=nqPDTGMg;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b="F/CoTeDB";
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.149.25
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD99606A68F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CD99606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=nqPDTGMg;
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-cirrus4-onmicrosoft-com header.b=F/CoTeDB
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOCLhue3664576;
	Tue, 24 Nov 2026 07:59:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=sgQ/mK4KLjW7lpoX5LfcBP2c4q3gFY88FLafFCYrXLY=; b=
	nqPDTGMgc755dykRuCMYk0hKPYjCIeZ7gAl/lJulHh0xjGH0PKAKRfvJgQViVQAo
	q/QP5RaxPO41o1LgSMv6ik9jNgjktjxJoH9jrIGp3c4mqb7dE6PpExS3t0NBrZrG
	RJ3BOJbcidHGRtI7pNLDxZd/ukClkNyBYxb7bVMCZlL+LjhNxo1OJ+nl+OK1p7/f
	+9vwKGVjsgVuvWtPRfe6VFXU7J0FcLZ1FNvF0DtLNW6g0vAML7CdF4Rw6BODWPZQ
	KWnKMy7bfbXY812NbkmITKyOjCIvAD5Svi9gzHkcJxE1t7x+ZWtPpThyv1z+uNj7
	VZpVWBz96Jv0F/fnaUsURA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023133.outbound.protection.outlook.com [40.107.201.133])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4j51880q62-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 07:59:49 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsgRoB9GZsOgWYELM2ILo2VJu5JQuP+b8VsZRB397uZtcMlMkRG3js7VxEDOfdOxE8cP3AB7fpApfBZoG8zlGnEOm7O4pQ6D5dP17WvvIhr+V5OBk0SnuYJV7fEQEwRpEejgCKblAj0odQLzGdMIob0hiwe+B/8RSfghFGUuh0tn6pF4Bg+7Xv9Du9Z5KvFwe5CTs2QCz21nTLI+1f9WkC7DIRmbfydewgBF6eva3r6Lpf6Ux5l7rdI3clLBwEasI6QcphC2ORL8VpHSPElnHfYmhex6VreBLh50Yrf2t4P4MEi/xrXZi6ZXxByPznGeyiXP3wMcjtyvQuhauKNGLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgQ/mK4KLjW7lpoX5LfcBP2c4q3gFY88FLafFCYrXLY=;
 b=mNVfOZ1Uq8aMR5qa4ZyHbpVQtBVx6h9qta+ospCsBBQ1ZUylSAKSjS0crYVymAC/ncQnyUs2DzQw2F7ZFRaVYS7ber80Vk2fqjYW4trLoOSOiXtKtqxxqvGiGsN6YffWhzqVi8bhMek0tH79xyc6etkRKAtulqs3EI3I9/Vcomil6d9+WHmZlaNCwACLhS8XrAWm9dk3locAsSDTVKkWfZPPd9WDwN+DJcwG5a3YFwbzDSLEd0cvnlVBmZm5cSTfL9RKtZzXHfvip/f+ScZrB4uOlmGZj8N++200IzWevGDjkYjxhZAJCZsgOItDFucd1iEYeO+QSq4VmS67y4Dipg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgQ/mK4KLjW7lpoX5LfcBP2c4q3gFY88FLafFCYrXLY=;
 b=F/CoTeDBb/rSZ1aojzIIpN20MEmePTiACLmDNxUkg9saysBiOzuPX5RpXwTA1yrQf9CuQnX2+igjw4dae74wv0GfFOodUICpHQyURSPOlzC1mSbtpZeddeadPjPMfKT606FpLsrIwZEHnNRKRl9bXnkYOdtuhFnxSlsLS8oMKqI=
Received: from DS1P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:451::8) by
 PH8PR19MB997206.namprd19.prod.outlook.com (2603:10b6:510:3aa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 13:59:44 +0000
Received: from CY8PEPF00000050.namprd05.prod.outlook.com
 (2603:10b6:8:451:cafe::92) by DS1P221CA0002.outlook.office365.com
 (2603:10b6:8:451::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 13:59:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY8PEPF00000050.mail.protection.outlook.com (10.167.247.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Tue, 24 Nov 2026 13:59:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CDC54406552;
	Tue, 24 Nov 2026 13:59:42 +0000 (UTC)
Received: from [198.90.208.12] (ediswws06.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B9648822542;
	Tue, 24 Nov 2026 13:59:42 +0000 (UTC)
Message-ID: <642fac8d-4589-42da-9a46-221bd4fdebd9@opensource.cirrus.com>
Date: Tue, 24 Nov 2026 13:59:42 +0000
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
Subject: Re: [PATCH] firmware: cs_dsp: Replace strlcat() with seq_buf in KUnit
 tests
To: Andrey Zakharov <dedemorow@gmail.com>, broonie@kernel.org
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        ckeepax@opensource.cirrus.com, simont@opensource.cirrus.com
References: <20261124113655.610791-1-dedemorow@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20261124113655.610791-1-dedemorow@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000050:EE_|PH8PR19MB997206:EE_
X-MS-Office365-Filtering-Correlation-Id: 616a0530-f03e-4c8d-3e3a-08df4a333171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|61400799027|376014|82310400026|10067099003|11063799006|56012099006|261021121427099003|261102123227099003|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	GZS/iV2zgQHNd+NCfRWxDcvuhhdwYjpMfbsIVKy3QQ+BLoaFFWoddo4I7crj4by4UYmfCNz1r5Wh+i5SumqSmIbB8Kz9FDYgLp1ayk54UZ4jWYO9gCh2bMHhVrmE3qsRGZFQiG8SbGN4M1h3nghbP6bgUHHSt8Urm6bj7dnttrW0rNzKSsdo9rOgpX9SFo4tccrIZSAf1HG9UpEk3WhvCQUZZ/qdhYAPUjMZfWe/Cc3F3pirAgnlNnWuttxSaC76JRsbwd3TBOtEV2gh8Yf4aqW2QPmJCLlaTpYG49LREijKrOmCF1S74IlKqattf2WD7viudnwH3JhwHIHc5weZdVmoP8EHkmP4/u6ZYf1QtksYgtJR/2oSQyI5VEZt5QuwCQRUx7o1UUJJVCwkWc4Hra6dUlY8MWCUdU41n9HuY5PJuPLTHRbxUPXGmfbIdjnFQUzqPAavgXqJNsAKuy7dbq7UipW75XpPyAdng87rU45I53Hojnjbs/8wwR1WkEWDlCx1Wgej1UP8U7nSEEdbkclnpab0CkiYeTedj1ebgmkXMLzSvW4SYNWcov2j/ewbnHbsC94F+9PeQbFuoEEJSrutcFDqjJVeJfqb8T/KzQ7nYCCxCtqxK14T5T5KWoMmgHsYp6QB4zJwneU8j+H21qRuRe4vp1jupczcBV9Szj8tQPNNOdAUeVGH9d5WTRaqg2XfoZp2Pc/QnskScC4Dlg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(61400799027)(376014)(82310400026)(10067099003)(11063799006)(56012099006)(261021121427099003)(261102123227099003)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	L182ExZOqnDN+1Sr7HCz/kn4VHgu7GQ8Pu+5mR5H1D/AHcm2g7X/L7lnaVezQPf6TDJwz+zJbdxe/HTy+e1hffqdgv41IH8FcK039uyeXxmfRqVR8B+/dXHlRiJqWvLWgh3wJCphlKrt2ikHShS0GnuHDwIzY32LbdJX28VEVtRUmep+dtPBKeNf7TPjI/xTws5v5MtygxGu0PHAEyiXcKvS3b0JFz/Ak3RJjvRnhowE8v/zoeg328LHpwnWhKBsTIO4OvQSN3Ss6XcEXq33TMrhPvKN6j1QDy38lU9u1xZO7n32z0qu6RPHh6UFO2EJYRch+YKvLS5Yo3zdSkzj4PkxFcWVZGMOluJdKTZcQjjuYjr441ZM5kkNyplHuHmOrGyULlyXV80kH2RPmj4h2VqA5/M0bIco7eRHEh+3Y0ZOjGVah7nYwu58f5ddO3I1
X-Exchange-RoutingPolicyChecked:
	L5HHLJBEU1/3F04h+H8rmg5qOPycjUEVTf0tWeNCtA3GfssvQ9GGC1ucwS1cXNRbDqfigEGNNMtU0AGCPYwtij5aWMClp3EMJu3ByttlRSHJaPw0c2Tgc52dZyz9hkum4zq6RbBSEf4NIAuCPF5HxNIrHmyNIMhxIxB6X2fg6UyPecsyCwhhP1s97g+G6Kf4UKZm+fceYaiIjAt02f1Jxhd6Llg1NzAwGXS0s/z3AG8P/KBuhGGRbcv2o3AzwwNuodvaxxcgRSO23i4/c8B3FPQlbCFbTFeK/1XkPLAr22PvNCUbv3hrLIvEZHlOXsp2pd1+ELm7xin6pd4D4qCwPg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:59:44.0217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 616a0530-f03e-4c8d-3e3a-08df4a333171
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY8PEPF00000050.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB997206
X-Proofpoint-ORIG-GUID: BDXRxteMQ8rAOucdxL_16aLd5j8fHED3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NCBTYWx0ZWRfX6nouoAU8mTnb
 Bis18XfPNcKp5cgT+B0wPYfruEglP49Tzn+lHLZ3EBPJJ15XyMq8UkpvBPaMu/f9wlAvMtpEVuE
 wwBWh1IoFtS3m+fwcOwAZRPiujVTLwhnN7GxASfx1NXQwA+/KFZ0HY1GNK/TlVbEVRHcXKO5LfA
 GfFwtmqHAmaqFFcZbEJhYsJphlKtVJWpyblPX4nv0EgBWmE0Bh3VLxV6sN72E5ZftZumPtmsaz6
 wjwINJXxhB6u/kR+MTbbfftaHAAWtEFAOpT+PrYQ9azv+n+zJ9036tdjwVm9ywSyJBEKGNAo0Aa
 EVhoKxkg8/ple25WMRYZ38LtRHJS0Yr1ktM/QzzOymgTsOVV8SAXFbPqHTysHCuRsPNlk+Ee4YC
 sdfw4NaItA+UyQlB7Tj7Ru9FsT+axb49PNiszRBjoyNHQpOzu67CZrnAZ6eQ0tgwMza5nSdt1+c
 z6oj+CVUnlegqRW4blw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NCBTYWx0ZWRfXyuFKT845eOnJ
 stOvhRwkEtBSpGGmLINTKWxaZf2NZhjEZwj3odiZbVmZvbzI+iGwp4s1k4a0TmovwiFnDQ48haA
 Yx6ayFpVAKD2cmFkLx5ekKQ424RJDLc=
X-Proofpoint-GUID: BDXRxteMQ8rAOucdxL_16aLd5j8fHED3
X-Authority-Analysis: v=2.4 cv=BuEIUoX5 c=1 sm=1 tr=0 ts=6b059856 cx=c_pps
 a=4JgRTaXVPfESfdVeiImlhw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=hI7SJAwvX4m87Qk9KnMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 24/11/2026 11:36 am, Andrey Zakharov wrote:
> strlcat() is being removed from the kernel. It runs an unbounded
> strlen() on the destination, and its size argument is not tied to
> the real buffer, see the issue below.
> 
> The bin and wmfw tests fill a 512 byte buffer with a repeated string
> by calling strlcat() in a loop, and use the return value to detect
> that the buffer is full. Use seq_buf_init() and seq_buf_puts() and
> stop when seq_buf_has_overflowed() is true. kunit_kzalloc() returns
> a zeroed buffer, so seq_buf_init() is enough here.
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
