Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794952510;
	b=YcjRweJCRP6r6ccbS5B0Nmrjt4lShp4jqQGcUzpR1tQ6Ktr1IIAdYnR9YFz2fFoayL8A
	 HaNy8uNO7EFyliRM8d5XapJHQWMrkQoe35UIkOnOFdWJaSDvKZPRAxG+sqAz2HQe1ewuy
	 W4EE+zuS7cmdrdFtLOjrgtqVo4jk8Gg7ntW+j2IDp2EC2Q9frCdnSoJ9WkOfhgT6/xAlX
	 BQ+AxqndDNyKTeeUA8sx4H1+7VB1h7ieflvyUBkTqUwymDukJEfV9OWvodzgXJIoq3HSk
	 8CXGu0vuym/9xNUo4OT5ToGskPVaviCi61ypeBcWTGac2AUwGq9CxvaYb7Gki9CUvIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952510;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=mW04H9HayYKKWo49PA9s/px1EZWSYQhj7RcnC+xFWqs=;
	b=e15vRUauCI1lzB4zqsPWeGRr/KeU6rfcyV4bfcg40j0Dee6TDTvez0esnyniMmzkhfQY
	 xVQEngIeP2TKDFjCswrmzmmPoQL9buE2xylmaN7dLJqd6TI7sL+/H9gs1PoKJ3utyf6bA
	 jqKpPskHZ9XqAa6GvS3i1bFJLJ9U4hjcumblxY71F8jLTHPLd4TNCPr2SLdGpUV7EUkpy
	 4arPqqmIl214o8L0s0cyYfrAlr/qDmJi1WA730UAJSWnq7Q2P6dcDI0mwatqW2cJlI5A5
	 kdGMhSmqyhEqGjDpodtjWOf0eMyiqBY+BR5CQA5m0n0SP00vr9YdKkVeVZ6v/3iakpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tSzymhDp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.16
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011016.outbound.protection.outlook.com [52.101.62.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B491606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B491606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=tSzymhDp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WADjP2n3QxVz+8HksXjPy985jv1Ckhvpkl4BhNruvUsIIoLoZimDJs0szly6bI84wGbCcd+GO5WfzVQQMDC1qv6YBBEnydsl2A+FdnaIU9LT6aMdKhToQZU1G9411eBsff51arYyEMEWOvy2ssQZD+Ck1GPysJW37toUp7DbyrCm+4r8yoH5y7L5vBdp7sx4QvxFFkkcithCJfsUGMUk+ygLbeK/ZEVEuZmOvbDWKDJLemoqJnPqAkZjxMquAAGIHDh1ezpzxFIOuYwzD/7R9CPuc1m857i9CHYhhKXyi/ONiBbX2Xw0Yh3OtPu6dHCF0Pj5prR+/8T+Hjc/kmbZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mW04H9HayYKKWo49PA9s/px1EZWSYQhj7RcnC+xFWqs=;
 b=icBCdmTWht6WXEeK8ybpodMcuoyDihnVevFEUYPerJeH2or7WUkSig9l8GTryxDRJuIX7e4e0qmcfwENclslZYosIzG5R37GjNHDa8s099THxwS2MjBEQJZi6gPwHGGanPNj/RzVOVua3Jt3Hp18Bn3YC/uToqebCosAWzJe3ErE4GGFWr4vvT5Qou6+Uh80g2nGK82Q82KkwcGVqTzxDvEX730FRR4I/Dla++c8+YBcgtXWaAEGhH1Rq8clrXkWCbRlFxMxdchLv8hUGZOR8//QCU+E3mq3+90E50gQPsyVH2Rw9pN8dRTn3WbqsjkDKdI4E/RLKygrZHd6c0xGpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mW04H9HayYKKWo49PA9s/px1EZWSYQhj7RcnC+xFWqs=;
 b=tSzymhDpGnwdn4rAYWXBfLhdG+sEk0foGAV7JjR0znZL/Mch8QX6jWZdGfJizxZrfMU3Bib7UKerkGGWg4iSlEsFciGnWTCbnqo9g7l/96QjzOZKAIzwoBue3ZaYiD48TRMIuO/W0WKv15LphcqzsEJ+4x+i6C5DEiv4lcQj344=
Received: from CH2PR19CA0024.namprd19.prod.outlook.com (2603:10b6:610:4d::34)
 by MW4PR12MB7483.namprd12.prod.outlook.com (2603:10b6:303:212::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 21:54:54 +0000
Received: from DM3PEPF000265BD.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::41) by CH2PR19CA0024.outlook.office365.com
 (2603:10b6:610:4d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 21:54:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DM3PEPF000265BD.mail.protection.outlook.com (10.167.23.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 21:54:54 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 15:54:54 -0600
Received: from [172.19.68.164] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 15:54:53 -0600
Message-ID: <d0f66e86-e5e1-4882-8c4c-ba403380892a@amd.com>
Date: Tue, 17 Nov 2026 13:54:48 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] accel/amdxdna: Abort jobs when the firmware
 context is gone
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
	<quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
	<mario.limonciello@amd.com>, <karol.wachowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <sonal.santan@amd.com>
References: <20261117212733.172074-1-lizhi.hou@amd.com>
 <20261117212733.172074-2-lizhi.hou@amd.com>
Content-Language: en-US
From: Max Zhen <max.zhen@amd.com>
In-Reply-To: <20261117212733.172074-2-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265BD:EE_|MW4PR12MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d056d9-3fd2-4acc-aab8-08df44f569f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|56012099006|261021121427099003|261022105027099003|4143699003|11063799006|10067099003|261026140227099003|261022075727099003|261028144727099003|261102123227099003|261021123027099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	GC4kr3+qSuWKEWrVGsBGDLM+BBrCGwDOywiyrEk2O+WgG5VHm5dpCbKzMshiDkJaxqMda3V9q+PtBSLhCtWZDR/0xbPUNFZwhlsa+pvsizGepZUPPARCblF/jHhhnbg10HR4LFAQDNi1+ptWU/6ZtBNUAtwhzam2A5xhVe35KGidEowEn7RkVOz9JbT1M2Bn+6bOjXsK0lrCEeOMegxOO+bwFivh9bRXo2hLX5/GJAAQJTLaRCbLoWrMPJPjXRhjn+48gKNiVuAgPewRwsfgzd1/B3YayURYvY3+wNpJoQ+hNWC3W1BriaKKcCWivFu3eDfBGaYfOQGuk11WdlHtQ4cK/2gxU6Zn+qLDYh+yBvB9vtWtl0tvfKRBy12CfreIMi4S0vUK4IsS+Y4qJIobeKnwRgR75MSEsG8+0lnK+KJm+ir89blR5ZUTsDeOb+1WbFVeTxCbdz2GrDp6tbOGZQm0YxgRgLC8yT9PJMcm/y57fSKmroJnc/CEIDA8sdoBwr5rOBqgowtVL7MEaf6T0iG3RYUmUHuL+hRgnpewPmFy/OGZw1Yr3YTC57Gn7s3947Dt/+fWszE9NTcfScicblC97KEYm+Hn5p564sLgKJxEwYV82EbtMqaDZntu2IEFHaPQSx/96wT/1jNAkW8cTi/6d0+KayZuQcr+mUntiUQvNoKvkzxYIDMEMHNEVjxvbNNF3nT7Mvj+yHZZFvzQWg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(56012099006)(261021121427099003)(261022105027099003)(4143699003)(11063799006)(10067099003)(261026140227099003)(261022075727099003)(261028144727099003)(261102123227099003)(261021123027099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hZy68C7lWctkBBvW554SgyGrMz/5cQZ/pkZ0MLBcZkgo6ZTQ4nn09Iu0S4RFUBPknlX9TzNxzMOZvEmpZ6oJMPareoTbExxiopodzwZwQWHlpe2NJz7w3YSSptpgku+ymdbShK3qkQSoVB1T6qlT3GOIpNCL8z41mDhQdJPbgC/thj5NEaGxRe6cffFuj3aXLB5PtwCAcWSodsc8zKbHNW7Ib6PoCXeHCB42MfzqQuf1YswPbMEirYmq0qrLpSKZxe9ZqoY5cVgVpTPagVdgnm5iP30PsstIqysEd08RmCA1fJdUp2UIdoWbd9WtXFEorI9AKNkqwuBM/ZS3m9Y2Wz3/S52H/KEiWN3+r3shLcCkiKV7HmvqshhTePK0myhhYJXNZHcSBkcCSpEm7r3oAcsNe1Y79OiQXMszzjFRnH2WCj/pGepPA6LMEwPPZqzd
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 21:54:54.4375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d056d9-3fd2-4acc-aab8-08df44f569f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3PEPF000265BD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7483



On 11/17/2026 Tue 13:27, Lizhi Hou wrote:
> aie2_sched_job_run() returned NULL when the firmware context is gone
> (mbox_chann pointer is NULL). The DRM scheduler treats a NULL return as
> a job that completed without an error.
> 
> Return ERR_PTR(-ECANCELED) so the error is recorded on the fence, and mark
> the command BO aborted.
> 
> Fixes: 6b13cb8f48a4 ("accel/amdxdna: Fix runtime suspend deadlock when there is pending job")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Max Zhen <max.zhen@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 32458d05635f9..c42ea1b4e08d2 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -404,8 +404,18 @@ aie2_sched_job_run(struct drm_sched_job *sched_job)
>   	trace_xdna_job(sched_job, hwctx->name, "job run",
>   		       job->seq, job->drv_cmd ? job->drv_cmd->opcode : DEFAULT_IO);
>   
> -	if (!hwctx->priv->mbox_chann)
> -		return NULL;
> +	/*
> +	 * The firmware context is gone, but the scheduler keeps draining the
> +	 * entity, for example from drm_sched_entity_destroy(). Returning NULL
> +	 * would make the DRM scheduler signal the job fence without an error
> +	 * and user space would see the command as successfully completed.
> +	 * Abort the job instead. Driver internal commands have no command BO.
> +	 */
> +	if (!hwctx->priv->mbox_chann) {
> +		if (cmd_abo)
> +			amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
> +		return ERR_PTR(-ECANCELED);
> +	}
>   
>   	if (!mmget_not_zero(job->mm))
>   		return ERR_PTR(-ESRCH);

