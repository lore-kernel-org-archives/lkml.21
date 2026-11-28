Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795883987;
	b=RaLogWjqVb7+KFKHbtzB1di9OrJHBNAje0KPgodR9RHFAnj6SUsiKaSv0smp24zWAqcT
	 4aCKU3m8396pFNOlz75gWdonUbv5fxJcDffmRtuyEZ02UVKyTJaAV2Pyzlgv3FTFZYMmc
	 dxQJ+YUP+m2SwOotLOZwWke1rHTho/YX8Ueoy3vzUme7t9jkQ6QrQVpenUOFARKKj9GTA
	 FxiZbD8JJeNlv14s094mymlEvS+JoYcinEpVNVxxPCt+5MCejzkRQ5luhZoZOq6yoIpkI
	 qaDK4AZfIYH25GRF/bYcXPXzJOgcUxYeQ78ddIFlXrYNtaexbaHEaYo7B/wLWC20S7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795883987;
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
	bh=rYDwdnziixfCcL00TRHJMjwk+lek+bIV0vFyQaPerM4=;
	b=FSSRSYVHRZ6oJUe3qRoGbNw4nvBgukhHmWFiJQVFjbTKqDb0nGhBD0SOokD/rGPHMn/J
	 mWdXkcTJ0rNBW0MnnyaHub133B39iGGrjEyNW411RPiAOODOnPHl+hbW6ZRh0eZy5tnVu
	 yiJUBIIqQbtvlSuZGZcu2IyFlR3MzxhStunnZVMT93rImcVE/pbcLsjrN3FyfXTGqvXme
	 3mPIgcTC7n37ZRYtJtiS3u1Go8dFGj2Ouo5D3H9HNC72ta+/eb7oIjZ1RY8sNbdRjAprk
	 n2QAi3r8HkmgPgura+mlx/oZ9XcpdD6VGBxr+yLz/6jeD3bR+3JEJMlAU8nIBSsS50A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=r2eWFo6P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.51
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010051.outbound.protection.outlook.com [52.101.85.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF3C606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF3C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=r2eWFo6P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpHWlcqSQrpVh36T5sRDzGL4GpzsjnDfjSO2AG7Dm1+DnaHKkNCM1AW4lFGQqVn0L+rNyki6cowpxGIxqjfM1Y2ftUkPDdaWIHWMyXHm2Q6+YgprgmDEFk2ODUM6cBjT+YpdOYipo5kgdPUoRPQC7jErkHAtVKzNXLQqoTsLVkRvqavpkDR5lItNTankppuX/9HemcHRmMId6lDq+vG8MGrgapQ4393AcJdegm9bmLcJMY9G41fZT+OnOK3JpbK4E+ff2tfa6HhclIC0+sZRZhS0sOPx6Vx8e4XEmxbDd6iWHFXGy2exu32zDkUpis1owFcFqxaVb62L155TPCUIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYDwdnziixfCcL00TRHJMjwk+lek+bIV0vFyQaPerM4=;
 b=tFUT6DuLYn6pKz7wee0WNc1eyHV8Ufa3VF9zeT3MKMoXw7cpvg3bnyBsP7b0wggM1Pm+5rOPEbuCCNrIunhU4GdTd7YD1poh/wiI3M7MYp7tUwHy/PGB4yVk7T6ClNMxpvqef6B+WUOs9+X5Tosrm8CPEeDIxHGWNAfHl+YkzGgdZtstd6XZcHjHAkptN4X1r/Z+w8S3HWxLDfwAB51QwTkA6SIPM66aRFyDVmmvWe7bvZAAo6pk5KxfjN/eKjKMAEGEuijMNVzaJkEnGx/JlowUKatMajeSLM95K79GKysEkaV9MmOZ0YQOkKYpolX7BhjIJTPSk/g1MHR0sdhmMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYDwdnziixfCcL00TRHJMjwk+lek+bIV0vFyQaPerM4=;
 b=r2eWFo6P8JJrvl1Tn1CLboHJcCJUvH0yfEBMyfkgekq/baze3tf2qGCxBHe9/7PBtBwPTjGeRSASFzlTqks+EU7Ngsi3jDlPkqZaLBv9tRkKsyCShwsluvqHiYRyTODjWRDogTrrfL9yiGrX15NWjITy95OHO5vydPrgzIveIrKuU3wAgRfJufZZk4aRgj9B/pOI+oE0CqDJdACd1gVaEI8DiY+fskHTdg1+7YdSbWOvMMG2GMjbLDRcBY+fAAPb6GSxksOy4HzjK2cYfwZAoNJEvfDel/1U1RDZyqdjnW08T7OTP9hi4SQNJG9GatQ292DHULrGdyV/eDlhSasriw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18)
 by SJ1PR12MB6123.namprd12.prod.outlook.com (2603:10b6:a03:45a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Sat, 28 Nov
 2026 16:39:44 +0000
Received: from BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f]) by BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f%4]) with mapi id 15.21.0662.007; Sat, 28 Nov 2026
 16:39:43 +0000
