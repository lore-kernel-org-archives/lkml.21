Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.189.127
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795105344;
	b=eE8cM1HcFghzn93/xkxwXBdg6yLLI0+uxe/y1qDQThqbf3mxm/OyB6fJgpEdraibUxAj
	 lPpl7kH3GHyGWEerxKUw9xtSF1OZs7Wlz8t4ucSFePL8c5Z0/hoS4CYa253vkMiSnxONN
	 WDBKNkpXdG0cIKkLIZQ3X1zHdOb5fP4/pabknbG0PeZ0y17hTbirs7Y1oI7oJZymaZO6i
	 KyY3uuLDRSSrDS7Av4XIdOWJZfui6+JR5HtFg8r4SqDpPtH6l+Ul6rWrQ3cbNG1Z+ktS7
	 w+Bpp5xag5jXzBOUhTb42qS2JF319FluZeZfqZntaG6PmGhMrah8C1+UGaLbK2pByXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795105344;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:References:From:Content-Language:To:In-Reply-To:
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
	bh=IfHuAacPhKAy+yMzxTy8B34EDFKUIGH6hOynhyXCIQg=;
	b=tvKJHe+50IfeRcRtX3dzJE82b9TEQMpYaMcnJqUwa+ivmghjS8OSAzZXIdFP/kGced+K
	 lYxEiuMOdcHpl32MhvhuV7sdgyW1nGfOYg3cuEVJ7CIK6nSrdiJRMPQk4SndR1dGKoN44
	 11P4wsxTZpWGU+PlRalj2x5tFdmMQYGtYDHsow3YflpT6t4IJsZm4BIepg4JUr0V0DMMI
	 rJ/v1Ug3D2wq1Sox/cRV4JDdfnpMLAb4DYsex8G2a2dVTAHDlfqUB2t6Z96t/iJX/5R/z
	 nXGWy7HcNQ2RdWyNrkizjtWSzJzsex95csi2DE4ogtOA9GPTkvH4zCWmQtjZHZMzY1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=t2BmVghI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.189.127
