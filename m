Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.128
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795536779;
	b=vKydWWJiydRhIz91mi3Xu05fK3paTSEco2I+fo7v9vKL4U+bSpBf0okkWtfKHJBxs7oC
	 ZkFk7DaByQrB4oThfpF7BzDjAThuKOJX+Czo5y3C46DxA1PhPLLwsIFTpS2xgJFhaYMmu
	 7MKAC84XZW2x1qEbm6rdmOzRvDu9xdR+sJvMTUNw1aaQ04K7z9bIqUsIfav2vSwyDIfXM
	 GSW+0p0U4Z/wLxi9wZ0xU/5zrzIZYVx6CvRKr4lW/Vl4mhnos4LoiymUn88PhrfKr/ifm
	 wlxspDX9Ubue44QoB6UQuisONGy6dGjd+AMxpQiFFWDYCsq/KfN+4WpukdETIp9ew7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536779;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=0rTu6k40syfXSu7KQAg8rPcVHndMLYFIFhtEsk2GjRQ=;
	b=p0ojcI1e87lHCwziTQK6IwQ9Alfu6kYz0NyEMPmZ1rn+xfzIUOPiSdWw3WXatiGghJsN
	 GZG96fFITX+q6NQcL+sZF88F9DFzSHNEVAMlr4Xi4tOrb2F/0y2MX3VjhZhtCftI/c496
	 iO+6qz+CwFru00Qr09URYlFJSpg7piyYM9LNS+KCPT1DdPBdd/YYAxJgOn5c1+HQjGx/O
	 6ORDSR5juv6A4hsFiJbKTaG1de66PNHYzp56Rvh7ckfqX0EfCcbM0Q75yTRGZSSHbnw+/
	 donUhk37wBunOGFY4sFmoEpGd+jpxzej4Pi3QKF9ao+MEmdnJwwXT8QIV97Y7pKoJkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=yacoub.de;
	spf=pass smtp.mailfrom=yacoub.de;
	dkim=pass header.d=yacoub.de header.i=@yacoub.de header.a=rsa-sha256 header.s=selector1 header.b=G4wI14du;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.128
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022128.outbound.protection.outlook.com [52.101.66.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F85F606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F85F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yacoub.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yacoub.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yacoub.de header.i=@yacoub.de header.a=rsa-sha256 header.s=selector1 header.b=G4wI14du
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCQ5ar25XMm5NN7aytAuHMP1VpWcai4+/QLphzKSlSeq2hloTDusVyZRlpjL2OgE4vr6p00g4qvetYjga0+BUiGqBla4IsiGr5nQU851jgULlfZKuyAXZGB2sxsDUkH0MJXHBbcxao/O9S2NeqL+2WJXgVciGjruqYFJ3rkd7VnT5a8LzVtTE+2ah+wWHjIuQWZQOHsKK+vk7IyvWB2URkHMjxk6gow8BjCXdw7BQtysQSOn9FHlkvByHrpAGiNjI5F3VJHs0jSL+c8PYqJduP06Ny7JFJLA60Hc+VL+4EvtgFxAnSbTPa/JNFBEXRmVAgimC/O+qRrR+Mt0v7RHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rTu6k40syfXSu7KQAg8rPcVHndMLYFIFhtEsk2GjRQ=;
 b=n3W6AUjY2C/uanUs8hL0rz/zWAt0DjZHqvLJg+PJ7CrK9jWl9zAGRlhMelk1OJQCoZohoIzZ0idwKM5qnIBKREemNnnFe4N01eQC46rIhOv2HdD/5SQh/6libmRdlNqvWwQtIxr7l/b5304+ujTXRljFM9mw1F2EKLFiBfKd+wf8pxGxVUGPpZ8cL3md0aHGdJaJgFgJtwCEEPAX1kFmPpF/4x1RQUmJ6uFdjoep7FJ1knLbdXK0SOVBt6xmcyReWTer2w37GEwxs5a8auW1wrEp1TGHkW+YDg2fgeYIx7zYgOJG6QQE+gYGgHCJ0xJtInDYtNVX97xXQ4t7dnDzDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=yacoub.de; dmarc=pass action=none header.from=yacoub.de;
 dkim=pass header.d=yacoub.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yacoub.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rTu6k40syfXSu7KQAg8rPcVHndMLYFIFhtEsk2GjRQ=;
 b=G4wI14duqfvHUCEJZlfyeN9yWOqcK8qSQwCmt1/OaPTsIk6JbJp8MH9OGdxPR1kG8l9qxyKuq99cV7mE22rBURWKivRGnUi1+a19pb+S0ztsHZ+9kiLWmsrDwjsN42IOO1TSxoaEsADDHw+8YuTHRA4NTqaScEKQoWH/NO4+buM2jepcTRrjs5h4QRVSGGSBGGTA6MS+ZMqP3wMJoRm1e4qOfMBts/HIRxhXTCYtql/sQVerwhnee4ZAzb5bSyNSGytgD95ARvuS//0maAvmkLc0YCWirD770j3dbTjeO2WRY2E329uJyUucMpTZ/MtMg2illgDLtjIPBnceJVG49g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=yacoub.de;
Received: from MRWPR04MB12069.eurprd04.prod.outlook.com (2603:10a6:501:99::13)
 by AMZPR04MB137010.eurprd04.prod.outlook.com (2603:10a6:20b:7c2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 16:12:54 +0000
Received: from MRWPR04MB12069.eurprd04.prod.outlook.com
 ([fe80::37b9:4b72:7864:5809]) by MRWPR04MB12069.eurprd04.prod.outlook.com
 ([fe80::37b9:4b72:7864:5809%3]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 16:12:54 +0000
From: Ramin Moussavi <ramin.moussavi@yacoub.de>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, John Stultz <jstultz@google.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, arighi@nvidia.com, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/8] sched/proxy: Reschedule when a blocked task is woken under a proxy
In-Reply-To: <20261116192638.233125-2-mathieu.desnoyers@efficios.com>
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com> <20261116192638.233125-2-mathieu.desnoyers@efficios.com>
Date: Tue, 24 Nov 2026 16:12:52 +0000
Message-ID: <179553677252.1695019.11863871723071982366@yacoub.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::12) To MRWPR04MB12069.eurprd04.prod.outlook.com
 (2603:10a6:501:99::13)
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
X-MS-TrafficTypeDiagnostic: MRWPR04MB12069:EE_|AMZPR04MB137010:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b249b43-fe20-4a85-de5a-08df4a45cb94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|22082099003|261009223027099003|18002099003|56012099006|4143699003|11063799006|10067099003|5023799004|261021121427099003|261026121527099003|261021123027099003|261026140227099003|261028144727099003|261022075727099003|261022105027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	9WN6KjvpZ9cv9OqWrSBv5zJW+/c/myXJiD4d4abku925lky0RPWiKEiKv29tK9CRnLlrsLQ6Kq5CFxwzfHUiFRggOh5ZQe1QLIGi7XprTkn/brLwTuhC8jjI4C9s1jT8h4OMBPzLSnS0Lz5y81i1H680+0sy8M/AnBjg/Wm7ah5VUSNgo14IiFiFnhJAAuezDSWau3ceXF2nPEKxcw4LIId/9gkGVOUJOm5pAx0zo0HMUFoBwYKEk7WeZkgHriP2Yt/KPwOYCSL5aMtmP096S1q0Rbn2HFwk5gMojmC+vd+XKRRV+733BiQG393AffcKpp8ni+oxoqMeuyBpaMRylvDBxUK9INW4gpuhskhbqAzE4xQ3rWXQzP6pWuSHcacwsUnCdtqHceuXIOgrv1Od/oIZjH0+d/2HP5msuxuG1pizVERZUTCKr93DTA+DF7yAT8iuUAkPC5zdha4Orqu+YVtYEWHPzOph21fVq1LzJm8Z2ZI+XYxfrXudF0bRTGN9EKa4QAO8xT0t04FuOZ1Q6EZzDGww52eilxWim9LQoEsMKMDtAnhCcP8Y/4eqJx90+26iHAbAc5g3wMW1BChWwIIvJwaAcc1IsN3m9dfSC2qCZeKuEDYFfWmqgzD+wVVqrA+ZMVEmATQL2wrB0aLjT5Tf0NL9Pb13NAMlGVnV5iM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12069.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(22082099003)(261009223027099003)(18002099003)(56012099006)(4143699003)(11063799006)(10067099003)(5023799004)(261021121427099003)(261026121527099003)(261021123027099003)(261026140227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261102123227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VWEv099esyyD/tVrHhGzG+chkEVmtV43yHhWUh1Ta5u1Prq9YOqLgTwDCKm9?=
 =?us-ascii?Q?csOdcoldg2S3dy6gwCmfsMecvxETSnF7qVzecCkVfjG9z7zoiapdFMCofDmz?=
 =?us-ascii?Q?4F0CxP37tEgEGihnaMOyoisH18VqZ0x9JPI60Uop2tD7YlpntqkdHwj8gn7a?=
 =?us-ascii?Q?C5Uy10tl8elY/firue2oszwqTP+phe72rJH0CPO3R9qTnSyKo/YcJ/1yM9w7?=
 =?us-ascii?Q?itzFu1rLdJyGOFXYb2Wk8ModQuSZWfyK5t98QBeUvuAuzbfrWz9aDXCTNQM5?=
 =?us-ascii?Q?yLIpDh5ay9Lymb7M6rQe+xesrCIUhHoqnudVNVDTHcf8ShTuPBriE8xd0C/R?=
 =?us-ascii?Q?KBkoCW56Ohr0b82zTQexjM7Hq/SYEKYNJH/VjrcnR1lLpkNp1P4WZ5v84Dj3?=
 =?us-ascii?Q?LGjVURHVn4GAuMgmDg43XBiUpoDPHdCOZQDo7wA0Hqm8iA2lzKGae7KThIPs?=
 =?us-ascii?Q?SlGQ3qchonu7OHOULZVMDmKZj6NlzyMZ/VxJ8pwtdy62FBev9fzdBXx8SEYS?=
 =?us-ascii?Q?Iwpi/inYiMxU7f9ixCrNtcUjBEpOyM+y4GYVa8GXUFTVo06/lIFqCC0bZAk9?=
 =?us-ascii?Q?EGBtJVdvP4VuZP9d3vbng75fvUCpJB+Q0agZTrH+eCfrD5foVCc91uwGpC8E?=
 =?us-ascii?Q?+fx0DDW1NrjFax+2DTDAYZw9YQQYYlnbI6RQnNzs3daKiJed7GHrk7Torb0N?=
 =?us-ascii?Q?OVATK5ETA2FOm+f2P/U/EwesH7GHK0RkAFhjM1T0eRbap+Z3eK8qqv4MHenp?=
 =?us-ascii?Q?9MiGHhkuowlIpMF7TJNfrgCc28dbPa61bY1DFJ4vFD2wcIHEATSTCcqPLaw1?=
 =?us-ascii?Q?sivgOPtDi24Th7U2Z2SwQD6bbRn4+G+gIFCwSMmAYWtZHwYiM3yet4Y/1lit?=
 =?us-ascii?Q?ZANAarAYTFSIN7qEVJcTMNzPPuAQKH+HFxeerNECVlYDo8cPlCIKVxdF9SBY?=
 =?us-ascii?Q?syMAiGntg0hPWcXJaj4wVC3/buMTiXLpWzkik2uXK4+p6dZA9GsbDygvvZfi?=
 =?us-ascii?Q?po4YN0XS+DJVQ37cVO+r+8BlFlOtPrQE8Q4Jm8BSyWkTChHM/LqpdfjDH1XH?=
 =?us-ascii?Q?pmnyAKEf/K7U8vkIYuQZ3bVPXXFyvjPS6vkopb6k3dfzXRMhSd+yZ5Qekpd4?=
 =?us-ascii?Q?e7nebfZv0nevDO2wo7TpnhAR8L2518H6MR3HtdpjMxPQsxdthYXqgwQ//+jY?=
 =?us-ascii?Q?b3y6ZjEwOxmTPtc3+6TjEv2n3xNDY70f75s7XX1YJz0A1SYE/ziqNtWYFP+M?=
 =?us-ascii?Q?hHy7UbBLHrWxH+CFlBAoK+Isad+HmYF3KsF1Sk5X0ceIZx2sZVledxRQiuGt?=
 =?us-ascii?Q?nj7PBBFf1p1qIkWal0bhKJM25TpTbb1TvmRgN8F6L51qcqqHq+PT+G+0wWMy?=
 =?us-ascii?Q?mKJnAH4DgOs4XFVEmTwGzMBowjCHFe5qtoOlltcUjOnaGWXzhsh96aCEOxms?=
 =?us-ascii?Q?8yf325LKbyOQzw6fLwJxyjD7zjMn4qNo17cIyE7gWUE2UC6lJYtUZQhOMcqm?=
 =?us-ascii?Q?F4W1Le0Y0ZJQF8vWv9LA6GKPQVncg2ZklsgPrxDeI2NnKfh1LgiLQWH/dwFe?=
 =?us-ascii?Q?I/JEdUOOHhkNr4e1Kf6aPbkPzhvXPTtVks2kUkJnrJ+kPU2IsgBcxoFtXRfw?=
 =?us-ascii?Q?gJrkA01lyfR8fufM39DMEyg05PGoeMi+aLfhETHOMSc/I2pK6+XN83YC4ExQ?=
 =?us-ascii?Q?A3kJ3y4xbVctKbX0DbSzkaSfY9wmXGIbM2egzaUwAuQvUXf7oYsYXWykKMQh?=
 =?us-ascii?Q?R29jUW5wx1CLmYzpBtnlgaZCkW61MJU=3D?=
X-OriginatorOrg: yacoub.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b249b43-fe20-4a85-de5a-08df4a45cb94
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12069.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:12:54.3620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2e96c4fa-c0f0-4eed-b0b5-8f85f5e8376c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8k1FCaMK56lzuyxFsubwCJhn0e5Q5gXeMiamD6R++imuoIv7GIM1FsEAneqoxJ6yrf3Ipr+Er8vOQJ89xzdsnDz9hYvrk07PIJkczcZoNPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMZPR04MB137010

Hi Mathieu, John,

A field report for patch 1, from a single-CPU system running 6.18.y.
We tracked down the same bug independently on real hardware and only
then came across your series. It may help with two open points: the
shortcut in proxy_needs_return(), and 6.18.y.

System: ARM Cortex-A5 (SAMA5D2), one CPU, 6.18.64, PREEMPT, HZ=100,
SCHED_PROXY_EXEC=y. The firmware of an industrial Ethernet switch runs
about 65 SCHED_FIFO threads. A ring redundancy manager (FIFO 99, 6 ms
cycle) stalled for 25 to 60 ms about twice a day, together with every
other RT thread. A 1 ms sampling hrtimer showed a SCHED_OTHER task
running the whole time, partly in user space, with FIFO 99 threads
runnable and need_resched never set.

The mechanism is the one in your commit message. The owner's
mutex_unlock() clears the donor's blocked_on and wakes it.
ttwu_runnable() calls wakeup_preempt(), which compares the donor with
rq->donor, that is with itself, and asks for nothing. The owner keeps
the FIFO 99 context until it sleeps on its own.

1) UP and the proxy_needs_return() shortcut

On a single CPU, task_cpu(p) == p->wake_cpu always holds, so the
shortcut at the top of proxy_needs_return() is always taken there and
the donor never goes through proxy_reset_donor(). The variant discussed
in the thread puts the resched in an else branch inside
proxy_needs_return(). That only helps UP if the shortcut goes away
completely. If the shortcut stays for some classes, please keep the
resched reachable when it is taken, as your patch 1 does.

2) Two more cases on 6.18.y

