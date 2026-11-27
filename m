Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.20.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795793851;
	b=MLz3peYLqPzTvxmvDlCgZAZf5euoEBF5Hfln98edCe9/OlmYHzEfwpr7UXwhc2CEX97N
	 vQx/0i/gL95ff8sN2NSte9rLrmrWxuOWYPPfURJl4ANKbolbFPP3m5URbOTIO+FSH4OCe
	 eXn268ngfXNzVfsaLJftxQljgt5+sMLC9Td+QvEaracby0Nq6FHcXiKf+ctq9dy1Vs0C8
	 MO+V4yX4Uy+uadUhovK8I4xZDSTD6VJwjDBoie2vmZqAfiYfbOcUosHp49iPebfG4RUS1
	 k8s3oFH+mEAnRdrLUYMGozbwrd6CU5lg47Oq5MOc2heqlhctXfAJoFSEg6iGR87UcdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793851;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-exchange-messagesentrepresentingtype:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=vISqK74N+9BWzskSxp/rLgnwG7D0QPfkIoLOnTR9aW4=;
	b=EBzEsQae48OmcUjykUm1ZF5wtLj17uQ3Ekn/noj3z+gJrmdxBihj+WX1Q7eou09XskBE
	 bsXd/VVvh/f/DyzhG5stw273RVg7VixbaQLY0+zSL8BzN9KzVzcjUDJ9XVwjuy1ATGpi9
	 fVoF8fD1F/SmsDik/yL/npx+NIw5dm6z7RMHUcY410EWPl/c2vxfZ2QeYIl8tjNK85B01
	 AIx5oFfteFdAARceApz5z2Qt1xtojXXnaYNWC3fHDbXfAZLuHoliOyTOIu3X/yc658Ck2
	 8xw65wKUqdTWe35HWSoCRWd2YHqwP9l22PqURIYPViyGwUmPuC3MpU20RZfFwtaqRvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=bynlFepN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.20.7
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazolkn19010007.outbound.protection.outlook.com [52.103.20.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784BD606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 784BD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=bynlFepN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gD3rUj8yzrqzvxs+BHyOUCu3aQDDvSaGvIrUVGhERnNFVlfJAA5zNkRJLan664PChqD77h9Q1Vi+x9jeq+cFokUQpMghEdN5h7J99JVSb7glQ567rPRUg4Qk85XcsCOc2HDhV/8q9qrQlqcA2FOYybCKA+ErBUxnRgtGPuryvP8tjegyD5D1l4/uyUUPuHHjAFko7p7Fp9ZPnerWVO0WYES74Os7L9Qd0Oaze+5/Ec3Jn1qf9kR+Y2Xl8Kl9k3GCfh+PeQsqhw6mBM4tntxJsAuf+A+fvYPmihg0jhOC3UyiPS11x69VuQzNrKCQNkGQwcwn1jL9RfEIG1qodilg/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vISqK74N+9BWzskSxp/rLgnwG7D0QPfkIoLOnTR9aW4=;
 b=kMOrxTPXBnLEwHJJzzVN08brro0YC7LMnvj7DBLK/bw6u4arr2VPGZWvuUMTWSBkgFIzPHPpZmRvYnL5sZVfRK7cXCEi3DuJndQLxUiOcFhYO0ZBUKTT4EFKJM593NPVGi6fzSETVEGm9dknG8V3kdHQxdnQOeF5+il2bOWXTPbqMphhLugLkSmDO+twCBKBhM+lsLigYpxoeiLaFm5Dk2BM7Fzn9jDQJRc3O53p7DE4EgkvWbVl74ZUCOfhG6SQAnEKMWFYQBQocqqoNjAm4DSLVX95tlRAaixpinuwbPCP8m/2B2/FlTyNq1BdH9upFuDzEys8F9jouZ/bcMgLNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vISqK74N+9BWzskSxp/rLgnwG7D0QPfkIoLOnTR9aW4=;
 b=bynlFepNDQL4vRvs0LUTWKz9BTdr2m/iG8ufzKj42bUefIgCkZVaesZ7qgr1HLBMVWpW235Y1pDIc1X8GSmruzCkZcileA80b1TOL6t2wtnPGx4bMJHRd6t6IAet/6LieAxePYjRsu6QT2g+bbd43mo7s/CdGD55r8XPESU98Gu0En1WNPnuY7JU+kk/HW3Sf3XkW9Yg3hvkFhvmFJYv+frgTww2t3puPzMNUCOp3GAE4V7A8lqnBFWA2c0o2UtZaLnJ/dyGYnw5pnME3EmeRMPd0BGSnp547rTQiE6lifaeU5+FtN4j848ooeRF6UD47xLYFAa/SFSe2aToLLyS6A==
Received: from CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:29::14)
 by DSVP221MB000345.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:382::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 15:37:28 +0000
