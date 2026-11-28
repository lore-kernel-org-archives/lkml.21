Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795884136;
	b=fkkgKiPxPsjYJUxSG4Vowd/2mHa1D8cTlDicA9WSTu5EAIerUXeiXP2Bgivmq+6Je2p3
	 uFF8q03UQP3ao1RvMY6eZFqOeBNUd6R9tq+A+0RHxyJj55eILavDiT6XUFbxepibDcYsl
	 ax+LntoQSexQjFOOLGUrP5wh5nN/N5V1g3wkKiDcFQ22aAQ1y7HGdayDX6HO0Qv0M1m5T
	 AR4M5j3FgPHK/OhFxnl5acLu252EIJ0nseE9959pPnXIYBLX30cdXi31HmJB7pzz/z3rV
	 o7OSjMjEPYkQLc3VR4NUQLOJZyuXF0JBiYeMTBuzk5YceGsEh4XIEq0Orkj1k6HH0Ww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795884136;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=8dY8uCOyLx8g2ByqrOmc65py9cXyTqj8abaHKJmRvlE=;
	b=mjaBB5VbiH1j/77Cj/oq56IXfFikaxWom7xpNDGemoE+vRB5bHko8By3mfa68TW/AmmY
	 3osuQdwH8eT4oQYPxrBKHG0zrCTpZszOXKIzg6pIv9TZjb0Lv+fCaPtYKLheq43U8hwep
	 e6GU3bC4y8N64y2kXDjL/K+G5K7qDa6VMqLTP2l2AcwEtRXNUL5AOFuRi1LxLcCSI00gc
	 Fq+G5K8TkE/RBfoe4AnwrhuHI64M0b3dmjCCoOTFfrwUCim0wyOWl7+5tlr2NRLorXtUA
	 bferW0HxuucXMEeg4Xseq9KpGF6GaOqDrQydY1cU2w2PKMDoaTpHTx60o/1b+dKmZOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pwGxR7e3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.14
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013014.outbound.protection.outlook.com [40.107.201.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0826606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0826606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pwGxR7e3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTEI2PpltTsjYOSNP4ih4LgpUtEMSWjRXQ4CR5rbqF8Bd2V3IwxF+WjCe++QZm2SfP5TwAZ9pib9L4pGsBd/EhkWdZGhQGsHrkWarufM01Nm/yII6bbpViAuMreKipIB1BQUjM/gqVgF3RruSA2R/wChFH2JZKRkkTDvgRIU/+JilynRkmpyMxsTImx77mMW1DjYMVt3zXvOZOeC60RUKtIrAwkcpyRwSy+lSdF1LitRVz2vh20tRDSI0VIITc7PQ0cFQDZCMp5QlOth4vtY7P8e1AoFHMRZeoR/e6Nr3u8+vJp24Yo6ap4YlKb/iIWmDtkt673gC53oIFdiaOH4oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dY8uCOyLx8g2ByqrOmc65py9cXyTqj8abaHKJmRvlE=;
 b=XnbUcTLnJJz4d55nSyw8JapFkmtbtt+iALuOxJRXlrJCIPgswAf6C5Hoq0nCrGkVTmPPnALx5P2umI7Lbx9c5S6NzxaKDNGKsPCf0RAzxedzEu0QLvjYSUCffleeLcQAbv9lJo3m978HpvSyObB3xBlmcx80cw/MKM/+qP33TxjJjs64bO3bvIdqLaOWELM0HkT2Wi8+A028G3sG4aFVASkPwY3awApWTgBzNxn7RydRBHj9agH+R9ho0CpDeITWzdyncH/hHmVwU0NqPWDM9Dc4AWzM5WNrWTkO1J0RdHzaEKcAWYgyybDiXNO6UP9IPcNEM0a2d2zmtXjQ/OroAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dY8uCOyLx8g2ByqrOmc65py9cXyTqj8abaHKJmRvlE=;
 b=pwGxR7e3rHhaOZp9vDFLJJPvlvwrnkQ+l68x+nJOvoAX3i9P31tQNlMLOsIij0wT3bBW/SLqanNl1/pHD8rryysy284vJZfpj0uPk7HjF277vTgcVd4i/aef9cI7EWlFyxOR3OPXEo2YvmjxE/+1mVBDt9nsrElx2fmfcDqQH1wwWNWw/yoPnz3PjfmaM1TiN0tZKO5w30s2eR7V+jqgj57fd4+rh9ctLCJIbUG1rNfpfjW+H94w5ALl2RIsD4nOwDJESFiNC0mlOgjw1gw/edRyPY3kDfil5/t0f4p43JEaob3TrPzXqg8cAztrqjmJ8LH8agNYsdKXbiwjUrBVJA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18)
 by DSVPR12MB999192.namprd12.prod.outlook.com (2603:10b6:8:496::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Sat, 28 Nov
 2026 16:42:11 +0000
Received: from BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f]) by BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f%4]) with mapi id 15.21.0662.007; Sat, 28 Nov 2026
 16:42:11 +0000