On 6.18 the wakeup itself can be a no-op, because the waiter is
already TASK_RUNNING and ttwu_state_match() fails:

 a) A signal to a donor in mutex_lock_interruptible() sets it
    TASK_RUNNING but leaves blocked_on set. find_proxy_task() then
    picks the owner again, and the donor cannot act on the signal
    until the unlock. At the unlock, the wakeup of the donor does
    nothing, and the owner keeps the donor's context again. This is
    your signal_fifo case.
 b) The first waiter was woken earlier, but the lock was stolen before
    it ran, and the donor is queued behind it. The unlock wakes the
    first waiter, which is already running, so nothing reschedules.

As far as I can see, mainline hands the lock to blocked_donor, so b)
should not exist there. 6.18 has no blocked_donor and picks the first
waiter.

3) Measurements on the hardware

Reproducer A: a SCHED_OTHER task O writes and reads a pipe
(pipe->mutex), then spins 50 ms in user space and sleeps 150 ms. D
(FIFO 99) does a non-blocking read() of the same pipe every 5 ms. M
(FIFO 80) runs a 1 ms clock_nanosleep() loop and records how late it
wakes up.

  6.18.64, proxy exec on:   M up to 51 ms late in nearly every cycle
                            (= O's spin), D's read() up to 50 ms
  sched_proxy_exec=0:       M up to 21 ms, D's read() up to 220 ms
  with the patch below:     M up to 5.6 ms, D up to 1.05 ms
                            (5 runs of 60 s)

Reproducer B: a test module with one struct mutex, similar to your
test_proxy_exec. O holds the mutex for 5 ms in a preemptible kernel
loop, then spins 50 ms in user space. D (FIFO 99) calls
mutex_lock_interruptible() every 3 ms and gets SIGUSR1 from a POSIX
timer every 7 ms or 3 ms.

  resched in ttwu_runnable() only:  0 EINTR, D up to 18.7 ms,
                                    M up to 19.1 ms
  all three changes below:          127 / 425 EINTR, D up to 4.97 ms
                                    (= hold time), M up to 5.2 ms

Both reproducers ran on a board with the same SoC. We have not yet
tested the patch on the field units that showed the stalls. Case b)
above comes from reading the code; I have no reproducer for it.

