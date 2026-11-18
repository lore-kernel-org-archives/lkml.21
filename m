Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795035571;
	b=1dQRv/BljfHWfZudsYe6BIG5W1jWxO6zNpZVcMVblQJPHTIfUlzvZe7ujA0IceS806N4
	 2qmMxfJB+YGbT6C2sWvs0stqF0ylYD/Ky4pGMht6LJ+rRPdVDJkbJxrTkvlzvk1hLfOsz
	 Zt1HFmFVct72GKcJxwQhZWgu8u/BDNHqwyrZFXsIi1/k9VRsorwOAM/Fm/WoifwRVqYm4
	 X5TXErUDzQYy0jz3MqbRHNZxiDrh6eFZnUutCFXbEq3WhL2fk6ac/NwfVW8V7XZDhCWZK
	 v5XGxgYzF7+sgQM7WygWXNg6k3ahh/ZUvYhSPuqcCJPyjimCgRwdEFrslx16fJ/eHjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035571;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=mr0Mz9N+yOWygfHz0BLM8Ii3UXslngUg5r1FLSLZHko=;
	b=ovrxXp0bWbVCNnUiZo/qSSe5Nz1FNvZXMgKgl+umMFW/lrmkNclVNDpilwo5GCkvU9ru
	 JULuVZnOxq+Sgn+pSxXUNTZy/gK13iNMCIFtBz7QTFIAXIkgumoaIuQ24ECaZnjhKohoz
	 w3MQMiRNeKNttpve+Nq3vGqzPv0YG0n2brXpEDydM2ygGWxPwns1uWcfPYjkCHwwT/Vd3
	 3cCFQPwUOJBXf8DbJGmoiTPRIngBh567vvi88cLXDlaRwJrU+Xfet5U1BPSnFy/B0s7eN
	 t1zxb5rB/xSFpiAXDEqv3Ak++g653nY/pT38FHC2TMYJXkYVRU63gy7iKZTkSJnzspg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CludZFZ6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.16
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013016.outbound.protection.outlook.com [40.107.201.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DE0606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3DE0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CludZFZ6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cIScv627RiTEri4/1y6LIBZ5yTvIuzWWo8tNtHQI8hR2XKc8oGprm91GRD6/fUP3wAag5ONGNBlYNhU9hMh21pAdyAc86Iz3Ly3BZWWCI50P/o5CoZ71EwPFltYAkCFPG4D9E2DbJTtvomlFvzPtW9XgA4ARtfi404ya7blfvcANxCXYxEltgSQReUI5WXaT0fbmxlvSjREum56FXjaSDHSH7OEOqiC2LZYEChn6pTV8ciH2UvC5gwKyz/cnpC/zNgdctkKNxuAqMxSV6dxaJ4Pw3wYMW5JgEs+l/3l/d2t7T9yuS0mHzQgvemEkJ+5M6TqLPiiGLrKFufG5Nfuyjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mr0Mz9N+yOWygfHz0BLM8Ii3UXslngUg5r1FLSLZHko=;
 b=Yh8ydkdxds62bO8fk2Kq8k+s1Q52q9BO1PJjGeVOOU1BG4iW4OIgQxPLUPpAgU6vy9/1VxbZ04aVZP2ae327SmPk2wYPGCF48fDmp66looujW8/O8wgZYhizzqdIQ+vvZU/1Alb5Iw4+xV4QiAXYsFMi3kCbMLgpXfmwDimOUtMSoBYwRI+0ZguFM02b1u+UK1Vr6iq1zic3pCT+rBy0iNvm8tkMFPqbn1uBJ3LDTxHOFh8MkuUIO5n+KSDSxnV26rtEwsKUB0xj/T2SQW6nHZyw8JyYS1m62b7aya4SRLeMvyQxv0fsVbAGnmpk+/vC7t0+3TI0xNhgo38HnDEr9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mr0Mz9N+yOWygfHz0BLM8Ii3UXslngUg5r1FLSLZHko=;
 b=CludZFZ6zjg892IrtCGdzkZ22RfkQ9t8GMPrB6WOdrnUscCXBxcp7qwB1gBIQcoQgU3cliRf1m3+SB5Ftzs2z9ctU1+HbRDjesaKAai5PjQ6chN5gUI/1S4XGoYN6il1TnxUtrNRCGjamHazhlRTnsQtAH7S5ORAUjndqfUoD48vvwX0dkgv8F3Fy+fXsItCM9t8SyAtPtLMNQ3OtjELVwAHfEF5nPzaRraUVWaBn7vbt6iaY5vj8mO8j7Un2sOA+C28AEbUZbPD52jlf003FJNIOFKfSVc2Po9GAfLzLErlT2fLOOhdnT0vmGZ1Uu9Fe9f/eJ0uUQ5iaycJGZ6woQ==
Received: from PH8PR02CA0009.namprd02.prod.outlook.com (2603:10b6:510:2d0::22)
 by LV3PR12MB9267.namprd12.prod.outlook.com (2603:10b6:408:211::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 20:59:19 +0000
Received: from PH2PEPF00048915.namprd05.prod.outlook.com
 (2603:10b6:510:2d0:cafe::6a) by PH8PR02CA0009.outlook.office365.com
 (2603:10b6:510:2d0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 20:59:18 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 PH2PEPF00048915.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 20:59:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 12:58:53 -0800
Received: from 82875d6-lcedt.nvidia.com (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 18 Nov 2026 12:58:51 -0800
From: Nirmoy Das <nirmoyd@nvidia.com>
To: Tony Luck <tony.luck@intel.com>, Reinette Chatre
	<reinette.chatre@intel.com>, <x86@kernel.org>
CC: Fenghua Yu <fenghuay@nvidia.com>, Dave Martin <Dave.Martin@arm.com>,
	"James Morse" <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>, Ben
 Horgan <ben.horgan@arm.com>, Drew Fustini <fustini@kernel.org>, Thomas
 Gleixner <tglx@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] fs/resctrl: Report unknown schemata domains
Date: Wed, 18 Nov 2026 12:58:25 -0800
Message-ID: <20261118205825.3339003-1-nirmoyd@nvidia.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH2PEPF00048915:EE_|LV3PR12MB9267:EE_
X-MS-Office365-Filtering-Correlation-Id: e3730365-4d34-44d9-0d2c-08df45b6d015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|7416014|376014|18002099003|261009223027099003|3023799007|56012099006|11063799006|261026121527099003|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	h7+FieRovffNg+EyC+tjdSIgmyoicJFTutjDDPOCeics9AWmGVlohOB1IdnGoG8600JtXDSY9N4qm64VQaCOn3edFQWelloyC8h/rp3Drq3I1vs1Fvy0nakK6tJyWP/HYyDZvwHBcV2DO9BusI7z3crjCcagEOPd7nkOiWMRKspm/E2fYQcmoPq5YUVr8u3hGKI4NC+2vevOj1t3ekmE8ZcO4pTgKPCnjTwYbOfE0w7RDjgIkXiSQYcJGoImUPE3LldZyVcyjgnR7ylbbFx/li1bHOVZDnIg2sXJkuqDURMVGvU3mOZxrXhknxpRxC6ur6/vlNbRdHs7An8uDNUsJizajaSNf7zcwqnIRk5afpEQhR0DVZRrPKuSFuR2rONuLvfoll6FeakK82+/pQRVrUStuFjc3cEBqwZ/3zHZpHJjavQICeSA4w1NlE5kPSDm0y/pO664JS2/1Q3erpXIoTXEk9ztz8qodzOthq77ZJuVEJ2dYHwxKU0MMGaHtO3RZYGzoXZIwPYavxZHP64TN2Cc0VJKZ6IcJLXjRizVYuJNJqlJAwd8afLGY6QEJY5zZADnzvP00yflT6YL3dxjBViyiKoHF6hKtIDuB0tL/w1twJ87tf5tREqv60qZixQxcn42lZU6KEYJzg/jPzQ0Gy4/tVMBM/MJGfvJ+YzG/x/GtYbqN30YIrF99B8uL/3XRYFU7YhZsEmscYF7gLEC5g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(7416014)(376014)(18002099003)(261009223027099003)(3023799007)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	E9bFgpeJk9A90UVKzokcrbr9egF3U4OJiG/pwAFgEGS7H6t9ftiywr2urqBpL1bs7kQLTDTbXHJu6esFicQKqra5lEGL2aOEl2NwKFEWvFopt8CujHsPn/+xe5xl5009QiwuD2zmG9KTNvfXxB3r5nQazjgaDz85CqmPfCxHn3IIxU/F2txfdMPl+Dyu8Y/XO7hPOGxJB/l3op0WgwYRgOLKWRJ9NhTuW/BpHBRtLCwziVvT3ZiuuTI8vsfU+H7q2mGl+C7BTXGLKg+QaNN32bVJyr0gKGtvME3FnUhsQphcwGa1hl9Ki8bW0InRS2DuHrDD9HTka+UWITVHdfFJgI+KfZ+BzQvwwMR+ZlTvttslgr+s1JU+82ENn6fLT7nwOYu2UD8/1uVa2+yZ29I0n0m9FsV2eVTBkicehNtzpVIlN5VORvi5rjZV2v7l97cH
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 20:59:18.6798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3730365-4d34-44d9-0d2c-08df45b6d015
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH2PEPF00048915.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9267

A schemata write to an unknown domain returns -EINVAL without setting
last_cmd_status. The status buffer is cleared before parsing, so reading
last_cmd_status after the failed write incorrectly reports "ok".

Report the invalid domain before returning -EINVAL, matching the existing
I/O allocation parser diagnostic.

Fixes: c377dcfbee80 ("x86/intel_rdt: Add diagnostics when writing the schemata file")
Signed-off-by: Nirmoy Das <nirmoyd@nvidia.com>
---
 fs/resctrl/ctrlmondata.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 69123b2a3274804a..2f7db6c669214c3a 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -279,6 +279,7 @@ static int parse_line(char *line, struct resctrl_schema *s,
 			goto next;
 		}
 	}
+	rdt_last_cmd_printf("Invalid domain %lu\n", dom_id);
 	return -EINVAL;
 }
 

base-commit: 2a93af75384b7e95d62c5a9a39e13573e2170ec5
-- 
2.43.0