Date: Sat, 28 Nov 2026 17:42:02 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Tejun Heo <tj@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	John Stultz <jstultz@google.com>, David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>, Tao Cui <cuitao@kylinos.cn>,
	sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] sched: Let switching_to() decide whether to keep a
 retained proxy donor
Message-ID: <awsEWrroU0QGiyjD@gpd4>
References: <20261126111649.208476-1-arighi@nvidia.com>
 <20261126111649.208476-2-arighi@nvidia.com>
 <20261126160128.GL49833@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126160128.GL49833@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: MI1PEPF00000D6A.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::49a) To BL1PR12MB5174.namprd12.prod.outlook.com
 (2603:10b6:208:31c::19)
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
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:EE_|DSVPR12MB999192:EE_
X-MS-Office365-Filtering-Correlation-Id: b862b3e2-7f18-4191-52f1-08df4d6e8cad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|261102123227099003|10067099003|56012099006|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261021121427099003|261028144727099003|261009223027099003|22082099003|18002099003|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	adNHy/J3yg5KDXUBh0F3fvhrHwog/T6m1kG975RN5t5PBkIblA1rTtXTkLaXk0DOPuAe1/aU0VsUTT75WDBIvE+qO6/SRTESrl6XvrWNWIrhVW166fjQHI3z2f+rXQ00ounJicojohshuOeHPfs5r4CF5E0QVdhbqLrJYfDrBNCqTlPHU4MrwqJdVb568781ikUsC9gw+7Y8FWCZTpFbfXqHrAQgV0VT+3z8gSkEUwOz0ln2jH461tnIEuNFIDZy01YXSI2weUaEqpA8LEKkrkSC1CE6Xhd0L2zgki+bnmXHcDvdslJD6NBF2FvlVboLR8133uSHS8IM3xM/hv9iXnfVaI/Zc5HRli5V0Mcy5tin/FnEn9bAu3jU3UDxC7kOgjX5/inn/0mPZvvC5fBUd2y5WRsCFLJDK5jMiV2hL8J8JJS7qRd0XN3zsMcwqNYgCMQsPlptxoatXWL+bIjNrwmiC5enARmUFMI1Fo+Lswa15hnHTmZdCp/TYpwnciVHEUHty6+718mRohzUlrWVFR2mWCurXgx6KnTNRLC1EPsvaTZW/Y/JKg3r5LIjHUYz+VouYouq2ruVVUrAHM/zShmM1ruHCF6ZLk3FJrROt11BBT7JW0UGsINbyJXOw6sQswlF0tR0W5L88Wn95d/CbRjmAT9B8+J75sVusy0ZJpc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(261102123227099003)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261021121427099003)(261028144727099003)(261009223027099003)(22082099003)(18002099003)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IWq4lhmg+rVSc+/Sv9triC2TIzfuGMtrQU4FkmOY5cjBjfw/K0pb0wr+pxTM?=
 =?us-ascii?Q?wG2KQ0qyTE8Wl/zcT5kRqibfJ6FGXHBb90UjkfRnjDoe4ff6w3wzYJcBCz/5?=
 =?us-ascii?Q?jiY3At90P2ULBue52l5pRQ52IQAJaF+6KP3xoFpZlFGBMa3jePzysIOFUz2d?=
 =?us-ascii?Q?hcASMZqgI0f7xzeb2ZaccG7EXIri6oFinmXSh2wJmoprZ1qfgCVACJA6faNs?=
 =?us-ascii?Q?i2v3yV69iVcv8Af7r7d4qU1YLpI5QCyAhnjRspKD91eGBMNN2cgrcFEeA9K7?=
 =?us-ascii?Q?+8cHkuHvWhAC2wvDo6GWycePeFKAbivSN6dLLmBKiHYJrRM+zWQIeo3lMOBN?=
 =?us-ascii?Q?NYaafxuRgXey+rI9stMbFrCyI+QCdxqNRGuklEeevnPqAG3ifz6tOmTUSPMT?=
 =?us-ascii?Q?pL9k2wXlfSCdZaL3El8w2wkCl6rVYkM65GgH5SuWKRZTxdxPQgkQq7jj1Z4L?=
 =?us-ascii?Q?n5/FJehZHvr3KAY0gRS/2uKAhLklwvxUmA2GHXoqceJvxcOrmystV4Ph5cS9?=
 =?us-ascii?Q?Haw05J12sUVkk8Flwh6k7V35RG0LjqZeeUNVAHKfu5kdn6Txs8BoysfcDy1S?=
 =?us-ascii?Q?a+OLQ0welwEEEnmYhqlPN3ik/1F6aVq+IvDeOWpQeQ/wR+dw1ItkfUhF0QJm?=
 =?us-ascii?Q?LubZw1g0EcYjP4C5YEYwJBlNkd78xQOXFlat4E0xcqREOtbfP3I8y5JRzoxq?=
 =?us-ascii?Q?p2lKIue7R5dtnX1z8qWBC9j8R1RWGT5m4Rf3iscTCOBXdfOTq27FwmlmtMfV?=
 =?us-ascii?Q?lhcjaav1oCR+2TlAZwIa60Pzl0Mv769FPvPTNr1UhPZbLDMwm5rvjnzZFug8?=
 =?us-ascii?Q?E/LB+wrQeyn0MdskyuT5D+BhOIDbMZigXgqb3uwNbRD1p65zwXxZ5cyDTCQW?=
 =?us-ascii?Q?N7YzDPyBtIIjIsr3WcwoeT/4ee1+LPJ4udMmObA5GIrHzSa9bClgBoChcXqC?=
 =?us-ascii?Q?F2tVj/RtIbd0HG9vsB/3I4WhInn5mDfghE2hskiDwaL9/q+ssIR+Hhxiv1IG?=
 =?us-ascii?Q?E8D51aDYw7qdQNPqaS7nlPLdKoJNuW4ddgblFmjEnaqVy4zQ7xdO1jb9AVrz?=
 =?us-ascii?Q?DI3mkGMeFvQRRu9qwbHRsFFS6nIjDiqhxkJmenh6ajQxzjGDbgVwZcNBgt7H?=
 =?us-ascii?Q?d1VHyHfwUcr6g5GW8JOgfe7f1I3qG1nlwcPT3tBsbopnLJjXxV6inEYnGWoR?=
 =?us-ascii?Q?y1d1R0RPVmXBnUKUHxPRoTaG9ZtKel7gtCXC1FlaXLCFSyk/HOSeNd1k8KG/?=
 =?us-ascii?Q?t7sUA/frH3cq59/GZ4+iIBBvko+ryEFWcoWKfNY6oNj+X3iP7TP7iC4/xIUg?=
 =?us-ascii?Q?JfmsvdlXeKKUkgA3219Lym1AAXhZ2D3h1LOKtCn0Yu2mdQMCjm8Ow1HZkIao?=
 =?us-ascii?Q?MoAq3lPdmV2+9O6e3oBfD4UHCqFbrG9l3DduTC0H8nICUubJsQAErt7iRt/Y?=
 =?us-ascii?Q?7wXZqoh/eFDuCS86O7U/D7s++oIbcdYzuyI35Wx9Qp4N5kvNTqNxGiN2fDrb?=
 =?us-ascii?Q?8P1oiXt5AVq/X6BmqyXP+U71EvhyiTO8xIuXYdygi4SoILIAdJgqk0exI4lG?=
 =?us-ascii?Q?uO5IN9qEJcYEAP+g186HxVOZIePIeSCtmf2bx2M6cZmPMbVnalWi6ZndZRS/?=
 =?us-ascii?Q?/oaV9/kpB/CUww45Tx1PrCqg2o/pMtGQaAGHcjfV/X/pUx06R5yavIR+fDzD?=
 =?us-ascii?Q?I7Uhh9ahEBGtnLNfkDQEGMhHZyqsenKnrV8hwm99XovJ+V7mVcljUOjtm/8A?=
 =?us-ascii?Q?8RSEdP3J+w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b862b3e2-7f18-4191-52f1-08df4d6e8cad
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5174.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2026 16:42:11.4934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0AMCRk7CHggvFKawIotlj7sJHzjnSnEOm6sVF3i7z8gvyqOwnCGkxYzbKBnZcaoqGbck1cDIMNKaMNQQ6AP3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999192

