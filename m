Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795849527;
	b=doLJ3+dZE4do/KhgQhHaOXBdDqAfed4wz1lkvh0HY4WksOps99gxnGA/K1IIBNm2Ffbx
	 +DaGdUyMKrWwJFB7eXRne06Kqfcu2eYM4q3YHJWN4C6OEg6F0TRXAZaVZFlLMg4fceqzH
	 uwQd5FGsufx33ICmeuwNjoPl9Qfet834qcRkrjn1pic3uV4DrM+Pd7c+lGXPNRDI1/y9B
	 3DMpw7ISjWrh0Z5a99Mnz6znxCqG0iYQU6XM/pDPBeMQYVN3LI2bMtTJ+CgVkEv+1bPQg
	 /CurYc3SXjYJG0s+qWm7gHaSl/B0andyprFqEKJrrU/+kLo9O7/sf21BoeaOS5Jznyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795849527;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=CkRoFx34lEqot6SfX3BVGiiReCHom7R5DWSjF5DKyBI=;
	b=v1Jn6+zZIibR4II/XE9lMks1qb1Bt7gKHRdL16a2VkIxXV1QEGftSn8VxyptoJjwtDDF
	 HSJUmFAJEJouneVyBJeOkewGGG4Ak3ZD5e2kOBU8KnIDWGW3yHYuYzFZLklw3aJ51zJhj
	 ndEra955RT4Go9RI49ifmXW2E3RX5llBMy0hjlahA3J+ur9j2Y90re6Ydt7GdPqb6266J
	 9O0oOylwatY6a5joVEOIMCvlhsAMC0/XEfqAnyLtI+nyNCX2ytlixDNNyeoJuEJAO0Te1
	 Ed0Djk7JtUwPin3MvHGAAdG7PlcxfCAAoCmVz3loF4w0AtN6DtOvvfwNSJdhNZR18Sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dhax3c1T;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.52
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012052.outbound.protection.outlook.com [52.101.53.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18B3606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 07:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B18B3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dhax3c1T
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJGAgrALY9GL7S1AqIjtReAJOD6QYNwrV4UmGfhTTZxluR2y9JkdK/D1Dyra7dvchcOhWGZocQE/b7S5pHrnv/oZNqKg+0kxBgdi8avM9PZaJpNDSx3SX3TPrpF3C6+WmOBfjGJlfk4Qa70ZZ3ji+RgOOj+5QT7NfbXussPqxRKTp461ajK8c4lz0Ey7xi0Cda8KZXnOG3FK/C/9D5BVEd+P7QxKnTEJ4tbL2AXiZQRTqt383rOrjFQf7/eHb2Etsq9ohC1hxc40akLkYj0R2ZCiX4K5eDmS+Eaozz3fUMtLQ6ya87/b00fhyz+XNrljSKCnDR42hAdniKqYmUfzrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkRoFx34lEqot6SfX3BVGiiReCHom7R5DWSjF5DKyBI=;
 b=kCaKSPjAbp/8bpLJASdfU0t4/irH70Sfcr7WC1qQK/5Ra1E2qO1EuSyeUYxK1ItcMxA9GfLRvFwMMThr+AEeu2WlAtpwgm7ITN9YelNXVK2qcD15RyPJK0AcecLMwAfzmKTfCsebMPnY0DV/y39IePBbB2RKbsk+X2gL8IAtAFUNt4ejW1D1Epnnk9RUVA99EbOk4N62siNfmFMU7sCE3KA9uMQmzeEc0oIZ9Jf5ZbR4Spv5rUcfCKJR+Fc+6ZDA9EqBUMKDB05jOnG589eki2dOyIXJJXc83OHT/senFVTcwPJCqAAhBhzl4r4QvOwvc1g9LA8i9QYf8o72EUAEIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkRoFx34lEqot6SfX3BVGiiReCHom7R5DWSjF5DKyBI=;
 b=dhax3c1TH7MHlrIuJ83lNvZbNL+E9vc/6FKGxki53S9xA2CJcNHtxGwUeQUr6mr1T50ll+A5uZX8hdW+VgLotpx8sqYHD0vCZcOCQN4PoF0rUU7lrAAlRnwbUqHZ/kKiXuQ/nZ04nX4FHw9hZOehBfo6It9wLCug3nVyDe73z5N+njKk3/0/4EsHmVBwWYP3ZtbXkWdRLeJbYCAXlKkMAHVqY7ZtHcDMxuAM6QshxmolimH3vCiPndi99w1E2For2evOVjJ1UcLuiytKS78LlWTfQP9ItqjsKW+Jood2xJT5yqOLe3UYwulV5DJs5fb3zcIG7EZe0VKeKrx9exxLtg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by CH4PR12MB626935.namprd12.prod.outlook.com (2603:10b6:610:507::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Sat, 28 Nov
 2026 07:05:23 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0662.007; Sat, 28 Nov 2026
 07:05:23 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Tze Yee Ng <tze.yee.ng@altera.com>
Cc: linux-kernel@vger.kernel.org,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: Re: [PATCH v3 1/2] mtd: core: drop the module reference after ->_put_device()
Date: Sat, 28 Nov 2026 09:05:19 +0200
Message-ID: <20261128070518.3376508-2-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022035352.52129-2-tze.yee.ng@altera.com>
References: <20261022035352.52129-1-tze.yee.ng@altera.com> <20261022035352.52129-2-tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TLZP290CA0002.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::8)
 To PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|CH4PR12MB626935:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d89cca2-5a61-4f3c-7c24-08df4d1df883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|11063799006|4143699003|18002099003|22082099003|10067099003|56012099006|261022105027099003|261022075727099003|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	DhBaDja4HsMi0wC031Yv9rxZistzrTsfFoR2Pr0dhWJy3+7FPsZb6awanNEUA1HC7h3YuBeWc3pnHze78MMlOEz3hiV+eGKeDcKPwDLg+MURLMnzR4cwXcpoq7xXVZ7/tkaq9pOz9dd5mEl5ao3U4zhNUgM/Y1YMlJZFS20/hGY6hDdb/bwlKcPs3fZN0kGQInCTeIuVkyCjPxKcz5Wamd+DRxzhgad4B9uAVvn3Yws+NSW/JxgpGs2VasiW67Ms5NZG0U3qLah86y5+oL346nt+1HhWbfud2BoUK04mbP6kNgk/GdwC0t728+ofZzl0C8wRXPSvfKdxYOhYOKGqJx/lAb1CCDkChVzXV7aCueWzfHycYfRTlfZ3ukeiwBb0Zpn5M38tKjpM6JxHgDI0w7DWgMEfFfTyYVJe4+7hBz5VJ1Q2IM2bBaEW6zqZBY/Ux4xpBzHlYcmgl97Zv6DOhPUUXuC0lIZabSOzq/OR1cFUNakvnRyBBQjy3CuK+NGUblId6zg5sl4sUReJ+gL3/0ippyr3kF+FSyPJAFn1lqvLT29xVzH2YeBCaPVvUcgkg9smD+zKODCZUR3wd+8Ykb6TVTY79DC1lsO4igahzCoaUhv4WHTy5m0cVXdaorAMPJqnqoobsOc1s7KJu096p91F5+STcnTXL5xHGKDqFlU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003)(56012099006)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?68oS9CsGeWIYsuw/bS5HyTpB0zSArQKCzN2oTG2cSXSS+sIr2th5BOxiE/EH?=
 =?us-ascii?Q?jivMi4nF0PIhi1lVD2rgVyJlUN+xPo6vzDpuNGDpyco+IFsW7B+Mixw52uT+?=
 =?us-ascii?Q?tnDEz6yA4xyJG28pQHB/e9Tq9l+SfWil09ix9gVFR4RqM+p09czRCkYJv3m9?=
 =?us-ascii?Q?K10Z3TOyPg6UO5v4h42TaT212Bx/SbIPUCKlF4oMhiX8iHqPF4zGNsdSHY/P?=
 =?us-ascii?Q?KTcGJ5glwKogYka0qCqCX5OlCRM06ssQYdRrDUKjFvAcQ1Z9PNaSE0I1PC4q?=
 =?us-ascii?Q?yvMrSEbzjH5Ka4GwOour4tEoiJefLsZb1VqashkyVqwFYret6GKmknTK0gkR?=
 =?us-ascii?Q?8lNWYv77WarDO3TgrEq8ab70HaDADO5Wr2oKs06Lp5wF6K4Fd6c2XUKaOmrg?=
 =?us-ascii?Q?FMr8VOzQjtBOmzV8pUYx2r+YrZDGHe0IW7GfkL90ZkCokEAAZ4cCQqJtEj1o?=
 =?us-ascii?Q?tQ0UVFKjKe8ZE0Q5bAbt7B8QSJV/u346lwXGa2514rXgPEvJdpfLfozhCqsR?=
 =?us-ascii?Q?LKr8kMWYi8ch2U8HjRLVtA+ywBNKPJYEHdoGW04+t6J5YdUUayqvlDwj2mT7?=
 =?us-ascii?Q?5TWFsACqp8s8BojExxKUGgF2mFe6NBxAshTw1p4Yj3RemneqLH+6IrZUOoNP?=
 =?us-ascii?Q?EnxOIs2xapiLWlkELvzLS4qUtSYu3BR4MtKoHTme5YYlKMP4y1+1YKoKEGaQ?=
 =?us-ascii?Q?H/ZxYAamsG9DVkZFdZEOmRSmu4nLUiUmjoW7Qo2g5t6D/VQWtwE2/AVFg3Ec?=
 =?us-ascii?Q?0F7jUWLDQ+bqnwdrKRVEPH0higF/pRIVrj1+tceNS8Qi9M5jDxx0lEDHf/Kx?=
 =?us-ascii?Q?F7/SUSGL9NY6Ol1LwXrk0U0y1X+oik/7iVjW6q+wQEy0dmwOhbGZkHtQ+n7e?=
 =?us-ascii?Q?R0a6hE3X4N3tF496UmP4AZ0AJIhX1l4ftsT9FohB7lYRH/wwxNDBMPBX+09J?=
 =?us-ascii?Q?oHYIT20yUpD5MABLs3K6dka5hjC+AH9v6AdSGPKeX5HwTlIHar8G0R+uFMGU?=
 =?us-ascii?Q?iYdWIf0WjTGGXJOI31k7UuJdaCcYkl7D/RG3Q/yQAUizM/FC5fXRKM1wJp81?=
 =?us-ascii?Q?cJjHFpN/A1gZOnIRCHv+pFCi8i36EwYl4wKo/iitgYbClj3zj43gEPgSAgdk?=
 =?us-ascii?Q?trUwpOkSRwKnYe9BkaUg17iymPmroW4CP1ueQ+9DF5CSKcRm5PGz4iGiCNqE?=
 =?us-ascii?Q?Tj849+rcSer/TucuWigs8TsPoJy/BgGM3LjC/fspVPcWWEUXnkEMLDZFPxlU?=
 =?us-ascii?Q?rQecLgTLMJJLrnyxUVD8C99qSooVKFh4ImdZlNaEcf3GifZvIWFUzhJfxEj0?=
 =?us-ascii?Q?+a3HyR7nX7lBSvU9o/ZzZ0+0d8q1R5I2q0tAF+p598YNlwkHn9rPVJWUUAbe?=
 =?us-ascii?Q?PK888hFOSwbGt2PitgYkkSyfAwqujJ6icPA4NqIwAhHLXt960ul5Pu6Dcpnk?=
 =?us-ascii?Q?Aczm/9vq+UoDAwKndgEuIJqodBtyT6fTqjMkVqNJlfC0xP+UUlamk2Ng1iUo?=
 =?us-ascii?Q?GzkCU4rb6us3GL0DoeMcOtet3UGzCu+Irqerm+nP58v3+/szOcA3s9VQLvpn?=
 =?us-ascii?Q?Pal/VBpQft7r4adT+Vop8MGnBdn/ntLUTQO4vuHPDMZiHXkMaZUe1n+fKDiu?=
 =?us-ascii?Q?uC0+96Gmm6LUhKPJddFiAmIdq8caBGzjBc2os9K7QilOWuNuAMWfxYglHCva?=
 =?us-ascii?Q?4BTN9LSJJUjr0UWbbJvt+e4Yjd2CqYtCnZNoKuDOugZwE+z6jj7347gP6Ozo?=
 =?us-ascii?Q?VX9wnOU9rQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d89cca2-5a61-4f3c-7c24-08df4d1df883
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2026 07:05:23.1856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RP2oTczhxEhVTQB2lppzAK15Wenqpn1ctLhizt4vCHcSJdfiWMsh2ZoJAgwxS0SPhz0inzojXIy06G2Fslev0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR12MB626935

On Thu, Oct 22, 2026 at 11:53:51AM +0800, Tze Yee Ng wrote:
> __put_mtd_device() calls module_put() on the MTD owner and then calls
> ->_put_device(). If ->_put_device() frees the object that embeds the
> mtd_info, it is still running code from the owner module after the
> module reference is gone, so the module can be unloaded underneath it.

I hit the same window independently, with an out-of-tree MTD driver
whose ->_put_device() frees its state at the last put: a process holds
/dev/mtdN, the parent device is removed, rmmod is retried, the file is
closed. With msleep(200) after module_put() the close oopsed in the
freed module text in 6 of 6 tries, in 0 of 200 without the delay. With
this patch and the same delay after ->_put_device(), 25 of 25 delayed
and 200 of 200 plain tries ran clean (x86_64 QEMU, v7.3-rc6 plus
unrelated patches, KASAN, lockdep). In tree, mtd_intel_dg has the same
shape.

The order comes from 79c4a5625021, which stable took as a dependency:

Fixes: 79c4a5625021 ("mtd: call external _get and _put in right order")
Cc: stable@vger.kernel.org

Tested-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

Adding the MTD maintainers and the author of 79c4a5625021.
