Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=2 smtp.remote-ip=40.107.130.32
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795103219;
	b=X2Pad5tk5sj4YeAu8genExW7CQg/V3S/BbpcOx1CQ7DAnrjIeebgcyPgIuXa9EnjuVmU
	 GI6xLcBtkfmZE3Xa7YifvP6wKzopvfNzUMKJXSFBRRUB52yw8THBGQkg5kene45xxqfeb
	 Fm2nxkGqM/sqih/CKfuQnSVqEz/iR4Wgz/EyJSU11u0y5ow/mwUvGgqC9wiBUxLxLN0U3
	 ziovScshUs858L4qxUblWPziI3gVSWISwWWPYV8UjwC5CdGTlhrxvDizj5ad1PGqz+9O9
	 S1w9hIescOxFIU+fb/Hq9+iFAaJRUfbgFI3UbVOZCtqP4t/S5j7JUWIWR0DfVsuGmhQ==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103219;
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
	bh=VAwddQeUkfulWmc05IVYKubi8Po7HPv3Tlxf8GAGqrE=;
	b=jvuIf2qJHQVDPVwgwh73PzBcqxzGqLfdvQgiwnCyoWOtQ52bk9NQO+cdfYTW85/Vl8dd
	 ELXQlblA0xXo9ukXWcGy/gSA56fKflGATnDRHFP93z3Nf0aY5fxCzxnrsWkWYARpdwF3l
	 QBS1bKlf/WqSbyxZc/ZPt9+GfLUj7BbEeiJgIUFMfWNr/WrQ3aZ8eC6+4MJxh0VXNF/AL
	 Rtbp8+mLtsmvm1U3c+aLtcLA4EgUrAn5hf+N/XE0XBeGCrJCo4fBGMNpCKi8O5QimE6fS
	 P72aqckkcx7b3qpXFpFapylPhRZZtDz8dgRZBk4MK6TEobysdT9noHgxubKUBPZRHhQ==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=RRrRIA5S;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=RRrRIA5S;
	arc=pass header.oldest-pass=2 smtp.remote-ip=40.107.130.32
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011032.outbound.protection.outlook.com [40.107.130.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12D6606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C12D6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=RRrRIA5S;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=RRrRIA5S
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=l0clFVlbFLZ0YdsjZ+qxNRxl5fscOl13jEwaaDEt9Puoo1QjlJYyWKq2YGCMAV7B6kytkLanREstYAxYNxMVFxKYW2m4UBQw8ztr4XonJvA7+wcxzpAqtgM7SoYAZN4ZZ+Z9PmBaAPx7LcY2noWgPHpAorp0w0uc0LtdJ4lAYBQ+x/PsxUoM8fDRuduE0qyG0gh2bPMQe0zQiHYwjNl47pRIuaQqaJZcQkUDVWWHBEUXKAOlAHaLTcLekKEkzH++hX+pOEvRccsQsjAgONuoM/tnMuyDwpxVa7ruUDtHnBccwmBsJIkOHE0jfAUKVvSt2Nzba9lNMZfG9peIcO90tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAwddQeUkfulWmc05IVYKubi8Po7HPv3Tlxf8GAGqrE=;
 b=AtYphGIVRyeOSQ4NM9jx8MxbfBXFkFu6LUgog4IeaeUDqcVmxicsANojfDGYK+GqeFWjgMijK4iEg0vFL9L3i1Imffub+aLBdam5OL2FibihGbjmAPgIWvHw0pPDzh1v6ug8UXyhRMY8I7EOkXzdeHodOFfYZKd4oOYIZi0R2NeBWBJiAmTmhLd0/iVj4PrcsP1jXdWkRuFmfz3TsUCTaI6tIYd6QCpSeUxalPt2c0iMoAEJdczJMdSb2GeP/+/lhqJe2fG0ymALDBuF/2k6RPPl6sKcmD59HUn5+1tbYAERJVakWJB1yiJWzseVslJUg2zWcGKzpT1zF+wUO9tu7Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAwddQeUkfulWmc05IVYKubi8Po7HPv3Tlxf8GAGqrE=;
 b=RRrRIA5SJg78GXW9zJQGmQnqfjm36fTDFywFluWUjVrPt4NlNwS4n0W4ZNQ/TVR6FBfW502JCFFCwg2lJwE/NusutYJ2wAs4JINkSvw8i0FrJC69DtH4cIARawFd3BmXOtw+ji4/Meae2swE5SA2UeX9OKajneM/9jqr5rGeBhI=
Received: from ZR0P278CA0086.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::19)
 by PAVPR08MB9139.eurprd08.prod.outlook.com (2603:10a6:102:30c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 15:46:51 +0000
Received: from ZR1PEPF0000E6B1.eurprd05.prod.outlook.com
 (2603:10a6:910:22:cafe::87) by ZR0P278CA0086.outlook.office365.com
 (2603:10a6:910:22::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.11 via Frontend Transport; Thu,
 19 Nov 2026 15:46:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 ZR1PEPF0000E6B1.mail.protection.outlook.com (10.167.241.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.5
 via Frontend Transport; Thu, 19 Nov 2026 15:46:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E++sz74lTI6AEpXSH1LXrXRvJHDnDzwKNY0nUf5avd1S9ZEMDOiShTpU+KLHKtuRfFTBfpU1Z52v69cUD49JFC039MQgstuYSCzZ2am3GQaYwD4eyc+F2u/ZCcivkj/BiOtNrn0Tt9MqZyUYHgfP8vWcMtfvTC0y7+zWydCayohA5uk/6FsY7svJhEy7VF4tIttTh1Dt9RpX/vhuK5biyRcMBWCG3XzMD95QMShGe7FRJCesxD/skP3h410zaHhpkfepm6kbWWXZa5RBJiPOsjiDa3WI2IHyB1Joe3XDrpSt5J1x7Giw0xGxrEId01Y3Z7ZTsoiDXbsXsHJ2guXPtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAwddQeUkfulWmc05IVYKubi8Po7HPv3Tlxf8GAGqrE=;
 b=IEuYlRWUxncWZT0evSeFvg2thfmxgCAu0KkjvGcriJThXXBPad4p1FL9PNXa4o4yYR2V50uTh3qYX01SPCkWHZU/PpK7mLwq2XghC9fLQlIEqnmz83ZkYfvSi2QZmzLsWoHX5lBPrTjZKTN9KElH1e3lI+mLWV1629P7G0bzWNlN7LC/pHlwTs9xGM0E4GIE2hrshXHT6FVftr5Zj3Vr4J4IJ/57cQxEz+b4YihyVkltSMllBSCpIpi+osK4+ozAmp3NkN0lenSrfye5iFQu2wfqZ9PnIvHfPuDQ8JIwDBwVvDHpJ1VZJtI7CNkQTUAGKfOBn/xMVxF7h3HRWsrNfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAwddQeUkfulWmc05IVYKubi8Po7HPv3Tlxf8GAGqrE=;
 b=RRrRIA5SJg78GXW9zJQGmQnqfjm36fTDFywFluWUjVrPt4NlNwS4n0W4ZNQ/TVR6FBfW502JCFFCwg2lJwE/NusutYJ2wAs4JINkSvw8i0FrJC69DtH4cIARawFd3BmXOtw+ji4/Meae2swE5SA2UeX9OKajneM/9jqr5rGeBhI=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from MIWPR08MB568805.eurprd08.prod.outlook.com
 (2603:10a6:290:e9::16) by AS8PR08MB6231.eurprd08.prod.outlook.com
 (2603:10a6:20b:298::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 15:46:17 +0000
Received: from MIWPR08MB568805.eurprd08.prod.outlook.com
 ([fe80::be50:76ed:509a:b9f2]) by MIWPR08MB568805.eurprd08.prod.outlook.com
 ([fe80::be50:76ed:509a:b9f2%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 15:46:17 +0000
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
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v4 1/9] drm/panthor: Ignore -EOPNOTSUPP for shader-present nvmem lookup
Date: Thu, 19 Nov 2026 15:45:51 +0000
Message-ID: <20261119154604.2519184-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119154604.2519184-1-karunika.choo@arm.com>
References: <20261119154604.2519184-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::13) To MIWPR08MB568805.eurprd08.prod.outlook.com
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
	MIWPR08MB568805:EE_|AS8PR08MB6231:EE_|ZR1PEPF0000E6B1:EE_|PAVPR08MB9139:EE_
X-MS-Office365-Filtering-Correlation-Id: 1962a5e0-28ea-47fa-5380-08df46545361
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261022075727099003|261026121527099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 ahyiSgL4M5soCTpSe2m6eTb42fJy4QIa2CipnhzmG4B/pU1osbybdO/76g1V+mXhfNuSdyru2/IXVcwzJA0z9R0aI9QK6ncNEdIbVNbGYDcijoeQ9CBky5lNZsz6nF5hjoubNDdvmvzvmNYnVKkyAUuvK6ii+nX49/AWA2uHBws4s20DK3HdGaGK1ZYgZW6DXLY3+Bngkm7CaHTjfKYdFHUXtN+xFYIZMBvmevqcuEI/HK7d46bnB2oVQFHVWtc3uyV7gP0CEwXfpshaQAKbSHCi2j08lB21DZFx8YLX7aGvRgBGhrLkeCkZ01Io4QVoWYwcvDg6/mq4/Qj6cqsXZS5XzUfk7TZMt1b+2f7j+5E3Qcg4AfOY7tMEEm5JTVIlOBn6tkFT4Af69lKynnRybXBXswavir2sQHyiED2vPJvdTe8LzlfFa0FBdsCqZyUj9W5Zen3aKV6gsrF2VnAS6BbwPnyHa6ajuHXlMVDfiBNeuZEwpaj20fxcvsG8uoA3LsfrfvWe79s+D5LLnnLd+VrYpkk6ZvjNKNalvf+LInFKIC77HXmLXm2WA2QVAXWTtXt3WTlzAHrqQImK+T18fDVvVEw3VStblJ5F/KVcHlJUbbFqeIIb1gk+SfEtwY4G79aHZQZas1Y/bGeRBX8YtGa+NxwcMyj/j2GUm40xgvY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MIWPR08MB568805.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261022075727099003)(261026121527099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 jvWf1YJwBal4FOQaT0QgFaOasQVAJJNk7nCAiN1EU7Zn66AfUySb9RhQjeFg3Q2y3r2CzxWvr+n/0gk00rx9JPZoIcG/B8op78WpfBBo9drgwpkOUGewLmA2dq6axVeh9B/yo46ogBlVLQX1OGBZdylOGJegSaA3tPvbNa/XZO8TVco3I8bfNShvnXB7XV9Qk+flZdEHC32UV0IcSwDQfS3nDuH56z1vfzV0BXlDVvyTicCcWKcxJ/ct9uItCQ5KFpE+1NLxQohndZdSn+Pf5b1YO6zkhRG15LErtCN1nQCqXVDWyhpBuBloUx1BFWn7uSzIBzzLpqyRaxDXF0E03w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6231
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 ZR1PEPF0000E6B1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9f0b86f4-cb82-4aa4-a20e-08df46544003
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|14060799003|35042699022|376014|36860700016|1800799024|18002099003|22082099003|261009223027099003|11063799006|56012099006|261021123027099003|261021121427099003|261026121527099003|261022075727099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	0H6s85GIWSW4cMFTYuqmtumyAe1H07/7sbRiUUVKGoRKJnbAWTwofRE+B3zEtQxJlAhuHlHWcrznPOw5lA9MpgFq8fJTxHxmXNOWnnjPsIKq5kdfu/WrICfgeKGWXMko+gWhrvZZX5ydWu3kda+eOGisjcbMNOdunF6kB2dOJ8rhb+/H4pUt3fiIi173HagPjcI7zZFyUwkkfyI4i9a0MgyusWDxqqG7HWB0J0ZbLSmFkrFXy5cI0iZjdK8DPRqAfj9FYqdxDOo3/G0Ncvi4LaFCeI1xmy8wk/Za+NFaA0tS3/z2zYhTT6Ux4ATPL5DQeZaOkoY/A9p+KBCYhLBWqtoiSNgzpieS6EG45wvVnhVLdF/xWvBiKFGBc+0CWplRLhsvm2WVBuEMB4JwzUUSH0fEN69nFJl4QbLhCjNli632qUqVcWGjHxTSITnAA9pPsRj2f2Hkf2DVIDGNCenFiToLTfUUDwF8fWhVBPHnO3S/Gm1uZLbDpdYFaSOsD2vmlqpy7TbSBmrSyZZ7hWeFGUG1ZqfJMxj+KCWqfpZwvSMbHIKJ4grv4Eu0miee00jIOjTNu8wcn8yEoJLHYeM7CU9jLKEF/LY76mD0crwv8apMQsVgpTMs9scG6hnbLGXY78tkkAoufbIMRY2dvgi+vqfv1kH5plBTT3ze2FvH2AjkbAuSkH2xB3lqkscqrVVTeVCc63VzU08vcfuXgCrHMA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(14060799003)(35042699022)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261026121527099003)(261022075727099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TjpcwC8SYOwYJC6J225zXO/Yn0nu1XipXhxESe1aP2XVNPBMxtJaXzUwyCxCT3ySg9HAZry3XGhRo0rcRSGCUSUdvHZ9mvAYco1cGLeLf0oW9OivjPkW6S/WlKmaNOFHD497AIzWrnnkPrm0VpNhKzDgNfatJGy1tR0JQVuBc+jgxNlkZ86W4Srj3nNbjXqNOzpSRJzipcFgcgAtZXCKgkBmf1LPZdmVerHXbn6aC/BYrFI0QjpUGWATxKh3jignqtSScM8nFQVYaChxUaRs8FgZGaR1mgDzO6gh7M8SoApQjpjLPjV1xnj0ckWIMlO1X64+x+8QBwCEJ2Au1sg096Zw0eHIiGLLpFOP0SggTuvuEYyX+w0+NEMPQMLm7zC+2Z4R0DzE1nmY60Mm59Fq9OZ9jjaIDhqodnw7/L8N/8jJLp1V0N1iHOmL8HLztlHN
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 15:46:49.8254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1962a5e0-28ea-47fa-5380-08df46545361
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9139

When CONFIG_NVMEM is disabled, reading the optional "shader-present"
nvmem cell can return -EOPNOTSUPP.

Treat this the same as the cell being absent so panthor can continue
probing on platforms that do not provide shader-present fuses through
nvmem.

Fixes: c40b50c3cfbe ("drm/panthor: Implement reading shader_present from nvmem")
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v2:
- Picked up R-b from Liviu
v1:
- Picked up R-bs from Boris and Steve
- Added Fixes tag

 drivers/gpu/drm/panthor/panthor_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index ea1e222ef1210..34dc4b9d9dc09 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -182,7 +182,7 @@ static int overload_shader_present(struct panthor_device *ptdev)
 					      &contents);
 	if (!ret)
 		ptdev->gpu_info.shader_present = contents;
-	else if (ret == -ENOENT)
+	else if (ret == -ENOENT || ret == -EOPNOTSUPP)
 		return 0;
 	else
 		return dev_err_probe(ptdev->base.dev, ret,
-- 
2.43.0

