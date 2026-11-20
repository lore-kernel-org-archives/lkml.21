Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795207691;
	b=GtDxp+ZehDZvKaB8QT/Hj+p0Aejri4Ca3UrUbYl0Y/L/uPLhxk/121ruMrTIWA/nDE99
	 WOC5cGzf3oBMZkJwN9zUh+b0hbYnz+IIuNug5OLn0F3cXDt6S4Xb+fuVt/GDh2mOw6faw
	 eDl2i9Gx+Z6sEVjkgMlVosfLGEi9TjOVgpMDo7Yt4tboC13Z2bbyvg0aF6YN8uMNH6YbF
	 QFRzMQEg6hJeHzQm/c18J0syQiEqgwCzQP6BmtgUuXsD8T2X6GKL30tOebW1ZMXzCbK4q
	 J8US4uwWjwQuuAoDhF8mTTR3JdB3L+Muhwo62rxK9gFJuThptNXFqHBqZojdPCE5vDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207691;
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
	bh=5RPK5Fy9ymoAfXd54NepXV37EKbZgLiZRifzt/oeWQQ=;
	b=eZ9YbNt9exyMVoKnQeiQa1+GMet4BKKKraQSjnUR6/GBoM8PQaYCDt6Odch6DT6sxr0E
	 PWOWGn0ELC+/uImAKW/v8cezj9aKmsgijNIFJ18AbBmQYntF3KqaM/jjrID7PcfJcsB9J
	 o08tor7NAlL3ZgQ14UhRHynzg4CdPiEirLOzSRG32kxVm/zNamFPWvzmbYlpHaKyq7icB
	 5A8FmNFLY3V4KNO8VxM90F1j0obfskQp/b8VoDKJPxzr7UU/h7EwLy2PhALKUCmcD8tTX
	 O+i0FKdpmc/SeYy7WgodwH52YEOYipENrTf5XNeehaWQu7ALpckCFFbOdIGnzDKmXZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hJNOuLou;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.49
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012049.outbound.protection.outlook.com [40.93.195.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8DB606A6D6
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC8DB606A6D6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hJNOuLou
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qi9biroupWgAOZH2x0yJF9kQaORbkNI8VT4Bt4ictikVCgJ1BakG0c3rZIEL4a0+ZP/wu+C/go4GQCOhyH50qDU9OccD5ij77Lyl8lCCk7Wbwr5ME+cXaicg84V6dsUtmPS/igh8fOHA4fD5M7YP4hrSEShhPLmXxf7lxM3kyrZXM8eyh06qNmB/fcrBViLpE+YypAcNr4Kr7oX1kLk/29AUia2O60XSDiqB+M+Vo4md9hEvatDIHD277YN3ujqGBR5y7Rglw7LQh0CXLcttr20QeMuQ43yvF9O/AmhLW5UKYnl2ZUbVtFSVau8sN5rJneLNq54BOCsRct5MHgTE6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RPK5Fy9ymoAfXd54NepXV37EKbZgLiZRifzt/oeWQQ=;
 b=AqqnYocWlz/DepHRumWsa/aQGYmAUG0SB+Nrwd1WeZFzhWVeDeSvEWugZIcq/LVTl8dxbekWMSoCg5oNORFG+c8NakuLDOyC6IGZgcLuy7c1DDhUlRZQqpMNfy+O06Lmh60L7SKnczZC+IQPfd5kOMN3zpTdT+fFGV3x2R3Xc4jQ0Yf6Ec6qOXNVZaSumd5K+ZDVG4mWQhCaIkfxSMDBw/fjm5JC6Y0UkVZvJIzSOma+lYPkY4+oJfrp0xkim7+OoAD/TRNqlmnaSpgDsTe24FK+GaILG5beUuO4i+YPob083gX8clqBx4DBkeVautKf+KYd/OIBLZdBbMls5kQ9lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RPK5Fy9ymoAfXd54NepXV37EKbZgLiZRifzt/oeWQQ=;
 b=hJNOuLouX+w4ViMIT+/gvw1sIXE6ApCReRBMg7oz7pQD4GNaoIl9F2D1IpXS2bNpFnGk2Ax/euporxRKs9Io1v1jCb+e9R0Yi+iEHCQBVAI5TxW86d573NZvEPWdWdTNVdaUYxXrFIlbM3pAEEnUMmtDiU80qEzfVDT4IBeb+og=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB8131.namprd12.prod.outlook.com (2603:10b6:806:32d::12)
 by PH7PR12MB7308.namprd12.prod.outlook.com (2603:10b6:510:20c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 20:48:02 +0000
Received: from SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46]) by SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 20:48:01 +0000
Message-ID: <65f8c473-8931-4e94-9d03-29175ade5fbd@amd.com>
Date: Fri, 20 Nov 2026 14:47:59 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] x86/apic: Add an SVSM APIC driver
To: Melody Wang <huibo.wang@amd.com>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, ardb@kernel.org
References: <cover.1793926736.git.huibo.wang@amd.com>
 <c8889d168ee6ed808cd96b461446a1e0f0114755.1793926736.git.huibo.wang@amd.com>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <c8889d168ee6ed808cd96b461446a1e0f0114755.1793926736.git.huibo.wang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:610:1f4::28) To SN7PR12MB8131.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SN7PR12MB8131:EE_|PH7PR12MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c9075e-5219-4de5-c44d-08df47479154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|22082099003|18002099003|261009223027099003|3023799007|261022075727099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|261026121527099003|261021135927099003|56012099006|10067099003|261102123227099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	oZUdogoEPLRscyYVH5jVd0NFh8Me7fd3sO6UcS3RsyilXBEpZDvTmsqVtwGFEWIWFwL4sYOlem9375PjIybUsDN6fNhHqUM4tGD4B9hAMUCeJPZ1Q67VDbAOwvEgiQ/0s8r07FfDIaQUomDhUY1AGoFv3JVIN0VXvJzd3Hg6bXUfnG69rfZGdzdsJXIEnqL0zmN53eqPCovuJcZ6wq2pOntoaKn/3bHIe6PIyKA2NTF2gnd5aBwTmmcc++VOedQWTCnPPPnK5K8CNv1N9iLR+wBpzGjpovPqEVCQaw1rB7SPzSeUaqje7U5VU8IqGr2z3a/2MFs1vpfGChJOm80/p7e8jEbTxsKcqyPoCcnLrHLjAz2kVB003qFiAWKk7pFfep32ORicJvgI0Cda9ImeZT4KaF8RonHGIje6FuP8pnrPZmxUxFFcxZJsEwV+oyv3GGly1MkGBoErzDFNRodBoImv+2pBZv7+T5tawvWV7N4hrVRX2a8AGC0jvXQ1tRb8cbIcZXMqgfgyeB3lfmRDdj+lIfWAMCMNwfhfFz5hAAWBvLzd+Voc9s75TJtloU5bvftDUZiIaKpZFdmKKTXHJqRi7q4KiUqbO+vVMfDS8QQpnDm6EZ3VTZj58wY+PoSTPlkuJvrI5UIhaawATwajeyUCN34/HCX+8CHFAitcHa4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8131.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(3023799007)(261022075727099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(261026121527099003)(261021135927099003)(56012099006)(10067099003)(261102123227099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2JaU0hvTjRBeUJZaFdmZXMrbVRrZkNjT3YzV0hSQ3RoSGthWGFCRWhlaGZh?=
 =?utf-8?B?aUJwcVRENGhIZCs4U09qNFdsRU05eHF6UVUzVThPc0JDVUtFNUt0Q3JnVFlV?=
 =?utf-8?B?U0RXRFY3eVlhVU5GaU5rNHc5Q2taMy9jM2pPbU9TQ0Y5VjU2UjVGaHhzT1Fm?=
 =?utf-8?B?MFlnV3RKTU5qQ3ZBUU8xV1R3RFNOMFVlMS8xdEthei9hWWlTZXhmV2NPa0dT?=
 =?utf-8?B?YnpYQ0lzNFVxM0hXU0srYjlIbmZFSGtpMlFTV3UvclBUVXNERCtJSVhXRmN0?=
 =?utf-8?B?aHB3akVzNTg5MXAzSXdXTkpHWXJxTytWc2I0dWd1U3JOR1QrMnVTa3h1ekdL?=
 =?utf-8?B?KzdTaGlOZ0RIM2JiMVZPR0VFWXFkVTA1b2ZHazI3cFdsTGcrMHF6bVZMelF2?=
 =?utf-8?B?MWlkN1hSVVkxNmdIMm1QdXVlQWRmTkFTSXNKMVlzYkxsTW02NkNaYW51cytl?=
 =?utf-8?B?R3JaM1lzMFpEQ1B4b0V3M1R4Y3BCbTlSRkdPV2J1a1pzOFBpNEZqRWJZOThQ?=
 =?utf-8?B?NDN6cGhramJZRGQxbjdLMVg1K29aY0VvQXdJelkzSTJPckJLRWVhaE9xOENo?=
 =?utf-8?B?Tmh5QlRmWmwxaU1XZ1JrV1JTdlJkZ3dMMWZENk53c2pxUURXc3hxQWJrcGsy?=
 =?utf-8?B?anEyR2ZWbGN3cDhGVnVRZS8weEZhc01yT0dtdE4vcEJlZnBLaEdsTlRxdEgy?=
 =?utf-8?B?RFdlR2FxZXdKWDBVcWFvcVR3TGMvemE5amVBNEVnOFl0SDZLeU1GQmlZTkRW?=
 =?utf-8?B?bUtsWnFZTFNId1EwemYrY2YrNXRIcnV0OThqMU1RVDBVOTBMZVBFaGF2WmdK?=
 =?utf-8?B?bTUyL3pRU0Y0Z1JvZkl2N2RYMldLbFdCSEIwaGtGTWxhWmFGbjM4MmpIVzFV?=
 =?utf-8?B?UXV5U2IvOGl4Z3FZcGIxQUwwTDRNMG5sRmE1ODh0NHMxamxNb3lWNk5icDVW?=
 =?utf-8?B?dDJXV1NHVHhiRFhpMnhsMS9FZUFtSlJUSEpZdE9xazQ0S3UxUWlSYm1OZ1NU?=
 =?utf-8?B?R1hFMDhQZTE3RmlNSjNXK3Y0dVFiQ2E1QTJmMTdIc3FTanNjNjNVaCtJOERR?=
 =?utf-8?B?UzBkZlYzd01zakJvaVNXYjM0M1o4b0JZNjFsOUZ0cUdSTEdCTXJ1QW5xUlY5?=
 =?utf-8?B?NW9TKzVwbEJwMjJ1Mzd4bHkyNndHMktYeVBnMENhMVp5OXVNVTNVczBycnBW?=
 =?utf-8?B?Yk9EZkVQRk82VTZDZi8vWHg0RGJQOUozdGhWOE1mNmx5Smh0S2V3MUpmVWtr?=
 =?utf-8?B?SEVsL0cvaG9RbXVIVmh3bVpLQXVDOGlhVnQ1TU82VGg3NmVHUTVyWjFGWEZi?=
 =?utf-8?B?UGRKalJLd3VZa0VQMmdxT3l0cG5Sc1k3UnJPQ2wwcXRnRUhTODVYVnVHNzdq?=
 =?utf-8?B?YVVzTlJjRkhEbWRJVGFtckRaZ3k5RUpNUElJdXBmekphdUNDTkoyQkpoQnRH?=
 =?utf-8?B?VFVlRlhaRzZPenZaUXRNTDJ1Rkk4bHhCQ3ZQUFB0M0tlSHBtT0ZWcjljNU8y?=
 =?utf-8?B?U0lVMmhEYzdENitnaml4NGE0Smt5QkFOZHRNekl2NHRuMGRKOE54YjhmeEV0?=
 =?utf-8?B?NERCMXdMWFY1TnZkaXUyTTdla1dBNFZ5MXBDTG5ZV2IwVUxDSEllK215d1B3?=
 =?utf-8?B?M2lKdFlUSmdZbHErVlVpTjgrTEc1U3o2NVpVczdUYk51T3dLdjJpNUpPY2l0?=
 =?utf-8?B?ZkhHSW0zK2VyQURyWGViSXlmRm1sOEZhMDZhODNNSndrY1phL3pWSWNScWRH?=
 =?utf-8?B?RUhJbGVBUzJqNDFVRldTNzRzU0tlUlhuQzBBdm1samkySSt4WmFndlZRNUpN?=
 =?utf-8?B?OGgweSt3dUJPSTI0UDZZL0pFUmFMZkllUWlWQVgram9odmlHN2xXVWZwZThE?=
 =?utf-8?B?MUFtSUV4SUlVM0NVU1dsdE9uOVRRbEJHbXBZa2tkTFRKK01zdnUrUWVkQVRO?=
 =?utf-8?B?d2lYbzgrZ3M3bVB5VC82Z0NoY2J0RnpBeGhWa2RnUHZYVi9UUjNWbDhvRFBD?=
 =?utf-8?B?cnZTM3JxeWt2dDRaUXhHYWZ2MWxZM3RUejBXR3VEWXVBTjJyOFpHK0xJYmJn?=
 =?utf-8?B?QmdBclhSTXFRT0dKOWxKRmFwNFRWa3JWWjQxZFREZHlGZUJJYjMxUWNPVmZ2?=
 =?utf-8?B?MHV1TnpEQyt5Y1RjY2dkbzcxc2hzRktldXJ2UCt1UlVSUjBYa0ZLc0J1ZEZD?=
 =?utf-8?B?c3VqbXJ1ZkdZTVhJemVaeDhMdWFtK1A5cXNKVzZiRXdoRHlKcEJKbGpNMm0w?=
 =?utf-8?B?dFFxK3NWbndwL0xYK0Y3NVZ6eFlQaFIvV05yVndTN21pWWhJak1rQXVMOHR0?=
 =?utf-8?Q?QN5OG3CZMYLxE9iUHK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c9075e-5219-4de5-c44d-08df47479154
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 20:48:01.7998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0cNLN020Co+UHDKM+GJTgtJvRnyxZGORZdyVYJrhZEvCvCaE4M+K1Mj3NtDUgW3IwFvRAK51qmST8F5t0StAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7308

On 11/5/26 19:25, Melody Wang wrote:
> Alternate Injection replaces hypervisor-based interrupt queuing and
> event injection in favor of guest-controlled queuing and injection. In
> order to complish that, an SVSM is used to update the guest VMSA to
> perform the required actions.
> 
> The guest uses the SVSM APIC protocol to communicate with the SVSM to
> perform selected APIC related operations instead of using standard APIC
> MSR access.
> 
> Add such a SVSM APIC driver (which implements a subset of an X2APIC),
> for the APIC emulation supported by the SVSM.
> 
> Signed-off-by: Melody Wang <huibo.wang@amd.com>
> ---
>  arch/x86/include/asm/sev-common.h  |   1 +
>  arch/x86/include/asm/sev.h         |   9 ++
>  arch/x86/kernel/apic/Makefile      |   1 +
>  arch/x86/kernel/apic/x2apic_svsm.c | 252 +++++++++++++++++++++++++++++
>  4 files changed, 263 insertions(+)
>  create mode 100644 arch/x86/kernel/apic/x2apic_svsm.c
> 
> diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev-common.h
> index 01a6e4dbe423..095fbafe8a2c 100644
> --- a/arch/x86/include/asm/sev-common.h
> +++ b/arch/x86/include/asm/sev-common.h
> @@ -209,6 +209,7 @@ struct snp_psc_desc {
>  #define GHCB_TERM_SECURE_TSC		10	/* Secure TSC initialization failed */
>  #define GHCB_TERM_SVSM_CA_REMAP_FAIL	11	/* SVSM is present but CA could not be remapped */
>  #define GHCB_TERM_SAVIC_FAIL		12	/* Secure AVIC-specific failure */
> +#define GHCB_TERM_ALT_INJ_FAIL		13	/* Alternate Injection-specific failure */
>  
>  #define GHCB_RESP_CODE(v)		((v) & GHCB_MSR_INFO_MASK)
>  
> diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> index c7ea9845351e..6496b376452f 100644
> --- a/arch/x86/include/asm/sev.h
> +++ b/arch/x86/include/asm/sev.h
> @@ -435,6 +435,13 @@ struct svsm_call {
>  #define SVSM_VTPM_QUERY			0
>  #define SVSM_VTPM_CMD			1
>  
> +#define SVSM_APIC_CALL(x)		((3ULL << 32) | (x))
> +#define SVSM_APIC_QUERY_FEATURES	0
> +#define SVSM_APIC_CONFIG_EMULATION	1
> +#define SVSM_APIC_READ_REGISTER		2
> +#define SVSM_APIC_WRITE_REGISTER	3
> +#define SVSM_APIC_CONFIG_VECTOR		4
> +
>  #ifdef CONFIG_AMD_MEM_ENCRYPT
>  
>  extern u8 snp_vmpl;
> @@ -529,6 +536,7 @@ void snp_msg_free(struct snp_msg_desc *mdesc);
>  int snp_send_guest_request(struct snp_msg_desc *mdesc, struct snp_guest_req *req);
>  
>  int snp_svsm_vtpm_send_command(u8 *buffer);
> +int svsm_perform_call_protocol(struct svsm_call *call);
>  
>  void __init snp_secure_tsc_prepare(void);
>  void __init snp_secure_tsc_init(void);
> @@ -638,6 +646,7 @@ static inline void snp_msg_free(struct snp_msg_desc *mdesc) { }
>  static inline int snp_send_guest_request(struct snp_msg_desc *mdesc,
>  					 struct snp_guest_req *req) { return -ENODEV; }
>  static inline int snp_svsm_vtpm_send_command(u8 *buffer) { return -ENODEV; }
> +static inline int svsm_perform_call_protocol(struct svsm_call *call) { return -ENODEV; }
>  static inline void __init snp_secure_tsc_prepare(void) { }
>  static inline void __init snp_secure_tsc_init(void) { }
>  static inline void sev_evict_cache(void *va, int npages) {}
> diff --git a/arch/x86/kernel/apic/Makefile b/arch/x86/kernel/apic/Makefile
> index 581db89477f9..fef51024025b 100644
> --- a/arch/x86/kernel/apic/Makefile
> +++ b/arch/x86/kernel/apic/Makefile
> @@ -19,6 +19,7 @@ ifeq ($(CONFIG_X86_64),y)
>  obj-$(CONFIG_X86_NUMACHIP)	+= apic_numachip.o
>  obj-$(CONFIG_X86_UV)		+= x2apic_uv_x.o
>  obj-$(CONFIG_AMD_SECURE_AVIC)	+= x2apic_savic.o
> +obj-$(CONFIG_AMD_ALTERNATE_INJ)	+= x2apic_svsm.o
>  obj-$(CONFIG_X86_X2APIC)	+= x2apic_phys.o
>  obj-$(CONFIG_X86_X2APIC)	+= x2apic_cluster.o
>  obj-y				+= apic_flat_64.o
> diff --git a/arch/x86/kernel/apic/x2apic_svsm.c b/arch/x86/kernel/apic/x2apic_svsm.c
> new file mode 100644
> index 000000000000..fea61b929122
> --- /dev/null
> +++ b/arch/x86/kernel/apic/x2apic_svsm.c
> @@ -0,0 +1,252 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * AMD Alternate Injection Support (SEV-SNP Guests)
> + *
> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
> + *
> + * Author: Melody Wang <huibo.wang@amd.com>
> + */
> +
> +#include <linux/cpumask.h>
> +#include <linux/cc_platform.h>
> +
> +#include <asm/apic.h>
> +#include <asm/sev.h>
> +
> +#include "local.h"
> +
> +static int svsm_apic_probe(void)
> +{
> +	if (!cc_platform_has(CC_ATTR_SNP_ALTERNATE_INJECTION)) {
> +		return 0;
> +	} else {

No need for an else here if the "if" above has a return.

> +		if (!snp_vmpl) {
> +			pr_err("Alternate Injection in VMPL0 impossible. Terminating.\n");
> +			goto terminate;
> +		}
> +	}
> +
> +	if (!x2apic_mode) {
> +		pr_err("Alternate Injection in non x2APIC mode impossible. Terminating.\n");
> +		goto terminate;
> +	}
> +
> +	pr_info("Alternate Injection SVSM APIC enabled\n");
> +
> +	return 1;
> +
> +terminate:
> +	sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);

Should you come up with individual fail codes for each of the above?

> +	return -EINVAL;
> +
> +}
> +
> +static int svsm_acpi_madt_oem_check(char *oem_id, char *oem_table_id)
> +{
> +	return x2apic_enabled() && cc_platform_has(CC_ATTR_SNP_ALTERNATE_INJECTION) && snp_vmpl;
> +}
> +
> +static void svsm_apic_msr_write(u32 reg, u32 v)
> +{
> +	u32 msr = APIC_BASE_MSR + (reg >> 4);
> +	struct svsm_call call = {};
> +	int ret;
> +
> +	switch (reg) {
> +	case APIC_TASKPRI:
> +	case APIC_EOI:
> +	case APIC_ICR:
> +	case APIC_SELF_IPI:
> +		call.rax = SVSM_APIC_CALL(SVSM_APIC_WRITE_REGISTER);
> +		call.rcx = msr;
> +		call.rdx = v;
> +
> +		ret = svsm_perform_call_protocol(&call);
> +		if (ret) {
> +			pr_err("SVSM_APIC_WRITE_REGISTER: 0x%x, error: %d\n", reg, ret);
> +			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);

Do we really want to terminate here vs just report the error?

> +		}
> +		break;
> +	default:
> +		pr_err("SVSM_APIC_WRITE_REGISTER 0x%x not supported\n", reg);
> +		break;
> +	}
> +}
> +
> +static u32 svsm_apic_msr_read(u32 reg)
> +{
> +	u32 msr = APIC_BASE_MSR + (reg >> 4);
> +	struct svsm_call call = {};
> +	int ret;
> +
> +	switch (reg) {
> +	case APIC_ID:
> +	case APIC_TASKPRI:
> +	case APIC_PROCPRI:
> +	case APIC_ISR ... APIC_ISR + 0x70:
> +	case APIC_TMR ... APIC_TMR + 0x70:
> +		if (WARN_ONCE(!IS_ALIGNED(reg, 16),
> +			      "SVSM APIC register read offset 0x%x not aligned at 16 bytes", reg))
> +			return 0;
> +		fallthrough;
> +	case APIC_IRR ... APIC_IRR + 0x70:
> +		if (WARN_ONCE(!(IS_ALIGNED(reg, 16) ||
> +				IS_ALIGNED(reg - 4, 16)),
> +			      "Misaligned APIC_IRR/ALLOWED_IRR SVSM APIC register read offset 0x%x", reg))
> +			return 0;
> +		fallthrough;
> +	case APIC_ICR:
> +		call.rax = SVSM_APIC_CALL(SVSM_APIC_READ_REGISTER);
> +		call.rcx = msr;
> +
> +		ret = svsm_perform_call_protocol(&call);
> +		if (ret) {
> +			pr_err("SVSM_APIC_READ_REGISTER: 0x%x, error: %d\n", reg, ret);
> +			sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);

Ditto here... ?

> +		}
> +		break;
> +	default:
> +		pr_err("SVSM_APIC_READ_REGISTER: 0x%x not supported\n", reg);
> +		return 0;
> +	}
> +
> +	return call.rdx_out;
> +}
> +
> +static inline void svsm_apic_msr_eoi(void)
> +{
> +	svsm_apic_msr_write(APIC_EOI, APIC_EOI_ACK);
> +}
> +
> +static u64 __svsm_apic_icr_rw(u32 low, u32 id, bool write)
> +{
> +	struct svsm_call call = {};
> +	const char *call_reg_str;
> +	unsigned int call_reg;
> +	u32 reg;
> +	int ret;
> +
> +	reg = APIC_ICR;
> +
> +	call_reg = write ? SVSM_APIC_WRITE_REGISTER
> +			 : SVSM_APIC_READ_REGISTER;
> +
> +	call_reg_str = write ? "SVSM_APIC_WRITE_REGISTER"
> +			     : "SVSM_APIC_READ_REGISTER";

You only use call_reg and call_reg_str in one place each, no need to
create variables.

> +
> +	call.rax = SVSM_APIC_CALL(call_reg);

i.e.

	call.rax = write ? SVSM_APIC_CALL(SVSM_APIC_WRITE_REGISTER)
			 : SVSM_APIC_CALL(SVSM_APIC_READ_REGISTER);

> +	call.rcx = APIC_BASE_MSR + (reg >> 4);
> +	call.rdx = ((u64)id) << 32 | low;
> +
> +	ret = svsm_perform_call_protocol(&call);
> +	if (ret) {
> +		pr_err("%s: 0x%x, error: %d\n", call_reg_str, reg, ret);
> +		sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_ALT_INJ_FAIL);
> +	}
> +
> +	return call.rdx_out;
> +}
> +
> +
> +static inline u64 svsm_apic_icr_read(void)
> +{
> +	return __svsm_apic_icr_rw(0, 0, false);
> +}
> +
> +static void svsm_apic_icr_write(u32 low, u32 id)
> +{
> +	__svsm_apic_icr_rw(low, id, true);
> +
> +}
> +
> +static void svsm_apic_send_IPI(int cpu, int vector)
> +{
> +	u32 dest = per_cpu(x86_cpu_to_apicid, cpu);
> +
> +	svsm_apic_icr_write(__prepare_ICR(0, vector, APIC_DEST_PHYSICAL), dest);
> +}
> +
> +static void __svsm_apic_send_IPI_mask(const struct cpumask *mask, int vector, int apic_dest)
> +{
> +	unsigned long query_cpu, this_cpu;
> +
> +	guard(irqsave)();
> +
> +	this_cpu = smp_processor_id();
> +	for_each_cpu(query_cpu, mask) {
> +		if (apic_dest == APIC_DEST_ALLBUT && this_cpu == query_cpu)
> +			continue;
> +
> +		svsm_apic_send_IPI(query_cpu, vector);
> +	}
> +}
> +
> +static void svsm_apic_send_IPI_mask(const struct cpumask *mask, int vector)
> +{
> +	__svsm_apic_send_IPI_mask(mask, vector, APIC_DEST_ALLINC);
> +}
> +
> +static void svsm_apic_send_IPI_mask_allbutself(const struct cpumask *mask, int vector)
> +{
> +	__svsm_apic_send_IPI_mask(mask, vector, APIC_DEST_ALLBUT);
> +}
> +
> +static void __svsm_apic_send_IPI_shorthand(int vector, u32 which)
> +{
> +	svsm_apic_icr_write(__prepare_ICR(which, vector, 0), 0);
> +}
> +
> +static void svsm_apic_send_IPI_allbutself(int vector)
> +{
> +	__svsm_apic_send_IPI_shorthand(vector, APIC_DEST_ALLBUT);
> +}
> +
> +static void svsm_apic_send_IPI_all(int vector)
> +{
> +	__svsm_apic_send_IPI_shorthand(vector, APIC_DEST_ALLINC);
> +}
> +
> +static void svsm_apic_send_IPI_self(int vector)
> +{
> +	svsm_apic_msr_write(APIC_SELF_IPI, vector);
> +}
> +
> +static u32 svsm_apic_get_apic_id(u32 id)
> +{
> +	return id;
> +}
> +
> +static struct apic svsm_apic __ro_after_init = {
> +
> +	.name				= "svsm apic",
> +	.probe				= svsm_apic_probe,
> +	.acpi_madt_oem_check		= svsm_acpi_madt_oem_check,
> +
> +	.dest_mode_logical		= false,
> +
> +	.disable_esr			= 0,
> +
> +	.cpu_present_to_apicid		= default_cpu_present_to_apicid,
> +
> +	.max_apic_id			= UINT_MAX,
> +	.x2apic_set_max_apicid		= true,
> +	.get_apic_id			= svsm_apic_get_apic_id,

Should this just use x2apic_get_apic_id ?

Thanks,
Tom

> +
> +	.calc_dest_apicid		= apic_default_calc_apicid,
> +
> +	.send_IPI			= svsm_apic_send_IPI,
> +	.send_IPI_mask			= svsm_apic_send_IPI_mask,
> +	.send_IPI_mask_allbutself	= svsm_apic_send_IPI_mask_allbutself,
> +	.send_IPI_allbutself		= svsm_apic_send_IPI_allbutself,
> +	.send_IPI_all			= svsm_apic_send_IPI_all,
> +	.send_IPI_self			= svsm_apic_send_IPI_self,
> +	.nmi_to_offline_cpu		= true,
> +
> +	.read				= svsm_apic_msr_read,
> +	.write				= svsm_apic_msr_write,
> +	.eoi				= svsm_apic_msr_eoi,
> +	.icr_read			= svsm_apic_icr_read,
> +	.icr_write			= svsm_apic_icr_write,
> +
> +};
> +apic_driver(svsm_apic);

