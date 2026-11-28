Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795884832;
	b=JrKP1idhpUGHCY4uo5fdV8S9rcygMd+nmWgisNH+/3mqFuweenq3CfX2E+AWmZMf4ycD
	 8HSuP5rzp5ARnJSpMCCdtA8RgbOM+wfD4UCYXu+NmVW7LMNHSiAbcgZhEx9mAYZAES9FP
	 iP+jDIOMHDsr7IUzWnfV6m4J8q0NGgeRAI2gngFdbFmWdmI6fFUyGzli9/FovcUZ9G343
	 KB6cC8T6hk0P/8vfHkmln78oJwqphpVweDJRVOLbIyEi9TaHe61lM7HvKueXr8lccwZ/H
	 OOdWsDO358Q+pgoFxYv0KKjgCxN+ajWanfb6Z8JQJvAzmFiq1+BJY/Ax2s59SiWl91A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795884832;
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
	bh=pRtjo+QoYFfiXhf5oPCHFJ5LrZHoR8Tn0jP3rctwJmc=;
	b=vOKYH+aDKY9DuapNSWK2X7qTlH9KCuZbJBN4nDDCfkMEG0ewSM74PPk7Diccdruy5T1c
	 QJLCniDZpJXLb+xCm0RW1aXRGIUPwGHdUgld43e9OOKz31f+1AePxb8BwRRN+imgGMzjP
	 GfI4nIbgfuc3KSDUP5eRTmcL3k1VVHC9p9kG49CEK+A7cG6p/Y7DFFPGzI8ExtaNANDq8
	 RpCj36m2UnN8YeAfR+HUzJ3+nwHdrWjJjE7ay6TuViMyEQPHEkTg9LO0zgPb1S2esv/j+
	 dYhDDmo/3FWtUEDaySxz+4TtQ4OF1NosPHpJOfDkBC0M3M3t33C/zJV308+NUFjUzIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=O6MDdaax;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.47
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010047.outbound.protection.outlook.com [52.101.61.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0C3606A324
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED0C3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=O6MDdaax
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JavWoTNppRrBfBrtjBSDvfRHepRcW7/YVqYtW7npTKFnkeGCf9R+X3YbOsYjEa+oBlowjhDX/2TuvjDeq8wld3gFFs3qUp5VUGLqZuIchQlE2ThCY3tLh1dkZt9Ew9RieXcvoCUO52nl/1fgyF+QcjZyY/XspiQCUckm4XfrhlScK7LM2wLFlSOtq8M7dS7eblw/KC2bDpijiUDAX0a2CCAjrWDgY/SFHhGjemtymigV8K0HglDSJeE0tXNQ5asjSm1IjEiAmxH54Ywlrx2pYQq4NVufndtLxq85q0vn5JnkuQREG94lZA+jg9iOgVIH5fA3eipJV1A7r/HUxKEJyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRtjo+QoYFfiXhf5oPCHFJ5LrZHoR8Tn0jP3rctwJmc=;
 b=OM7ZH8FBFcK2xkIWWTVa3PDY0CsfrI4XmgvS8w0r8Me9YAWkm1Y1YHUgFwmfa6NvfbCOnF9JI5nRzjL/R7J1l8T6N+fmc7JumgKipRXfJN8p9HcYjlxKihbNNftwc+pFPnL8fIqVsoa5nQA/PYqbbYBR0HTlFVuAqVAXZYzRZFDUFgkrIm2Os8tM7rU1GrjQhzv5C/fVgTfJmAMccfMC3Ec4KP1C0RMPcMuuCV8Jn649AmJWrRhwR/81K60wBB/VzE5oWwYT4rmtLS2m5H4RtFb5p5auqeUiQwGM5qc3MSvf3j5FzPsq2jgQLc9AoDNLCgevgYR08XHpxV24HoMTzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRtjo+QoYFfiXhf5oPCHFJ5LrZHoR8Tn0jP3rctwJmc=;
 b=O6MDdaaxuglop85oFGckTVuEK6csFncMs26TYhPGmNJryRNjxQnyC/XaxJ8f6GWLxh+2H3HbYCIXkkoIS/MbtOWzKrq1fdgOE4otbV1FHW6+cPivzu2jRddwWADaDffyBCH0VdVR/1NviKk5KmreHD1pEZWzAjqHTiSVCpBs4CPHLwYVBo7LNnpZydFKn0SSdJhjwRyQt7pVuatDIgSfGaUZy7SzTfMhwuwJ/C/2TlaQ9DYBN6I5A1eDvrh0BytmCWaUU9VpSGZRglxrnNXHAgkNbSntNkvg2C0Q31fUD8yDsPPyJaObvBfdMSIky0yHJBjBYCPDIX03rjuCQ0jTRw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18)
 by SN7PR12MB6715.namprd12.prod.outlook.com (2603:10b6:806:271::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.11; Sat, 28 Nov
 2026 16:53:46 +0000
Received: from BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f]) by BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f%4]) with mapi id 15.21.0662.007; Sat, 28 Nov 2026
 16:53:46 +0000