Received: from YT3PR01CU008.outbound.protection.outlook.com (mail-canadacentralazon11020127.outbound.protection.outlook.com [52.101.189.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4258606A335
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4258606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=t2BmVghI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUqw/XQqaGCN6Hf6qECn7qGJEmoZg54C5Z39pw6SP6yrKT2Km98ve6z/2XZfaq3NQL0SGo/u8bkHrsciaYIZnkf4EHGslyY6qoXU7p3ADR7WvG31mAeD9OAVvcaiyjIkV5U1EdMCLjxJTjo+jJd+KqNDmqTliThzrzuqrxEEfY+knl+5bh0g5gHKfOO5kqDbf3YnA1HclNFkJCaknIespGenQ3Qda6Uh1mrUvm0tBuHqNgqvKK2hyS35tiRWJqSxWVMaQX+PVLVUgULy+Nce2apcU8aVt+GyX1joCgvC/DmIOTFqjf240m7VD3v1wafgvR5scIum2ud3jcA+ZpCpLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfHuAacPhKAy+yMzxTy8B34EDFKUIGH6hOynhyXCIQg=;
 b=GVu6KVtAmDTUZMTlrFhdBexV6VSSSaoKSSz3lX6JUnGi/fS11/1qr+/+tRN4sUYPhL+9AVYcsVwMol21qDwN2QxxOkYPC5yZrlZ2qkCzNNS9D/5lmHaatiZ6c3QQyvCeg9IZ86EvKyeQouA2fDFfhI8+IxNhpI5Ey3Zqzg3maGC0NcEdm2iwGn5ops40ecPuMqXZtLCKdSST9NsemtpUJWBdRekkDPgvoSZ5ku2/AOlK5tXOYLasUmWkQrp4DilXWKGgb2bJfen0KghfM1YfBzxuZ41n7tusyJCfhJxFhnA3k6WhnhpszHrP+MY4LOL6vsAI2DobNBaUwtcXspbstA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfHuAacPhKAy+yMzxTy8B34EDFKUIGH6hOynhyXCIQg=;
 b=t2BmVghIRFT2K8iL6n8r1EHLgv54l7zXlXdaO86wLiIehdDaiwEFi3QL2LGLu23fgZxqif7IaFooqyUci58QXkgUz2gQKJnBWHn/nkQl+a0MeodKOONseWJF+sQ1HgPxHIxyzQoQ4GraoNfRjx7JLuMNOnueHwY762Uc+svEPlQMP4NE8mQ6hrMkK4sKfobR0GWCnu2dmY+AbwoYW0aECuhSTuyzO4AuUnBvZzYRrTQfILHLf0mtl1JTMpUyqVnPmMiVSepPGvE+igARHtuX+5ewhP08qlnZALKEgDsSfvewq49oEofsGS9UfDpC62/GoPCsLohBeTqJhwfYgiYbzA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by YT5PR01MB11857.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:17c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 16:22:19 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 16:22:19 +0000
Message-ID: <85b926c7-4f88-497d-8026-8cf1f1dce6a0@efficios.com>
Date: Thu, 19 Nov 2026 11:22:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/17] sched/deadline: first bandwidth accounting fixes
 and selftests
References: <cover.1795103339.git.mathieu.desnoyers@efficios.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
To: linux-kernel@vger.kernel.org
In-Reply-To: <cover.1795103339.git.mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0062.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::22) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: YT6PR01MB491026:EE_|YT5PR01MB11857:EE_
X-MS-Office365-Filtering-Correlation-Id: a06f81b4-60d1-4e78-ff78-08df46594889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261022075727099003|261021123027099003|10067099003|56012099006|260925022911599003|260925021911599003|260925021311599003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	9qtR8g7v9AtmKHMsXyeqPf1aJ9QUruF8VIDD1xQVg5xiu20xazfUonVgHTEgCfm1rPKaJGwvlUVh1WIy518p+PxjbMnMyQ711yKvicqGs2R3a0i3xYw4AFrO2B4/hUQrQrdjK2SieytsFTArBsrrlxzRyCl1eo0s8PQwxBCcGHXoAKx9qATt0hMCvsiqoVcXTNGFRlG37gjZtjibJ+eJ58Bgy4KWcDq+68J+i9EtgUC/qoiHVBOtWbgKHYxzkqN0P1Zb7LdZ68kU47x3XzahILuVg5Vol2VrtoTWpypMs4rTYK5GyoQvcn2IvOggZ2x1DrsmqN+3qOKCL1e1xtgemUcVWvv+Ct3bAD+uxpMZrBI3BH+af3NKt+WmRHZzFE5uoO/amrNyBUw5+6G6ijqdZUuPoeP50p3eKiQ72Qcy4u5WzgYs549WRgFi8pfuNfaeLhP3JhRWa+xgzP0ycCFqGzoWBXgnXeRRSVNvDkmMMbup0YwtxnjP08/PTi/ud6rSuUTncACoWL7V6UFgILV7MAGf/Dwk2FYEj0Y7jWHJV+WuspS4nlPeHExkCUtg1m4YeghO1AbTmFrafAL+domu5shhAv40zBgAi+hn22Ppw58=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261022075727099003)(261021123027099003)(10067099003)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWRjZmpZdVZieGRFdWxkdDZCTzBpYkpDMmpvVHFweFJFck5lMXZnQ1lXdVM2?=
 =?utf-8?B?TklyWnpJaHNlQXI1bTBzcGVnMXRXT3BZbnpCblplK3I5TnFWNEIyU1lNWjY5?=
 =?utf-8?B?SEgzUDhvbUxkUjRPaU1GeC8zNHB0VGpJemZxbDV5WU5FY0p6VEI1RkQ0eGhm?=
 =?utf-8?B?VzViN21FSmtsOVlIais3SEFWaVB2N29Ud2dCY0IzSXZvajBBN3RaY0hsZXFM?=
 =?utf-8?B?V1NabWhqNGVpRlp6RmZsRk92aVJDUk5jK1kwOC9ldHl1eG5KbWtCaWdFVzVm?=
 =?utf-8?B?bUhsNWpVcUZuTWFRMWxKSEc0b0liQWNERURuUUlzdnpjbXU0aGhkQm00WWJQ?=
 =?utf-8?B?NDRkWXh3NUFHMXRWVHlTZWxYbEEwSWkwdVl5NUd2YWdvL2N1UnJyWUh0UEdU?=
 =?utf-8?B?M3JCWngvMDNYMmVJZ1Axb1NHSW51cmVIaFY4ZnZsNUVkZ0NxRFBVUzJoR1hH?=
 =?utf-8?B?NW5KZ0F4M3I0T2RuYTI5OFdDcmhTL1JQWnBpNkROL1VYanVuM05iRVpSbDg2?=
 =?utf-8?B?bGg2cTFuaUFEZ3VNV0t0Z3RIQVBrKzM1cWY4eEhPNWE0ZTFabkYxeXJ6ZWtC?=
 =?utf-8?B?dHd0ZDdMNndFZHdPM21FbVhGcVcrMEdXcFQxS1lzZENFZnVOK3R6ZHI4WmlZ?=
 =?utf-8?B?LzF0U21qR2xqMklWaGJpZDdteHVtdXBIbTNjNmRxTVdyWnpEWE9wTWNxQ001?=
 =?utf-8?B?N1pXSTVEMkh5ZElUS0JzUi92MTdqOWo1WVpIenJpVWUrVDVDdDFCSGZVbHJ6?=
 =?utf-8?B?SXpDY0ZXSENncXFiNHRmOXl6TlNyeW9aSkZrdjZnTDJDTDdua1hUWEg5N1Rk?=
 =?utf-8?B?bzM3ZStLTWNUNWgwbVhrUnJrYW5GWG5vVEJDYVhHcGIrMXh2SFpyMERHVFVy?=
 =?utf-8?B?dXFGTXBheHQyaEVTY2VqQ2ZGbnF6S25pYlJNdjFjL01SbXBLNDd1UGt1YlNI?=
 =?utf-8?B?eVRSbFB6M1g2a210V2E1c3BLT2x0bXhYRmFVRmswRWlxcjgwQWxBY2xCRWFH?=
 =?utf-8?B?dGpxa0dvWXFCZVVQSCtvY1VyY0Q0YmZJQ1VsZFIyTTRIM0pFUUF6Z3ZoWitR?=
 =?utf-8?B?OWdHM2tDUVlTelM3YmJUcTh3Mi9RUGVzRGtYWWY1R2dLeUhQUm5VNUsrZjJi?=
 =?utf-8?B?NUlOOURsYlg4ZUtyd3Z0L1ZrTUhWNTdiekIyZENOVTNpNzQwRElxREd5dXdT?=
 =?utf-8?B?NHNNT0FhcVZ5QU14eXZmOU1rRHZoVjZMb2dFN1dsbTJndjlvUXh2T3VyQ1RP?=
 =?utf-8?B?ZGRpYzlwcDZRSUZUTk1FYUpJUmJHTVJFNFZkdllKR2ptWEhiQjl2TXcydGVY?=
 =?utf-8?B?WHRtK1MyWUpodHJBNG5VbGJrSXE1eklmTFRrc0wyR0QzZUZDa1JuRWRQSXUz?=
 =?utf-8?B?aVFxbFpBTEF1VkhuLzJLWWFFbGVVaEltNEJnU2FHTWl1SHpYZzJzeUluYmpY?=
 =?utf-8?B?UXZMeDdscThWN0tsUHNBaFBOTEJjVWZsQjczeTRQQnZMMWlKd055bTB2TzZq?=
 =?utf-8?B?UWwzUEpWL3Roa0YyQTZNSStxc3FFNnFTWUo2LzZ0T1RzVlBJQ2tyQXYvb3I2?=
 =?utf-8?B?cGk3UllUNElFeUg1dFVTN1JMQnRNNUVTQUhNUEZObU9YSGxHTU5KSkZqSkRq?=
 =?utf-8?B?ay9vTnNNTWZPQ2IwM3lUa0JiSTlKa1QreURVZG9xb2EyV3E2V2dBZElXa3I1?=
 =?utf-8?B?bXQxZGdocElRNWlKNHVWVG1ORGlranhUY3lLRGdSazJYTWljbERqRTJRVmoz?=
 =?utf-8?B?Rkg3ZU5wU1VtYjZOcmllNDVQS0RFU0ZIakNZRmROemIyK1VhZjNLYU5kUVV5?=
 =?utf-8?B?VVRaSUJFUmJkYnNDT3BRYlB3L2hub1R4TVVzbzBwZkZ3SWhRbjEvVFhXc2Zi?=
 =?utf-8?B?OGtPL1phY3ZSQ2hZbHRwSkpHd2xUQ3VwUnNxRmNKd3hlRVJHK3RROXhoTWhq?=
 =?utf-8?B?Yjk4V0ZZclFmbzgzY2JhVEp0YWFMRFRUZnZZdlhVaURXUENkR3ZYbnN4dzhR?=
 =?utf-8?B?V1B4NVVRbEJONm1hSldaYVcweFp0Zk00a1FsRFJGM09iazM1a0IyOTZJSndy?=
 =?utf-8?B?Z2FiQmJnMzJxSEgxbVVxNHJFcUdORTFkdUIzSmNZUVIyZXBZTlF3TDRYVi9a?=
 =?utf-8?B?N0FJT3BkWWgxTWJDeVlub1g4MlNiK0tCSVl2WFlTY1AxeE9wY1JBaWNydzh6?=
 =?utf-8?B?S0ZXcEFER0VJTVhvVm5TQTZPUDdqRU5rSk1ZN0JrQ0tuQkFiYmVIZVk2ek1y?=
 =?utf-8?B?ZFNNZUJncWNIMlhmMURrUGp1KzdRRTF0MXA3R0tDREJ4c3ZLVGJXaVBrM2kw?=
 =?utf-8?B?Wm0wejUyMG03ME10YmN3cjlwWC9TVHEyS0FoQytYQVRyS04vNzNhRlJicEkv?=
 =?utf-8?Q?EXOYAa8Luiby/u4CmUCxJgGoMmxJ1k0Oh8xlJ?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a06f81b4-60d1-4e78-ff78-08df46594889
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 16:22:19.3822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7cgkY9wAy7a5hAjC0ecTAVgQzSEQX0GJ1HvjPFyBJJkl2i1hGjHhNjCnuM8sQEFlrqyF+cub6XMK/NL52fnH+jp0BFZ6oRChqaKTtflTNN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT5PR01MB11857

