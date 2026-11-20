Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795194289;
	b=2f8GHPanipuCupVlJUDPK/j08cRKCNusx7Iu2/zJfpQ3RLILv66KuE+7u53XCimeOHVs
	 PITnf9/6i10yfDjuoEiqXPg/KlLw4qCabGoWxqSv/fqr0DfXc4rc/5F2AjPwE+1Pbu4aP
	 PVNnNrNzqVsTG96uMOn6Qq8+CnQgb/x2RSrmdmusGNV44ha5qgqGDJnDGbU3IW9At2f76
	 EkPqCmv7U0wNTYZvyIxXVgMHmNMYJ894715/9q1FxzhO3MEdyzx3cFj+JVSiGStnYvL/S
	 O/H7XOI1iSOD04kZrxwaupYKdcCwIS9TOBZNC06hM6fcVXrFsxmU8wj2jFg1A1h+eTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194289;
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
	bh=Bq86XAvs2+phyfX4BjM1O9lKlCu3mmnQfkRsnPcX/kk=;
	b=moQTEGNyhF4YOQVKiYNlN6JpsRjeWFHSni5gPMu28ayjCPyWByCLPPNGKx7FBVRIpHeV
	 AtJ/DIzQjZHEOJdjLwBVRFsK/T9wj+51IY0KC0u2LzCw7l+2Yk7HiJUpPymC7Y4C3qVSb
	 GAF09POi/PtFtsglVRrdT+azsrro2FQGF343Q0pmBfwVzkUXXiQ46Zp/02qBrBDvfNRLZ
	 vJRmtEawD1N9vG7qEyXSvLcDJoIHY0fajR00shTL0E0X1rpm4WLXf8iZTaVieIoV8eA0J
	 VaHaNKJxwdBni30jIMBInYCpTuhtXH6TzVe6IXY0Qp052ttTrLK5pWJYqh4Nv9mNV5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=JL1mlXx4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.39
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012039.outbound.protection.outlook.com [40.93.195.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDC9606A332
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBDC9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=JL1mlXx4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9vLzjAk+5YNbtJB+KijalsyS6dnyN3aRO5twuEhrUb9qKqAXAFHDmajdxCeZyCa2xP+BWxxVZ9gzVaA13f8H1OyiwE7zLkugB2WDSlmAwLhNQ3TydZefds0pHRcLTbOa+Ax6BKZZwQgtVUgHfxHaPKtwBuMdAfOxoBbpOllQun/DOWUCmaImFL+Qwdf8IG78kha4yi+vXliAeuOY6ChxHIigWtinlVMGpAZZO58/bhKj3Amg2Lzc81g/aiSEnM+DlMwHH5DSRHQbgAwgIDeazIRtji+xeXYTA9MA2EArFDjukPaY1SLZIicTSvtvgezPQWICoXkvxCM27t3mLdoLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bq86XAvs2+phyfX4BjM1O9lKlCu3mmnQfkRsnPcX/kk=;
 b=ps//BQDrI6CAtrcjCbvvu+xITD0YU+AOKtNxGrGPJsTW2oCs519GM5tFx/BUbTgFTadQptLwXLSf3XxFOamQsAv5g7y3UEsiSJ2t4Gh5gYGAwoUYsia6KqAG89xTOXpaihx/T6YmJEv0NPr5pprV7af7q0S2ZaQfrKKE0cXDffLJcsvGbZ3Xgtab8G3qXZ365iTMQju35AARVoiUCxJt7sTNRTYOMa6xU++Dmi6fZ6ZYidUEwIR0/FOh/aMLG8D9W4++gjihn1onJJ3dn7EFFVMZG4ROAc8eu/hVUjgH1KMtAr4X2kvv5HCShfNMk2tEzKFtKZ5kqzkw1KEjJUKL0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bq86XAvs2+phyfX4BjM1O9lKlCu3mmnQfkRsnPcX/kk=;
 b=JL1mlXx45Iwd+zaIFLoRZdjdmKS8RveXYsqvQbyCKpWjozj4//cSuF38wjtCM3SQo5Q1HaT4d6qLTRY2Dvy71vDUEGSU5Gs5sNz0iMyzX6yn2JlSva7lRmfQ2595o1pcyykk/KdsHLhbY8AmT8VDtCXaRce9hqjBrbwQUOSdqQ0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB8131.namprd12.prod.outlook.com (2603:10b6:806:32d::12)
 by CHBPR12MB492794.namprd12.prod.outlook.com (2603:10b6:610:36a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 17:04:46 +0000
Received: from SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46]) by SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46%6]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 17:04:46 +0000
Message-ID: <fa77ff92-ff94-43c0-966f-3ef9bbce95cb@amd.com>
Date: Fri, 20 Nov 2026 11:04:43 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] x86/sev: Add support for Alternate Injection
To: Melody Wang <huibo.wang@amd.com>, x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, ardb@kernel.org
References: <cover.1793926736.git.huibo.wang@amd.com>
 <53a087641c5755da7490f687652af3d07a0fafb8.1793926736.git.huibo.wang@amd.com>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <53a087641c5755da7490f687652af3d07a0fafb8.1793926736.git.huibo.wang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0319.namprd03.prod.outlook.com
 (2603:10b6:610:118::32) To SN7PR12MB8131.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SN7PR12MB8131:EE_|CHBPR12MB492794:EE_