Date: Sat, 28 Nov 2026 17:53:37 +0100
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
Message-ID: <awsHEWzbu7h8Tysr@gpd4>
References: <20261126111649.208476-1-arighi@nvidia.com>
 <20261126111649.208476-3-arighi@nvidia.com>
 <0e09857f3adcb5a83711458cd7d1b6f9@kernel.org>
 <awsDxUgf18EsXz9J@gpd4>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awsDxUgf18EsXz9J@gpd4>
X-ClientProxiedBy: MI1P293CA0029.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::15) To BN9PR12MB5179.namprd12.prod.outlook.com
 (2603:10b6:408:11c::18)
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
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:EE_|SN7PR12MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: f38bfea2-4004-49be-3641-08df4d702aab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|10067099003|56012099006|261026140227099003|261026121527099003|261028144727099003|261022075727099003|261022105027099003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	CYa1SWTF6GEQexWz9bWLTVtroLZIf6MX7dbmdtgTLhV+ajwWKf+wOwhzN4yQyhX78DQOnnfAax3YjT8P7qEUfP3vxXKMaIQifSLtP4UCKvTd915+8ozQQHMvmDzU0++VYAT7CSZN0ztN0qv+pUP3OoGzSMwEwjFDVMuFJBPWCTjFMM7loKM2PPkeSPOon+dRNGRbJuziBzaTXDOhMa9JmMK1G3Rrag2iByJLEyZBzFORqBZuFDUlf6osSA1EsiYR22iCDeCNaNKrq9dvi0PHMcodDws7chhx0YkF0iHF/z3xUNeXKHKilsznNdVNRfocpbVmKuo8EXmy7Zf0JIHBB9QrSLEmfzP7aMP+/3xaTpfJuvd2RlKq0ppANBNJWnTYiUQxFGrRnX7iBrheG2+1HpSzVvgWHS/+qxUGhUlogQRwnC4eXf5eKYIPB9JKavYmejpZ8J/Jq80LYJm1kcxuZxdw+pmttuYqzIIu/jOIAy9avwXqByTH4RaAwHdhXfa725fYK4jJoclrQU4rspq4+W7/Tcu0ZD3P4e10ULs9bHpxUYOtyScTXyKIcwYIA76ZtmZb31zUakFTAOMsSDsMemGq8pGgViImfvdCjcXwyOeYK7OBi2kY9kznlxL8w3gW2CtDcCa9YMfgtDCkMq4u2jaDGMm3jTHmTqrTedDR1yg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(10067099003)(56012099006)(261026140227099003)(261026121527099003)(261028144727099003)(261022075727099003)(261022105027099003)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bpCIMuhwQYhqL+Q5ayvOME5H5SrFyvSIb1gtkF8V+fiMqaOR7xo6i51wiZ8R?=
 =?us-ascii?Q?LMslVMCxf0sxJW52rmVeNfeKmfM0CLJ6EFMdCc9yxJ51lRAcJDmhr/lN7pyR?=
 =?us-ascii?Q?sewEHqNfExodTe9CQoNf8aviO3fPdPUPXkybcYkWXIJ3PuAS1xhtx8SkV8mn?=
 =?us-ascii?Q?VeKgs5af2FKFz5BaDH2iXJNHoakqW2BJNSeP8FUhNdOMIuzzKvnjjCRygW3A?=
 =?us-ascii?Q?/ZLj6atEd6xn3pv1FSXZp4OMqaLPUmIIS4Q7WIaw2jv7tioJgm2pJs37q1CP?=
 =?us-ascii?Q?elMwl69gDjTR6mUyzNjRnYndqB/6q+TPPzF7oksa5uEZe7OGFsjKHeev3yUN?=
 =?us-ascii?Q?5/ocJ+uHyieweFuH7IzpqC2clCAVykRQbIbP4y2Lx8Tz5EMkhzMbO7RrQ5nA?=
 =?us-ascii?Q?VGweOTN5RsHOjmyTCIb7fHZ4Mj1cMKlOUYUxqvGjKvXS14w/lTYw1NuBckF4?=
 =?us-ascii?Q?VIgC1kqX4QDJLv2S0U9sdmR9leWvRKxrwchlKAIjlxQg+TzRhnLLTG5hDcBB?=
 =?us-ascii?Q?0Cfr3VF7zGdufufs3bow0kOE5QuxfNGmqPlIwEo6d8eybW1tvxdSVjaw1cER?=
 =?us-ascii?Q?Uaa1TNool4s30Ebuq5w7tIpw8iHKdUpgywNkWW/ABhYPrIX5AO3CRQ/oOw8w?=
 =?us-ascii?Q?Yr2dh3Dh4TK1bcuhnfCkXOdotiUDX616VFTBSRqJywf/yOj2TI8UY4t+7ti0?=
 =?us-ascii?Q?6nPC7m8gcrEdp3sRegtRCTsAqfG160hGyFZS8JYiCGPYSGQxVPNcq/D6oDsQ?=
 =?us-ascii?Q?p0qGqxXMhL87OIL3DYo+6r2zmsOuG60szZKh+QpsECjHbONnIiD3r5EwQXTP?=
 =?us-ascii?Q?xcoCBtIRX7h+NQYojsDDBnoYVNz/gUC1uZmAw9OC5CGZHLPmqwO9peW4z2A5?=
 =?us-ascii?Q?W7yJFA1W9Bs3t16YQv+JBEskLwVSr85074B6QKtbkK6NiyE9g3Iji0VO7Kwn?=
 =?us-ascii?Q?KLLQqDr6j20O8dHtf8VFVx8/Sr96DSVV1FA0B0iZuIo/d99InFCklPVtsSuC?=
 =?us-ascii?Q?nEzF1uH8cSwPMRMkZwFfmWU91cGbEssffR1Kzxv8zGrhxJ8RQFPIHrwj2HoM?=
 =?us-ascii?Q?I8oNIGvlzBOCebXx+1FPiMYs/fiBTDbicwSee85iatMLqusjlkqikDPPt2oN?=
 =?us-ascii?Q?ngCVznnrRtOfg8zg8alc0B+tnmgI9HQ+wdhkG+qzY7q1qd4k747knVs0yE3M?=
 =?us-ascii?Q?f48V+7dzUpH63ae83pmsXyUdpyoiXtT7bl1aAar95K/7sFwUEUNfv+U6tT0o?=
 =?us-ascii?Q?yTbdej1KDdkhq/2KZOVG5ufrzSXFIWj0rr5YuZzkGvsCKiYNycdt2FicEYHW?=
 =?us-ascii?Q?11aEMF9ISQyz1cH+Slf9J7TvvS3sCgAqcS6g0lInaV3fJUHOgaoAcy4WtHyo?=
 =?us-ascii?Q?bFSTtxwWzZgiMwNTk7oGRQVM1ReRYsKXicfppCYTzwPupjrX4NgDu2+8C9sT?=
 =?us-ascii?Q?4v0uqsSJQ+bbpLaIMtUjnhfNMC+KXfkG1e6z7gype+09zqy4ei6zrbP/zKrR?=
 =?us-ascii?Q?eZO8D++32iVdeLukCz0lG3oi3xK4qXQNC5HzHMKEDcEpA0XUDGvk7uLsZr8C?=
 =?us-ascii?Q?lZZv99Lr6LiyMPhXjpMfsENDuN8sJh+47nYQwqm+CPWNGgwIfSxIX1RVBk0I?=
 =?us-ascii?Q?VA8BoW0Cc22BqrxQjy6ZFigaKbTQqmWWfCN5ddoZ0UJ7Sbx2KpznS+pJ7x2E?=
 =?us-ascii?Q?iCs5neQYWVwLC7GaCJ8ujERgN9XklSOVTIw3OtMKZepB2ExuI9v4I8exXpkc?=
 =?us-ascii?Q?VRyl2/AOhQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f38bfea2-4004-49be-3641-08df4d702aab
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2026 16:53:46.2545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lDrY68PC6IQnu4A3Dz7XHoYbXj9TtS8gcEtBcuZriLmngE+DBsJ4fV9DANA+7VxTSQpcBktybYzqdEYXtQ6TgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6715

