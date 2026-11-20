Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795208201;
	b=RxFjn6yXhiEuwXgKrYcSmtjDcStUnuqAgkgLKBFWIVlNYjpST2b9UbYO+xb60n6ChvWm
	 NVuwLeYIcPL6TszRX2ztwsUUrCRudrGcnJ2tY86pbgRoWI9zXMHNWOhkgiNlfjI2XOSPN
	 +8iGCRc7zC9xp3pFRekdXBkLJ2AqyyPrBSKK/S35gDexMdCg7+fFgy8NUbBZOJVBbqhKT
	 iuPMXGK/mCiDbGLmEU39fDCNViFp+z67clFw/hbkZS3fJStcflEiUvklFbuhOkD/mCmAc
	 TWw6F3TFO1QzH3dYlj87KXwhajnXkTfqf1pCqDrSXF/ONOmfDc43b9+bkaIz207S+Ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208201;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
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
	bh=/ukl2c6o7CuzhcABF0ZkJzFK3sM/gBfjruMO/aw7mNw=;
	b=dWRcRJGiRZ4P43/YkksNdNtTTUVrmGWcJcDzNProJ2FzARFQS7rUSXUqvhci1Ci+5B9w
	 4uD523urA9klzVHhScUM6HncUCVAqMZRn+arpu7aWosKGWLvjVJJnD0NDuTwI7w1kDoKn
	 J7b4BLz4mS19DH8Q6TYJCjyGpzXy5mX5pdKV8Zedo+Zj/gYCP3Qe4OX/DJ9gwkMcOpq/n
	 egMHJqi4JYY1iwCN+sdwTuzJiDE/MeXvO7S03aC8FjOLOScyAqObqhT6YSBMifmlQKoxX
	 JCDM9FsxNmPtoTDFPKS88zGnGmanWB+p+nz87HS4p9/6TKrhFuHITuzCYE4ERcP9/Ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YTdWR8JF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.16
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010016.outbound.protection.outlook.com [52.101.46.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51936606A6A6
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51936606A6A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YTdWR8JF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZ00uWvdvZ+rmZaMngp3MF05VWskfgoUKtar5HRNPmp/Q2+/+5SDSmQ2Le8QinVRVVgmu/3Mf4zSkiKI0sBDj2WHrY6RN1ihAZWLuZsYnkbFjRE/Cr8R+90ipUR7ZofR+CCUfTVtmxHNMSygmUoaFtiKfnnGJHdpgx7ipv7nKahVw4a/Xpa1Avqj188p12MeFTE5/d8gBSWpvPxPE1rKtuPkTWRPV6EgPtzcSFN4kc1wf3iSEVpUzTjWozI3rk5537sOaxVrEKvv9NGWnFVbramk5l7aNNaQdA/9Mu/dCBVhfM78WtItCk3wDsz+dz3Ikuz4YWwto83QDyKX4Q286Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ukl2c6o7CuzhcABF0ZkJzFK3sM/gBfjruMO/aw7mNw=;
 b=MuLHMgLSB/ZHNCKDv+MjT1aLuMI8ZqeuN4DQ1j9zYjGHlEl5nVJ9qCZllVvXL93JyunXOLpb53AbxxP4hyQpNPUltlDkiEtgCR2qyz/yN7A0dxxxQoeq4IZChgZ10pMmLEqFkzm/nwI8GFO11O5yRX/rycclLSicFJT6ia1D12XndZYY3o3BzugSep3E2zCkHREJWQZ1a8OyafxpSjJvJeF2LgfYQQBHjOlbbjMQ344EY6zEFyJ0wg62aC1vkQ9VZg/7HcY37vQNOtDmlJJ77AUZvnpT1zd4iYWOzScjUJzofnnZwOJrXY+brfVyjWT9Hme8e4cE6HC1cdlO7IdAWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ukl2c6o7CuzhcABF0ZkJzFK3sM/gBfjruMO/aw7mNw=;
 b=YTdWR8JFqQLfw0ZeIqPAl+Z28uiqQN+ZrEVH4M23v4d+gl4z5MreeTn77DW8fkCv8+hPqSudMrkktn1fvhcwmYB3jOWHNqS6p8B45kleBBgXLEmcBVpov55tHKfLntR2DgUfoG5lLaIdJ/KA2llGNTM5J8pi3BsCSZ5EIGCV9Ko=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB8131.namprd12.prod.outlook.com (2603:10b6:806:32d::12)
 by IA1PR12MB6483.namprd12.prod.outlook.com (2603:10b6:208:3a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 20:56:36 +0000
Received: from SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46]) by SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 20:56:35 +0000
Message-ID: <be974f51-e738-4933-b0f1-475d2e82fd03@amd.com>
Date: Fri, 20 Nov 2026 14:56:33 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] x86/sev: Route unsupported APIC register accesses
 to the hypervisor APIC emulation
