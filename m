Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795767464;
	b=IPAOIRRKhAhC7gZueAwD7RaePyNNW2Vs6nvcAQjjHLyxyX073M7b/S6nlun6EaxKoOva
	 iFjHFOHkZrNSzboXYTUxXZQzevZAoEw93AFimVvcT+kXzKWeqYp7J3Nq3fdWbQMubWqKA
	 yKtPAuVXQHoBpcgVIeCTDQtx5CdV/bNEuza3cpBtScAAb4IwIy5/uGFL9g87xbEyiYZB3
	 KRfUB8JziSxQWy/1wwzeYv/IKRp+qlYVVzZczd/bpnecOQno29PLCG63ogpYv0R189nA+
	 Cg6/oHuJV5CE24WsGXY4Eb3tlR+3dpwSUesXjAVpVwNNgOgjRAN14n4LiB7dLBbZSww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795767464;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-traffictypediagnostic:x-ms-publictraffictype:client-request-id:
	 request-id:x-ld-processed:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9pCaVBgeURuTfEuBHjcHq5tgSla2q96rDXNIF+7D7WQ=;
	b=vIV8Ps4tLSLwOWAws02963qEFuMZWXlNRWTWtIa5Qds+egSQPhmbbj2MrboZromvpEIr
	 dbQw6U3o1zkYBQEhDMI7qXAEZq6AL1zkwh79m24CqIvihucx8VbSVSpeiC/6kYujtMdYt
	 2v7lUcTo/DxkGx3lujubzEkqKgoAL/y90Xt8npAG1WMSm2baB8kRatzSj+6/xiEJ/chwQ
	 3HN6EdWjOPHTnLpa1fAXZus0FiHRRH27vU6sR9SYrT+2IifLG2BVSDiJIduf2p4qvn78S
	 GHIJjnJ3jIt2goyN90I62k9XBGBaSkw2Bn8KME3sWaOUPfbPXpLVrZL4lII2ZscF6uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=O56Tch4b;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=l45cV3Rx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B946606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B946606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=O56Tch4b;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=l45cV3Rx
X-UUID: 0233007aea3b11f1a7aecdb2598be72c-20261127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From; bh=9pCaVBgeURuTfEuBHjcHq5tgSla2q96rDXNIF+7D7WQ=;
	b=O56Tch4boBelcvfhljHFFsS+bVSxTpt+sIYDsjM88yUTD0z6KShJtv5b9ikM21vn/TSfKOSr5IPLAfxK0tr6OQSVNx/Ss1ReFTfrMJWjjPweeo8VZBHxuhVhTB50DtpANj5ULdj9EoPluzNBMsNesx86XqL8zGGKcJ08d9l8DDA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:a3185da6-bb33-4d4a-bbbe-73d2e032d966,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:2d7d6b31-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:80|83|102|110|111|836|865|888|898,TC:-5,Conten
	t:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0233007aea3b11f1a7aecdb2598be72c-20261127
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <defa.li@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 30037830; Fri, 27 Nov 2026 16:17:38 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 16:17:37 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Fri, 27 Nov 2026 16:17:37 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v80KcCz2+YMIVmuQX7WI9UVzyY3P71MeBUDzK795dYdsx/mzKxdXMtcy12HqaoFsNm1gxFd7KDEnUwRztErWh+ImMGdEl03+6SVI3lRAjxpiQmdVjJN72c1NjWSI4YY46K/btiR+4v3uug0/Lko19kP/dhBVFQuFl/5/gQgZXkiniaQwCd4ec3vYG/zKKMW5qZICU1snShaTmDDsZ2AV6bPIsBDf7inbq6wfSLBbanRR9IASVoAosbOMmOYkPZbgWSrpdMFUhAli38rLwb2ognruEb5KeH7MuaW1R86yJVxyvA6V0JkEAA8FqXfnMDNis0Q6WxKRGAR+mp4xXA0dNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pCaVBgeURuTfEuBHjcHq5tgSla2q96rDXNIF+7D7WQ=;
 b=bjh93YY8Rg61quDmvgxey+wKOvxN2u1ZsIJxjUZWVE7AFdAoy5731UYhqY3+uvK4Eai9Sh+5ha/Sdi3Gx7cAVtrqXo/wXDnA+yEboBVJ9FwhU3go8dvcs6LcCKrJZfste2CFzZIK7R9ZnBQxu+v283tKsxbjbsEBkn27oJS2th4IuvpxvjhMAit98h8A/H+fBf1gIiiIEmrJwj3Ulw+k9+YGB2EJGNN8QkdwThj23HhQe3h6Mn8DZd99FiFfQk8iEdzdVCXMeAS8sjBFf3R1xky3/F1eE7DSPnsnFPOvTZiQtNkRPzihaxP5SjsXKmbkpZ3uGbXpVFLnuBgKPvMi4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pCaVBgeURuTfEuBHjcHq5tgSla2q96rDXNIF+7D7WQ=;
 b=l45cV3Rxg+4ZgULUbBfb1hQM7pqGYfDqOxbsFH9QY1fs+93XYfpIe/CtytY9+nMbivfe92Em31M/EPcma18VqwohQ2w15vEDEhmQ3RcHEZ94GT/XADa94RdkDfsaosHHRqc86Nhti8EWA6sHlCdll+Gf8A2hUCdd6/ZBX29NrAo=
