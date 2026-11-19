Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795090270;
	b=Hd2OHj97ofVkCvZ/EHhyVGXC2Uj9suOPEbg9cMiKvHXEoc/xsTiEz9XheOzcloC6wPyC
	 CscT9SOU62gAtJfg5hZz51/zcGmLB3ogdLnX9VISpgbVpA+iqYHtfFjTznWzBSt+3SHAx
	 c20IMSoPh0FMwwKnUgMPFKiD1YD/Y1jjKb42eCbbkp1+S4QugPZ/9QCzYnUkHn7fUdzB6
	 7TeYnRNkzTkG7qmQ0bDtV3ejdUcWBx5hdWPu6yi0dVC6kPEB7GwGclI9Lm38J8gmPXUGQ
	 cWPatk4uJBWwWiRE6N/SgZY+dpe+nqE8wrImtZTnZlq39lXjYb4vyLOnJaASKMuG7dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090270;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
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
	bh=UyIvIqAejQlQEW90ieZXPzm+/wzkfYQOe43O+uTLzTg=;
	b=0uborE+W/FXQ1/5G2bp6341K1qWNWJFv3K1/DxYZ5JUBxdG4MWxAU/Ng8nwLJ7sPSWYz
	 jd3tWNvOl3oOrX9AwlpGrsDkCkzxdMpV/iUGz5+kqogUTcbWtX6lMoomJRP+OFPYX8owv
	 0maGERzhl1sheyHgLF0mOkCxAEIEb1qV8E/VsubQuDT19NTyKksIk4wVITXZZL1D5F0Ir
	 TPFOVV56in0RlO3W9ORL/FcqhyxrdxHOWZRjiHlzhF+0UXzbT4CXY4ja5bJwY/nVh6uZ6
	 XvUWxwXMEijsaYeGEqFszteP1atrCVpgiuTuPpBmMFGtT1W2qwCQTi0tLfMiO/DlyPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uVOogPO+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.59
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013059.outbound.protection.outlook.com [40.107.201.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B81606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26B81606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=uVOogPO+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqBMOjTqYoeUHcYtM+gE3LQ8zkoTJVakQZwn3pU0k1xgkJIhiHjndyUDOoNZuFQyYgtRDj0OV/NA9gHafFobLWlge4Ul9X9x5UCqGd7prTxHHJNm0msDdaAaW8vjYFHnGYAbS38oNnp7EZKrcdIPqONxBXYOWNCXwAsum3gEUfGY9sWwvD4Q88LmMiZ2ze89EhEi9iAMtY1CwYYbDRBzIJWN65xAxqDLXMIUBHfibE3sp7JSboTKchlTDX8iLZy2YyOpzMLdF+1OPUIAcwiivNUyHt2bxlGcNaNSo1/4ta1YS9wyCU2qR/CA6/kSv0AxjW9vDW7WKHjmp2M+yC9+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UyIvIqAejQlQEW90ieZXPzm+/wzkfYQOe43O+uTLzTg=;
 b=O3dzaUxYwCA9E15TQhzCVmQoSMjd3VB+l5ntrYlvq5GyGEYyvB7Q2Boee9XqPgJApaGQQ0p8cmsJe8vnYTx55A4NUVYyvrsfBFA8T8X6fJhSN+aUeBv/+n5CvP/wmzsc/HOcB479F1NAMl+sDPpZXpHBgi+0Q5znF0eWVysJ9ff8KxCLhXFd2fOEKgqO+y3rRvMQMwgEZZbLsd7lG8WPc5wf02a6cwZU8eAfGne+H1/2uwaW62qpV2S3V9clBEMl3wnjj4vRRfoagYnDzw1w4DWRFDpCbLR4aYBcDHag9Zm02nOt9RBBQZzGns0kAhfasnfceWNYE773J2toi1JoRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UyIvIqAejQlQEW90ieZXPzm+/wzkfYQOe43O+uTLzTg=;
 b=uVOogPO+EkdZ5+WW6vNmAldKIGI5RudjQGgZn+xl5hfRU4sYomsu4EtUIkNF/J/Vd02Rb3t2F6IPAGoOy+h/lhDF1pfBPpnlhpnlE9cY/Od+S7co17n1JQi6KkzMHeIfxoYgZmJQCV2MXq17BdwiZ5CmheMfU3XY7dmTaa1H0i0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7771.namprd12.prod.outlook.com (2603:10b6:8:138::6) by
 CH3PR12MB7522.namprd12.prod.outlook.com (2603:10b6:610:142::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 12:11:06 +0000
Received: from DS0PR12MB7771.namprd12.prod.outlook.com
 ([fe80::9a3e:791f:33b6:3d8c]) by DS0PR12MB7771.namprd12.prod.outlook.com
 ([fe80::9a3e:791f:33b6:3d8c%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 12:11:06 +0000
Message-ID: <f56b0cc5-7529-4481-9f17-f940283d62c7@amd.com>
Date: Thu, 19 Nov 2026 13:11:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/userfaultfd: reject DAX mappings
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Peter Xu <peterx@redhat.com>, Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Chris Mason <mason@kernel.org>, Jingyi Sun <1045704958@qq.com>
References: <20261118-dax_uffd-v1-1-d776cca1ae17@kernel.org>
Content-Language: en-US
From: "Gupta, Pankaj" <pankaj.gupta@amd.com>
In-Reply-To: <20261118-dax_uffd-v1-1-d776cca1ae17@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0339.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::13) To DS0PR12MB7771.namprd12.prod.outlook.com
 (2603:10b6:8:138::6)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB7771:EE_|CH3PR12MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: e02e1bb0-d592-435e-b8b6-08df46363035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|261022105027099003|261021121427099003|260925021311599003|260925021911599003|260925022911599003|56012099006|261026121527099003|11063799006|261028144727099003|261009223027099003|10067099003|261102123227099003|261026140227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/9TM57Zam7VMxLw9BkkgKbJzCoeWenMwgZkrP8s0gC2PumrAPaYEhvpW5wbJdgeLsmbSg5r1M8ElR4IHaNJ2XLDWTkRpynYmMwBkEVow5uvIkJ8KuABnbaISBVEac5XOQDC1etjQjMj26F9e72XM+TXcVOrX6jfUySeenhr5e8j2eieUUL4U3HmxKdWWlNoiXerkqD8c+XX0DzMDxX2ysL0AnmAiFNrzdT8PPiBCqehLK0o83yfTGrnmcdCEjj+IkqNAM2BKxaDYm5A5QqU/2DAy5S3X90VeJxSX+SafKyY1BEb1lrWRHmsen4ikepMr63lHPF8s8Ttb6iqAoVasJJDFAc00hkXMj4seNUAejmPziA2JrJaL3Z88n5uFrRVS6WKE7eEHtFIepNMtAjbtw3cK1VTYM9zHzcvnRzkvn1RvY8SXtn6z9fhoRQQ42SIVH/QWN3EsGwgX0dgwBk7mn7eFgdnVstcBlEci+gFE1Lo1p1YZ0PWOux7IX/pL+G9RacSkc9iI+Qq2TJg7Cd6WSiBhKZ+QmnOUHGVKzhVP02/aEzfowFGSVq/mEa6rPPx4xAKRYL++a5Tii+IjgMSssIgdotk/DK/sKOjubluJrvJ5YA6kPT4bcQlsxzl3cPJ5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7771.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(261022105027099003)(261021121427099003)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(261026121527099003)(11063799006)(261028144727099003)(261009223027099003)(10067099003)(261102123227099003)(261026140227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWdKKzV3RTQyKzQyM1ZUUEpMbC8yU3FIRFFUbEluU3lZSTlITkNYblQ2ZHU4?=
 =?utf-8?B?YkpWb2wxRm0xUHRIM3U5OXVUbXQzVzY1d01XR0JTRWpwMVZyRnBlRFV5WWFs?=
 =?utf-8?B?MW5aL1U0K3BXcitYZUN0WWVaQVY1cXpaOUFXektlYXFQanlmbStHZnNGTzR0?=
 =?utf-8?B?R29rY3lER241OHZUdlNVbEp6aDZIeXhZZUZCeVc2ZDNydElpT0VDU3MzYlBQ?=
 =?utf-8?B?OHRlM2w1WW9JVmJVMDFXNFhZSC9TMmN2aTRXN2xHZGdSdkUzZFRzQXB4K3Rp?=
 =?utf-8?B?K0NBZUgzZ0cxWEpvSVVOZFFsSzQ5Z0l0QmFnNGJ0N1VCVjFqNjQ4dG5SUGdB?=
 =?utf-8?B?SHZVU0FXQ25MTGkwa0VmZ2ZicitNOTlBOUY0UUJPNUxmUVhQQWZuYmNwZDEy?=
 =?utf-8?B?Mm1hM2lWTzZ4UHN3bmZzamRHZ0M0TlI2d1k5VkFDenNyM0xjUUVxT0Y1N0tE?=
 =?utf-8?B?bktCVVpMS1l6RElQVjFUQjhtY0JMWlNycEhQNUtuWWQzc1l6WEFLYVhsbWhR?=
 =?utf-8?B?M3pPVGdSektyN1gwOGNYVmprQ0RNeHpxaXErWDJ2NkdKZTdteVFyaHpEVlNx?=
 =?utf-8?B?aUZrL2ZBOGIzcGZnQjRsanVlUkpoeXZxT0gvWmx0Y2k4T0R3OUdGM1RKUzh5?=
 =?utf-8?B?Zm01RVlHaUlqaFBBUDlGcE5FdU15YU0rNkYyYU1mYWdKeDh6OVBWTVhtSW5r?=
 =?utf-8?B?M2IrN1o2dDNDL2sxb0VoNU5vOEN1Sjlsd1VEOXVXRGF3OW1lVXM3STdiejh6?=
 =?utf-8?B?eS9BVWFzUlloS3lTdWFUWitCalF3T2VSNTFSZGp6WDBzSTY0QWQvQ2Ftd3lo?=
 =?utf-8?B?eldodGp4N3BmbnNJWHJnalRTQW5HenZOY3U2WWw0c1k5Ky9PUkxIWjNBVFdo?=
 =?utf-8?B?aGVoUS9WeitsTmg4OHo3SUNaTldxcVpZdzFNTThYNjY5OXIvUlNGczRpdUho?=
 =?utf-8?B?TllFN1NHSVNhMW9VdVJQbTM0TVpwSm5wamVpbzNJOUFlMVJ5c0hKYWl4Lzhv?=
 =?utf-8?B?ZDNFM0lUR0F1NE93NTFFTmhvTUFOeFU3NVJ4Y1VUcUJLOE0vMThTcWt4Qy95?=
 =?utf-8?B?NTBmZ0NuelF2Q1laWUhZZDh4UmVVK2tMdy9mbFp1MlVsamxJeHpCSEJiV0Fk?=
 =?utf-8?B?bGVHNFB0Nk9EemFqZzFQc2d1Yzd4L3AvV0hPRGJpck1pYzYxc21JNXhrbVpU?=
 =?utf-8?B?TTZRcGRYVFRhcFlaRDJNK0p2NEFISzlENHQvU1E5amN2QkNIMm5ya3dEN09O?=
 =?utf-8?B?K0I3WE04dCs1aU9jaC9ZNU0vbURGUWhEbnE1RE9yQzk0Z2RzNktRYVNFNVZZ?=
 =?utf-8?B?M3BuY1dQVjZ4MVdoaW5IL3orYnNIbitFazV6bEF4TTIwaXZ4d1VvK29kUG9X?=
 =?utf-8?B?aHhMZEVUY2VRUXQ4MXBtQVFvUG85WUtTbGxxVFEzODl5cmZCS3Vwc1RGWVNx?=
 =?utf-8?B?RHI3ejVSNXArZ2xlUVhhTFlVL0tSd2ZrcjRvQ0hDVzJQWWJyU0YwbWUvTVNo?=
 =?utf-8?B?L1M2cnlyckhvbHI1eFllTURMeVgwWEZVbVhGSU1Kck9ZQXZrY2ZWd3JTLzdS?=
 =?utf-8?B?UWg3MTBha1lodFVZUjRXNXJqd3JzYjIyTEFaWHA1aFFyUDlnWm8zZHpCSDYz?=
 =?utf-8?B?dk91dGVhOWZYUnBwNW02bUo3ZW83UVZ0NmU0dUtiREJMa01CYXloNDcrQnVX?=
 =?utf-8?B?NHVpdDBSbWN0NW1sVVVMWVlaWUFDVHh6NUFlaHFzeHdoOWgvdVNVUEZmMWxK?=
 =?utf-8?B?eTRacVRWbUFhRThwZTdKNjJjdUNWNWp6NHNJczhhZEQ5V3c2R1QrODg0VlZx?=
 =?utf-8?B?RFJIMVJhODQ3VytZL0tML1dYWElHTWVmdXpPMWlrQlFEZ0hYOS9ZVTlYOTFF?=
 =?utf-8?B?R25QZUdBdUNKcWdlaFh3Q0Zkc0h2eTg3YzVWMFBFT3Nwcmx0bDRSUFhEWGo4?=
 =?utf-8?B?Tkt2SGdNVUdqOWFHWUNuVEZJSE1OdS83ZUNGZzFJeDJJa1FrSlFEL05HamI1?=
 =?utf-8?B?QXI1WTRxU01aYXBWVGJDTjNXSDhPVHNWZEtyeW54dGwwMGNpMFUxSldPMXFs?=
 =?utf-8?B?R1JtS0JMN1Y1YVpZTHIzSEZINSt3cStUWFpNaXhCS3IrRGJtbDFtNmtMNEc2?=
 =?utf-8?B?SlYyYUhKeFc5dktsbFlkREl1L3lyZWxtMFZob1MyN1R2VDM3aDVoNjFPSmcv?=
 =?utf-8?B?MEtxcEM5Q2txWEdpd3lWRGpsV2o0c043dlh4cDNtU1ZzdnhzSzd0RjFLb05E?=
 =?utf-8?B?UVN0WG1KYmIvMVhubm1sRVRBY0ttRWtjNFpsZ2RZbjAzajduUVI1bDl6RThF?=
 =?utf-8?Q?4FYAqqU+UevsNodjVc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e02e1bb0-d592-435e-b8b6-08df46363035
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7771.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 12:11:06.2789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nekk73IBbYiAAQmLodz1lCLwKYHa6tpXqM2WNB15qhIkNPvJdFXBi6889o53nmCn7PmOWUkQ5ZsDexCcxUVHfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7522


> UFFD_FEATURE_WP_ASYNC made DAX mappings eligible for userfaultfd
> write-protection, but the DAX fault paths have never fully supported it.
>
> DAX faults use vmf_insert_mixed() and vmf_insert_mixed_mkwrite(), which

Should we use vmf_insert_page_mkwrite instead?

> treats any non-empty PTE, including uffd-wp markers, as an existing mapping.
> A read fault on an uffd-wp marker therefore returns VM_FAULT_NOPAGE without
> replacing the marker, causing the fault to repeat indefinitely.
>
> PAGEMAP_SCAN can also write-protect a DAX PMD, but the huge DAX write-fault
> path can make it writable without clearing its uffd-wp bit, breaking async
> write tracking.
>
> Device DAX mappings requiring huge-page alignment and cannot serve PTE
> faults after UFFDIO_WRITEPROTECT has split their huge mappings.
>
> So let's just disallow DAX mappings in vma_can_userfault() entirely,
> making UFFDIO_REGISTER fail with EINVAL.
>
> Fixes: d61ea1cb0095 ("userfaultfd: UFFD_FEATURE_WP_ASYNC")
> Reported-by: Chris Mason <mason@kernel.org>
> Reported-by: Jingyi Sun <1045704958@qq.com>
> Closes: https://lore.kernel.org/all/tencent_1874C71D4177A1624528043E008DB1A5EF05@qq.com
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>

> ---
>   mm/userfaultfd.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index 169f681f9849b..6656233d5dcc7 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -2131,6 +2131,9 @@ static bool vma_can_userfault(struct vm_area_struct *vma, vm_flags_t vm_flags,
>   	/* Only mm-backed memory can have its faults handled by userspace. */
>   	if (!vma_is_mm_backed(vma))
>   		return false;
> +	/* DAX fault handlers do not support uffd-wp. */
> +	if (vma_is_dax(vma))
> +		return false;
>   	/* Core mm may discard droppable memory at any time. */
>   	if (vma_test_single_mask(vma, VMA_DROPPABLE))
>   		return false;
>
> ---
>
> base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
>
> change-id: 20261118-dax_uffd-0fb2c6d1c087
>
> --
>
> Cheers,
>
> David
>
>
