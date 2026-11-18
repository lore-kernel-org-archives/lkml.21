Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795036347;
	b=jy4gVF4OZeOzQiH1hZ2U6lHadGq0HI5kedWrIPR06hOk/RUz780NGj79rMyjTl1vx3tV
	 Z4uSEhQGxYG0hsqSe2RUdhRMwmP992nO3Cy8y7f+BfAKoA6B9E5aPyqeSoQkvyHboZ9Qr
	 sObszS7fUfUnR7NKCLClWtxYHurr5brWvex+PaoJCB7rfMJ9zH/xgFOUIPHoto1Vhokms
	 r1MtuT83XCUIpUecGjIrbOtoPpb+FKonMuDhnM2T8XHaHQlgBxhH8K70HljHBPL3ZuyQ1
	 RUg1lz54ylyJ+kmOZgiSGi9opoHmXKrEmfOx/aT3ofK1ZwN2xrEzoK+ucqpL7+F1ONA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036347;
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
	bh=iVka3iHRWawT/mIYg8DqubGTp6UdcnrutEYzdro1Feg=;
	b=dxCqHyciijYO28PS6KDomlSgVI7lRTHHuu5nSM9faIR8rqi1Mg0NdTJqzsCrbof+6wps
	 UyNEaYE6GNJAzAg1LHvgEuY3adSAJ/anmsVCYzt3Vhy09eiLqev+YIUi2PB1IvwSnDO4M
	 rF36tFTzQXWLBGbfFS8Nbrd4nGgA4z2JX/o35up6yeOl5a3DQc9Lu+aKVf4qyswmQ5TLR
	 osPblXMMlsonja9iaxwEHTkwY3/wEiG9puYeTfdw50zehO4FfGnAnPUZ7s4YAGJ3bOZpo
	 T2gV/TFiGsog3LxpoLYPQaY5tdLAAPLqrD3laVkKuBqCTv3Ef+CQs/Qh5Z26S+tcCKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZDmuUj8i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.66
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012066.outbound.protection.outlook.com [52.101.53.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E8E606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5E8E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZDmuUj8i
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0xm6+zD6T30NCWH5eHmmt2I+ecmw8ZAi9rhlFm03/Upzs0P7aZRNHTT225tczk7L67mDoOGSZH4QS2kGPV+NIVm15xKNWpOr8uoMCb14XNAEcbHj6KzUiA+nPiimCDDw6YTXm1QRcI7SUquqpXiqepLEdLPo16KJCkZxKQfv5oYQz5B9C+MA/zhzu/cGC5iUcDpjIYdl5EToetYYwZHmuTmstAFC1buB2W/wonK2ZYTvM3VhpwY2TLe+a52lE2GkRE7Ee3sjrBMEqxNf5icbZzFqb3kff9MWquUsKYILDIOAY7wLGZQDomXHpgISQT1/6wMiFCHL3ZhhMnO5cq4YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVka3iHRWawT/mIYg8DqubGTp6UdcnrutEYzdro1Feg=;
 b=OP+O/7X/bpOiOXYgfUd4imIUsjbAlk9EEuacBKzeDKjhrY+0B5XwsolDfQwyNVfXErXWi2cKqAALfcfrTCJkoA3WPDo67vTJchHWjiLY0kPwTCanxcCdVXbgNYJoXiWsjXxtCQUpoEmP5BN1zoAb8NzKRGhEoSeouzQ4WVHX5CFhPZDf2xj9tV4P/wXtpH8WqyUhyk/Yv/kf4FS9IpagGkou+iG7vgA0QkQAnO+s0G7VW7xfyKUUnXBVUM2EfBZuG+T/LR7A7LOnVKLKcwsDnB+KQjlRHRVrkBKtRmOZ5ezRDAPcdimmboGiZJT9CP/P3k1RMbAu9iNroiwbCImQ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVka3iHRWawT/mIYg8DqubGTp6UdcnrutEYzdro1Feg=;
 b=ZDmuUj8igCIzSE9dj/CYOIPxCZM0hs9beLeyG1PIWzHjDw6j7R0xsD9l3LMt8/5YDc+mS3UVFvGk56K6c1EnqkR93a9zEFRbmSPqi/ShMz5d1IkLo1/wHmLnY6qNmC9Q97nOCqFaBndLogt6HeLa/8cCKbm2JsvEmAj8iZnMsEIKsF3GCBh3fjkdKa8V3H94KdzA01WYT34VhWOZjimLVhSc9gr+zl9A12eTEXtbrMnEYrWagh+mSuUjOUWcwfmLgeKsPJKtbsYZxDXvkD8tPLAqnDsbCJxzIpaRXMO3X+1glYV0L0ovhVpSm5/q75uqQbkmuMNeMSE5kRFrCBsf6g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by PH7PR12MB6540.namprd12.prod.outlook.com (2603:10b6:510:213::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 21:12:23 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%4]) with mapi id 15.21.0615.012; Wed, 18 Nov 2026
 21:12:23 +0000
