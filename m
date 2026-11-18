Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795010396;
	b=dCMpe03UN5tUfdwZd/7kLLk+oFlsJReKsT5s89xko/DpYQsjp0QOemfV/jV+ZS9OEmOG
	 G9g59Fo0Pyx1BjnNXNsCR25JcAQzSV5SQdCHIgksNT0w1c09lmGXQQKOJGYr/7u0MYHDT
	 kTMIwp0oIPnsc/NUseDLrJNqaykpJF2Vj3mGhBzstJTGceJOZKA1mZKc0M67MJ+VasTqQ
	 +3Hw5w7pPd1o6x8Veks+uk0Fh+CpZUYrTx/IBPXJ6S5eRs8+Fw4WHt+Qtz0nNGTRWpAJQ
	 oBchNn6Je/+7zHWvwhh4i1kZLbZpX7l8HdxWbmFF2okvFrvtNek8LbnArEXsZUNhrsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010396;
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
	bh=yQiC2+t3M+9QsTDdFaotocKNdv0UVXUU8WTPr0PnHbs=;
	b=Byqe/h+SQGE6E7CK/AzsBkPQx4exfhkmmsUfVxV6dA5tSnW6EoTABP+6eIfUx8mA9pGD
	 7Sms9YmQNfHmLn18qhUCYlU1c62ccjImf6vR9pqvpPs20npBD5lKjIr6nQtPuzbeYiO9r
	 3aJNHZviUtcF0MvPBU7npqZ1y83ytKd1QoCIsDxGqWCbux5IEtnqbpDRdWkb77XbZRmOD
	 cMQbiEV6in8LeiEW8nUWs8atGDUdQQjWWFmpN1zmO1sm4vHE/6RWtd2G1WKKgPLiTKmOX
	 aFA+oRRsZjq/ZWLez1ocqR05YNBO7PzCaGQYbfAEGtObJgy4AwvXIllOuUIHgRK+MHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yAtRFFg9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.66
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010066.outbound.protection.outlook.com [52.101.61.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29112606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29112606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yAtRFFg9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aa74kGbyZM8Y1VzJs/5IeUFJ2RXWhpO/H8HLOAwWU00DwDVegbUyOrPr8nKf82Ki0MfIH3p/wC23MaUVsG7+9rgq8TK9Jq/gjuxIGpUH3ZLUern7T133Lreiiiapc5awqe6JgRSoJdbYqfMqe5zlkEC3BG07BcCU/JnAwCuit6GYJT8VmQrVrd3ofeLHvPod3PTY9xL2xOmE2Geta8l+3fW7v4I0DGZxUDuvnaxjpvMFSF2iLOMcP+72R1zO+llWeUcDP3HDAAs5P1A0PZ++Vd7H4wXS2sjAvFm8H+HOsPMpowMhNkOsLD5Apo8uvvR18A2we3cueBEeG7yIoM55nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQiC2+t3M+9QsTDdFaotocKNdv0UVXUU8WTPr0PnHbs=;
 b=Eu63Hf1VuqgSsRzjTSN1vzTOUGwadKg7pQTT8N71Lnc9qynNDWa9pXmmAeoqLHfIj/zOL70oDyK8t48wSrI3BZrAj5u0T4+e0gQdLJHQ8MpVfVvviRjMR2afhrbNBudbIZhx8GcPnXIE/bkN+JjF43NJjIuABhrMrL5RFtJ2duXHkASh7DDiGRmGJyiXZyL4Mvm4DqFNWgqsI2W5GPHvOk8EItqENxYOY4Ip5FJgXwA8uorcckV91NcFE4iDNEKdwY9Ssg80GqnV6M4Y+6Fc5Vh0dcEMgOJawFo/6zbypLfUpSoawcoMXhlGus1mYAerGLXIML7kFKk/VhSl4fHVKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQiC2+t3M+9QsTDdFaotocKNdv0UVXUU8WTPr0PnHbs=;
 b=yAtRFFg9iEse5RJR1ic+tFlsujqtXaFdddn1rzJZOXdHF9sFVBv1dZuTHPMVKbYiEMVFBY+nkIC9+WYVqik8ZtlgQQzHva2ZmBmCTrXd5sOIv8qVra72jCiqOhIsIgQ/U6QCI5bczQtZ9ED0p9rfD+guS8ram0FKRj2tBmZnK8M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 by PH0PR12MB7864.namprd12.prod.outlook.com (2603:10b6:510:26c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 13:59:52 +0000
Received: from LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2]) by LV5PR12MB9804.namprd12.prod.outlook.com
 ([fe80::cab9:7e9a:fc29:bcb2%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 13:59:52 +0000
Message-ID: <7f62662d-937e-46ab-b607-7d70456f2b1c@amd.com>
Date: Wed, 18 Nov 2026 19:29:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: zynqmp: Put the parent node after reading buffer
 resources
To: Zhu Jun <zhujun2@cmss.chinamobile.com>, jassisinghbrar@gmail.com
Cc: michal.simek@amd.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261112071640.154439-1-zhujun2@cmss.chinamobile.com>
Content-Language: en-US
From: "T, Harini" <harini.t@amd.com>
In-Reply-To: <20261112071640.154439-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::7) To LV5PR12MB9804.namprd12.prod.outlook.com
 (2603:10b6:408:303::8)
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
X-MS-TrafficTypeDiagnostic: LV5PR12MB9804:EE_|PH0PR12MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 476914de-57cd-46a1-09a3-08df457c37dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|261026140227099003|261022105027099003|11063799006|56012099006|261021121427099003|10067099003|261102123227099003|261009223027099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XKWPFcLGitZmvlocp6lRWG48CpEV0bt3wCbbhSoXM0Jg0Yt+BvCFcjBUN5zdAU2MUuCcD5byVF3FdALzSdOTBEjSSO56wuDsmFf9L/lZVtu9afQoGHuEdGwDAuBqb4zy1ryBoSN6yteK0e2A8EHuJuZm9/RWekZblRzBPOO4M/41uqC8a9wubAdXpCeuKaZJFTuC/n4wIdPDrBmABVFo7zgZ6q4II5zM0dZ1mLjA+e1FkeEmUMSpgb5ZkieNKwGS6rn+XVz4cLVgi9+c1cBO7QMIh3hQdRoJ2cgtwK8h1eWR7L9Kz/k5eLsJZv/1ipcm4kRLkxwyc3GCsr0RIjhLC2fa/RET9sgrxH8n8UkW117qybfaF3zQ18xVfVYMAnsgXKa96VM58TmMLhABtbtSYsV7i/HnJI0xBBCVgicnDKPDlY5/fp3iXInJJk3FZ9JPSESUE5UdQ+ciXbEFrGg1aTlRHwvlKNikb4zsKXtSFFMrBildNJUbPmLpP6QSMOhjVMlWK3QYnxFfWlbwu4EX382daQ1QlYPWxKDcQckaS9S36bAHgWhJFnDMHXhsenB/xvEaJS+hk4k5KK1nXph/Y0i2jfQKTvDLi0KP6UW8eRgOF552oYsMnWj12boBEf8CzeuIO2Yx5fkwjlRdSiDxEsQUrs2sF+qUjgzPBxYiMLo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9804.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(261026140227099003)(261022105027099003)(11063799006)(56012099006)(261021121427099003)(10067099003)(261102123227099003)(261009223027099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YitFellpczRVaml6bTU4SEFnYUhTa2NSQnhlQlFudE91S2diNlZPQ3lCTm4v?=
 =?utf-8?B?MitUQ3ZLRmF3b0hKTnh6OGZXYy9JVkQzUmdQMzByc0hOMjg5NkMvK1I0d0pE?=
 =?utf-8?B?N0xONGg0TUxyY3BFYnFaK0xLN0QwOUJjLzcvdEFrYUo1Qmhtb3FhMmg2V1Z0?=
 =?utf-8?B?WHZWZUlCOFdLVmFHMjRwSCtQdlNkUFBudXpRK2xKdktSaTljN0Y1eWR2dEdM?=
 =?utf-8?B?WDZmOWJNUFFhR1ZEVDY4YU84L2dXeEt1ZEJBR1VBWkJ0QUFjc09ETUNZeWJ6?=
 =?utf-8?B?Y0s4bVVybzExTXVIWXNzbW1MS0xKYTR4dG0zTjdQNk15OEN2cE1zYlU5K2cx?=
 =?utf-8?B?TUcrT3ZoTEMwS2NqWi9QYi9jUExnd1FoblRTeDA0L2N3UGVqVk12S3RmcHhk?=
 =?utf-8?B?My9FWnhvS1ZPWnpIZ3pQMm5yTWluRjF4TnIwaElBVmlPeGgxbVZjRUtKMDhS?=
 =?utf-8?B?ZzNkSWQ3VElKZ0VZRUswM1Z1M3V5a3pOTjBDNXVFQW5oT0pYTWNFVm9CdGNP?=
 =?utf-8?B?YjRwUVRVVkhpeURzR21lNDdWYzdBNS94SjBCWGhNcHphNXhScVJFR0RuUVdt?=
 =?utf-8?B?QmxXQU1KanZGdGNrNGlQQmZ1NklXOHlqeDZNVi9pcmwyeTkzTGY2K09KZDRB?=
 =?utf-8?B?Y281bUhmTDVKSVdKSWZhTzgySFN1bno4YTYxVyt4Mk91ZmlhS1ltTk5yeU1E?=
 =?utf-8?B?VDJNRFEwRFJNRG1BbUREM2RQVkxieEJRYTVMQWVuTGNwNzBFYWFZNDJLRmlX?=
 =?utf-8?B?eE5FVTQ5d2tnOE9sZ3BpMW1FRWJMdVh5bmJOTlNwaTJiUTN3UVRGSDNHV0FU?=
 =?utf-8?B?Q2JIWllWRGNqYnVhVjQ1SUx4NUN1VFF2VE5TbmMyWFdKS254NDJkMStyd3h2?=
 =?utf-8?B?Tko5ZmFkWXVPV2Q1ZStCL1Y4Q1BrTkMrZDlzaUpGcjQ4S2dJOGxtTTltRkxz?=
 =?utf-8?B?QnZkbDRXbWxVTWFwc2Y4L1Y0aU9sM0w4eFdaemFBWDdHdVU3QUkzYjFjaHJ0?=
 =?utf-8?B?VHFoZTBqYi90SG9oVXc0ZGFlZ0hrUmNWcVNVVnRYNkFVUkFhSUM2TVlrcjA2?=
 =?utf-8?B?WmdYZ0tmaWIwRXBaSS83R1RVV0JqRlhOSkgwS2JPWG9Fd0pHTFR2ZG4yRndR?=
 =?utf-8?B?NUkzRGkwL3dXaXVKSVBaYnFpYVZVV1c4alhvaWxIWnFlVld1eExucXVENnpE?=
 =?utf-8?B?YkhDRHhHRW9NTThSTXd1UG8wRkpmUmJVOHBwMkxaUWVjTmVBczRNVWJkb1dS?=
 =?utf-8?B?eWxyc01BRStUenJuVzE2eSsrUCszUVBURG1xNzAxY3RUdkhvT0tmbXpTblJz?=
 =?utf-8?B?SS9iTXdkRCtuUzdlSXRoRjNXMlUzNjkxVFIrWlJKamxIMTM5bHhkUS9JSHIx?=
 =?utf-8?B?Z3hSbmtVZFA4d05MdHJZTHUzSFEybWtRcXp2RGZHVWtFL0xHdC9QVGd6MEk3?=
 =?utf-8?B?YXk3TCtnbXNBSnkyU1VNcXI3S2xFZDc2LzJoR3R4NXdCWlJTZEFNLzQ1bmdY?=
 =?utf-8?B?bFNWS2xKT2VxelBWdjNBbmw2d1dkeTgwOUs4U1pyOGNKMHFxNGk0SlcxTGQv?=
 =?utf-8?B?NWdtbHJaVHp1SGJaOUpNZVFES2dUTmRRRUJuMU9Vb1Q5VVpMVkV2MVJWNlgz?=
 =?utf-8?B?UzJyWURJYkg3cjJSdEV0RzFKcDFWNmp1T3VOQUd0cEs1WFlzaXdiRitCdkdO?=
 =?utf-8?B?SUdZQjlMU1JxUUxlZkVMeXZvWElIR0VKSnVCdE5MRXE0SnpzSUd0NVlyd3J1?=
 =?utf-8?B?N3JpQ201Z3Mvb0JINHp1SFZld0R4U0FjVForSWE1bGR6bEFYbC9WbnJyblFI?=
 =?utf-8?B?QVEzRE1RVXpoVGZESUd2VlFHMjExL0YzVXlaL1pkTVJJbTlReU5ZQ0NFUzRY?=
 =?utf-8?B?ZlAxMTVUK2NMY3RXNTQ3MmxHaE9pUXZKRDJLMlM3Skk5SGd3Q3NtcTFuMXpx?=
 =?utf-8?B?bkdXRTdlTTJQWGNySzRrOGljNkxmcFFJZU9SUGtWMG4zQ0gyeGZFaG1LTWVL?=
 =?utf-8?B?eTVuWmxET3lNU2tVa2l4UzE3QjVXdHF2VDRkaFpoaXAzUlQxc3NJUUh0MUFX?=
 =?utf-8?B?K2wwYkNyakw1NVNCRStjTk13WFBXUzFFeVZ2NVJZK3FQdTFsYWNOcDFoZ0p2?=
 =?utf-8?B?OUUrbHNHKzZCa1dnOWszVytkQXE2bEo0OXN3emJwU3BuUXFFZi9sdmNXOG5V?=
 =?utf-8?B?UzNUcklhaSs0c28yTXlnWXhKZElmb2MzanZ0bTZRQVR0aUVrL21Ub1NLZVMv?=
 =?utf-8?B?OVMrSzY3WExHTmxpRmI2Vngwc3MzUWdXZWtmaExkSEY0ZXNreVU3YlJrUndT?=
 =?utf-8?B?a3haSGJCYUVBZmpSWkJjdVcrQjRmWmFCaTdJemMzeW1OMVNJa3d3UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 476914de-57cd-46a1-09a3-08df457c37dc
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 13:59:52.6831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVAYE18o3Y1O5zsarJef5iRfw1j9WX6eScwAMaCCezvSkP/dxjVwYBTFaRdw550r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7864



On 11/12/2026 12:46 PM, Zhu Jun wrote:
> versal_ipi_setup() obtains a reference to the parent node to look up
> the host message buffer resource, but never releases it. Each setup
> leaks the reference, including when a subsequent buffer mapping fails.
> 
> The resource lookup copies the address and size into host_res. Drop
> the node reference immediately after that lookup.
> 
> Fixes: 0ac39d85a741 ("mailbox: zynqmp: Enable Bufferless IPI usage on Versal-based SOC's")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>   drivers/mailbox/zynqmp-ipi-mailbox.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
> index 2b81bedf0653..0c175f0b048a 100644
> --- a/drivers/mailbox/zynqmp-ipi-mailbox.c
> +++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
> @@ -696,6 +696,7 @@ static int versal_ipi_setup(struct zynqmp_ipi_mbox *ipi_mbox,
>   	mdev = &ipi_mbox->dev;
>   
>   	host_idx = zynqmp_ipi_mbox_get_buf_res(parent_node, "msg", &host_res);
> +	of_node_put(parent_node);
>   	remote_idx = zynqmp_ipi_mbox_get_buf_res(node, "msg", &remote_res);
>   
>   	/*

Reviewed-by: Harini T <harini.t@amd.com>

Thanks,
Harini T
