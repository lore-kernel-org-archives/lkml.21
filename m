Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.139
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795300485;
	b=xXeeLI3UGtaj4FqW0kiRJXbukXsJy+k88VrZJ6Grh0+yRyaK5DVvt59mjrfisRpP0kiG
	 SD41fg5DQ7A43hE+mU+soGvkVcYdjOK+SEJZbmy3ilQbVU0yb0nbgMua6rdgahxoGkedW
	 dkxaopHQdqr5E/onE+VJIZzhDlO444bTAtwD4wYbgdqaJTSFKYwyUXkdhSBFOKk87CexM
	 JCF8mQnfRPfdul1V50XSdttBxgcQDJjBlsaBXAmAAYSyqvKYMHV39kPQWxJ8hLkX1+T8w
	 DEVo0L9zi4INOwh1smgXJQMxIiL5umwyj0uTi+snXBVXNZD5EnWjVAyPbk0SIiFEJsQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795300485;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=31xWAcgjVd43TaTUH1k/WNaiZej+rZCLMf33ie/TBJ4=;
	b=TBoNgxYMt639SplGRJqG6gChcM7JNdXhBtnAnbTWw4PY+6AZ7TXjTpEaqQ5vYSbyGILX
	 HJ7aT5DjGEX5ybJ1VNeMDpMSw4vhVZgrzw6HhwXbLD4YfTDPVfPyaM/MD+8Z1waNMwxhl
	 rz56g1K0kOY9pt5RBqMKhNmOLMqErgquYpNsYWB4tkMXD32y/iuiXIatOHhvwpTHSFPzc
	 IzQ4E8uyBcj3csZyKBsgqlZLl7V2b161UsQWRAJLzdOn617VQgoDqDoO1dDjTJzCKREMV
	 wnARf5XfhbcrR/BmPWh9toJO9hUGgPpqYCkjcEYbyLTmcFT1ynXTvF6AoEbP57Q4w+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.195.139
Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020139.outbound.protection.outlook.com [52.101.195.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2051606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 22:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2051606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYdF/wWfFTWgoaf7FS0bxSAk7yWPOTLNrlA/2L1TXLUuOAvhXluWpTnaV3gTeqTt7szh2TDhoArWXPmvFHLB65Jp3vh9hWyoKo+2nKUb27XBsIx8qDpGbYX/yvZi3fvGtPwA5zIV8YiGATMYvAcXoJJxJ5v+GJm/SJVIbViTyVRWrMipNpXlphDJqN4BwXW90GrN5mBRyIVnAGTFfPhPhzri/qQovKC96baExysveXFjedK/QUgfqUv3MPmF7uERo6Bnw4Kkrr9wTfyH6+4qqPdTgirokSihf9aAZSWMdN9ArGuktQAAuWCANCKYDctCC9lFdAY+r3cWeaOiTyqABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001; h=From:Date:Subject:Message-ID:MIME-Version;
 bh=31xWAcgjVd43TaTUH1k/WNaiZej+rZCLMf33ie/TBJ4=;
 b=rKGk0VkGbfuhNjtG58ro1q1wiKxkyYOSzOoDkX5Tt3fPHg97q6kRcuvcy5fG0KybBowZ9wDJSure+unYW2GryejaSTSAkYPmNmfmr4yK693RLQw1TWEKdnzZy15FMFS0F+0ZRajs+JUWcnqKVrO5Z2KBo4PDIVcWXQQATO0htJJpMKZy7DqDI3ZnuVozN+urRup1b7qNO/8plrXKFl1NqRuX0iHoDXrtUqh0sNUSFtwXgrHFNT2zbjv5hXai8jKGh1G6Oqxup+xDtp/gR0iCwc3EFX1ioArj7YslbLvZrm2J4OukIuYe4G7iAahAEHQ9WuyNVkAp08pYNanSkqioWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from LO2P123MB4190.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:163::8)
 by LOBP123MB8171.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:445::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sat, 21 Nov
 2026 22:34:40 +0000
Received: from LO2P123MB4190.GBRP123.PROD.OUTLOOK.COM
 ([fe80::f71f:a9f:c4de:687a]) by LO2P123MB4190.GBRP123.PROD.OUTLOOK.COM
 ([fe80::f71f:a9f:c4de:687a%5]) with mapi id 15.21.0639.012; Sat, 21 Nov 2026
 22:34:40 +0000