Received: from SI2PR03MB5801.apcprd03.prod.outlook.com (2603:1096:4:141::13)
 by SEZPR03MB7443.apcprd03.prod.outlook.com with HTTP via P2P; Fri, 27 Nov
 2026 08:17:31 +0000
Received: from SI2PR03MB5801.apcprd03.prod.outlook.com
 ([fe80::95d3:ad6e:2cd4:5f1a]) by SI2PR03MB5801.apcprd03.prod.outlook.com
 ([fe80::95d3:ad6e:2cd4:5f1a%4]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 08:17:31 +0000
From: =?utf-8?B?RGVmYSBMaSAo5p2O5b635Y+RKQ==?= <Defa.Li@mediatek.com>
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, wsd_upstream
	<wsd_upstream@mediatek.com>, =?utf-8?B?TWluZ2NoYW5nIEppYSAo6LS+5piO5piMKQ==?=
	<Mingchang.Jia@mediatek.com>, =?utf-8?B?WXVoYW4gV2VpICjprY/njonmmZcp?=
	<Yuhan.Wei@mediatek.com>, =?utf-8?B?SGFvIExpbiAo5p6X5rWpKQ==?=
	<Hao.Lin@mediatek.com>
Subject: Re: [PATCH] i3c: master: Disable slave events before RSTDAA
Thread-Topic: [PATCH] i3c: master: Disable slave events before RSTDAA
Thread-Index: AQHdfke/ZjXot2h7YESLSPCy7U/geQ==
Date: Fri, 27 Nov 2026 08:17:31 +0000
Message-ID: 81fb06c49403d1c1e577d846ed5d8f0b266eb194.camel@mediatek.com
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic: SI2PR03MB5801:EE_|SEZPR03MB7443:EE_
x-ms-publictraffictype: Email
client-request-id: dcb82780-38aa-4857-a8d8-3d11bdfe1ea0
request-id: 1053e462-c619-43ab-f4b8-08df4c5ee213
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10067099003|56012099006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|18002099003|11063799006|6133799003|3023799007;
x-microsoft-antispam-message-info: 0z0qbE2tua5+6GskXf0z7stWOQ3qGb31Ap+k8jAVuZ2Y/rb2DY6hvdV/0/STbQrz3YuV6TvoR9jGnRRgp0P4DppOWhxw39NdHub9GoYQ4OEsGv5az1/MWGLJO1/HpAvoud6WCBghcaV2f3HoJ72+Vg1veZioG7Ch8pDMhXPxKZRp6gr5HMAtDcXiR1VkmlSIrK4JuhBnQoP8YK7Tsk68tinJsNiS+wRVSLkq78MZTCi1aFOeyEHr/yvpHmMje0Kb4k3cZnmDUBIiHcuKqjSBjgUZSvLriO2+N1ztx0Eo3iSf+NjM6Qn0A9b4nU2MP8AtBEzyJ+zS34KKuUGrzbyBwbqbowEHm2I+xBHL3M09LUn4pjpR6M6R4DUQX8lNXyiUXQhNVbZbx2+yvOAJJkk5LMJ745LYkX1KNLHxmhdnfQQqL6XLNVcX6FlWnEDmbDUC7egKXtbqa8tPON9CqkYZcYwt+e3/8mvnQC8QkqFF4W+c5TWh4POl0rP3LsXfFeb+Ifz8o4op2nzQ3q7HsLBf2M74GLftXpuRp4MRxGc2VgThtC/VhPF/1TM7LxnAokHxrbCnqWA0wkig59r38aAwjJTVMA/S5IqKyVlQPr9xr5qQZsXNXyGR/8AsoiKYz1VkqmjSrrZZPrBBI05ZbDyVNINShpYkoaqaA7cstIgsNu8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10067099003)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(11063799006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGlHV1kxaUpYYkdyM2Vlc0RkeWk4c1FwV0drUDJlN0M2eGV6QUFhMEZPK2Y3?=
 =?utf-8?B?VDlNek9mRFgzVG9HNnM2eDhqaysvRW9QMUU3UDM4TDFIMlJqaHB1MFJ6WGs2?=
 =?utf-8?B?YXVkL1Y3b0pBVERWbVRNNUk5YThIM3pNaGJnOEt5YVpndEVsSzR0dkplbllD?=
 =?utf-8?B?TGE1NTVOamM1eEI5NloycmpQZ1FlME5naGJIeTZXbS94RkhJNnJENVdWUy8z?=
 =?utf-8?B?TlNURDF4aUlyRU9lUm9zcGJpcWlLNzdHbjRiMXFjYXdPelJrR2VBcTQzVXVo?=
 =?utf-8?B?MDlDZ2xFN1NiZmxnWTlZN0pjZHJnVlIvTmZWTDVPbjlOcU1jbjlNVzBwNjU4?=
 =?utf-8?B?ZnBRSDFsSGJRa0F0MlBvSEtJOFpzZ2FFYnJjQ1NBbTZTMDAxMnVKdGptSHhG?=
 =?utf-8?B?YXhzcHFza200ZXp2UER6RXRoaXVId05HNzgyd0dBVk85T09EMTZvOXhmUFFR?=
 =?utf-8?B?aHIwQ1pLZ09oaUU1V2VJZVVqUG03dVhmSWU1aVI2UHdtZXR0WjdBT0J1VUx1?=
 =?utf-8?B?dDA3Y2VVa1h6OWdIV1ZLYjFvdHJNM29nRzUza1h6MHk2WTFRK1hPRFRac28v?=
 =?utf-8?B?RytxbEZLTnRiNUFBREQ4WHhKTXJpR3p5UVpzRWxqUTExYURZMzRnQk1vWk9Q?=
 =?utf-8?B?WDAzMVMrOUFGaTY2OHZZTkpkMlBSWnZQT3dJWUFyV21CdHdRRk5rYk93OWxV?=
 =?utf-8?B?WXcxZ2pWa01JSmJhbmVsa2V2WldVZFN1aHFYWDV3ZHllUUxvbEQyaXdHeUJt?=
 =?utf-8?B?U3FSaC9uR3QyUU5LcTF2dm9WMVhkbGh0UVl6bjA2QlNFVForTVBXaTFwaXlh?=
 =?utf-8?B?N3lKSU5WNVh4blgrL0xNaTdnbHdsalc1WFhGSU5SaVdFa3pXcnhaMWovVHpm?=
 =?utf-8?B?L1Y1RVVQR1BNdjRUSXdHWUdta1YzZHVMVFBQczFGT3J3K1NHNzZ1MDdzNHM4?=
 =?utf-8?B?RTA3QnozZW9lbWZvYW4xcUhzK2psaTRhSDArck1zS1JzQmtCcWZ0UjBLUnVO?=
 =?utf-8?B?THhUancwT2FMbUNxbnN0WjRDcjN0M1FLVzdoOFNHR2lQYlQ5NUJPTzFaK1lW?=
 =?utf-8?B?dmhQZExIVy8xNG5ucEV4UXI2eEhtSEl5NHFQYXlsUEJCaGpWdHpFMEtCN3pn?=
 =?utf-8?B?YW5KK3JnbVI3VXYyRE5aSndHM29uL0U0QjhCd3dOWER0MUh5b1FKQ0RqdVVL?=
 =?utf-8?B?RTBqbGduTFFFVDZmTzlDSzhPalgwUmlON0ZiK2VHMDJEZk5tcUZhUjBhWVlp?=
 =?utf-8?B?UGVuaEdEY2JMaUlvUHN0K2FKQTV4azRlbWpEQjYrSWVjRDUySEFmLzcwdzlq?=
 =?utf-8?B?RktsVDdQaVNtd093Q0Ric3pMV0ZMV0tIVEd3RFVDMWU4NGtpY3hHY0JMT2ZH?=
 =?utf-8?B?T0xoVk83QlVwbGxUNEpmb2xkVFVrZEJKd1phdDBXVDBmb0EzRHkwamxCd2xh?=
 =?utf-8?B?VGVMVUhsMGxQRDRtc1J0TVhvcW9sYXk1Qnd3NFdVcEF4TUpjcHpVOTh2T1VR?=
 =?utf-8?B?d21HTzliaW00czZuUnQwNS9aSGNnVWNvWlRLb2FmbFljdmpTNDlaTjZ5SC82?=
 =?utf-8?B?RW5GdDQzdDdRZFR2R0R4ZDFnZVIrVFhXMjN0ZUxYME5Gc1hnbEtOMEFEZ3VJ?=
 =?utf-8?B?S1Z4eDVidklYRnRYY2FVRUhqMTZIV1ZWQzV3YmhHNGVyZys5M1VDQUJzU2FZ?=
 =?utf-8?B?elRuU3B5NS9lcUdMVGRVU0ZoUGc0L2NjaG9UMVc1cTF5SWJGUFM3Q2dRREJr?=
 =?utf-8?B?Z3FadEl3MTN6c2hGd1BobWp5SFNIZWxSVkdTQlg5UzlVeFgvYUVPRE1nMWFu?=
 =?utf-8?B?Rmw1aEsrZWlCTUg5SEdCRGRhdExxREJtWGtmc2llQjlqdUMvbWRZaXpiOUpl?=
 =?utf-8?B?SitZZDlDaEtrbXJZTE9rVFhFUklqV0QrUFNOR3lBZnBVSTBoSkNmWXFRWUVm?=
 =?utf-8?B?NWxaWkVJKzVoZ0pBeC9JL1hxdmtkNUJ2QVRBYUtVUmd2bnROVktES1l4QjlH?=
 =?utf-8?B?ZGpBYkp2OUVDaFFvTmZlWnVMSUQ5VG5CT2lCNnFMVlR3dUErc0drS2t5dVJl?=
 =?utf-8?B?a3czbUE2VkRFc0NBamdYalgxSjJxemROSWU1bXlaallSbW4ydWpCbFg1R0gz?=
 =?utf-8?B?enFhTzlrdEhqQnZSL3VsMEh4S1JsUCtYcHhsOUNEcGk5ZW0zcEliOEk3ZkpL?=
 =?utf-8?B?NzdKSU4zSEl0aklHWWdFVkNIbldsWkpNVXkyVUY3UDdYM2tseTlveVQzWkZi?=
 =?utf-8?B?d0hQeFVhOWQ4aXV3bE5qUndOdk5sMDdwWE1MVmkvMWxtL0NJUWtEMEQvRVhu?=
 =?utf-8?Q?IDryk4L9qNygY0v+r3?=
Content-Type: text/plain; charset="utf-8"
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
X-Exchange-RoutingPolicyChecked: bFFowIWWJg/Q+rlAQwq02M+fFgWHZ9NsNssVmVNANfzJaByfFurW6bEeZCL+rx7Tmm8Kb9fl+5g4GEUevm0ZcU2pme1o/ZgfOQiKePrpdLKxF5ZJJCJ42s84uFSJdFhErLfzQERdRvqbYqkWtEBYJU7qggIIeJyoMO1tsmBLNgjB3amjtOmgTNtKX/LWfqB/CtpLIv1CeIC2tKOebjbE04pm1eor42dAA3il7Kt4fxUfuU+EO89zzWiNCyE9dv7dAfUh7XJfjA8xud4zIQKFTN/YVUEimEIRINl+b9sspq75o7lc7RAZMxnFe8mejlttr+AJBjZ7cl0aTQStHO3wMg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5801.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1053e462-c619-43ab-f4b8-08df4c5ee213
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 08:17:31.3343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I6GbM3+EzB6kGCtZbtZhxCSxSBcAJk2dsC5268qdIdaRM4Qa819rC3If42mJkIFam7ZPegQNurIfe9K/8aBxsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7443

SGkgTXVrZXNoLAoKT24gVGh1LCAyMDI2LTExLTE5IGF0IDEyOjQxICswNTMwLCBNdWtlc2ggU2F2
YWxpeWEgd3JvdGU6Cj4gCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxp
bmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91Cj4gaGF2ZSB2ZXJpZmllZCB0aGUgc2Vu
ZGVyIG9yIHRoZSBjb250ZW50Lgo+IAo+IAo+IE9uIDExLzYvMjAyNiAxMTo1MiBBTSwgRGVmYSBM
aSB3cm90ZToKPiA+IEJ1cyBpbml0aWFsaXphdGlvbiBzZW5kcyBSU1REQUEgYmVmb3JlIGRpc2Fi
bGluZyBzbGF2ZSBldmVudHMuIEEgaG90LQo+ID4gam9pbgo+ID4gb3Igb3RoZXIgc2xhdmUgZXZl
bnQgbWF5IG9jY3VyIGFmdGVyIFJTVERBQSBhbmQgaW50ZXJmZXJlIHdpdGggdGhlCj4gPiBmb2xs
b3dpbmcgRElTRUMgY29tbWFuZCBvciB0aGUgcmVtYWluaW5nIGluaXRpYWxpemF0aW9uLgo+ID4g
Cj4gPiBTZW5kIGJyb2FkY2FzdCBESVNFQyBiZWZvcmUgUlNUREFBIHRvIGRpc2FibGUgU0lSLCBt
YXN0ZXIgcmVxdWVzdCwgYW5kCj4gPiBob3Qtam9pbiBldmVudHMgYmVmb3JlIHJlc2V0dGluZyBk
eW5hbWljIGFkZHJlc3Nlcy4gVGhpcyBwcmV2ZW50cwo+ID4gc2xhdmUKPiA+IGV2ZW50cyBmcm9t
IGRpc3J1cHRpbmcgYnVzIGluaXRpYWxpemF0aW9uLgo+ID4gCj4gCj4gV2hpbGUgdGhlIHNlcXVl
bmNlIHlvdSBzdWdnZXN0ZWQgbWFraW5nIHNlbnNlIHRvIG1lLCBidXQgaSBhbSB3b25kZXJpbmcK
PiBiZWZvcmUgYnVzX2luaXQsIGFyZSB0aGVyZSByZWFsbHkgYSB0YXJnZXQgZGV2aWNlIGdldHRp
bmcgcG93ZXJlZCB1cCB3aG8KPiBjYW4gZ2VuZXJhdGUgaG90am9pbiA/Cj4gCj4gTVkgdW5kZXJz
dGFuZGluZyBpcywgcG9zdCBtYXN0ZXIgcmVnaXN0cmF0aW9uIGFuZCBidXNfaW5pdCBvbmx5IHRh
cmdldAo+IGRldmljZXMgc2hvdWxkIHN0YXJ0IGxpZmUsIGlzbid0IGl0ID8KPiAKClRoaXMgcGF0
Y2ggaXMgbm90IGludGVuZGVkIHRvIGFkZHJlc3MgYW55IHRhcmdldCBkZXZpY2UgYmVoYXZpb3Jz
IHRoYXQKb2NjdXIgYmVmb3JlIGJ1c19pbml0IGl0c2VsZi4KCk91ciBhY3R1YWwgaGFyZHdhcmUg
dGVzdGluZyByZXZlYWxlZCB0aGF0IHNvbWUgdGFyZ2V0IGRldmljZXMgd2lsbAphY3RpdmVseSB0
cmlnZ2VyIGEgSG90LUpvaW4gcmVxdWVzdCB3aXRoaW4gYSBzaG9ydCB3aW5kb3cgYWZ0ZXIgcmVj
ZWl2aW5nCnRoZSBSU1REQUEgQ0NDLiBCeSBzZW5kaW5nIHRoZSBicm9hZGNhc3QgRElTRUMgZmly
c3QsIHdlIGVuc3VyZSB0aGF0IG5vCnN1Y2ggSG90LUpvaW4gcmVxdWVzdHMgY2FuIGJlIGZpcmVk
IGFmdGVyIFJTVERBQSwgc3VjY2Vzc2Z1bGx5IHByZXZlbnRpbmcKdGhpcyBpc3N1ZS4KClRoZXJl
Zm9yZSwgc2VuZGluZyBicm9hZGNhc3QgRElTRUMgYmVmb3JlIFJTVERBQSBtYWtlcyB0aGUgZW50
aXJlCmluaXRpYWxpemF0aW9uIHNlcXVlbmNlIG11Y2ggbW9yZSByb2J1c3QuCgo+IAo+ID4gU2ln
bmVkLW9mZi1ieTogRGVmYSBMaSA8ZGVmYS5saUBtZWRpYXRlay5jb20+Cj4gPiAtLS0KPiA+IMKg
IGRyaXZlcnMvaTNjL21hc3Rlci5jIHwgMTYgKysrKysrKystLS0tLS0tLQo+ID4gwqAgMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiA+IGlu
ZGV4IDAxZTA1YmFkODY2MS4uNGZkYzhmNzIxMzY0IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9p
M2MvbWFzdGVyLmMKPiA+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gPiBAQCAtMjU3MSwx
MCArMjU3MSwxMiBAQCBzdGF0aWMgaW50IGkzY19tYXN0ZXJfYnVzX2luaXQoc3RydWN0Cj4gPiBp
M2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlcikKPiA+IMKgwqDCoMKgwqAgfQo+ID4gCj4gPiDC
oMKgwqDCoMKgIC8qCj4gPiAtwqDCoMKgwqDCoCAqIFJlc2V0IGFsbCBkeW5hbWljIGFkZHJlc3Mg
dGhhdCBtYXkgaGF2ZSBiZWVuIGFzc2lnbmVkIGJlZm9yZQo+ID4gLcKgwqDCoMKgwqAgKiAoYXNz
aWduZWQgYnkgdGhlIGJvb3Rsb2FkZXIgZm9yIGV4YW1wbGUpLgo+ID4gK8KgwqDCoMKgwqAgKiBE
aXNhYmxlIGFsbCBzbGF2ZSBldmVudHMgYmVmb3JlIHN0YXJ0aW5nIERBQS4gV2hlbiBubyBhY3Rp
dmUKPiA+IGRldmljZQo+ID4gK8KgwqDCoMKgwqAgKiBpcyBvbiB0aGUgYnVzLCByZXR1cm5zIE14
IGVycm9yIGNvZGUgTTIsIHRoaXMgZXJyb3IgaXMKPiA+IGlnbm9yZWQuCj4gPiDCoMKgwqDCoMKg
wqAgKi8KPiA+IC3CoMKgwqDCoCByZXQgPSBpM2NfbWFzdGVyX3JzdGRhYV9sb2NrZWQobWFzdGVy
LCBJM0NfQlJPQURDQVNUX0FERFIpOwo+ID4gK8KgwqDCoMKgIHJldCA9IGkzY19tYXN0ZXJfZW5l
Y19kaXNlY19sb2NrZWQobWFzdGVyLCBJM0NfQlJPQURDQVNUX0FERFIsCj4gPiBmYWxzZSwKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSTNDX0NDQ19FVkVOVF9TSVIgfAo+ID4gSTNDX0NDQ19F
VkVOVF9NUiB8Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEkzQ19DQ0NfRVZFTlRfSEosIHRy
dWUpOwo+ID4gwqDCoMKgwqDCoCBpZiAocmV0KQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZ290byBlcnJfYnVzX2NsZWFudXA7Cj4gPiAKPiA+IEBAIC0yNTg1LDEyICsyNTg3LDEwIEBA
IHN0YXRpYyBpbnQgaTNjX21hc3Rlcl9idXNfaW5pdChzdHJ1Y3QKPiA+IGkzY19tYXN0ZXJfY29u
dHJvbGxlciAqbWFzdGVyKQo+ID4gwqDCoMKgwqDCoCB9Cj4gPiAKPiA+IMKgwqDCoMKgwqAgLyoK
PiA+IC3CoMKgwqDCoMKgICogRGlzYWJsZSBhbGwgc2xhdmUgZXZlbnRzIGJlZm9yZSBzdGFydGlu
ZyBEQUEuIFdoZW4gbm8gYWN0aXZlCj4gPiBkZXZpY2UKPiA+IC3CoMKgwqDCoMKgICogaXMgb24g
dGhlIGJ1cywgcmV0dXJucyBNeCBlcnJvciBjb2RlIE0yLCB0aGlzIGVycm9yIGlzCj4gPiBpZ25v
cmVkLgo+ID4gK8KgwqDCoMKgwqAgKiBSZXNldCBhbGwgZHluYW1pYyBhZGRyZXNzIHRoYXQgbWF5
IGhhdmUgYmVlbiBhc3NpZ25lZCBiZWZvcmUKPiA+ICvCoMKgwqDCoMKgICogKGFzc2lnbmVkIGJ5
IHRoZSBib290bG9hZGVyIGZvciBleGFtcGxlKS4KPiA+IMKgwqDCoMKgwqDCoCAqLwo+ID4gLcKg
wqDCoMKgIHJldCA9IGkzY19tYXN0ZXJfZW5lY19kaXNlY19sb2NrZWQobWFzdGVyLCBJM0NfQlJP
QURDQVNUX0FERFIsCj4gPiBmYWxzZSwKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSTNDX0ND
Q19FVkVOVF9TSVIgfAo+ID4gSTNDX0NDQ19FVkVOVF9NUiB8Cj4gPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIEkzQ19DQ0NfRVZFTlRfSEosIHRydWUpOwo+ID4gK8KgwqDCoMKgIHJldCA9IGkzY19t
YXN0ZXJfcnN0ZGFhX2xvY2tlZChtYXN0ZXIsIEkzQ19CUk9BRENBU1RfQUREUik7Cj4gPiDCoMKg
wqDCoMKgIGlmIChyZXQpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9i
dXNfY2xlYW51cDsKPiA+IAo+IAoKVGhhbmtzLApEZWZhCgo=
