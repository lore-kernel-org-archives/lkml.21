Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795043313;
	b=jY0pVZz9b/UEcA2KMIA3DL+0ta5hIvkIjVuw+3jSYDHK/nxl6tDm8MchcBbJqVCUHIjO
	 Xx571SmKUlfp4Lx9JcacMYjKkYgomSXBB+uMxhZWmAuTwcOeryak6HicTkqRXwZBNlIQP
	 50OfiM6fGMXv3CjNl1xT9SfpZ+g6vlKA6EwIEkanxcXthEMWXIYkkQxki7ZQxj3stBSPY
	 IJQ4efrwNNPrVKw7cK01aPfPZEb3kmiKe33qFYWGUX4biezIm1E79FDDAbFj8lnUBfgdR
	 BcSLObHa3xocSN5NhRhC7s+2ZILgWC/VTBbdGJIoMRc4afAKsnRQPzmcQPBtl40yG7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043313;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:Content-Language:To:Cc:References:From:In-Reply-To:
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
	bh=WU5Xa42EsT1JNP6maiQlNjTw+Qf9fipnrUBEL0/L4hw=;
	b=G2vNYkWk2oLOwHRNl89fx4bKloqpDYytOUASt51VuZU/+GyR0vBamN9qk8Yg3bm9FtSz
	 DIiDE/0YyZ+brIinT/J3FWJIbQLMJUaZSICN40dNuP1DwP34wcERHNOTR/OiQjCIT/Nlf
	 xyhExs4hS8or8mnBmEDA8Aqna26vUn38RDY383BfHfXXdNmYauLSZSsE+LPpo/3ejFNKX
	 KtJJ0XuIW9oKCLTEoxzdVUQTBAb5wsO+dArRp/UDDBVSWCMFcpZiX2QaefQ4FsOVO16/A
	 fnQ3UTVAUe2LcAlbnBEp7BhiwRFMUoGBaDbdX6/Nt53+NSaMtSTAOm79SefV3HETGeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=q1l9TGzG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.19
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012019.outbound.protection.outlook.com [40.93.195.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D28E606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D28E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=q1l9TGzG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHqj8hF8z14LTkeal9poHYmPrtZb9vfT5B6p7Ias5dq3SI5saUovAUOcz7kPYYemGIIf8abTXwazUCPdxrXJfcgJeysPeFyTwPUIN6Ng2CoJwoYQBtDUcR8Xnf1D3r6PIY2Acl4AeDe6QzQXzrOqdrs76u9IYDwdtwJSDCKrW5ne+ARpWqIXh40XAYtT20zUXYpfyjyncDg0HmyVCvmefd2oL5wBbEtpA/aAGKGeYHzET7MZ2Vn84jo6YwbA1o3VTBn4Uo/fE2w1CS/u0rkh54LTMN077hGeXS7wu/TqU1v6thyBzhfnNCA54bY7nhtwxYQbglth988nPFpx015Xkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WU5Xa42EsT1JNP6maiQlNjTw+Qf9fipnrUBEL0/L4hw=;
 b=ThRcFsG+D5cqKt0dpJPiONPaNLD00z8flcFJmXbjWR112hcpyais1kRh369VuASMv51DC18oApaPshrxv0AXj1NwvQcXN7H4U21k9lhju+VF9WRY7tggzq8U/SG71ci5TMctJHS/0fmOvJMVs/OwAyNAm5lPceGp7np5PwU7bWYmb7mvLOphvXD+qnyxD2lr5NkuOE+j9fE1zhNbgANeHvf8E9ofMWCNrKZkbvhK3PqVoNcjPrzntFDliuFOPt81db0lwjrtA6x4EW75T/qXLG0yERgTKo0xPSFJ/k79R0pTJqzXU0fFFBrO6U7PJdZfIdUrAr1qoxDGmSWGMcUvMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU5Xa42EsT1JNP6maiQlNjTw+Qf9fipnrUBEL0/L4hw=;
 b=q1l9TGzG9JOcgU9Fguynq+21/rxVFuMpiP5+Sti2opeOQenfkcdXKRaYLQVFB1HCGS4S7t+MHwUOI8CqLaQuWELecqJuP7UUhZWRmjkn+TC6eVGe/gMpp4pBDkrKzweVMtB9CaUS+WIpg6xLyde2xtjEuVcI5n6F9ym3oVpStvE5tsV2afY8z2wmJZqBqOliKcHbIR/wurQi4oXubD1z8P/eyTjO6EQPANpmwe+QuVphHRoG57TuQOymC3igxidQYPaoJET+T1XOnf0+h9ws22Vzaop2Ac0arpzilspBg/Bf14GkOoF+sTQ+PYxrPYf3zb9JbggCNmZ+xy+m7asuVQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS4PR12MB033229.namprd12.prod.outlook.com (2603:10b6:8:50c::24)
 by LV0PR12MB659346.namprd12.prod.outlook.com (2603:10b6:408:608::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 23:08:30 +0000
Received: from DS4PR12MB033229.namprd12.prod.outlook.com
 ([fe80::d666:2f16:7d21:b7f0]) by DS4PR12MB033229.namprd12.prod.outlook.com
 ([fe80::d666:2f16:7d21:b7f0%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 23:08:30 +0000
Message-ID: <569fd2af-47d4-4f9a-8f38-6c368b0466b5@nvidia.com>
Date: Wed, 18 Nov 2026 15:08:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/resctrl: Report unknown schemata domains
Content-Language: en-US
To: Nirmoy Das <nirmoyd@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org
Cc: Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 Babu Moger <babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>,
 Drew Fustini <fustini@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20261118205825.3339003-1-nirmoyd@nvidia.com>
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20261118205825.3339003-1-nirmoyd@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To DS4PR12MB033229.namprd12.prod.outlook.com
 (2603:10b6:8:50c::24)
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
X-MS-TrafficTypeDiagnostic: DS4PR12MB033229:EE_|LV0PR12MB659346:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a688b79-7b9d-4551-1c49-08df45c8dc38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|56012099006|11063799006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	65uzAi+aLcWJDmvz22NdqOxV+8XHw9ZqP5NU3nhWkTe+QP96H/KJIus7cyjqVicZvJXnnHJw0QA9oOfSlEe+C3Q49S6/LXWQRNmhKo4zlrYuHMcIGe9bLI9hUlkTaEiSwqk3PY6DngRuAlsEeNfNLwe//qvHpvXeeFxCVsBE1Uzvl4jaaGlFpGB+uwmpda9AS15BOrorPmi65IVoAPn0XA97F/JAtBLNTUUHQgHJ0M+tpmOG6d/VThNmvmVpv/KQDGjsp4XRB0vHMKIhL7sgnv6DwQ5eCOjEGDYd6Ixzfj16djKTqaeBBDKfZDoKgj0yLgIxE/+Mx6RV6MWA4E0C4n2tPY7rxCL720hsxNTzSX8ZzmqlyRMrkZBr+cpvTPJMtVAmM9zkNy01NPU+hOIGQ8gOYh3KZXCgwu0Ychztz978p01QkmcqF9RYRMnkB39VAcI52ubc9ltC3ZkXEhN5S0YnTsXrl+J/Ae8cC1/LTaMhwyYqg5Emb7ZLbDjuqmb6jKXUjGboziHRbixt0OqhwWZJLWNUKm2XadjXt7Id+MnMqe0gehbg4NwjdvwT0c1YNvdYRRHNS//J0kiouHzGeUi/k3m7FCAKUxpZfdJF24Czsb91n5EcOwr2vrq1J9aRhAoOhGhnv9mm/5bZKL5srvSO9odmqFrmCam7unnCwqk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR12MB033229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlZhV2hHeVFzMG1LbDZKTDZwNFdQR0NXdy8yVzdTejVEN1NaWW45cHlqQ0Vl?=
 =?utf-8?B?SENqQVVEM1c3LzZnNG5wTGRaVGdhejM0UVVidklhSmlJSHFQblQ0OW5MdU1K?=
 =?utf-8?B?ZlgvQlBEMHRrUW9FOWd0azNYZUk2OENvdzhDU0VmcWpGK0l3dUYvN2FUYjhi?=
 =?utf-8?B?TDdlb2s4d1VMS0lKMGN4Uk5DK2RLTE81TjlYUURQYW9QdU1xckxJc2RCMy9w?=
 =?utf-8?B?dzkzQWt2NytnZnVXTDRhYndjM3dwSzRWYlBQd0ViRVQvekUwMk1kR0RGR2dq?=
 =?utf-8?B?OTk0OHhscVJCVGs0bERBSndKVzlad1dYZkZHWXU2WDc5RGxMZnE4QjZZSjBm?=
 =?utf-8?B?MkxpZTdPc3JGSmlqUjVRUWFEQnBVRmVlK3o4ZFRmS2VMQzBOSUpIZ2Z0aTF4?=
 =?utf-8?B?ZDBTOGVLTE90MkdUWkQzMnVsRVRYeHIzYVBNeVd6NkNJYStaSU5EOHBrbVZy?=
 =?utf-8?B?OElIZCtjc1VwN2RrekNwU1EwTk15bGNueDJFaFFiQzNiQ3JwMGxRVFMzQ0w5?=
 =?utf-8?B?Uklzckt4TGgxU0tRM2RwTmRza21jSWdlOHk3RTZUUmp2TThCQ1RnSDJvdVdK?=
 =?utf-8?B?WTBUK3F2SjlsQ1I5TjF1Y2NnRmFpdmsxTFZuMjBEaUJWMGZWS2JQaHU3QTR1?=
 =?utf-8?B?U1FlSkVwWW4zMGdTVDNZd1lBSlJ5L0tsd2Z6aTQrSnNXV2ttT3ZMVDJmZ25P?=
 =?utf-8?B?QkU2dzIvaHZvUUhIT24yYkhjKzVnbitWM2lCOTdUTGFUS25vT2ZKcWRNL3RV?=
 =?utf-8?B?ODkwcUxIcUtUek9jNStEMkp0N1FpME5wTTEyV1N4aVpSQW93aHZBRUEzNVJQ?=
 =?utf-8?B?QjRGb0lJODU2SVFTaUtRa1Z4NXVxTndRYXdtb0VHRk9vRUszSkUzcGxlYWxO?=
 =?utf-8?B?L2dUNkFNTmJtOFU1aTBxOUtrem55Q3pCbkhEaHN0WU1ML3ZyUEhhV3BNY1V1?=
 =?utf-8?B?UWdoODRnZ0x1NUNCOUYrUFRzcUdweUZjZ0tnekZ3Y3BsM1hCa25aUm1rUE10?=
 =?utf-8?B?Z0d6NldZODdTR3kvWFAwWHZYemZSL3hkRFRDaVdpZGQ4Yk1UOUM0Q1h2RlpS?=
 =?utf-8?B?amt2OE9wNEdjS0JkNUlDdnFuaklsN0NsWHR0WXFPVUZWd2RGT3NtSVdzRkMr?=
 =?utf-8?B?MDVBUmFWRC9MRUQ5UGVya3dwTEhmS0duQ3EwK3RYVXVGQzFRWkxqUzFTKzhz?=
 =?utf-8?B?QVpXeW1DR2UxcThNNTgxSlR2T3Q2U3BVNlpMN2dub1BlRWg3MGdDeU1mRjd1?=
 =?utf-8?B?QzRWZGVXNDhVMk5NZTZiRXluM0xWdGNCZkNMMWV2NGNYK2ZGRUYyVUxJL2FW?=
 =?utf-8?B?RUdjMEd4OTUrc0JhT1N2Vi9YRzd2c0UrS2lXcnRFK1luQmhWcXc5dm1zY2hi?=
 =?utf-8?B?aXplRVA5TWQ0bjNFSzFjbzhUaTZmSmIybHozM0c5dXMrblk0d0lwbktBOEFU?=
 =?utf-8?B?MDFSMkRNYzZGU0ZzKys1SFVCS2c1Mi83ajBQQm5BM0hPVVl5N1dlTzhzc2Yx?=
 =?utf-8?B?RjhWWmtJZzQ5aWZpZC9YZHRlVlA3eEFuZmlEa28xSnhpTUNHdHR4TU02SDJH?=
 =?utf-8?B?VS9pUTZhUEZyaktybmJXM1kxZFVIR1lCZ0tWd1Npd25IYU9JMjRXb3NZQjZI?=
 =?utf-8?B?WThqSkxNQWVZWEpmMFJRaVlYditOQnFaRDhGQ0l1aVNJd0svYTYvSGttSVB2?=
 =?utf-8?B?Q0pjZ2JvR1pkelk2d1IyZXhOd3d0NzhVYjBkZUtLYUpNS1J2YnE1ZDFPMGI5?=
 =?utf-8?B?SFVTRzhYajlCSTRTZzBZbEd1N3FFS0g1UnhpNVhDUlhFMWVObTZEd0lLU3kz?=
 =?utf-8?B?U0ptbWMwZWZMdjRwQUM5WUdocTkrSnVMTFlzQWlzR3g5bHNVK25xSDhsNTBn?=
 =?utf-8?B?d2wxejBycU1mdDBUa3Q3U3FBTktCK21WYXlXTmdObllxTEpyczBBVmI2NTMr?=
 =?utf-8?B?aFhDYXR6RXVNSm90MUVLSCtyZ0xQNE9FaEkrZ2pYWFNJMDFDaWUrTm10OVZ5?=
 =?utf-8?B?cy9wL0xvUno4MkhWcXVpYVY5UVBoNWJReHFaUVpmSm5kRGlPRlF5KzlDWFhB?=
 =?utf-8?B?aHlreDZkN3c3SE83Q3dpRjJ3Wk9saTVmRTl6N1IzWWpVbFhZamw5c0JIYWZ4?=
 =?utf-8?B?bXBZVytTbmVrSVZSQjN3MnlOSUJhTE5NL0lUYWhrVjd4eEtqRDJVc0ExZHBM?=
 =?utf-8?B?cUg4ZWNZK0VQMzlndU9xVnpDeTJCTGNETWF3WThnZktIdjhLUlVycDFLQjBh?=
 =?utf-8?B?YmJDQ09qSTR0bGNaSE1xVTg1Y2R4bHdESytlVHZDZVRLZjF2OTEzZVF0blpO?=
 =?utf-8?B?YTRpQTlmWi9yWUtraUxXdDJXRkJWM3NxZUllcEJlRTFGV0xuRTJkdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a688b79-7b9d-4551-1c49-08df45c8dc38
X-MS-Exchange-CrossTenant-AuthSource: DS4PR12MB033229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 23:08:30.1943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W41E85+Awio/3k3kVxfYgddK8nvlkaB5dz9a9hXAwiols9qTDqiwYKXPHBg8tjtxV3Nm+IpF2xXrcwkUOS5B2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB659346



On 11/18/26 12:58, Nirmoy Das wrote:
> A schemata write to an unknown domain returns -EINVAL without setting
> last_cmd_status. The status buffer is cleared before parsing, so reading
> last_cmd_status after the failed write incorrectly reports "ok".
> 
> Report the invalid domain before returning -EINVAL, matching the existing
> I/O allocation parser diagnostic.
> 
> Fixes: c377dcfbee80 ("x86/intel_rdt: Add diagnostics when writing the schemata file")
> Signed-off-by: Nirmoy Das <nirmoyd@nvidia.com>
> ---
>   fs/resctrl/ctrlmondata.c | 1 +
>   1 file changed, 1 insertion(+)
> 

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
> index 69123b2a3274804a..2f7db6c669214c3a 100644
> --- a/fs/resctrl/ctrlmondata.c
> +++ b/fs/resctrl/ctrlmondata.c
> @@ -279,6 +279,7 @@ static int parse_line(char *line, struct resctrl_schema *s,
>   			goto next;
>   		}
>   	}
> +	rdt_last_cmd_printf("Invalid domain %lu\n", dom_id);
>   	return -EINVAL;
>   }
>   
> 
> base-commit: 2a93af75384b7e95d62c5a9a39e13573e2170ec5

