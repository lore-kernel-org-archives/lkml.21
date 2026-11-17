Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795024850;
	b=OqQ3Y+sGhWt2owFX7Fh2YKhUWhk7h415LuG2zPg6Nt6ueV0s96WIWnnO+fPdQO9LEzRz
	 4wWv1Exzcrp3TrwgRoAnunjEw1ImlT4z2kEFTgCC5sF+WzlQcYBobHxIdIeLyVmpH23C2
	 kmwmNxZwOu2PH6aT1csuMLDsOPQaRRpn0fT9RfdrlHttE1j5ljjzMcLJL06nDOxrw5o8m
	 FwEdxpuwb52P7kTyW0NWFsbHZO9mY0OFU6i6AbKm1QjSVXBA95O2V8a6WMahXpuAE8cZP
	 iAE/9CofnDQlJ8JkQOzkEME8wfQmIJR/ba0oZkXW1HB+tb+CTqneLSB38LJ35NGH2Kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024850;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=LNSGaS4McdNEfGGzvOaZtRi1rGW1+x18PfAnxEn4SBw=;
	b=Xtznad3M7Wi7asFGzZiy62EefrFUdEGlyFgU06Py3HAilRC/jv2XkkglorCwWy9OMu/i
	 9P3YcmbQhl9GXrgYIlPRpoAFDFH+591OY8prTKSYm7MHpAa4oNyFz6B+D47M1ELCQnceH
	 sppYXN1RI7LVWW2uG+NaDOxzYCwSzXbd/j52+vcKfmopX0ZoaUFIqwU4aU+/w638wFMAG
	 Vaacedad7s6ndmGRnUADb44ZNL1N5DpE0WbYWl+0NgXWRdAXLwR57kiU8wCQ1Usa3ORcN
	 KzAVwePHwZAdjO8NOJiD+0Ax9Q1uTtesSlzzy9X5bdJBlUReraLJsRKPUw5dXXVgttg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GVh+mAm9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.39
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011039.outbound.protection.outlook.com [40.93.194.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856E6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 856E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GVh+mAm9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYtm9D6JG3OneTZ9PVNvwBY9PQj/jnbsmVLqbZ4sJOH1YPNOV//itgq7jqtVRYqwjyDf45UAaOv8d13oSgeX11OJQOvqR4OnvKAPRYx7A9FY7pSShkg9EbzRmHPxTwBdKSObzrsMh0hVswnJpvq7vEqJZ8m2AMgE4/Tm2Ncys1e+/1jfVBxKNJxERzsG13ir9I/Rz/C3Eth3Z3D2w42fn6wEDBqbWAR0Q6Xvk15cHN+iUyCLhbaCUbIJ9G3F1VqKYC+wNDe7O8RzIpaZ/6e6/r3jYc5CMmtLdqbeyP6073Sze/so19C2rXT2EiIKyN90/ltyMDEadqR2mRzmN2ds2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNSGaS4McdNEfGGzvOaZtRi1rGW1+x18PfAnxEn4SBw=;
 b=NzQhB1wqhBZmpBKX/FYmhMC7prkYnRlW2RxfH2+SZC69EJHCLn3wrvc6k86B2GYgDQWhMyagmJBvJuEZAru+F3boE8l4LwTidRn5p9ynea84vRAXNUneVphQL7IDsvixUCxqGJezLDQk8QETrfLd93gLktAcGDf5Xwsdc0FB6MFW+bObs1youLcSuiASxzNYNhzb8+OOF+izc/DXF91MlsbnNl4BafAZswr0c/8Sks74hAaMMLbIhoraR1fnNr5DhYCBMdCOpF/udgduVa+N49SRAR9PLXa+bRQNnDz/Nw2d4gK23g03X88NKuHsD8JwHWFTDJzGgyvMVu+oEh4iXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNSGaS4McdNEfGGzvOaZtRi1rGW1+x18PfAnxEn4SBw=;
 b=GVh+mAm90/ECBSLPrZHklRxpc4Q6tigrR0cynPQIG71gH3ZA4KmmuBF/gCCfuyD6VYeYHodJmZfxqXDAfayTfL89ZU5z4aZZPBljAyEVWT0qnGrpoaCLH6nas0X9hlpcMJ22wQo6qdbITGe/fD5MhLdR8WgclJBt6gqiaYLemzg231k+3lT0f7K6HJcIFbKfCts8wakKkTyaSC5wfJLOeYuBPFkPPlE568BYCJzAshjn9LG76wvauzAJC6fkMLoAXCjiCqSCJ0wwuhtslh+gvw88cf+TswafhbkIM+nDlxCC+I6rOkGqGrU5IRSr+N9Tq3v1vOiv5crD4DzH+bURyg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by LV8PR12MB9230.namprd12.prod.outlook.com
 (2603:10b6:408:186::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 18:00:42 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 18:00:41 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Brett Creeley <brett.creeley@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Avi Weiss <thnkslprpt@gmail.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Jonathan Cameron <jic23@kernel.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261028125531.978325-2-thnkslprpt@gmail.com>
References: <20261028125531.978325-2-thnkslprpt@gmail.com>
Subject: Re: [PATCH] fwctl: pds: report device information length
Message-Id: <179487534098.2591066.17925593774283877174.b4-ty@b4>
Date: Mon, 16 Nov 2026 20:29:00 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: CH5P223CA0009.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::7) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|LV8PR12MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: 0536f8d9-82b8-494d-71e5-08df459ddbf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|261009223027099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	s4IWt5pIiWpSjw8srRZsRh4SVBdSLJm2Z8Qq0EmDBN2xfnSnJvCooW+ZuQJa5wMeN0RQniQC0GbZpSseUvtrdimGrSzAfdWPGbp4V+dFZxOVnUTu80CAnqcJ1OuRj06eX4iwO4gQQcMcn5WZaeVzE1FJ7SmPPLETvBIAt4PVuZPDBlXW64DOrZ2sksAESWcS6Jh4EaKMbYv4sf/AjPqxPl+6Xy7kkd8fAcjQmCFZCIW87ULNNty/Y45sGVUO17gtop/oZmP9oL1I9zLeSKhrvSe+Py+UOkYLBI+3zkMiY6aGBN3WPe8l87UcGk158kselzx/bDEqIn3adOK3rEpjrsRwDiHkPbwcZ8wCB6zfqJkwqM+pm+yDXafF+yiHIYgQZqJO5KOABir/kQxxup1XjM7MPq2AoMMm5HKgZ17uCa1c9Ij4hmZh3mTtogJcLCVC9ok2mgT9rDzEfliYOadGl8McHdp1K8TwkTW1Yk+7iiVNdo7wPg8/kZTs7k9lan26iWtN6Dk7x4DqTnsw5AM+FxhUPP6rS/mq/mNhavqapJlV0KH6xy8VmPnV5HlUXEUyDcvPQHb0+jmbad5zAxvnfJhIA/WooCjK/BvmBXzUcsGwLtbdRfKl+Ma5Qx+gTkMEvUDTOtr9qjjGGEKCa3AHz21kt+VaErDDgomi5416YKo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHoyUHBnbDBmc0VodkpzaWd1c0RYRGkzQVQzWkFLVUNWTmV0amJUNnp3U3lj?=
 =?utf-8?B?Zko4UDA3VjlXOGkyUUcxRUNLTjRCRCsydEJleFlVVVQydk8zMWRjNVVvZE9D?=
 =?utf-8?B?UXFRVDU1WnRYdlNOckJQZFl0WmNTUGwwaWNWR1JtY1ZWWmxlRnN4SHp3a1ph?=
 =?utf-8?B?QXJzUFd3MnpWZ25RYUs5eVBWdDZUQ0VJcUdKUDByaDdCcUZ0ZDROclcraVNN?=
 =?utf-8?B?aHpYbE12U2NyOFZyRDJCWnBMNlAwanhsM2JtL3QwYWQyL0UrTDdIbzJmTHAx?=
 =?utf-8?B?cnAxSmozYkJjSGppTUlzVHhSTDJ0UlNrVDZ2bUgrcDRsb1ZNMmJlOGtZTFhH?=
 =?utf-8?B?VlhNeFo5RVk0V1pGRU5KMFZvUkpwamJOSzlhL3lhMzRUM3E2QjVlT2tGbElT?=
 =?utf-8?B?b3pkak9YSHVEWFphd3dnbmNVaERNK2lqMmx1Q2UzTHd5MEtzS2FhNVZpRVd6?=
 =?utf-8?B?ejN3Qm9MbVp6NW5aU2ttM1dDMlFHSG1jRll0OCtCcSt1YWZTNVp1QXExSWNZ?=
 =?utf-8?B?bEh5R1NFNjN6RkxpNGVzVkorenFmeTlHL3JmOG9iZGxmQzJCdE94NGM4Wmp5?=
 =?utf-8?B?cnBBejd1NzFWNzRmeEtvL1lYNWd3L2JGa2NuZ3JRaUUyNENyazNNN2M2U1Q3?=
 =?utf-8?B?SEg4MmNFVjNKbkZMdDlVd3BGcnhITFN5a2hrd0lLQmJ1bGlvaEtvM2lLRVhH?=
 =?utf-8?B?cUwvOVlOdUs2MWlZTVoxamJjS0kxS1I3dlY0N3BjQlJ1OHMxR09STVc4c1dl?=
 =?utf-8?B?SlFuS3lubzN2aVJRZWlXd2hNM2tiVkJEMkdTcXRqbW0yRFdzK3lEc1RsUkU3?=
 =?utf-8?B?OFVpUnkrYTFwbVhnbGpjUjFaM1d4eHMzbHB0Z3JwYWtncmlWYWhuMDZEU3VI?=
 =?utf-8?B?RWpHc0dEdlF2UlFzVUgyUnIwM3ZQRS9SbElrcUxVWnV0SE51TzErVkJXZGtU?=
 =?utf-8?B?Sld1WDJ3TWFxVmlIdFoyOTBBTlkvTVVDUWxwYmprNkNBaC9ubDV3aHpoSXhO?=
 =?utf-8?B?UlFKQmFSZU44VzV2azNjNDR5Y05YcStkOGUzZDFaM2RvY3IydHUrcEMvdXZv?=
 =?utf-8?B?RC9VeEdqUWRHYlNESTFHRVBNTGhITHVpQURXd1VncTI2M2R2YzgxV0lwOWl3?=
 =?utf-8?B?OC85cWo0RVB6UUxtMWd0TEVjQmU1LzBQMFNhQ0k0TnFqdDVrVVFDeWlHd0tv?=
 =?utf-8?B?UTBzOGpFdUgwb0YzWTVFN21kbTdBVzZUU2g5TFM2MmlCWWc0QkFNY0RobHh6?=
 =?utf-8?B?SEljMnR2YTNBYXN5WjBvSmIzNWlDOGNzTFZXZllObGtLb1VBeWdVOXQvUUhX?=
 =?utf-8?B?b1E0eUxXbWszY1p3WmRvU1JHb1BtbUpyK2FjOHAwMVZ4WW1LMHFBYTdLa1Bj?=
 =?utf-8?B?TC9nZkI2OWtLYWcvMlhzYkRDbnE1UUJDTkQwbzR0MWpES0k4Z3FHMDB6Tjhj?=
 =?utf-8?B?c25JYjZSNllBaSt3Q1ZITjZxNVBjNXFtV05wNysrZkJRaGQ1L1NoSGV6bWxJ?=
 =?utf-8?B?N0xpV3VxTmc3eURkaVpKZXR3UlZEakxPQ3pmbDJsbHBsV1ZpZDdGZTRNR3No?=
 =?utf-8?B?eGxpN2paWDNRKzVWL3NPa2NJNmRXNU85TWk2Mzg0akN0cEhESkd2RWZhblJa?=
 =?utf-8?B?TzAvVFFKVmlPaUpnNy9yMWtNd3M3SFk2SU5sNDkwN2RtbWRzbFh1bU9UVWZz?=
 =?utf-8?B?UUhyTkxWYklIT0pIVVgyRDJGWS9yUC9QSmVYbHFVaWtWbXR0UXdmQWZBNkdX?=
 =?utf-8?B?K3lCbHR3K25YUWJlL1VnZ3FJaU1ublF3Y1d3R0VQalhBclJMcWwrTXUrTW44?=
 =?utf-8?B?RndsRjJPMk5mMkNjMlY0cnBrQWJhVzJGKy9jS00vamdTckNvM2NnRkZZbE5V?=
 =?utf-8?B?Z0JUbjJmWDJUVzBtdFR6UXNiUVNCUUhEakRWNU8wb21ZZWdFWmN3alhHWi96?=
 =?utf-8?B?UklDTkZuZUdhaEM4dzVHMER6cmoyVkRPSDRFbnV6RWVvMG8wT3drVUUxTHhL?=
 =?utf-8?B?VzcxUVRSOERxRnREelhzK3lsSUVxd2Q2WjJNeUlDTEUyemdpc1BFM2pGa1lJ?=
 =?utf-8?B?UW1pSmUrYTJtQmJQS3A5UndFa1FNUTM5WW1oNmlNMjlKS1dWQmdENU9vVXR5?=
 =?utf-8?B?K09pa1RYN25kV3cxWXhVTjhsOGF0Sjh1THRObDhONlR3Mi9xV3BWQmp6ZUNX?=
 =?utf-8?B?YUt3YnFaZDNaVWtJUVpEOFZLTy9vajdlcG00TjJjRjR2YjhLU0NFdDlpbXNn?=
 =?utf-8?B?L0orVVByUG5lSFovK3g5MTRUQzI1SFFrVW9CcWdUcTk3QmRBV2d1TU9BZWF6?=
 =?utf-8?Q?UCiMtvqvG4j+rkTh7b?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0536f8d9-82b8-494d-71e5-08df459ddbf7
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 18:00:41.6588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A0EAxEVurqbQybUeqslR9EeWCH+NJPa4sTOyjZC7Z50MzjB/QUmnmFDN2ywXHcFE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9230


On Wed, 28 Oct 2026 14:55:32 +0200, Avi Weiss wrote:
> fwctl: pds: report device information length

Applied, thanks!

[1/1] fwctl: pds: report device information length
      https://git.kernel.org/pub/scm/linux/kernel/git/fwctl/fwctl.git/commit/?id=3ed98027846bf3fdb2053c626d70cde8e33ae9dd

Best regards,
-- 
Jason