To: Melody Wang <huibo.wang@amd.com>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, ardb@kernel.org
References: <cover.1793926736.git.huibo.wang@amd.com>
 <054e8a3991ed4f541afded6fb9622f08f7bd8526.1793926736.git.huibo.wang@amd.com>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <054e8a3991ed4f541afded6fb9622f08f7bd8526.1793926736.git.huibo.wang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR18CA0058.namprd18.prod.outlook.com
 (2603:10b6:610:55::38) To SN7PR12MB8131.namprd12.prod.outlook.com
 (2603:10b6:806:32d::12)
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
X-MS-TrafficTypeDiagnostic: SN7PR12MB8131:EE_|IA1PR12MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: e8192e9c-631b-48b3-c67d-08df4748c3a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|4143699003|56012099006|11063799006|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261022105027099003|261026140227099003|261026121527099003|261028144727099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	r97UbvtfoyMlRoKxCWJVAzHNA8xow0UXBvgha8cn++1C43j1Sf4OSC/KnMsRxXWijwgOCZgwQYEgI9rark0pKHfziyBcKHA0yUuiR/0ZJKe4Oxc6NTAHNhJKc9/fXSdMvCR/8bKrV18Aek9AuivWEcfoJ5iCJRvoM3l3/6BmGIUFKk3SUNXJ3oj19qiqJuYjkgCDaKlyw3XSU0HoqfiIZBQdA/2DjYQfX3JiF51PNsFn6aFppsJrB2Z4a2AV9ztNlST9iCHv5Ijr81uXBOF59jvLljtsaNqYOaczSfQSh01fP1stV9THL82R2DJJZVj+F1+1TFuhHuzaqQ7r3tJhl5SnMB4XNyvy1M+8ms05YvWRFxGKuoI5v/PzOh/LyOSTLq6lXBX3MSFmKl67q2bsi2W7Lx560qkKva18hbRdBJcVJIvhNEU11mMENKftC77zIQV1I8y0QifEIscf6f8BbfmZ0GpyfQQL8I1aVSMANZRZcywTxTVDM+xoIibQ1KOA3ulHFQSz7SkgidRdplCs4XqzipKRc+aPEnEcAQBYL6Qi49fy/9cMTeoITvUasle+HpHsB0tKrJt5C/EuiK9wv19QB/ru+I5L8Bij+t3rLhQK1t4jFmJvOPfsw19Ogm/1CzIwWV37utGubHzV970vBC/AP+z64vbCthji6eBChFw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8131.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(56012099006)(11063799006)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzliMitLOUVHRkpWeldVcm5JY2k3NlhBV09BZ0wwZm9GTHJpNEZqYm0xK0Vu?=
 =?utf-8?B?TDYvOU8ydnJuQ2lKdWlSZkVoWU1PT3pPYkd6RGROajA5L29nd3ZvcWZGZVRn?=
 =?utf-8?B?T09MT1hXZnF1VlFWMnNZWFVaV0k3NW0rWktrajF5RHd2cmZjVERWRXl1YmNp?=
 =?utf-8?B?TDFSRjcwbXVtbzZ3b0JnMkxXdENDdVQ0elV3TGZueC91bjZINkFsbnVsbmhY?=
 =?utf-8?B?eVBibjErVmxVQ1hlWVZkekZPZmFRUHg1YTd6RXdqQi8zYTdBOW5MMHlOd0JO?=
 =?utf-8?B?cjEyemdibVVjZEhlRnFKSEVLZHM3WnFmR0sreW1oTk1XNTY2TzR3ZEdObE5O?=
 =?utf-8?B?Mk1lWUZ3bXFYNjhaMHNyVFMveHJIQ0R0UjBvRURRdEpJUTBDblhINmVlYXdU?=
 =?utf-8?B?aUJLUkQreHZjRkQ1T2sybW9zKzJNdHlycmlQbkRUeEY2bmVOdE5BdDJ0bWpY?=
 =?utf-8?B?RVJzWDdZbTZmZDI1VjRUNVB0MkV0QTNyeWFkRktoMVI2aVJqRndqVHIzYkZW?=
 =?utf-8?B?cmdtWm9tRFJibWR4eHcxbENqRjEwM2RsRi9ZaERadjdZSHZqaUt3YXZOeUpx?=
 =?utf-8?B?K2kwREtUdnlrKzJRZ3BoQStwZS90cGhQNm95VUhQV2VhVzI0ZXd3eGtacm5T?=
 =?utf-8?B?SFEraWp3UXZyRFM2SFNoTkRESitXYVlJcENuWlNWLzZXUC9DbE5LQmxsR1li?=
 =?utf-8?B?OWVwL2NIMjU4K1F5UHZJSnNVeTVQaDhQQUVBVjhkNnVTVGN2QzJoWWhlRVpH?=
 =?utf-8?B?VGxYanhOYUltbnpzdzdZT2NYTHFZMzRTUlRjSDdodlRjaEZQNDZOdUpSVWNn?=
 =?utf-8?B?eVlKY3RYZEFJUDdqMlA1YVU1NGZMMGdCSHVBQlpLUXo1MGgrbHJiSlp2Qytz?=
 =?utf-8?B?dHoxaUppN3RxTFZvVE5QRUQvTFFyU1Y1Q1BxcE5xdnhybE1sTTNFenlCTEl5?=
 =?utf-8?B?TmpuUnhyOUtBQngyVmlaemorcVFaQ0hVazhQRGRPV3Fud2UxUzBJUlBNZll3?=
 =?utf-8?B?YmNPZGVaendFc0R0MVM5SzBlUkovVnRIOStvNmVUWXRWUDhLNVVjZHFBVHNp?=
 =?utf-8?B?YUN5dWVNOUs3Uk1EcnpPWVdpVEsyS0Nia2t1SlVXRFduVm5lLzYwZ1UycFZH?=
 =?utf-8?B?Rm1VY1piQWRYK1k0L015QTgyamZuZWxtWjF5UXZlc2lUZXpudzU4VVdhcmRC?=
 =?utf-8?B?UCtPU3hnWUFOcll3NC94YjlqL0RhUllROFBnaGwzTWtDa0prWms3bEdTVXZn?=
 =?utf-8?B?a1p1YXI5TzBzMWJCbnd4ajBvSTV4WlBQV0pEb0c0WUZqYnJ4dW5tUmNhQTg4?=
 =?utf-8?B?KzQ1QjFvWmlURVVGb25YSUdyUnNXVHZtaUJoamxuc3Z6cjlWVGovYWxoRDlR?=
 =?utf-8?B?Q2x6QUtOdkRSdnhpdm9ZMGx3cFk4M29hZjEvUk5YcTNwZk1WY0p1cGNsMi9Z?=
 =?utf-8?B?cVA0aE81MXV2dWprU0ZodTFjeWdKdHBkT1dxMkp1TmNJQ082S2YrL0dOaG90?=
 =?utf-8?B?Y0xjdFcwVXhIMEJaSllvbmNpUFRHTHV4QXdkSHlMVndFeXFhZC9oNXJDWTN6?=
 =?utf-8?B?SkExYUZyN0JjdS8wTFJvSHZtK2ZNY2VHRDFNTkRWelh2aXVHQjZ1VVljb3Bj?=
 =?utf-8?B?bEZUZjNBcXZjQmlWaXFTYlBYZXNxeS8rRVkwdHFGN3BoUytsSUtmT0JPRDE5?=
 =?utf-8?B?NmNDUUdhSjFENFdBdXlXallTTng5YU1nUzVWdHdibHJZbGZaQ1pWeVhCUnI3?=
 =?utf-8?B?dXBIanhXUnhza2JzdmduaTZhMFh4TVptSStibktCYVVCalVNcW9MK2l4Yk5h?=
 =?utf-8?B?TlI2TkRUZVROL05HMjc3WjhzMTJDZUViSFRoTmZKN3FWQ2RiR2E3QWplc1Z5?=
 =?utf-8?B?enRkU2d6cEpIbncyVFJEeHlxYWdHMVZRWjNUY0gwejlpQ2F4RFdFVkpWdU1u?=
 =?utf-8?B?TEVTNE9Bak5CVHRTTUtUNjg1QmNHNm1EdC9yaEZYd09ZVjkrbkk4T2VYczlR?=
 =?utf-8?B?cDZZY00wS0lrZy9RYVNZbmFVNVRORFhKdEp3QU94cHNORXpNTUFzQVJ6cUZD?=
 =?utf-8?B?Vzk2ZUcrYTZHdXNDZC83RzE1NVhlZFlCMWl2MWhqQ2llbFdzZE1vTmVCYy9p?=
 =?utf-8?B?aWFpL2RycThxVFNyQy82UC8vOUNpaGwyWTRjUDBFR0xEYnI4K3FoTHlHM3ZG?=
 =?utf-8?B?TEY2VG9obGlkM1gwRzMwTktHOHJYWWh5WUZPUktsUUEwRlhrMDFVYkxld3RM?=
 =?utf-8?B?azlOMGRLcjlub1lZNkVOZTdUd1kvaWhqZi9wcVM2UGJxQzQxaDc4SW9RaWJp?=
 =?utf-8?Q?rOFKDah0+qprU/InMg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8192e9c-631b-48b3-c67d-08df4748c3a7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 20:56:35.8313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wmOdZKHGEWJT16Gl1kCwmxPbI6N7Oc/JESOpEd3p/+M3wLEA/Kn4Cakboyjjpuu4rxQrMieVW0AGwq3WLR1CJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6483

