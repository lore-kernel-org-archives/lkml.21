Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=2 smtp.remote-ip=40.107.162.61
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795537255;
	b=FyBvP+ICVc82BR3zClUszNX4rs0uW4E/hjb+X0UuVmayoXuAjmwJpVyR4ysQH9cTqodR
	 Uu9oiY0DTRIW6L2yWyzYpePzfIzbPGEGwGgx9/CTD/LxWOyiyQw0DbqMyosSVaEr0cuEf
	 J5CWs8mOePyf4ycjrKB2K418Z4DqJoFQLq66nyeuE4r3l7avA4NVdkMpqQOhAm073I5rx
	 4sdRpchLaVplXs7zwO4vRIVenSc2gCiCGy7QBEzzdUcnG7NzQWcS0k9+CkAMwddFHKAXj
	 a86mxlr1bwgETiQheqA9occe3fhi+zCX4F8bA+ybWyMmvJhLFRxz4HP/3rFut442SWw==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537255;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 DKIM-Signature:Authentication-Results-Original:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:x-checkrecipientrouted:NoDisclaimer:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam-Untrusted:
	 X-Microsoft-Antispam-Message-Info-Original:
	 X-Forefront-Antispam-Report-Untrusted:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-EOPAttributedMessage:
	 X-MS-Exchange-Transport-CrossTenantHeadersStripped:
	 X-MS-PublicTrafficType:X-MS-Office365-Filtering-Correlation-Id-Prvs:
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
	bh=fiAMRBc54TrsgAvoYqOrFBzmXevP3VmfnTYOgaKe/Ps=;
	b=OkniMdhmVi+m2KkDvu/Bi6UsmStFamH+Y0iVbPFYxVm1OjhmaDq+DOXLmcp4+FGBVfXp
	 J5eEN7iXvrB9afe+NdDq+2RvghUBwf24/jchiSGEwGDWuUloDO8J2aKqaPtJu5UtC6XaC
	 G6oiU4qen8JNzNwGXN6R5lI8yN3iwSu3PiBwc3cx6OwCghnNDXNNJUP68h9cW2TPUFILv
	 9WXo3TUevlCkaWn8b6p/JlO70oqg2oi7nbIFHYuL2Hw70RYn4fvwpy3s6S9v5S3Q/qE4G
	 w1cKk9ZwpTFlGZmYvw2qNIqsFNTc41e3kzzC/q1hJfOJPQWbktcMoyIu/WkdkjzIoVA==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=HKPlDjBx;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=HKPlDjBx;
	arc=pass header.oldest-pass=2 smtp.remote-ip=40.107.162.61
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013061.outbound.protection.outlook.com [40.107.162.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C31606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21C31606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=HKPlDjBx;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=HKPlDjBx
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rmIGiQrZaeNYgaErKtDNpbl53dVOxuXeLI+/LCMoeLx9RseVvwd2oVblY4pVNGwRfM04bmu7MDfhBwBF0A92W9uFtId+himFaMP8JQUuq3rN72gYKRD3LU64DCGuePxZ0F73WuPwNQDFK2lsrRsjm2WEiMMk/pki0seYVw663WcnwchXSFqDhzyvhYY1ugU4NA4V2vchLALILr/kmlyEEvBVkOJ8JX9M/8LW9kSnk9hClr2e5kKyMehj1uTWh9zuTNhXu5nnxIftuZnntPqxFCRRbd2/hZJECTLohyO4alAu06zGDS6+VoZeiwWOmt5i/QqT/oJ86Yf/Zg9qnGrM9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiAMRBc54TrsgAvoYqOrFBzmXevP3VmfnTYOgaKe/Ps=;
 b=UjdIjR7gCRVUIlWbq98XSW+T4AD/5/IbLK2JCHsdK+P+IbBGiZZYT+A4ievjLXMlRtELdo0wDu/7vPTKgdUBCMHaSRP4wh/9YYj03nZQTyf51w45SwQfNgk1Ma5nuTb9Q2a1bXj7sLkgG3nduneGnjKhChj+7JQzmibOKBp1DSZyNeFJe05+SkEGbxt9bfxnLIKJcXAh1QyYLtV7Lr/YZ5WkhP/Q4vI4RYVUM1+Mm4MtEDa5ZKTUsV1cQ64rgh4Au+PfBl+bNni17GOiVVUDNLsivJgKyu2GVJp8kUVhnWNWnNjxmugcejQZavbG4i3Kj+tt19MGPto7BxyGP4lp6g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiAMRBc54TrsgAvoYqOrFBzmXevP3VmfnTYOgaKe/Ps=;
 b=HKPlDjBxGOwCULjXG6PeSMTiOlgBF8IJeXA9/0PwLwyvPhXjEpKNog0t3ibSMy5FT4qUpK5a9pjXssiX0ZnE2saGlO5mq9HsL5b6VEuKXSZIQc2oNpQl5ET6JIyQ7iAw9hewUbiXbjHyNawYz3bBH50/AjcmK+0w3YkbmUZO9Rk=
Received: from VI1P194CA0030.EURP194.PROD.OUTLOOK.COM (2603:10a6:803:3c::19)
 by MMZPR08MB071889.eurprd08.prod.outlook.com (2603:10a6:190:53::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 16:20:50 +0000
Received: from MI3PEPF00008488.eurprd02.prod.outlook.com
 (2603:10a6:803:3c:cafe::5d) by VI1P194CA0030.outlook.office365.com
 (2603:10a6:803:3c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Tue, 24
 Nov 2026 16:20:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF00008488.mail.protection.outlook.com (10.167.240.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.3
 via Frontend Transport; Tue, 24 Nov 2026 16:20:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwfqPlYFejDln4V5fqyZGXeRKbUS+gpG3Gj3hEyLJsVjVwpxpW5A0wvyEj+tErO65q6OH7u6u43BGuvCJYdl/WroO8xJlE6jD/1t5x/hsdbeOyDr7m2ozfvmAais/QGCsJJ2bldmAIU01XUYd0xwan/Q5+xO6rDoubvLq10I1g3HwAEOzJLPujOHjGZw1ulVYwaznUppqPCu+LPXhrASiVd9noCGp/FbcCGg4vLhKlnGQz8OB9j/1ssaARc9HwsBqR2YTNuVwZgnEt9WO8JrEA1a4xsnDNsl/ihX63+En/8MqT50D3Q3Bkb9LEF6cC/InbOHMCQH6anXYO/c4ZQoCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiAMRBc54TrsgAvoYqOrFBzmXevP3VmfnTYOgaKe/Ps=;
 b=pDspZxAoW60nBHisUgv+tou7Fi5TcZPQbtoE1UA1/KmUjXkpbLNyFfcxENFl7bcBWdtPsVwGe6jsHDSAT1429L1l8CLngDJ45nPDHP3uCq+zDdQVMOAGUwIr6IeYCiVQn9IGlYorECyoskmTziGoEN5GvUJmvHQpoL/XA920EZbPlkKxc/+ISaCCa/NjnFoM85bZ5LIYlnyfVTC0nam+RNVIuBy39YFWyDope3MY9fqq0wSDxlfVh7ItiF9PVLMR2ayPR6lx30ijQ4flj28EG0iGscQWSASYf32JTGQs4W0zjRJWaqyoFOICEyp+S0DEFaR4sOT/RGP/zssR4vwv5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fiAMRBc54TrsgAvoYqOrFBzmXevP3VmfnTYOgaKe/Ps=;
 b=HKPlDjBxGOwCULjXG6PeSMTiOlgBF8IJeXA9/0PwLwyvPhXjEpKNog0t3ibSMy5FT4qUpK5a9pjXssiX0ZnE2saGlO5mq9HsL5b6VEuKXSZIQc2oNpQl5ET6JIyQ7iAw9hewUbiXbjHyNawYz3bBH50/AjcmK+0w3YkbmUZO9Rk=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from MMZPR08MB669593.eurprd08.prod.outlook.com (2603:10a6:190:53::6)
 by VI3PR08MB938182.eurprd08.prod.outlook.com (2603:10a6:800:374::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 16:20:17 +0000
Received: from MMZPR08MB669593.eurprd08.prod.outlook.com
 ([fe80::f3ef:efa8:e69:8b28]) by MMZPR08MB669593.eurprd08.prod.outlook.com
 ([fe80::f3ef:efa8:e69:8b28%7]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 16:20:17 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	linux-kernel@vger.kernel.org,
	Akash Goel <akash.goel@arm.com>,
	Lukas Zapolskas <lukas.zapolskas@arm.com>,
	Chris Diamand <chris.diamand@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v5 5/9] drm/panthor: Move register base offsets to the HW description
Date: Tue, 24 Nov 2026 16:19:43 +0000
Message-ID: <20261124161952.1053586-6-karunika.choo@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124161952.1053586-1-karunika.choo@arm.com>
References: <20261124161952.1053586-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PAZP264CA0031.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:122::18) To MMZPR08MB669593.eurprd08.prod.outlook.com
 (2603:10a6:190:53::6)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	MMZPR08MB669593:EE_|VI3PR08MB938182:EE_|MI3PEPF00008488:EE_|MMZPR08MB071889:EE_
X-MS-Office365-Filtering-Correlation-Id: 09876178-b804-4895-f5ab-08df4a46e765
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|18002099003|22082099003|260925021311599003|11063799006|56012099006|261021121427099003|260925021911599003|260925022911599003|261102123227099003|261026140227099003|261021123027099003|261022105027099003|261022075727099003|261009223027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 ut4RjAYZ4mV/Sou6yNfcihZ6AbuBfnKzvkAjcUfMCUFec0Zbxk4z3nTSmnWvrHEDzRFjTB83lhcBK34DIpDW5Teq4QeLNxlLeoBqA1c3W7P6uayUSvBAS73kTuhuEZpyNtxMmWhfiuzPlQj4xBtm0WbUJydhv4tZBNuu4SiH6gzknRNekmhVy4gXPh41qkoxVhVW2b80oAvODECMfN20hI0mMtt5Z/71c6QQvSGAlugeMms3yT6CFO/e8iVsyWBhc/VuZVjgjOr1yiLkSGDMo8ePh+2nw2tswOkOPNGpgsOAkvJO2jZhTZEKHLrHBCT2xPlUFZBIw5ltyp05kqysJuT9zQBTg8Q15RVPGZnItXmRZ7wsvn/QcXjKvK5nPGh/4wJpQ1F3Cu0jN+pbpH6+UMuNpXyHtlY4GxK1m/NB3JdJtMvNthgTDRpWXFu+S5zt9GwnAuGSNjtXsnLTUTB3LfpeHIVbsoWWC7P8XPiFyl4onKYmiROdzgah60zzGMLtqpoyG5f3xj8f9/gDIaNR6PtmJs1vARB42KMDiqDZflgWJ6mhvPI3Ngu3uSutZ/eAfik5nQgzhW6XsVc420eE11agfFA9hE28To360m2vNcp6Xwf/RoY5ncUVkHz+0/PAlSAqqEknulTYVgSgfK+JqfqOvlvJS0zYOV2G0nmj9C4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MMZPR08MB669593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(260925021311599003)(11063799006)(56012099006)(261021121427099003)(260925021911599003)(260925022911599003)(261102123227099003)(261026140227099003)(261021123027099003)(261022105027099003)(261022075727099003)(261009223027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 AtTMP7Rr5z2C1eA9B1I/7MaR8f6MCeqaGbhUaq45Og2V6MDldpaeH5ZITuF16A31XGw2v7KQeNMQTS1RI2IjL+vWtKBqsX8dyvb3C7Xg49hYtd7LY7/XvRFTFCcBEi3Rb9HY8GdyQ5SKaJks+FfO8fWZBuMtxB7+IKNg/cudqZj2lX4F3wPdIRU4kZlOh6wK38QzfpHjEnpGXFJoYATray0A2EhKn9lxXMkzQYj1KsI+PKIUe244q9y+ERpFDBrgLSSKnSRvlskRm36KPf2mLgra50ZCWcaHVFmzSYsUnmufqWQVfbqb2y/ef59O6WqawD5G8+3RiHXWYLbuvy2vQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI3PR08MB938182
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MI3PEPF00008488.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	befa4cff-5471-49ee-df8b-08df4a46d3ca
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|14060799003|23010399003|35042699022|82310400026|1800799024|10067099003|11063799006|261021123027099003|260925021311599003|260925021911599003|56012099006|261022075727099003|261022105027099003|261021121427099003|261026140227099003|261009223027099003|260925022911599003|261028144727099003|261102123227099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jLAkqN/qvr9AbYWI4cmfsKHg3cBz6FvkuOXYhjtHrse/EpFb4YUB9GPwobh7uTMJjEf4ba5c5OTXbaW+nehrOeUAKyyH/nJYKD2AEKPbQHVhHpO99BUfg/JZuRkYdsnXweMkJ89uwptwXphBX33uSgQRAyVxz2Kg3rMY8N1O3tNgiucN6OnvtVYD0RjV/535GKxyX0yv9Je2uldnIiv8Nssc17HwRqjK9scWgrvcaLPu94tQO/Y+HgJ1LJNoDqdItNG/63/MyxYfX94qy3530zCvo8PfdPNMoXFDUsykhBEtH+D2H0gt0xo6FZlqlwS+KPk8yeG83QRYkqVMTMACu8ifhAajCNWnwk2qIV8FS3H3gTWa+qBmYwxi8xQKJxBjODlv92CzCto98qJtkRoHtdpuZ0JZK9vIrWchYNp/phLhCCzgrjUu3gqHvjg9lYME2jrSm61nFHwIO8Qt+tYiLMCyq5IxS7Qs0lZ3Xjp3X7KAqQVnOS/OhnsHZ97dj5NVBFEDbLYKt7gf4dSncNYPdfhgva7QsEamGnxYmyUyEVKss4zf8R8dN+jFvvT+RokdTqrL2RHC6EszNY/M0epr3D4flfftpSLqdwZt2M5hilIQVPeiatU+4HGI6607xX19TbqjqIRDZo8lSitTMt6Zb+p60QII7NlCyLOoKri5FPIeUd8ydTfeFZSR4960TV8XFkUH/A6kzIUuZFAEYqe3yA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(14060799003)(23010399003)(35042699022)(82310400026)(1800799024)(10067099003)(11063799006)(261021123027099003)(260925021311599003)(260925021911599003)(56012099006)(261022075727099003)(261022105027099003)(261021121427099003)(261026140227099003)(261009223027099003)(260925022911599003)(261028144727099003)(261102123227099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9lXOmLg64QKLm/TKqtBRGG31DNQ7FJX3zM97YN5MC5A1gQ9XPPtmcLrI/bVPFw1STcMvw8EVC7dPw9EpNpsKMEiJHHeSnpBajGRezu2WQoe6k93d0wlP7hIkSP8jhdVDuF6ZPCHY57Pr6vMBgzLY9e2dgHEa9gb1CwFjQ0lcQDJO3kwT2b24w1SSuVWvPSIk9EwTk11Rr8dNYCs0hZeky4UN5BC7FArFRxcaIP2IO2WTh4bnHtinDf0CiOFLPD4XoF4sXVhy0gkVHTjzdV9BP/aQZ4JhNV0h2fLkvHMBbhnNDmhFgup+r6syToBCrkjmNh26fyj6UGM8mtIzBXSyJrSyOLKxDAFvn+cASN9ZAZbDxVrL9gSNQTIHBnuNn0lfvPt8QNix2Rjvp2Kto15rmYb6RjnbcYm8YGbmKTw3zGiE8er7/T4dugO+r7XGCxjq
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:20:49.8319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09876178-b804-4895-f5ab-08df4a46e765
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF00008488.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR08MB071889

Mali v15 reorders several register regions, including GPU_CONTROL,
MCU_CONTROL and PWR_CONTROL, so the driver can no longer assume a single
fixed base layout across all supported GPUs.

Add per-GPU register base offsets to the panthor hardware description
and switch the GPU, FW and PWR local iomem setup to use those stored
values. With the base addresses now owned by the hardware description,
drop the corresponding fixed base-offset definitions from the register
headers.

This prepares the driver for GPUs with different register layouts
without changing the existing behaviour on currently supported parts.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v4:
- Picked up R-b from Boris
v2:
- Picked up R-b from Liviu
v1:
- rebased on drm-misc-next
- use a generic panthor_hw_regbank structure for all register offsets.

 drivers/gpu/drm/panthor/panthor_fw.c       |  2 +-
 drivers/gpu/drm/panthor/panthor_fw_regs.h  |  2 --
 drivers/gpu/drm/panthor/panthor_gpu.c      |  4 +--
 drivers/gpu/drm/panthor/panthor_gpu_regs.h |  2 --
 drivers/gpu/drm/panthor/panthor_hw.c       | 23 +++++++++++++++--
 drivers/gpu/drm/panthor/panthor_hw.h       | 29 ++++++++++++++++++++--
 drivers/gpu/drm/panthor/panthor_pwr.c      |  2 +-
 drivers/gpu/drm/panthor/panthor_pwr_regs.h |  2 --
 8 files changed, 52 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 13efed3a2ea72..679ea1d233d53 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1500,7 +1500,7 @@ int panthor_fw_init(struct panthor_device *ptdev)
 	if (!fw)
 		return -ENOMEM;
 
-	fw->iomem = ptdev->iomem + MCU_CONTROL_BASE;
+	fw->iomem = ptdev->iomem + ptdev->hw->regs.mcu_control.offset;
 	ptdev->fw = fw;
 	init_waitqueue_head(&fw->req_waitqueue);
 	INIT_LIST_HEAD(&fw->sections);
diff --git a/drivers/gpu/drm/panthor/panthor_fw_regs.h b/drivers/gpu/drm/panthor/panthor_fw_regs.h
index b2e59cfc22b00..a3492f7f913f9 100644
--- a/drivers/gpu/drm/panthor/panthor_fw_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_fw_regs.h
@@ -4,8 +4,6 @@
 #ifndef __PANTHOR_FW_REGS_H__
 #define __PANTHOR_FW_REGS_H__
 
-#define MCU_CONTROL_BASE				0x700
-
 #define MCU_CONTROL					0x0
 #define   MCU_CONTROL_ENABLE				1
 #define   MCU_CONTROL_AUTO				2
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index c5c37f22993d6..ab54119314da0 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -159,7 +159,7 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 	if (!gpu)
 		return -ENOMEM;
 
-	gpu->iomem = ptdev->iomem + GPU_CONTROL_BASE;
+	gpu->iomem = ptdev->iomem + ptdev->hw->regs.gpu_control.offset;
 	spin_lock_init(&gpu->reqs_lock);
 	init_waitqueue_head(&gpu->reqs_acked);
 	mutex_init(&gpu->cache_flush_lock);
@@ -176,7 +176,7 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 		return irq;
 
 	ret = panthor_irq_request(ptdev, &ptdev->gpu->irq, irq,
-				  ptdev->iomem + GPU_INT_BASE, "gpu",
+				  gpu->iomem + GPU_INT_BASE, "gpu",
 				  panthor_gpu_irq_threaded_handler);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/panthor/panthor_gpu_regs.h b/drivers/gpu/drm/panthor/panthor_gpu_regs.h
index c7581b6d4c5be..60819c4ace428 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu_regs.h
@@ -4,8 +4,6 @@
 #ifndef __PANTHOR_GPU_REGS_H__
 #define __PANTHOR_GPU_REGS_H__
 
-#define GPU_CONTROL_BASE				0x0
-
 #define GPU_ID						0x0
 #define   GPU_ARCH_MAJOR(x)				((x) >> 28)
 #define   GPU_ARCH_MINOR(x)				(((x) & GENMASK(27, 24)) >> 24)
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 854874a9f322a..4fe9e6aeadf76 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -36,6 +36,14 @@ static struct panthor_hw panthor_hw_arch_v10 = {
 		.power_changed_off = panthor_gpu_power_changed_off,
 		.power_changed_on = panthor_gpu_power_changed_on,
 	},
+	.regs = {
+		.gpu_control = {
+			.offset = 0x0,
+		},
+		.mcu_control = {
+			.offset = 0x700,
+		},
+	},
 };
 
 static struct panthor_hw panthor_hw_arch_v14 = {
@@ -44,6 +52,17 @@ static struct panthor_hw panthor_hw_arch_v14 = {
 		.l2_power_off = panthor_pwr_l2_power_off,
 		.l2_power_on = panthor_pwr_l2_power_on,
 	},
+	.regs = {
+		.gpu_control = {
+			.offset = 0x0,
+		},
+		.mcu_control = {
+			.offset = 0x700,
+		},
+		.pwr_control = {
+			.offset = 0x800,
+		},
+	},
 };
 
 static struct panthor_hw_entry panthor_hw_match[] = {
@@ -195,7 +214,7 @@ static int panthor_gpu_info_init(struct panthor_device *ptdev)
 {
 	unsigned int i;
 
-	void __iomem *gpu_iomem = ptdev->iomem + GPU_CONTROL_BASE;
+	void __iomem *gpu_iomem = ptdev->iomem + ptdev->hw->regs.gpu_control.offset;
 
 	ptdev->gpu_info.csf_id = gpu_read(gpu_iomem, GPU_CSF_ID);
 	ptdev->gpu_info.gpu_rev = gpu_read(gpu_iomem, GPU_REVID);
@@ -221,7 +240,7 @@ static int panthor_gpu_info_init(struct panthor_device *ptdev)
 	ptdev->gpu_info.gpu_features = gpu_read64(gpu_iomem, GPU_FEATURES);
 
 	if (panthor_hw_has_pwr_ctrl(ptdev)) {
-		void __iomem *pwr_iomem = gpu_iomem + PWR_CONTROL_BASE;
+		void __iomem *pwr_iomem = ptdev->iomem + ptdev->hw->regs.pwr_control.offset;
 
 		/* Introduced in arch 14.x */
 		ptdev->gpu_info.l2_present = gpu_read64(pwr_iomem, PWR_L2_PRESENT);
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index c4a490bc39de6..0a82152d772ad 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -27,14 +27,39 @@ struct panthor_hw_ops {
 	void (*power_changed_off)(struct panthor_device *ptdev);
 };
 
+/** struct panthor_hw_regbank - Register offset and instance stride information */
+struct panthor_hw_regbank {
+	/** @offset: Register offset relative to &struct panthor_device.iomem */
+	u32 offset;
+
+	/**
+	 * @stride: Register offset between instances, or 0 for non-instanced
+	 * registers
+	 */
+	u32 stride;
+};
+
+/** struct panthor_hw_regs_layout - Hardware register bank layout */
+struct panthor_hw_regs_layout {
+	/** @gpu_control: GPU_CONTROL register bank layout */
+	struct panthor_hw_regbank gpu_control;
+
+	/** @pwr_control: PWR_CONTROL register bank layout */
+	struct panthor_hw_regbank pwr_control;
+
+	/** @mcu_control: MCU_CONTROL register bank layout */
+	struct panthor_hw_regbank mcu_control;
+};
+
 /**
  * struct panthor_hw - GPU specific register mapping and functions
  */
 struct panthor_hw {
-	/** @features: Bitmap containing panthor_hw_feature */
-
 	/** @ops: Panthor HW specific operations */
 	struct panthor_hw_ops ops;
+
+	/** @regs: Hardware register bank layout */
+	struct panthor_hw_regs_layout regs;
 };
 
 int panthor_hw_init(struct panthor_device *ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
index b1000001325ea..1cfd4b658c81b 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.c
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -502,7 +502,7 @@ int panthor_pwr_init(struct panthor_device *ptdev)
 	if (!pwr)
 		return -ENOMEM;
 
-	pwr->iomem = ptdev->iomem + PWR_CONTROL_BASE;
+	pwr->iomem = ptdev->iomem + ptdev->hw->regs.pwr_control.offset;
 	spin_lock_init(&pwr->reqs_lock);
 	init_waitqueue_head(&pwr->reqs_acked);
 	ptdev->pwr = pwr;
diff --git a/drivers/gpu/drm/panthor/panthor_pwr_regs.h b/drivers/gpu/drm/panthor/panthor_pwr_regs.h
index 80d8e1e522298..e1f3153285bd7 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_pwr_regs.h
@@ -4,8 +4,6 @@
 #ifndef __PANTHOR_PWR_REGS_H__
 #define __PANTHOR_PWR_REGS_H__
 
-#define PWR_CONTROL_BASE				0x800
-
 #define PWR_INT_BASE					0x0
 #define   PWR_IRQ_POWER_CHANGED_SINGLE			BIT(0)
 #define   PWR_IRQ_POWER_CHANGED_ALL			BIT(1)
-- 
2.43.0

