Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795114066;
	b=EthYXxLCZQZqdM3i+h6V52fp90C1PF2w6lzLub5Yor8ijEl+AIV6p27R67Qev3qLme9w
	 9U3oJ358qAwmkDjiGSIJr/5w6skMMV8G0KVNHS14bC4E4IAI7XvA39U82wkWGo6mtUehU
	 2ysWrN+OhTQp/sAiWkK1dMu4TAPL3G3TEOAlOJSDSK49FLj6NhtFpONS6wGp4jbsCwi4F
	 0TbPpbWnzASLDTMOUAIBw2iptj6zljdPs/UEpXJHWnQcxuo6GYaQVGxVP59RLVxO3s8/F
	 Bg4Uebw3QRUrIUYdjMHI97mzOcIf5Z9jIrpnT6p+/tW+kXgl7BAncKR7rGQFpZcKYgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114066;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-slblob-mailprops:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=God3O3sl74OmhF+2IPIIl9P3M57xyXji/aqcQQPF26U=;
	b=DLX7+TXyMzwbXXm9thttrwvLSk2vbPi1eMlwJrLF9uawUuqkFHlGTtCoOacXxyxvxGzB
	 hqaXpM+J3FGVZTJNvdaNlqIthoLeeWXDJUHT70yg5fOpLS3e0ay5LefOJ3bekrUrbecFM
	 VmFk1xNbtwV0UNymEn9STh0rnUkVi2y+xrsthY+1X3ifPpOXghRyWAALdQEjF87SQnKtc
	 +Pn0WHLJ74pOaWerNEY5Jl1K8/iTBHV8SI7mqfSJij5C5qN7pT9+fyhKvWuthqH48Al/n
	 MYyy5JgDZygNvkor/ddi7eJsYoCoDTOjTDNtKFZliCQ+chK6Ya2PbpdB/Qru69WkdRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hotmail.com;
	spf=pass smtp.mailfrom=hotmail.com;
	dkim=pass header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=tNx8YwRh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.53.55
Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19012055.outbound.protection.outlook.com [52.103.53.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3727606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3727606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=tNx8YwRh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHXHY5C6+4OtEXhQjLhBbL253+8snUAoX+5fgWUVN6FgUsvQH8BcJCZg3kovkvU8iAy/McebQV4s2XZNd0ZWxMZjWeDGLRgCgBpjV9nqgY6chK+Dg9HAsJ/4q3YsDKOl5mFRBzRJK77to2fRvg3zQ6VPHO4ai3i7OxseaNa6mVWiGl6BLmHQSgCQuOvdF1wvrHCglLxP+350aEZ7njtl4G/68Yo3jPCgyos5ICQH3n/RPDF6OXLOQxADNAJfQQcQ/KgkQ6PoSWBWrXkSFUseaoHUXL2oo1PnfbwgGbsfJ8avA7/P7o4BI1jX37twZC2bjgIz37fcoo/nMXMqGg88tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=God3O3sl74OmhF+2IPIIl9P3M57xyXji/aqcQQPF26U=;
 b=aksOh43JW22YNv0/HN7x3fCLY8gh8VbZ9NNi8OeW4OsWgZfV7W/+mWKnwZejLfu9g43HVeOlPeEtewl6SbR/cJaYodX+pKrKXyloEwpoMeNyGtnH61xmwNIDGxKZQtfUhkHdUXBlaxF/0n5dhBUd/ldlNw6EyhgapTqQ449K2aDK4L50FeLzGZTuCO2+MF3SCTDPvB1/TYgwrp46JQoucUiwgDjcjv6Vpu7mzX0f8hRSLamKr1ffh7jFoMaDbc3IrLrwpSbSME28RpeCVetVfgfE1NiIrbQKq8AwRF73k9zadty2u+s+ORKi1yBqbidFh8VES4r31Fh8ha4BrKaAAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=God3O3sl74OmhF+2IPIIl9P3M57xyXji/aqcQQPF26U=;
 b=tNx8YwRhf4mV+WVp3MU9TsXE0AdIxHugfkbTyaYmDYa60TAheQCqBCj6E04T8TETE2GT28YySs0aA52egrf1EkuCQoSDxFSaz9ZRc9CRjlFotYyBPu0pdw8zynml20wYlv/mmYwTuuo+UDImN2nAWt8SkdrzF/SxUEIgGthMyVxKZqN5UJEQP+hS0uZd5OTB8dRlivuWj2jgRBm2M0g95xcljpyadNmkoes/gm1HlXIXOeo6R1xDIsx6PdPN1GPZTc5DMNAsddFGEKc16NU6yUZQ1Z5ELCiQp+tcuJXSPsrTAtXzCluhnk2HHnM9H55EjEkmjRWDQmtgIMXZ0NAvUQ==
Received: from WA0P291MB0172.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::6) by
 WA1P291MB0081.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:15::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.12; Thu, 19 Nov 2026 18:47:42 +0000
