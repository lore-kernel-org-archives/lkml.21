Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795617808;
	b=F8vT8+YKSO82dKuOlsFmHjlCqsVfNGQLMx/ZkV99S9aMIp6vWs9FKbRuKCf6TIwocPbL
	 2/PWmKBMK9eueRiWWmlSFRKuXC9lD2ZP5SfTkb7VwsK6BTqB6byeXGXr5l4PcpfAxYujN
	 QlNA6GLyZqo61QVwJLnCzb1xZDfylXxo9rLqdWFFVj3smRhHm8/T4aZmyFaLrIGC5f3eO
	 sNF3poa5A35RztDuBjhPD4Ty4Wk8Dih9NRNbGhwnMZ+EHbZerHQS9o9drkjWSWmkV6/Oj
	 a6jPinzTHG7t+xWZ9TcQZtG6RqSG1C62cJrfuqKq9Rp2myBAHzH5YrGXcg3M0MODqQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617808;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=bV92rH+bG4YRQ2nDulXzGyi6iqZ60esAK/FYPCj2V4M=;
	b=ChIY4w/ArCHsBwkw3Rc5qqXt2DftjlmcttFv90o+5j4eqd5zduDq6MmYJVOKm1tFN65L
	 jVtANZBn+7ZgoZMtv74qq4PEdqtjo3NSZJwUP34u6uNbDHGvOIGE96eCRYW1wGGkQNshs
	 TCvyefFyBDbdn9Rg7ACuKTGrP3ZVkhUwrbwdKBVl0z8pStVwzu4KeejEypGxZUWKDxAR6
	 arEEC0+r/vEpdy7zg+b+oTwKs6JS5IzGtucAxRMIQdZhezjIWmrKRwYWZMr6adgyP+gui
	 Kp5CruQhQ3GQG6VHlw11KalgiRL++8ZO0SRJcROq7F586BjMLrfc43IifSwZH0Nn+1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=AyS3g83N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.62
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010062.outbound.protection.outlook.com [52.101.229.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CAC606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3CAC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=AyS3g83N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZtgGAlzG7KWWydf8G3AULadN2wvhPmK8OiaPnEQ/JAKSVz2eRhIZaYgyZzYhtXm3m9tijRZeWaFajrdUwGGg1oz3C3sW4uGZObezQsNyrA2C0/YDoUJxiaQ4b4lAhC2HT2BvlRHK+XUtgfukJsVU0hMEMJpHKV7cguxe5H7F7NdVLX1ykib94vRaiBULdOMd1wSN/IkP3V8Ml90gFkHdD1VQTswubdT+5A+cZYcOmPkq+zyNM9qIBquXWJjIwm0xPPX/CtfWPKMog3qVS21KGUwznsEVRmQRrfUAoWn2zGky2rn8AGwmQn9z2dC8cgcoSQx7XAA6XHKTwyyG24uaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bV92rH+bG4YRQ2nDulXzGyi6iqZ60esAK/FYPCj2V4M=;
 b=rDSUulhetCLj0En9cqj2A0dz7K7+UBSSlZefJHVJudb4SeZ4ofksQYHY8r+Bhds5A6/Qjr2XzdbQLAYw8BJIhkfHUdxmho3BEU7FCXzXUPqg5VHG+Pwo1s+TS001hoIJ16mAa0lIo5Bdll1/u9LsoSFcUubAlitBMUFIFkXQ6Qqv40z5z8teSsvLhilaJ7H2t7NSUSkzRWkkXCk8PZTXfnoe6n/OTf8TBTbIPhD+CBY7Q4SrG5CFSh8RndLDAllGQ3MI0nl+XZNk/qrkeojKfNbk5usFD1QOAkqTU3OhabeQGBNyHeSO5mD+nlrcUKDR2iQZSSTVTcSBqiar77tNbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bV92rH+bG4YRQ2nDulXzGyi6iqZ60esAK/FYPCj2V4M=;
 b=AyS3g83NB62DYWKLaWrh67G8IDGB0eDf5HXqXiOi17/8hk8JG/jB4iAm6rVKp2yuDlYIzfVH/tT0EcvO2yVdVcJNsDjIlG4bIvJwfrKrezdsJMGKGl10yxCJ4MS8cysazUmJ2p2NtRb2fIN3lP7bfxBTf3kpUm+6c3kKWlqjUcg=
Received: from TY4PR01MB443929.jpnprd01.prod.outlook.com
 (2603:1096:403:707::18) by TYYPR01MB7975.jpnprd01.prod.outlook.com
 (2603:1096:400:fd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 14:43:23 +0000
Received: from TY4PR01MB443929.jpnprd01.prod.outlook.com
 ([fe80::82b2:2570:827b:3e2a]) by TY4PR01MB443929.jpnprd01.prod.outlook.com
 ([fe80::82b2:2570:827b:3e2a%5]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 14:43:16 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Vlad Poenaru <vlad.wing@gmail.com>, Prabhakar
	<prabhakar.csengg@gmail.com>, Ingo Molnar <mingo@redhat.com>
CC: Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Chen Yu
	<yu.c.chen@intel.com>, Christian Loehle <christian.loehle@arm.com>, Alexey
 Charkov <alchark@flipper.net>, Prabhakar
	<prabhakar.csengg+renesas@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel-team@meta.com" <kernel-team@meta.com>
Subject: RE: [PATCH] sched/fair: Fix h_nr_runnable leak in dequeue_hierarchy()
Thread-Topic: [PATCH] sched/fair: Fix h_nr_runnable leak in
 dequeue_hierarchy()
Thread-Index: AQHdet9SwwK0sZTucU2wIY0K97T0b7c+3HSAgAADm7A=
Date: Wed, 25 Nov 2026 14:43:16 +0000
Message-ID:
 <TY4PR01MB4439291AF94A62433D8B56E932AA432@TY4PR01MB443929.jpnprd01.prod.outlook.com>
References: <20261123001213.7609-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261125142729.3161777-1-vlad.wing@gmail.com>
In-Reply-To: <20261125142729.3161777-1-vlad.wing@gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB443929:EE_|TYYPR01MB7975:EE_
x-ms-office365-filtering-correlation-id: ff9f72ff-0af8-42f6-e3e1-08df4b0270bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|38070700021|10067099003|56012099006|11063799006|261022105027099003|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261009223027099003|22082099003|18002099003|4143699003;
x-microsoft-antispam-message-info:
 WhGsas/LAH7FULBob88/Agp0wp7iKzkupY9V46CWb3bydcunKe8bG1DIN1j+RM9Ri6H4PbC1/AYsAjh0ft95+me5lG0NnXQkrBcQZV220mdMuaxNWemN03MGqJGEN4NWOPWDEvo4Y8CYU0vKx6WeXXYPKko/WF8GxETI4Cv4KAcem7LbUhGnGNnY70YvIf5rMbUHNn+Z549rSK3oaAhgOVJKnYvzK4Z8ZKUZWmPbPXQtnKt9TkuaXwVZ3UapICSmvkhTgMtXEQXMcB8X7D42KTtoPFj/7KWTFXDG7ciPOAIR+pox1fhqwKyHTZY/UhyOg+SXwofmgam3c2R5IThaOpUJDFpLhnUru7L6w5TOMxGACWODnFaHAGWFXcd2oM+/6/KWurbie9JuHA1QxClAItr8lFoOKAXM3c7yH02lQaBz1QO6RH5ZOiDm0Y1CFkn1r0eEgmhT/rjlsD5KkdVFaUDezoPRAXaAsoocKQwcFdR483GR9faa1HuQ5NKeIuE/4f+gEjNc9pWK/DfY9k/vv2KgDx/IycaLRrEiDUC0QsgylMMYuq1/XwDYO7wtA3bn9WmpHu3NhS9vU8PZyCa13eeLIi19PBTAnIn3fD97Cy1P77UsFv9iIFuh6F5xHcMPlizCtcUkHCytW1r8VasHkXMYG7xJcC0K5CWHiJhFastAQs8etn1nfXYbmctDufoBi9QJduCCUjCaUBdsD/Uy3ukEHY3WQBTxMJn66huIBFc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB443929.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(38070700021)(10067099003)(56012099006)(11063799006)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261009223027099003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?j/r6CHS4oGNm8sPN3lS0QIwi3ha+RFnz8npgXZk+/YDLpeMarPdctSn2QBOY?=
 =?us-ascii?Q?MsE6yWLo3yAJ17y70twNcnRX+s/Gua5r4+mVB8e/wBHkjrWikbbM1d6DfkBV?=
 =?us-ascii?Q?HxGvAgpiyjhK0Vc5uFWZgw7GZ7brkqLbN0tzOGq5Bkk5aTnxmFlCggJYXIo5?=
 =?us-ascii?Q?k+BS9ovt35ubrOKWCy1BJDba3qS+meKb/dWGFqFVzkB2xkCFQ6cQTyYrKlys?=
 =?us-ascii?Q?pqN03/eL5dXer/+x1f2Y1pZVBlRP5Ei3iMUS6CHpQRVDzDcyvsQPgVFpTFql?=
 =?us-ascii?Q?k9ApNmyDTuACnlh0kFD3r7f8+S7QydxEnQ+0DPBnCtmDVy7BYRdi0c1hM3tz?=
 =?us-ascii?Q?MePtEf/c2U2BEq/qRT/jGxdgdRG4lcBC7jB0R3KqjXtxORzFmBwSFrwx7j2l?=
 =?us-ascii?Q?uNBYGgrBb3Yc4TNEvz19CahjYDlImWBcLDipxxHmojqE64C0f7tHz+Cd2Kid?=
 =?us-ascii?Q?LYx4lsVfIYoKm506Wl7uGqxu4RdaFgXSaYniJY9/Qvv2DK0qEA/f64EuyiBo?=
 =?us-ascii?Q?uePM93jGlI8RUV+/VCy8q1yAdYfO6bXG3VfYFMFwtf7BRT0Ykna4yQWZRyDP?=
 =?us-ascii?Q?JQBs2MPRZ6OQdkDwpqqb2sg4jxAxlG4HoryBLc5xnbl+1PmhV5CAQMMGGFFJ?=
 =?us-ascii?Q?Wu858D8rK0aQS6dv4za7Mfi+1cXByRj9Qf7N/uWgFsuvqHrvGW1IIcQquSmo?=
 =?us-ascii?Q?zvs8f6HcdHnVASJD3nJ3AUhJceVqA16KFlmHxWyvPKXQ+fgE4DuQ/TdSAbY4?=
 =?us-ascii?Q?DyPoSQqHbZlSgxfzcXEURe8QkhJmX99Xr1IfFx9v/qmNSB8TjwhbPWH+UI/R?=
 =?us-ascii?Q?MQ/TJFPvD7jhZKQDOqc91SUOflakguWDEGl+IjsrdIWVZrno60WKZIbvlXJ8?=
 =?us-ascii?Q?qF/uf/NGk3TgQvE1sW24WW4byij2LmYsryWHZtonYy8QTUYEc8W94rXkHb/c?=
 =?us-ascii?Q?3i803EWo3I1NcYgeYdQoc28p4vZ2Bqz83Dzf3UyoxOvB24e6j+Szxz2SlxLN?=
 =?us-ascii?Q?apc5c3hablSLaQ8+7AnWONOZoGQyCtwV4E6BYKNO7EfUe4GY2d5wtTr/2Idk?=
 =?us-ascii?Q?bbmHLJhMd2/+Jzx0ErPK15fNm5u4evK1LRc6dG07W4hBT01V/60qjcoz9wa7?=
 =?us-ascii?Q?AXSi/SXlB3G8KiHwbQUVXHRTH6WM8xt7QsjSDOzOvKjA3klZV5cQ4+pSvO8X?=
 =?us-ascii?Q?hig7bM/65zYECwqPg6CcNmgS+N++rVwYuelUnLov4BkTDpnnHI2ppNAkigdP?=
 =?us-ascii?Q?IOqgiH5+2kgcV1Bc38UYVbxJM4C3fKmb1dP5REs2cjWKQDaw+eicUgUF3Jgl?=
 =?us-ascii?Q?7drgWoi/8GAfxx5Twk2V5bCubKF+Pk332woXpr+Ml1yKCPfSiVecxnKesvQw?=
 =?us-ascii?Q?U3xyyG0Bby0NW076+6VQfYbrqVWIx9tvRKnTQvokI3B4MPmmRHBZajCPykyw?=
 =?us-ascii?Q?MiZnluaiUv5d0wt2hS+I3yhhwhlskWm2rmaHsUQm5IB51Yo/180NP6fcxkT1?=
 =?us-ascii?Q?tj9425RQ1WBeT7iInLADuVQWI9wmgPdCQsBVdr7PHqpIvxUmiFXO660JhRHM?=
 =?us-ascii?Q?t+oq/FUbJJ6QwqP/x8ZT1L06X9N0zHC03kC/WWa7EMMBo65N3F0+IzwEayCa?=
 =?us-ascii?Q?laAvDWpIBKkvNwLOnMIglmiV4Uophkwef/dCdKyAkF//ZLW804q6rIJJSvks?=
 =?us-ascii?Q?xal6z7+UNQt6DYU5o5/XllQqfm86CCISa2xhlfhXwAbtX7TnTj0hEAaBtC1U?=
 =?us-ascii?Q?xORxAdWlt6KbbhZcip3M2gYDDfCSLF65jH521EVpS0Ifr4CoBr8A?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB443929.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9f72ff-0af8-42f6-e3e1-08df4b0270bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2026 14:43:16.2558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rqihCFyD7Z6Otewig8f7rXpzFiU4e2SFk13fGtXbXdSzpX74M3mMFeAJXTm/6CRLtO3LQWRIWTuRS37992IJ3erw+m8YGCRTR4c+XbeTVZwIf7k/Y3gvvR27WeFoyqF8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7975

Hi Vlad,

> From: Vlad Poenaru <vlad.wing@gmail.com>
> Sent: 25 November 2026 14:27
> To: Prabhakar <prabhakar.csengg@gmail.com>; Prabhakar Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: Ingo Molnar <mingo@redhat.com>; Peter Zijlstra <peterz@infradead.org>=
;
> Juri Lelli <juri.lelli@redhat.com>; Vincent Guittot
> <vincent.guittot@linaro.org>; Dietmar Eggemann <dietmar.eggemann@arm.com>=
;
> Steven Rostedt <rostedt@goodmis.org>; Ben Segall <bsegall@google.com>; Me=
l
> Gorman <mgorman@suse.de>; Valentin Schneider <vschneid@redhat.com>; K
> Prateek Nayak <kprateek.nayak@amd.com>; Chen Yu <yu.c.chen@intel.com>;
> Christian Loehle <christian.loehle@arm.com>; Alexey Charkov
> <alchark@flipper.net>; Prabhakar <prabhakar.csengg+renesas@gmail.com>;
> linux-kernel@vger.kernel.org; kernel-team@meta.com
> Subject: Re: [PATCH] sched/fair: Fix h_nr_runnable leak in
> dequeue_hierarchy()
>=20
> [You don't often get email from vlad.wing@gmail.com. Learn why this is
> important at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> On Mon, Nov 23, 2026 at 12:12:13AM +0000, Prabhakar wrote:
> > h_nr_runnable is therefore always 0, so dequeuing a task that is not
> > delayed no longer decrements cfs_rq->h_nr_runnable. The count only
> > grows, which inflates se->runnable_weight and skews PELT runnable_avg
> > and load balancing.
>=20
> The leak also crashes machines. In Meta's kernel testing, a one-hour
> stress-ng soak on 176-CPU x86_64 machines hits a divide error on our
> internal kernels based on v7.4-rc4:
>=20
>   Oops: divide error: 0000 [#1] SMP NOPTI
>   RIP: 0010:update_load_avg+0x267/0x800
>   Call Trace:
>    task_tick_fair
>    hrtick
>    __hrtimer_run_queues
>    hrtimer_interrupt
>=20
> 15 of the 16 machines that ran the soak on these kernels crashed this way=
,
> and the 16th left no crash record. None of the soak runs on
> v7.4-rc3 based kernels crashed.
>=20
> The divisor in update_tg_cfs_load() is
> scale_load_down(gcfs_rq->load.weight) truncated to u32. That weight was
> 0xfff8000000000000, so the u32 divisor is 0. Once the leaked count pushes
> tg->runnable_avg >> 10 past INT_MAX, tg_tasks() returns a negative int.
> calc_concur_shares() then gives clamp_t() a negative upper bound, and tha=
t
> becomes the group entity weight.
>=20
Thank you for testing.

> This patch is based on sched/core and does not apply to sched/urgent or t=
o
> Linus' tree, where 486c3d06b902 ("sched/fair: Avoid transient double
> accounting for delayed tasks") is part of v7.4-rc4. In those trees the
> h_nr_runnable line comes before the h_nr_idle line.
>=20
@Ingo please let me know on which branch should I rebase this patch.

Cheers,
Prabhakar

