Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190881;
	b=e/J8tobVoeKM0uAE/FO5QX3lyMcK+a2Gdv3WDctufz4TNmT2BkgJ46U+A9vlVTZLZOfF
	 md0sb/vtUIpl95lINVYcXFlNXb0kgHE+8VPQr21+f+DZTE3F3nn/nTCPDaWsx9YzmAyJm
	 DdB0pQhoaiqGCodWFtMu5IuKEzYQThQ7lz+b2HHaOJHK8XaQgf1l4SVmn9uyrLMVvMgBr
	 nQiCmFW9ZMqUkfcn1pxrgTf17Hf5C51raLSo99WOhPAfloHKk5Yh0Rf7hE7P6jtbaoedA
	 5bvJLDvpVfMUntksFEUgYvCalkAqQbmUPoY2ZYjRNPH2A3phOzsdOxvBi2f3QjQaCXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190881;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uaTgLmaEBJhLk756A6dm4TTlALLqQABvkymhvyjDDpQ=;
	b=3NOdAzmyc8UFuuUnEpHSJIvG5dKDhoQVLgQmYw1+CjdQ5RFf6E9Yg/qLhpXM526yRhkb
	 KstAvEqLXRVhFsD+fUbr3XSKmAkmEBGfFocxc2ZaLDl03YPqs/L9g/qoZdhBtVqniTRRT
	 TLwtda66O9mHhu4v/bmw/xOElsEruNfR5/haQsSKXxyFNpLmkeNVJncF8U2ozpm14M503
	 fFHRgJrv01F/jz0A1XpqXCpGOenaH6CcJ7cIu4mF63vBUHBoNaqCDl0AMgXp4CtZMvLo1
	 dEvNspJEPk253Iy6+sGVqplKKtdwqDRUVnOYZbfJT24VUMGqSKFgrAfWQOoWYIjUrxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=RroLijVe;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=SqaXlLpH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B3260A260D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3B3260A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=RroLijVe;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=SqaXlLpH
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6AKEeYas633221;
	Fri, 20 Nov 2026 10:07:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=uaTgLmaEBJhLk75
	6A6dm4TTlALLqQABvkymhvyjDDpQ=; b=RroLijVe899Jih3xbKS/t+oMcn7HXCz
	GjNh/NDY/W7qE6V/TxkU0ysAFnprKBpzeU4Vt49mRPwNjfMLhUec51SW/noeffnd
	orDL5oIUtEdFBuxgCXqAoek+cWYVReXkx1M3h6gxMfgy8Wty31qjOW0Nm3WBHZdO
	79JrELpN1PT8K0ralTywcch2kjuNSdrFDrGmf1TG5VetSunOt+/vAtcQPFQR72hX
	QEPotrF3Xcj3ZVKeb4KNfE6ePj59FanDBcE6l4qtwIKt4dDPhFFq8ajnqfo/B2gX
	zoQqQxpFSoIGoxRNQsRPd/0M5wg6jJ0xYPTrbHL/7yYoYxBUsIWZQGg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012013.outbound.protection.outlook.com [40.93.195.13])
	by m0384305.ppops.net (PPS) with ESMTPS id 4j2k2cj8jp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 10:07:31 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQS2mGkBNMsvgFon4322hcFeqrmApr6NXbjrDFDL+5rPuFshTt81GEzm82QiL/Gciyhcku7QCaXG3GMeQctHyaMh2plNLqQB/lxOTdL4ENuFCwcP5OGQG2o9AkB0H0VtmkMfDaZdCetueT/WYpPD2W0lvjqYRKrl6gDuZK/JDBiaRk/Pda90hP9lhP9wRRXrgOKVS7vADl8AP2Chyb5skdzT2OwbVJXGXxOIlaNrJs3G1H9dIAG/ikqv7eNcQfdHjTQsaJvPADJzBWD4p4lLeh5SZLQBZJ5QWnCuzuf9UG1PyOI5u4YKj72IlaqQzfhmQjSBrZf404n2dz0pX5Dyjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaTgLmaEBJhLk756A6dm4TTlALLqQABvkymhvyjDDpQ=;
 b=raTIC3t/lWaMhR1DlxstNAqdgL0IQJX0eqpLvTLvKALdEbgiF6YlFFGtbNVT41GSzyb6Tpb8rEEz58o7QUgoRVJo7OreN3qxiqbpT2SZ4y2/MevAAmY7XUQjiRJgTL0CvXgypAH8Y0SqK5yB2vDsH1tlqSWhGEb3tA1x/UqC7dF9oYbJq4kEjKw1MMX3Zv8XYWklU8FoGmkqlIrYTrWDVLTs/A+YiybN1acKbAN1SpWYWcGH5iQLg8t4lv3AM2Bu9bQ+OohVtjThItieQJqZNwPsIuROtLzTvi4t9IMb7e9ge/sQg+tjx0ePr+F7XJl/cmhOHy353xiN+Im2+2d0Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaTgLmaEBJhLk756A6dm4TTlALLqQABvkymhvyjDDpQ=;
 b=SqaXlLpH9KIottsWXaG5O6LC9unJz7PhvfEmYyfQ3uBeb1kTOL4tJt+1ARxf7IivhvqSKtSFNySTr5JEDtkNjP6axPLtOoqh2SiDrPPA+/rPXku0wSN9HtaiMuS/1HJgLeXXFHQC9eLbWl0SpYvZTO6oO8p5siXbbtsSl+btxt0=
