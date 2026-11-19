Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=2 smtp.remote-ip=52.101.70.7
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795103221;
	b=jhgMYR0ovFJZmT1m7+VDBGMByC34ijwkNFMGPEmx8fZFX0WrLe/lTE0/aHzhVxHkawmA
	 KG+6eg79a0TVeHAA+qjctURI1z9CX2N3a2rVcdXkSpkCA7ajRVe1pjC0bhNLjZNOi/ZLy
	 +QwQ35uZAgHI7rRom/w3zt5JX9BKGLn9IAKub43TCJQgO3btc28tJwUNJSEC6Ckeu5oA2
	 TzLHJKZZBhglWA+MhHos9Q0MdL81bYtPLj/WY/xIayP0zgwR6TfXXaWujlg1A4aA7KCPj
	 ZI+lMPMY1pTcLSBu2NtaOCAdHr56MuFrt7qvgcmBdLet8To4jhlNFPY9rP9Rm5R69Hg==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103221;
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
	bh=vIKMq3qwZn6t+ImSAT+349MSopDnZBTi/42iC8UK9VQ=;
	b=Xd54FD3Z+XnRRRbanXWF6G1FnQnEpADNod+g042weNp++p/xiJ5bOWPRHtWITtQq1hxl
	 7PMp2H2ax4qTmNGOzSNXPPTtdVXBluI9iRnR/3KTybfPmLyft1bFpHRwZ25lPNgyafhB8
	 9xaQBkDo2DfOJ0jAr3rqt1BkDT/y9B4ODUSs+JiQgvvP6Nm7eDUPNEBvRlIB5ianiHeuL
	 /RIt/ocOSHWlcWTGIMGkW6QDzR5l/Y3zKyO54VqKMu5slBYZGJwVTy3Q5ic5avm0ykElc
	 SEtvO0eGbogpRJjtxvJoPa2yj3OYoYy24ay7nvGgEAZZuDl5BqFKMCU/PWfg2hXhCKw==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=IkGi+3Xp;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=IkGi+3Xp;
	arc=pass header.oldest-pass=2 smtp.remote-ip=52.101.70.7
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEFD60A2618
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EEFD60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=IkGi+3Xp;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=IkGi+3Xp
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eczABEw1KJMl887gB/wCsAJLphfgvmR3+nsVLGLBbmETZ8nR4n9u1dZ/JaSkI78nbc68xUhOlOKQFIJif7uq31wH3YxAVdvuSrfrBPn2MwZ8KswQ5xuzqYR3R03CHrrZm/KwvNqVSo+UhyU6jkPHarad08He9CwYCpCACnq/rD0enBEST5ab/GeqxZzoVdmEBbyxRZmmCGUN003+Tzls8f7Y/Hc8GJ7ELuque2Ui5wZmbxyqdS0RaWiMYXmxckZ/pDv25RlvnYh16GVSDGVlD+8mj+DVveiJvKP7hvBOjZgx8zqGwyvB9zGrkjABGIG5JuZ5B85yCGSkOL8bCJRp0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIKMq3qwZn6t+ImSAT+349MSopDnZBTi/42iC8UK9VQ=;
 b=XaCAu0o9d1BEarhdPHAt0iKoaUmtXH7THEOv/xbSF77P0JvG4L3FHnJ4Cnuq1hSFHGwKClxGs1EEb4dOFvFav9xW+8Pjz+iOgGeG5X6Th/ClRsa06sAPIqutqh1Zbs6Kg2aPLoZ83OpzJxN63A5y2Gk/jZoLX6Pt7Vw22aEGlv06sdnHYjrUV56C4Xg4t5264E4ULCsFRk0NugYIVyo0IGpjCal/6D1u4wy4atWy42g0WZyPxtngTuJQJ31oEGGzsLXdd2uyjmeBLdBJpDZYTFpqEIpfh+Voq32HTqAmE5NNzw491wI8yDfF+A4dlUvFpL13CC0okpcrjRbTlYGELg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIKMq3qwZn6t+ImSAT+349MSopDnZBTi/42iC8UK9VQ=;
 b=IkGi+3Xpyp+jtrhTILx3W/cdIsTjkDkm/LEfDkt4R8c6LZ+6mUj7QLC0ANmv2GWpCmM+JFvCBrSd4r9mAg+jNu+LVysH6H8cyLpDGGktOHnwWedeL+QSl2PWhML6sQRSFiJHPy1/M4qN4ScphiBKRJ4xRXT+OclPG5tDx4VQ0BQ=