Hi Peter,

On Thu, Nov 26, 2026 at 05:01:28PM +0100, Peter Zijlstra wrote:
> On Thu, Nov 26, 2026 at 12:13:57PM +0100, Andrea Righi wrote:
> > @@ -11200,6 +11213,58 @@ struct sched_change_ctx *sched_change_begin(struct task_struct *p, unsigned int
> >  	return ctx;
> >  }
> >  
> > +/*
> > + * Block a mutex-blocked task retained on the rq for proxy execution, because
> > + * the class it is switching to does not accept blocked tasks.
> > + *
> > + * sched_change_begin() already dequeued @p from its old class and put it if
> > + * it was the donor, so finish the job a sleeping dequeue would have done
> > + * without going through a class again.
> > + *
> > + * The caller holds p->pi_lock, so @p cannot wake and migrate once
> > + * __block_task() clears p->on_rq.
> > + */
> > +static void sched_change_block_task(struct rq *rq, struct sched_change_ctx *ctx)
> > +{
> > +	struct task_struct *p = ctx->p;
> > +	unsigned long state = READ_ONCE(p->__state);
> > +
> > +	lockdep_assert_held(&p->pi_lock);
> > +
> > +	if (WARN_ON_ONCE(state == TASK_RUNNING))
> > +		return;
> > +
> > +	/*
> > +	 * Hand the donor role back to the execution context before clearing
> > +	 * p->on_rq. This is proxy_reset_donor() without put_prev_task(), which
> > +	 * sched_change_begin() already did, and without zapping the balance
> > +	 * callbacks: nothing redoes them here, and they include the pull that
> > +	 * switched_from_rt() or switched_from_dl() may have queued.
> > +	 *
> > +	 * If @p is rq->curr, __schedule() retained it and dropped the rq lock
> > +	 * while picking. Block it like any prev that blocks in __schedule():
> > +	 * keep it set, and let the pending pick put it.
> > +	 */
> > +	if (ctx->running && rq->curr != p) {
> > +		struct task_struct *curr = rq->curr;
> > +
> > +		__put_prev_set_next_dl_server(rq, p, curr);
> > +		curr->sched_class->set_next_task(rq, curr, SNT_PICK);
> > +		proxy_set_curr_donor(rq);
> > +		ctx->running = false;
> > +	}
> > +
> > +	p->sched_contributes_to_load = task_state_contributes_to_load(state);
> > +
> > +	/* The DEQUEUE_SAVE in sched_change_begin() skipped these. */
> > +	sched_info_dequeue(rq, p);
> > +	psi_dequeue(p, DEQUEUE_SLEEP);
> 
> Should we assert DEQUEUE_SAVE was set? I mean, it should be, but afaict
> nothing screams if someone forgets? And with these changes on, it will
> go a bit funny.

Ah, good point. All the current callers that change class pass
DEQUEUE_SAVE, but nothing enforces it, and without it
sched_info_dequeue() and psi_dequeue() would run twice. I'll add a:

  WARN_ON_ONCE(!(ctx->flags & DEQUEUE_SAVE));

at the top of sched_change_block_task().

> 
> > +	__block_task(rq, p);
> > +
> > +	ctx->queued = false;
> > +}
> 
> Other than that, this looks good. Let me go read the next patches.

Thanks,
-Andrea