Date: Sat, 21 Nov 2026 17:34:36 -0500
From: Aaron Tomlin <atomlin@atomlin.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, 
	Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Michal Hocko <mhocko@suse.com>, Marcelo Tosatti <mtosatti@redhat.com>, sean@ashe.io
Subject: Re: [PATCH v3 0/5] Stop the idle tick on polling idle on nohz_full
 CPUs
Message-ID: <xgk7owwgn463yzcx3tlnpmtnxfej3ct6ku4thalcykbdh22imn@hqvqaed5szro>
References: <20261112163813.524336-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112163813.524336-1-marco.crivellari@suse.com>
X-ClientProxiedBy: BN0PR07CA0026.namprd07.prod.outlook.com
 (2603:10b6:408:141::26) To LO2P123MB4190.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:163::8)
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
X-MS-TrafficTypeDiagnostic: LO2P123MB4190:EE_|LOBP123MB8171:EE_
X-MS-Office365-Filtering-Correlation-Id: 653b3e72-552d-4346-394b-08df481fa182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|10067099003|5023799004|56012099006|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261026121527099003|261028144727099003|261026140227099003|261102123227099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+ZSMAs2qA60IV7zBD9l/mSLez7x87LittWv6CM9oWV17HLqPLt08XV6FepTcdkoQgD4yCrZ47oiFu3m0zygG7CcHJyNunPGrRgWqLVs/YmHMCdA+HK6YEzmluKje+pmKZLnO60ncQLLX4gc0QlUtq9MDjIjyC8rvI6sGSGzm81Ch6tiPJl81x4JGco2QhuZAXkAwGkTmNnhe6Y87cbsSn4ZAhJUNAy8a/bZ9otRjYKrbzDebm4XGyh/cjHeqj4CBL9RWc8dEYhJ/ggqsJin29+Ts3zYRIXvFs18bsFMedPeZtm/J2h6dyW6XCVERNeqiCJiGBA9fPM9YZySl+hA329gMO5w2+oeLVE4FJ/rc6Jz8kd94A0GHjFGJSIriywHoYrtucbh1aisqW5NOQ3d9ftCMLWcPM5pUKMaUjhweFK/4JeVS4NR21yh9aDc7X+4rG1lQAkDEano5RmO5eT5o4ZiHgMBkO/A3KkqqQ4tBsFBXL+Qj7nIm/HFX3IMpsIX12x6Px479zYB3SVwFeipEg3CYn+nJqW1CNIOT3Q5fBgEiJ3scFwWwDv0o8ogd6YVlWFotgvzsY11buIK6BQpsxfGl9a6FaRt4b769iXkdh2kruyOQGfqm+mrd2Xb7sryf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P123MB4190.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(10067099003)(5023799004)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261102123227099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGEyVWZaZ2pVVGJMbDdTWVZrTmlGTXpZNFplZ1VhYnhhUk1qYkRWcGJTNFpO?=
 =?utf-8?B?V09MSUVTVnJoRXJiZVFhaitjbktRY0dEWXNiYVV6UFNxd2VpME1sL09vWERq?=
 =?utf-8?B?NEVYaHZ3Y1VDQzRwTmRmalQxcDRvUk03WWpxLzFQZ3plbk1zbHlzQTB1RmRF?=
 =?utf-8?B?MWp0dm5kcDJEdGI5T0NPNGtwbTl2NkVZWFJRbGFHbmVSaGQ1b2IyeHdnOEdL?=
 =?utf-8?B?SmdoL3M3UVlqRmkyNURCMzY3TWx1QkplL2dOQkV5MnJOWlJEdWg4aW1ZRHM1?=
 =?utf-8?B?bWF1WXBDU3hmRGUyMjV3TExsNUFjUXU4RHpwVnFNbzlWNkdxRE9QajEvdHMx?=
 =?utf-8?B?ZktLZi9mdDhNM2xnNkFham0vYWptSkwwL2VySDJDV0Y4Zk55MEt4R1FPVVJB?=
 =?utf-8?B?MW5KKy9EVVhWZTVTdDNNb3VrTXc2bEFDbTI3dkp0TUFtQUhQSy8vZGU3YkdD?=
 =?utf-8?B?RWd4L3l1aEJ5dnIwZUhSeTZtL0hCTGxNUFcwQUZ2ZWd0VVJ0ZXdkbnArazhZ?=
 =?utf-8?B?QkxLNlE0SWVZeUJSUEloTU1SWkNNMVVIL1dWU0JvRlVNZXJnYmQyQjBhVWVv?=
 =?utf-8?B?aWJNQ2VtNEY4eGZnb004Q2dZbHlPQ0l5K0ZtbEt3dDNvN21MSXR4M2xGYTJr?=
 =?utf-8?B?eDF2V21ybjczU1loK21Rc3FYVFZFWUQyNGU5aVBaOEVqZWFjaEM0SUFDQkoz?=
 =?utf-8?B?SjczMmdmZDBiYTVXaUIvL2Z1QjdmMnQ1cVFrWmJPbFI5ZHE0ZEFKdHFrUWs3?=
 =?utf-8?B?cmo3SUlPM1pIWWk3Y2VNbW1FMjB6ODk5Vk9UakU2OVlPTjNqaFB0Sit3akhi?=
 =?utf-8?B?d21tTVFLWVE2MU9uVVRONE5NQ01JME1GeEJIMkx0elVPVnFkZEhlWnNQS3hT?=
 =?utf-8?B?aUFxNFFLODJvTGZRM3p6QUErSHN6VmJKbXE1YkxwVlQxMHdsOHBleGd1YUtJ?=
 =?utf-8?B?azM1QzBXa0ZFRUdXQitsQlE1M0QwQloyVjRUNkNWUUpIVDBuaGhxd3dlcDhV?=
 =?utf-8?B?ZTlsaUdnZWIrK3c2YlZiYnZUeUtBd1hYdkNOTE1rZC8rOW80U0V1azh3ckhk?=
 =?utf-8?B?cTFNdHo5WEVROC9LRnYwQWdJbG52SzRyanRUUXluTDFFc01XS015Z2lmalFU?=
 =?utf-8?B?Vm55UGkrbGUvNkU5VTEyTGpQT1ZBMXRVWjBsOWJ2dzczYnVpb3lRakZiVjU5?=
 =?utf-8?B?NnQ1N2NwbTAxbTlJNFZ6TjVrWlk1SytvNkdKSlJXU00rdFRtczU1NHl1VThY?=
 =?utf-8?B?SjRmMHUzb1gwSldVSUgxWGtrcEcvUmNxUVU1THdHaTJRbklmNEt0UDJwNzlG?=
 =?utf-8?B?RnJsdnNMa2kzOXRRUHAvNkNLT1VnQ3p1SGs2OUNVWTNoWDZUaTZmU3J5Z1Fa?=
 =?utf-8?B?R2NVSE9taE55S042bnVoSzg5di9yLzhVZkVibmd1Sng1ekE3ZzFRTHJyZGJI?=
 =?utf-8?B?Y045anhWcEFibUlTVkQrcjJveFA3cDg5bDlIVkgyb2VMcHZWNnNCTFBSTVRi?=
 =?utf-8?B?V3p2UVpPMmV4WUl5aGs1aUN4T3lWYnRhSEd0QnVzZWtGY2pwN3JVM3VibEF5?=
 =?utf-8?B?T0srRzZpOEh2WkJpQitEVlNzT2YrVEx4aW9qL3FpSjh3b1NONFdoYkhJYURJ?=
 =?utf-8?B?Mlg1cGlIZGdGWjh5RGZJRitNc28rVDBmZlpYSzg4SGtDTE81MWpPaXZWWWQr?=
 =?utf-8?B?TUJBN3VLdy9XZ1ZFS3BNa0RhQzVuRzVvVytTWkplY1R5SW9xVUkzOTZpM3hR?=
 =?utf-8?B?a3E1TSs2Y2hXMnVZRGthUVlwWGhPRUhkMEhva2RYaXdXWXBOUHRZbUFlZzZW?=
 =?utf-8?B?Uk9CSUFkNWduMHpaVmc4WDZzV1NuRWd6aGhtdGp3c0RnSDdiQ3VQZ0pBU1lV?=
 =?utf-8?B?NUtjS1Q2dnl3VjRpZ2N4WStxWGFZQWplcFFxM3BJQkdJQ0tGY2p4bDh5V2Zj?=
 =?utf-8?B?a2k3SXRrcGRtZlRTeXhybWVMSlBsQzljZ29rMlMwbDRKMGd2VVhrMC9TbnV6?=
 =?utf-8?B?OGtQS0JFSEYvR29CWnovY2JDekdvbTAvMnp6OEdCZ2FVQWxweTFCRGx4dVkw?=
 =?utf-8?B?UTY3QlBUSEtvZTZaeWhZZlpyRTJSeGZaWldRNVdSaHBkU0MrU0FnZVpEaE1a?=
 =?utf-8?B?emZHeHVlUFM0blBJMkJzWUhZRldBTHhRK2hzSFVBbjVZWncrdGNMMDFRWEpy?=
 =?utf-8?B?aHltUkYrTHlxWDl6Z1pmcnhuVHpuZDdUUW44OC9jRlJ4OGxHU3JnTkdoRk9y?=
 =?utf-8?B?UXZUZWgrclhSM1dXbExYaUR0QjJlOUYxNnR5YTE1Zzk4S29CVER1TU1LTFN2?=
 =?utf-8?B?aVgxQVhTYm1YQlc5M3lWeGhibTVOL05PTXNiT0dUMkNoZE55dWRXdz09?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 653b3e72-552d-4346-394b-08df481fa182