Proxy execution stays on: with sched_proxy_exec=0 the priority
inversion is worse for us than the stall.

4) 6.18.y

6.18 is an LTS kernel and has SCHED_PROXY_EXEC as an option, but none
of the mainline infrastructure (is_blocked, proxy_needs_return(),
blocked_donor), so the mainline fix will not apply there. Could the
final fix carry

  Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_proxy_task()")
  Cc: stable@vger.kernel.org

so that 6.18.y gets a backport? Below is what we run on 6.18.64, for
discussion and as a starting point, not for merging as is. It
reschedules in three places:

 - ttwu_runnable(): after wakeup_preempt(), if rq->curr != rq->donor,
   as in your patch 1.
 - __mutex_unlock_slowpath(): after waking a waiter, the unlocking
   task sets need_resched on itself if it runs as a proxy. This covers
   a) and b), where the wakeup does nothing.
 - find_proxy_task(): a task in the chain that is TASK_RUNNING while
   blocked_on is still set (signal) runs itself, so it can return from
   schedule() and see the signal.

I am happy to test a 6.18 backport of whatever lands upstream on this
hardware.

How this was made: the analysis, both reproducers and the changes
below were developed with an AI coding assistant (Claude Code) under my
direction. GPT and Gemini models reviewed the changes in three rounds.
I reviewed the result, and all numbers above come from runs on the
hardware.

