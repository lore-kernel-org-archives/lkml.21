Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795036421;
	b=RUuToUr3BA7KtWM2HRriw3KmaYDn81mRfb15XrbVsnKkXTNzXFjjPMkyBwbrIDxwDg2N
	 ujERBwOIv9g7NrET8SzjcVrwYl+I5hyxvzfak50gCTq+EUWA1nsgRuuqQz5el6YwrXOqx
	 eVBEfQWzoADCiDDpYs61sPoGr0lssfIHCVqm9+z0Coewjk7D5gWSMm3wKGppEFDRH9HXc
	 gVPXmROls+XkFK8VprxqpAFtRc1s0cW+zw0wLku75IAMjb67j82uhK6TV0RC2LJIpy4L0
	 yWZMMO8M8h9n+JvZoKTg7umXzwM6M+olvdyY6O6CCg4G3P6scGC6xQ91xmIne83+CJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036421;
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
	bh=AHetH7eMjmHl9cRixuGec6hZ/RfIxP/8gwUT5BVZZpI=;
	b=UdirSP7RvoJ8FUSWVPW5901MRPBXJvVLaPK2XJhKydAzCCXXJIfmrtWbS7Z6Pg7JPfMs
	 Me4XC8DYh9n612yBQiyH+o2SOfnMtWnItts/Y9wr+dvooLMOQe37rNQkXoA3GuqCHYXH7
	 BjQTwPfTdTSm2WrStMTcQ7rFFpIJyIfCkmuYqeYoPbwwhxBaqLkqnLwK1k5crcWHU0mHo
	 FWCge90Pv7j2K1NHARox58n1+g+khakOI8ROpH13EVlCscVPdvJRN76LDQu4q0oU7+KjO
	 OU58TIcz6N7PycsdxOxams2tS76OzJ/2StkpAdEpkBlDFPk/GvU0OCMhflBh7hjDopQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mS9vMFR6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.7
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81D7606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 21:13:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B81D7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mS9vMFR6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YB7BnPVm+YdvqMIsuZYRRjhmp6BFIzS00JjgFe8ghTnm9BGc1HLp26hLYoZ0kJ/aoVYCke64oB3XISVkStmZaZsTXalOrEUwjoUIuKd6Yx+2BWv/qQsf8eVtP4FBYH6yFG+4ljRtAXoywd0PUOeToEM2a7/hHjAONNSZqS0b3FvcYpTjGUGTcyjRSlYAheiW9nqYQXLtlGXPEaUrFbc2Nc/zV0MT/NW45qWHv6X79e8GpzHh2+A4depO+TVn2cto4ajqpd4TgBcNk29b/aGvuIFn+d5FTwhcIKnohQq03IPNwrBNMFKQkW6I6VZxtWItc1sqAyECXX8EcflFbww1lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHetH7eMjmHl9cRixuGec6hZ/RfIxP/8gwUT5BVZZpI=;
 b=ah1vtCv5+Id4N0LZwVXXHiM/9UlrHWHH+wpvCKofaKjfvI7VseqMy21irKYblDC8XYP4L6u7PClcVzhmogeyYPq0lLhxndqrqxxPLse/DKIoIM8OJyVUtRBREdOVaVs91QqlBwRCkoRa86qOeBKIv91+63T5zPkPCvAoLtORf+B5K1M/qCVuMbdb/J+NF3dUJDiW2uU3Wq/DmTDwl0ChM45tPY+bhlgo4xSqnF6si8C/HLQ9m61MoOpCaj7gZ7Msv9JU7Oo/gNwJuQHQbgayrAdd4Qk4SvUStSkicq/74HbSMDHOvE90/+Zem4xkr4gP2HLhfZY7o293FjysS1oDhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHetH7eMjmHl9cRixuGec6hZ/RfIxP/8gwUT5BVZZpI=;
 b=mS9vMFR6pDS5P0DZJ7EnctW361FJbiz3chRu+uO4tm9hd4KBdHmFUxU8LQPwDA8Z+LMDQN1FDtSlSkOCeZ2LuUt6WRcFX6aJK/IVupqiUKgP1iJZDAlBkyF31mMToTuApFe+cQZGSn4WBIs+D2r9U7puBS+zWGsVt/YMNF7VJQKYjCXtqfEMlTtqr1n+guYuSqxmUbKZ7CFkDFyq0UL65Ep29bQmUtn3QQKPV3Pm0i4GbKXG2DMp4AD8xQFRnsSX5Ka6ozIaZGJs/GG22VWytX8nteXpI7sxzKaOdp9QNcHLWyqH2v6Xq/tKibyQd08o7eSqOrDdBV8PN7e6I6bdHQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by SA5PPF6CDAEAF48.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8cf) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 21:13:23 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%4]) with mapi id 15.21.0615.012; Wed, 18 Nov 2026
 21:13:22 +0000