Received: from CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM
 ([fe80::bde4:f456:ea01:16a2]) by CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM
 ([fe80::bde4:f456:ea01:16a2%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:37:28 +0000
From: James Buck <jbuck2005.linux@outlook.com>
To: Chen Yu <yu.c.chen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Ingo Molnar <mingo@redhat.com>
CC: Andrea Righi <arighi@nvidia.com>, Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Valentin Schneider <vschneid@redhat.com>, Usama Arif
	<usama.arif@linux.dev>, Tim Chen <tim.c.chen@intel.com>, Yi Lai
	<yi1.lai@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "chen.yu@linux.dev" <chen.yu@linux.dev>
Subject: Re: [RFC PATCH] sched/fair: Expand SIS_UTIL scan depth for small LLC
 system
Thread-Topic: [RFC PATCH] sched/fair: Expand SIS_UTIL scan depth for small LLC
 system
Thread-Index: AQHdflTz5D6G/Tm4h0aEWTpHQQtqt7dCDVy8
Date: Fri, 27 Nov 2026 15:37:28 +0000
Message-ID:
 <CY5P221MB0926FCB31B205A45024736C2BD412@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM>
References: <20261127094038.3422499-1-yu.c.chen@intel.com>
In-Reply-To: <20261127094038.3422499-1-yu.c.chen@intel.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5P221MB0926:EE_|DSVP221MB000345:EE_
x-ms-office365-filtering-correlation-id: 244fc68d-f8a3-4fbb-fa86-08df4c9c581f
x-microsoft-antispam:
 BCL:0;ARA:14566002|37011999003|15080799012|15030799006|24021099003|31061999003|8062599012|8060799015|19110799012|51005399006|4140399003|25010399006|4302099013|3412199025|440099028|102099032|1602099012|40105399003|10035399007;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZYuKFyQF4pTcQNkFPdoe7Z09ebgfI0J0MKKysQtOeCuCBqqTIqlaainiFb?=
 =?iso-8859-1?Q?18B+CVMHkS85i0nwu9ttLkvkTwxx1ST2RDpIP18VF4NrbQgZESnz0fEKe3?=
 =?iso-8859-1?Q?89qznqtu1F4fVSbZN0gkAUXShSvniTA3/WbQnzRHQwlYzxgBpFtZwNIcs7?=
 =?iso-8859-1?Q?B38XreESjSEKA83T0b+3pObVBuw6pOBDaszsStIkkN4YaePy/paRKNVvzG?=
 =?iso-8859-1?Q?txdl+I0rhOQscxAg9VmT1MbNZ2KX15GaxpF4JT9cFakUwxHxVXQEASIxJY?=
 =?iso-8859-1?Q?C+E6bJOu0713tCZ6XsVsq4P/TRfaReSaRGcAyv1VUrh85j2sZkOtXstFDj?=
 =?iso-8859-1?Q?N3X0Z3aX92GkhowPqbADVjisT5NY0sHhF3EvZccX1xq1zhSjHrU5czGKUj?=
 =?iso-8859-1?Q?0qq4RIH/oJf4BzDPpBt7NcjPy6+MSn1Jp63QYSLFyoodMAErn56ZbpOMFD?=
 =?iso-8859-1?Q?vgYDOmFOWqGEnS8IiUEuyN1Kz4TKFfDeeDg+Q+PVwYBdAY7pmt2sBX67SL?=
 =?iso-8859-1?Q?w6lvjlNBce2Joz+LWr8oa4arbDN18zuwEkNphZivpWY7Bf0Zp2ZBUQrLA3?=
 =?iso-8859-1?Q?WTU8p4HzoHtpp9NxEjDqA5GWtIhyjbMSZy5+vNzar2i8sKA9iWQIb76BxO?=
 =?iso-8859-1?Q?iYqDgmDK7/b77m1hI2fY+uJurQx64kv6jP5SUAfidhJYYLh/Pn13mtnef7?=
 =?iso-8859-1?Q?p7jBnjnQRk46f+WfEN4RIUgJlgP/sYWlztJD9noik3g8pdf8Udhn2ana9U?=
 =?iso-8859-1?Q?mLkCgy2zVTzewfBfGOhGgoVdm/ZnGggqUbhaQAFPo03+ne64/TuQZP5gqF?=
 =?iso-8859-1?Q?cmWQOf5RbIHDN/bXrPyb4oqydjn+II3EPUNJCLlXXCS3K2zApc1ziVFYqs?=
 =?iso-8859-1?Q?ifghBbqIY4uQW6oCmC+Ypj6edDPLj7mQfD+d0NqaX1i9uGbJZwrJueZ4xk?=
 =?iso-8859-1?Q?xLXQoLnYd+qtZJVexqksGHXaWjv5Dcq5nkz9SSGsw2yb28HYUTx5a80uiR?=
 =?iso-8859-1?Q?nfK4QwdntWWOOxdhLDQwIwgqC3AC4p2WeSM9mv+SlQp5MA6LQQ98Ib93Nz?=
 =?iso-8859-1?Q?jrK6P2iZkZz1fKYvQ5irXyw=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OvnxDn6Ty+4kEYMY3BokNLa73bbQwK1Oyil2LAtXNuERBdwj8aJRnbMF81?=
 =?iso-8859-1?Q?pFWLHbIOPQkQdej5RUr7BnlXqOOxn8QYSUhGMLilm979YSt1k1qbjV6kXL?=
 =?iso-8859-1?Q?gtG2ZJ5Te4fEPSYtpCl+t/VB4hvmWDVjXZahP+OjaQLHgo5/19jtQ7ycJg?=
 =?iso-8859-1?Q?xeF9DT9BP2ue9eia6qfDbIxO6qOoxgM9Hwu7meLslYBSlIk92cJV2l9oec?=
 =?iso-8859-1?Q?qbr+RE8+rXN6qK4gSd38F9rRChQcSkeH2dzMB+XIqmravb29KZ20UwZ1Ep?=
 =?iso-8859-1?Q?OmoRz6/y95tVnnHD8kNikFWi4zpZx1qIS1pnLzsimCc0yvcSczRWyCdZaE?=
 =?iso-8859-1?Q?dNQpcxZv9rG33YQCE9yX4Eg41UQTGUxeuJaMAJxRA1A3tiud7txcewPId3?=
 =?iso-8859-1?Q?KSp2GOFTBWsyvXFZ594u7E5rusZHr1n7989NyTMMo8IYRax1RXxs5iODd2?=
 =?iso-8859-1?Q?6Fn9Fso1dUs61EPXLjJDdaZJX5aKErWqGGVHAdb0OvzKxVoGlaC1Hq6dbT?=
 =?iso-8859-1?Q?icLFi1lApbj6/E/pSoQRY0n74Y5yfG822AcpkESYApM8ZEannXNdiCbWe0?=
 =?iso-8859-1?Q?ZI8mPuSGZuDu64Pnp9KL59+uVmnjOGftFhAsYC2RoCEFuLVw932PGEz4V2?=
 =?iso-8859-1?Q?oVvOklIsCnGKRE4qbHMQPgZi1gjPYQ5gsCc/RcZ4YLGKCa0BoKRJ7A8xDB?=
 =?iso-8859-1?Q?1NlYwctD4b1RI2Dqb0A5wxslYC5QDGQ7QplaIQ1BvP6Z2s+SFHO/8zAVUs?=
 =?iso-8859-1?Q?pYejzCEUMAfOKI5yV4cmH0d4YHThhkg2OJoY8rfJvVkveTXzCyBZyRzhCl?=
 =?iso-8859-1?Q?ZVPbRzKcrY6Px0v5R8v25rm6PsyTwvENpx/aFwV/IJaD0/eM6i0VfFJqBx?=
 =?iso-8859-1?Q?cmZsW2Ii5nBh7eobeFeVvrOpWTpusaM0yMc7zWQge7AKhOo0SsmbsmAiBK?=
 =?iso-8859-1?Q?J9XEEkaZONN+d0SROmfDNhF0o2E3Hhuh7FLvdClIVxp+Wx//HmFHxhZof8?=
 =?iso-8859-1?Q?K+ctcJ6i+abw9EPoc/JsK1BTa92nT1hlllLLwDnMYiH6iAdl8iU26Puia0?=
 =?iso-8859-1?Q?xVQLSzTV7UfKR9Zt8FMcLKOAStU1BQcP5c2qEct+62paGf8gis6lPCq0H1?=
 =?iso-8859-1?Q?QHuC7LP6hdnPPbeCG6MuL5UGXBLi1DGS9bmhOAaCp4TTeqq+wHScEi6yp+?=
 =?iso-8859-1?Q?vkFZ0vE/R82cJt7KKLmyKwr3NExvKPJPegnjTXr0kqPESgWE0CEeE7CnjI?=
 =?iso-8859-1?Q?EhkjEB2EzRS8XQ3XoZpWmEImCPQ4cI8cjBTfKB4FQibyZ9qtdEuspsR4TZ?=
 =?iso-8859-1?Q?IF4v/p+6yPBnt8mmdk6y3gSPM9lfLd1AHWnDHJ1ut7r7wS0lSlschsuEdW?=
 =?iso-8859-1?Q?nOS+jiCJ/FUnN1cd+52g/rAFF8/VA52NwN3sJBP43kgt8MX9LZVGM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 244fc68d-f8a3-4fbb-fa86-08df4c9c581f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 15:37:28.6743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVP221MB000345

Hi Chen,

Tested the formal patch on the same board (CIX P1: 8x Cortex-A720 at capaci=
ties 1024/984/905/866, 4x Cortex-A520 at 279, one 12-CPU LLC), on v7.3.5 wi=
th my local select_idle_capacity() workaround removed. llama.cpp on the CPU=
, Qwen2.5-1.5B Q4_K_M, 8 threads, llama-bench pp512 / tg128 in tok/s:

  v6.18                                                                 123=
.5 / 36.5
  v7.3.5                                                                109=
.2 / 30.0
  v7.3.5, NO_SIS_UTIL                                          121.5 / 35.5
  v7.3.5 + this patch                                            121.7 / 35=
.8
  v7.3.5 + this patch, NO_SIS_UTIL                      121.8 / 35.7
  v7.3.5 + this patch + idle floor                         121.6 / 35.8
  v7.3.5 + this patch + idle floor, NO_SIS_UTIL   121.1 / 35.8

The patch fixes the regression here: with it, SIS_UTIL on and off are withi=
n noise, and both match v7.3.5 with SIS_UTIL off. Your idle-CPU floor follo=
w-up makes no further difference on this 12-CPU LLC, as expected, since the=
 scan depth is already full there.

Tested-by: James Buck <jbuck2005.linux@outlook.com>

Thanks,
James

________________________________________
From: Chen Yu <yu.c.chen@intel.com>
Sent: November 27, 2026 4:40 AM
To: Peter Zijlstra <peterz@infradead.org>; Vincent Guittot <vincent.guittot=
@linaro.org>; K Prateek Nayak <kprateek.nayak@amd.com>; Ingo Molnar <mingo@=
redhat.com>
Cc: Andrea Righi <arighi@nvidia.com>; Juri Lelli <juri.lelli@redhat.com>; D=
ietmar Eggemann <dietmar.eggemann@arm.com>; Steven Rostedt <rostedt@goodmis=
.org>; Valentin Schneider <vschneid@redhat.com>; James Buck <jbuck2005.linu=
x@outlook.com>; Usama Arif <usama.arif@linux.dev>; Tim Chen <tim.c.chen@int=
el.com>; Yi Lai <yi1.lai@intel.com>; linux-kernel@vger.kernel.org <linux-ke=
rnel@vger.kernel.org>; chen.yu@linux.dev <chen.yu@linux.dev>; Chen Yu <yu.c=
.chen@intel.com>
Subject: [RFC PATCH] sched/fair: Expand SIS_UTIL scan depth for small LLC s=
ystem

It was reported that scanning more CPUs on a system with a small LLC
benefits the workload more than limiting the scan depth, because
scanning more CPUs does not cost much and work conservation is
preferred.

Expand the scan depth so that systems with fewer than 32 CPUs per LLC
behave like a 32-CPU system. This way, the scan number can be scaled up
for such small systems.

The effect is as below:
nr_idle_scan before -> after the patch
(LLC =3D 8, 12 and 16 CPUs for example)
Cell format: util_sum : nr_scan before -> after
Load% =3D util_sum / (llc_weight * 1024)

  Load% | LLC=3D8            | LLC=3D12           | LLC=3D16
  ------+------------------+------------------+------------------
   10%  |   819 :  7 ->  8 |  1228 : 11 -> 12 |  1638 : 15 -> 16
   20%  |  1638 :  7 ->  8 |  2457 : 11 -> 12 |  3276 : 15 -> 16
   30%  |  2457 :  7 ->  8 |  3686 : 10 -> 12 |  4915 : 14 -> 16
   40%  |  3276 :  6 ->  8 |  4915 :  9 -> 12 |  6553 : 12 -> 16
   50%  |  4096 :  5 ->  8 |  6144 :  7 -> 12 |  8192 : 10 -> 16
   55%  |  4505 :  4 ->  8 |  6758 :  7 -> 12 |  9011 :  9 -> 16
   60%  |  4915 :  4 ->  8 |  7372 :  6 -> 12 |  9830 :  8 -> 16
   65%  |  5324 :  3 ->  8 |  7987 :  5 -> 12 | 10649 :  6 -> 13
   70%  |  5734 :  2 ->  8 |  8601 :  3 -> 10 | 11468 :  5 -> 10
   75%  |  6144 :  1 ->  7 |  9216 :  2 ->  7 | 12288 :  3 ->  7
   80%  |  6553 :  1 ->  4 |  9830 :  1 ->  4 | 13107 :  2 ->  4
   82%  |  6717 :  0 ->  2 | 10076 :  0 ->  2 | 13434 :  1 ->  2
   84%  |  6881 :  0 ->  1 | 10321 :  0 ->  1 | 13762 :  0 ->  1
   85%  |  6963 :  0 ->  0 | 10444 :  0 ->  0 | 13926 :  0 ->  0
   86%  |  7045 :  0 ->  0 | 10567 :  0 ->  0 | 14090 :  0 ->  0

It was reported that with this change, the regression was fixed on Orange
Pi 6 and Radxa O6. Since Intel servers usually have >=3D 32 CPUs per LLC,
this change does not impact Intel servers much. AMD servers have 16 CPUs
per CCX, testing on AMD Milan showed no significant difference on
redis/mysql, and a slight improvement on hackbench/schbench:

  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  hackbench threads+pipe
    num_runs:      5
    host:          AMD-Milan
    kernel:        7.4.0-rc4-sis-patched+
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  G   FD  | baseline s/se% | patched s/se%  | SPEEDUP | RESULT
  ------------------------------------------------------------------
  1   1   |   6.352/ 7.57% |   5.680/ 5.74% |   1.12x | noise
  1   2   |   6.225/ 8.75% |   5.624/ 7.27% |   1.11x | noise
  1   4   |   8.834/10.23% |   8.799/10.24% |   1.00x | noise
  1   8   |   4.833/ 1.70% |   5.060/ 1.72% |   0.96x | noise
  1   16  |   5.471/ 1.61% |   5.551/ 0.60% |   0.99x | noise
  1   20  |   5.220/ 1.17% |   5.298/ 0.82% |   0.99x | noise
  2   1   |   5.558/ 6.23% |   6.114/ 8.63% |   0.91x | noise
  2   2   |   8.056/10.44% |   8.029/12.53% |   1.00x | noise
  2   4   |   5.292/ 1.26% |   5.152/ 1.89% |   1.03x | noise
  2   8   |   5.493/ 2.15% |   5.403/ 3.38% |   1.02x | noise
  2   16  |   5.557/ 1.68% |   5.407/ 0.88% |   1.03x | noise
  2   20  |   5.224/ 0.68% |   5.341/ 1.19% |   0.98x | noise
  4   1   |   6.047/ 2.89% |   5.797/ 4.41% |   1.04x | noise
  4   2   |   5.597/ 2.19% |   5.791/ 1.77% |   0.97x | noise
  4   4   |   5.397/ 1.62% |   5.501/ 1.18% |   0.98x | noise
  4   8   |   5.468/ 2.67% |   5.155/ 0.95% |   1.06x | IMPROVED
  4   16  |   5.989/ 3.31% |   5.507/ 1.36% |   1.09x | IMPROVED
  4   20  |   5.267/ 0.79% |   5.101/ 0.60% |   1.03x | IMPROVED
  8   1   |   5.322/ 3.12% |   5.273/ 1.96% |   1.01x | noise
  8   2   |   5.531/ 2.38% |   5.367/ 1.64% |   1.03x | noise
  8   4   |   5.672/ 0.70% |   5.814/ 2.60% |   0.98x | noise
  8   8   |   5.037/ 0.93% |   5.100/ 0.97% |   0.99x | noise
  8   16  |   5.455/ 0.45% |   5.290/ 0.39% |   1.03x | IMPROVED
  8   20  |   5.388/ 0.36% |   5.285/ 0.18% |   1.02x | IMPROVED
  16  1   |   5.519/ 2.49% |   5.296/ 2.10% |   1.04x | noise
  16  2   |   5.398/ 0.77% |   5.503/ 3.05% |   0.98x | noise
  16  4   |   5.274/ 1.72% |   5.363/ 1.72% |   0.98x | noise
  16  8   |   5.416/ 0.37% |   5.185/ 0.20% |   1.04x | IMPROVED
  16  16  |   5.596/ 0.41% |   5.337/ 0.24% |   1.05x | IMPROVED
  16  20  |   5.292/ 0.88% |   5.076/ 0.55% |   1.04x | IMPROVED

  redis (redis-benchmark -t set)
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  THR | baseline rps/se% | patched rps/se% | SPEEDUP | p99 ms b/p  | RESULT
  -----------------------------------------------------------------------
  4   |  1492165/ 0.76% |  1480823/ 0.00% |  0.992x | 0.541 0.546 | noise
  8   |  1665556/ 0.01% |  1665501/ 0.00% |  1.000x | 0.490 0.489 | noise
  16  |   984279/ 0.60% |   974545/ 0.00% |  0.990x | 1.124 1.109 | noise
  32  |   887091/ 0.01% |   883212/ 0.44% |  0.996x | 1.713 1.721 | noise

  mysql
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  THR  | baseline tps/se% | patched tps/se% | SPEEDUP | p95 ms b/p | RESULT
  -----------------------------------------------------------------------
  8    |   151897/ 0.76% |   152428/ 0.54% |  1.003x | 0.07 0.08 | noise
  16   |   294014/ 0.59% |   296699/ 0.28% |  1.009x | 0.07 0.07 | noise
  32   |   386817/ 2.18% |   377835/ 0.31% |  0.977x | 0.09 0.09 | noise
  64   |   560950/16.97% |   481494/ 5.68% |  0.858x | 0.19 0.23 | noise
  128  |   752079/ 4.92% |   729685/ 3.89% |  0.970x | 0.36 0.38 | noise
  256  |   772771/ 0.62% |   771630/ 0.21% |  0.999x | 0.79 0.78 | noise

  schbench
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  T   WRK  METRIC   | baseline/se%   | patched/se%    | SPEEDUP | RESULT
  -----------------------------------------------------------------------
  2   8    rps      |  1683.8/ 0.04% |  1681.3/ 0.10% |  0.999x | noise
  2   8    wake_p99 |    10.2/ 1.96% |     9.8/ 3.82% |  1.041x | noise
  2   8    req_p99  |  4904.0/ 0.00% |  4904.0/ 0.00% |  1.000x | noise
  4   16   rps      |  3369.0/ 0.03% |  3353.9/ 0.44% |  0.996x | noise
  4   16   wake_p99 |    10.0/ 0.00% |    10.0/ 0.00% |  1.000x | noise
  4   16   req_p99  |  4904.0/ 0.00% |  4904.0/ 0.00% |  1.000x | noise
  8   32   rps      |  6724.6/ 0.04% |  6722.0/ 0.16% |  1.000x | noise
  8   32   wake_p99 |     9.8/ 2.04% |    10.0/ 0.00% |  0.980x | noise
  8   32   req_p99  |  4904.0/ 0.00% |  4904.0/ 0.00% |  1.000x | noise
  16  64   rps      | 10933.0/ 4.10% | 11179.8/ 1.80% |  1.023x | noise
  16  64   wake_p99 |    12.0/ 0.00% |    12.0/ 0.00% |  1.000x | noise
  16  64   req_p99  | 10051.2/ 0.13% | 10051.2/ 0.08% |  1.000x | noise
  24  96   rps      | 12970.1/ 0.22% | 12971.0/ 0.48% |  1.000x | noise
  24  96   wake_p99 |    13.4/ 3.81% |    12.4/ 1.98% |  1.081x | noise
  24  96   req_p99  | 10179.2/ 0.21% | 10185.6/ 0.21% |  0.999x | noise
  32  128  rps      | 12613.1/ 0.09% | 12667.2/ 0.11% |  1.004x | IMPROVED
  32  128  wake_p99 |    37.2/ 3.55% |    34.2/ 1.43% |  1.088x | IMPROVED
  32  128  req_p99  | 10467.2/ 0.59% | 10358.4/ 0.06% |  1.011x | noise

Fixes: 61ea17a63719 ("sched/fair: Add SIS_UTIL support to select_idle_capac=
ity()")
Reported-by: James Buck <jbuck2005.linux@outlook.com>
Closes: https://lore.kernel.org/lkml/CY5P221MB09262B7D6A68954CC1B3199FBD442=
@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM/
Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
Tested-by: James Buck <jbuck2005.linux@outlook.com>
Signed-off-by: Chen Yu <yu.c.chen@intel.com>
---
 kernel/sched/fair.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index da0d9e19c457..1c0e2ac7751d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12937,8 +12937,9 @@ static void update_idle_cpu_scan(struct lb_env *env=
,
         y =3D SCHED_CAPACITY_SCALE - tmp;

         /* equation [2] */
-       y *=3D llc_weight;
+       y *=3D max(llc_weight, 32);
         do_div(y, SCHED_CAPACITY_SCALE);
+       y =3D min_t(u64, y, llc_weight);
         if ((int)y !=3D sd_share->nr_idle_scan)
                 WRITE_ONCE(sd_share->nr_idle_scan, (int)y);
 }
--
2.25.1