On Sat, Nov 28, 2026 at 05:39:33PM +0100, Andrea Righi wrote:
> Hi Tejun,
> 
> On Fri, Nov 27, 2026 at 10:29:43AM -1000, Tejun Heo wrote:
> > Hello, Andrea.
> > 
> > On Thu, Nov 26, 2026 at 12:13:58PM +0100, Andrea Righi wrote:
> > > Mixing proxy donor admission within a hierarchy has no real use, so
> > > don't allow it: a sub-scheduler must match the root scheduler's
> > > SCX_OPS_ENQ_BLOCKED setting or it fails to load.
> > 
> > Does the match need to go both ways? If the root sets SCX_OPS_ENQ_BLOCKED,
> > proxy execution is on and every sub-sched needs the flag too. However, when
> > the root doesn't set it, I don't see why a sub-sched which sets it can't be
> > loaded. Proxy execution can just stay disabled.
> 
> Right, a sub-sched setting SCX_OPS_ENQ_BLOCKED under a root that doesn't
> is safe, it would just never see SCX_ENQ_BLOCKED. My concern is that
> it'd be silent: a sub-sched that opts in and implements donor handling
> would load fine and that code would never run, with no indication why.
> 
> Maybe we can accept it and pr_warn() that the flag is ignored?

...and, just to be clear, by "accept it" I mean only the case of a
sub-sched setting SCX_OPS_ENQ_BLOCKED under a root that doesn't. A
sub-sched without the flag under a root that sets it would still fail to
load, otherwise it'd receive blocked donors it never opted into.

Thanks,
-Andrea