Issues with my patch send script. Will resend.


On 2026-11-19 11:21, Mathieu Desnoyers wrote:
> Hi Ingo, Juri,
> 
> This series fixes 14 bugs of SCHED_DEADLINE. Then it shows the deadline
> bandwidth of each runqueue in sched_debug, and adds two selftests. The
> fixes come first, so that stable can take patches 1 to 14.
> 
> Two of the bugs take the kernel down: a division by zero (patch 4), and
> an owner's CPU that locks up (patch 8). One leaves cpuset_mutex locked
> (patch 6). One leaves a task that never runs again (patch 7). Most of
> the others leave total_bw of a root domain, or this_bw of a runqueue,
> wrong. The root domain then admits deadline tasks beyond its capacity,
> or refuses every one.
> 
> These are the first 14 patches of "sched/deadline: bandwidth accounting
> fixes and selftests" v7 [1], as Juri proposed [2]. Their v7 numbers are
> 1-8, 10, 13, 14, 16, 20 and 37. The rest of v7 will follow as v8 of that
> series, on top of this one. Patch 10 was posted alone [3]. Juri
> asked to carry it here. It comes before patch 11, which adds a caller
> of the computation it fixes. v4 changes it, as described below.
> 
> Patch 12 is Juri's, patch 14 is Andrea Parri's. I carry them unchanged.
> Sebastian reviewed patch 14. Juri, three of your four fixes that Ingo
> dropped from sched/urgent are here:
> - 2/4 is patch 11.
> - 3/4 is patch 1.
> - 4/4 is patch 12.
> 1/4 stays in the second series.
> 
> The fixes
> =========
> 
>  1  Refuse SCHED_FLAG_KEEP_PARAMS requests that would change the policy
>     or the class.
>  2  Skip admission for parameters that SCHED_FLAG_KEEP_PARAMS keeps.
>  3  Let a task boosted by a deadline waiter change its policy.
>  4  Do not divide by zero active CPUs of a root domain.
>  5  Refuse a dl_server debugfs write while the runqueue is offline.
>  6  Take cpuset_mutex for a deadline policy change only with pi, so
>     that sysrq-n does not leave it locked.
>  7  Replenish a throttled task switched out and back, so that it runs
>     again.
>  8  Do not refill a boost from cleared parameters, so that the owner's
>     CPU no longer locks up.
>  9  Reset the deadline and the runtime with the parameters.
>  10 Compute the 0-lag time on 128 bits, so that a long period does not
>     release the bandwidth seconds late. Check first that the runtime
>     left fits the parameters until the deadline, so that the quotient
>     fits in 64 bits.
>  11 Release the bandwidth of a task that leaves the class asleep.
>  12 Reject SCHED_DEADLINE on exited tasks (Juri Lelli).
>  13 Keep this_bw right when a task changes during a remote wakeup.
>  14 Check the affinity of a deadline task under the runqueue lock, so
>     that sched_setaffinity() and sched_setattr() cannot both succeed
>     (Andrea Parri).
> 
> Patch 15 shows the deadline bandwidth of each runqueue in sched_debug.
> Patch 16 adds deadline_switch_test. Patch 17 adds deadline_bw_test, with
> the 47 of its 115 cases that pass with these fixes. The other cases
> come with their fixes, in the second series.
> 
> Testing
> =======
> 
> The 52 cases pass wherever they run, with lockdep and no kernel
> warning, in 25 QEMU guests:
> - 9 guests of 8 vCPUs, one with proxy execution off, and 1 of 4 vCPUs.
> - 5 guests with PREEMPT_RT, 4 of 8 vCPUs and 1 of 4.
> - 3 guests without CONFIG_CPUSETS, of 4, 4 and 5 vCPUs.
> - 4 guests of 5 vCPUs booted with isolcpus=domain,1,2 or
>   isolcpus=domain,0,1, 2 of them with PREEMPT_RT.
> - 1 guest of 8 vCPUs booted with isolcpus=domain,6,7.
> - 2 guests with CONFIG_RT_GROUP_SCHED, of 8 and 4 vCPUs.
> move_cancelled runs only in the last group. Without CONFIG_CPUSETS, the
> cases that need a cpuset skip. With 3 CPUs that are not isolated,
> params_waking skips: it needs 4.
> 
> On v7.4-rc2, six cases of deadline_bw_test fail in each of 24 guests of
> 8 vCPUs, in three runs. Patch 17 lists them. params_switched_asleep, new
> in v4, failed in the 8 guests of the third run. overrun_caught fails in
> 5 guests. In one, hotplug_server crashed the kernel with the division
> by zero that patch 4 fixes. throttled_round_trip and asleep_round_trip
> of deadline_switch_test fail too.
> 
> The third run also had the sysrq cases. sysrq_normalize failed in every
> guest. sysrq-n logged "BUG: sleeping function called from invalid
> context", from a mutex taken in __sched_setscheduler(). Patch 6 fixes
> this.
> 
> Each of the 15 kernel patches builds alone. The whole series also
> builds without CONFIG_CPUSETS, with PREEMPT_RT and with
> CONFIG_RT_GROUP_SCHED. The selftests build with no warning.
> 
> Juri ran v2 with cgroup v1 cpusets, and with the scx_simple sched_ext
> scheduler [4]. With sched_ext, the server cases of deadline_bw_test
> failed: they set the fair server, which sched_ext detaches. A change
> below makes them use the ext server. It was not tested with sched_ext.
> Not tested either: CPUs of unequal capacity.
> 
> How this was developed
> ======================
> 
> An LLM coding assistant wrote these patches, their messages and the
> tests, under my direction and review. It did not write patches 12 and
> 14. I know the concepts behind SCHED_DEADLINE, but not its
> implementation well. So I ask those who know this code for a careful
> reading of the fixes. A reproducer that stops failing shows that the
> symptom goes away. It does not show that the fix is the one you would
> have written.
> 
> The bugs came from:
> - flaky cgroup selftests of a feature I am developing;
> - the review of Juri's four fixes, and his review of v5;
> - building deadline_bw_test, and reading the code;
> - the Sashiko AI reviews of v1 to v7 of the original series, and of v1
>   to v3 of this one. Each finding was checked against the code first.
> 
> Changes since v3
> ================
> 
> - 10, from the Sashiko AI review of v3. On x86-64,
>   mul_u64_u64_div_u64() traps with a divide error when the quotient
>   does not fit in 64 bits. After a change of parameters, the runtime
>   left can be far above dl_runtime. With the period limit raised, v3
>   oopsed in task_non_contending() in an x86-64 guest. Before the
>   division, task_non_contending() now compares the runtime left with
>   what the parameters give until the deadline. A comment explains the
>   0-lag time after a change of parameters. Juri preferred this to a
>   change of the formula. This is the separate change promised in reply
>   to the Sashiko review of v2 [5].
> - 17: two new cases, params_switched_asleep and
>   params_shrunk_long_period, test patch 10. The modes and variables
>   that only the cases of the second series use are removed, from the
>   Sashiko AI review of v3.
> 
> Changes since v2
> ================
> 
> - 10 is new: "sched/deadline: Fix an overflow of the 0-lag time with
>   long periods", posted alone before [3].
> - 11: the known limit of the v2 cover moves into its message, with the
>   impact Juri gave.
> - 17, from the Sashiko AI review of v2 and Juri's testing:
>   - deboost_new_params_reboost moves to the second series. On this
>     series, it passes without the deboost it tests.
>   - The flag of the lock shared by the death cases is in shared memory.
>     Each case runs in its own child process.
>   - server_states skips when P cannot run SCHED_FIFO tasks. This is the
>     case with CONFIG_RT_GROUP_SCHED and the cpu controller on.
>   - While a sched_ext scheduler runs all fair tasks, the server cases
>     use the ext server, and hotplug_server skips.
> 
> Changes since v1
> ================
> 
> From the Sashiko AI review of v1, in deadline_bw_test:
> - rebuild_record_taken moves to the second series. It tests a fix of
>   that series, and fails without it when CPU 0 is isolated.
> - move_cancelled runs from the root cgroup. It turns the cpu controller
>   off at the end only if it turned it on.
> - Its setter thread is joined after a timeout too, and its result is
>   atomic.
> - The shared lock of the death cases is made consistent and destroyed
>   before it is set up again.
> - A failed probe fails the case, in hotplug_server, move_refused and
>   move_zero_bw.
> 
> Based on tip sched/urgent, ec6f6731538e (v7.4-rc2).
> 
> [1] https://lore.kernel.org/all/cover.1794922146.git.mathieu.desnoyers@efficios.com/
> [2] https://lore.kernel.org/all/av3J3zMfkRplg-N4@jlelli-thinkpadt14gen4.remote.csb/
> [3] https://lore.kernel.org/all/cover.1794926626.git.mathieu.desnoyers@efficios.com/
> [4] https://lore.kernel.org/all/av7NchMg0wnyzjcd@jlelli-thinkpadt14gen4.remote.csb/
> [5] https://lore.kernel.org/all/8282556f-a7bc-4950-b7a7-b5b78557412e@efficios.com/
> 
> v1: https://lore.kernel.org/all/cover.1795031605.git.mathieu.desnoyers@efficios.com/
> v2: https://lore.kernel.org/all/cover.1795037078.git.mathieu.desnoyers@efficios.com/
> v3: https://lore.kernel.org/all/cover.1795092090.git.mathieu.desnoyers@efficios.com/
> 
> Andrea Parri (1):
>   sched/deadline: Check SCHED_DEADLINE affinity under the rq lock
> 
> Juri Lelli (1):
>   sched/deadline: Reject SCHED_DEADLINE on exited tasks
> 
> Mathieu Desnoyers (15):
>   sched: Refuse SCHED_FLAG_KEEP_PARAMS that would change the policy or
>     the class
>   sched/deadline: Do not admit bandwidth for parameters that are kept
>   sched: Let a task boosted by a deadline waiter change its policy
>   sched/deadline: Do not divide by zero active CPUs of a root domain
>   sched/deadline: Refuse dl_server debugfs writes while the rq is
>     offline
>   sched: Take cpuset_mutex for a deadline policy change only with pi
>   sched/deadline: Do not lose a throttled task switched out and back
>   sched/deadline: Do not replenish a boost from cleared parameters
>   sched/deadline: Reset the deadline and the runtime with the parameters
>   sched/deadline: Fix an overflow of the 0-lag time with long periods
>   sched/deadline: Release the bandwidth of a task that leaves the class
>     asleep
>   sched/deadline: Fix this_bw when a task is changed during a remote
>     wakeup
>   sched/debug: Show the deadline bandwidth of each runqueue
>   selftests/sched: Add a test of SCHED_DEADLINE policy round trips
>   selftests/sched: Add a test of SCHED_DEADLINE bandwidth accounting
> 
>  include/linux/sched.h                         |    5 +
>  kernel/sched/core.c                           |   11 +
>  kernel/sched/deadline.c                       |  166 +-
>  kernel/sched/debug.c                          |   13 +-
>  kernel/sched/sched.h                          |    1 +
>  kernel/sched/syscalls.c                       |  103 +-
>  tools/testing/selftests/Makefile              |    1 +
>  .../selftests/sched/deadline/.gitignore       |    2 +
>  .../testing/selftests/sched/deadline/Makefile |    8 +
>  tools/testing/selftests/sched/deadline/config |    5 +
>  .../sched/deadline/deadline_bw_test.c         | 4960 +++++++++++++++++
>  .../sched/deadline/deadline_switch_test.c     | 1115 ++++
>  .../testing/selftests/sched/deadline/settings |    1 +
>  13 files changed, 6354 insertions(+), 37 deletions(-)
>  create mode 100644 tools/testing/selftests/sched/deadline/.gitignore
>  create mode 100644 tools/testing/selftests/sched/deadline/Makefile
>  create mode 100644 tools/testing/selftests/sched/deadline/config
>  create mode 100644 tools/testing/selftests/sched/deadline/deadline_bw_test.c
>  create mode 100644 tools/testing/selftests/sched/deadline/deadline_switch_test.c
>  create mode 100644 tools/testing/selftests/sched/deadline/settings
> 
> 
> base-commit: ec6f6731538e0d45872eb279fdeb477bed152d6f


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