On 11/5/26 19:25, Melody Wang wrote:
> The SVSM APIC emulation supports only a subset of the X2APIC MSRs.
> Right now only basic APIC functionality related to interrupt delivery is
> supported. Therefore, route the unsupported ones to the hypervisor's
> X2APIC emulation.
> 
> Signed-off-by: Melody Wang <huibo.wang@amd.com>
> ---
>  arch/x86/coco/sev/core.c            | 46 +++++++++++------------------
>  arch/x86/include/asm/sev-common.h   |  1 +
>  arch/x86/include/asm/sev.h          |  8 ++---
>  arch/x86/kernel/apic/x2apic_savic.c |  8 ++---
>  arch/x86/kernel/apic/x2apic_svsm.c  |  9 +++---
>  5 files changed, 31 insertions(+), 41 deletions(-)
> 
> diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
> index 900a7ff8b639..99df8d7f3e98 100644
> --- a/arch/x86/coco/sev/core.c
> +++ b/arch/x86/coco/sev/core.c
> @@ -972,7 +972,7 @@ int __init sev_es_efi_map_ghcbs_cas(pgd_t *pgd)
>  	return 0;
>  }
>  
> -u64 savic_ghcb_msr_read(u32 reg)
> +static u64 __sev_apic_ghcb_msr_rw(u32 reg, u64 value, bool write)
>  {
>  	u64 msr = APIC_BASE_MSR + (reg >> 4);
>  	struct pt_regs regs = { .cx = msr };
> @@ -981,49 +981,37 @@ u64 savic_ghcb_msr_read(u32 reg)
>  	enum es_result res;
>  	struct ghcb *ghcb;
>  
> +	if (write) {
> +		regs.ax = lower_32_bits(value);
> +		regs.dx = upper_32_bits(value);
> +	}
> +
>  	guard(irqsave)();
>  
>  	ghcb = __sev_get_ghcb(&state);
>  	vc_ghcb_invalidate(ghcb);
>  
> -	res = __vc_handle_msr(ghcb, &ctxt, false);
> +	res = __vc_handle_msr(ghcb, &ctxt, write);
>  	if (res != ES_OK) {
> -		pr_err("Secure AVIC MSR (0x%llx) read returned error (%d)\n", msr, res);
> -		/* MSR read failures are treated as fatal errors */
> -		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SAVIC_FAIL);
> +		pr_err("APIC MSR via GHCB (0x%llx) %s returned error (%d)\n", msr, write ? "write" : "read", res);
> +		/* MSR read/write failures are treated as fatal errors */
> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_APIC_MSR_FAIL);
>  	}
>  
>  	__sev_put_ghcb(&state);
>  
> +	/* The return value will be ignored by the caller for a write */
>  	return regs.ax | regs.dx << 32;
>  }
>  
> -void savic_ghcb_msr_write(u32 reg, u64 value)
> +u64 sev_apic_ghcb_msr_read(u32 reg)
>  {
> -	u64 msr = APIC_BASE_MSR + (reg >> 4);
> -	struct pt_regs regs = {
> -		.cx = msr,
> -		.ax = lower_32_bits(value),
> -		.dx = upper_32_bits(value)
> -	};
> -	struct es_em_ctxt ctxt = { .regs = &regs };
> -	struct ghcb_state state;
> -	enum es_result res;
> -	struct ghcb *ghcb;
> -
> -	guard(irqsave)();
> -
> -	ghcb = __sev_get_ghcb(&state);
> -	vc_ghcb_invalidate(ghcb);
> -
> -	res = __vc_handle_msr(ghcb, &ctxt, true);
> -	if (res != ES_OK) {
> -		pr_err("Secure AVIC MSR (0x%llx) write returned error (%d)\n", msr, res);
> -		/* MSR writes should never fail. Any failure is fatal error for SNP guest */
> -		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SAVIC_FAIL);

I guess this kind of answsers my question in patch #2 about what to do
when there is an error.

> -	}
> +	return __sev_apic_ghcb_msr_rw(reg, 0, false);
> +}
>  
> -	__sev_put_ghcb(&state);
> +void sev_apic_ghcb_msr_write(u32 reg, u64 value)
> +{
> +	__sev_apic_ghcb_msr_rw(reg, value, true);
>  }
>  
>  enum es_result savic_register_gpa(u64 gpa)
> diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev-common.h
> index 095fbafe8a2c..585ddc44b6b4 100644
> --- a/arch/x86/include/asm/sev-common.h
> +++ b/arch/x86/include/asm/sev-common.h
> @@ -210,6 +210,7 @@ struct snp_psc_desc {
>  #define GHCB_TERM_SVSM_CA_REMAP_FAIL	11	/* SVSM is present but CA could not be remapped */
>  #define GHCB_TERM_SAVIC_FAIL		12	/* Secure AVIC-specific failure */
>  #define GHCB_TERM_ALT_INJ_FAIL		13	/* Alternate Injection-specific failure */
> +#define GHCB_TERM_APIC_MSR_FAIL		14	/* APIC MSR failure */
>  
>  #define GHCB_RESP_CODE(v)		((v) & GHCB_MSR_INFO_MASK)
>  
> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index 6496b376452f..d916a5dcd6af 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -542,8 +542,8 @@ void __init snp_secure_tsc_prepare(void);
>  void __init snp_secure_tsc_init(void);
>  enum es_result savic_register_gpa(u64 gpa);
>  enum es_result savic_unregister_gpa(u64 *gpa);
> -u64 savic_ghcb_msr_read(u32 reg);
> -void savic_ghcb_msr_write(u32 reg, u64 value);
> +u64 sev_apic_ghcb_msr_read(u32 reg);
> +void sev_apic_ghcb_msr_write(u32 reg, u64 value);
>  
>  static __always_inline void vc_ghcb_invalidate(struct ghcb *ghcb)
>  {
> @@ -652,8 +652,8 @@ static inline void __init snp_secure_tsc_init(void) { }
>  static inline void sev_evict_cache(void *va, int npages) {}
>  static inline enum es_result savic_register_gpa(u64 gpa) { return ES_UNSUPPORTED; }
>  static inline enum es_result savic_unregister_gpa(u64 *gpa) { return ES_UNSUPPORTED; }
> -static inline void savic_ghcb_msr_write(u32 reg, u64 value) { }
> -static inline u64 savic_ghcb_msr_read(u32 reg) { return 0; }
> +static inline void sev_apic_ghcb_msr_write(u32 reg, u64 value) { }
> +static inline u64 sev_apic_ghcb_msr_read(u32 reg) { return 0; }
>  
>  #endif	/* CONFIG_AMD_MEM_ENCRYPT */
>  
> diff --git a/arch/x86/kernel/apic/x2apic_savic.c b/arch/x86/kernel/apic/x2apic_savic.c
> index 4bc6d7e018a5..990e4a379e07 100644
> --- a/arch/x86/kernel/apic/x2apic_savic.c
> +++ b/arch/x86/kernel/apic/x2apic_savic.c
> @@ -72,7 +72,7 @@ static u32 savic_read(u32 reg)
>  	case APIC_LVT0:
>  	case APIC_LVT1:
>  	case APIC_LVTERR:
> -		return savic_ghcb_msr_read(reg);
> +		return sev_apic_ghcb_msr_read(reg);
>  	case APIC_ID:
>  	case APIC_LVR:
>  	case APIC_TASKPRI:
> @@ -193,7 +193,7 @@ static void savic_icr_write(u32 icr_low, u32 icr_high)
>  
>  	icr_data = ((u64)icr_high) << 32 | icr_low;
>  	if (dsh != APIC_DEST_SELF)
> -		savic_ghcb_msr_write(APIC_ICR, icr_data);
> +		sev_apic_ghcb_msr_write(APIC_ICR, icr_data);
>  	apic_set_reg64(this_cpu_ptr(savic_page), APIC_ICR, icr_data);
>  }
>  
> @@ -210,7 +210,7 @@ static void savic_write(u32 reg, u32 data)
>  	case APIC_LVTTHMR:
>  	case APIC_LVTPC:
>  	case APIC_LVTERR:
> -		savic_ghcb_msr_write(reg, data);
> +		sev_apic_ghcb_msr_write(reg, data);
>  		break;
>  	case APIC_TASKPRI:
>  	case APIC_EOI:
> @@ -316,7 +316,7 @@ static void savic_eoi(void)
>  		 * interrupts. Return to the guest from GHCB protocol event takes
>  		 * care of re-evaluating interrupt state.
>  		 */
> -		savic_ghcb_msr_write(APIC_EOI, 0);
> +		sev_apic_ghcb_msr_write(APIC_EOI, 0);
>  	} else {
>  		/*
>  		 * Hardware clears APIC_ISR and re-evaluates the interrupt state
> diff --git a/arch/x86/kernel/apic/x2apic_svsm.c b/arch/x86/kernel/apic/x2apic_svsm.c
> index fea61b929122..c7f7a9175e17 100644
> --- a/arch/x86/kernel/apic/x2apic_svsm.c
> +++ b/arch/x86/kernel/apic/x2apic_svsm.c
> @@ -68,7 +68,7 @@ static void svsm_apic_msr_write(u32 reg, u32 v)
>  		}
>  		break;
>  	default:
> -		pr_err("SVSM_APIC_WRITE_REGISTER 0x%x not supported\n", reg);
> +		sev_apic_ghcb_msr_write(reg, v);
>  		break;
>  	}
>  }
> @@ -77,6 +77,7 @@ static u32 svsm_apic_msr_read(u32 reg)
>  {
>  	u32 msr = APIC_BASE_MSR + (reg >> 4);
>  	struct svsm_call call = {};
> +	u64 val;
>  	int ret;
>  
>  	switch (reg) {
> @@ -100,17 +101,17 @@ static u32 svsm_apic_msr_read(u32 reg)
>  		call.rcx = msr;
>  
>  		ret = svsm_perform_call_protocol(&call);
> +		val = call.rdx_out;

Move this to after the "if" below.

Thanks,
Tom

>  		if (ret) {
>  			pr_err("SVSM_APIC_READ_REGISTER: 0x%x, error: %d\n", reg, ret);
>  			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
>  		}
>  		break;
>  	default:
> -		pr_err("SVSM_APIC_READ_REGISTER: 0x%x not supported\n", reg);
> -		return 0;
> +		val = sev_apic_ghcb_msr_read(reg);
>  	}
>  
> -	return call.rdx_out;
> +	return val;
>  }
>  
>  static inline void svsm_apic_msr_eoi(void)

