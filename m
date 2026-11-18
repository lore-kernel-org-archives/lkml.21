Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.86
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795023314;
	b=h3fK5vWx5KeHZzELvAU7C00SuSAnWfnVjH3WYJn+CF568itQhbTvL0xvk6QNPq2aYu2s
	 ejVAeYC/bjjRdVlTHgACta2vPd0btV8OXd0zf8WLutnsq6Z5CoCP3qyz4meNuCmNmK6zY
	 SEUxNzjENF2d3+N6QTgygA4gTGICJXzdaYeA/cyQr6s3lFDL5c3PUAW/AFR4LHEEKrB3+
	 tzTmrz8uSkJ+/Qb6g53pXXiXqye9W4HubueQR4GA68c/v5Or6S6g9GAb6d7p6D33UbdTT
	 65Bgx1cSXRmeFQck+P6EeuNfMz074Wlp5NpKAkTDBqbStV+kb1puBL8FKBuv6bEkcOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023314;
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
	bh=65WmSAtIryINBdGGZQOzRP1t2SnosEV90Hho/vfhhM4=;
	b=axNVHqAbDu7M0UNSk7YKSxWXwL2QmonvqB2Q7fC9sdGeFdmHGTqPpl+uZ+dWCuZAg2XL
	 2x6WY68MgS06tGYG9UW5g851G9aULQ/nNyrECVY53l+NigQNYP4jwILuD2HwVOHkJE5xg
	 8P0FTkpOEdRlGiw594X5Q0vV/tzmbuhHpq7dayFqLsQQZ2AZAGQJFus9r1not9ggEDX0q
	 5iVKsLqA8qo73nR9Kd3a35wrzXpYNRFWxt5VDhCLyg0uLtlWw8gepZZBn24l8OF1ZGzqu
	 tUL1Olym01hhPTDD61bd/4A70VZX7U5RGHk+bDrV+mMt7UX8OuIWGYHJk1cN8WwOWmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b="dD1MIje/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.86
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022086.outbound.protection.outlook.com [40.107.193.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D72606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51D72606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=dD1MIje/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHK1xqmo1tUtwrOWVoJQRunP4REoFKVAVEXVHzI9jhxJY55Kz8W1f5u/Zj4aFeK8eEt3wAjOXpzwy0kOyYe19Z2CzBbv2062lVzNLOuWPIN4oKxOhdSeVyvXuaB8tCDuvFzkjiv+GXqc55ii/sWxiwgy2d3lTklL2fF2PnLZt9KTSNXvtidZmvmn8BcnL9vOYsIXqWXDokpXp/CyKajEfC/zjzl6aBFGEmG+ZNpLiXFObPbVy75TRCohvaQA4Qa60p5MeAr/zgxFRVkAvxVzVPGUPv7S23NjoCyVm+OUR67i7jcHLFnzvsh0T9HU7deSlJWTL9pTpHR3/N2/tlJgfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65WmSAtIryINBdGGZQOzRP1t2SnosEV90Hho/vfhhM4=;
 b=v9DL7/0QeM7rvHuRbzI4lX+7NhucxYY6E8Ev6LOgPAP5Uz880zuOYKuXwqZaG9Oau9LsNf3KH+II7fIJme7+ec/UYZynUx4sQgPZlDD6t0Vq/rS+XqOaA6RgC4gu0kvcwvRiS0UEEVnxtsPefpOwIsnpiJcCVRM6BRExLyF7eB3G6R/2+Rj296C+zKiPZCAgiGLJ5FWjvvaYzs5UZcoOZpzH5LSCJ+jAU3MfeiNaL0LnhiPvBEqUEhQu8Ss5jCkhfFE6ui1esDKntslI7J65u7LBuZYIXfWgISiamQh3UXRfCkRG0dDanh0HD3v272dRAJN7GnCzgSK7RadG5DXNhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65WmSAtIryINBdGGZQOzRP1t2SnosEV90Hho/vfhhM4=;
 b=dD1MIje/IiTB5TgVXMG82t6XVGmc14O4qSqydqcDkrhIRSo3G3Ek8LARB67vrM5FSnMtBBCxKV6CgWnxBQIPtLoCcmHzDdgFX0M5M/9SntpSbOSIZvSQsAGvKbWLlM0FJk9bfHPdnl83jP+adCK9pMnjDCy6zxDHlvLw0/DFhkWb73ZCCVVNOUNx7jQBOWWLhLiECxUiEScNumoIEpjykfNw1BwXEz5fMbz+OZUah95muLa4WD4r1vCB+w3Xy17w54HCD5ZiYrwlB6w+23r0HXLikRvevjAxW8G400dExvZeI0P7x5bldSvD6A78Ooe1DGV8ZaJ8WeFUYPUZDTMGOw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by YT5PR01MB745156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 17:35:11 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 17:35:11 +0000
Message-ID: <64f061ff-5a1d-44b3-a759-7daedfd67996@efficios.com>
Date: Wed, 18 Nov 2026 12:35:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] sched: BUG() in select_fallback_rq() at boot with
 isolcpus=domain on the boot CPU and CONFIG_CPUSETS=n
