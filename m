Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794948899;
	b=2ougeJDu6LEId/4GBVR1fmu0qc9AJd73rsFsnYR/mScoU8fpCLYgHwFmrnP/P5pSdMyx
	 lVZXfts+u2i8mWU5BZ3GvVQlG22JCevl3quD4us4Tcyd1JfGivI4qo2QHupOrv7PLzSPC
	 uWHODLA+nbmGxYnvKMm1v5ZhsiIhiVHZgqwy53uAoBxYddsscYStJ5cOXZ0zW41mTUXHv
	 wbb7BwQrtturvLvK6Y1HXmYN6QTTwFP8TUI8c7BbXP4UaJuuTlp7/r77q6f9F43VhWkYT
	 Gvndx/b+kcCD+i7NrRFwI8P4mhXaD5CYtjXL8Ix5jeSxMaW7/CNK/wh4sV0BGIJeYRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948899;
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
	bh=pwL7vwOgxfpg9rBBVxZlk1rAe0DG4pheqIv5L75x1J8=;
	b=LStS06zg60PzTrjaOh4vTFDi5Dz7fl4MAOeglxPIp4iSmC5sSCxHxM5LCiVPi8fYXK5w
	 58w2OCjnXun08Gm8INzYeehxoIRSWX0l3ptobSCnd2OJDvz2dchsd+R1+jAFEXCpCOZ08
	 W+bur1DWFPqqLsHp1zty8katlAegHOxyN9kzgwUQB9Uik+XBLdRp5ty/gIrjKhEdcHaw3
	 mYY8GWANZxjvckSNd4jZfNy2gdF93D8yE6VdjNCr8dGlgFlCTGQmuQMBbNBv6/FdyF95+
	 qYuMxlEU3FlbDu4KgUx0CAltoivWoQKBu5K/jKBNekayZv7cPWpsD9I3LTSRAOnvdgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=M1NmXCGJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.20
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013020.outbound.protection.outlook.com [40.107.201.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3CD606A336
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E3CD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=M1NmXCGJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3DnsW3/UxzIVGaXHcNv8g+QM66vep2lLT7gWoaXUoZdlYLiT63Y3rtTAzJOFb4NBW3U8Rid5Gn9urySKXVDUt2CYL/p1OrthJ72Wm3YhIDxi5PWNX1j1Ngar4z5uhbqQmTZzBjCvhAWWZOR3HWdiCErXsazo9h5Cb+yEgznnqFdTO3i+Um8gWzJ+VQOciMSgmX1/kiA2NLXysk3/G4TPyk6bDIIxIjnLnp3kMiYJh5agn2DhnC4f6GUBUFpLKcoHDyUNNGJPWNLdnbxCSZ9OZ8orOBwj5TX5FbkHoXY914eXpQMmf+OZUAp9M2Bh6HErlOkPRAagLuBOTPhD1iQGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwL7vwOgxfpg9rBBVxZlk1rAe0DG4pheqIv5L75x1J8=;
 b=LFpuzrIreeH2MuN204ZoXdGk6pqfe4NzE9Zx3shd+dJLKy2W4y6WGCabjJX4A7FknJYA+nzy6kQYtQjd4rX8gtz5pI37DvfiRBSivCcKm0j4tLPmAI/v5tLhX/6lSF+IMGCfMjRFvqASoK5BUdUI2iRDmjnozKmMHf5hbrUISVO/mfMToJcXLomgG7EWEZdSVlB7ZT94ZO8VIgfBjIyD+vNVtcl4nEXIPPZJWiQtk+aWUXrctSa+N2Ns8nHnnpMa9oXN3HVd+TXUUYdKUPDG6PJwOQyunQaa1dqAB3Xw1Mr5FjOVmCaVCQ6iLlssATL70uZ59vNed0UxDvCmlBmfSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwL7vwOgxfpg9rBBVxZlk1rAe0DG4pheqIv5L75x1J8=;
 b=M1NmXCGJUccHfVWB7mUflis3XuucLesS8gnL9f+vyENbag8Wqt03qlg//QMGofQ069coJSEFF9nhuNcBlJF+PBKeC2vAu0oCNff3opN2nh7la8EQQe9Xa3DcqpfEM1Vp7jb4N7bH1UY9RSVFVRUo6nuAVHlHVRBH8LaTjKrmEMc=
Received: from CY8PR02CA0008.namprd02.prod.outlook.com (2603:10b6:930:4d::14)
 by LV0PR12MB011996.namprd12.prod.outlook.com (2603:10b6:408:60a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 20:54:51 +0000
Received: from CO1PEPF00012E62.namprd05.prod.outlook.com
 (2603:10b6:930:4d:cafe::26) by CY8PR02CA0008.outlook.office365.com
 (2603:10b6:930:4d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Tue, 17
 Nov 2026 20:54:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E62.mail.protection.outlook.com (10.167.249.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 20:54:49 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 14:54:46 -0600
Received: from [172.19.68.164] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 14:54:45 -0600
Message-ID: <9b502657-323f-43a2-a910-67d734234814@amd.com>
Date: Tue, 17 Nov 2026 12:54:40 -0800
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
Subject: Re: [PATCH V1] accel/amdxdna: Destroy the context when hwctx restart
 fails
To: Lizhi Hou <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
	<quic_jhugo@quicinc.com>, <dri-devel@lists.freedesktop.org>,
	<mario.limonciello@amd.com>, <karol.wachowski@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>, <sonal.santan@amd.com>
References: <20261117165731.132261-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Max Zhen <max.zhen@amd.com>
In-Reply-To: <20261117165731.132261-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E62:EE_|LV0PR12MB011996:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a5548d-0bd3-41d6-67c7-08df44ed0538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|23010399003|376014|18002099003|22082099003|261009223027099003|11063799006|56012099006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022075727099003|261022105027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Wcpxbr9T3owyWXOuh/8HkPx3mdmlrEpBloQL3wpqU7FUt4rcpL8QLbgTGSMsce963u2x/w4Tqdnute8yJD2vX+N4oTfz+/jxDCYjZsMorhOyDwY/G6JBtsMVsAgXOm1mdNTRF0PSpFcU8BMje0bbrVD+Y12AUnHYMk1wPTMml13anrd0eGQk51D2RBy7DMSVWLM6qZKnEmX1V74YSI7d5cXeZ7V9VE+kmFVSkYGRYEdUf8jQlakdNdkvdlqi2UHWZ5eCxmZoitn4Mp6hGqdiJ+cva/o/ceYt2P7LOAFi0e9ISRIhwfceRlnXAm9WhUcmMlD30baqL9TcvgR6JsL2IQVR3MHhxQRaApw2tRxZ3ZpNlC9RlRlFJF2NExITqBC6R2Vl7SXzdPDli4/oFUFdFugJctupw7/4PVT04jX/IIy5N/hWePXErKMCmxtsYB/tmZZ3d+pUjPHzPSOqBP0+jQjOJ+EgnSbpQh11FPfY3l6VXzSjSLBYFoEZ5Jet313M32N6GfLfpKNxtU93vkC6+RtftMXga6ZUDU3ezVitG8VwhjshWvv9k6O+7RouVtRP6ucFzyxRxcxMxbQTrjPu9PWXCVUW7He04m3Ob2RGRvTU78bw3qnuDjXu47JL2Wbg+il7jhwydRekozRl5aNEwSJ9MobyHGtxoATKcyhdpXQh8hLs9sWcs/DKLYuhGbLhbSySbFcc7LIbY00HukbIrg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022075727099003)(261022105027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DCuKAbuoDMDUVRgRAtp+7P2xcYMA2iIPNvuE4wZbOO8rpReP2RMsPuCYr4oGNfmBcEJTPxSlP4Q/+Pa0Rlizg8grlTsUuEyz+hqN1QJUaPrmGgE5Zbc8/c0YDc58C8N127gHcXWelhd/x2u/KrmuwzLRbK/9ppg/f34iR5LHGdTaoHmeiL7CV6kE4SIxxAejktUfmk7Vnd+4P45k2Oc4348SlgKAPvW9beQQTWHPUsiTWEG5ZnT0HLERX1RcBwc4IZSHROS5yrel1qq7lMDCivdbMTMLQgcf3dPAL3UwM/jCCaby+QvKhl2yctmyT1WRjCmt9Eq2qy9LPnk0oJhHu9t2DH+oWKB2GHllikwXpX68GPhUIu4QKEPzEvyotRuBOGFCCN7D5Y5dGJJ8xdzy/8XGWhV8DTdmO9DHm/++nrfrQ/HgvwIGoM8BKypNZ2FY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 20:54:49.4089
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a5548d-0bd3-41d6-67c7-08df44ed0538
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E62.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB011996



On 11/17/2026 Tue 08:57, Lizhi Hou wrote:
> aie2_hwctx_restart() creates the firmware context first, then maps the
> host buffers and configures the CUs. When any of the later steps fails,
> the error is propagated to the caller but the context created at the
> beginning is left behind: hwctx->fw_ctx_id stays valid, the mailbox
> channel stays allocated and started, and ndev->hwctx_num is not
> decremented. The hardware context is reported as failed yet remains
> alive, and because aie2_sched_job_run() only tests hwctx->priv->mbox_chann
> the scheduler keeps submitting jobs to a context which has no host buffer
> mapped and no CU configured. Neither aie2_hwctx_resume() nor
> aie2_sched_job_timedout() looks at the return value, so the context is
> never cleaned up and the firmware context slot is leaked until the
> hardware context is destroyed.
> 
> Tear the context down on the error path.
> 
> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Max Zhen <max.zhen@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 74d7019268cb..11f5421e497a 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -122,7 +122,7 @@ static int aie2_hwctx_restart(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hw
>   				heap->mem.size);
>   	if (ret) {
>   		XDNA_ERR(xdna, "Map host buf failed, ret %d", ret);
> -		goto out;
> +		goto destroy;
>   	}
>   
>   	xa_for_each_range(&hwctx->client->dev_heap_xa, heap_id, heap, 1,
> @@ -132,16 +132,20 @@ static int aie2_hwctx_restart(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hw
>   					heap->mem.size);
>   		if (ret) {
>   			XDNA_ERR(xdna, "Add heap %ld failed ret %d", heap_id, ret);
> -			goto out;
> +			goto destroy;
>   		}
>   	}
>   
>   	ret = aie2_config_cu(hwctx, NULL);
>   	if (ret) {
>   		XDNA_ERR(xdna, "Config cu failed, ret %d", ret);
> -		goto out;
> +		goto destroy;
>   	}
>   
> +	return 0;
> +
> +destroy:
> +	aie2_hwctx_stop(xdna, hwctx, NULL);
>   out:
>   	XDNA_DBG(xdna, "%s restarted, ret %d", hwctx->name, ret);
>   	return ret;

