Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795204107;
	b=QfzJDRW5jmjmP3jVufSkVS0WW8GygDpxZE8FiIjztYz86G8VRQqNQDIRi60Rqq+FaV2y
	 WH1dSeQzMf9V4jPPD538oMgvF86SLqf2tI/IwzBFMoPlYc80vs8EY18K+VnJPofayhQAC
	 dCxBEgG8EhjWORuygiEpopWh36VCo7K69qH9K99guGClcMWRKhXDoa9CT7PGq+vEiag8a
	 +G2FtOZUADb1S6JflFrkX04A95tcZKrEpe7gmDzCtj8TSHJ3Gbp6xeV+E/7wnKpDDxQdG
	 mpIFuoLHq20z+H4hfs94Ep3v6SRUjZg77nC1cQ7ETye6B7vS9pMP97McgSisHef1//g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204107;
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
	bh=c6blh5iqp+XqRldK0j1ZrE9jN0viJk8gU5S3HIwCjIM=;
	b=1g8Phhl8h8EDtYq9AfPSb63WY6KPSpav0bIqGKc1CKOl42J/8FB/s2bBlk6EWsQsFslz
	 MqTyz44toOuzgEK+hngTYg6tJicHKY2S9aoqV/iRmTlx6sXFDao9enJA+GGuJtNNoIuNa
	 1gVJYd0KivBLLtoiZaGS/ZrLpxUNTZ4hBLC7PSOChXItO9HzOMUEw1j10D9GT96CUVGSc
	 P3GTIgxahzfXV8naoZ65ekVOtK4KipTsf9ns126SoIXyvXAWcu81ohXTQHd2euAnoV6ag
	 tLNSoa6RqsNlbpEUTpvxqNbNzm46TiVBoD+1sMY8G0fIvYsF1wRufLBkgURkHi4V4AA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VbuIdWAa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.48
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886C0606A6D0
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 886C0606A6D0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VbuIdWAa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySMtC5k4Yjxz4XTFIEpmL4moJ39JnDmUiPSF0Gp1+709lmoom+UNH7P3LBZKUqzzlTxEfTJMQUAokfO4ZklWx5/FpBcKgSFTjSVmTAmLyxTn6bLuX6IydXum1PjzTjp/vcTio98BieZfEuAC0EzsXgJRTz/cSzuIb37fhu5Qktg0Z/sBqZWv1m7c7AzcmiT2+jlcPWA3oE7LVmNkOzAgZuQn/Ca4HojO5bNNsnzO/I+1PzLDf9svjqAaP01J3CBkLJAiO+KJ8LJK+HIgcHpTBLOQt8AGmuXMKiYp7mIThXFI5HXSOqXfY+NXfuPA2mZ2I8+qQkRSkDEnNhaRa9yLtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6blh5iqp+XqRldK0j1ZrE9jN0viJk8gU5S3HIwCjIM=;
 b=FlrsKV77VCDlctG8IrD4/bTWc7GGubkPXs31+LyWDP1HxWnUlTjAAYyCz2s1QQNE1OXZ2OhSiHwSicaFmngx2wF1Cpjwnl6R3Rn9XXWjJn93kRiP1jJTvWaVsGPQi4Ea1HsRQbgE7M/a/sI+yCA1T8ugeQWs570itmeeH0T2QbScHs9nJ/KSUhs00zOqYzWAKX+hpQqVj11y8SXwCMsCWWwxSALBptuLuFsIMd9LvJ+5M9Lyf5ocBE2ukvAAuwpNABV5seSaeAsjqFHZ0p4ETnTGqYDGQa/WJrc3VVsS8CS3UcrsZJQpyR5AbnmTJ4s6IP01hR/dHSeBoMITyXnnlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6blh5iqp+XqRldK0j1ZrE9jN0viJk8gU5S3HIwCjIM=;
 b=VbuIdWAa4ubbSq5qfOJL9rvWOyL7uHdc1vpBwswqWvhL86IfcjjzDXivC3MlEnQkcTHozcWyqo46xOWWQ0dXyGzEC3pgIqV/f7O3maVewd4DT/5WaflXSda4lEzDZcl6ndNe6yGmYlJafIvVuJqFw1vpsY3rn+oT+T/AF4GFLgQM50N8dOT7qCQmte/t1Jr2r8ONlfi+LNwIkZ93AbU2eyHVw3Qx6OncEf5a2I7lg6pcS4ERy++dnCjiAmI1yGtEwdgljXhwtoAHzJXwqDzFCCU+3FAgU4pBvIVAJFveaPHAcF1sdrd9XvZsyP19IIUB5AGoLUCrucND/TQVDEU+rw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS4PR12MB033229.namprd12.prod.outlook.com (2603:10b6:8:50c::24)
 by CY8PR12MB7435.namprd12.prod.outlook.com (2603:10b6:930:51::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 19:48:21 +0000
Received: from DS4PR12MB033229.namprd12.prod.outlook.com
 ([fe80::d666:2f16:7d21:b7f0]) by DS4PR12MB033229.namprd12.prod.outlook.com
 ([fe80::d666:2f16:7d21:b7f0%4]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 19:48:21 +0000
Message-ID: <cd2b8441-e438-46e2-bc2b-9623d5d6abf2@nvidia.com>
Date: Fri, 20 Nov 2026 11:48:19 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3] arm,x86,fs/resctrl: Generic schema description Proof of
 Concept
To: Reinette Chatre <reinette.chatre@intel.com>,
 Tony Luck <tony.luck@intel.com>, Ben Horgan <ben.horgan@arm.com>,
 James Morse <james.morse@arm.com>, Dave Martin <Dave.Martin@arm.com>,
 Babu Moger <babu.moger@amd.com>, Drew Fustini <fustini@kernel.org>,
 Chen Yu <yu.c.chen@intel.com>, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Newman <peternewman@google.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <b06e1fc2-87f1-4004-8102-c8cc8928345c@intel.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <b06e1fc2-87f1-4004-8102-c8cc8928345c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0048.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::6) To DS4PR12MB033229.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS4PR12MB033229:EE_|CY8PR12MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: af411025-2190-4719-f954-08df473f3b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|261021121427099003|261026121527099003|261022105027099003|261026140227099003|261028144727099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oqMzRGtcNrjEJaVDHHFNoVClbZ2HRm6bcW+Pfb/RlkSSIoV7fJh/uJ0Sk9+RanBQyIl5EBdMlJtm3EUQrNFwq1Wx7i6tioofPCFCnyR9UePMrPxgM9531ULTKU/Am2aUR1QPDSQ+Roy8gB8sTGF/qQLqRs1n1C+y/dDIlg9dZUeYdT6t4Dsi5bdtXOmE8nglLA3BCzv1BCV8hEz7Et0N/l0QG8HpFuzyILNVpuizndAEYtARVmGVWgLMvvr3aLxj7mB5iTo6Ux2G1tAG10OhmNBm+fa+qrA+PwKMYolyqCaq/4UU1OtiUcMeHlQHnnoA3iO1sXbEgMjONyZgw5kLVxbxTX5ntrun++4aKNKt28HQ16hZ0YmPGirs62c41Gv1yq6+qN3uzZbQeevAvzdfVAgfRs6gyog4PD+a7aHp/PLcVG/CUeBU+nT9JhAF2UQxZczq1u/EqMZl3fBa+bJLyyalqDyavir42evqmzwYp+b8GlgUsybPVZ1TP1sW/VymgMiLFBXH34yzPzBgIZVLnO7DAeFf2aixqfjNWcBNyQNmbhcOycsqjVsFdBrKMAcJZ+OWxPXlbPoxQ61F3uRBGchPFUPIdi+qntHfDIs0C8P4sEEFiA8xKlDp7huq5w/whXrleWcmFjVlfP8VDNuZ8AmyfsiQDURp76c+wLP/hbs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR12MB033229.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(261021121427099003)(261026121527099003)(261022105027099003)(261026140227099003)(261028144727099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFByaU12VUQyc3l5ODdvdVg0Wk1CL2p6MmdwUkJybVJwS1hmSWszaUJqMVRG?=
 =?utf-8?B?NHRRT1RrakxZdE1ySkRHMVk1RW1UTWlrTnJzODJub0VLS2gvOEFoelUySVNm?=
 =?utf-8?B?QW9mWEk3T2dueFN2TmptUVVGdk9hT0lPOHRtdW1IeVZsWi83Mm0vWkl1eWdU?=
 =?utf-8?B?VWM0YVZidWQxRVRMSWNFKzNFOGNmS3cwaDVqSzJhNFZqd205Q04yT3lZQVhW?=
 =?utf-8?B?Y2xLMnBkSWdzaG5wMXNTM1NqT2tmMW9KVG1MWkQ0NDFNc09FQ0lwcW4wbmY3?=
 =?utf-8?B?dC9jdHg2bml5ZHRVVldpdXpHbU5qZFVZcVJOWnlBL2orelhMZEtKaVNubmdC?=
 =?utf-8?B?VFZnSTFsSEdyT1F2Mk43Ynp4a1JhalI1NWFsVnovdE5GKzQzNzB2c2hUVEMz?=
 =?utf-8?B?MkhyWStHYnNrSXorNVBWUGlGUzUzeFpjeWY5YWhhRE15ckl1bXJkN1E4OHB5?=
 =?utf-8?B?R1B2Rmo5bll0L1dLdlRjSkZ6SXJobFlEdEpZbnV6UGJNVzkwZ3Y4V2hKeDhI?=
 =?utf-8?B?NnN1QmF5TGVVa0tGVVF0UDhLOER1QWxwS3c1UVFTT1Bnck1WeFl2NCtqQ0V1?=
 =?utf-8?B?V2RhOXg2SjZOamNjK0gveVlFY0VvUkhNVUx4aVFaSng0YW91TWxVNG4wVkUw?=
 =?utf-8?B?MkhvRVFkN09TdnlURFdFNUNldCtHVWtiYWw5V3FqQVlVSGVkSWNlelNhcnBn?=
 =?utf-8?B?MW1wbFNVTTN4MUdvbmtKWnptb2o3SlhwbW8xUmdLVXZWY0tSdDIrRXdVUUJL?=
 =?utf-8?B?T0lyZEQzMlBoNHcxMTg4aFhnSW5LSWlXRzlNMEVFSGpwN3laZHNYWHpjOEFQ?=
 =?utf-8?B?SGh2WklYaUNDdDBUMlNoMUp0dmpGSjhwZzFaOFJVbEdSaHg5bEJlbDk5NTJC?=
 =?utf-8?B?eXZSNHovUmZFdTYzaGNxU1cvNFVGcCtJcGVQUEdodHNtR1IyZmRNbHZPTkRI?=
 =?utf-8?B?VEJTd1JPVWI2Nk0vbnRNaENINUovZzJLRXMvd1FLcTNSVmIwL05zeERmTWpU?=
 =?utf-8?B?YXNpZGo0RE5Gd0ljVjlDUXEreXdNL2p5ZGhiUXNxaTV1aWJxZWJINnYrWkxv?=
 =?utf-8?B?Qk1wWWVlZXBnSXpnY1hYOW9jNVdHZjhmOG1SaEczbk4zbmhXaHJNWm95dldD?=
 =?utf-8?B?YnNYZDZvTGVwTFF5WisxVUpZOGIwMWswTHkrdUpZL3lxVkRoays2aGhJTGFo?=
 =?utf-8?B?Z3E0bm56RWg2RTlwQkVVcFpFcmorSzB6SVdCR2YzcnhyblhuWFhLeVlMejhu?=
 =?utf-8?B?NkprQUVWdzRnNWlGa3ZqMk9xREovZFAvei82bkJ3YnRDRTJ3L2JpTHpOV2JR?=
 =?utf-8?B?dzBTM3NPUlJXNFM3VVRaL3pNalRHa0hNUUJwdFFTSGx5WkM1T2hJSVphMG9t?=
 =?utf-8?B?RkkyYit2Zys4K2ZUdXBaUjhVUUZUUWJ1cHZmeWpvWkFFb04wczRXd0g0T2Nq?=
 =?utf-8?B?TTY4MFZ4NmF6MHNkRWExeWw1SytPdlFYSE5abS80VDI1eHlJOUFyN1FvUkJw?=
 =?utf-8?B?K0ZOeGVhRExZUVdLQ3JsQzhhV3V6dktORnYzUGgzNjNsR3VERm5iVmM0Wi9S?=
 =?utf-8?B?SmN1d2xFNGJwZ2g2NURqMERqd1VuRjRKOWlOcGVNd1NKK0NqQ0dhMHJReHZT?=
 =?utf-8?B?RXBYbU9jajJkb0pMMitYUTA3VVJkdzAxaGxmQ2plMWx3QVY3bURvQVRYaVBR?=
 =?utf-8?B?TzFEZTdYRVJ4emV3VDArcVMxbFF0c3BiWG1KL2VCZjEzSkM2TnVNOUpuYUV0?=
 =?utf-8?B?REtpMzFZSUk1SllZb0JYVHZ6c0JXVmh2S1dPbitESnZ0aGhMVnozQnNXQkFq?=
 =?utf-8?B?cEtGOURKNEFCdUJTdmdNN3MwY3JWa2lKUlh6T2ZBb1NMa0hXRFdZdTlNOGd4?=
 =?utf-8?B?Ynd5Skc0RWtZU0pBbExURHEvZ1NIRU5NdWNtbzR3cUdUTDg5aEg4ODZsL3kr?=
 =?utf-8?B?emxvTFJxNzN3NWNiQ2ZZeTlTcW1OZE1OTno4bVFwN1JzdUV6YTNrdzM3VjB1?=
 =?utf-8?B?aGgwNGZoRTdva1N2ckc1alJjMFA2dkJjWHpwNEdOdk1wRlZCVnA3YVp3M1Ry?=
 =?utf-8?B?bHBTUSt2MzhXbG1rWXpWZWkrWjUyRXRmanYzVmNXSFp1NW5sVnUyUzUzWjQy?=
 =?utf-8?B?QWV3VTJjbS9oRUFtVHVyZUd1UldnazI3UUM5NFovTjRRREVhbm1VRTh2SWF6?=
 =?utf-8?B?RFZxYytXMG1XdHh0L3RISXJxMmxVRmdFMUN1REU3Z1JSTkR2OUF5K2t1K3lk?=
 =?utf-8?B?MmpYWHJVOGFncmxYK05pSVFVSkxQUlpzY3R3L2xtNGRzRDJZaGlnWmZkTWE4?=
 =?utf-8?B?Q2xyeU5ldnRNQ1VKejUzc2hFMUpDdVoxZ1h3OXYxS3dRQ1d5L29GQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af411025-2190-4719-f954-08df473f3b3e
X-MS-Exchange-CrossTenant-AuthSource: DS4PR12MB033229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 19:48:21.3731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tyqz2KKzsxohHMqL4DB9MGBAsGKPIyZwUL5RqRsEGRsxmKisPMpZooPkTB/N4M4Ia/u0oJ43+oZrqaaEdSrFmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7435



On 11/19/26 21:04, Reinette Chatre wrote:
> Hi Everybody,
> 
> I believe that discussions around resctrl's upcoming support for multiple
> controls are starting to settle. This RFC aims to capture all the remaining
> items in implementation as well as documentation. Please point out to me if
> there is anything I missed.
> 
> RFC v3 of this PoC can be found at:
> git://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git branch resctrl/controls_rfc_v3
> 
> Please refer to the documentation patch for an overview of the planned interface
> changes as well as user space contracts/expectations:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git/commit/?h=resctrl/controls_rfc_v3&id=95ff9ff7430095cb7264946c944c750315db73d9
> 
> Remaining opens:
> ---------------
> - Ben: I do have a question about the formula used to determine the size of
>    a scalar cache control. Please see patch changelog of:
>    https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git/commit/?h=resctrl/controls_rfc_v3&id=8695aab0997d5aa60e104374fae9701f51156c18
> - MPAM only compile tested.

Basic MPAM tests work fine.

Thanks.

-Fenghua

[SNIP]