X-MS-Office365-Filtering-Correlation-Id: 3590d56d-a9d4-49c0-ffdf-08df472860d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|22082099003|18002099003|11063799006|4143699003|261022105027099003|261028144727099003|261021123027099003|261026140227099003|261026121527099003|56012099006|10067099003|261009223027099003|261021121427099003|261022075727099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	ODFbSe+2j/apXBCYsjXBNP+VE+V66WqBZiKmMty6Bvq/gKy0cqtJjs7IA3JMT4hpEBNOy+qxvuAiawYUNcG8ytUz1O9Gelq6jP4hGWgya6HTpRKW1YwQ1U1P5leAQ238Bmf8CmNUoAb4jVd3jejc4nXsIHy8BC0l6W+bp40JmS0hMRiq1WR9iadp/HuU53fAnoME2S8OJxD5qTkyx04z/FlPwgjmyQMhVFAfZrp1VZB7HcMYTyro0Ea5+5HXXHrHM2EmzLZMmDk6a+7p2v9iCty2QZG67rgF9w5njmY4Z0BFzkL4jLRNo8tAz6oncBqDt8XQt2Gz+v6ufbaj2m28OnQaueqUFCaAmrJXj9GZ+meXHb7dtrnEAIYdYkrFLazOR4x3o81ELoxHiEEC8FNWkQmYtFCuiHVDLUjaIMMI7EIDILawLJ9hIrs7+xoWsiK4bEcP1r2o+c0opRkrnmdFeU18FIktJIPeuhOIyXPkHd9/7ccYpp9+N8VVm35xrgdveOd1gm7vuQbfhPNyHhxGtZTEBowZT+tbTKdI/JVLRDB8fSUF1ggwyRNsr56Tkq+OAMJep7vsadHfWzCBe3qgpyncr9Dy4jIE/2ZX13f2G8hVROd3/ZzGrwi2T1JJA0PGxsO4FseB65oFzbgdKST7MQpbJh+LnSA4C+ooFMsy5PY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8131.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(261022105027099003)(261028144727099003)(261021123027099003)(261026140227099003)(261026121527099003)(56012099006)(10067099003)(261009223027099003)(261021121427099003)(261022075727099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzE2M05MWmRLQnJHS3pERVNLdkZTY0pLZTUxaFp0aEZJUzRIaWNLYlJyQkpm?=
 =?utf-8?B?VmZpRE9FRHFheHlBSXQyYTM3UkNqSmhzZ29LeVhHUk1HRmlmcHc4L1RsWjVz?=
 =?utf-8?B?OGZUVjBtUDFhT2ZwWExXWFBtUVh3ZnRDWXlZdGI0cDZsTU82eWxPclBoV3Qr?=
 =?utf-8?B?N1M5TU9QdlE3TDRnYUIxeDZXWjNzQ3cwbHBpL0plcXVOckFrdHhLc1B1SDZj?=
 =?utf-8?B?VVZpOURWM0ZRU01IL1pWcUh0d0t1SEx1YjFBa3BhWUFmUEdTdXpQWC9DYW1T?=
 =?utf-8?B?ZzZ2cEtGcnVaOXVoY3g4czZ3Y1NINy9TcDRiZ3lNQ2dmSUYyYTdmRzhKSzF1?=
 =?utf-8?B?czVHdDg0NkNKb0xYVUFtVGtGMzZDQU14NE4vU1I1VEhLTEZrOENpbGNTQlFV?=
 =?utf-8?B?WmdMWlRORTVvV0ZmWklrakRmOVRIQnRsQmxOVWVIOGF4d1orVzlrS1QvMU50?=
 =?utf-8?B?QnVtVFl6Nis4RXBBc3lCREFsdnJMOU8rMGgycDg4R3d1TGE1UEJ3WjczUEpw?=
 =?utf-8?B?Y1hIZGJnNGEzVWh6VE1qT0s1K0lmUTd4MXNySm5uTVlNa0tWWUJlaloybURN?=
 =?utf-8?B?QTVGQkVOZUFZU1hDMHVKNlhaN1YrT2xtRDIrblhNVXhLSVc2eTVvWU0yU2Zy?=
 =?utf-8?B?QXZKbVY0R0d2eXdRVWIwOGV5bzhOL3Bsa1JoREU5OE81VTUzdXQ0TWFocVZ6?=
 =?utf-8?B?b09SMEl0TS9DWitmM2ZZWllGOTRsaXhNUzJkQTBLM1MyOVl2L2Jpck5SZkNx?=
 =?utf-8?B?a3BsckNxZC9nb0ZXelBIeDAyVEc5a3l2eCtCL3U2SEZhY2p0NlZ6d0xGMzJi?=
 =?utf-8?B?anU2Q2tzckEvM1hGa3BIRXhORkxtTjh1SjlGdno4cys5SUZHeG1WZWFOTTBN?=
 =?utf-8?B?NXRYSnc4UkEyNHBEZm0yNWJOSHRGaE1meXQwb3pxQlVtbjVBdTBlald5R1Qx?=
 =?utf-8?B?c2ZCN2NKSHplRkZZUlQ0ZXlVR0RCNHRhMTZISDdUNGNNVXpBZHUvTXJmMzJo?=
 =?utf-8?B?WkNYeDMyclB4R1NLQUxJdVVIZXBDdS9HQ09TTm0wMGZleDdUNU9JeFd2aGNm?=
 =?utf-8?B?bzIvUmE5MDJOakFCWkJHQU5Id1B3bFRmekNobEZVMmJXRlNmL2h5S1hwWVVw?=
 =?utf-8?B?SmttemV6OURhWUkrcC9BSVYwSFN3NzU5cEdUazdpR0piQXNFT3JiV1Excm9D?=
 =?utf-8?B?VVp2K1J4c2plNDVYcGFYOC95V3JwbUpjQXpkaWl4Q3ljUGRqTittT3lDWFJu?=
 =?utf-8?B?dzlIejdrcnJqY0d4VWxhYjB6dUFYZlBMUlg0ZnZlVmFhU2s5eE1adVpjQUhF?=
 =?utf-8?B?cm5EaGJ0YjgzQXlTUnJnN3JWakkzdWJTVWVZeldRdGhYL1dsUzk0bUx2eVhr?=
 =?utf-8?B?Y2RSUHdWSjRWcUJvOXp3Q2kxS1JEMld3aWM5SGlaM0pmblFLQ2JFeDF3ZzB1?=
 =?utf-8?B?M2dBRng5ZUllbEIxZzFhSWpEL3lpc25kb3JrczRkZ0tUTUJtOG1qTFNqY2JO?=
 =?utf-8?B?Ykl1NUtkNXpEVTg4UkR6TjRvb0xhTzk0d1pYUS9yRXpkZmZKYWdIMVRPdWRD?=
 =?utf-8?B?K1BsSENUbk5menBCS01TRXp1M05hM3lyaURDNUZpSzBDREVKRVdxUGgxZENI?=
 =?utf-8?B?UG1weU9YUDZ4YzVDOUJRbHYrdVhsMTU1RU5tRHpRbXd2eFlGZ21sN0M5Rzc3?=
 =?utf-8?B?QzdwZFU5dW5ObUh6aDh2Z0NLQm1kUXdiNlhRSnNCdGJFZE5RNzE1TVh2WDl1?=
 =?utf-8?B?Z1IxelNYRGE0d3BoK2h1cmFzcUkxWXBiUXFDalVnMWU3eCtKQ0t3MzFtakdy?=
 =?utf-8?B?NlFtTVBuMURFNlRIWFZndUo4TXJuZzVrdHVDa2wzOUNweWR4STdNYXJ6dDky?=
 =?utf-8?B?RS9BaFFtN01UdFJnaGdadkNjYnVscnVBUFJHbUVnMXZ3YStzMk05eVB2RXZp?=
 =?utf-8?B?Nm5DcnB6RlZ6dXFMQ2JPY1NtaHBNaE1OSnFNdHlGSi8zd2dvSGlXYS9Qcnlx?=
 =?utf-8?B?SnBRUVA5dC96bTdmbWVHcXA3NC9mWWFnVUxTdzRJY0Vjck41ODMwMDJIdFdO?=
 =?utf-8?B?QUxsYnpqZHdzZlNteldJVlpLN3F1YzFneWt1U29XSnRmbTFVZE8xRWIwck1n?=
 =?utf-8?B?bkFGUUJOYmFYbHV1TVVwMWpXUFJlNkpmc2lFL1VRemkwR3RLTUNGK0dxazNa?=
 =?utf-8?B?OWRjQUVMMjZCajVHWEo5SGhnWXhCK2RoKzhqSEIwSXFXWElLY2ZGblNwVHZs?=
 =?utf-8?B?aGFoMHhSOEZteDhMdTE3UGMvUlJ1Y28wQ3lLM0FiQVJOZkpJRWZyNXN3ZmtP?=
 =?utf-8?Q?R9N4obmV1/nZtfjHq2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3590d56d-a9d4-49c0-ffdf-08df472860d8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:04:46.0944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJpwpcP2VIUmWBWI7pb6uq3zCSyI0dt7Etw9c6RU1k8xvF3ZT5DGvtSr3JdLZw5Z8DHmTlS2Ujp95TUurCWihw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB492794

On 11/5/26 19:25, Melody Wang wrote:
> The Alternate Injection feature is a method to protect a SNP guest from
> malicious injection attacks. It allows the guest to control the
> interrupt injection.
> 
> When this feature is enabled, interrupts are injected with the help of
> an agent called a Secure VM Service Module (SVSM) which executes in the
> security realm of the guest and uses Restricted Injection as the sole
> method to receive interrupts from the hypervisor.
> 
> Add support for Alternate Injection.

This doesn't really add support for Alternate Injection. You're adding a
config option and changing the existing bit name, which arguably should be
two separate patches.

Also, the config option doesn't get used anywhere, yet. Just wondering if
it should be created when used (ditto for the
CC_ATTR_SNP_ALTERNATE_INJECTION attribute).

Thanks,
Tom

> 
> Signed-off-by: Melody Wang <huibo.wang@amd.com>
> ---
>  arch/x86/Kconfig                       | 14 ++++++++++++++
>  arch/x86/boot/compressed/sev.c         |  2 +-
>  arch/x86/coco/core.c                   |  3 +++
>  arch/x86/coco/sev/core.c               |  2 +-
>  arch/x86/include/asm/msr-index.h       |  4 ++--
>  include/linux/cc_platform.h            |  8 ++++++++
>  tools/arch/x86/include/asm/msr-index.h |  4 ++--
>  7 files changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 58dce0b66179..d1f02ff74adb 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -494,6 +494,20 @@ config AMD_SECURE_AVIC
>  
>  	  If you don't know what to do here, say N.
>  
> +config AMD_ALTERNATE_INJ
> +	bool "Support Alternate Injection"
> +	depends on X86_X2APIC && AMD_MEM_ENCRYPT
> +	help
> +	  Enable AMD Alternate Injection support for SNP guests.
> +
> +	  The Alternate Injection feature of SEV-SNP enhances the security of
> +	  a confidential VM by preventing the untrusted host from presenting
> +	  unexpected interrupts or exceptions, while still preserving the
> +	  standard interrupt dispatch semantics inherent to the x86
> +	  architecture.
> +
> +	  If you don't know what to do here, say N.
> +
>  config X86_POSTED_MSI
>  	bool "Enable MSI and MSI-x delivery by posted interrupts"
>  	depends on X86_64 && IRQ_REMAP
> diff --git a/arch/x86/boot/compressed/sev.c b/arch/x86/boot/compressed/sev.c
> index c6512f2ea31e..fc2029746c50 100644
> --- a/arch/x86/boot/compressed/sev.c
> +++ b/arch/x86/boot/compressed/sev.c
> @@ -179,7 +179,7 @@ bool sev_es_check_ghcb_fault(unsigned long address)
>  #define SNP_FEATURES_IMPL_REQ	(MSR_AMD64_SNP_VTOM |			\
>  				 MSR_AMD64_SNP_REFLECT_VC |		\
>  				 MSR_AMD64_SNP_RESTRICTED_INJ |		\
> -				 MSR_AMD64_SNP_ALT_INJ |		\
> +				 MSR_AMD64_SNP_ALTERNATE_INJ |		\
>  				 MSR_AMD64_SNP_DEBUG_SWAP |		\
>  				 MSR_AMD64_SNP_VMPL_SSS |		\
>  				 MSR_AMD64_SNP_SECURE_TSC |		\
> diff --git a/arch/x86/coco/core.c b/arch/x86/coco/core.c
> index 989ca9f72ba3..aabda3ddc0e2 100644
> --- a/arch/x86/coco/core.c
> +++ b/arch/x86/coco/core.c
> @@ -107,6 +107,9 @@ static bool noinstr amd_cc_platform_has(enum cc_attr attr)
>  	case CC_ATTR_SNP_SECURE_AVIC:
>  		return sev_status & MSR_AMD64_SNP_SECURE_AVIC;
>  
> +	case CC_ATTR_SNP_ALTERNATE_INJECTION:
> +		return sev_status & MSR_AMD64_SNP_ALTERNATE_INJ;
> +
>  	default:
>  		return false;
>  	}
> diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
> index eb2e853e950a..900a7ff8b639 100644
> --- a/arch/x86/coco/sev/core.c
> +++ b/arch/x86/coco/sev/core.c
> @@ -78,7 +78,7 @@ static const char * const sev_status_feat_names[] = {
>  	[MSR_AMD64_SNP_VTOM_BIT]		= "vTom",
>  	[MSR_AMD64_SNP_REFLECT_VC_BIT]		= "ReflectVC",
>  	[MSR_AMD64_SNP_RESTRICTED_INJ_BIT]	= "RI",
> -	[MSR_AMD64_SNP_ALT_INJ_BIT]		= "AI",
> +	[MSR_AMD64_SNP_ALTERNATE_INJ_BIT]	= "AI",
>  	[MSR_AMD64_SNP_DEBUG_SWAP_BIT]		= "DebugSwap",
>  	[MSR_AMD64_SNP_PREVENT_HOST_IBS_BIT]	= "NoHostIBS",
>  	[MSR_AMD64_SNP_BTB_ISOLATION_BIT]	= "BTBIsol",
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
> index c0914829a925..d6aede40fcdd 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -730,8 +730,8 @@
>  #define MSR_AMD64_SNP_REFLECT_VC	BIT_ULL(MSR_AMD64_SNP_REFLECT_VC_BIT)
>  #define MSR_AMD64_SNP_RESTRICTED_INJ_BIT 5
>  #define MSR_AMD64_SNP_RESTRICTED_INJ	BIT_ULL(MSR_AMD64_SNP_RESTRICTED_INJ_BIT)
> -#define MSR_AMD64_SNP_ALT_INJ_BIT	6
> -#define MSR_AMD64_SNP_ALT_INJ		BIT_ULL(MSR_AMD64_SNP_ALT_INJ_BIT)
> +#define MSR_AMD64_SNP_ALTERNATE_INJ_BIT	6
> +#define MSR_AMD64_SNP_ALTERNATE_INJ	BIT_ULL(MSR_AMD64_SNP_ALTERNATE_INJ_BIT)
>  #define MSR_AMD64_SNP_DEBUG_SWAP_BIT	7
>  #define MSR_AMD64_SNP_DEBUG_SWAP	BIT_ULL(MSR_AMD64_SNP_DEBUG_SWAP_BIT)
>  #define MSR_AMD64_SNP_PREVENT_HOST_IBS_BIT 8
> diff --git a/include/linux/cc_platform.h b/include/linux/cc_platform.h
> index 559353ad64ac..80d9f1de2ae8 100644
> --- a/include/linux/cc_platform.h
> +++ b/include/linux/cc_platform.h
> @@ -104,6 +104,14 @@ enum cc_attr {
>  	 * to run SEV-SNP guests with full Secure AVIC capabilities.
>  	 */
>  	CC_ATTR_SNP_SECURE_AVIC,
> +
> +	/**
> +	 * @CC_ATTR_SNP_ALTERNATE_INJECTION: AMD Alternate Injection enabled.
> +	 *
> +	 * A Secure VM Service Module (SVSM) has started the guest with
> +	 * Alternate Injection enabled.
> +	 */
> +	CC_ATTR_SNP_ALTERNATE_INJECTION,
>  };
>  
>  #ifdef CONFIG_ARCH_HAS_CC_PLATFORM
> diff --git a/tools/arch/x86/include/asm/msr-index.h b/tools/arch/x86/include/asm/msr-index.h
> index 9c26d4075c5f..0c26cdbfa8ff 100644
> --- a/tools/arch/x86/include/asm/msr-index.h
> +++ b/tools/arch/x86/include/asm/msr-index.h
> @@ -728,8 +728,8 @@
>  #define MSR_AMD64_SNP_REFLECT_VC	BIT_ULL(MSR_AMD64_SNP_REFLECT_VC_BIT)
>  #define MSR_AMD64_SNP_RESTRICTED_INJ_BIT 5
>  #define MSR_AMD64_SNP_RESTRICTED_INJ	BIT_ULL(MSR_AMD64_SNP_RESTRICTED_INJ_BIT)
> -#define MSR_AMD64_SNP_ALT_INJ_BIT	6
> -#define MSR_AMD64_SNP_ALT_INJ		BIT_ULL(MSR_AMD64_SNP_ALT_INJ_BIT)
> +#define MSR_AMD64_SNP_ALTERNATE_INJ_BIT	6
> +#define MSR_AMD64_SNP_ALTERNATE_INJ	BIT_ULL(MSR_AMD64_SNP_ALTERNATE_INJ_BIT)
>  #define MSR_AMD64_SNP_DEBUG_SWAP_BIT	7
>  #define MSR_AMD64_SNP_DEBUG_SWAP	BIT_ULL(MSR_AMD64_SNP_DEBUG_SWAP_BIT)
>  #define MSR_AMD64_SNP_PREVENT_HOST_IBS_BIT 8