Date: Sat, 28 Nov 2026 17:39:33 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
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
Subject: Re: [PATCH 2/4] sched_ext: Make SCX_OPS_ENQ_BLOCKED a hierarchy-wide
 setting
Message-ID: <awsDxUgf18EsXz9J@gpd4>
References: <20261126111649.208476-1-arighi@nvidia.com>
 <20261126111649.208476-3-arighi@nvidia.com>
 <0e09857f3adcb5a83711458cd7d1b6f9@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e09857f3adcb5a83711458cd7d1b6f9@kernel.org>
X-ClientProxiedBy: MI1PEPF00000D6C.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::49c) To BL1PR12MB5174.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:EE_|SJ1PR12MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: df09b7ff-e55f-4880-2cad-08df4d6e3457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|10067099003|56012099006|261026121527099003|261022105027099003|261022075727099003|261026140227099003|261028144727099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	Z1eEfgE/9esS5YNLIc3OqZYnVK48KDBG3g8VXP07M4yZ7OtQMpd5i/QSAanqoRCQv4p27vjWejoxzrGDTCAgk5EekySlULDODkmpl0NXrXTBvBBnFkoDAZykVtlKV5u4jiL5wuLGWDrA7P1xCtFYX0uM4SusfNhmT4Kl9yncbbynti8Gxaq9085LvSsCN8WkCMBrDW104aRRGbirosdK7MD6koy5WsMUdsTS0AHoWjWVtq9tWuCbQHO784iyo52qK5Af/5DMVx4CcGAJsQbG2vRb1JoMpI5iPpqzbw4Ns2mglZdf8N3mSw+nSvfuMMp/KituKhUCgBgjXRpXkQVDCFTXYCy+HPvMWdgJzHgDPKVWv7UvIuhc23vEHyuMh+5JN/LObiXUt/VUT3bykWczyUAqtwT/AOckfWr4np2hYS+XhMzS6roBvH9bS5WQTSOK0cxMAOUMwvXpuVjtENInw26uCj2xBYbIcE3SmoK4WFfQxSjAbKKkQB2uN46RYaf37+q/oBMafTyltis6Sz/uOXo/Of3Q25VyV479EmmrnHIlJiVOeNQ7dquOmRVQGyJZnRDancFFwyyyGCX7O2bpL76ipF2qVDnIE/7bFN6doJSRGCn/II0I5/j/ngqoZTZyxJiNnG/tOnnvpFuYAdfuO8XpkpRGZlJoDi3yI1YFzOQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(56012099006)(261026121527099003)(261022105027099003)(261022075727099003)(261026140227099003)(261028144727099003)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PYLY5uQ7/BDxcAtfhill3ix7aHxfdut3k2hDVmgT0erPtwEZfIa+dlqqVNiQ?=
 =?us-ascii?Q?ejhewtNfjPTxUghSRJ6Tbc/hkdGHamfO098WP0wj9SYww4nBGj2KPsKbG2rd?=
 =?us-ascii?Q?U1ZE/HWJjEkFBrZr7F4R+pLhZY4l/sm0bAWu1m0ZeE4kn/9NKMtHR5rJGZgW?=
 =?us-ascii?Q?3ZxveuLAZBnUpFLeRzRly8pLjpWMuvBW9oySZ9XWzM3UAiNSf9HrS/GQ0Hgo?=
 =?us-ascii?Q?EfdehKQ3o+chCJfqaEOTOTWAywxvqiXeZzLOI2loJ59eR9HwaN8NDOJDW++o?=
 =?us-ascii?Q?ZB48nWBNk5ll7EaIa0xtHTy0pQDm1mqbiKACEvvX7Sg5uKwOzIcrFt3fz9i5?=
 =?us-ascii?Q?TkSTkP4wufkgDPe3h32Pxvy1BkaoA4GiTicVPy+JbxZvGExl3WqmdNWR1xuh?=
 =?us-ascii?Q?8Ngz79SAPUnc1QN7SMtKAcwOLD7zk0zzdcZbAV9x5qAc7/lX9MJ62pRooKg5?=
 =?us-ascii?Q?1DKVox6a6aI3xVQZZFkWFUyeWKtKfYLaJ7tumDSgMNvxX/BbGhE6TfolHsPg?=
 =?us-ascii?Q?vtXabsCat8pHM3n8F3EUBNSD5zzN2Giqe7eS/FbyYwrgFdDUdKvHUN+AqIGc?=
 =?us-ascii?Q?v3bTS9XVvF6hYgZ0vZEvx4hetcP09OPgydovVBVcd7QQaIncX3Ocw1Rj2gOJ?=
 =?us-ascii?Q?s6ZpHN9oUtmDl48QmZyzuAvWre3IOzE5lpPEZ1VutwOAjelLiDk8Nc0n9+NL?=
 =?us-ascii?Q?QgvdvUhirkiaAs51CK6Z3iwZdL4ufib40RfweO2FYU0JOejqDXTi4Yd35/G7?=
 =?us-ascii?Q?SOFLI+0COsWMXO/+fSXiEScbB6lddwlVzUHTGtp8n+/wpz1hSetboYpVnHBP?=
 =?us-ascii?Q?Zl4e1OKCEjoSAb03bbZc5sfRJbYan00Ymxazqi5rFJJPVIRn1JVVIRO+xRV2?=
 =?us-ascii?Q?oFNYQZ9DyAC7yjTWA6zrSI4ZkEBwtdu01ah4JJCHK3fuE8MCsjP1CN+kXZVH?=
 =?us-ascii?Q?n+U0Xj89mGW5UOg+QEU64uuYUc12DGx2lkwGuiRXMeaK1vDhrWUakc6EP1G3?=
 =?us-ascii?Q?7ZtzvKjYEvYKMRqpnt4wnD/kcV86Rjxd4nAClQZtWePpCdTW7FKKPfBxeunB?=
 =?us-ascii?Q?B9pUzppMjvugdsN17IcGLoRIh8N+vYupNVabATS56MTts+Ute96kJ+1AHOMa?=
 =?us-ascii?Q?zcZZeEeoldt72yafB0u/PHrJV/IVCpidKItnNdYAFZ+HrfyXS2WXrLa91swT?=
 =?us-ascii?Q?DqPVTmwoZyZBjiv6SvEQV4HiYk1F6IDQas5D+ifkRkPoSmLIT0g2ij6bD2Rm?=
 =?us-ascii?Q?kmlZkwm5iFJW+9yo0ct0kcx+uEvYDE7uYoYHkmmEY8F4pxJo3V8nqvEHViaj?=
 =?us-ascii?Q?bNrqLYcS2FjcxnnqI3dV5bLTys/pjk+3DmjOpXdpXS4tW3CXg2Z2Da6Y72W2?=
 =?us-ascii?Q?9KMJIkaN387/t3QLU29Iqkws8rLHwKf/fE7rNYtmC53I8IZ2nIc+biVwe77o?=
 =?us-ascii?Q?ZFJulW2RZma1i0mfJkIhCdTOsLZfkop6cMFJNJsfaM6j2FZjc8bb6DpGTdwL?=
 =?us-ascii?Q?az1CWK+X4F18/Qca8t6m6JXJsH8X4wjy3Eeyd5+nn7vhixjqllCKrW6gQhwZ?=
 =?us-ascii?Q?0H9XfRgZF34UgPBeuUAq7EAI3OD3wqEnMzTiswKhc/EIicdUsjHCLiYSyOM1?=
 =?us-ascii?Q?s/jDiidEkQVjqEtjFLTCw3Z/g4TwGTYXxxe5xXXknefXMyF9usv4RjhP/kdS?=
 =?us-ascii?Q?rel7cSkZqGUNR9+mko3jDN4/qrBu6kkj6yNAZxpn08SsH+Uv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df09b7ff-e55f-4880-2cad-08df4d6e3457
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5174.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2026 16:39:43.5469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n1aXB3vkCipy9waE83DLRUiyptjJ/zuEzzxR1RHIslPP7VJbnVhToEsNh00AQowsnZjnwTlToAO0wHAUQhhjUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6123