Received: from PA7P264CA0503.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3da::7)
 by DB9PR08MB7628.eurprd08.prod.outlook.com (2603:10a6:10:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 15:46:55 +0000
Received: from MAD0EPF000008C6.eurprd05.prod.outlook.com
 (2603:10a6:102:3da:cafe::95) by PA7P264CA0503.outlook.office365.com
 (2603:10a6:102:3da::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.10 via Frontend Transport; Thu,
 19 Nov 2026 15:46:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MAD0EPF000008C6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Thu, 19 Nov 2026 15:46:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9sqSo2IFYe2vtiBhfHkeuwack9lqMgONd+3l84JlB5qpHrb8VzOG+1SZh4b7o8cjPXIYBuHZSmNRcd4/rQMcVhTedo5ZALGCjgtTRFUR4QO9Abrm6jfLlc7VG1r3C4vpwfFf9+qBEzagNaqC2/AFRBaL3DKF3ZQbSKPnxP8WJ/LN/Kj7bsSsRuU4UxUBCyMll5+bOwkZ+oDJppxy/pJelSTCatWevfQRQoJuDF7d0c++pxQLKlSnpEzwPlBNtOg3J1I0SSnoSi4RBmiJCNWQXLJu2dPwTlmf4ofNnLbY2zgF9pjKmxB4t1XPJDe9JQT4OdMFTgywtttKlffRd40ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIKMq3qwZn6t+ImSAT+349MSopDnZBTi/42iC8UK9VQ=;
 b=OQHYYPCI32ZCXCYuPJJPqK+cAbnaj45n2b4ms4YKZe/J75TyQ7KtvTbH2gO3kNi2G9AdYJJq+GY++vpd3iH42dVUDl+muPYFC3V4fkwHxKlwGBkLgzI9bNlup4KQXS2sQsoPh91TLZ6FRYxCtHVhkDnph1smxILYcX3ffWKcudby1M7VlxzkzizR0/k0/zA3NquwWwRJZ81PUxuyoHKDsdtTRck/OexeJa4+iRrnHboiRMkrpycAxJRZfNNZ6S+/qjeupk8OYrFuFel/hMsa1gCJNxjgY2sridd609BZXXAULvD3fRNCfoU23I1PFpMSmw+vQmr7QMuD0L2jd9kc8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIKMq3qwZn6t+ImSAT+349MSopDnZBTi/42iC8UK9VQ=;
 b=IkGi+3Xpyp+jtrhTILx3W/cdIsTjkDkm/LEfDkt4R8c6LZ+6mUj7QLC0ANmv2GWpCmM+JFvCBrSd4r9mAg+jNu+LVysH6H8cyLpDGGktOHnwWedeL+QSl2PWhML6sQRSFiJHPy1/M4qN4ScphiBKRJ4xRXT+OclPG5tDx4VQ0BQ=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from MIWPR08MB568805.eurprd08.prod.outlook.com
 (2603:10a6:290:e9::16) by AS8PR08MB6231.eurprd08.prod.outlook.com
 (2603:10a6:20b:298::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 15:46:21 +0000
Received: from MIWPR08MB568805.eurprd08.prod.outlook.com
 ([fe80::be50:76ed:509a:b9f2]) by MIWPR08MB568805.eurprd08.prod.outlook.com
 ([fe80::be50:76ed:509a:b9f2%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 15:46:21 +0000
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
Subject: [PATCH v4 2/9] drm/panthor: Rename neural accelerator feature macro to NX
Date: Thu, 19 Nov 2026 15:45:52 +0000
Message-ID: <20261119154604.2519184-3-karunika.choo@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119154604.2519184-1-karunika.choo@arm.com>
References: <20261119154604.2519184-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0270.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::15) To MIWPR08MB568805.eurprd08.prod.outlook.com
 (2603:10a6:290:e9::16)
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
	MIWPR08MB568805:EE_|AS8PR08MB6231:EE_|MAD0EPF000008C6:EE_|DB9PR08MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ae6b83f-2922-456d-a8ec-08df465455c0
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261022075727099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 sCBb45gwReqnbcKgjmNz3HT1eUoQWMqeT9d0sDgNx1X5pnnwuhh7ce3kBOjs9caqx4/9g+5lzmge9bRHQlDEkpaFw4/0oT17HoxSt1yJ7MLdNN+12xXBIrSaeQ8Sy1dzThPPn+AgCi8tJjMXtC0v0OpZzZ82e9vV3PhkFsJy+7e5/QvZh4SW05Tz6SFfee1bwkzDduKpnisw92GHkNgCb0yotWHrhQFDLKmXsh3vxMXtQUKD5rOYjkRtVxiXSCXQtNlrYk+ermvab4yoi2L9PDxGlWRUR2A+knKZ5Hd2JDu/qfVEua40RR3I2gZIpVZ2tCnFYVdFIundu4U5krGjay5pHfhdiF2fkSjTvSVyc3LIJi9cwVCuP/C8+l97r6RKMgMjVdJS+YHRBhPET+kwGqsLo0gMPE0dCJ/vQTLxlBO1iKHgRk6VClUQ4BwBCqOfJaSeKS7PrakVWm32IYost08Iz1095sWfdtfZMWSC0PTokUmAnzMLKIQY9PsgsvBlhNFDkwx0mVyS0gx2CvTPs14kI3M3qhyhBVWPCguTpffDlUk0izuN5gFzWqcdx3kFU5Ixow7CLKz8MJF/kyZv7z+m9UcwRjaKQ6rdAmz3BYvgQrzHMAWUsZPfDEqo0D+J8rze7iiTuhoIMK9copMiRPF4SCPk2iDmPdhc7XKonS4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MIWPR08MB568805.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261022075727099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 o4Hvag1Qm0kIBhi80M0TAoykpeSwkfgDc1+xNTSL7Ju5agO1Fg4NkwfvmMb2dtIRnpKvI/a0qt3YlljzlVnfKxSBu/nMqc7eVe060HbFx05yui210oWi5ssx5012VB3MPe9OZ7r5GAHNfGh9/XFvGrEYEnyU1jayfUn9x5Z4JqQMvpvRV4ktKYHSim4fahlSatD4jWvQB9EHbMvDy6ml0WKSOk9ehA1g3kGvkPHMOGtq/xQRu62xoD7OHheGKyxGzsQXdy661dsKZBWF3i9LCEYVH+t2aguGic+mn6OxxgZi5inSaPlIuTCa0Y0IEMh7MWSYoDP0JkPd0QOGgVYeiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6231
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MAD0EPF000008C6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	39232a59-410e-45b6-52bd-08df4654420f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|376014|35042699022|23010399003|82310400026|36860700016|10067099003|11063799006|56012099006|261021123027099003|261022075727099003|261021121427099003|261009223027099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ZgfjO7GaRoifytu/zCkrUTl8UPRiw9JxIADxMaaH+oxgxzPh5XURKjJFfUxmsiOEeb69IUEXrYtVFjR1KqfaCMI7MbFO6WqpHM6dpQXkmQ1XP9bS+R4+nkk9DUq8hg2CD/THLhqvX0sHgPGydXQjXNrbTnR+9sQ4dk8YkAW4+t9DSQfaa5/mK5PHKa9w1q/Rosgh8+uQumPWuqol7FtAXrIR++RzRkpyCklQD9iELX//bj+5gkjNQl/wBxwip0fnnARKwWw0MSksqKFUmg/2jNG1uw/wWnZkswpmYGaNATFXwBG9vL1I+yggPq6PluHrZx8iDrGt/MGvLYgtiywFARJ/DtmkQJyQv+eb8EZvFSw8FSq3wuqhVYGBX3ss565eB1LfA/vAnEpsHR9lqNhdhuCin5a6dD4+/BX42t0WA1N6CI9P8X+zGblPHEwr+Of5ZIMnWa8ci0+eJdty6Z06alFYrATA8JgxcJZDql8xU+GdKyJsA5/NIoZq0dMRJAJEV2rp7kOQHsBgj+rm1qiLR4Wo9zfdIySKkjr3lzvhn7EdErq1AaHA0/G4o88tXGIXVoyt262na9a2JWm+gDJpSL6P0Tt8qgewYNse0YXVwIOSGKvvjcClHoQSBjTXwHnt9pPXCbXOwjKj45cZDfyZejM0p6hi08GiL9Hi0VItZiP32CgBstRHdSI5i2VBvIVl27qQWfQS8pFFbgL7OSZw+w==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(35042699022)(23010399003)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(261021123027099003)(261022075727099003)(261021121427099003)(261009223027099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6brIYMkUwPKzJ2kvsB4oBEH5y8JGl5SGlKMghC2ZfKGidie+AJDlSYdUOoAALhZ0M1CuNuG2ypv1PF+JUmPEw1Xau85gfgdbLdoJyDSAleufgv+MIjGYqBUKAZH8JHlE8fZ5k0zQ2xlpORrljF3d0jp8v24IiVl1J8iazilUgTBOdwqX1xWTfTb+xKfEs0tq4dJqtN0n/skj0Sd19v6xeFs+xVObtJ4IqvBsiH92wdn/bYoGhEVav0HoyIKRNDFVBxZ0zN/ldB11yw5QNAQMl9yQR5S8CNZPH1jzgT6ruBsNkFdubVvhOY6SIarqGbvzDgwF8ebTxc9Dr9ElVLrjeykcyzeMxFT3IsQrY3RJqqOf7sPWGbD8HvW7Tbeao2fBDqbib/PKEBJL2tdrYjMf5PWCaQR5F0xlYxY+OLs2VaVAWfzUK1SOKGb1f20jb/1y
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 15:46:53.7895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae6b83f-2922-456d-a8ec-08df465455c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008C6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7628

Rename GPU_FEATURES_NEURAL_ENGINE to GPU_FEATURES_NX.
Update the panthor_hw helper to use the new name.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v4:
- Collect R-bs from Liviu and Boris

 drivers/gpu/drm/panthor/panthor_gpu_regs.h | 2 +-
 drivers/gpu/drm/panthor/panthor_hw.h       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu_regs.h b/drivers/gpu/drm/panthor/panthor_gpu_regs.h
index 5340966caef37..c7581b6d4c5be 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu_regs.h
@@ -67,7 +67,7 @@
 
 #define GPU_FEATURES					0x60
 #define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
-#define   GPU_FEATURES_NEURAL_ENGINE			BIT(4)
+#define   GPU_FEATURES_NX				BIT(4)
 #define   GPU_FEATURES_RAY_TRAVERSAL			BIT(5)
 
 #define GPU_TIMESTAMP_OFFSET				0x88
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index eeca936f44bae..f770dc40e6216 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -64,7 +64,7 @@ static inline bool panthor_hw_has_pwr_ctrl(struct panthor_device *ptdev)
 static inline bool panthor_hw_has_neural(struct panthor_device *ptdev)
 {
 	return (GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) >= 14 &&
-		ptdev->gpu_info.gpu_features & GPU_FEATURES_NEURAL_ENGINE);
+		ptdev->gpu_info.gpu_features & GPU_FEATURES_NX);
 }
 
 #endif /* __PANTHOR_HW_H__ */
-- 
2.43.0

