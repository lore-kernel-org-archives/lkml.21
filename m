Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.189.128
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795182530;
	b=whIFqV/cLKBLxcOL7rDFIV97uYxp7zQ13Z0tYfYzX9vQohpVycjaW8cq08Eb6QPCVSaq
	 uh7T/dSmSiqu84zpZa2BBTk9VsFfvqAMufKwXDPdMYoLAYT1D3F4LWgL/937g4jZLRubl
	 h6eGS/SivVqvNjgPiX/dldy6ZJfhflGB5G0Y/um+k2ZknKt9LiTflnOT08KRe7JNXaHNu
	 +a8L4U6jrmteyPxqHEbrdLSZ83st4UwbWzrhgFMqQHj9D7fwxa0PFT3Juibye/bYW1eX7
	 UQNAahqXnEPJeP2Akuja2X1MpC+eMW56DVXxJdNRS0m1FIgFRWFDdMFuFVspHqqlZkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182530;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=5VZ/wXH/uZDwcjep5DfpUT14qUUIP354g7OxlHCdyTs=;
	b=M4xqmUDLDjEpEpQYCv8xDWlMHup2sIpJa5L3zYs1LTKGi0OYiinoFOTqDjDTdxZetHcS
	 K5CFU5sJgKCacTn6lbR5y7GLmkMHGk1MdppUAItxDg9OufsQZhwyX0IQMq0IOLH3doZSX
	 VFFPk93KsFVaaGW0RksLMgTwhgKGfRBtxSZGb6J7DSYMlfAane5SL1BlW8elniEkNkEAc
	 0po3XLH1+Td4GaoYD+G6CTE3j+Yc3J0YKGhlIMGpDN8JdPe1or6AyCjf5j+DC/WI208Zm
	 uwZByQxpOQ3KDar+qt6uj6E80BEjql/WsMZNA0orHjsXosSA0uFQFIjSXihpxSDhk8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=JGkPVMOE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.189.128
Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020128.outbound.protection.outlook.com [52.101.189.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D97606A33C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52D97606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=JGkPVMOE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpydriJxHrKAjE7AxUiincney/Hi3gAhd+/9NW8xxYKn8oxXH1U93NdeNpsFfliqAmCEj2YVsMDB+t6qCEVl/c40e+03SwAmP11B8lZzvYnSBZQmn7WpGeMEZtaWaf2foa0siEnsX2Fo+FK89cZz+lVQ3pIYYYdrKSPuNszT9c3Yxwgt0kGEewelpTVQy/5Wk5LPS8YxVuYDSEOxUaSkrxXuIZnpbcek1HBR7epan7uzY4mfZjKjKUHgJtMgTR69Donn2Gzl18G6a+r+Rnr9vF55ld2CuKJdKFfWA9o93rU2Fg2RP9hjtRjf9GIVzWU7xUTMkevC34f/Ew8uzmYZbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5VZ/wXH/uZDwcjep5DfpUT14qUUIP354g7OxlHCdyTs=;
 b=ZQ3/F8ChqAOEfAsJ7q6yo0AcTI3Z3lMWRShplnNHqAEPHyMGvXUBbg5V9QXGjKylaPAnb52MjhbrA8PFEcmXrBAoiLghnvJBZu7dH+Zmt20oKmj7yhJ51RpXluqa4RUn0ovdgorsurjr4qFeg1BsMtu9gv9GIu6o8P8vIXfqHy2MonzKiuPhnjeoXpZRxYdiagOia4+yRp/lXdxVodoWI8YvIqIyxgWhNt4wjgngxL//Q1dzV5wBIQ4YP9aczqoqcR6lbGl9mC3OHOccQ4KFKDTy7PZTPjkNVo1I/3R1qJC+/S6hV01RrbqporKeKyozULwXE5N+vP6QpwVRehsBCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5VZ/wXH/uZDwcjep5DfpUT14qUUIP354g7OxlHCdyTs=;
 b=JGkPVMOEYMJS3eyo7BDxQMImU9Q02PP1Hhoclrf9I8lG0w532fFoZQgkCl5uAHS/0uBDieah3DDLeV+oW8G8En0LemcdgwVPHlU/7EDhZTSfA34+r2/eDS0FOIEVXX6CC0TNR677IPN2I8FziDfjaRx7u5U19ljkY85qabBc6Z+xjaa/hIqlHwtbBFfh+GatICzSXJxnVg+EBcOF/7fnD8mctwnq/e5ib6ljXcwIuAYyFC4T0Xx2mQOSags0AqfLfIduofmzDYKAJnmCc+USq5+XbKLEM+useeUU8aHXK1LZCe+Ktdwj87ZCSon45wBfE5xYW1b68dFqCVIo0F4QoQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by YT2PR01MB10747.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:f2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 13:48:47 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 13:48:46 +0000
Message-ID: <b0a56d30-3076-402b-96bc-0dc8048a8e34@efficios.com>
Date: Fri, 20 Nov 2026 08:48:45 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/33] sched/deadline: Record the root domain holding a
 task's bandwidth
