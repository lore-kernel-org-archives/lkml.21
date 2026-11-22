Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795343380;
	b=gISHz6+4JNYHfbDGG1l9pDShZVn72M/DqelUnMuqLuPOyz9fek1sWpfM0kmTkBbMGg14
	 aP/4qtKxZP7a7tZDMnuSi8ZSR44csY5m1AZLGK6c55Zhl9zveUJZYjmoB4qhrjwb8lTLY
	 gcLWoQwDh3pOLVoj0DV4vYZ8o0/JcgduU26CkhYXSjJmdYC0DUqmo2+efaqSM6dz6hIbp
	 NpHcs2so+cV/Q87D0XjM46QR1azLnAluL87HNNYT6wHRN6U02lIFGLGNZkwVdTm/+/AOp
	 wk9NUFE1yV+DiHYpYFn20VCqqr/MDB2rz+Z2kRR53W+pPtJxOULVG9zrNccrBgRIC8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343380;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:
	 Message-ID:To:Cc:Date:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=qvTutHzRPsYLetpcOoW3UcauPiQSie4rqh/U2DJuZRs=;
	b=zJ8MPzWCFdlLuo/TgLo6KWw6GAP4qsTol76LJX9YzbV9c1i2Mc6t+fqZU9WB/XWoGNiA
	 ORFiePde7ozjcUU9iJfYrUHRErVvO6Iwp4EMY6bJo91aC++dDBrVYpzEerdQbp5vZ9H4u
	 tcoelOwhxdiHTJhbqaLA71wst2NwTqORhdEMBP0nDsnv/fP3vSizbndtyQWRJNrISiYoi
	 CyJ7K9QlXUp+cfb6RLP6WabSr4b7xWy5vvPz4M9gkzAN+xQhOA3D2WhgsiGeq3E6wZ6Dp
	 XnjMdcaCC3xVsHbazGA44Q4wpWQlX2CV7AsEBsujaxo8Dpsmspuabj2Bld59HHK593Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=BNl5n6FX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.2
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazolkn19010002.outbound.protection.outlook.com [52.103.66.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22451606A332
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22451606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=BNl5n6FX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LidagiK4bQydZpYoShdhpfhfEaTdA3VNhQXDjAXDWm+4bYzzvNYUnm3GWO7m472jEsPou1CZ2O+cVJ3LiBIW08cjCN3R8jB528h39MpOHaTJRiambGOzzXhesHGHwfoBxjQMzHYqX2P7WDqueBw+2xHw69nZv6TGBk2BxKf2zMoSC3R0tp6HDE/GZlhSrtDR5ZZTkuGUO23RH94zHhJufwC0hyuL2KtxUIqeUZQ7UaAKOkvKgKIlApIoP32aBGEpgVLEA++VyO88G2gwoD11wgMo7CKh3IJYKDOox7FPDk+mhaC2RORVhn06ScOF342s1oD0YlA5g7OcMemPTG54bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvTutHzRPsYLetpcOoW3UcauPiQSie4rqh/U2DJuZRs=;
 b=H7KcGhE5VnJDPDRKxmQT0YgojuKy00mmpT8vIGuznN4I4Xm94Ld2j8l+4WXpB0YCgnKxqMZYwFFKSzMMKNRB4rnHGFVFfg6bdV65sw2/wpKDYKZOgKcl+0lUA9IZfbP4skDM/ZrdWFFtGzfDA9NSTK0m8SQ5dbr3ymFq+pg6lrEO8yecKXKswmMzSSy7oCf8lj7dDaulLamFL4zp0VSgu5loiZmS86eU3p4xpTT+a6zcPel5wZU0ZBjXDR4oAlTuxaBBYEk7IdhOhD+jAM3PKV7fJssaSIVrN1nnf5JaYQJaFcrWisiDhf14W6bIoT5lddjOtdf++tqZsE+9OUrlRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvTutHzRPsYLetpcOoW3UcauPiQSie4rqh/U2DJuZRs=;
 b=BNl5n6FXEkcbM1Jk9W9+YrfGhJhr6R6JkeUoi9YwlpFOSHu0Z6STaTEwIs7YrIO0rP3NzQJtyACfP6GGQXM7//LhmgpDpF+ajzJfek15OMx23/O6Hsl11tGea34LfT3U8q5SfI5UBD+8xkFHCibCj5kLi+yvqlsbysdLN+xcN9ZDpylv4ZfKUr5QoZesTzlcs0AfwUTBSIhhy/9P30VINWrEsG0Lblt8JkPzYahGCK0kz54UOhTG4Vc8WuiapKWsZ3pNvpx140QdsBLxQ+Z626tR701D4UVRvgEL358BdtU7TiN1jo5l7jMskNxTVN/bGUgGcL8nfzSwlm0a/ggv9w==
Received: from OS3PR01MB10251.jpnprd01.prod.outlook.com (2603:1096:604:1e1::9)
 by OSOPR01MB12249.jpnprd01.prod.outlook.com (2603:1096:604:2d9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 10:29:35 +0000
Received: from OS3PR01MB10251.jpnprd01.prod.outlook.com
 ([fe80::7edc:2a40:7b8f:56f9]) by OS3PR01MB10251.jpnprd01.prod.outlook.com
 ([fe80::7edc:2a40:7b8f:56f9%4]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 10:29:35 +0000
From: "Jiaming Fan" <fan.jiaming@hotmail.com>
Subject: [PATCH 0/2] x86/apic: Make noapictimer work with the TSC deadline timer
Message-ID:
 <OS3PR01MB10251F5C8A7346BFEE8448F14E7462@OS3PR01MB10251.jpnprd01.prod.outlook.com>
To: "Thomas Gleixner" <tglx@kernel.org>, 
	"Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, 
	"Dave Hansen" <dave.hansen@linux.intel.com>
Cc: <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	<linux-kernel@vger.kernel.org>
Date: Sun, 22 Nov 2026 10:29:22 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SEWP216CA0097.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::6) To OS3PR01MB10251.jpnprd01.prod.outlook.com
 (2603:1096:604:1e1::9)
X-Microsoft-Original-Message-ID:
 <a670e79a-8610-4a16-9302-d0f496b168fd@milk.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB10251:EE_|OSOPR01MB12249:EE_
X-MS-Office365-Filtering-Correlation-Id: 302af965-a853-4035-5d9e-08df48838148
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|55001999006|24021099003|25010399006|51005399006|23021999003|6090799003|15080799012|19110799012|8060799015|5072599009|25031999004|24121999003|22091999003|12091999003|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTZmOU0wbzRtbXV5bDVDNytRSjA1T2xTQzY0Vm9NcHJIVHlyaHVxNVF2QVYz?=
 =?utf-8?B?S1VOa3RBd1VkV0Y3OVVHekliMGJyYlBEbHR6emZaTjNTYUMreDVCOFdYbStU?=
 =?utf-8?B?djhSMENObFZtUUNRMGliYnliTXByWWo0a1BKc1VITU9aVDVzWmN2b1pZSFVO?=
 =?utf-8?B?eTZyOVRzamRaeG80eURCT2JXei9zOUhBUU9LYTByeDU1RnhiWjVObjZESTVq?=
 =?utf-8?B?Wm5vUTNmVmVwVkJYcE5BS1VoZXlnbG9mL2NsOSs4RlJuRkZFdlMwaDFobVFa?=
 =?utf-8?B?cFlWZkJNTUNlNHBTeTVOQ3l3TFhhZHNUdUgwS1BSaHFmeDYrZnVkTmtCVmRr?=
 =?utf-8?B?RWlvNGZ3NWF4R1R5OXRjM29WMUI3ZzFuVExpWGxhYXgzeFMweG4veExtVXpx?=
 =?utf-8?B?MXM0QnpiWDJXQlZ0RHRhYUFNTk83L3k4Ulh6K2RRcEp3ekFwZmtqa3pibmZG?=
 =?utf-8?B?SW8yY3ZaYWJZRUtlVlBsbXh3cFpLaEFJUjdkTWhyUlc5NE1BRVVTSEgvSm9a?=
 =?utf-8?B?QXFCVUFERnNqdzg1dzB0WkFhbHdFSzFSMUxFSVd2U3BmbU5lU3Ixd0V1TXB0?=
 =?utf-8?B?QmhnOG5xbjk3R3IwK25XUUJjWWVXaldQSElPUDNhUHRIUVZHQXlPcWNJMlBk?=
 =?utf-8?B?dmYxUERqZlNwTFpZMHVidkZ2RHdEdm9nUkhPVEkyYlZaY2tRaTNZZHB6MmZa?=
 =?utf-8?B?TnBJdldyTVJDSGM0bkZRMzg0TjBCRE5Ma3VjVzBRWG9LbmVienpoaWovbVk2?=
 =?utf-8?B?dkUvQWloOFBydTdVMTYrTmtBWkdrYnN2ZU1Qei9ZaEIxWTc4NTVBOFFMclQr?=
 =?utf-8?B?QUFaNTJvVlVDRk9wcHVKc2RaWU5xS00rbGdTd2FDejlIMis3WUFzVXdxRzg0?=
 =?utf-8?B?SXZ6ZldPRGo3TGxiV3c2a20rR2VOTWRjMGFTMmF6Z0ltRENYZkdjV1Q3SE5F?=
 =?utf-8?B?Z3ZTeXJHUGkySDhTK09DUld4WVlXM0s2TmxVazZ6R2l4RmFMZWRQOUsrUVFn?=
 =?utf-8?B?S3lDZHZQU1NNc0MySVl0eWJEVTBYRi9vaFNKblkvT2phTWorNENTTklwTHRz?=
 =?utf-8?B?aEluUEJ1Um5HK0RmZlZMV2ZLOVRxTWdEUVRVczNmY2pBMDdUS0JuVzEwOVNM?=
 =?utf-8?B?U3F5RFRDWkE4MkppcFNzTVV3L2JhM0pVY3h5ejVIVkdQazloek1jUnFqSGdu?=
 =?utf-8?B?eXpIOVUyKzBSUHkrQWpWUVZWY21EMGNwNUNPL0ZDSFYxRWNNVVUyUFFXdHly?=
 =?utf-8?B?c2M3QUQ3VE5oNTUrTTJqUzlBNTNSTGRaYkxXU3g3bktURTFxSkc4NzB0d2lH?=
 =?utf-8?B?RFRZbUtCWi9XVW1LVEJpVzdPbkpLdHRteEkxcWgwWjJNeVdsRXlNN0hKazIr?=
 =?utf-8?B?MEt1QXIvRHF0QUZQbHBNRjh6Z1pSY01kVUtDc2tOVG8yYlJGOG5tTU1QajAv?=
 =?utf-8?B?dDBZdE0zdEMyMG9FZVAvdFBpaUM2UVcvdnBXck5CUUU2bGxMaFF3cFRVYks1?=
 =?utf-8?Q?POKMujbX34uNj1kGdwleTkRlLSw?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWFUSEx6dS9pbmtGMnJRQW1SNTlDYXgvdU56c1VYWjFUYllRQ2ltcWs5VHJv?=
 =?utf-8?B?RmcxQ011dk1xRWlHQXBMRURMcUNTMnJ1emxaNEg4QzFFcEN1MHloR2lNVlR3?=
 =?utf-8?B?MHdCenFjb2dyYUJJQXhLZDJRL0MwU1RzZytFWSs5V2VCektYVmU1ZzdoUll1?=
 =?utf-8?B?Vjh5TGsvVC9XcThaNVV1OGg3dmo0Vi93bzhpK2xueFd5N3J3bWJrOXVQWko5?=
 =?utf-8?B?Ym9zVnFiSXhNN3JrTWY2VllwRUVSajErVWxVbXRLVTN1QnpPN0pIY0VxMVc5?=
 =?utf-8?B?VGJSU3lnL2VHUnlIYmxwanFocndmU0ZjU2hvdXNrV3ZaeDhNTXRJdFBybVYz?=
 =?utf-8?B?N3VOQnYvYXlncWhLQlZSb2FVUUtlbzY5U0d3clZzVnp1dFdUWHNTM2JoaUZB?=
 =?utf-8?B?ekp1a1lEa3NENi9oQ3dBWUVnZEZPNEk5SVlhREVOVTJtSUpRNGpzYnUwV3JC?=
 =?utf-8?B?S2NQUVM4R0lYRWt0ZDZ5dDFJYjNvVmlCWkwza3FiZEtHNUtLZkdxd0JpWlZ3?=
 =?utf-8?B?azNTL1hYRWlHR3cwcnp3Rk03WjBiV2xobEM4bTlQbGcwTDhiTG1MKzVRMXZp?=
 =?utf-8?B?c3MxNVZVc2R2R0RBbkpxbHMvOE0xUVFvNHZSWTFPeE04ODgxVzZRRG9HRHZ0?=
 =?utf-8?B?ZFU3TG1kaXcwWkFHenhNblgwYndnOExJcm1OZXhpLzcyL3laUmZmZmNzbjRT?=
 =?utf-8?B?OEtJckdhMU04SGR4UnZDNHYvS0Z3MFRMVUFsTkJFUWliSEpRcUNiWU45WWhi?=
 =?utf-8?B?WVBwSFdFUTd1eThMQkQzV0hObmFoSVhDSkZQMVRydkc0bzEydGExNnVvQXMz?=
 =?utf-8?B?a2drQUV1bUQ3cDVwQjk0ek9JL3VJNlpmb2IvWTFrYXUvTHNPNGFyNmxrNEMy?=
 =?utf-8?B?aFY1KzVONlNreW9rR2NvQzF1aDdjQkw4NTdoV0J4K0l2ZWdxNmRPellGTTJo?=
 =?utf-8?B?d1FZbUp4SUF2YnA4Rnprc1pmTUhYcUpVSFE3NmRnZ05iM080Zno0WXgrd3ln?=
 =?utf-8?B?QmJMb2FBYllPbnBOa054L1ZxMHZ6d2dJSTJmSkFSVUJlR0hHRzBSUVpQcjM2?=
 =?utf-8?B?cGxyZ1VLaHVBdmI2aVI1UkQyZGlGVlZ1RVU0aW1ITGFTNHVaS0p5M0dZdTZT?=
 =?utf-8?B?enZBdUc0ZU03TnJTckE5bC9ub1A5YnZ3TXhDN0plVVJCczFTMG9XM3g1YTFK?=
 =?utf-8?B?MlNORE9ZbnJuSWdjVG1GT1FKQ3l3TFhCNDVSZjZuSUp6cjhuZHBxRFdxUVVX?=
 =?utf-8?B?d2luZ0s1Z1d3YTBDRDFZSHVsL2pydUVMVkVpalNFdEl3c0IvYng5eVZCRmVi?=
 =?utf-8?B?OENqdEtGdjkvUEVENTlUaDFMcFQ2SmZMVjczZW5RRS9xS0E1aW9lU0FqMzQ0?=
 =?utf-8?B?VzFQcCt3dVFEaEpGQVEvcTA2bDJpNUVTeGFTNkxJNW1EL2Zndi9hcHFTMzYw?=
 =?utf-8?B?TTRkT1M4cnFsTzhwV04yb1c4YVd6cDhvUmNaNHZPWGYrWXhmVWZJdVhsOFgx?=
 =?utf-8?B?NStiRDBpMjFwWWZpTktoRElrUGZLd0hRRHM4cDFRelQwZjZ3S0dib0t5THg5?=
 =?utf-8?B?U3ZjaUNTV29Nc0xKN0VZSllyN0puZ1RwV1dxVlkvVGd1dHdZazhWVUpqZ0Vm?=
 =?utf-8?B?eUhNZVJpTlZjdjBWQTJYck95d1N6MnNmcWVjN1htKzdrN25FZEdqQUNhWmVM?=
 =?utf-8?B?Mno2M0szckMrbWx4eWdNdFM3Rks0am92WXNOWGxybzZJVmtHMDJlZDlJdzRK?=
 =?utf-8?B?d1gwUXY3Vk15Z1VwcG16aElaaEVWL29YbzNuMXQ3S1lJVHl2bnBCaEJ0bHE1?=
 =?utf-8?B?eGRqb3JsUVJmemFyY3EwRmN4c2RwRWFSRXo4b08veDVWWS9aL1Vzd0I4V0Uz?=
 =?utf-8?Q?8X6cOQwRTogtN?=
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 302af965-a853-4035-5d9e-08df48838148
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB10251.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 10:29:35.8359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12249

I hit this while writing a small VMM as a learning project: a
single-vCPU guest booted with "noapictimer" and no HPET hangs during
boot. It reproduces with QEMU on a host with TSC deadline and ARAT:

  qemu-system-x86_64 -enable-kvm -cpu host -smp 1 -machine q35,hpet=3Doff \
      -nographic -kernel bzImage -append "console=3DttyS0 noapictimer"

Patch 1 fixes that. While testing it I noticed that with -smp 2 the
option is silently ignored on TSC deadline CPUs, which patch 2 changes.
Patch 2 is an RFC: it can make machines that boot today panic or hang
when there is no working PIT or HPET, so feel free to drop it. Patch 1
does not depend on it.

Tested with QEMU/KVM on an AMD host and with my VMM: 1 and 2 vCPUs,
with HPET, without HPET, and without HPET and PIT. Not tested on Intel
or bare metal.

Jiaming Fan (2):
  x86/timer: Don't skip PIT setup on UP when the local APIC timer is
    disabled
  x86/apic: Honor noapictimer on SMP with the TSC deadline timer

 arch/x86/kernel/apic/apic.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)


base-commit: c44104f3642da720164042623e4832836aefdd8e
--=20
2.56.1