To: Peter Zijlstra <peterz@infradead.org>
Cc: Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Waiman Long <longman@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Tejun Heo <tj@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org
References: <20261117144817.265109-1-mathieu.desnoyers@efficios.com>
 <20261117150220.GG1813469@noisy.programming.kicks-ass.net>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <20261117150220.GG1813469@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0168.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::27) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: YT6PR01MB491026:EE_|YT5PR01MB745156:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e8782b-d0da-4d01-2ec6-08df459a4bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|10067099003|56012099006|4143699003|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IYr7piYTND/naHKTAxlAiR9YYkO1HDmQ1mTUjnw2MziMJVBOYDByj6ht6f3ZFPNpLV8yDThzSRyaGqi88LMj2sM0U/jWF1Q2NZ4nB7GxzzZ8Ut2pLJKDDIFhcsUznM6/hZyCeCgDRdxz+812+OEkhRwEAGu/40MhvsJS0orKtCzcB4D9xa6A86lQzbd+ZBbVBzNAVlYphbyoJEXT/IDRE3ck4XoufoOL8MlVEac0t3DwNQvMMcCxV12HIIGriMrvDFPmlrfOeZG01FaHCIw6fZeK8cAPvcVSHk4sJmaEUNcJufLkmUKGI7M0PEzUt791NT8hTxh/eXYxo9ORacG7A6Nx/fS3irO3jwQeeHKyA/k8hS2E4VPNJMCPBPu7F/m6BFVbTKxLQQr6rDGmuWUdPCko4/nmJR2twXBmKpKNr0pyU/agpDQUxl56FzHI5iGt60cj/FxmOPnsqmKVEE6FXGT82hzCzCg/kRnclKcLF8uSB3ecGTFsm0Vac0UWU+2768QSjpj6kmCWB1QlUTRWaZdHIRS1bbpcsBY5X3bv01oKziyvAlaA5UZckjQMJGl4sqD1HUI6/VJdpcJaQfulOjgd4P88UVjMnmIxjXGr2t4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(10067099003)(56012099006)(4143699003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFh6NCtsNkM4MWx0V243M2dveWZGUk01Mjc0K0VidC9HQ1BRazU0NlJNYnNl?=
 =?utf-8?B?dXhieHZWWGN6M3FZY0VXdHRHRjBYQVplWVFBWGhHNEVJa3dwd2NLUFdVSVJO?=
 =?utf-8?B?OTJISXRnazJXVjVCUVZCZTV0RURsd29qVVBUc2ZHZUthNjZaNUhkbnhUa2cv?=
 =?utf-8?B?QkNRMnFORW1GRFpvcjQyZk1Gbm5EVGhKQW5pTVdqSnFuYTZ5cHR3bG0ySGxp?=
 =?utf-8?B?WDZOR2FCd3dzR0tPb1g2c1JBQ3VXVWhzSFB5WFVUYzcreE9teDloQVpSN0Z2?=
 =?utf-8?B?MXgzaXFnYk9tcDA0ZXNuRlROaTRpYVVWbnM3RDRWVk51ekNrdWNZelBOWVlo?=
 =?utf-8?B?SGo5c0l6enZlNmE3Qjh4L09iUVljOFpzeDlqSmpMM0JlcURWMHBUOUFJcXgz?=
 =?utf-8?B?dW1HdkxUcU9raU9ZQVM3MXRoM2E0Z0NCYVlrS3M3UXcxUzlhMDc0cmd2aUhK?=
 =?utf-8?B?Mks5MlY5RnFVVW0xOFBMcWkzbUJZUGFlQ0FHZzBKZkV1enh2bTB3OGRaV0Rs?=
 =?utf-8?B?c0FKUGFFakVSN1JFRVh2RVVwbkxJR1JkQ0E1MGRMWUZCU3Z6dnRDaFZNMlVy?=
 =?utf-8?B?YVBsSnFJY3h5V1d0cmptcWF5VGVYdXB6clh6NGtVcEZsZmpUc1hpVjhlRE84?=
 =?utf-8?B?bEVGU3ZXbUtJZWNmSGFEVVRHQUVzUlg1a3Q5eTJlUDhKTmVHUVp2QU5wR0NZ?=
 =?utf-8?B?bzlxZlJqU1NrUVdOUldYWmFtMDJWVkJQSlJURHdSRTZFVW1LNC9IMVBDbXQw?=
 =?utf-8?B?SGM5WGJrQWsvN2JHWklMdzJJZFNjUzZZMDd6UDlxendQMHcvbTc5S0xWbUN0?=
 =?utf-8?B?WGRrL213ZjY1azBzbWIzYUovSkRvYnBRSkVDTnZqeVAxNjJDMWMwUElpamsz?=
 =?utf-8?B?TU1lYjVIdWZIc2NpZjQ2Z21iN2FtSWY0VW5wVmYzSU1VNThyU2hnalp1Mmto?=
 =?utf-8?B?SkczVFkwUGJOQkVudUZFMVR0aXlJdGJPOGlZVlpoL3FnK1RuVjU5M0QxcTNK?=
 =?utf-8?B?NnhyTWU1WEl5SUtVenVKb0VFY1NlcFRtcW1Udll6VDRKSEdQVjVYWkxVelJi?=
 =?utf-8?B?aWFVYUVENk9pVVg5SjFMWFhHcElDbmxQM3RFcGpFdlFBc3F0VXVlb1lWc0sy?=
 =?utf-8?B?UEovQXNwWjNXVTJqdXEyeEZhTVJ2NnBsc1lhSlhiOHFESEVWbC9WckUzeXdv?=
 =?utf-8?B?TE9QVXVUR3dGVGU3bU1POCs2V3VzU2JjN3V5cUtTS2pUS25VRHJzK255SURz?=
 =?utf-8?B?YzVjZU01ZHo1TlcwODBJc1o2UnVLNE1kbklNQm55dTVuSUdSb25tdXJ5c3pk?=
 =?utf-8?B?STdyaGUyekhNblhwNmNwQ2ZIb3ZTUXJYcit2UXZRd3pmcnVxWHpWZzRZRUN3?=
 =?utf-8?B?NG9xQnNGeFM1NmJGaXNOb1hrUVQ5Wm9oakk2M0xuM012dGR3bHI0TTZ1aEtZ?=
 =?utf-8?B?U2Rzc2huTEt3cWV2ZXVlK2xZZkxjSDEzQkRrSE5VVmFkK2JzWDFNV3FEQzNh?=
 =?utf-8?B?MUtGYUo3TkNiNnJYbnJOZlNxd3JKQ29SVDRuaUVUamVBeWR4dy9tMVhGRDBT?=
 =?utf-8?B?Z0pqeTlZY3ZZNGpheEgwclp5Zkxja0JsY09PZWxIOXJVTVVUSjlZNWVlb1ow?=
 =?utf-8?B?aUxrYzZYS3pYalp0OFNLUkw5bDNNR1lQZmdOV0JRUWFaOThEdy9wTzNhR0V2?=
 =?utf-8?B?c2tGY2diTDVYSEFPYm02YjhkTXlmRFducURwSFZhaVFXVXB4akRlWUg5cGk1?=
 =?utf-8?B?cVM2TmlacTJGd1BOR0kyM256QXBHQk1ENDE4aXYxL3Z2WTlUMVZ2N2JrbU1r?=
 =?utf-8?B?Ky9BdFI0ZWF3UUgwTSszcjVtZVVJSVRvd2ppNmRoOFZJMVhxMS8xZE0xYVpp?=
 =?utf-8?B?UHhDejJaQXRPMHl1VkJMRE5QeXdFbjdrb0NUa1JXTUJmb3NISXZvZTJRRHZh?=
 =?utf-8?B?Q1VPMzNzOUtpVEdYQkpnTlMxN1JkZHVDYWZYSmhTb2lpeGlUd2Z5Y000RDJT?=
 =?utf-8?B?VHZrNkpYZzA0bmU2azZJTHhXYnBlUnorMVB1VmtlUFhubjJrQk5KZGJDOWc0?=
 =?utf-8?B?OGh6ZE80dnMzdXdKMDFubTFPRlpIQ05ORm5EZjQ1dTdVZ0JOdldkZnJlSW5o?=
 =?utf-8?B?SzZQNUVqZ3U3RWMzOFROd0RFSHNxTW0rN1V4OWY2d3JMRTJrYU9tcTFDamhQ?=
 =?utf-8?B?TjVPVCtiazVYYVZPUVdEMnlDMWtqcFgySjJxTjBUeW5nT0tTdGQ4dytEM1lG?=
 =?utf-8?B?WXZRcG9Sb1grVTdqUjdFRjdrYU5CbWVtWnpsTldEQ3ZXeFQ1dStneEl2TlVq?=
 =?utf-8?B?R2wyK2JGbEZldk10bHlHUFU1MHVxeXhMYVdmTE5wUkcwZUNRTThTYlhrVXVk?=
 =?utf-8?Q?NNNIwYrMm+2hnx+ariOj27vX3rkIUbKGoYNKd?=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e8782b-d0da-4d01-2ec6-08df459a4bee
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 17:35:11.1851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvzBLbMxS6HUcnYcxc3ChDy6kFXHyamYZemmi5GhjKssoOVkrC5p1MAVAhZDpixljphs1HwWVs13p/QY4DzejKZu7g0x7meeaE8xvbPem4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT5PR01MB745156

Hi Peter,

On 2026-11-17 10:02, Peter Zijlstra wrote:
> Arguably, marking the boot cpu as isolated is asking for it. Is this
> really worth fixing? Or should we look for a better failure message?

A clear failure would be enough for me. Today the kernel hits a BUG()
in select_fallback_rq(), and nothing in the log points at isolcpus.

It is also a regression. The same command line boots with
CONFIG_CPUSETS=y. With CONFIG_CPUSETS=n, it boots with bf5b0c27fad2
("sched: Switch the fallback task allowed cpumask to HK_TYPE_DOMAIN")
reverted.

Waiman's plan to refuse domain isolation of the boot CPU would cover
both, if the refusal prints a message and the boot goes on. It changes
one setup that works today: isolcpus=domain,0,1 with CONFIG_CPUSETS=y.

Waiman, I can test a patch in the same VMs, with and without
CONFIG_CPUSETS.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
