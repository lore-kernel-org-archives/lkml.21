Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795343458;
	b=LA3biiQ/1mBQSCxxwEBKUgKQaaS1g67ZlZ8O+EfcPgC6HziOloUXpdNPhXeif9RgrKnn
	 B1gvej45fuloEL7p/ZO76bqdNmFLTo45wkOa4iUp7+1IkVLk+sysLvi1rHAAA2SsQVVAh
	 +FYvWj7XS+KcdKxgsiqDsjWj2MKbL+m4ITaUlsgB+W8L8spXO7vjd0C8PYuoH7Yab9rXf
	 WEd76qBVHdRTKB6mMOrdwI/+rmJD/yNbcgLERVJwmW/kR5Pp7wiv8oaLpfzaFsm/5/8/s
	 t2cDYmT+7IsTYslw7cc1NTl6y38QQcCNsvvJuQJim/RDY2TWxtksEZD01q75k18bB2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343458;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:
	 Message-ID:To:Cc:In-Reply-To:References:Date:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
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
	bh=BA03dXwcACks+Vff8MzOsc4lFWIVLFH3EJ3qUX/RByo=;
	b=T+N8T/NvIU3gdiZTu8PcSICsSLTmzRQVjBmrxNfd1cTwmur7S9uuCAaaTz05GzBZ4mv9
	 ugXoqm6yduMx3odOAAZ3BggP49O9LfT3CdLsECqH3uys/sHFgsT+/3ltzPT9ui86CZqxv
	 09yQJPNEg5xLiOduQSErMldFTrK0jsV5/G7tReq516+wGlWxNXfJmW+fYwKY74TQuAWam
	 uoQQUwMPWx0zVp2aPDEGZk+zdwDeUVeVBr/gK6ajhtY/NEtmCmQY63oWP6Rae1SPQHFBz
	 VuvGGYYaji+N+HAYiSdpW1JdDnkAYAbsOnOQT96Qp1ts1DOashhLuH1cVil+y3mrzyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=g2Rr13gj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.34
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn19011034.outbound.protection.outlook.com [52.103.43.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5867606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5867606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=g2Rr13gj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4HfORoSUA6NvR/Ols4m6U6atwfHxi81Xas/NDoScIlgPIS7csYvMzOcIt8V1uUSmv+3bDa/94FXXJwoNk1Ufh3PaucvlZGQH/bz2Tlsqmc9vbUC70+1iBE1BXt/UUUYF/7NDXHZXfNmMdLCFSUXnLA4YDq+Ft3VgiVRCbOKzP7YDivrI/ttZRdvLV6F9tJmdzD6pABxYkDR/nambIH41x+1hm/IZZLS5dYVmWbqgFU2UPJRhFUPedVM3R5ri7c3ybUo/y5wlMPknoPB1nS3+icWl2A2xuaf/4jiiEjLIHHJpJuvCJsX7CvS4fTtNJ5kX+5LXWbRIo1pGL1adKOeOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BA03dXwcACks+Vff8MzOsc4lFWIVLFH3EJ3qUX/RByo=;
 b=dlHPAHy+DFXFLP26py1Em8+wTau7MmzBQe7Q88o5YLbnKZVhVg8oLs30RERpdDfXDWjmdq1jbm+bOfdLUFfIIj1hw7EYs5yh4vV5GMKRydNy5cgLSyTifVOUQEqtDdOTfzJCs5uFQn0lwn2sX3cJIC9pbrnxTV3mqPzwBQpt56haLAi9ZxvseT6UE1WIlZrOXBjeEm4juHWmMFkMnWxIwIrNHcBQWI3v5TSbZso5vMMPMo1UD6KG7FsOJyqiTHPqJVgzysiq2bsai0Lo0Vg9hPBXsEcZBDG31EnwjUxKecggZXa8OHVSfNzmocWKtZBCwkqhauop4m1391wIfyjh9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BA03dXwcACks+Vff8MzOsc4lFWIVLFH3EJ3qUX/RByo=;
 b=g2Rr13gj3IzehYwb/IM1f40tUCYAlprLUFSYsKNgGLT4fRpmxBd5ALJzMafT1H7gefcGTrlW6+oRj3SuzA65RKV7c1Zs3TIhFNbNiRF2qjIskzjbFVjLRfEVEepnpWfIMf9BBaeEPSOmQ7Scyqq1mz3SjgXJSfwjBUHre0mp1RbyKKVH3zaVv8Yx9RypoqAWSwG9NFRSb6lDQikkiJMNfzugNKW9feEpElGmbpaQfTAVF4ddUATzyFTIuqjjy18xeIrKqja161OpZK+NOBERqitxO4JcnkTXjvrDHkA54Q2IUiK2AhXm6NrxucwKAqKvu201F6fZUSdyQlYlFZQ4dA==
Received: from OS3PR01MB10251.jpnprd01.prod.outlook.com (2603:1096:604:1e1::9)
 by TY3PR01MB10336.jpnprd01.prod.outlook.com (2603:1096:400:250::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Sun, 22 Nov
 2026 10:30:54 +0000
Received: from OS3PR01MB10251.jpnprd01.prod.outlook.com
 ([fe80::7edc:2a40:7b8f:56f9]) by OS3PR01MB10251.jpnprd01.prod.outlook.com
 ([fe80::7edc:2a40:7b8f:56f9%4]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 10:30:54 +0000
From: "Jiaming Fan" <fan.jiaming@hotmail.com>
Subject: =?us-ascii?Q?[RFC_PATCH_2/2]_x86/apic:_Honor_noapictimer_on_SMP?=
	=?us-ascii?Q?_with_the_TSC_deadline_timer?=
Message-ID:
 <OS3PR01MB102516718F4CCEC2E3F43AF94E7462@OS3PR01MB10251.jpnprd01.prod.outlook.com>
To: "Thomas Gleixner" <tglx@kernel.org>, 
	"Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, 
	"Dave Hansen" <dave.hansen@linux.intel.com>
Cc: <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	<linux-kernel@vger.kernel.org>
In-Reply-To: <OS3PR01MB10251F5C8A7346BFEE8448F14E7462@OS3PR01MB10251.jpnprd01.prod.outlook.com>
References: <OS3PR01MB10251F5C8A7346BFEE8448F14E7462@OS3PR01MB10251.jpnprd01.prod.outlook.com>
Date: Sun, 22 Nov 2026 10:30:50 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: TP0P295CA0042.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::10) To OS3PR01MB10251.jpnprd01.prod.outlook.com
 (2603:1096:604:1e1::9)
X-Microsoft-Original-Message-ID:
 <a800738d-354e-4079-9ac9-8f33970becaa@milk.local>
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
X-MS-TrafficTypeDiagnostic: OS3PR01MB10251:EE_|TY3PR01MB10336:EE_
X-MS-Office365-Filtering-Correlation-Id: 76167f02-4ecb-421b-0b1d-08df4883afdb
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|55001999006|12121999013|25010399006|51005399006|6090799003|23021999003|41001999006|15080799012|8060799015|19110799012|5072599009|25031999004|24121999003|22091999003|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1JCbEFoMkp4QWlsZ0E2MnlmbW4yQUowTS9iZFFYK0dQeEZwNCs0WTdWVGN3?=
 =?utf-8?B?TDYrMUVtZUhhd1pTNForc2J5S0x6eVdGZGpOYjVPRDBlN2p5ZFNVOEFuVzlW?=
 =?utf-8?B?NkkraTZxbHdXdmIxK2toazZsem4yNzV5N1R5RTdLR2FyVVJuN21aekg4OWpX?=
 =?utf-8?B?a0Z2SG9jVVljT3RjUTBrUmpPMDU5OS9XTTl2cC96RWIrK1EwWVZBNHF5ZzYv?=
 =?utf-8?B?QjZaSXp3SC9mRnMzQ1RRSnpxYml4ZzJOTWt0TnhNZFZBUExoK2tZZmNZUitz?=
 =?utf-8?B?TkpyVWZsT0I4RHZndDdublFaeVZwV2hvVmg0bUo0emtyK05oaE9seHVKSzN1?=
 =?utf-8?B?Yjd6b3J4VlZrQ242SDJrUVcydW1JRDdlV1EvK3FuSkhvS0F4d2p4cnZCK203?=
 =?utf-8?B?S1ZnakJQQW1QNVNCbFBqN3JsSGQ1NHptT2hjM3cyOUt0cEllRG9pNEI2Q3Bp?=
 =?utf-8?B?VGMxeUExVHNJdlhBVHpEL2ZsU0srRmM3c0ZSWHozUFFXT2NScHJHRFJ5STMw?=
 =?utf-8?B?N0RFNHFLN2dFZXhJYVpsZ0NHSEdYbkV5bUFmbGtIc25JVWNUT3I3dy9zZU1z?=
 =?utf-8?B?WGozdjBqNHZIMnZ0U2NTczJUc1QvM2dUUUQ4SEZ0VzY1UG9lV3YwNGNKNk12?=
 =?utf-8?B?blR2aWFmOWRISjR2RVNWT3RLVlVyK3l6L1hkbGZoZ0pKWHRhSTZ6NDdUWkow?=
 =?utf-8?B?Kzd2TkQ2V0UzWHBieXQ5V25ES1lqTU1CWWh4NEtPTXNGT05kRTBaNFQycWxB?=
 =?utf-8?B?Z0orQWF6WHFWamFMcjhmMlhNNFJrZ3kvNDBzZ2VjMHFac1JwQnVsS3ZFVFBV?=
 =?utf-8?B?YjRNOEIvVTVJVENXNFRWQzN5YXhFMXRhbzhiQzhHYmxKU0d3bmo2Q3ZzR01h?=
 =?utf-8?B?TlU5SkQzNlYwZXkyZlk4M0hRR21KTlErTVE2NUl5ZVVRcWNCWlZKMCtqL2NM?=
 =?utf-8?B?Y25PajBRQzRSdGR1T3gzMGwxM1FOL05objdWTFVZS2g5VEkvclFqdUF6b0tp?=
 =?utf-8?B?WjI4MzZhQzU0Y0NsZEhBalA0cmV5b3U5RFJLdHZUNmNqeTBkb0hvUzBNekg0?=
 =?utf-8?B?WHZXN2h3Tkk4Nkd5R1pBemZJb2U3RFY5ZDFodEllN2ZlbEtkVnEzR3lDVFB6?=
 =?utf-8?B?ejI2RklIZGlqQnVkdXR1MEZtUTNaNkk0VmZsMVFlYzBSc09xWHhjRjFSTVdu?=
 =?utf-8?B?SlRoaXpyTnVhWkNKejlFSnJVajBPTkhETTZKK3l5UHBORE90L0xqVkRmVUJa?=
 =?utf-8?B?OHNZdFVmcUM2NmtrWDB6aDI1QWRTaWN1a0FVR2tuZnBpRDVqc3ZCamtMT1Uv?=
 =?utf-8?B?aHJoSUpsMlAyMFZ1c3Y0ajhWclFZRGMyTXJ6M3FlZCs3MS9hTUo4OG8vOEFR?=
 =?utf-8?B?b3RZeStwbU9aamlRQnlqU3N4MlBDTGd6YldOaXBSWVdEV2V3MC82RFJnTjdN?=
 =?utf-8?B?QmR4ZXVVNUF3a0RpeG1LVTZtWmVpbHNlZWJacnU0OWdWSGtvbHZwNTFzSGcv?=
 =?utf-8?B?QkMvRk9qczRwcTMrL0JPMDBCYzBNY3pnN253RDJrclpsREFKNmRxL3hmYVB2?=
 =?utf-8?Q?Wa8Ewb/0Mx7mOtwg7cxePiNk8=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHlTVmNCY1hBcElwM05wTmFxWlQ2SzBYeXRKd0p6Z2NpV0RiSDdQMGo4Q3U5?=
 =?utf-8?B?UlNtRE5FOXRzZWZ5aDJROXljMXVTRUFkc282YXlmMTVCd2JybWdBb3c4bmR6?=
 =?utf-8?B?cjBDTjcxNUlaUmJncTRJUlNDZWxBRUZwYUcrQUx2R0RSQkRRMUhadkNSdGNG?=
 =?utf-8?B?UTVjQTJ1QzlSRGpFOC8xNy9VZWM2azBlZStSQ1IyNjVsQVpyN2lxa2gyNU5j?=
 =?utf-8?B?elZkeE5UOVRPd1F2QlZpN1ExcmROVlRTbDFaNmYyRG1pTWl0L0RUTXVBajhz?=
 =?utf-8?B?WU5ERHU5VTROM0pTS2ljSVpHZzlxQ0NJTkZDTllSZjBqWjJwWDlXYW5vYVRs?=
 =?utf-8?B?a1dzZXRmVmFJSVRIWTNOY0pEbFpPalZTanJQWENQUWlzdk5PbXRnUkxwWkNv?=
 =?utf-8?B?R1VVSkh4K3owZTNITmtmdkRhNnFFdTljR25BUWlSTk00Q0FFOG1lcVlpbWhV?=
 =?utf-8?B?YUt3ek1GbklPb25ZOU1LQklPMHdodXFRRWZJditGMXNpR28zaWtQSTcyMjBR?=
 =?utf-8?B?NVI2b0ZZNE1XZ3NxWHQ2THgwdHExRm9JcXZ1eWNDd2ZxRUtCbWZFc0k5bDRM?=
 =?utf-8?B?NThydjU4ajlhMVhuUnFVbVVyLzFLYU5kd3E3RzRLL0d2NHM1SzcvQjZjVC9s?=
 =?utf-8?B?VzBxcktoRG9NNTJGZGh2NHlGeG5FN013WGJETUIwbld3RGpJMy9KempFRHVu?=
 =?utf-8?B?UlJzUVBCUGNJQkNTV0hRUXBQeHQ1cEtxcE9Fd1JLdytDVmk3Y2JRTkczQjNl?=
 =?utf-8?B?MEZkT2JvdGgvRXplY1V1VDhXSnJEOEY5ZGtVaSs0OHFodWcwOW5HeTcvcWFF?=
 =?utf-8?B?a0wvUHFwME9leDZmd0xWTis3NFg2MmFPV1dyc0VFZGdvTUVCZURvQk1mN2lq?=
 =?utf-8?B?Z1BYd3FKTE54cXRhb0NHejBEUlFQTjByamxyVU1ibkxJenZqK0l2TnhVY2Ji?=
 =?utf-8?B?ZnJMRVNxQlBTOE5SNlVLeU4vTytrbEo5UXdva3llZVR1L1FwRTZDZXUrMHlQ?=
 =?utf-8?B?dENabXZZa2FGS1VmT1E1d0UrOXZYNnB3YzBWVmdlZkptNDQwckxxbCtRM0Iz?=
 =?utf-8?B?R3dTbG10SXFnWlhxRnJaTXNEWUFKQ0NHcXpnT0VmZlBWQmcrZVc2T0tneTZX?=
 =?utf-8?B?ckM2eVJxd285S2lFT3RlbWhvZyttQXd0SVdZRzVwWlZhN1p2WGw4UDc5L1JT?=
 =?utf-8?B?R2J6NjBpTDA2Y0F5c2J2MGdtdHIxb1JBU2oyWXphd3pHblVnQkcwckVmeExs?=
 =?utf-8?B?VW5HT3JENS92ejU1T2grWVpTUUlmUGpNTTVwVXovTWdDb3dGWUhLSThVNWlN?=
 =?utf-8?B?VHpVWG53VnRTTXdLRVYyc295WC9JY3FMajYwUFg3eHpzaUNrSngzRkc4THk4?=
 =?utf-8?B?STM0V24zNnQ1aDFYcHlUclJEQkRPOXZTa3hseEJFZTlwYTBIRnZERW4vVmJH?=
 =?utf-8?B?T1hhVk5qU1R4anZ6cEsvNzZoQnlOUDZka00yWXB1L0MvQ0VMdVNMeDUxNkpz?=
 =?utf-8?B?TUMwZFV2K1owNno0L1FXVG9adkdyQW9lanJ5M04zb3lOWUlWYXEvQ3lIaThm?=
 =?utf-8?B?L0hHdG1acDFhVTNMdWJEN01uc0htTWxaemNXLzZ3ZFhtNURyM3VLeXplV3p2?=
 =?utf-8?B?M0NyY1pwTjFwSThJU2FEOHFwamFSK3FXSmNGWUMvWUUxRTA0R1lUVjM0bUwz?=
 =?utf-8?B?UllaaUpkVGRNanpWZ3U1UGhXUjBJbVVWQjNSb3lDQXZXR0RQMWc1eFBkckpK?=
 =?utf-8?B?T0tpQjdkU09nVFVrRTdJZjNYTnV2c1lEeHJZZ1JHMFRaYnoreHptNzMycjg5?=
 =?utf-8?B?OG1NTUs0MC9odXp2c0xiZVp2MmZZTlBHTlZqTTVnME9QaFp1eUlzVFJSTzZi?=
 =?utf-8?B?UUdHSy9lWmpNd05obzBrZWwvazc1ZXRyV09uemdLc1hXT0E9PQ==?=
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 76167f02-4ecb-421b-0b1d-08df4883afdb
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB10251.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 10:30:53.9825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10336

On SMP with "noapictimer", setup_boot_APIC_clock() leaves
CLOCK_EVT_FEAT_DUMMY set so that the local APIC clockevents become dummy
devices driven by the broadcast device. But the TSC deadline branch of
setup_APIC_timer() clears that flag unconditionally, so the option has no
effect on TSC deadline CPUs.

When the local APIC timer is in use and the boot CPU has the TSC deadline
timer, setup_boot_APIC_clock() has already cleared the flag, so clearing
it again there is redundant. Stop doing that, and ask for the PIT on SMP
too so that it can provide the broadcast tick when available.

This changes behaviour for SMP systems booted with "noapictimer": with a
working HPET or PIT the tick moves there, but without one a boot that
works today panics in check_timer() or hangs. Is that acceptable, or
should the option keep being ignored here?

Fixes: 279f1461432c ("x86: apic: Use tsc deadline for oneshot when availabl=
e")
Signed-off-by: Jiaming Fan <fan.jiaming@hotmail.com>
---
 arch/x86/kernel/apic/apic.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 6b2e61ae7e240..b25353fe88892 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -592,7 +592,7 @@ static void setup_APIC_timer(void)
=20
 	if (this_cpu_has(X86_FEATURE_TSC_DEADLINE_TIMER)) {
 		levt->name =3D "lapic-deadline";
-		levt->features &=3D ~(CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_DUMMY);
+		levt->features &=3D ~CLOCK_EVT_FEAT_PERIODIC;
 		levt->features |=3D CLOCK_EVT_FEAT_CLOCKSOURCE_COUPLED;
 		levt->cs_id =3D CSID_X86_TSC;
 		levt->set_next_event =3D lapic_next_deadline;
@@ -782,16 +782,14 @@ bool __init apic_needs_pit(void)
 	if (!boot_cpu_has(X86_FEATURE_ARAT))
 		return true;
=20
-	if (disable_apic_timer && num_possible_cpus() =3D=3D 1)
+	/* APIC timer disabled? */
+	if (disable_apic_timer)
 		return true;
=20
 	/* Deadline timer is based on TSC so no further PIT action required */
 	if (boot_cpu_has(X86_FEATURE_TSC_DEADLINE_TIMER))
 		return false;
=20
-	/* APIC timer disabled? */
-	if (disable_apic_timer)
-		return true;
 	/*
 	 * The APIC timer frequency is known already, no PIT calibration
 	 * required. If unknown, let the PIT be initialized.
--=20
2.56.1