Date: Wed, 18 Nov 2026 16:12:21 -0500
From: Yury Norov <ynorov@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/fair: Rework pick_task_fair() control flow
Message-ID: <av4UtcLfPKbxm-y0@yury>
References: <20260909181712.1050224-1-ynorov@nvidia.com>
 <arFX5lm1QRmLJSZj@yury>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arFX5lm1QRmLJSZj@yury>
X-ClientProxiedBy: BL1PR13CA0281.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::16) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
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
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|PH7PR12MB6540:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c97ebe2-02c1-4ebb-b6d8-08df45b8a359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|10070799003|376014|7416014|22082099003|18002099003|261026121527099003|4143699003|56012099006|11063799006|261026140227099003|261028144727099003|261009223027099003|10067099003|261102123227099003|261021123027099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	GW7bYC0ny85sbBKHlME159lCZXNeVm6SJKZND8oCuEfXThFIAR623VNzoqP5sBsA2pq9uLYxK68Ew/k6aRWBALNb5P2nd6SgbjOMmJCXTPi/RqOmOCNBc4FWeO87IXqcPxAy/rguzOaqWxSBeNWvFb2Tv7Artv0SwiouXZ10d9B1cGo2OY+duN8j/eY3jVjJUUBz+CB4l7qTUEkj5WCV2QxmuwDX/xk8ZzsZySmrlsXRIf5v1UtKIh20noTtiIz5BTvsVyN/pi5FsTVWVq2ADmSLSUqX97XkRbw3jiQi+Ikw6yTd2KdO9Kx+2V7lPqgkXcBVz4hzBT+gagFIpPWGMhKzZ33dRbIvdCZzkgiL+XMiGb50jENFrXFoQLL4Ax+0RIkh8v0WlEy3FHrJILibldfIk8z26exZyBuJwOAZBFBgSsLEVCaWNndkITUue/LG5pm7usZFCdUeBVXNDjGL/8Rwal5ZRdfQ+23xJ/FdI6HmZm3ib3aiMC70j47g91ierxZ5mTm3rW2ny+ja3DdsWIgtVr2qmwQsOOQ1TPVbXNekbWAX17ap/Q2htmw06Pb8JjVMKp8eTJUV6xKISUM6E9+AylsDXPhu8Gpb42KAlPDOclczj16oVMJ8aP64Aohhi/zf2VEKQKWMUVUfIDPVXEAycH8fqdDfbKgK54ruPJ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(10070799003)(376014)(7416014)(22082099003)(18002099003)(261026121527099003)(4143699003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261009223027099003)(10067099003)(261102123227099003)(261021123027099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nFoOynsfImPdD939C5LXPdfCDsFlumC1vrYwHmBmLI8QfKSKqt+HkHsa0ASQ?=
 =?us-ascii?Q?xhvy325ymaMMGFNfJ8McE6tFYrh13QQqVgwxJ8tc1EsCjpjsjZiJ2otpfDMr?=
 =?us-ascii?Q?1a2IsMkJ3VisQxoQRq42Z8U9cWxtccDsQv1hhLb9itcyyaIJi4fkQhEepn48?=
 =?us-ascii?Q?IOw0AWqW2XWtQ+JDwOa0Ugl1h9K8axzy+WrS5PyWsd+w5qRch8UWP3Xbz0E5?=
 =?us-ascii?Q?34K7lu6QfPrEhoZF7NttD0pF/q2Wl6rJaY18SRHJKm/Aqj7wjV/yXff/uo4e?=
 =?us-ascii?Q?bjjthQq6aJoN2CGaAHS7jT1q2tgQnWe9yCuI+nywnhu967EhbRsuSC58dTdC?=
 =?us-ascii?Q?j3W9iuwbT8+S/x7L6+syOiPpuO+hJIT9eaG48/bjyVAJBH9tLKGyGsDg26Wf?=
 =?us-ascii?Q?WmoJ9zdPFkOyQa7y3Ob8o7194RdQoQRwossgzZfd2euiwferPzh2LhvKTxhk?=
 =?us-ascii?Q?yhVxCGRJUrrDt30bFfsBO3B/d5uOEl0WASfZkbZMIPD/rPVaTmxBxeDypBKW?=
 =?us-ascii?Q?V66tmLXoQ32vQcJw29SNbbITupqMVCl4BPzOwC48/BbLH/tK2pRRRWFmbIEa?=
 =?us-ascii?Q?IZp/zTdpv1bsQw+T9tC+7LUsUOYoS+Flkt8gLGh7xOmbI6eB/RSOTT66Hn3u?=
 =?us-ascii?Q?vLpGDk+Qtdd1XITpWicpRJq0gdf46ZzM5WCn4m93cxkywk+3jDLOiQ+nw3zf?=
 =?us-ascii?Q?P5u+rMLVT+m17b7qpJ3fLJ3gcLCzcuWQKkzPRJJRfwxrOeTjZ9ynK0b6hyaC?=
 =?us-ascii?Q?sgoZrBfnptii4/LdIJgY0peSWvKkkFKBk6em2NMUrS82RtbNqJBEtHaNXnfU?=
 =?us-ascii?Q?D38Qi64GXJL+VxLifRATRjLlnoP0qK75IuoflFlYpW7BYtO/6kFRgzdaFlJg?=
 =?us-ascii?Q?JVFDVrZPt+FLjIMMr1+0SiixEY2vts8uxyan+WIPhIBo2va0uzBUXSwQTc4Z?=
 =?us-ascii?Q?wocx5RAN44VeLLsMISk7AzGw+TPorin7Qaswrjrhljjy9UNHiyXdOUhdtRsR?=
 =?us-ascii?Q?LZbDO1GScBnLCsDa2dVy8YRsXVUS0Y3FOVF7hRNwn2QDd7ziIz9DvfSwmj6g?=
 =?us-ascii?Q?DznP+Qm++WosjsQnvnVnBw1rINrY2Y7hG3RtFxUMogFAnRq9Dygb9nI2lI4z?=
 =?us-ascii?Q?OfM2qUIio2+mnR/70ZdQ5cHOZVMF50G379LZO8qjafYoP8DYlDEIziuXqdbh?=
 =?us-ascii?Q?HoQCO4iSrZLBz0WQt3LULALLPqOxckyu6i5NjaA9wUSD2FTPLuHvUNVH5EIq?=
 =?us-ascii?Q?TKf+91MFMdfkXi6/uajLG46UGnb39xdg27L/ABvDp2dI1aVf83Vg1KZ+/8jN?=
 =?us-ascii?Q?ZVNYzBvBKRdJYByZydSmWZanG0bnFHoKkKtPb9ShyRr9s01iNW6awKFnYxwq?=
 =?us-ascii?Q?70YCtqJKteR4W8e8gQetKaTWOr8S48c4hoa4Ngy42qIT77z1EwDl6oj69icb?=
 =?us-ascii?Q?L7q4SezUdgG9hwpaNT1c9p0WJhdkYExHm+hHjlY9yhOm+0uwHy0WaLhHREPl?=
 =?us-ascii?Q?TuUjqQ3uLPHTcOrM3+lZlj7KD+3z/G92PoJelHMvlC5MU88bnoDw1ufMbHSy?=
 =?us-ascii?Q?YWB0otm0tEGkWNmgrjyRPZostwoh8OJ8GersHN9AlUaho6mldNTUsbJ3axKP?=
 =?us-ascii?Q?hKLHYkKxRvHqh413W61HGlvuTKI3jQk6jzq8ylWQ2VWQwmCne+AtxObltHqh?=
 =?us-ascii?Q?TIoIJtcfjOzlZXHap8Z8t2M5y1dV+QTg8AC9bSyX0HAmGM7YfGiyRBjmIjUr?=
 =?us-ascii?Q?YLx9G2LVChldTAQn8X4zkOZgxUKog2YcDqCRFKpnghRh0Ir3/gEr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c97ebe2-02c1-4ebb-b6d8-08df45b8a359
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 21:12:22.9455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00Z+NQHPl6NFSLnh/Dz45/4V72ZsX/AUt5sG13jHfQxe9HCqvpVaSzSXMTcl3k01VXmd7Cfnn5Wwba0Vr85k9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6540

Ping again

On Mon, Sep 21, 2026 at 12:14:30PM -0400, Yury Norov wrote:
> Ping?
> 
> On Wed, Sep 09, 2026 at 02:17:12PM -0400, Yury Norov wrote:
> > Split out the logic picking a task from rq to a separate helper,
> > and get rid of the gotos.
> > 
> > With GCC 15.2.0 and x86_64_defconfig, the new version saves 96 bytes,
> > and with defconfig + CONFIG_SCHED_CORE + CONFIG_CFS_BANDWIDTH it saves
> > 124 bytes.
> > 
> > No functional changes intended.
> > 
> > Signed-off-by: Yury Norov <ynorov@nvidia.com>
> > ---
> >  kernel/sched/fair.c | 51 ++++++++++++++++++++++++---------------------
> >  1 file changed, 27 insertions(+), 24 deletions(-)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index ade1eceb39b8..ad0c477e58a8 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -10043,39 +10043,42 @@ static void wakeup_preempt_fair(struct rq *rq, struct task_struct *p, int wake_f
> >  	resched_curr_lazy(rq);
> >  }
> >  
> > -struct task_struct *pick_task_fair(struct rq *rq, struct rq_flags *rf)
> > -	__must_hold(__rq_lockp(rq))
> > +static struct task_struct *pick_task_fair_rq(struct rq *rq)
> >  {
> >  	struct cfs_rq *cfs_rq = &rq->cfs;
> >  	struct sched_entity *se;
> > -	struct task_struct *p;
> > -	int new_tasks;
> >  
> > -again:
> > -	if (!cfs_rq->h_nr_queued)
> > -		goto idle;
> > +	while (cfs_rq->h_nr_queued) {
> > +		/* Might not have done put_prev_entity() */
> > +		if (cfs_rq->curr && cfs_rq->curr->on_rq)
> > +			update_curr_eevdf(cfs_rq);
> >  
> > -	/* Might not have done put_prev_entity() */
> > -	if (cfs_rq->curr && cfs_rq->curr->on_rq)
> > -		update_curr_eevdf(cfs_rq);
> > +		se = pick_next_entity(rq, true);
> > +		if (se)
> > +			return task_of(se);
> > +	}
> >  
> > -	se = pick_next_entity(rq, true);
> > -	if (!se)
> > -		goto again;
> > +	return NULL;
> > +}
> >  
> > -	p = task_of(se);
> > -	return p;
> > +struct task_struct *pick_task_fair(struct rq *rq, struct rq_flags *rf)
> > +	__must_hold(__rq_lockp(rq))
> > +{
> > +	struct task_struct *p;
> > +	int new_tasks;
> >  
> > -idle:
> > -	if (sched_core_enabled(rq))
> > -		return NULL;
> > +	do {
> > +		p = pick_task_fair_rq(rq);
> > +		if (p)
> > +			return p;
> >  
> > -	new_tasks = sched_balance_newidle(rq, rf);
> > -	if (new_tasks < 0)
> > -		return RETRY_TASK;
> > -	if (new_tasks > 0)
> > -		goto again;
> > -	return NULL;
> > +		if (sched_core_enabled(rq))
> > +			return NULL;
> > +
> > +		new_tasks = sched_balance_newidle(rq, rf);
> > +	} while (new_tasks > 0);
> > +
> > +	return new_tasks ? RETRY_TASK : NULL;
> >  }
> >  
> >  static struct task_struct *
> > -- 
> > 2.53.0
