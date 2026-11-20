Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795182265;
	b=rt/pH21RGi3kMCNA3MX2PIu3lc9UV4OfK3Qvlrjz2RWcWpXQktLNfeDaimph2y4vDF4O
	 W9xqzCGEGZWpI4fLZQ3bwGwbm0NgYkVq1O+An9kDFMl+K+w1BRHaAa0BnjCshgncvw6im
	 JXa4nbVq8WUjSF1Y6L2af6FOu/5D63st7rj4apdhWBPGzAInu/KHM/sa6udUiMLwuiHey
	 XpLv4g7uVezxc4EkWpkzMsaNJp1MD0qLwRPRG7ur49Z7fgbzl7quAKg6dicrho852Ox14
	 jziye50WK6hJJNC+vRZhM4K65k/wbMrye9gKXHh7e/tBF1sQJKFsxFligahETG0GhtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182265;
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
	bh=SChqABccqlxWm5dNMavLgttawIN94tLhOhPFfVH1XQw=;
	b=WUUNsAOIk43B5B7Z8DJcrCtXkswJs51BeDVrvKVt27eA8K7avSpvcJjM82FSVzClS1Bi
	 DvrUR0WZIDHfRq05NUekdIViJR4LSdq0d3HSaTtNHf59ilEiY8b5nUixehaD7jMM2zMwM
	 +acu7ohiv26sjuBz26DUFhz/DKEZsX4I1ljUKfStSnGW9b3vz4I97JXPyQT51AwdwFU6/
	 cjuSX+IOOVZGL9NyMr1z09jX5sl3vTkdY+DFRMwLnR6HSz0gj96tRs1OTsznRxqezSk8A
	 pzQQJv8lCdzkmq6vzPJ35/ZU/9GA0YwHzSO6JBrFZ4FgtqZqa3K4OjeQzaAs12AR4bQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=PRkJtDUd;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=m9Ay7ElE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E988A606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E988A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=PRkJtDUd;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=m9Ay7ElE
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk7SL3505027;
	Fri, 20 Nov 2026 07:43:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=SChqABccqlxWm5d
	NMavLgttawIN94tLhOhPFfVH1XQw=; b=PRkJtDUdZaokH+AXi0zqNEdGkH7NX7h
	ugFdSXmHB91Xevlh3GMMKP7I33R3eRKyOipaD+u84YFJy02oxxru1ySS238qJv2o
	fyKd0h6CmSMIzgJrvdrhx1lumRV6pzUYMwGFTDpXNjhlb5SDmG0U7SKOOO8ug56F
	v1UQ6f4cmYkGPat4fd0CKglgLpRYLvnlC3CRrKRCr5qdeimRhiQU/n3EAvHTyBc/
	5BGbcEuLEOXMVbw3nGv0+eee4aVZBsYDZ7hMcqo+gAiy6UJOYk4983v+5i2udUSE
	ZrgDK6SXI/V1dLpuJ28IxKKb5B9HHTMWrm4v6yI6SMnKnuC14kwsYFg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013043.outbound.protection.outlook.com [40.93.196.43])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j281nmkqa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 07:43:33 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6p5hUkATWgvJAHbXE1cAG88cdpwo6tLbBFVWlTSDfoYhH2Pfq6WSPFDrrm57HenzA2dPKq2UmrIkadHY3sB/l+7jhZm8NMWBd2z97GiMfwOBPBhBG1Eur6Qt97H+WT2mpIDgEsOmp0egLA0H/SQoMiqv9nfIwAF1oMmxqNiTaUnEUbpN7dySPuMUjl5vGeY7/Nu1oXKQNL4Nk0YE3dFL/Dc2N9TMs4Ingm1RvuPZeYMYWAAfNHopQ36uGwzSCsSoLd26Xd+v78C3kJeiK6vn6B73epVNxpPjBlEEiUfY4XKE1C3vIV+vMOGOqW/eNowDDX2IQJe2YvF1/wW/ePBnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SChqABccqlxWm5dNMavLgttawIN94tLhOhPFfVH1XQw=;
 b=T3/ciLTSgUygaos1Qt1mTFOJ6TK6+yPFdRvNjylvUrnkcMiZJ/t2HRsQk1DzFT1KY7eN4+K8c4cwIOzsVGwLRcD3L54Lvkt9HU0rEHYneIWkBdqXBNhA7uroU+JmMc5zbcGBWC9uFnajJWkVogGKpzO+6Qidp26LCg8Cy+lHd9FlqAOxeE8bDiOInVq9RHB+CF1WvxxzFRsQ9GQeeV5awPtGVAQ+0Jw6yTaIhvPbpawS0uJQNM6VM0m16fn4n7gd6D81Bn2CVxmo2nVH/Prytnb9PBnB9++ij5tEN8QahKalam+8nIvAeyJLSLpaiiUPTueHcy0NhVV9sxkaZJkgeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SChqABccqlxWm5dNMavLgttawIN94tLhOhPFfVH1XQw=;
 b=m9Ay7ElEVlJKnmheXXjYI//zNHpMi23dRqFw2xo7hI3dDhjDaGV87c4R5mLUUNEj7WP+SIws1tukmDjVKPXql42a/zD1cVNUBJPsN+hc2sngpjy9hudWnltdgrQofhi8mjj5pfEK2dWA/tQe7Mj6K2/tEXfbvl/Qo7QE1iHOLMA=