Thanks,
Ramin

-- >8 --
From: Ramin Moussavi <ramin.moussavi@yacoub.de>
Subject: [PATCH 6.18.y RFC] sched/proxy: Reschedule when the donor stops being blocked

Signed-off-by: Ramin Moussavi <ramin.moussavi@yacoub.de>
---
 include/linux/sched.h  |  8 ++++++++
 kernel/locking/mutex.c |  4 ++++
 kernel/sched/core.c    | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)

--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2228,6 +2228,14 @@ static inline void clear_task_blocked_on
 }
 #endif /* !CONFIG_PREEMPT_RT */

+#ifdef CONFIG_SCHED_PROXY_EXEC
+extern void sched_proxy_unlock_resched(void);
+#else
+static inline void sched_proxy_unlock_resched(void)
+{
+}
+#endif
+
 static __always_inline bool need_resched(void)
 {
 	return unlikely(tif_need_resched());
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -963,6 +963,10 @@ static noinline void __sched __mutex_unl
 		__mutex_handoff(lock, next);

 	raw_spin_unlock_irqrestore_wake(&lock->wait_lock, flags, &wake_q);
+
+	/* Current may run as proxy, see sched_proxy_unlock_resched() */
+	if (next)
+		sched_proxy_unlock_resched();
 }

 #ifndef CONFIG_DEBUG_LOCK_ALLOC
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3789,6 +3789,16 @@ static int ttwu_runnable(struct task_str
 			 * it should preempt the task that is current now.
 			 */
 			wakeup_preempt(rq, p, wake_flags);
+			/*
+			 * rq->curr != rq->donor: rq->curr runs as proxy for a
+			 * mutex-blocked donor, and @p may be that donor or a task
+			 * of its blocked_on chain. wakeup_preempt() compares @p
+			 * with the donor, possibly with itself, and does not
+			 * reschedule. The proxy would then keep the donor's
+			 * scheduling context until it blocks. Pick again.
+			 */
+			if (sched_proxy_exec() && rq->curr != rq->donor)
+				resched_curr(rq);
 		}
 		ttwu_do_wakeup(p);
 		ret = 1;