Hi Tejun,

On Fri, Nov 27, 2026 at 10:29:43AM -1000, Tejun Heo wrote:
> Hello, Andrea.
> 
> On Thu, Nov 26, 2026 at 12:13:58PM +0100, Andrea Righi wrote:
> > Mixing proxy donor admission within a hierarchy has no real use, so
> > don't allow it: a sub-scheduler must match the root scheduler's
> > SCX_OPS_ENQ_BLOCKED setting or it fails to load.
> 
> Does the match need to go both ways? If the root sets SCX_OPS_ENQ_BLOCKED,
> proxy execution is on and every sub-sched needs the flag too. However, when
> the root doesn't set it, I don't see why a sub-sched which sets it can't be
> loaded. Proxy execution can just stay disabled.

Right, a sub-sched setting SCX_OPS_ENQ_BLOCKED under a root that doesn't
is safe, it would just never see SCX_ENQ_BLOCKED. My concern is that
it'd be silent: a sub-sched that opts in and implements donor handling
would load fine and that code would never run, with no indication why.

Maybe we can accept it and pr_warn() that the flag is ignored?

> 
> The root alone would then decide whether blocked donors are admitted, and
> scx_allow_proxy_exec() can become a static key which is determined by the
> root sched.

Agreed, I'll convert scx_allow_proxy_exec() to a static key set at root
enable.

Thanks,
-Andrea