Received: from PH8P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::23)
 by PH0PR10MB4599.namprd10.prod.outlook.com (2603:10b6:510:39::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:06:26 +0000
Received: from MW3PEPF00001654.namprd21.prod.outlook.com
 (2603:10b6:510:345:cafe::d) by PH8P220CA0015.outlook.office365.com
 (2603:10b6:510:345::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 16:06:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MW3PEPF00001654.mail.protection.outlook.com (10.167.249.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.0 via Frontend Transport; Fri, 20 Nov 2026 16:06:26 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 10:06:03 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 20 Nov
 2026 10:06:03 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 20 Nov 2026 10:06:03 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AKG63Lx1413952;
	Fri, 20 Nov 2026 10:06:03 -0600
Date: Fri, 20 Nov 2026 10:06:02 -0600
From: Nishanth Menon <nm@ti.com>
To: zhaofeng2 <zhaofeng2@cmss.chinamobile.com>
CC: Santosh Shilimkar <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] soc: ti: knav_dma: Fix device node leak in
 of_channel_match_helper()
Message-ID: <20261120160602.ep424lfd7ju6goqj@rejoice>
References: <20261110101131.443-1-zhaofeng2@cmss.chinamobile.com>
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
In-Reply-To: <20261110101131.443-1-zhaofeng2@cmss.chinamobile.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PEPF00001654:EE_|PH0PR10MB4599:EE_
X-MS-Office365-Filtering-Correlation-Id: 4048db21-4c7c-4008-6cee-08df47203af3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|376014|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003|56012099006|10067099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XdauWD9XUHNEfQv+cNeQaX9K4GfpmOWhza+0nuep+vkvS4ct91MGdWmlAg4y2ZH+in4dG5GQk+EqCQAswyU2QWMQ7vY34AEvzAOaUGAVf/v+aa8icx54Qr2I9IALvsiGG0u5lsRLK9RsO0jqoMQZayPAYsUP2886mcSTChHNTuu/SWTzAwCwxfGN5wZ5IPE/8WBfMOiDWhbBjWbBYxRXfiszlHh5APpuD5gMGQuOukHFTDGjqcMbLz8HmPQNpCVQlAcUaUyHUEjAlZei4WGFkDQegAZbAxnjcd8L87aeheFPfRDAqsIejsr6IgjOLMLXecYCgeswp9bNWOlETZ8pxmqMYh+7l0n3RNrrt+j52tyPOppcKJJlCZUpnkvEQOnVPOjrXS/OQtGRxHMDRtX5W0Fz4zQc1X/fEIMliHPmz3yB7aN0yQwIpLWK1nZCKDqxmX7QKS2LDDCDEaI+N57Gj3JNDkxZ0/wIQFaCmFVdLDZBU2ArfLoF7ylur6Tuq+Ejny5AxKxw6ossfAfB59muQh3Kb/qeyQKx5sAgPpJz5jlxLi9AnebyUyhy63XjiMvA59/AQpiyaLYtXjfWGNVUE4xS0lg2vVutdmUnPjHLpwM4eJSQVw1TcW4dc+XAj8ofOR41p/0ZTxmYLaqiCAeBeEIaZyKDJV4h+xz7O4fdMRxXL7BuELrFQOnCPc7dLvFuAMnD3heSgSyvURPWGBeZ6Q==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(376014)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003)(56012099006)(10067099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ypwDqAvaTlcDHtwllW1TlRIWmapKIX5D1MJLdQmxStMRi4tdQDm+7nsMuDRzcO24NK29L+M2fGraolO2U+Q4Q+6rzGUp5Tgl8owwbwC5ADiBrjImERG7XA/uOkbKSYJVpD5LLDxUgUauu4Hv3wHccF+BUFY6WrqLWp+zrw2sh9ObQ2giurpcBY6cis0czS5229BgiAvsfaPltKhtBym6N4BelJrhdwHnZr0t2YJXl+INeNmi8oZsf18DquEp63RXI5DErv697LSL18mvQ1kvQA4X6H4VowM0TCkPVfnyEBsgW+h4Gj3NzpuS8DYnbWPR+5ojRatPFWGlIE7zABQ4uAXKFBJ3ItVE8H1FAsx9wSP7pyHjWGfmbTNuGTtQ5t7SuyS+jQbq7FZpFh2LZg+OVXkrOtxgliuSQtWNh8lmeW6zZc+wW4vcSMD+2wmkpSG4
X-Exchange-RoutingPolicyChecked:
	JEWpnbsgX+FRdNL+koYFqFVJ3q4FYvVd0663Q7GLk+/7YzGwPvS8XiEjiWxjpIAnhsc70Lu+dtmV3VGgtIfItoG1PdOZZmCZjBP4uFyjCoCdJ3iLCNltQRqlnIbF5X9SEAygaWqNeDzuKI9vlAsSNU6oFO3Zopqtl09VBaMadVqsMGkDJCLVkdi35gpgDmhrRqugvXFslLTdQkq+CM0PrsMSwbHd5flsdyS6eDcisaTG4HjQtZtixEfnElRlTJR0DfIeNUManBGlWMPawmstlWDnRmFKfc7sx6gduIiQAHLHzppyu56IZMN2n2CagvZ6Tg/4Zlk8ze+Kxm3gYj6hDw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:06:26.2201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4048db21-4c7c-4008-6cee-08df47203af3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW3PEPF00001654.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4599
X-Authority-Analysis: v=2.4 cv=NYZzRGD4 c=1 sm=1 tr=0 ts=6b007043 cx=c_pps
 a=mi0BVYrBcfLCPOxFm7cYqw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=R5C9hjxsAAAA:8 a=6vA1IGrMinAcyBDdNAEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfXyVKi9mEcY3QH
 ipdcwX9DivlNjQXohWx7YPN52yM+MAeYb0wj5LNifDNg9MA2bvrqX8wAMvYvLFATja5mvFwuXrn
 0BUZaDQLRd0nCgcijXTTVb8QUeQbM7vExbL+bONQtFCO889S4b6okb8V87J6irZ7alqqxcQwFCT
 EjQFhvKGi7TX5itxo6OA/Q3DjoC9KCsAHN3zoztnEiO73dax0lI8WDE+a8KeuRitID7g4L5eTlp
 tvDD9oYPrkCw0itdcNx4OtZJMTFzQV47nbxNf4kSqFgf2mDBUJnaZyohS/RFouuAA5WUpHbFRKP
 52C3EokOE0RHxg9XH0Ib9s3kwxQ10YS9e7znTjpOBlAMqSPBX8C5AXL6j6PJwmQjft+Si1QktEh
 6tAFzFjbI+LPWuRpPdCuuib4jDJYEu3DDmBBZRqYYy7oUOO1bCWcaK3Q3D0I6MkEwn/upD9EnBR
 BSFiytHIP2rgW604oVg==
X-Proofpoint-ORIG-GUID: Tw1-mA1q04PhdFO4nQj9l88slFKHR34S
X-Proofpoint-GUID: Tw1-mA1q04PhdFO4nQj9l88slFKHR34S
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2NCBTYWx0ZWRfX/Muf5iJLCi5j
 3zDX25Rp6FZQQ8crkyPLACitb6ZiK9/O7QITg2VbhXO+nxFKvznH16sD72nuTsqoxDwkJX/PLH+
 4Jhd68B9Rb4sRAYaeXxQY/FiwmugIxo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1011 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200064

On 18:11-20261110, zhaofeng2 wrote:
> From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
> 
> of_channel_match_helper() resolves the "ti,navigator-dmas" phandle
> with of_parse_phandle_with_fixed_args() to obtain the channel number,
> which takes a reference on the dma device node in args.np, but the
> reference is never dropped after the channel number has been read
> from args.args[0], so the dma node is leaked on every channel open.
> 
> Drop the reference once the channel number has been retrieved.  The
> phandle stored in dma_node is deliberately kept, as its ->name string
> is handed out through *dma_instance and compared against later in
> knav_dma_open_channel().

But, do we need to take care of dma_node around error paths?

> 
> Fixes: 88139ed03058 ("soc: ti: add Keystone Navigator DMA support")
> Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
> ---
>  drivers/soc/ti/knav_dma.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soc/ti/knav_dma.c b/drivers/soc/ti/knav_dma.c
> --- a/drivers/soc/ti/knav_dma.c
> +++ b/drivers/soc/ti/knav_dma.c
> @@ -387,6 +387,8 @@
>  		return -ENODEV;
>  	}
>  
> +	of_node_put(args.np);
> +


>  	return args.args[0];
>  }
>  
> 
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