Received: from WA0P291MB0172.POLP291.PROD.OUTLOOK.COM
 ([fe80::1957:c071:8204:8322]) by WA0P291MB0172.POLP291.PROD.OUTLOOK.COM
 ([fe80::1957:c071:8204:8322%7]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 18:47:42 +0000
From: =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?= <habilerenturker@hotmail.com>
To: "clemens@ladisch.de" <clemens@ladisch.de>
CC: "arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?SGFiaWwgRXJlbiBUw7xya2Vy?=
	<habilerenturker@hotmail.com>,
	"syzbot+fc3a448093c17a792368@syzkaller.appspotmail.com"
	<syzbot+fc3a448093c17a792368@syzkaller.appspotmail.com>
Subject: [PATCH v2] char/hpet: Fix missing TASK_RUNNING before put_user() in
 hpet_read()
Thread-Topic: [PATCH v2] char/hpet: Fix missing TASK_RUNNING before put_user()
 in hpet_read()
Thread-Index: AQHdeFZ1HABWnrZJfUKnXm+rV4I0pQ==
Date: Thu, 19 Nov 2026 18:47:42 +0000
Message-ID: <20261119184740.71485-1-habilerenturker@hotmail.com>
Accept-Language: tr-TR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: WA0P291MB0172:EE_|WA1P291MB0081:EE_
x-ms-office365-filtering-correlation-id: 37329aa7-8394-4e36-97b2-08df466d982c
x-ms-exchange-slblob-mailprops:
 +b2+gf+2pHS9TYwzDM9SHHeXDGMmYsJhmePVnt8PMuT1ONJCFPeH+bamyd9+HAApI3Xr1HEzoepzjEPiCry1U0ETPkCLinPHdaoIgfcP5c8SYhLBHzaKLV+h8UV10/gGCzCEo9bpy+WRm6wFdGJ9k+e4puYfZWcjaYF6SlJYDRVj3RpGs2oe1fA7KeXqYE9FVME5gGD6ll4weJBTyeQh9G5CguvitF3PjheNZG3FFqn9vNE27+TozicvCSJ2dxTsEuu9gO2QelJqt1nwlc8ReZkeEPzB5iCBs8eqewKkp3uYT+40DK1oq8iPP+WD59d32QCKdnBurliLMuw/+OiAW6/prS2JMs1FUHRKO7mk7skdmtE0b9nPh6HK9OujKRXrQ8Va3KHlPjqQQi3ouXMRon4qbjS6mnoSRW2pgHYrkDQcBou+mYKxhE0s8dg1lbQZ4/TWwy+luQCh9inkYKS/8alIM3ZYjczf3YBXrjkQt5txjq6ke46OE0fiki1nLef8MU99+a9BooVJQ8P5iJC0XGV38YoYYUyRm2O+bLJwBJtP8vbumK3jK8MAy9NS9b/XgxdEd8YA0YHDpK7AhXBLtshKA42GoVlUXjE+1iEI/4wxn12fw8TAa+3gOi8R5EZZxWtbU+V23HDQm1oy5D/0ogEFO/NhfMUWSGGRYK2+wJOEyL14e+EMttDPs0gvE8ggPB1cZjyK6/Uw78dkXy6HMj3INhFqk+v/Fyexdj/GOKyA75B604BoaEFkB0QRBSoamVTwXBxpOgPJ8Wmy8tJllSL3pKI3nB+WHcUzrr+lXwR++KYAOXdjQdUSVY0AdbJQNekPXFpUp7sb8/bkDlwfa4RUaZOYkxhwDCv1drbmGInq4Tm3bOXhGg==
x-microsoft-antispam:
 BCL:0;ARA:14566002|55001999006|24021099003|25010399006|51005399006|8062599012|21061999006|15080799012|19110799012|5062599005|8060799015|38102599003|31061999003|1602099012|10035399007|40105399003|102099032|3412199025|440099028|4302099013|1710799026;
x-microsoft-antispam-message-info:
 =?utf-8?B?dlEwTmM1RSt2cXp4WkNVcS9pTlpVNHFYS3d2Wmpnc3VPR2dzVElsNUNwWmU5?=
 =?utf-8?B?MDhoZWprbFRWR0hVeWNFRTVOTkxLSFpWNjBSam5mU2lOaXdaMXBKczNGVFc5?=
 =?utf-8?B?SldRRkVtbHdFUlJLOXNyeGZuZ1NBZ21HMDhueGFuOGZBL0JyYVJ0NzZYVytr?=
 =?utf-8?B?ZVozYUdXUmdycWF5TnZ3YWhoeEVhR1pXem9zUGFtVlhuQVV6eTEzVWJjN3RM?=
 =?utf-8?B?TUI4QURQTFh6TTZsVTFOUjNtdjNmblF2Y1diVlVkQS9SOFFBd1ZFNzhQMWNU?=
 =?utf-8?B?elIvaTRNbVAybVl0VEczYUdyYk1wUy9nR0JuQmxqQUpiOWxjcHJQR1k2VUVQ?=
 =?utf-8?B?S0YyNFhZaHhyWnpTMjZPQloyWDYrUkdaZjQ0QlhPOEpJd092KzJoUlhYaTF5?=
 =?utf-8?B?eXYxUzdEWTVWSUZyVnZaZEhqT2F0dlYwRlE2akVBOG13VVhCM09jaFE4Q29n?=
 =?utf-8?B?U0hhWmFhVDdQWG5VNkJEanhObU5QbjFEU1FuTFhVcWVucS9JUGhQaklQdVRI?=
 =?utf-8?B?Mnc3R2lTZTM3djI5dmwxWWtSSjJpUXgyNzdsNERtVVM0NE1WeVI2R3RvM2JQ?=
 =?utf-8?B?U2FObHU5WHRPVWNMQXM4TEJTZUR1YzZPMCtKMjQvb2Z1UWpJMnFkb2puQXB6?=
 =?utf-8?B?MTBQZ0dHNWhucWNZOUt4Zm14N21uRk1zWGNwL3NWZkRMeUdlZitoN2p4QnM2?=
 =?utf-8?B?d09YUkIyZCtZN1JRRkRBY1UrempQa0poc29xWVBXQ0FBSjJxNGhLbWNkVVgw?=
 =?utf-8?B?am00OFJYTlhVSDF6OVZuQXl5YzhkMVh2RU1pbmk1U3Y0Uzd3V2lWYTNIRnBh?=
 =?utf-8?B?cHEwRGc4U2VsNXVEOVl0RlZjZkVseEppZFVnSzhOUWRnbUlmRzE1UkNwUnZE?=
 =?utf-8?B?MGN6aklEVzdQckxLZnhwMmErdWVvYWdNL1Jlb29CbEM1VjFqcGRFYVREYnlN?=
 =?utf-8?B?WWtoN3RvSnFOR0VMeHpveTVjSkxpTGQvcE9rNUlHUytMTDJFUWFaRGRGTnZu?=
 =?utf-8?B?MFVvTkc3NmhJNmpFeEtXN3l4SUo1dENqTDNJMnRlRDBLUHVWM0dZUGVNR3VT?=
 =?utf-8?B?ZXh2RVNBVThBdzl0RklrWlNSQU1CZ04zZGxxUktCWUZTbUxDYW03MGcveE5O?=
 =?utf-8?B?d0l6WStwSnpWaHJXbjJsRDAzL0t5WHFadEMxTkR5WUNFd1ZXZ0VWZVBPcWRs?=
 =?utf-8?B?cXA2eTRjdnU0ZWlJNzQ4NkJlbHpyT24yZUtzRXBGRE1lMklUQzFZTDUwNlhS?=
 =?utf-8?B?WGxIdmRYZ3hCb2hVb3RqazJBb0RxaTlPZDlldTJ4SHZBMURLVlJzcDBqZ3l6?=
 =?utf-8?B?U0dKSzY1bWhkcEtRZWd3T0VSeldWb3hpNGFiUlg5SzRZVU1tL1JUOU4zOFlo?=
 =?utf-8?B?Z0JreXlrOUoyV3ZOOEpyaGtTd1BNcS9NRFM3dGlycmtPVTBobW5YM0NGRzJT?=
 =?utf-8?B?WUFzZTk2cG9oeWFQSkI4K0lPNy80QmFKclN4L3FRQnhtYW14TkJyWGFGUEhV?=
 =?utf-8?Q?9og0CxVQFELYt09VA/FywbXUq6j?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z0JGZFk4dXBxVVUzTmRvYS9mOG1raG5uV0krMUtJL3E5VUJYd2t5ZnVOSnZy?=
 =?utf-8?B?NERuRVdoRWt1NFkzVnVYNkl3MnhleVM3V0dzZEhnYzZucmpQUHdyT2FDS3dj?=
 =?utf-8?B?Ukx4Q1N3YStWNTdBT3NrNWdCaDRmbEJMR096M1ErQWp2dThOZnowbGhtY2Er?=
 =?utf-8?B?ZTVpMGJiSVBOYlJaWjFuN2ZjODVXTkJXYlRKWExGS2FFcDZERGhreTB1R2lH?=
 =?utf-8?B?dGdKd1B1Nmp1clg1V0IxbmFvNEhtekkvZGtDWFlBQ3R2Y0RhZGxpb0JRejA2?=
 =?utf-8?B?SkNSU0N5S0VqMWEwbS9wbTFRcXpXQnVBM0tYQ1IvMEJ1L3lzL1VPa1grT25L?=
 =?utf-8?B?R3VpeUdidW01dHBvenRxRzhRb0kwdmV3MmpKK3hmYTVjeElwRzh0QWZ5NFk2?=
 =?utf-8?B?VUFvZE0yYWZuU3J1WWdTSFR6ZEZYaEMxbzFQeStValFtZjdhaDluZDdveUJJ?=
 =?utf-8?B?dUI1TnF0V3MrZkxDWmJocmxDdlZVUmdLR0tTYjdjQ3pZaDQvM3d5MTUrUVRT?=
 =?utf-8?B?b3ByQ1llc3VLQXQrd25ZbVMvTlIzMHBMZ0tOZ2l6UXRCOHZBeHhmRUg5c1Y5?=
 =?utf-8?B?SnhnRy9ZNkxtQ1F4WnlpOVl3eXp6TER2OU5zekhYREFCa1pScEkzRDVncDVG?=
 =?utf-8?B?NmJrVTd6S2VEVTdBNDY0T0xFT1JIQTFRV21kVkpSUmlKT2N2eUlLWTBsSFV0?=
 =?utf-8?B?MXFNSC8yOXphUVQ1T3NYcFZMVkRWTjJxS2hSc2xsMUUwdUlBaEM2K3l1ZG5G?=
 =?utf-8?B?eUk5UlVyc1BocDFMZ2YwaWlWNEZZV3o3bGJhWm4zeGdEZTVxTStqOHlSNjRx?=
 =?utf-8?B?OWJrZFVkalovRDcyWEgxM0dibi85bVFHMDArczdmeVd6eThJbkdlamdPVytE?=
 =?utf-8?B?N3ppN3ZPdnloempqQTB6b0Uvem4yNTlEeVd0UGVuUVdMbWpmVEk5QlZ3Y0dr?=
 =?utf-8?B?VmJHTnZrbmY5Q0ZKRmJNT0Y0Sk8vUU1MZnlZeW1zcHppZ1BiZ3RjaWpBNlEw?=
 =?utf-8?B?bFlPOEw0bW5odW9tYTJCWUtDVVg0RDA0SFA5d25QdDFIU0dIQkFYQTgrSkJj?=
 =?utf-8?B?UXVRcEpIeE5EU2JzVnFCalNSY0h6ZjVxcXRrVTU3dGNNRGQ3b0I3VFgyR3BQ?=
 =?utf-8?B?MmVLdnBTSi8wVVUxaFlxeEl5U09Say9YTXcweG9QV0ViVzY3QVo1SE1KdVBw?=
 =?utf-8?B?Z1lZaGNBSmpOZ1dKZWI0WE1HMXhLZEtpQm1xZUxVMk5ORWRCUlFqS3BUNXRk?=
 =?utf-8?B?elc1MW52NW9tVDhBUXJCZlNuajVtRXNrT3dYR3A2ZExiY0tJOU1JeWtWYmlL?=
 =?utf-8?B?N1Z1UkFtTmFLUXl3ZXlyMkRyMlhRNnBFUndpTDNPZGY1eU8yV1VKczRBREZx?=
 =?utf-8?B?eU9tNVpNZTJwRUZJTEJkQzdaZWMrcFB4WVVNWjVpejVHV3haTWxsTWdvcldI?=
 =?utf-8?B?eHlrTS9DVkYzb0RmeWZCV1NGU1V3TXd3bm1pRmhJZTJYb0lhL3lkTmx4VFZJ?=
 =?utf-8?B?bjVNbkhqMEdNZUtSZERNamtZZ2RGWHlPT2h1RWFVR0huSjhnNisxelF5Vi9D?=
 =?utf-8?B?dml1MnlBY2o3NjY0aFBsaFkvK3ZjdVRpTnRGMks3Zk9KK0xBRVVaTGdNZWJa?=
 =?utf-8?B?SktXTTFsTW5ZS1BTWUJkclF1bkZvVzFHNUUydGZGdk96S1paY1E3bzlHa3RW?=
 =?utf-8?B?TFdBNzk1a293L05pZU5ueXR2Rkd3RGo4L2orMmpmbFc0ZUNma1BEMjZQUkcv?=
 =?utf-8?B?RFhUenpRdHdsbHlBbHhkZjdLa1lJRmtRb1F3T2lFZWxvZzVoUjR4RWNnR2p3?=
 =?utf-8?B?V3pHNEppRnpPQ1o3Vmp1SFViYlZVV0p6L2J2SUpIckQwZnVqMUN1M1l3V3JH?=
 =?utf-8?Q?QUS96tpAkveD2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D5F7E071C711246B9CDC04F47E87B8D@POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-2112e.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0172.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 37329aa7-8394-4e36-97b2-08df466d982c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 18:47:42.8189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0081

aHBldF9yZWFkKCkgc2V0cyB0aGUgY3VycmVudCB0YXNrIHN0YXRlIHRvIFRBU0tfSU5URVJSVVBU
SUJMRSB3aXRoaW4KdGhlIHJlYWQgbG9vcC4gSG93ZXZlciwgd2hlbiBkYXRhIGJlY29tZXMgYXZh
aWxhYmxlLCBpdCBleGl0cyB0aGUgbG9vcAp3aXRob3V0IHJlc3RvcmluZyB0aGUgVEFTS19SVU5O
SU5HIHN0YXRlLiBUaGUgc3Vic2VxdWVudCBwdXRfdXNlcigpCm9wZXJhdGlvbiBtYXkgZ28gdG8g
c2xlZXAgZHVlIHRvIGEgcGFnZSBmYXVsdCwgd2hpY2ggdHJpZ2dlcnM6CgogICAgICAgIGRvIG5v
dCBjYWxsIGJsb2NraW5nIG9wcyB3aGVuICFUQVNLX1JVTk5JTkc7IHN0YXRlPTEgc2V0IGF0CiAg
ICAgICAgWzxmZmZmZmZmZjg1YjZkMWViPl0gaHBldF9yZWFkKzB4MjFiLzB4NmEwIGRyaXZlcnMv
Y2hhci9ocGV0LmM6Mjg1CgogICAgICAgIFdBUk5JTkc6IGtlcm5lbC9zY2hlZC9jb3JlLmM6OTE4
NyBhdCBfX21pZ2h0X3NsZWVwKzB4OTQvMHhjMAogICAgICAgIGtlcm5lbC9zY2hlZC9jb3JlLmM6
OTE4NywgQ1BVIzA6IHN5ei4wLjg3My85MTI2CgogICAgICAgIENhbGwgVHJhY2U6CiAgICAgICAg
X19taWdodF9mYXVsdCsweDhiLzB4MTQwIG1tL21lbW9yeS5jOjc0ODAKICAgICAgICBocGV0X3Jl
YWQrMHg1NmYvMHg2YTAgZHJpdmVycy9jaGFyL2hwZXQuYzozMDkKICAgICAgICBkb19sb29wX3Jl
YWR2X3dyaXRldiBmcy9yZWFkX3dyaXRlLmM6ODQ4IFtpbmxpbmVdCiAgICAgICAgZG9fbG9vcF9y
ZWFkdl93cml0ZXYgZnMvcmVhZF93cml0ZS5jOjgzNiBbaW5saW5lXQogICAgICAgIHZmc19yZWFk
disweDVkOC8weDhkMCBmcy9yZWFkX3dyaXRlLmM6MTAyMQogICAgICAgIGRvX3ByZWFkdisweDFh
Yy8weDI3MCBmcy9yZWFkX3dyaXRlLmM6MTEzMwogICAgICAgIGRvX3N5c2NhbGxfeDY0IGFyY2gv
eDg2L2VudHJ5L3N5c2NhbGxfNjQuYzo2MSBbaW5saW5lXQogICAgICAgIGRvX3N5c2NhbGxfNjQr
MHgxMjMvMHg3OTAgYXJjaC94ODYvZW50cnkvc3lzY2FsbF82NC5jOjg0CiAgICAgICAgZW50cnlf
U1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NzcvMHg3ZgoKUmVzdG9yZSBUQVNLX1JVTk5JTkcg
YmVmb3JlIGJyZWFraW5nIG91dCBvZiB0aGUgbG9vcC4KClJlcG9ydGVkLWJ5OiBzeXpib3QrZmMz
YTQ0ODA5M2MxN2E3OTIzNjhAc3l6a2FsbGVyLmFwcHNwb3RtYWlsLmNvbQpDbG9zZXM6IGh0dHBz
Oi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD1mYzNhNDQ4MDkzYzE3YTc5MjM2OApT
aWduZWQtb2ZmLWJ5OiBIYWJpbCBFcmVuIFTDvHJrZXIgPGhhYmlsZXJlbnR1cmtlckBob3RtYWls
LmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gVXNlIHNldF9jdXJyZW50X3N0YXRlKCkgaW5zdGVh
ZCBvZiBfX3NldF9jdXJyZW50X3N0YXRlKCksCiAgYXMgc3VnZ2VzdGVkIGJ5IEdyZWcgS3JvYWgt
SGFydG1hbi4KCiBkcml2ZXJzL2NoYXIvaHBldC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2NoYXIvaHBldC5jIGIvZHJpdmVycy9j
aGFyL2hwZXQuYwppbmRleCAyODVjNjAzNzQxN2EuLjk0NmEzODA2ZjY2NCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9jaGFyL2hwZXQuYworKysgYi9kcml2ZXJzL2NoYXIvaHBldC5jCkBAIC0yOTAsNiAr
MjkwLDcgQEAgaHBldF9yZWFkKHN0cnVjdCBmaWxlICpmaWxlLCBjaGFyIF9fdXNlciAqYnVmLCBz
aXplX3QgY291bnQsIGxvZmZfdCAqIHBwb3MpCiAJCXNwaW5fdW5sb2NrX2lycSgmaHBldF9sb2Nr
KTsKIAogCQlpZiAoZGF0YSkgeworCQkJc2V0X2N1cnJlbnRfc3RhdGUoVEFTS19SVU5OSU5HKTsK
IAkJCWJyZWFrOwogCQl9IGVsc2UgaWYgKGZpbGUtPmZfZmxhZ3MgJiBPX05PTkJMT0NLKSB7CiAJ
CQlyZXR2YWwgPSAtRUFHQUlOOwotLSAKMi40Ny4zCgo=
