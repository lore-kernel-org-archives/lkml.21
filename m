Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795722127;
	b=LhXrOvGKZz6tKto4kzBqHmIrtnaXJljQDT9Br9d0q4IoLBhROma82S/9D7L7MhsRKibU
	 MXlNWhkD0L1+2+HcYT3bBR7DsOwfZ5xj9XdFnTYbbFngUAfLYrvTgligGLWIwtTvsCt8f
	 tzDMQz+CLGfuZxekG2mepenXXHNq1C4X8WFzDZl8kTYZKSYuytPLsfW+2FEDXZEC3N5NO
	 +llAyhZSAXja3EfRB/a5QkRR9e0fO563Nh0j6haGHUC2pudzWR7dms071JbOBp0bcbqvQ
	 fvBR5FijF2IFMwDIYpaWYW4zBjv1sAHWrHUFYc9CmiNOtJsbINWnOFVbvFlWJZ92JqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722127;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Date:From:To:CC:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-NV-OnPremToCloud:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=8kn9rCui4TcYyInkz9pRk0CHgI6hRNdhFieHbPYT/vs=;
	b=PplWd9COoA3xceq9DuvAPyUFoqK5c/2/F1lS1bSLFAP4xbH+3923MvkXLfy/2HeWFduN
	 wZof/CymZ6wDo1pRCnFY42MRSV12hJ3xI8DrjjYxEnUpZpRX/1RukN1udmXPEQmF5GtDA
	 zTl9Vht0rIQ+B0NxBcyiYOG1cPl3FC4y+1CuXLg6slwwsqR/lWedEaZRFTj4h8KEWwzK7
	 25YjUYGdA2J/iRVlPaIOST9XATXf/Ru27kFzKcffFhD1shWC03h/B+ILZq7/K0Nzn91L8
	 zK4nhKrYErJz71fXaxlZpIkPhEe5iMrjPiioTUe2IqMl8g39fP5KDW3AGAUx/vccmbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Vhzg0paP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.15
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011015.outbound.protection.outlook.com [40.93.194.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB5E606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAB5E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Vhzg0paP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBOux56/rjom50PWXQUwCyxnV4wyFG8IgW3PshC+3iKwjLN+NXIqgnaQM6NGoeJ4faXAobr6SedWDpQuO3hIOXF1ARrXzTINLgCD7u6NNFYL4I+GZFjgLmAJbrjcYGvJh7ZyVuEHoEOqYHW3L2YkKuZ1BOfx9qBBRb/okAXb2lb/dwcq5Bfg6lqXGQ2xhZpPUrHr7qGcnBfn2QxtXwLoR+/MkrIkf6wNEhYt4cXzWgbm8vIhWjcVU5sE0Bl7p3H1IeKRdDcqmzNXEIqKmn4hJbpAQ9pwQhQdsBF1YHKykEAxndnjysusxapmlfNgZK7GmGI3p3BaJlXkiJlnAkRY7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kn9rCui4TcYyInkz9pRk0CHgI6hRNdhFieHbPYT/vs=;
 b=Z7n0tAWV6m25Yka1fvsWVnvFy5rcDwdzzJSZfmyvGo78iXeyIIh8S/fsdj4eL7eC6vs7bTkntFg2409YH7FEs+iR9FmZMsRE9O6RGNcDnAPEGXtOChVrVezXzdQxIBpcPjg0wX243D6TEQqXZjfBAMq1CNoiT1K/DW/+IpJOHNLYJv50P4k/wplwyX2SL2EoeYMvY5RWPjfx4FoXNlh5Sxq2bl3KoeiU2mgHB+lD7Z+bDUkyb31vqAsjWgkYl0c2mDZ4v49J0gN4YBgvqDS6EbtxcJf8IiCU6gDJHNAOLSqH+WhPZVYCt7XWNp9pTOTmOmKDVCYeFjeFasT89dcp7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kn9rCui4TcYyInkz9pRk0CHgI6hRNdhFieHbPYT/vs=;
 b=Vhzg0paPrK5BRFRnK+AvgbboArrsE/tHWg+ZRibet+rxLROYgRXUqo9RQdyQMVECSfChNp9dZcfG8akZckoOQerCnMuYgblrYduPB8YeNLRsgsMXWGmsBXlojS5jDXkgM/k0uNH9P0q+x/+40muq3ecIK6RRakYljpolxd9vA32foZuzqlMbOpYnGwgcGtHuM0JAYHP223VwRiWgqVqouwwl0vYrMeq7ofEEvRdx45Ut4fUD8b8/5XVmuBbOI2YWY3nwXHvOgUT9AsfVaf3szwedvwW0wDMq87bNGnYmtPOGEtdQrX8xDH8dRYZAtJ0Vmvo2mePFZKRAQYolvuAkpg==
Received: from PH7P220CA0035.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::30)
 by MW4PR12MB5604.namprd12.prod.outlook.com (2603:10b6:303:18d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 26 Nov
 2026 19:41:58 +0000
Received: from PH3PEPF00059617.namprd05.prod.outlook.com
 (2603:10b6:510:32b:cafe::16) by PH7P220CA0035.outlook.office365.com
 (2603:10b6:510:32b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 19:41:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 PH3PEPF00059617.mail.protection.outlook.com (10.167.243.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 19:41:58 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 11:41:43 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 11:41:42 -0800
Received: from nvidia.com (10.127.8.14) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57 via Frontend
 Transport; Thu, 26 Nov 2026 11:41:40 -0800
Date: Thu, 26 Nov 2026 11:41:38 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
	<rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Johan Hovold
	<johan@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Rutland
	<mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<driver-core@lists.linux.dev>, Sonang Patel <sonangp@nvidia.com>, "Ankit
 Agrawal" <ankita@nvidia.com>, <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v3 5/7] iommu: Introduce TDISP T=0 state for confidential
 IOMMUs
Message-ID: <awiLcoPfk0xxEL4A@nvidia.com>
References: <cover.1794343501.git.nicolinc@nvidia.com>
 <07ea92910895a2b0db33afefaa3a0ef182b2968c.1794343501.git.nicolinc@nvidia.com>
 <179563006502.253973.9155049351516451537.b4-review@b4>
 <awe6WgoiKaBTgINn@nvidia.com>
 <20261126145715.GG114472@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261126145715.GG114472@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF00059617:EE_|MW4PR12MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: 6863057a-e4fe-4536-e7ca-08df4bf5559d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|1800799024|376014|23010399003|82310400026|4143699003|261026140227099003|261022105027099003|261102123227099003|56012099006|261028144727099003|11063799006|261021135927099003|261021121427099003|10067099003|261026121527099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	T6qbRAs8vfQoVZdkeIur5tTENmUDEHit6ngPgU7DB9umjbD+E1HBVN3TIaOjXJMGEns7K8g09lq8IssGxNB9tlRGtXhr56AUhKp+SVVyPZpYUqxFapkgvVBtme8HgTp2dkYlRZNGs2PYHEMenW+4cm5qw+bn/tT6r7/xabNT37g4yRnkGtc2oLSotlyXOGnLm84TUJ2ybaKDoi0Y16quXxZlSf2KLUlKT/GfEHHrLv9H/8o+zgeWwJaHHHVi0/cigiD3pi5H4jUEz+jBbd85hJ9aNEMpL/xzo1MNo62IsmPikTb/EWeu1EKHzGR/qJ2oOgYGKfHQjcqzmKxp8lsGqH9KjPnpYcL3atydBZHKrTQbQWchx2pEtlxdvXnzSPiI/QcdI5Ar3gICBQbGluwgxt77ccIStJXOxeX0QM19HmaCQCouFL/x9gMQZob/HKY3uRxR2YlrTPysdEXMtUDfonbK/Gv02izX82FTX3ibq10tHrFSww9kovOraodQRdmwkbimxXVsV1KBhM+lXztPjaL7snfJgcPlT1kNPuXhJm9nVW4WLrq3S0z1W1Bw/7eR3LWRW/kr35xZwohnxrzRWp+kb19MWur/e6xilaON8+1J6x82EGtcES/Um949VRUJNUdI2oo4DcetGdtvH4XxHCIYeIqR3uc/v63aQZ/PN76+Ix/OGdJsY3RYH2p7o7uQjlAxJqbZNC0BUUmqpLVeYQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(1800799024)(376014)(23010399003)(82310400026)(4143699003)(261026140227099003)(261022105027099003)(261102123227099003)(56012099006)(261028144727099003)(11063799006)(261021135927099003)(261021121427099003)(10067099003)(261026121527099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qHJnNPUAFRwttGfgN6rjfXyRRyImNLddgGXaKwpz7Abr1nYk/cmu9x3BdlJ0wcfGuayYGiHM2nkScZ4KnEYYaks6MWmODw3W9hkVuKwXOvJwZWYlaDlL9+nNBTefnJVTCP0Bxv29ystmFLjB+aCdwsvEQSJwclPhJS1pTl5W6SvSDB8/sc7iX0JOV5tK8Y7uTpG6pSXz3aA6p8ZLtihVhnEOA/71iFG7zms9tVY6dUkMGG/FfexydMeqPt9u/hr8z7xgZjaM9S8qbHQou61ONo4HovJH/9poaBEG1UHThDhIUJqeVYb/bZyZL3MzGXkCXXsuohX7vP0efcpIISwJ/3o9pasvhqmXjTNgdy6NWDTseNjv6XfwWH5liX1BoFZQn/HwiroAsvfwikr12EZSjF6Kw9KYpgsLf46uloagKo+F9YFwWfaPeuu8zbuUkod4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 19:41:58.4531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6863057a-e4fe-4536-e7ca-08df4bf5559d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH3PEPF00059617.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5604

On Thu, Nov 26, 2026 at 10:57:15AM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 25, 2026 at 08:49:30PM -0800, Nicolin Chen wrote:
> > On Wed, Nov 25, 2026 at 02:07:45PM -0400, Jason Gunthorpe wrote:
> > > Though I am wondering if we really need the ATS stuff. Why do we need
> > > that? The pci_ats_required() in the hypervisor should force ATS since
> > > the hypervisor is not going to construct a vSTE or use a nesting
> > > domain that would inhibit that? Can we just drop this whole patch?
> > 
> > Ah, you're right. It was added for non-pci_ats_required (non-CXL)
> > cases where the ATS state needs to be in sync with the hypervisor.
> > 
> > However, the justification/usecase here is pci_ats_required alone.
> > 
> > One small concern is whether VMM always exposes the underlying ATS
> > state or not to the guest VM. QEMU seems to do so. I did a test by
> > dropping the patch: lspci in the VM still shows: ATSCtl: Enable+
> 
> It probably shouldn't do that, but it is also not harmful. The guest
> PCI controls should be fully ignored by the VMM..

Would a PCI device driver (running in the guest) check the guest
level ATSCtl state for its ATS pathway?

If VMM is not supposed to read through the physical config space,
without this patch, I suppose ATSCtl would be disabled and ATS on
RID might not be functional?

Nicolin
