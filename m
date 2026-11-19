Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795102712;
	b=CH8YLvS5VRhl+bxlPXALvHK3Samb483IuJS+E+0PefingI9G5nmD8w0z55q/I2o1JKu8
	 TkhVumwLwomytNTKAy5HEOv6kOzVq8lYsJExsEj/0a6Ric6ZilzJZh1IP3womVaK9Cd6U
	 ftfefdxSOJIi5K9qQOdVqNRhuGBJU0awI2EnfyXuci7bdbpyqqJML89f32ZajLXhRAOQM
	 L5Zc2pN5d3zcv2JzJx7MveBDEm3UJvx3E3n22g+0EghC1M6U+CtQEvWbpt572NOB21SJ8
	 8xh4R50K8Q1hx+ezAPFmw5a56gyQe/Ro7ZrpWWjeybNaVLeeiucQEL/I5GP1G7JQmaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102712;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:X-Mailer:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-MS-Reactions:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=Zqb74m3/LZ2ZKOg6MEtlzkse5bXzAKaTIpLs97gs6SQ=;
	b=dQ/xmlosbamVBARq+4at9EFcXhoTWxo8Ljk1qMmaS404rbFY5Xo4uQCEsYdzekqXTL5G
	 Snh4+jQmHfBUFH6edVU+/7NdM42oR9M97TDtVuEWsvOySSDyvLvcT3ZNaaUkdbX5hSOqZ
	 RkZAlP/irzF1UgNsCb+A5p7vHqvdb87qskY0bKmOkBUclERCyEU7TZAu/2fZeccgiyq/0
	 jImSOw42+XtbQBiiViaAbVACOziurGuk1cpoAokQ1gMvT5+SPKUe2Q/OXjvekWbJx7UI2
	 txV2ioWELg0WY+jFKj/WROAkoIYfg40qKaD5B5AjaWnIBYVcrnP1LkYODfO6H+16yYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=a23KUpwQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.37
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012037.outbound.protection.outlook.com [40.107.209.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD0E606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BD0E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=a23KUpwQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hi4bZNtf5fvE/IkaxfjCaTl1DbJtitsjjHAxOm2sJdM1loQ8sdXFqyiSKn0P87CIZyUx5LEZ6+3KPcV5uKXlvGah0ZFLocUilzQWYHEgLWAXLpw0PJvHOpylqHjgBgGRr2sS8fSHMf8ub02QtlicQFQCv3TwpRxih4g+kQFPfhP77B7ZMhoImdweNyYZc9GUnPeLeYpbjTsGCl9LxJcn5ZrCT73ktcKddrw7E5K7C2JjGEDhhRX8qKSMdaUehcJDZF4pBQXjKKHgsRdNmRzqn0OOXHgGhiTWt31OixXBSRlsVSLAG4uYfcnuXmKmC410e6z/YjR9VEvnJB+DB79xgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zqb74m3/LZ2ZKOg6MEtlzkse5bXzAKaTIpLs97gs6SQ=;
 b=T8up2xHqjr3uwObyZw8k3jujEOXzAgf0o6/QgA8yUjNFMnPoor0E0AYMGx5EBpwuflqSQ98qs7ujvxm6ynhiDk9pHKH1+z6cKoompZo9Pj2DanIqqDyGRyHFLEGazK5T267FBeYDi1E99SFP7GuRrxOIrJZE7N/+oPKyzVm7hue7N4Mi92uv+ZHffq1ztz9yCUkLMn3OCjblz4uoXtcGd+oDa8rzaB0Im/mLiZonYp+oDW2vsGZJqPJyVn1g2LP49cv6ZgOQeUJvWjf1DdmLBqccxIPVBemFFUttB4U4BIOWXxx+UqS81f/oN4+27In8qljlqimjLvxMIcN4xFSZZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zqb74m3/LZ2ZKOg6MEtlzkse5bXzAKaTIpLs97gs6SQ=;
 b=a23KUpwQMico0TkNmUR7wUY3BVR5TO8YKXtErawEZ3TIlBPHwZ7TNVQAO1EEmrEcmVOSk6u2Wb6yFuswfTppQkVLLQ6m1LbxKRm5FfSjJ99bUqTK9U+Z0ZhGvP/1muvgc0BeAuI6IJjrLIJ4jmhwbu0FNTMHXG2NU4oZDewti2PApdHeSVWD0lkSmvtIj+sSSFuWcndTgcskr5lbplo4mNdtxMVhlrdeSgQLW9shflU3MQEDZjo2V9M9BXXL+snUU6bIp09sFC0uSgyszdjFoOPGJ0mIguI/dFyQEZNaspgetEbWSm0vaH6mkKNfXaTqdPR/hHyqwFlCLKilpKeSgg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DM6PR12MB4153.namprd12.prod.outlook.com (2603:10b6:5:212::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Thu, 19 Nov
 2026 15:38:10 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0615.009; Thu, 19 Nov 2026
 15:38:10 +0000
From: Zi Yan <ziy@nvidia.com>
To: Nilay Vaish <nilayvaish@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Balbir Singh <balbirs@nvidia.com>, David Hildenbrand <david@kernel.org>,
 Zenghui Yu <zenghui.yu@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Alistair Popple <apopple@nvidia.com>,
 Suren Baghdasaryan <surenb@google.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] lib/test_hmm: fix alloc tag leak when splitting
 device-private folios
Date: Thu, 19 Nov 2026 10:38:08 -0500
X-Mailer: MailMate (3.0r7038)
Message-ID: <72E0E689-0FA4-4DB9-B978-711EF6DEC490@nvidia.com>
In-Reply-To: <1CB074CC-E9E3-436D-8D04-8C203C825E82@nvidia.com>
References: <20261118230044.683221-1-nilayvaish@google.com>
 <1CB074CC-E9E3-436D-8D04-8C203C825E82@nvidia.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-MS-Reactions: disallow
X-ClientProxiedBy: MN0P222CA0022.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::29) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DM6PR12MB4153:EE_
X-MS-Office365-Filtering-Correlation-Id: 164c43f4-9aa4-427d-2678-08df46531d94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|22082099003|6133799003|261009223027099003|261026121527099003|4143699003|5023799004|56012099006|11063799006|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261021123027099003|261022075727099003|261022105027099003|261102130727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	6CCF4YuWLwBHaKqqeBuqSv4D4Nz6DKNcWY/an0LLzxfvmpHFHoNJpP2TH3h0Y3yzaku2Ljo+0zEU5QctyuRViGxebyV9fR5oXqtlzrDNgOdLRAP4kqlhBkqrRUJCh6v6OIjWzBDOAAs1tCPRjaPtWSP8UOgBEL9sTHKTqDyoyySz3CyzS5LR1ngWnBOB5xpTh83doflGpLkC0gbyQRNPtgnUOGA3aKV1Wc2cwAyH1Xjh9EJEMtcQvT/EIKOEiqaEyhYRlSJDzh9/KHbm3cL5BWaw9BLet9P+GnX738mE2IuS26ZZ0krKxfUZy+JRdpsDmrYCTVi7hI9jfnNDKp+70vIl54vOear65G+ft6xxRbCSKkBb9UJ77oDgTHAGGrSLt2JzLz048SEx0lmy184OUm1n+V9g6bOYHWWblJucgUMmYVCyiSIQ2TLJOLNguo4454kCAZBXL948NpAt4cFeyjDJFCdJdsjVJaajzSLOQcdJk/3aIR6Wrue/DbdEVGqknlfkO5169k6NlIZ2Ybt9nIRfpthCv+620W9Uo89MRGX14SPsLc1huUwNuzMn6nursjPzACcq9SrY+JBGBxG3J2C7IWZZLaBHIoTvU4xUGZ8+oeutYtDwB2oMniKudW9eCQEPf1isg3kIni3hREphfaEqOQsp9wsV6prJLcqGQgo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(261009223027099003)(261026121527099003)(4143699003)(5023799004)(56012099006)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(261102130727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P62/mllensIWMS1kXymm3SR7xITi9JUHFuRErFPlEayx3KvoGsjA9WyOdCN6?=
 =?us-ascii?Q?Ol6PxJ+id7YXJ5zseZRVDJ2+JIDBryJdtHdzWCGrat5gh/PuftiQNUYacgqk?=
 =?us-ascii?Q?6tP7vjzLyXj8i8p5uKirh1or57gYjD9RpxAYRYwDflV6G9RHbrQBTF51jNCR?=
 =?us-ascii?Q?HfO8BV60OtdS9i1+RvIKFAT0U7MEScbmOzBEiz+YEtMUHJUu0us9DQU40AWB?=
 =?us-ascii?Q?9oHFfmMMjDwYgClqH9G9j9LYzAyfLYaKKEiGYaa+cbhl7E9Yi5ZahNVqzu8b?=
 =?us-ascii?Q?nBZAR5pxnB+a0IQUad7lD7+s/850z0eZypVQjgYzXbplJNatG4oTadZREvK+?=
 =?us-ascii?Q?g3njX1uku3WGQMrnQOsRbzmMedid8i1Wp2Ge3l6DB7o2YO4E8pDlGvaILwcY?=
 =?us-ascii?Q?DMbbJXIOEeLGx9l/TKnDwjhxdHI+Lyi+QnPUAUGKJ1WUU9OxJMAMALmOrY6T?=
 =?us-ascii?Q?my3oAtua+xAyNGxrX21IIjovtAWQ/sXvw9Kh0urxkux4yHIxtKjcLa35jaZL?=
 =?us-ascii?Q?Sl1LxiUgTycN2EqraNSje8ezShDGvZzkYEQd/H2WY+7jqkchbPzWJg1OdZoA?=
 =?us-ascii?Q?R9WjtvcaVWjugfmOXUt/W/ildik49S/T8YDhU4v59XHC77oxA1Ln+4XEQzpi?=
 =?us-ascii?Q?xHWDIMhNwRBFXjDuRcNa+dLPdlPXn7/+99/MQoNQ1M+CZ9+frh/+1MUT/c4/?=
 =?us-ascii?Q?vcqdE0L1X38qBrC1hprSSpzrMNKNVKJWBImT4mrHXOkAPRLXwaOLGeFkmZRn?=
 =?us-ascii?Q?L7yEPMIXEcYNST5xR+nxeAI3bXFk25sl4L7RzTBryEDXZrLS72sJhz23DVsJ?=
 =?us-ascii?Q?OZzmpxQVmmSo+08pZO0yzMgM13uLrbjDTo5TzcnzdgxpFw/JjwGBAkHPbziP?=
 =?us-ascii?Q?QI187VVHa/2KtrmM4RXpvRpyA03tOA36/H+MeP0cO/ZObge6KYJKQ2eXpap7?=
 =?us-ascii?Q?kfLRAwLRIUtFf/UTaH0DlhUdq3JqdZ79+QbxuW+UdICYipRaUNWuTuVICxgF?=
 =?us-ascii?Q?Yk8PJdTxiIKIDl+uK1kdI3vLLXZVH8RBEoBW4qa6B1kvjgJJOJ2McWxUFwk0?=
 =?us-ascii?Q?QJQ54nxMBqaxDwa4F6Jyl1RYrN9XREIxQJAIDxyJ1XlE5UquWuuPlOVV3x7P?=
 =?us-ascii?Q?ZPE9nmr5F8kUb7L5VwGBHN/rzspLfZTNB62hlgv7EE4xB65hYYCZUx5aEaVE?=
 =?us-ascii?Q?Q7zMRLtAZicFG9lThAtFS70Jo9DmwymHcPMrzKLdeQ/Ahv3WQQsrMQJju0EG?=
 =?us-ascii?Q?/3Z0tuQce30o34fgbr9ySC+/9hodZu6Au55uTIxcwugac051iTtRCM7F/rk2?=
 =?us-ascii?Q?IlgqV0B8Nes0YfyuU0sMF6sUrDAEpUEAIWmEQwJhLST6sybKidZVWG5l0JPx?=
 =?us-ascii?Q?1poJdR7UPvx0puMKfr9Lj+3qj1AZE5W0a54ZZb0TmAv/rW095zUOTW9pZlVg?=
 =?us-ascii?Q?RnuI0pQuiVCf9Jh3aE/l2pI2S94tRzWugmKuU4B9y0OldNnO3hYvGFHsxjHE?=
 =?us-ascii?Q?RduFxoFr9Tg3U+YHlkPL0pPDUihPEVDQeCoPAEZiYh58+PNsUYm/OEpur/Pc?=
 =?us-ascii?Q?XYc4rxVmbKkFP5QwHK1r9GyyawFQLnL2oobvByoCPRiHsdrRpO6cbN/Ggako?=
 =?us-ascii?Q?v236HUndE+KG1wzMehAfJSwqx4Lj9ujYvEAh4RVDtf0mBv/kIWVo+gxqWO+4?=
 =?us-ascii?Q?JLlL3SkG1lr+xINiqmFhGgf4/T0VhM2AxqnI6KlbT0Hiqg99?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 164c43f4-9aa4-427d-2678-08df46531d94
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 15:38:10.4412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bhng1ExUCqSouc9qTaUPBbkcPuyjq9ZYJ/pWynw5VGqNEB8EhzoX70l0Ha5K1F0A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4153

On 18 Nov 2026, at 18:24, Zi Yan wrote:

> On 18 Nov 2026, at 18:00, Nilay Vaish wrote:
>
>> For device-private memory, test_hmm backs each fake device folio with
>> real system RAM of the same order, allocated with folio_alloc() in
>> dmirror_devmem_alloc_page().
>>
>> When the core MM splits a large device-private folio, the driver's
>> ->folio_split() callback, dmirror_devmem_folio_split(), has to split
>> the backing memory as well. It does that by hand: clear_compound_head(=
)
>> on the tail pages, folio_reset_order() on the head page, and
>> folio_set_count() on each of them. dmirror_devmem_free() then frees
>> every backing page as an order-0 page.
>>
>> This open-coded split does not split the allocator's metadata. The
>> allocation tag and the page_owner record still describe one high-order=

>> allocation, and PG_head stays set on the head page. When the pages are=

>> freed one by one, the tag is debited for only one page when the head i=
s
>> freed, and the tail pages carry no tag at all. With
>> CONFIG_MEM_ALLOC_PROFILING, running the HMM selftests and unloading th=
e
>> module reports the leak:
>>
>>   lib/test_hmm.c:808 module test_hmm func:dmirror_devmem_alloc_page ha=
s 16744448 allocated at module unload
>>
>> and with CONFIG_MEM_ALLOC_PROFILING_DEBUG freeing a tail page triggers=
:
>>
>>   alloc_tag was not set
>>   WARNING: ./include/linux/alloc_tag.h:164 at ___free_pages+0x2a0/0x2d=
0
>>
>> The backing memory is a private buffer of the test driver and nothing
>> requires it to be a folio. Allocate it with alloc_pages() instead and
>> split it right away with split_page(), which splits the allocation tag=
,
>> page_owner and memcg state and is already exported to modules. It is
>> still allocated as one high-order block rather than as individual
>> order-0 pages because the driver finds the backing page of the Nth pag=
e
>> of a device folio by offsetting from the first backing page, so the
>> backing pages have to be physically contiguous. Every backing page is
>> then an independent order-0 page for its whole lifetime, so
>> dmirror_devmem_folio_split() only has to point the new device folio at=

>> its backing page, and dmirror_devmem_free() frees the backing pages on=
e
>> at a time.
>>
>> As the backing pages no longer form a folio, take the order from the
>> device folio rather than from the backing page, and index and copy the=

>> backing pages individually instead of using folio_page() and
>> folio_copy().
>>
>> With this patch the device-private HMM selftests pass and the module
>> unloads without the messages above.
>>
>> Fixes: 56ef39899643 ("mm/memremap: add driver callback support for fol=
io splitting")
>> Reported-by: Zenghui Yu <zenghui.yu@linux.dev>
>> Closes: https://lore.kernel.org/linux-mm/be9a8bae-9223-4966-bba9-2cbe3=
9c8f4de@linux.dev/
>> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
>> Link: https://lore.kernel.org/linux-mm/8ef6e92d-4cb3-444e-857e-fdbf88c=
035ea@kernel.org/
>> Signed-off-by: Nilay Vaish <nilayvaish@google.com>
>> ---
>>  lib/test_hmm.c | 41 +++++++++++++++++------------------------
>>  1 file changed, 17 insertions(+), 24 deletions(-)
>
>
>>
>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>> index b409c42bfe6f..371ead009f8a 100644
>> --- a/lib/test_hmm.c
>> +++ b/lib/test_hmm.c
>> @@ -201,6 +201,7 @@ static void dmirror_device_evict_chunk(struct dmir=
ror_chunk *chunk)
>>  	migrate_device_range(src_pfns, start_pfn, npages);
>>  	for (i =3D 0; i < npages; i++) {
>>  		struct page *dpage, *spage;
>> +		unsigned int j;
>>
>>  		spage =3D migrate_pfn_to_page(src_pfns[i]);
>>  		if (!spage || !(src_pfns[i] & MIGRATE_PFN_MIGRATE))
>> @@ -227,7 +228,9 @@ static void dmirror_device_evict_chunk(struct dmir=
ror_chunk *chunk)
>>  			dst_pfns[i] |=3D MIGRATE_PFN_WRITE;
>>  		if (order)
>>  			dst_pfns[i] |=3D MIGRATE_PFN_COMPOUND;
>> -		folio_copy(page_folio(dpage), page_folio(spage));
>> +		for (j =3D 0; j < (1U << order); j++)
>> +			copy_highpage(pfn_to_page(page_to_pfn(dpage) + j),
>> +				      pfn_to_page(page_to_pfn(spage) + j));
>
> struct page should be contiguous if their PFNs are contiguous.
> There is no need to do this conversion, right?
>
> In addition, dpage, based on the comment before BACKING_PAGE,
> is device memory, so it should also be allocated using alloc_pages()
> like rpage. Am I getting it wrong?

I misread the comment, dpage is destination page. It can be ZONE_DEVICE
page or system memory depending on functions.


Best Regards,
Yan, Zi
