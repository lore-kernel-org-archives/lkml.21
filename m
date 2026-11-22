Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.10.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795382928;
	b=CRcNPbHY1OOOAPvUTsnfKF71PSPf7+2bKq8zzitNwQKeWjAMR+oG0Thg/SGWv28u7KTD
	 lRhm+3Fiaj/nUd5kzIzuUEsFKhINzt0F56zPLkKlT1VG4BbBJ/QyG5R+WUxitBkQMIM9t
	 HV6EBZrYfYs2x7N2W3S1dTFjps3XcilDtzwwuuyq7sprAtLFoO47ceQyDjY2Da4iYy4Is
	 oyWb7/C5SLYsijuVGTAjL61ht2oOs/ePf5GDJgR7BwgeYKy8uiWBh4C/w+RxSm9J150Bz
	 lkglKxeJgToZirJUA4QweBDBhQZ1EeWXr1vDW0shx7FsTAxxJu0wWVxI87MZkMesmFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795382928;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
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
	bh=mxMv+DNZs3vvssWdqD9pyiNuf6ADL1PX8+OtcHD0PdY=;
	b=bCeFmbxZPTF5YUlFZ4/6y2hQDy/3r40FrpuDhSPpknxmZ5Z+RgSQ4FUO0frM41YWCw3w
	 LG8vUQplCTqIRtr8OlU2uDwNIreQkgBYBlIKF8A6J9M60POFRa16vVWwJiRbheMK/IgwQ
	 ykCUOHvhizypV5gKsZBqJAkPRM2bsJpOUO7FN9P925Cb1jygMg+U92g7XLRe+nI3YlDP2
	 hIR87ykRe12w0B/xS4zSu6j5BzJzO7Lsl8m7vbgQtJLG6xNLzD7S7k+mtAtc40TX0L7uH
	 UktCbkUNxTn+fzfJik2b/2+iIh7JCtZi2zSRICCQfZbXCyDmmmLv2iaVTsEldz3dumg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=cbKdtbRc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.10.38
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azolkn19010038.outbound.protection.outlook.com [52.103.10.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D179606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D179606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=cbKdtbRc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xi7IKKil87oXhMLCshzx992Cdugd7J4LqgZUjPmGSqUrzUnVNBecRvlam8R8ELxDzk+1KLgoDx5//xYcL6u+xlsRc1PyFWJYn2jq7hHCLFM+GI2pnYt6XEPCmRiVGNIJoNwQ0+IEF/RuPneOylcwUqWaVpHLmrP3bHS/fRGeI43Hv/zMFmzp5XT2bTztlwqnXr9kndRT27wI/8h2wofOASSAvBIFU7oI0BwShjhQ0x6sthvWSO3AD1tSxVnOksIZUrXK/WlPIBvRPioJ8cpPI7QQ3BQFo2z6ah4B35ebg7immnjNK6CxcWn8UgxGjseQoowm5xHbp47HbrqfKcEv1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxMv+DNZs3vvssWdqD9pyiNuf6ADL1PX8+OtcHD0PdY=;
 b=rrnL21VeKTnY07GFFwSVHKc8LXmmPCW74M+HZrER/8mqcUMZMKPE0edu4+Qbu65WgODr2KKsTWNe2bnKXijj5IcbTJ3lDWswii0FFHC2WiI19FK3LIlMTl3zRxKYQ7m4F8xiAieM6GBBKbLgaEWpCalKvDkiDsVGqxsOsCxBbbTs/pG7HyB1CDaKHYPJO2XO7cncYbJKNS8Way4iAWAI/88yvHLaXpuQuU363jFft6D4h5azktD5mpkcmTPKNMT3ixyRBl1ubWABJiLDz5TSnOmUhgjnxZdSHxZDm0DbNiQvN3ecjci8igwhhtnaL5bkn9M0AxKge8FEgwyH9l5Lag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxMv+DNZs3vvssWdqD9pyiNuf6ADL1PX8+OtcHD0PdY=;
 b=cbKdtbRc2o2ZhOhAzFuQBt33eXiyG0b+69aLuNkMivy2yXt5hiEpRjsq8FTpRCEBNJE3Kvaf7kxD/nRfUTmKGj2ik8VubK5xSvGojigrZ+KJSPyaA6mIN4mzPkmZU2wd6m99K5p5aF+ztDhgdnMdf7CJ4Gkzl65AbTKADv/96DsPwg2sypg1AY4A+F1nGEJabUqMBG00K+nwC9a/9go09PVKbLCXzSjheUtEcz1v6BBkKGWQ0kGEfKXik15XEHSWbH7rskKuS+hhjkaYSOSa9pUi/Nx+HJ/CCXoIAozixhMA2Z57fAr/zk1K/B/ISLOdNcRoGEQW6MPamgVQp+BB8g==
Received: from MN2PR02MB6863.namprd02.prod.outlook.com (2603:10b6:208:1d7::20)
 by SJ0PR02MB8813.namprd02.prod.outlook.com (2603:10b6:a03:3d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 21:26:13 +0000
Received: from MN2PR02MB6863.namprd02.prod.outlook.com
 ([fe80::da67:fd0f:d96d:ac53]) by MN2PR02MB6863.namprd02.prod.outlook.com
 ([fe80::da67:fd0f:d96d:ac53%4]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 21:26:13 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Frederic Weisbecker <frederic@kernel.org>, LKML
	<linux-kernel@vger.kernel.org>, Naman Jain <namjain@linux.microsoft.com>
CC: Thomas Gleixner <tglx@kernel.org>, Marco Crivellari
	<marco.crivellari@suse.com>, Phil Auld <pauld@redhat.com>, Peter Zijlstra
	<peterz@infradead.org>, Waiman Long <longman@redhat.com>, "Paul E. McKenney"
	<paulmck@kernel.org>
Subject: RE: [PATCH 00/47 v2] cpu/hotplug: Remove cpu_down() global
 stop_machine() except for CPUHP_TEARDOWN_CPU itself
Thread-Topic: [PATCH 00/47 v2] cpu/hotplug: Remove cpu_down() global
 stop_machine() except for CPUHP_TEARDOWN_CPU itself
Thread-Index: AQIdf9UHAmip996qXxPi71vThFyn6La6bi2Q
Date: Sun, 22 Nov 2026 21:26:13 +0000
Message-ID:
 <MN2PR02MB6863080FA24079F8F2F1879AD4462@MN2PR02MB6863.namprd02.prod.outlook.com>
References: <20261105163045.38862-1-frederic@kernel.org>
In-Reply-To: <20261105163045.38862-1-frederic@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR02MB6863:EE_|SJ0PR02MB8813:EE_
x-ms-office365-filtering-correlation-id: dce44033-c565-4ec4-355b-08df48df3c2d
x-microsoft-antispam:
 BCL:0;ARA:14566002|24021099003|55001999006|12121999013|13091999003|25010399006|41001999006|15080799012|8062599012|8060799015|19110799012|37011999003|8022599003|31061999003|3071699003|19061999003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?NwHZIzaSYqRaIhP/1Zz9r5tOE4u4b4gtBMxp7NkprYWn9jutIONX4NLXpdps?=
 =?us-ascii?Q?r4gyfJWG8F6rrBKZGEu7l18t1xeHL1G8rCR5U2p1VJi412ZKonu3rHXEJzWh?=
 =?us-ascii?Q?uoJszDhpwUF5Y7HC041Nzyi738Is0Ht0RqP+074/Pp4mhdcEy4WxtXDJANyC?=
 =?us-ascii?Q?mGAXowNhaA/AeZ9+52tPLh5TnaO6WIjceYT42qcCrFhUTlENO/qSiVZ4AVwD?=
 =?us-ascii?Q?HqG86gVZB/bPwwq3f3Z2p+jIlnB3C6Y4uQifl4jPPPYj+ubdAiYHO+hshxC3?=
 =?us-ascii?Q?PaDjedTsaKvMk1YaQ9rMRcg4X8bssDjytPuvkc+bR22SJG6Q2qGmcWuvCehB?=
 =?us-ascii?Q?PZ7k2VWU1NCg2VKRs15KScnyPHoyYQZ9SqUUKaVxXs4JbQt9GMXIZTNV7AKR?=
 =?us-ascii?Q?F38s/Y9YL1OXMZOhlNIEBjhaculBssHJv4JA30rho0wZ40K6LnvF0HJnWLM0?=
 =?us-ascii?Q?mVekENqD81j23Jfhqz9abVGikLPBA5X2vnbYnmXUj8njv7txTQQ+WSM9Zger?=
 =?us-ascii?Q?ZQsOJwFfkzsAACFpX4/ujmnDPyRz4Uf7bPricp7FDPBqZ0VEirL2ppsHoMOq?=
 =?us-ascii?Q?DvBir+t1eGobp2E6P1Cer7Z1olsQzRDN2wB4aqIhX/q7QltJ6qj0YY3Pbx0m?=
 =?us-ascii?Q?8AFjXkJvmy2f9kEzL2wflj8VMOO/1pHJ4+HQ1+CELt2eVC2Re+Ew9CB/C168?=
 =?us-ascii?Q?wZ5mnTczI3/GVkGcUeNTwGl/pWhckhpjltHeNYX2JTfNTuRe+Dp6WZaf/0DD?=
 =?us-ascii?Q?OysDnLQOpZhrUxw0IX8WJEQgrAmTRgDg3SvLUKdC78xY3rdgSfoBv0hi2zgI?=
 =?us-ascii?Q?FGQ0Cnk7PmA6T0Em+TSj0fR6Ab7oAaTxDIVwRbtYqjbUG6wLLpxbsaNGj5XK?=
 =?us-ascii?Q?xaolKH5EDyPcXgDi6Xp5OyxYmDZxIdHkHEXmgwqklSmwWaXZDq6yE7afvEk4?=
 =?us-ascii?Q?MwvUV+fU4iZu+PLXzw5STOeMO+6/c+e3k+bmw+87ZAjSxj0QkzT12ocpGRp0?=
 =?us-ascii?Q?eHuWXXvlbEF6eaC6ST/eMp5rNRrnq8rk9gja08xUUlAjEzVSL1OWPBD6Qzif?=
 =?us-ascii?Q?Cc0io9MHeIYut1UWV3VqWNLa1tvc0P1+PB5Z7R1470GCUxxUqyNuA8Q04I2D?=
 =?us-ascii?Q?K5LZV6gL5v6p?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QdcwB5Dh4dw4eQ7pZWpMNnGSWy/Lp0M18iP2Bv2G6wR7d3tRbyk0M9WT3x+B?=
 =?us-ascii?Q?YEarx+wIEWZv/LEv7glRssTbgmqC8RrTKJceATOkkNR7+xBCQeLaUUl+bKi8?=
 =?us-ascii?Q?kJiIfaYdUZ8aJpyNM/QNrBMfod1R6/EOIRBgMSXyh/EPyoZcmTPQaXM2rZbT?=
 =?us-ascii?Q?+tIAVgDPNNLOWRKrreDgxAtvr51VIR8V1nt+2UrDbPjt7KjDDyrCUdApVD0c?=
 =?us-ascii?Q?LbgN61I+b8qE7+Jyu47zETTNhRgU2FzTFj7x3akPRFpQwf4g4QqiNhFPYuKN?=
 =?us-ascii?Q?32wq3wGYwj6/nYX31ALyJj11SmdwSgkjWFqcSuDxNUOLIHrOutYsIrSvimkt?=
 =?us-ascii?Q?T64yzfYMZ55hHByek/6g1ZPUVk1re/vpfq6pNCmPsrFcpXpLJzyju0rX4vo8?=
 =?us-ascii?Q?bwNaV2Srrl76l+Ygj/2iHBib05OQkN0Rqgk9Cltb8g3QGUf7LvvyHLP2IsjF?=
 =?us-ascii?Q?2OVw12N1Cm5t8bBsRoN8R8UG8h9uhlkJJQYmq/iqh56WzS6guDNAvfgWSc6O?=
 =?us-ascii?Q?N4jCccKwW32ceGho8XbH+91l7EKWecGlOH11r2BG/tTAakIBCTI4saFcwAjW?=
 =?us-ascii?Q?pz0ZWX4Gk5qrGHcXKZkT1Q6QV/8S3hq10CQaDAm6KfNjNvrr4ftY/rSowos8?=
 =?us-ascii?Q?J1ntwmd1PutSTR2QYBG5JGGvlXiHjYYXRKBtbZOm/WRG8vyEHZyC6FR6RTeo?=
 =?us-ascii?Q?pHhDxXjebX+breZYdRzVhrqAL/GzLQGVXHL5DWOLU8PIaOXaeaK5UGD1sv6P?=
 =?us-ascii?Q?zWH52hpNN0rWy95PQ2w2OuIS5AV7it497XFY3ilao4wKCS+BnUtAe63krBzO?=
 =?us-ascii?Q?NtIKdWYacVQ4DhM6oBwgJI78WywJ4tLxwq0flxAW21u1HLgT0d0rWFPJd53b?=
 =?us-ascii?Q?DbevAphKiak/NpPx5W0qKe+Da+FtrVnBJiTfkKxoqw6Cn9Wu78HjtgHU0KEi?=
 =?us-ascii?Q?bSQrwr0qB/og/Uy2576ZxQ1s5qTmxLkFPxfZVeaBCYubqtNBT2a0cOmtUSvy?=
 =?us-ascii?Q?X1MDX7cKjHPaagKSKG4cwo2P1/iCht0l9rknbkGlMBDdMHuMioK4vmFXWy9H?=
 =?us-ascii?Q?iqRFmp4fmqTwq2Yl3mM3uICOWyOg34d5l7b09gcJzQRtamJS4nvDyB+yHJOj?=
 =?us-ascii?Q?3cdytYcdlgIqCSafHbkhanFOcgPCSEXZ2py6Sgi/TulWAW7xte4fkdArxker?=
 =?us-ascii?Q?zOloRg0sVxY7JQ6xHxb2n2MxuFOqEIIkJ8Mvfhd97SxvCu6eItWG/dPVnm7i?=
 =?us-ascii?Q?jC+8aX//bvIaLxzABFq2vhZQu6u8Pvs1EVlwIjKVAtJD7DMrpWjN5alsRep6?=
 =?us-ascii?Q?33VcXHaHHOpjKm7xY0JjhG55QS9gQJ6RnQ/s6an7vD59E//oFuCd0gbb80cX?=
 =?us-ascii?Q?shzzkfo=3D?=
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
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR02MB6863.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: dce44033-c565-4ec4-355b-08df48df3c2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2026 21:26:13.4230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8813

From: Frederic Weisbecker <frederic@kernel.org> Sent: Thursday, November 5,=
 2026 8:30 AM
>=20
> Hi,
>=20
> As discussed in LPC, cpu_down()'s stop_machine() is a problem for
> running real time and nohz_full workloads, for example if we want to
> provide a cpuset interface for nohz_full and isolated partitions are
> created at the same time as those critical workloads.

I'm looking at this patch set specifically from the standpoint of Hyper-V
and Patch 39 of the series. But the top level "why" in this paragraph
seems vague to me.  I presume a key goal for RT workloads is to reduce
the interval that stop_machine() has all CPUs paused, since during that
interval RT workloads can't do anything and might exceed their response
time commitments. And this goal applies when the system is staying up,
but one or more CPUs are being taken down. If the whole system is being
shut down or doing a kernel kexec, is the stop_machine() interval an issue?

Do you have any sense of much this patch set reduces the duration
of the stop_machine() pause? Just wondering if it has been measured
and is significant enough to matter.

Your paragraph above mentions a cpuset interface for nohz_full and
creation of isolated partitions, and I don't know enough about those
topics to be able to map them to the duration of stop_machine() as
invoked by cpu_down(). Can you clarify?

And are there any other problems with cpu_down()/stop_machine()
other than how long all CPUs are paused?

>=20
> Here is a first step to start. stop_machine() gets a new "post" callback
> that is executed after the main one such that:
>=20
> * As before the main fn executes while all the other CPUs spin.
> * While other CPUs can exit stop_machine(), the target keeps IRQs
>   disabled and execute the post_fn.
>=20
> All the states between CPUHP_AP_ONLINE and CPUHP_AP_OFFLINE are moved
> to the post callback because they can eventually run concurrently with
> the other CPUs. I made a dedicated commit for each of them with
> individual justification analysis and tweaked a bit CPUHP_AP_TICK_DYING
> to adapt it.

Maybe it's obvious, but perhaps you could explain the "why" for embedding
the post_fn in the stop_machine() mechanism vs. doing something separate
after stop_machine() finishes. I presume it's because you want to preserve
the locking and interrupt masking that stop_machine() does. Having
stop_machine() release everything, and then re-obtaining introduces a gap
that might be problematic. Or is there some other reason?

Also, I presume the order in which the CPUHP_STATE_* states are executed
during the "CPU down" path does not change. States between
CPUHP_AP_ONLINE and CPUHP_AP_OFFLINE are executed as before,
just with difference that other online CPUs might no longer be paused.

>=20
> Please double check CPUHP_AP_CPU_PM_STARTING with which I'm not too
> confident.
>=20
> In the end only CPUHP_TEARDOWN_CPU (which is __cpu_disable()) remains in

Does "In the end" mean "upon adoption of this patch set"? Or is it referrin=
g
to follow-on patches that haven't been submitted yet?

> the global stop machine, this will be the next step. The plan will be to
> (all with IRQs disabled)

The phrase "this will be the next step" seemed tacked on here in a
way that the meaning isn't clear to me. Can you crisp-up the language so
it is clear?

>=20
> * Clear the CPU from cpu_online_mask
>=20
> * Start an RCU grace period and poll on it (while doing momentary eqs in
>   the loop), this *should work* with IRQs disabled. So all CPUs observe
>   the CPU as offline.
>=20
> * Check if the rest of x86 __cpu_disable() can be accomodated to run
>   without making other CPUs spin.
>=20
> Changes since v2:
>=20
> * Remove the irq work kick because nohz full kick now has content in its
>   irq_work callback.
>=20
> * Fix a build issues
>=20
> * Kick the new timekeeper with the more appropriate wake_up_nohz_cpu()
>   function.
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
> 	core/hotplug-v2
>=20
> HEAD: 12f90ee6b38dbe86a3c8b9eccd8a0b509bfc005b
> Thanks,
> 	Frederic
> ---
>=20
> Frederic Weisbecker (47):
>       stop_machine: Add post function to execute while other CPUs can exi=
t
>       x86/cpu/cacheinfo: Move CPUHP_AP_CACHECTRL_STARTING to post stop ma=
chine
>       sched: Move CPUHP_AP_SCHED_STARTING to post stop_machine()
>       rcu: Move CPUHP_AP_RCUTREE_DYING to post stop_machine()
>       cpuidle: Move CPUHP_AP_CPU_PM_STARTING post stop_machine()
>       cpu: Move CPUHP_AP_IRQ_ARMADA_XP_STARTING..CPUHP_AP_IRQ_GIC_STARTIN=
G range post stop_machine()
>       irqchip/bcm2836: Move CPUHP_AP_IRQ_BCM2836_STARTING post stop_machi=
ne()
>       cpu: Move [CPUHP_AP_IRQ_EIOINTC_STARTING..CPUHP_AP_IRQ_MIPS_GIC_STA=
RTING] range post stop_machine()
>       irqchip/loongarch-avec: Move CPUHP_AP_IRQ_AVECINTC_STARTING post st=
op_machine()
>       irqchip/sifive-plic: Move CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING post st=
op_machine()
>       irqchip/aslint-sswi: Move CPUHP_AP_IRQ_ACLINT_SSWI_STARTING post st=
op_machine()
>       irqchip/irq-riscv-imsic-early: Move CPUHP_AP_IRQ_RISCV_IMSIC_STARTI=
NG post stop_machine()
>       cpu: Move [CPUHP_AP_PERF_X86_AMD_UNCORE_STARTING..CPUHP_AP_IRQ_RISC=
V_SBI_IPI_STARTING] range post stop_machine()
>       perf/x86: Move CPUHP_AP_PERF_X86_STARTING post stop_machine()
>       perf/amd/ibs: Move CPUHP_AP_PERF_X86_AMD_IBS_STARTING post stop_mac=
hine()
>       cpu: Move CPUHP_AP_PERF_XTENSA_STARTING post stop_machine()
>       ARM: vfp: Move CPUHP_AP_ARM_VFP_STARTING post stop_machine()
>       cpu: Move [CPUHP_AP_PERF_ARM_ACPI_STARTING..CPUHP_AP_ARM64_DEBUG_MO=
NITORS_STARTING] range post stop_machine()
>       perf/arm_pmu: Move CPUHP_AP_PERF_ARM_STARTING post stop_machine()
>       perf: RISC-V: Move CPUHP_AP_PERF_RISCV_STARTING post stop_machine()
>       ARM: l2c: Move CPUHP_AP_ARM_L2X0_STARTING post stop_machine()
>       clocksource/drivers/exynos_mct: Move CPUHP_AP_EXYNOS4_MCT_TIMER_STA=
RTING post stop_machine()
>       clocksource/drivers/arm_arch_timer: Move CPUHP_AP_ARM_ARCH_TIMER_ST=
ARTING post stop_machine()
>       clocksource/drivers/arm_arch_timer: Move CPUHP_AP_ARM_ARCH_TIMER_EV=
TSTRM_STARTING post stop_machine()
>       clocksource/drivers/arm_global_timer: Move CPUHP_AP_ARM_GLOBAL_TIME=
R_STARTING post stop_machine()
>       clocksource/drivers/jcore: Move CPUHP_AP_JCORE_TIMER_STARTING post =
stop_machine()
>       ARM: smp_twd: Move CPUHP_AP_ARM_TWD_STARTING post stop_machine()
>       clocksource/drivers/qcom: Move CPUHP_AP_QCOM_TIMER_STARTING post st=
op_machine()
>       clocksource/drivers/timer-tegra: Move CPUHP_AP_TEGRA_TIMER_STARTING=
 post stop_machine()
>       clocksource/drivers/armada: Move CPUHP_AP_ARMADA_TIMER_STARTING pos=
t stop_machine()
>       LoongArch: Move CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING post stop_ma=
chine()
>       clocksource/drivers/mips-gic-timer: Move CPUHP_AP_MIPS_GIC_TIMER_ST=
ARTING post stop_machine()
>       clocksource/drivers/arc_timer: Move CPUHP_AP_ARC_TIMER_STARTING pos=
t stop_machine()
>       clocksource/drivers/rtl-otto: Move CPUHP_AP_REALTEK_TIMER_STARTING =
post stop_machine()
>       clocksource/drivers/timer-riscv: Move CPUHP_AP_RISCV_TIMER_STARTING=
 post stop_machine()
>       clocksource: clint: Move CPUHP_AP_CLINT_TIMER_STARTING post stop_ma=
chine()
>       clocksource/drivers/c-sky: Move CPUHP_AP_CSKY_TIMER_STARTING post s=
top_machine()
>       clocksource/drivers/timer-ti-dm: Move CPUHP_AP_TI_GP_TIMER_STARTING=
 post stop_machine()
>       clocksource: hyper-v: Move CPUHP_AP_HYPERV_TIMER_STARTING post stop=
_machine()
>       clocksource/dummy_timer: Move CPUHP_AP_DUMMY_TIMER_STARTING post st=
op_machine()
>       ARM: xen: Move CPUHP_AP_ARM_XEN_STARTING post stop_machine()
>       ARM: xen: Move CPUHP_AP_ARM_XEN_RUNSTATE_STARTING and CPUHP_AP_ARM6=
4_ISNDEP_STARTING post stop_machine()
>       smp: Move CPUHP_AP_SMPCFD_DYING post stop_machine()
>       hrtimer: Move CPUHP_AP_HRTIMERS_DYING post stop_machine()
>       tick: Move CPUHP_AP_TICK_DYING post stop_machine()
>       x86/boot/tboot: Move CPUHP_AP_X86_TBOOT_DYING post stop_machine()
>       ARM: mm: Move CPUHP_AP_ARM_CACHE_B15_RAC_DYING post stop_machine()

I have a general but limited understanding of CPUHP states, and of how
stop_machine() works. Within the limits of that understanding, the
core code changes look reasonable to me. But I can't really give a
"Reviewed-by:".

I tested this patch set in a VM running on Hyper-V, which uses the
CPUHP_AP_HYPERV_TIMER_STARTING state that is moved in Patch 39 of
the series. Taking single CPUs offline and back online works. Taking a
panic and kexec'ing into the kdump kernel works. Normal shutdown of
Linux and the VM works. Are there other scenarios I should try?

See also a couple of comments that I've put in Patch 39.

Michael

Tested-by: Michael Kelley <mhklinux@outlook.com>

>=20
>  arch/arm/kernel/patch.c                  |  2 +-
>  arch/arm/probes/kprobes/core.c           |  2 +-
>  arch/arm64/kernel/patching.c             |  4 ++--
>  arch/csky/kernel/probes/kprobes.c        |  3 ++-
>  arch/loongarch/kernel/inst.c             |  3 ++-
>  arch/parisc/kernel/patch.c               |  4 ++--
>  arch/powerpc/mm/book3s64/hash_pgtable.c  |  4 ++--
>  arch/powerpc/platforms/powernv/subcore.c |  2 +-
>  arch/powerpc/platforms/pseries/lpar.c    |  2 +-
>  arch/riscv/kernel/patch.c                |  3 ++-
>  arch/s390/kernel/kprobes.c               |  4 ++--
>  arch/s390/kernel/time.c                  |  3 ++-
>  arch/x86/kernel/cpu/microcode/core.c     |  3 ++-
>  arch/x86/kernel/cpu/mtrr/mtrr.c          |  3 ++-
>  arch/x86/virt/vmx/tdx/seamldr.c          |  2 +-
>  arch/xtensa/kernel/jump_label.c          |  4 ++--
>  include/linux/stop_machine.h             | 12 ++++++++----
>  kernel/cpu.c                             | 21 +++++++++++++++++++--
>  kernel/sched/core.c                      |  1 -
>  kernel/stop_machine.c                    | 14 +++++++++++---
>  kernel/time/tick-common.c                | 15 +++++++++------
>  21 files changed, 74 insertions(+), 37 deletions(-)

