Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795421220;
	b=UoOlo4EL8XDHKPbNJDeM81r4yGIb2zak0RK5oePccGNWEK72SvT9/WGM3rUj4Fe1lrE8
	 8rFZF2Hnhkgj9H8S66FSNbB1W0utNHr+WlX+afVELklO4rMfagTvWwIMf1Rcbq1o5cNc9
	 bGra0pLCR9r2PBi54XVwaATGTIwnvG/rqTz8YpUYVLRpqMu7XWU4CXCJRpEGrVZoB4sjH
	 bHe+h1zi2LwtbqffM0zFWgBk4biO4Uh5vivOA6CDUaBdZWAV5ppnBeHAMFcbsIWAmUDc2
	 0TDtRYVDvtz5wpKML5jwnFGMDr3KCzzPHq6rFEwzpulG5/E1RHtbGjKqH5pPmwcRzMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421220;
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
	bh=LnMwKgmAAei+QHZJ+dpKHB77aUMWMRVBpWv/xm01JTw=;
	b=pYcklQbrkgZqj0eCE9Yt5TiiRzkxgYgXEj6SY0GY7+kvg+SuAjAlQTX8DuGXJB0JPKX7
	 sf8p3h71a3bq68y7cPzmcODzJh8z58lmx0U4OXguJBI3SRtax36VUnQPCIrS6/mzYNAFp
	 Qb8IhgcdpA0X/v1UDRYQ50NxHdOKJrfmxImnrDCjYpCE0CKH+YdIaa4UsqeUr7Y+pEO4X
	 fOiabRn746xoptDDp0aTeR0G9h1HEGn/DsHGyIpJT9oLvAJUS82eTMg8oI11x+naOJYvg
	 jdtXppjWJi8geF0lxdGFyoqYVnJHk4nAZLhG5FtTf4EWaMlz7586nCAlTtxTBSxMDPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bdgcig+N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.43
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010043.outbound.protection.outlook.com [40.93.198.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903CC607151A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 903CC607151A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bdgcig+N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVjzp05Rks5ZcuPpcCbaqAKcC4G6yB8jYd5QMy+mUpxUG54pPEhRldJlUjRN7Zq9upJ70w0AMoQcE5ywANe9kffHf+YpCIh3a7F55smyWb2kvE0sBGLOqnJD2+pmYNp6kC/8Kh1ecyMR68oiKGY8GP4rpcSNrv9ymN6Q381zOPfFdpNZclImj7sya6LZjzXfDK9MIIoKaI+x9pMKHm12K2NNML5BSGM8FD/XpDrLl+LG/1qVjFEAGafmqj591VnSGaTImA0stWw/vW3P2N440lBenon79Yid0/rkau7Xjj2gz+Vx1Sv7XJN4xc6jHiCu4V9ru4OFUtzoidn7ToleYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnMwKgmAAei+QHZJ+dpKHB77aUMWMRVBpWv/xm01JTw=;
 b=dXcRYzTzUsBT9RCHELflPhpN0wv3R24MuLNj5ApiTG/81EC4gsEwb7DNsTYH7GksmP0uX76fbIO+2px+Ea0RROzf6FakITfHEmuKv6u0iDYC9UJ9wv8Vql0bHT6OMZ8tuBxMJtSiVAf7bWqNXZ8jFq6G5k39czSjUT6iBev0KumPXk5DZFfWtQVyBIZGdT06S0lOUFFaZn9aBro7fCwQHemA2nsugF/Vv7PXNfMCPDpwkDv7z14aN6LjDNH3yfCwFwlOUxzpLEUzvnEy9p9X0tsryfC77mwCskJYGyehSXmyXe7KYRLrUsh6zYcG3Ofxk0JniOl0xvnWX2M777ZrVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnMwKgmAAei+QHZJ+dpKHB77aUMWMRVBpWv/xm01JTw=;
 b=bdgcig+Nal16pobnwoyJHLPeUBtBRbNY6NBfDE3JiFpiSl6sBfZe/yg3nIBkscN/16urpeli7r2ipGDUR2hkEKxL3lcqJIM8N9ZMvGvTKu7HXdq9TB9LJCeSir86lvMHCINaiGb7frKOaqgN1RCz72N+JHTJqN9rv0YOOPwoFyY=
Received: from DS1P223CA0022.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:44e::8) by
 LY0PR12MB114387.namprd12.prod.outlook.com (2603:10b6:404:231::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 08:06:55 +0000
Received: from DS8PEPF000000E3.namprd05.prod.outlook.com
 (2603:10b6:8:44e:cafe::78) by DS1P223CA0022.outlook.office365.com
 (2603:10b6:8:44e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 08:06:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS8PEPF000000E3.mail.protection.outlook.com (10.167.23.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 08:06:55 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 02:06:53 -0600
Received: from [10.136.45.121] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 02:06:49 -0600
Message-ID: <b363ed8d-7caa-4de5-9ebe-15049bf72d06@amd.com>
Date: Mon, 23 Nov 2026 13:36:48 +0530
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
Subject: Re: [PATCH] sched/fair: Fix h_nr_runnable leak in dequeue_hierarchy()
To: Prabhakar <prabhakar.csengg@gmail.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>
CC: <linux-kernel@vger.kernel.org>, Prabhakar
	<prabhakar.csengg+renesas@gmail.com>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261123001213.7609-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20261123001213.7609-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS8PEPF000000E3:EE_|LY0PR12MB114387:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ddc010-a941-4121-732e-08df4938bd44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|7416014|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|921020|261102123227099003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jlRLQvw6Zz7se8ziFdqeLKT/kSixBQ7pMPMqf33Vk+sMU2hCJOUkKmxR8VcpzfQuNofmJNHhmS6SGZUj+PRYmxbH+8SACGPJY2selBeSQKnjWC4mCa55RJGVhXK0TOF1dj2VDnxtI0NmQiAKRavjz+p6BkLgKbcx3hf+6KNWLwoMSPsMgeCrTrUk9QpnSt+bOdYSDLqDj9Uwzj57yQFFqFu3qYfnYxsFCA7e6fF34iuu7cwqCnuh08V8OdiLMTp91nmFfX0y/Mtx6rdzEnM2+W0sKYF1+QPgO9MnKhcCPauUQUjC0otOhq44+V3e5OFiUncfFT1uSKNO7LZ389lzA5LSRKIFrnnztjqTF3iXGEsiRGa4GDLniuDaVL5e/OTZ/90PQNd3mXD/JlIKMNcq2H/7H814unT1Mj7m/g7xJZRLzye+iPUqhgCrL+ul9F3HG59y8BHNkQT9XKqCMf33D4BsYoCmMPT65xHaCHTOm+M4geVU1vXCRjaQkW9TAS206WF+mNoHNuLNfz9j6Ys2cXbtemqDgN80E73kt+8uF2/uZPzF+P76KcC+yCdeL2KIfvSlgNali8HbeP5i3sz6MtrHDajCJSUTApleDxXIbvI+CYuyxlKXG++y52RJlnmsz9zqZg07HkvaxxZV4oCOgXje6pOD70ch7tsC16/AW/8su9UHl4Z2fiGCe65g6G7+FaxY73Rs/OWAoOe/uVRTHEyBJve7x9MU5DkJe06pTYBcf/ErRm+KQXzXDm/XfHqv
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(7416014)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(921020)(261102123227099003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KYKdsD5B5JetunwME3b3mb4y4p+LWMxMNWZkYRU9HjEVk2NWcRvhBCGNOc/uzPgM7xXt3iqCYoELCJVWwDGz6NQ3ETTDx7b/l6ew/3/ytEu9TjFHj5Ryae9kilNFRvVDG3rK88FgKH9QsV2DuEzSH7jtKGOCzCy/okA78MOnEaFEIwy5NeB/xMwoVmnK58RXqKDtn08ccXLOxTyEQhvq3kwVjRh50+NmGJDvYETxNUtnvuvO9sYZCUqqnY6uzWvUp+BT8qbjsBY8UkwQzsHEDxpVVT7FVk+7WJ+fkCfCWeDAqZW4ZffdK/h7qRftQHdMjNLnrdhWGCfxzN0uYLoCjMkRRITuFECaWS6va8Sq+qW5AAHa5SacclidYvNa3X/avnOpxNCG27k8HVcZuF0C2AcjxwkomD7+Qs3SZd/f4pRT7mbUJXpy+WNTbySSTGe+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 08:06:55.0199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ddc010-a941-4121-732e-08df4938bd44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS8PEPF000000E3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB114387

Hello Prabhakar,

On 11/23/2026 5:42 AM, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Commit 486c3d06b902 ("sched/fair: Avoid transient double accounting
> for delayed tasks") changed the h_nr_runnable logic in
> dequeue_hierarchy() from "set to 1 unless delayed" to "set to 0 if
> delayed", but left the initialiser at 0:
> 
> 	int h_nr_runnable = 0;
> 	...
> 	if (se->sched_delayed)
> 		h_nr_runnable = 0;
> 
> h_nr_runnable is therefore always 0, so dequeuing a task that is not
> delayed no longer decrements cfs_rq->h_nr_runnable. The count only
> grows, which inflates se->runnable_weight and skews PELT runnable_avg
> and load balancing.
> 
> Initialise h_nr_runnable to 1 so that only delayed tasks, which
> set_delayed() has already accounted for, skip the decrement.
> 
> Fixes: 486c3d06b902 ("sched/fair: Avoid transient double accounting for delayed tasks")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Good catch! Feel free to include:

Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>

> ---
>  kernel/sched/fair.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 731d78155e65..2d9d3d686261 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8294,7 +8294,7 @@ static void dequeue_hierarchy(struct task_struct *p, int flags)
>  	struct sched_entity *se = &p->se;
>  	bool task_throttled = flags & DEQUEUE_THROTTLE;
>  	int h_nr_idle = task_has_idle_policy(p);
> -	int h_nr_runnable = 0;
> +	int h_nr_runnable = 1;
>  	struct cfs_rq *cfs_rq;
>  	bool dequeue = true;
>  

-- 
Thanks and Regards,
Prateek