To: sashiko-reviews@lists.linux.dev
Cc: linux-rt-devel@lists.linux.dev, tj@kernel.org, hannes@cmpxchg.org,
 mkoutny@suse.com, linux-kernel@vger.kernel.org
References: <cover.1795116790.git.mathieu.desnoyers@efficios.com>
 <b652188b8e94eaa45102ac88f15d841e9a5ef141.1795116790.git.mathieu.desnoyers@efficios.com>
 <sashiko-outbox-224056@kernel.org>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-224056@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0150.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::7) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10)
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
X-MS-TrafficTypeDiagnostic: YT6PR01MB491026:EE_|YT2PR01MB10747:EE_
X-MS-Office365-Filtering-Correlation-Id: 53ab5f34-e8a8-4917-0edd-08df470cffb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|22082099003|4143699003|56012099006|261022105027099003|261026121527099003|261026140227099003|261022075727099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	FZbRSVfOfdXsG12wkUs4USTenlEcBWdyTP5lU7Q+1ko1cdk2LyLEUTE+ircanffA4z038G5B50vUhgLR7TycxaxMoWklCMLok2oU7XOsGYlRRPjliQMybN7v/VETFUkqAxtOWa0GS8tnmzYAgkzwVvhHpepbJvbUMs4sNvF/oYLwh6T4iheR0KUQ5TZeoFa13td7zfOgzt8fjs2NJv3Rx9SjSXKB1qHsRn5nAsY4bUcEI4VIPoI/GJ2ArscN+bPQyxdQxXsM12C1k7fIiCkx4a+TwV7nR+BmmrYpLROiC68XqnEPT3hbAxhvaA/9dxrRIW4IHcen5WP99eK+Jo1Et9HxPC2j386vhWHaJrdeHBkZQLo+B2jx5vWNMd3PkhHgL1fENYj917Aj+MP7ida5XO/H69/r3qOcf+TBuFOH1IMOTZt00BftQ4x5ftDaUJFkx1ry9GhQhfTI1KS319I5afcRHNCqkkSinvifYD/7e7auh8J5oZfrOLKS60SuRFYbxmDQwppuFFWHZ0AKzmKLMpYAE4dsla9nny0O3K+Vfd8/V5s6giA2vdfP9oSgaFlFcdDR0UZ1O+6QgRGclKcQywiXHBjg9AEzHyMV+Biy6iQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(261022105027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWtEWFJGRXh5cFgwQjhKanVXR0NHS29yN2RPeUNuakk4Z3p3ODJkR0RuSnJj?=
 =?utf-8?B?UTFDbjNMWXhFOTJxaEZMd2tYRi9oVWp3UE5mSEhrTkxzWFVxV2RGTFVSVFJ0?=
 =?utf-8?B?MEkreVNzZXE4em05NEJtaFgwUVBrSFFGaEtYZ0lDUHZNR2l3S1dKd010RmEr?=
 =?utf-8?B?bzlLbHd0cDJQWDJXS1B4Um1KRE1WR1BiMmF5UUw3bHlBQ1M0aWpwYXJUbXJE?=
 =?utf-8?B?czU5cXRwT01LNU5xNnJOZjJuWVJMbE14VVJKZkhjNVpKL3JDNnZJaWdOTXQz?=
 =?utf-8?B?dWdydExtcGRnY3BVcGM2R2I0WnFDTUxKNzRGQ1lkeVFoeTNGREYvQmlid1M5?=
 =?utf-8?B?dDRVTjVKVEpVOUVRRnpxZ1pqa3ZWQ0JaT2duSTBkeGhKQU14Unk4S1pvSlZN?=
 =?utf-8?B?YUY2cFFOdnhENzl1aE1PZHVISFUrSnlOMitXMlhyNU0wV3liU1lEZ0NxVHpS?=
 =?utf-8?B?dG1sdVU5YjFVbnlUc29KenRDQmw3QjdyVDhURGRJVW5aWWpaZEptZnZQSm5t?=
 =?utf-8?B?WExwS1lUT25DTld1eXZ0aE9nS284ZDE4WUF0bGNISUhmZzZMb09TWkNXTlVt?=
 =?utf-8?B?MjZNYklMRG54K0tqZ0dWaHlsWUFGWUdWajdhbmVCSkIzY3Z2SFpJL04wRGVR?=
 =?utf-8?B?aFkvVFpYdkFkR01xTkYvSUZQQWNPRFdmbkh3Um9Rbzl0OFREdlpGcXBmYndz?=
 =?utf-8?B?cjh0L0hlWlpPYjFnMnYyY3VvL0FUNnNwd2M2YXloYTNCbkNPeTJyUEcrNUk3?=
 =?utf-8?B?bm9zVnBhVHRFeEY1dk1OTklSMVgyZFR5OFd4REZyWjBCc2RraWlsSjFBMmVn?=
 =?utf-8?B?RHlHRGN3TTJHZGt1eE1GYzQ1TEUwWm5nbWZwQS9maEFQeDJqRmJDQ255Yi8y?=
 =?utf-8?B?NlAyMGtpZWtPdFd6VXliYlQ5T3lCQlNnd0JoeXlYdG5yRzhjRnJ5Qm1HWVF4?=
 =?utf-8?B?VW11aXhlZDI4Um9HYXhGWXJaMUxWZVMyaHAxYk0yWFNldDcvOEhtd05wbGl0?=
 =?utf-8?B?a1MwVExlY2VLT0pHQkZ3NFAzK21QY0lpYjBRa3lXK28rVDBlblpIVlRFeXBM?=
 =?utf-8?B?eXhTenhTdEVCN1pYUm5BMU5XZ1NBSHVXQlBVV2daZUtUNkFmbkV4YTliNVYx?=
 =?utf-8?B?MG8vR3FBWHBQL1V2RmN4Mk4vc3FHaUJuc2Rjc0I0T1ZhVFBmV1pvd0l3VC94?=
 =?utf-8?B?cXVTOER5d1BELzAzbStzUExSUlVOalltM1lNdzFkc04zd05oQnBzRFhJdU5D?=
 =?utf-8?B?eTVXd1BHU3lRMnk2N0gyMUY0eFNGcmx5ZEV3a3V6RFEzZlBBV0NVVmM1VEwy?=
 =?utf-8?B?bTZOZ0x1SFRnUWg1SzZhQ1JDV3MxMmVJSkJFZ3JoZGdEUWYvRXN0aWwvK0U0?=
 =?utf-8?B?dGRVd0g2ZU1BeGw3V3ZDNmZjSkxGbVlXdVJNSlhHcFk4RHJlcjErY2czMW12?=
 =?utf-8?B?N2tTZWUrUG9FVW9TLzR2cGxyMXN2TlRaU3MwWjlERldOMW96TkhVTFFIS2Vu?=
 =?utf-8?B?VjBmYlRCZ05JcXN6Q0FLVVpsUFh3UlFxWFFQYkZYeGdIa1N6YUFMYzE0cXpN?=
 =?utf-8?B?Z3RJQmNNSElkOExvRSt0MStlUGxuVjlZVnlEd0pPclRvUlZkcHd5M2pnSUU5?=
 =?utf-8?B?bkwrb3BMNkRGNVpLQUlZUDVnNldkZndDdGVSd0tpZ0pBekJmS09UK2kzNnV4?=
 =?utf-8?B?Mytlbm9LZU5hT3RBVmtxdm1Hc1NkYUdPQTVMMkJWVzI4dWFrU0k4dUZPQmZC?=
 =?utf-8?B?aFZBVlBjbnZsMEIvc09KVnIrT1JWMTd4b3VqMHpZREloMjN3MlBQVVFOV2Rk?=
 =?utf-8?B?SERhVENMSWh5K3ZZMS9BNEtNK1p3VU13ZUN3OENleldnbDdUeGkrelFFenY0?=
 =?utf-8?B?NGFGOFVrb3pFdUdKRUNSY29FTXp1ZkFEd3F2VExOUHYyRG9XU0s5cDFDTk51?=
 =?utf-8?B?N1hxbWNpMlZwYnNOR3ZBRVdNZjd1Z25PT1dvaUhtMXZ6UU5RV0VnU0tyVzZq?=
 =?utf-8?B?MlhHOUEybEVicE5yKzMweUtWNDNYQ05KUFl0bkRyVkdOaXVkaFR2d3BOZDIw?=
 =?utf-8?B?SG0vZjc4NlhuZjZvbXZiSzhabUxJdTBaZHJmeUVmdzVIaWhyYWFsZkFCZjNR?=
 =?utf-8?B?SGlRZUhSK1kydVRWOWpyd3IrNXBHNHVLQW5DcXlZYTRnYXlBZVhDc0tHM0Zu?=
 =?utf-8?B?ZU5PT1NBMk9lR01wOVlhZk82TEZZYTRERWQ3c0dSbElMWitoWFVaOEVBN0hW?=
 =?utf-8?B?ckFOcFBoQzZtcUR0OTlPUTl3b2FVc2hMZ3N5YlJwU2YzOGhmbWErVDNUSVJ6?=
 =?utf-8?B?WWFaWk9iR0doa21ld0dPM1ZiYnMrV1d6K08yZHdHa2h6eHpzMVpKc1RDaTc1?=
 =?utf-8?Q?JWO4xBjv6hT6QX05Qwdd+MoxOL749IxeKlxmr?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ab5f34-e8a8-4917-0edd-08df470cffb4
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 13:48:46.6060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3id18U+4/IuTs+zzQhaLE5+27qfqXDwB1VPRsMSiR0OGLWScOG82sc2CNtyStb0FzHR8Fo2+/unYgCY5Xq8xDmuma6natVL7iqJZEWuhHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB10747

> Should the root domain check in __sched_setscheduler() also use the
> recorded dl_bw_cpu instead of rq->rd?

Yes. The check is older than this series: v7.4-rc2 has it too. Patch 3
changed dl_task_check_affinity() and sched_dl_overflow(), and left this
one out.

v9 will add dl_task_admit_cpu(). It returns the CPU whose root domain
sched_dl_overflow() charges. __sched_setscheduler() will check the span
of that root domain. A new case, move_asleep_setattr, moves a sleeping
deadline task to another partition. Then it changes the runtime of the
task. Without the fix, sched_setattr() fails with EPERM. With it, the
case passes.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