Received: from CH0PR03CA0321.namprd03.prod.outlook.com (2603:10b6:610:118::17)
 by DS0PR10MB7203.namprd10.prod.outlook.com (2603:10b6:8:f5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Fri, 20 Nov 2026 13:43:30 +0000
Received: from CH2PEPF000166C3.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::af) by CH0PR03CA0321.outlook.office365.com
 (2603:10b6:610:118::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Fri,
 20 Nov 2026 13:43:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF000166C3.mail.protection.outlook.com (10.167.244.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 13:43:28 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 07:42:56 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 07:42:56 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 20 Nov 2026 07:42:56 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AKDguqw2204580;
	Fri, 20 Nov 2026 07:42:56 -0600
Date: Fri, 20 Nov 2026 07:42:56 -0600
From: Nishanth Menon <nm@ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 16/22] firmware: ti_sci: Move the huge ti_sci file
 into its own directory
Message-ID: <20261120134256.kb657juxyw2t3dva@ripple>
References: <20261029181147.266771-1-b-padhi@ti.com>
 <20261029181147.266771-17-b-padhi@ti.com>
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
In-Reply-To: <20261029181147.266771-17-b-padhi@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C3:EE_|DS0PR10MB7203:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc37e5d-5e18-4d99-bef6-08df470c427f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|18002099003|22082099003|13003099007|56012099006|4143699003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	4y1g854TDeVRN8lCZAq5KqQxfvHzV+3/84CemG2y4Z11IcB+vyjmL/PEThivE9hrNnjWL1bjoMhYOOvSjgpvzXiX5o6G0RAsEQNtWQRtny1UNWYxf0Jillz2fxd8daz20TW4CVgF32UAOAqeYp0yG2weFk8ZebsHWlZITGK0uAiJvFRKBi3P96ELo1PLYl9ETQWIg9oJIQy/H2cGMmaPLqrPjbaLtkVjEFDFRTHRWS7FZfUvkCBIk3txmtYh8Qci5Kh8dZ7A+h5W85L6VTbuyi7ZKvpzu8alIOzU3A6Lm7ZaAp6N0SiTrYElDwyTG3Z2ZHzzH30oGgIYUO6vgvWqdfx8MInkWOFPP0WCbtKVMFlUOmrNyEYhSDCNI07Q6ywiP+19kYxi+26eyajKyvgZe1QxWnr6hi0Ao76aUqWZuvFS41B/zGD7fxHBhAJdvAnMIG5ccSbQFSBuv2npFfcj+an0vZX0QXc2tYodNxiGNmeyyokvJWND7CRI1U1BBjCXyrz0Uif5lnX3wpvtHr/fOBzXbfkWbB4zPZyhlJwCudSJcbUCkzGD24aP9+3eJdPUNkhtxmge8j9hfxt/YtMv976u/m59gY12WRwutdj2dy00ZUnFjFkKCX2zVWhM/6PlfdbD1EbGIhj75h1fcMTYYR58vOq3Kv/9v36Bk9FHlNuXU3PJgXUWt0eooI6DPdmJ1RyJaKrAt9+YZ6J0E8yzlQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(13003099007)(56012099006)(4143699003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A0/xz5k14ygawJq79PS/DIv4qqEHGLinZZkNMr2FqXYgdRWUUnFZjt6OJAqVC4zaX24xDKNwYwR91oyItoFsIP8FrJ7tGSRPLuTFH6aNA2gLd8L4oKPJvzxYWovdnOiIN0xtixukKD9KFv4mLGKsOeKwWdwafoepmtUvkCAa9EGXhm82aONeBoC/K0OLtLLR5hP58Z5vjixm4FJSGrbjnBSkcHURgCLycYqnnWOstt1pfclXZEmXftZxdjj6PwtDPROppBkofoX1X2mCrz1SOQuiNG4HVRVME9g0uSSMvmcAmQcY7ySceZFlHxlUl9BaAlFGvBALokDym8yRM+usSxZIIw+fWRUJ1UYm31VQPBMLXsK04v2hkHmhPscgqj0GZLeC38ldFBLOUmB4UEqPFBxkVgbl5ncy0por1nv1HitZfHxxLMXb6bQmVH2sx+9x
X-Exchange-RoutingPolicyChecked:
	hdfRWYpDS7L71kIEuZzb10MGPHQ/3kdG8mxPVwQYql47LBpmp/cN0XkoTelaRmW+gnV95Zy8LUDXNQTSNexODROQS566TEXxPEsXqemBahjK5dY2ZZOI8wjjw4DTR/0Tr+Xy3JnbxbQf7Z9KLDi7wpF3WfjTR7OPMyogAWkTpftUXIROc3s0bPEak3Qj2Vpq7Wdv/aktfRV1MPCUbL+c8BBqfyhlQoUhzrxypVuwS5oNK2IivNbVZpa/XrtPpMrJeWtpnluvxPE4ndZwY83HL1zfHlslOy/1bAnSEDH9GRwowL/pkH/QxKYcx59bw0Z8jANHgcg+YW1xeM44LWqKYg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 13:43:28.9798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc37e5d-5e18-4d99-bef6-08df470c427f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7203
X-Authority-Analysis: v=2.4 cv=aIZlOr9m c=1 sm=1 tr=0 ts=6b004e85 cx=c_pps
 a=uW7feKH+bNkESiv0jeW3sA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=hJkGZg0YrzaMdJIBAW8A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXwDjWXa6ZcRwF
 v/FQskdUf/juNA2R9QcM6YX8Xq4y5ArGpW2w2wE3Oed5YeZYu+wpj1l8Ui0K/cwWkaWj1i8gtIw
 d0rL/oRcIUFwnfStxZ3JZMqVadRqlVg=
X-Proofpoint-ORIG-GUID: HaPLh3CeqwmWVhfMKWmbaLD7ouZFhLgo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX4jl1doBLWISK
 c0caoLwo+Jl/qfqzsCnbpJ/bwIww93b/aVIxnhcQ226/plxq/ukg38LqEQw9DHFd/oBYdMGcw/9
 UYU5YZp7WfjzUp5hNJNOSvSlD1jCKZIScUSBhhgBs6lgqalKaAvd9XBPwt8HAVbDYXW79HoOjM8
 fo1bHytsz9Mm3z0CUD8FxaSEg79Pi+eXpu+ReED8SPIoFsKRaGMCrvW7UZBQbSnanoA9p7Mqu61
 dMzx9N3AsioqkrgpK/6jQplmz/eIFpUS704rvSGQQpCd1Jen4JZ8202pZWr2C5WJipQhT6zuBff
 2KWp2TKUDBFbKOGabs1FevwAlNeoriv30H4y9LoSPbki7Ftd84eOAfO9zW+quJJ/mH38k66nAkR
 FV3H3+wKSrnThUowsnG94Jmkh3VnpHWHmSjQvWmisT9mOZ1ojcLCrhbgrP9vX3wgHo4bUff6wMa
 fBeg4j0OeJHU+tafy2w==
X-Proofpoint-GUID: HaPLh3CeqwmWVhfMKWmbaLD7ouZFhLgo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On 23:41-20261029, Beleswar Padhi wrote:
> From: Andrew Davis <afd@ti.com>
> 
> Move the huge ti_sci.c file and its header into its own "ti"
> sub-directory. While at it, rename the file to ti_sci_core.c as this
> file will be broken down into smaller files tied to operations as part
> of future cleanups.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---


This patch conflicts with v7.4-rc2 as below -> could you rebase the series to
latest linux-next or v7.4-rc2?

0af298e62e5c treewide: refresh kmalloc_obj() conversions
4dd10fbbeb9c treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
