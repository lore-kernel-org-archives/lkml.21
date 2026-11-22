Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795343414;
	b=QV9ndhPdSZxpnuH5LZqX2IGxdM1VUvlyfldQB77OsdVsOJIZs+y6kmJhsLkBEQfNwAW9
	 A+mdmda+J8+xwT4LeK1876KMqqfs7ErcSXdL3vXbQLRCRVU9AZ1bX+zCAdbk5Gkdh67mG
	 82sSiT7yZEFMJE5iMBaLPLakkNq1ed9rCpKrUZ648jR3GeArtzkaq2bqmele8WGAWqZNK
	 0O4U8fFDPCIPNg3waFdY98Bkqni9kORqyYwzthnwqqW9f2M/TRI7fQzEACneRGOXNq0T8
	 Rxg7RdTNPniGZAlwRreS9q3NmYmt4Q8ak+pHAHG/J2jaqjO3qYy/REA1Uri2lAmercA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795343414;
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
	bh=sWzniCA/eYn2hk86d8IwUQ1EQFm8sZ2YOlPPEep8U5Y=;
	b=Otgzt/wOuUVrVmJaPKM6bQHuxBv4xDJDSlJ+Fyfy80ntZ/aKMp6yo+CwCbbqxNXxFqiB
	 db+9QON2/uwUUTdGlck6CRDMki5ApX8uu+K0+Ny+Sg8gK+HtCEyX8+TLyS8LNGcg5hxkV
	 znu2CY+Xh7PWSEJfkyYrOUJOep9lm9col0/CdUIwknlLKC1E52I8X9x3BsFf/PeJh3hZj
	 mtcsAbs6H+Im/8F0+TNrS4QwZFdf/aVsYCnWU1kKllQ+brj9+dAIQ5Xs68SCQbylSUHn9
	 YCAH4CuPu4puQn/e0dJ+oMb9NYT5aZoSbi08trK+GR2v7NfL5R3IdHUEUQ2/FwAKZWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=bXMpxVOQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.66.25
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazolkn19011025.outbound.protection.outlook.com [52.103.66.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C24606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22C24606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=bXMpxVOQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilRBZOZgol81uqXkS4ek8lnOZ9ERYg7Mluj1GDAC19+h9VgOmj/wxkIotd1pvKLaNozq24g47bg0m/7f7avQoZArUe5Lrco7Zc2DJmIgbxQprQbMWPZ1onB3+9En1Tp/cVm28S+m1qeoCiPNM0YWnmg8yI3WnCXYHf+ww8IJukJhJ8LX6SpaK6qXyhFFLafWGM46uw1VWdZNSekQIm1MkGxiC2RhIPiQ2ZvnbxWI2uBCStw6RnNf9XegxHYJIBBg+BIVrg/Tm0hUdGrm2tgKTX3iEbfwpqIfRzH1HViN7M2cD0fcw99wzWAxDqqb96xNn0habkZIyYHNwmBqkIqRNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWzniCA/eYn2hk86d8IwUQ1EQFm8sZ2YOlPPEep8U5Y=;
 b=rzCZccbbiKSHWSG0yfRi0IdGG/G+/xu2wE3huJdLLeu7AeLMt/+AKjrz8vpNHMftRAWQiwrCqdVHz1biQyQonD5TlEytVMVw+0g3UDTblrXbJ8kYKcUEfgjA/oxjnKNxzHfwqHBkrHoyeVHtcGB2L+9jzW2TVAoMHfJ73NhM5Dxs39CdByY1OLjQ+cRoxYsNiA9RBbKK3I4woR63P1iOt82vM4f/p1qapa+k5F5tyg5q0KMXaqa2IlfKVLLWbSvLNuGV5UlAAS/bxhnuPt2A7PnA3wZedaz5hftctgpEpBGTxs4FomFwAoVP4E7InqY2wbnQ5Un4rLmLSp7aqJS1wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWzniCA/eYn2hk86d8IwUQ1EQFm8sZ2YOlPPEep8U5Y=;
 b=bXMpxVOQq+4P/a14nqJTtFzKa7eXc0pmqHBnGeXRstKEJ97/VanM4vw4PTRpLWR5JrKUnzZGm8TEX9VCev3lB0Kw1JoKXro7kkUBla3TVWynv5CNv1Sw6/P977vy3UsHmrhs4dOU5lLdvFW0hlQBwBo3PE2H3Dg3k8AYzlXE2iwnXDztsx3/RpGXbJo+/avcUo3Tfv4csswL+5USvSsvqai/wq4ZNyFIUrBuB2fN3VRq1oPCEwn8CzoARG5MxFluEKX/wofkXdVI1SCWdkUHs7sA+D0pNA48ZeBDKwuGjEMsi62/8fLgqnpIikL6ViQnqKp1+e0GdjDEPpcJPFLieQ==
Received: from OS3PR01MB10251.jpnprd01.prod.outlook.com (2603:1096:604:1e1::9)
 by OSOPR01MB12249.jpnprd01.prod.outlook.com (2603:1096:604:2d9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 10:30:09 +0000
Received: from OS3PR01MB10251.jpnprd01.prod.outlook.com
 ([fe80::7edc:2a40:7b8f:56f9]) by OS3PR01MB10251.jpnprd01.prod.outlook.com
 ([fe80::7edc:2a40:7b8f:56f9%4]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 10:30:09 +0000
From: "Jiaming Fan" <fan.jiaming@hotmail.com>
Subject: =?us-ascii?Q?[PATCH_1/2]_x86/timer:_Don't_skip_PIT_setup_on_UP_?=
	=?us-ascii?Q?when_the_local_APIC_timer_is_disabled?=
Message-ID:
 <OS3PR01MB102518C9180AF872FF309702CE7462@OS3PR01MB10251.jpnprd01.prod.outlook.com>
To: "Thomas Gleixner" <tglx@kernel.org>, 
	"Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, 
	"Dave Hansen" <dave.hansen@linux.intel.com>
Cc: <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	<linux-kernel@vger.kernel.org>
In-Reply-To: <OS3PR01MB10251F5C8A7346BFEE8448F14E7462@OS3PR01MB10251.jpnprd01.prod.outlook.com>
References: <OS3PR01MB10251F5C8A7346BFEE8448F14E7462@OS3PR01MB10251.jpnprd01.prod.outlook.com>
Date: Sun, 22 Nov 2026 10:30:03 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: TP0P295CA0026.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:5::7)
 To OS3PR01MB10251.jpnprd01.prod.outlook.com (2603:1096:604:1e1::9)
X-Microsoft-Original-Message-ID:
 <b94bab57-720a-4bd8-b99a-5aee7692a9b5@milk.local>
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
X-MS-Office365-Filtering-Correlation-Id: fe75267b-45a3-49c1-5cd8-08df4883952b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|55001999006|24021099003|12121999013|25010399006|51005399006|23021999003|6090799003|15080799012|41001999006|19110799012|8060799015|5072599009|25031999004|24121999003|22091999003|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGZOSGxlK3FjZDJqS2svQXBUaitPYmhkUngzNkp3RDk0MExrYVc2SFA3Zkcw?=
 =?utf-8?B?SkdFcVNncThzNDhId1lxWGlVNjZFbVd5YlZUMWc0Y2llMlpDUTMwdjIwTW1L?=
 =?utf-8?B?czkreHVMQ0lHU1hpY2huVi8xeEFuTEcxeHRCeGUwMEc3SVA0Y2JPWnc0SWNF?=
 =?utf-8?B?RGw2a2c2a0dPaEcweXdQVTM5K3puNnNWemZ2OVdYUHh3UGlTaDFBazF5REls?=
 =?utf-8?B?cUVTTkUxc1hYc1h5YU5LaS9VZGpPazhXU3RwTzdCUEZyODZqWnRBQ2tHN1Vs?=
 =?utf-8?B?QWl5WVN5T01QNnZYMWhKSGZESGdhVDZueWQzZUZvVVlSN2JNcFdMZGxrTnFJ?=
 =?utf-8?B?TWxsTDNwUXkvNDU5VWs3WmwyN1E4OERYakJVN2tQS1h2UXU3OEJQZmZqb0xr?=
 =?utf-8?B?SlZ3ODZDSUVBZkphRFd3VGF3SHdObnIzeVNyK05FQ3hNSkF0TkpLQitNRDU1?=
 =?utf-8?B?cHEyd2l2R0JKakdZMkMrNFEyd3ByRkd6Y0d5QlUzZW5EMkR3UDFnYTdJODhj?=
 =?utf-8?B?ZkYwR0c1ZC9BdW5ZNU4wVzNpekQ2c0FyWklCbmpJTFhpcjA2VitVM2VPdW1z?=
 =?utf-8?B?c01DT0FxUncxRDE4aWY5ZnZVbUk0dmRUYkZiNFphR2NERWpjcXNjOHUzZWxk?=
 =?utf-8?B?V2VvM1A2UnR0WTc3dVd0NUJ1QTlpbGdCRW4yT1E4b1QzdlB3aHBUQUxvSTYv?=
 =?utf-8?B?S0s1RXFBWVhROWdHazdDR0RtL01HVXdkdTNRZSswaS9LOGV3dGlpN2tYVy95?=
 =?utf-8?B?T1pnbmNWRkEza3NLbGNuSm9LaEd3YUN5K3ZyT0RDTG9HSmYxTGlyTFBheGhO?=
 =?utf-8?B?SXBpN3NCL3VERW1mSnhWalkrWXpJY1F3Rkw3Z1pLaTZGRnlsaDFqUEl6d1RC?=
 =?utf-8?B?Y01wRnlDcFJxN2RiRkhGUDlBRVRWV1NZMnpKdEFjM2tWSGM0eUNCbm4rZ0hU?=
 =?utf-8?B?Mmc0NXROa3pNelVBajk4Y0EvdmNIVmtsSzM4UnBuSWdwaGVxSUVkYnJnUCt3?=
 =?utf-8?B?U25nVmprTWRYM2swQ21PRCtHVittelh5RWlJM3NWYk81RjJ3U1VtMEhFREJX?=
 =?utf-8?B?cjRvd2I4M29lRWVNazhzYVQrWWRmWmhDc1Q0QldTWGFBWFZkeWp6ekViTnZR?=
 =?utf-8?B?NEI2a2lJRlZPUHlURUJLNjFSdkNKSWtGM0w0eFRPMStpL0pENHp2aXZ1Yytq?=
 =?utf-8?B?YjdOTlNZcFI2TTlzTnZCdWlvUVdwanFNNTRPMk04WDluYVE2cnVENDIvdk1t?=
 =?utf-8?B?ZUI0U1hWVUxNb2pIeGlBRzhmVEtseEtXR0JJWENaY1pmTWU3djdHWG9ERlc3?=
 =?utf-8?B?Tnp4Zk1KbGVIYmZ4R3FuT3VJc1pjdThhc0p4cnp1bWE5eWg3ZXMyQytWbXJy?=
 =?utf-8?B?MFJyR1pGeURrYkRtd3hKNEx2Y1R3WVN2Rjg2c0t3SHpJNCtldDBVeWl0M09Z?=
 =?utf-8?B?L0dUcUZGdm1MSFhteDJpNmdsWXpUYVZLZ0IxOGhheVNCWjlDamlXVmd3WEZv?=
 =?utf-8?B?MGpNNzhZZkhCQ2JJTCtxWkJvSjRxOVpka3ZFRi9JYXhOYmNlenVGSVV5QlJR?=
 =?utf-8?Q?+lRHQ0zQzcdrfJZPPEPJS4vj0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlJxbCs2bW85L0prengydkl4VUhNd08vQiswbmFyWHNHNEhvQW9wanMvUUdW?=
 =?utf-8?B?M0Y1M2dPcUNtRFRDaW5vM0xhZXlLemlCY01FVVk4Q01oRThzTlZ3NnhZMWlr?=
 =?utf-8?B?V1Qybk1URlEvWm9zZHJrUDNORUo4TEJSZ21XUmFOZHoxcm0vSGpSWndvWklZ?=
 =?utf-8?B?ZWFyUDZ6YWEzcUJ2b3RhMWp5KzhzOWZDekdFcGlwMVpPRXlYaGg5bUwxQ3R2?=
 =?utf-8?B?THhPRTJNV3EwV1lNWHBoUmRidGpZN3kyQlRNanVLSE54V0kwdWR5ejhYampa?=
 =?utf-8?B?VVNJRXFxb2dNNTVMQWtDRXJHRGRkY1prVzJWMVBPVUNRaHorUmJBc0dIWjdw?=
 =?utf-8?B?enlDYTdscHg3dTBNT2h6QXZCU3VWNUdmLzFpKzRTSzdRaGFFcjJ6Qm9NRjgr?=
 =?utf-8?B?VHErNlR0YklXVTlTUXBKeEFOZi9CZ0hWY09EMXRFMHFJQVFqT3BOSEhrSDYv?=
 =?utf-8?B?RUNFd2VYWFh3Sk0vUkhLZUFnaWNvcENiK2t2QXdDVlVwVWsxamEvVjZ3OFg2?=
 =?utf-8?B?enRDbUR2SEZIb0lOaW1zbUoyeG05c1dvZkVhU0Vqc3U1SUNZcGJndmZ3TVlN?=
 =?utf-8?B?c1pxUlo2MHEyb3grbS83eUpFRGorbk9RaW9qNk83SE9hS2ljWmhad0xRQ0Q5?=
 =?utf-8?B?OXZ4SThXdTVuMXBZUmlTRVNBOHpETndhdVdCbjBpSGYrSXNtbFp3bTdTd05n?=
 =?utf-8?B?RzJoTE9FbGhoM243a0llalVjTTJpTEhKWEc5SWhlZHExMW1XQXdsb3NTR0J1?=
 =?utf-8?B?U29oVW9oTElZV3VFVjVJYnFVY2lqVVpqMTVUSGRrOExvb2c1b2M2bW9wcy92?=
 =?utf-8?B?N3VEdS9DWUJzc2Z6b2djVGJIRkZ1TjdraEpEUkZ3eWhLU1dBbkkrSG5yd3k0?=
 =?utf-8?B?WWRXN052NEhoc1BVTVkrbjE3RlN4WXVTNnplN0JycXF5blo1MkgyZzdnOTJj?=
 =?utf-8?B?TU9MTEtMbkFqdm5PaFJOQU4xMnZ6QlhPemV2ZUE3cEpXN1pBUzdTVmwxdW1M?=
 =?utf-8?B?SVRaTWdpOGhOKzVOSGlQL3RTTmdNZG04d3lHbXRJUVM1UFF1dWVNRWNoejRI?=
 =?utf-8?B?eUhFNWxOeEZDMzdIWEhSSXVhbGtSbFNkYndIZzNKWWRsZ05RMFNENDM1VDBK?=
 =?utf-8?B?YW9wWmpJUytRRVMvWHFVNlBTRTlnN3dZVUxvU2xLalRYU0x2KzlhZ0EvMHRD?=
 =?utf-8?B?MFhoMy9LdGxITGNNZDVuY21ieXF6bGdWRUMyU3AwVnpjeHNPOG1VMkYwZW56?=
 =?utf-8?B?b2pEaDVkZWlKL0hGQkRHbTRKSFJLTlo2L210cE5UWmxNSDBnc0FQZGFkb05p?=
 =?utf-8?B?eEZ3L0tvVUlwYW51UnJoYVB6SEc5SWliV0hIcndCd0E2NVdNZGNvUWNhQUFP?=
 =?utf-8?B?NUYwbnhvQXNMc0o1YzU3eUhncnFRaEpKWnBFVWpkaVpMbXU2Tk5XS1Z2cTNz?=
 =?utf-8?B?eUV4NlpzVS9JTC9SbThpUFhEUWswS215MFNPRGZIaWR2MGVhRkJQTTZLc0tJ?=
 =?utf-8?B?L3RTZWRNbm10VW1ZT1lWckJEcTRDNmFkZ0d1bk9wQ2p0TGJVcHBwQ2hrbmNn?=
 =?utf-8?B?RlZLTWxaUUt0SEpDNi85Y25WVkpyZUdqdFV2V1M3eloybTlmbVI2SWJzdXM2?=
 =?utf-8?B?bURQYlRCeTUvU253VHdIS2loNlBxOU50VzdWTG1JSUZJOWhpVnlraUlzVEZB?=
 =?utf-8?B?aFUzOVZ3QTMxMTU4Zjg2N3F0TC9ybk1XVE81ZWpGOWV3ODN0dFRmOG9LeFp1?=
 =?utf-8?B?MFFuNHBraWJxcjRKNmdxZnlDTEZvbXN5aG5Vb2RJaGdKaEExSjU2azdQZEhz?=
 =?utf-8?B?cFlOZEFYN1IvWCtaMkxZbVdhYTdSVmVwYkpHQlNReEdNbUpPU2dUTlBiRmhx?=
 =?utf-8?Q?2ux1O7+nbyUcJ?=
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: fe75267b-45a3-49c1-5cd8-08df4883952b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB10251.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 10:30:09.1797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSOPR01MB12249

apic_needs_pit() returns false on CPUs with the TSC deadline timer before
it checks disable_apic_timer. With "noapictimer" and only one possible
CPU, setup_boot_APIC_clock() registers no local APIC clockevent either,
so without an HPET no clockevent device is left and the boot hangs.

Ask for the PIT in that case. Leave SMP alone: there the option is
currently ignored and the local APIC timer is used, and setting up the
PIT would make check_timer() panic on machines without an HPET whose PIT
doesn't tick.

Fixes: c8c4076723da ("x86/timer: Skip PIT initialization on modern chipsets=
")
Signed-off-by: Jiaming Fan <fan.jiaming@hotmail.com>
---

Notes:
    I first tried simply moving the disable_apic_timer check above the TSC
    deadline check. That breaks SMP as described above; I reproduced the
    check_timer() panic with QEMU -smp 2 -machine q35,hpet=3Doff,pit=3Doff
    -cpu host,kvm=3Doff and tsc_early_khz=3D3193914 (the guest's TSC freque=
ncy
    on my host; use your own, or tsc_khz stays unknown early and the PIT is
    required before the changed check is reached).

 arch/x86/kernel/apic/apic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 90025451ace2f..6b2e61ae7e240 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -782,6 +782,9 @@ bool __init apic_needs_pit(void)
 	if (!boot_cpu_has(X86_FEATURE_ARAT))
 		return true;
=20
+	if (disable_apic_timer && num_possible_cpus() =3D=3D 1)
+		return true;
+
 	/* Deadline timer is based on TSC so no further PIT action required */
 	if (boot_cpu_has(X86_FEATURE_TSC_DEADLINE_TIMER))
 		return false;
--=20
2.56.1


