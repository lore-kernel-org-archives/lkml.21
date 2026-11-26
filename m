Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795686445;
	b=OJXQLqUaXoIyLIrtn/O0IvyAXqDwjax+ZwTN9UoBmw7BNSZPaNWkek5N8KBXuzY1Ulrp
	 QCMEMIjb+oLwb3/zNeMm4lna4ntJ3JtujBB92jzUQ9QSg/KjO0YbV6fxqsdsrLg4b4Viq
	 IOR/wudITMF2Irij47NDLArYxwXRp4ygURHqh3jaJMvykhfnbtiykjg0i8pS+R63TQ6Vz
	 qnS7weEgONetGqF9TuAgmfUspJBWyKpAcXMKO2abdyxPI3wU64FNVyEknyDQpcsA8f6p2
	 IvkZG2zf/mo0szSbo4l/uVFe89Kfmv+knQJBWfo3WlMrBBxjwfm5mlgF8rT9rmhgvFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686445;
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
	bh=ky9ofkePh4IJiZE3ot6txDaGySH57NxhR4MNlsnvGmM=;
	b=cwzaUwpQQEsJ75ZQ2qUBNXzDazFLmSGDQjgYHEvkBSL8gZ1aHvQeg2PJ4Zt4Kr1a+t7Q
	 BApEc9AIlEH7dJn4kv3r/KqeIeYjckbiJDFonN9HCdkEqQ/42S/LkMjD49oFxXDBQeD55
	 Wo1miuAxBlM8hKahOiyJMDHAjujF/UB6MVufnq/oY21roFqEp/i15S51AR3qf6PYWYGVB
	 IrXrOhKdCU3wlDlpjH6m+J54EBV0JytCDE1DCVTT8sY+KfEGFAHiKXx+sXfHfu5743djD
	 /SRpi3POcNVM2PL5C0VN0Dap8Ar9YnFKNHE8+Mnx/j0vWoQtPJC6YbfBFw0Nizm5EGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=p5ISgc2s;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.11
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011011.outbound.protection.outlook.com [52.101.57.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD751606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD751606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=p5ISgc2s
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bw/kC00w4LCFJQpMktIe5+Rd6tO5Az7a++xjPluQ0xFXIr71rdsd23TTkmlptEur0rx8IFElVHO08/+1VFU1G/FsRws8bGETybUg/T0SG03N3i2/W+cEMP+RQyzoxtmYX0EtEiLwst/UiCWiY9wQO2KkY4fgSx5eA0S1CCXf3w2GxJqR64sW+sxAgbfgEMOAd5l/XKaaWq4y6JZ1DkvGbBXna9/1IAT7hnHRTBeyIScD6rU8j0xwvbo3oNdExKuJrDZZQ2BEtA4FN31aM8wY3+gSKTcnu4PbjNEYYN/IYVRmjANFnllKX4T4wQK7WD9CApy/q1320sMGcbc5Lz0SoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ky9ofkePh4IJiZE3ot6txDaGySH57NxhR4MNlsnvGmM=;
 b=NT0keMS/iIeo6lr+7RyXi582/ErAAq8Lewa6aeT8QpYG5EZ/23xS5fRQcnUy7krkfekOZ32MHsWDZwiGRICrs5b/yVpdn1SYF5SIgj7WE2CDJjn9f7svxjB2/2IVEE5YgNEfUKps9NI1D81B4iyT+ztcmfIhzU+bLdzMiLiDbWBxRTbelM+RBilEmR/rmIP2hKWKqRy3//x02SmwZ3rQbcB2QALla56O4FBl+I6PJZQRE5Ys/jIv4gNpiblLo0Yq8iYCz49GxV1Evem453tOPG+Q00BszXjSCVJNO8bJ1xafn0NU/KbQs8N1zoSMpeeCLSaVnIRTz+JS7zPCaa98bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ky9ofkePh4IJiZE3ot6txDaGySH57NxhR4MNlsnvGmM=;
 b=p5ISgc2s/qUOrR8jeo5gHC+15oBOhUt0ZWk4p3Vb4+IPhRq/2nK6OhKbZ6Cy/FjOaOiii+DqSE0YNdhq8GNVAofLiJd8CuSpIsjNYQCmmVHz+tbKrl7D6vivW9GOSyQMEE3thXakIRspejemR2veZTEBH+YEtf+o/iU0ZO5vLsgpiA8J2ez7rpMXUzGS8QCWgHkaFZbQlFZJiHkGtUS4BNTX+vXnH4wMIKqz8MX17e5vPItBVEYnafn5w++eRNF9psH92Jo1HkcyZK6RDs5sFJk+xt5FAexTOLf3pZoyJnfP04DBUOGdltyOkt3Op0y/hXomN1okiL6upAxyfHKlnw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB9730.namprd12.prod.outlook.com (2603:10b6:610:253::9)
 by DM4PR12MB5889.namprd12.prod.outlook.com (2603:10b6:8:65::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 09:47:19 +0000
Received: from CH3PR12MB9730.namprd12.prod.outlook.com
 ([fe80::843d:c1f0:b2ed:4128]) by CH3PR12MB9730.namprd12.prod.outlook.com
 ([fe80::843d:c1f0:b2ed:4128%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 09:47:19 +0000
Date: Thu, 26 Nov 2026 20:47:14 +1100
From: Balbir Singh <balbirs@nvidia.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH] selftests/mm: move the HMM migration benchmark out of
 selftests
Message-ID: <awf_TiUylMTGCb_e@parvat>
References: <20261126025653.1344932-1-balbirs@nvidia.com>
 <fba23668-add0-4787-b027-bfba1f66e090@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fba23668-add0-4787-b027-bfba1f66e090@kernel.org>
X-ClientProxiedBy: ME3P282CA0077.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:f6::10) To CH3PR12MB9730.namprd12.prod.outlook.com
 (2603:10b6:610:253::9)
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB9730:EE_|DM4PR12MB5889:EE_
X-MS-Office365-Filtering-Correlation-Id: ab00f458-4a3c-4201-7d99-08df4ba24340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|4143699003|261022105027099003|261022075727099003|261102123227099003|261021121427099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	WpmX9EjEHokper8qW3CirBdgL5vKeme2jUXDTOwBq1ZeB7Xh0neoSdNsHLCxikp5kPUuJmPFhFT4Dsaj/vHaFS6i8T98fEQPJJp5qx/9rd6Mvp9iYu8XscDjJ90sO+sXIyu9m+NMzCNrTRiOnXREtBN+NgXnitHVHfIwoQEYFYwjMrx90S3ZX8eT89jT/8vEhZmAwHUt2zfeFkSFZ3ix4yrSwSiysy6dbAJSBNQUtgFtIyYoMPc9/3ZAfoJyw2KbAEMdhu8cYEq4bjq+S+g2hw5Cn2ttICqX3UgYmW88MT73vtmtUL6gWZtneabynhw/bqzH0VFNopR6EFHsJWwmJ0c1KEuZ7hfj/Jg/D5+3aNz6pWOwMSHxO3mmZ/TA9N/SWkAkLttH6E8eMm08pJUlR96IBelvqs6+mz80xu/0WCv8HJdye9dMlYDBtm1PaXc75IkuT2jPIupm6hFyDgQiQklbOqEK1vFbVpaOgjFSiVPaAa/sk0HrR2xIOwPlW/F+JXJ4arGGP1PHvVr4LJTkgaDYizcGAordNWC71TeacF0OHT0YdzJJxzrAjZ5lFQgme2TQswcNm5cXjylQSF76Z5cpNP/b8YWqFKHOCDdAjokc4tnB9op6T7ScjYKz8So9nryt4s+T/PbNgdvWpavekEozYLH6qSDxW7tyFtYJmU8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB9730.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(261022105027099003)(261022075727099003)(261102123227099003)(261021121427099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVY4K0h2ckJDMGR1Mmd5MDAzSlBIZ00xWlhocnp5eXBuMytOUVg3Q2M3MVcx?=
 =?utf-8?B?bjRWWVVqTE1wVCtEWlVmU2dHeUROSWR4cEROK29IdjdyRDZpOFFDWlF4d0Qz?=
 =?utf-8?B?bmNDY3dmSU45UCtJdy9EZytsVk1LeGYvR1JGM0FGTFZxekFDSFErSmRxTVdt?=
 =?utf-8?B?VzRVVmlxSU83eTQvWWhodE1keTZMRDZ0Yi9hVzVLa3ZiTlNJMmpHaXFlOFpE?=
 =?utf-8?B?K1dGMjlRUWxMM1dUOWRqZlBBNDdVamtrMnFVTjNUaXJNY1Y4YzdSMlprV040?=
 =?utf-8?B?cWFiU0xCdDd5MERQQWpDSXUxVDRwcmFYdTI1aU5VQ2xsZGlBWnJoMEt4TjRR?=
 =?utf-8?B?TXBVTXpXV05Ma09wOEJkY0I0aGJ3cFJReWNDMEo5cXI4SXAzVUd6RVBzUzJO?=
 =?utf-8?B?N0RTdVJGcnJ6UkYyRDRLR3l4bWtTcUJjTGxHVUtzK1NOb0Qzc3orWmJaL295?=
 =?utf-8?B?WmpYWmYrZ3VEL0JYNlFJM2ZKdWkvbjlQaTNuSm5vMnFiQ2U1ZnVDZ2tBekpF?=
 =?utf-8?B?UEc0Uy9YMFJQOWRJbm9jZkhlVWVxanNrV2hkZVBIM2prcDNHeXRnWEVleGRv?=
 =?utf-8?B?SkJkYkdqQkduTWJVd3YrVW1ZZEJQaWE1SVhpWXRqMTZQYUVVb0h0dDZmV2xC?=
 =?utf-8?B?WXZQUnF6MFdtVG5yaWlMdGwvRSttR2E4TWlXbGJYRGdnT2pQZjI0TUVNRWN4?=
 =?utf-8?B?SkJMY01YREQ5eU56U09UMDVTWWZ5djdBdCsvMXhJUHVxQWQyekJVT3hGazNT?=
 =?utf-8?B?dVEraDl1Si9Ga05vWjVUWHhOOXdNVVRIT016OW1EZHp2SWUzK3pFbmZpMnBX?=
 =?utf-8?B?Y2V6MEFGcnVrYVZITW1icnRRbTlqS3JrYTNwcGNTTmEvUkpMUFFMKzNTQVVw?=
 =?utf-8?B?ZmIyTk9yd2E2SXUwSkgvZnhJYzF2Zms0VEJ2ZlY1bDRIMzZBNmx4M3lMZHNs?=
 =?utf-8?B?MmNqNFQ4azVhTWRWdHU5c0lhSXhWTjRTQ0RhbUc0dk1UWEtsZW5ZaFZ1QjBj?=
 =?utf-8?B?ZFBmS29kcGRvMkRHdHhQQnZQSXo4anU1RFZzWFhkU3JRSU1MQmQ3TEFwRytO?=
 =?utf-8?B?MG5GcmxxSDBpcEppQ1ljZmVWOW5qcTJFdzdCTlZkNisrd0xjMXlpcWJMK2x1?=
 =?utf-8?B?RmV4UzZlM21wUmxpUWFmRFRhTmxoOFdMZE4wMUIrQVJLUHY5Z1FqaFMrTWVO?=
 =?utf-8?B?dW1FRGxuTzhweEo1MVhWZVM3dFdDTGRPN05FSHk3Q28vYXVCeE9sc2xyMnFV?=
 =?utf-8?B?Ui9PSlZLck9iM2daTXBoVlZHQUlsbUR4RUtzTHU4M2lKcGtkcC9KalllTlZD?=
 =?utf-8?B?U2k5SmVTS0pCM1RzcldGZ0dvOWJvQ0VDMEJ6bWg4VmFiQ0dVZ3ppZEw3YUgx?=
 =?utf-8?B?T2NrR3QvRFJhdEpjZnM4WmZhdHJ2Ukp0VWJnMnlRanJyT2pLN1k0SE4vTWJi?=
 =?utf-8?B?V09ZbU1pelFCNURqMCtHV1V2QW41ZDBwU0NHWTU3amtSc3FuaWNvWjU4UTky?=
 =?utf-8?B?ZlNWZW1UT3VBbmxVUGFuOFdvNmZZOUxTaVYyRVB3WGxvWHoydDRZOEl0dEd6?=
 =?utf-8?B?VW5vaEhnV3RIZUVmbTN0RFFmREVYY1R1RDJBMTZsMFl4ek5GeVBNdUhCczZK?=
 =?utf-8?B?WXBIRnR4NC9XSWFCRHprdGpoRFBlQlJSc1FRMnZSaG4wK25oR1hWZnFwNEkx?=
 =?utf-8?B?cXgxU2dCTFdjczVtam9WUnNNWk1NOGNXQmtsZlM3SjVOUk1ZcFBNTmtPa3pM?=
 =?utf-8?B?QU9WTjNmZVgrc3JRU3AxazZuem8xRFprTVlRSjlUUzNPYXJoejQyTkZVQk5n?=
 =?utf-8?B?L3BEMUNnWXBRQmNxT0sxWG12K1FDczFpMURzdUIwL2x3bUFHbHdndnU4RVZw?=
 =?utf-8?B?U3V3TXlmTHZCK0QyeHE1TlJ3TDdzbEw2Y1VzcTBXSXdCdFZyVko5REtwd3I4?=
 =?utf-8?B?L3RiQkVuQUNMdUY2ZzNpd1NZajhGbGQyNVI0OGloSlFsL1hXTlI0NTQ2RUVq?=
 =?utf-8?B?WHROL3dwdytjQ1dZQjdRczhJTEs0VytrWDlVeVNaVjc3K1M1RnVTNUx6a042?=
 =?utf-8?B?RmQvT2piOUtYdFdiMzdFQXhXSWtFbTZEc0tsdVM2QVBJRHJyek8xN1BBa1oy?=
 =?utf-8?B?Z0FFSWRiM3FrY1ZEREtPMUQzRHFtVmRoL0pNQUpUSEdXMVpKY1oxbWZWcjRH?=
 =?utf-8?B?cnA3SFExNGRiSHN5T2s2cUt4eVhuaWMxaEVDVFBPZEE3VTEvaDU2TzFIK01F?=
 =?utf-8?B?ekM5WnVsSitxVXIrZk9aK2ZxZTVucFh3RmUyQnJRUHBrUUdRYnZWazdVVFUv?=
 =?utf-8?B?djgzNE53YWduaGp3emF4ZzU2SUZhMVVCYWtRN29JTGJVL0RZRmtoUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab00f458-4a3c-4201-7d99-08df4ba24340
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9730.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 09:47:19.5837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RW+6uEomy9zfTVRVuHHzoPjEHuvnZsppWdNnufiNYRsZgKIPL2YUZKdiWOKZePA+dzPbgB0o7xWflYzmzc6kkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5889

On Thu, Nov 26, 2026 at 07:41:48AM +0100, David Hildenbrand (Arm) wrote:
> On 11/26/26 03:56, Balbir Singh wrote:
> > The HMM selftest runs benchmark_thp_migration on every invocation.
> > The benchmark repeatedly migrates buffers in both directions to measure
> > latency and throughput with and without THP. Run it on demand so the
> > regular suite spends its time checking correctness.
> > 
> > Move the benchmark into its own hmm-bench binary and share the device
> > fixture, buffer helpers and migration ioctls with hmm-tests. To run it:
> > 
> >   make -C tools/testing/performance-tests/mm
> >   sudo modprobe test_hmm
> >   sudo tools/testing/performance-tests/mm/hmm-bench
> > 
> > Drop the 128-PMD buffer to bound the amount of memory migrated in one
> > measurement. With 2 MiB PMDs, the largest buffer falls from 256 MiB to
> > 16 MiB. The remaining sizes still cover buffers smaller than a PMD, a
> > single PMD and multiple PMDs, with and without MADV_HUGEPAGE.
> > 
> > Call fflush(stdout) after printing the results for each buffer size.
> > The kselftest harness ends the test child with _exit(0), so timing
> > results still buffered in stdout can be lost when output is redirected
> > to a file or pipe.
> There was recently a discussion on where to put performance tests. Usually it's
> much rather tools to test performance.
> 
> So what about tools/mm/ instead, where we also placed gup_bench.c ?
> 
> -- 
> Cheers,
> 
> David

I don't feel strongly about the location, happy to put it where it can
be found and run. My motivation to put it where I did was to easily
reuse lib.mk and hmm-common.h and other mm helpers from the test case
(due to the dependence between the tests and benchmark). Let me
refactor and see if I can find a good way of reusing bits and see how it
looks like when I move it out to tools/mm

Thanks,
Balbir