@@ -6589,6 +6599,31 @@ static bool try_to_block_task(struct rq
 }

 #ifdef CONFIG_SCHED_PROXY_EXEC
+/*
+ * Called by mutex_unlock() after it woke a waiter. If current runs as proxy
+ * for a mutex-blocked donor, the unlock may have ended the wait of the donor
+ * or of a task in its blocked_on chain. The wakeup alone does not always
+ * reschedule: try_to_wake_up() does nothing for a waiter that is already
+ * TASK_RUNNING (woken by a signal, or woken earlier and the lock was stolen
+ * before it ran).
+ */
+void sched_proxy_unlock_resched(void)
+{
+	if (!sched_proxy_exec())
+		return;
+
+	/*
+	 * With preemption disabled, rq->donor of this CPU only changes in
+	 * __schedule() on this CPU. Flag current directly, like resched_curr()
+	 * does for the local CPU, without taking rq->lock.
+	 */
+	guard(preempt)();
+	if (!task_current_donor(this_rq(), current)) {
+		set_tsk_need_resched(current);
+		set_preempt_need_resched();
+	}
+}
+
 static inline struct task_struct *proxy_resched_idle(struct rq *rq)
 {
 	put_prev_set_next_task(rq, rq->donor, rq->idle);
@@ -6676,6 +6711,17 @@ find_proxy_task(struct rq *rq, struct ta
 			return NULL;
 		}

+		/*
+		 * @p was woken (signal, wake_up_process()) but is still marked
+		 * as blocked. Let it run itself, so that it can return from
+		 * schedule() and check for signals, instead of running the
+		 * owner on its behalf until the mutex is released.
+		 */
+		if (READ_ONCE(p->__state) == TASK_RUNNING) {
+			__clear_task_blocked_on(p, mutex);
+			return p;
+		}
+
 		owner = __mutex_owner(mutex);
 		if (!owner) {
 			__clear_task_blocked_on(p, mutex);