X-MS-Exchange-CrossTenant-AuthSource: LO2P123MB4190.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 22:34:40.3581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0iJoSSKs9iLfbZIn77BkDFFJhYbLLOlhN4r3/VgJY2dOlvIleRimZCi+52cFpFJggTqxFQezAqpN5HpQV3vPHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOBP123MB8171

On Thu, Nov 12, 2026 at 05:38:08PM +0100, Marco Crivellari wrote:
> Hi,
> 
> On nohz_full CPUs booted with idle=poll, the tick interrupts the task once
> after every wakeup from idle. do_idle() restarts the tick before polling,
> and on wakeup tick_nohz_idle_exit() only re-evaluates the tick if it is
> stopped, so it keeps running and fires in userspace before
> tick_nohz_irq_exit() stops it. Without idle=poll this doesn't happen:
> since commit a5183862e76f ("tick/nohz: Conditionally restart tick on idle
> exit") a nohz_full CPU leaves idle with the tick still stopped.
> 
> Marcelo Tosatti proposed stopping the tick on polling idle entry:
>   https://lore.kernel.org/all/aQiWfnnSzxsnwa2o@tpad/
> 
> Following Frederic's review, this series does it only on nohz_full CPUs,
> and handles on the target CPU the cases where stopping the tick in polling
> idle would leave a timer unprogrammed.
> 
> [ P1 ] tick/nohz: Re-evaluate the tick on return to user space
>   On nohz_full CPUs the tick is re-evaluated on IRQ exit and on idle exit.
> 
>   This is not enough on return to user space. If the tick is left running in
>   the kernel, for example because a tick dependency was cleared
>   (tick_nohz_dep_clear*() don't kick the CPU) or a timer that kept it
>   running was cancelled, it fires at least once in userspace before
>   tick_nohz_irq_exit() stops it.
> 
>   Stop it from context tracking right before resuming userspace. When the
>   tick is already stopped, the common case, this costs a few flag tests on
>   each return to userspace.
> 
> [ P2 ] Don't handle polling idle as dynticks idle
> 
>   TS_FLAG_INIDLE tells nohz whether the tick is managed by the idle loop or
>   on IRQ exit. With idle=poll it is set while polling, but cpu_idle_poll()
>   doesn't run the idle loop again on interrupts: a nohz_full kick or the
>   expiry of a stopped tick isn't re-evaluated until something sets
>   TIF_NEED_RESCHED. The tick is therefore restarted before polling, and on
>   nohz_full CPUs it then keeps running after the wake-up and interrupts
>   userspace.
> 
>   Enter dynticks idle only on the cpuidle path, from cpuidle_idle_call(),
>   and leave it before cpu_idle_poll(). While polling, the tick is then
>   managed on IRQ exit as for a running task: on nohz_full CPUs it stays
>   stopped if possible, and nothing is left to do on wake-up, so the task
>   doesn't pay for a tick stop after waking up. On other CPUs, leaving
>   dynticks idle restarts the tick as before.
> 
> [ P3 ] tick/nohz: Remove tick_nohz_idle_restart_tick()
> 
>   Polling idle now leaves dynticks idle through tick_nohz_idle_exit()
>   before cpu_idle_poll(), which restarts the tick where needed.
>   tick_nohz_idle_restart_tick() has no users left: remove it.
> 
> [ P4 ] tick/nohz: Reset got_idle_tick when entering dynticks idle
> 
>   A tick firing after the last tick_nohz_idle_got_tick() and before
>   tick_nohz_idle_exit() leaves got_idle_tick set, and the next
>   cpuidle_idle_call() then assumes that a later dynticks idle period was
>   ended by the tick. Now that the CPU leaves dynticks idle before polling,
>   this can also happen within a single idle trip when it switches between
>   cpuidle and polling, e.g. when it polls because the tick broadcast has
>   expired.
>     
>   Reset got_idle_tick when entering dynticks idle, so that it only reports
>   the ticks of the current period.
> 
> [ P5 ] Documentation: no_hz: Add tick stop in polling idle
> 
>   Document the above in the idle=poll item of "Known Issues".
> 
> With big effort on the Claude side, I made a test suite to help testing
> the work:
> 
>   https://github.com/DispatchCode/nohz-full-polling-idle-tick-test-suite
> 
> The following is a short summary of the results.
> 
> On x86_64 guest, HZ=1000, nohz_full=2-3 idle=poll), a task alternating
> 100us sleeps with 10ms of userspace work, 200 times:
>   - ticks in userspace:              200/200 -> 0/200
>   - ticks while polling:             35 -> 0
>   - housekeeping CPUs:               unchanged (tick runs while polling)
>   - P2 without the kick change:      15 of 20 timers enqueued from an
>                                      interrupt on the polling CPU lost
>   - P2 without the stopped tick fix: the second of two queued timers up
>                                      to 1.9s late
> Tick dependencies (POSIX CPU timers, two tasks on the CPU) and CPU hotplug
> were also checked.
> 
> Thanks,
> 
>   Marco
> 
> ---
> Changes in v3:
>  - tick_nohz_user_enter(); moved outside of CT_STATE_USER so that also
>    guest can benefit from this.
> 
>  - __tick_nohz_user_enter() has been moved after
>    tick_nohz_full_stop_tick(), so that the same #ifdef is used.
> 
>  - P2 now uses guard(irqsave)() instead of irq_save(flags) removing also
>    the "goto".
> 
>  - P4, Documentation, now is P5.
> 
>  - Introduced P4: reset got_idle_tick on tick_nohz_idle_enter().
> 
> Link to v2: https://lore.kernel.org/all/20261111114406.346953-1-marco.crivellari@suse.com/
> 
> Changes in v2:
>  - P1: Only for re-evaluate the tick on return to user space
>  
>  - P2: Changed as suggested by Frederic: TS_FLAG_INIDLE is only set when
>    the CPU goes idle and not in polling idle; tick_nohz_idle_enter() is
>    called on every idle loop and runs with interrupt disabled. The tick
>    is not restarted before polling idle, so
>    tick_nohz_idle_restart_tick() has been removed.
> 
>  - P3: Remove tick_nohz_idle_restart_tick(), now unused. 
> 
> Link to v1: https://lore.kernel.org/all/20261106160621.347228-1-marco.crivellari@suse.com/
> 
> Marco Crivellari (5):
>   tick/nohz: Re-evaluate the tick on return to user space
>   sched/idle: Don't handle polling idle as dynticks idle
>   tick/nohz: Remove tick_nohz_idle_restart_tick()
>   tick/nohz: Reset got_idle_tick when entering dynticks idle
>   Documentation: no_hz: Add tick stop in polling idle
> 
>  Documentation/timers/no_hz.rst |  2 ++
>  include/linux/tick.h           | 10 ++++--
>  kernel/context_tracking.c      | 12 +++++++
>  kernel/sched/idle.c            | 13 +++++--
>  kernel/time/tick-sched.c       | 65 +++++++++++++++++++---------------
>  5 files changed, 70 insertions(+), 32 deletions(-)
> 
> -- 
> 2.56.0
> 

Tested-by: Aaron Tomlin <atomlin@atomlin.com>

-- 
Aaron Tomlin