Date: Wed, 18 Nov 2026 16:13:21 -0500
From: Yury Norov <ynorov@nvidia.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH] sched/core: Make fallback CPU selection NUMA-aware
Message-ID: <av4U8VYR-NGq2F19@yury>
References: <20260905033656.311477-1-ynorov@nvidia.com>
 <arFYBf58i6J35SLZ@yury>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arFYBf58i6J35SLZ@yury>
X-ClientProxiedBy: MN0PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:208:52d::17) To LV3PR12MB9356.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|SA5PPF6CDAEAF48:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cdb4b92-9889-49de-ec04-08df45b8c717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|7416014|22082099003|18002099003|921020|4143699003|11063799006|261026121527099003|56012099006|261026140227099003|261022075727099003|261021135927099003|261028144727099003|261022105027099003|261009223027099003|10067099003|261102130727099003|261021123027099003|261102123227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	F80cXKu5dr9v11kp3DwTz4d/zowWQiNeDIp7WtAwRKptL00bgrIo69aHj1dz0xDRhvGoAlzj4IrcNl/vxwXSBoTrDVH9akQMz0YharZje5ChBZdyxoI4ROAoz/ZU0672FRnId5JwKIXet/g+VCeTvMimNXOQnB6Bbyw3R3T8rm+UkoYKpItPhWir6N5oGkBbIyFFcLieOzN4fRoIB0cyB4GWIzGodA4GPKaOE4zyoLNqJOhsIkf9N1rVHEC1fVDW50rkkVSEH3LR+I4cc5S/hzx78ud7seGXPtUTzSYE/ep4wlsz3ubwIB9Rf2fdJLC8OYfIfkbypefNET+sJohk9L4waLiJnzzcRW/NNKVPRXQ1N5nRGf3MbtgcghAkInUG/eQnGdWUorHqw2M7qc6Jy+YHgLN/2jy8d/ruwL61UUXPrMChFNJJiLIqTL7mRlXEZu7ca7QNp/ydaY/gE1mmf5bvDLC+pfyD5kkg283ZYSzF6fsJC0c3WvEmqg0x0b87HiAT+zBkl1VBYbWoIOvZa7E53M/qM7zc12tr1lgbN3ImT9NG3wKqNu9B7n9jToOKbwg9Nntn+UpILtTQGsRfh6nB4kEVkKksYcu04cEoP6psr86mPe5xyaLUIh5038nlF1fwQefMKSu0Qh1AisvskayB6YkCcAQx61Kea6/Cv6lgtbEsOSd2lzS0WoQnMnnpwA0dxdN5ktOq40jysY3Caw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(7416014)(22082099003)(18002099003)(921020)(4143699003)(11063799006)(261026121527099003)(56012099006)(261026140227099003)(261022075727099003)(261021135927099003)(261028144727099003)(261022105027099003)(261009223027099003)(10067099003)(261102130727099003)(261021123027099003)(261102123227099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wY8ebBXwoAp6I27G2hsgkToqFjUriR82+NiRSj2x3208kjyCjNZ+JtRDsE2M?=
 =?us-ascii?Q?O5c0znZKUVokXHZgEqTf7clgYm4BHAWV1akvxICvpRSpElgh6HHXZIV/byzP?=
 =?us-ascii?Q?Pda16S50REKfGeQDM+cbt62Zugh+glSVSKzLkHFiQd8SdwhElCc3h2bOGviY?=
 =?us-ascii?Q?PZ2C8a1PgMIyyi/gRN7YuERYtw9NZyVo0IZzW5rEz6vlKF9Q54L1MKVZMCpR?=
 =?us-ascii?Q?yEXn0dHVeX7KDYGymMYHp0WH5+BSwqv6YQMrK25A/99SgYriVQeHZvkI1Jto?=
 =?us-ascii?Q?nhQSn+PHShQtduEf40g1tKqI/V2XwhKIsKId1HDRd+2T3GBBMAMEPMgsh/Wc?=
 =?us-ascii?Q?/0t1wwDvkVQVUGgJGX2EVZDOKqIOI4IsfMpZ7+Xczh9W+H2HEW2Kp5pwjqDc?=
 =?us-ascii?Q?gTYHjlbem5zhJMyTaQ79GM8JvQQIulFlcDFazAEkeKieA422+wDdlC/oGBAu?=
 =?us-ascii?Q?Jeniue7UqTw+L0itznrfMK46dKn8b72UZ/TzcmhcIUIJZXhmpSTkfIztGDVm?=
 =?us-ascii?Q?TYZCAxh7NrejiDDFhAB8Mr1PxW/x/R7XXFiFLX1btD2e//+Y9N55gQ/NaXsU?=
 =?us-ascii?Q?xyBfSi6BmWooGiI0YQomGQcPs4S4fPtrUC+02qfhF03xEBaIHAZfFI4bxN4T?=
 =?us-ascii?Q?G4w/zUke2asZ7yZFqRNg0gxqRLhuXJms3tRFbjPn5K/qfw+0+7oRUL39ryUn?=
 =?us-ascii?Q?Wv/kjPOc75K733Avf1cMDrn36OO6jM/7c/EIYIYHJHlHy+qrawlF361PUtah?=
 =?us-ascii?Q?3NgncOz3+OGPKdqs8siXecm0gM1+PdTYwR7DDgcq/e4Bzm095xf0U3sTnMaZ?=
 =?us-ascii?Q?h0rnSH3ZGym3W4uKG+gzh4opltW5CVsFroOGi5oZWo7gH7ji5iabB7uzM4q6?=
 =?us-ascii?Q?F7+C6yG2n+Tp5v/6xu6QzDnF2xHULvdpq9HoFVqrYqhpSp62PfCD8TwKQUFd?=
 =?us-ascii?Q?f2reRmOGDB57PVKvcrC8XOO73mooUKOO6DSmCneX5u6fy+XmthIJNMgQ7UIZ?=
 =?us-ascii?Q?EkgkkrjBXkdyUhHx80Bxn4gaZJUJOHElguR+ihkStqtlc0M0YNbdJbrD7wOS?=
 =?us-ascii?Q?++tD0HAQ6z96XpmkmHJ6Z4C6Dv8uS0uqwoDzFFRUqas0gMMXyEqQrb9TNTOu?=
 =?us-ascii?Q?Z4M2N9l4O4XISbm0ixPVumpMtJAKoInbCV2HSc8I/ZwyFrjeTdUxbya1l7Et?=
 =?us-ascii?Q?TrgEdjgCQlgpKE4/yW1KHG2ks+mbGKOtHLNkXaGUAid+zcfNKXyu3r/LsR7U?=
 =?us-ascii?Q?dgaLLkM2s/sWxl5Aff4xc5LQnvOuepD0DtrTis0pZ+LcwptQutuOnOdqYCbx?=
 =?us-ascii?Q?yksyZfhom7Lp4Iw79G0qG0yCSyIiD6ZR6SKZLx4a+wHdd89tTHUclpoBJ5N7?=
 =?us-ascii?Q?n7cHgriC3WnDmaB+K5Rz3gvAOskZqtHhEKkC1qODZUUKsGs0dyLItsbJPjc5?=
 =?us-ascii?Q?1+FM+gYGdY+9lL07BxhgoxQuXY8/8ZiR5tMVXk9TzfDgvqv9lYqe/NUWTIek?=
 =?us-ascii?Q?0JECMOi31v1DElsHKb+9EvrqHhjNaWcsvVzmb69cbS2oBFwmYkK6ZZ0rZUpc?=
 =?us-ascii?Q?O0ouhxbViImPoNY933HH53XDSJR1gOrZCeuQAl5Wp6/Mui2FBh+0RRleyX39?=
 =?us-ascii?Q?wqc0JpfbrkA8jtkQyBXqRpB1sAVdxMeWu4RhoW98MXp30Y9Dt0flsyyDhqWN?=
 =?us-ascii?Q?u9yTQJ4vPv4/Mi7wpWuMX3SB8Q4L6VK/rIf8ds986zD1FtUM85NmH7gZzyae?=
 =?us-ascii?Q?Nkg/ilBF50y5Hrxn8Zt2NtQfGbpBH7pEEGBqlOsth/tzlC3X2714?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdb4b92-9889-49de-ec04-08df45b8c717
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 21:13:22.8440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0Vp1pOIQdfqCnNXArQcFDH1fMdT+0m1S1VD/dKjH0KjprBxRIruE+d6900M08LPmhLfJ5YaaK6xQ33LGJtwfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF6CDAEAF48

Ping again?

On Mon, Sep 21, 2026 at 12:15:01PM -0400, Yury Norov wrote:
> Ping?
> 
> On Fri, Sep 04, 2026 at 11:36:56PM -0400, Yury Norov wrote:
> > select_fallback_rq() checks the local node first, but then scans the task's
> > affinity mask in a numerical order. On systems with more than two NUMA
> > nodes, that can select a CPU farther away than necessary.
> > 
> > Walk the scheduler's NUMA hop masks and consider each newly reached CPU
> > once, preserving locality across the full fallback search and after
> > affinity relaxation.
> > 
> > The NUMA masks can be unavailable or incomplete while topology is rebuilt.
> > Search any online CPUs not covered by the masks before relaxing affinity
> > so fallback selection remains reliable during that window.
> > 
> > Signed-off-by: Yury Norov <ynorov@nvidia.com>
> > ---
> >  kernel/sched/core.c | 47 ++++++++++++++++++++++++---------------------
> >  1 file changed, 25 insertions(+), 22 deletions(-)
> > 
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index f78275192036..2155bad0e1ab 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -3554,34 +3554,37 @@ EXPORT_SYMBOL_GPL(kick_process);
> >   */
> >  static int select_fallback_rq(int cpu, struct task_struct *p)
> >  {
> > -	int nid = cpu_to_node(cpu);
> > -	const struct cpumask *nodemask = NULL;
> > +	int nid = IS_ENABLED(CONFIG_NUMA) ? cpu_to_node(cpu) : NUMA_NO_NODE;
> >  	enum { cpuset, possible, fail } state = cpuset;
> >  	int dest_cpu;
> >  
> > -	/*
> > -	 * If the node that the CPU is on has been offlined, cpu_to_node()
> > -	 * will return -1. There is no CPU on the node, and we should
> > -	 * select the CPU on the other node.
> > -	 */
> > -	if (nid != -1) {
> > -		nodemask = cpumask_of_node(nid);
> > -
> > -		/* Look for allowed, online CPU in same node. */
> > -		for_each_cpu(dest_cpu, nodemask) {
> > -			if (is_cpu_allowed(p, dest_cpu))
> > -				return dest_cpu;
> > -		}
> > -	}
> > -
> >  	for (;;) {
> > -		/* Any allowed, online CPU? */
> > -		for_each_cpu(dest_cpu, p->cpus_ptr) {
> > -			if (!is_cpu_allowed(p, dest_cpu))
> > -				continue;
> > +		const struct cpumask *prev = cpu_none_mask, *cpus;
> > +
> > +		/* Look for the closest allowed, online CPU. */
> > +		rcu_read_lock();
> > +		for_each_numa_hop_mask(cpus, nid) {
> > +			for_each_cpu_andnot(dest_cpu, cpus, prev) {
> > +				if (is_cpu_allowed(p, dest_cpu)) {
> > +					rcu_read_unlock();
> > +					goto out;
> > +				}
> > +			}
> > +			prev = cpus;
> > +		}
> >  
> > -			goto out;
> > +		/*
> > +		 * NUMA masks may be unavailable or incomplete while the
> > +		 * topology is being rebuilt. Search CPUs not covered by them
> > +		 * before relaxing the task's affinity.
> > +		 */
> > +		for_each_cpu_andnot(dest_cpu, p->cpus_ptr, prev) {
> > +			if (is_cpu_allowed(p, dest_cpu)) {
> > +				rcu_read_unlock();
> > +				goto out;
> > +			}
> >  		}
> > +		rcu_read_unlock();
> >  
> >  		/* No more Mr. Nice Guy. */
> >  		switch (state) {
> > -- 
> > 2.53.0
