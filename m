Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795033043;
	b=V5fauaeFSInXVX0jf9KeuHbbr6tuG5nuKiqmd43vNJq+8WFDnVNnuArHnk+aO6ALlVoB
	 onnk1ZQ9ZGGuJrci/Qg/9XIvs+L20ZBQDfGr5goDcBzvX57ALp+iT00tkDKtzhnKHDnM0
	 t8Yi6eReYiV1kE+fWpdxPx6xwv7eKMK0E+7jP2VvYeYpuCWKl3RoNcFH/iLqkSlHr1m2p
	 Iret8akTN7oDbNrOi2lS2sIgFKF5pDHEEfVBg3ae0Pt/Nj8AJLQq9+ynoicpIdXV7Yfpb
	 sRUWxKRDVd/cNBUQUUdKr27dVq5H0wWMWZhHIRWXPyTnlTOdrhv6E5kEC0vEuGM4m3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033043;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
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
	bh=YVdh7wdKkaF43pdrqYzHZuewYgS6l+ovpzF/4lD6nyY=;
	b=JWLI/iwrWn02lqWbbjJLa3Z4BXbG0JpTDUKdSFOigLaAjPHeImR9U4TBxiT2OxVQ8mld
	 b8iaclXQgUgKfmFVJuy67NPjzOgP6mPGWxSnKRlj5V2U7vZNSlYJVQ1JVgC8tZCnG7pJz
	 3XZbw8buRcFZATqGwCk1ddnckvkEGZM+uBevNJOKkZnSViKbUXuIWZfzhPjuTxLzUco96
	 Y96yJlrPZPmgDI1XnGMWmveZgYSeIPO84GMyoZ+XOM/ZErjTtlN+azUwch59951kW+PRG
	 beGMJCPOwa4IW5U4mBY4XGTCN7YYC+ndjUQQ36/+hWBYSci8En4fSPFWVA3EeSIXesw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mFkMUZRJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.67
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011067.outbound.protection.outlook.com [40.93.194.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8F9606A336
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C8F9606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mFkMUZRJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1SG+Y/k/i3UKgYLX4hStL209179VGo8QU9VFk6Z1MZcA6ZXwsZcr2gqZMqif9hhvyk4zmD9CMcW0+QwB4aaA8yZgfJmxnhC4R8q026oX8RbHveIu6uT1AlLqkokCY2aGcYSP/6jkBZ6C4EhMiDYgHOTLTqZ745XN/s1/6LyXSyAlueetCe4NUTXZRz0zwZ9PhhZ9QjEcAKLOmhmVklT2L9U/8LB/duH4Vjv9wM3AzAFLfwS1zut+uFWF8OBmY9lwA3fksfimERhc0ozkJRzkQwukZPKSDnvXabQGL/+LFpg0WeJqKTZdICEXEbSfjP8b8z3z9j1gdLgvHWQsIo3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVdh7wdKkaF43pdrqYzHZuewYgS6l+ovpzF/4lD6nyY=;
 b=oVHo7Yuaxu8nXR936Rtm8rWIgmFuI64TAH5WlCerzVU5lzllyqVHlvGluGWvPCHf8tw6t8JJ2qR3AUuwoPRwfLG0KruiDvk3nxGZbtxBAC9upcL1aRqU7eZPwYYUepmTcMKpBgrzBms5y/6pME8RfO5IxefP6VuBj+cgNl0woC1aDSYxztcIHKDC7i2p+Cp/8Lvk2gQw6C+qt3sQ41SLzslrE8UQDOX2JcDPCn3FqNkqVKINu509B2ZiHsPSJdnEpvu8IoHpt69eQzWfMx8la7n7BvjkQDdMiY50XUwJWMX7u4omVbKjnTEvpevcdSARGMdy0FMS93993WJiueXeiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVdh7wdKkaF43pdrqYzHZuewYgS6l+ovpzF/4lD6nyY=;
 b=mFkMUZRJDdQjuE3NsY15vQTIdg3+S+8rfhmPP9mp0DbYBSQQ2r8V6iZuA3Dyjn9sknHlbCEdod+ga1HVpfZ4bvtDWxh7SZ/n+uNWKC4KluCQo/bQYP7z5oAVcnNQnbkUAz+yd/GzdpLFy+2DcKhdr94VNOEqpGCNV/au/+4TYgw=
Received: from CH0PR03CA0411.namprd03.prod.outlook.com (2603:10b6:610:11b::27)
 by PH9PR12MB497784.namprd12.prod.outlook.com (2603:10b6:510:411::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 20:17:17 +0000
Received: from CH2PEPF000166BF.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::91) by CH0PR03CA0411.outlook.office365.com
 (2603:10b6:610:11b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Wed,
 18 Nov 2026 20:17:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF000166BF.mail.protection.outlook.com (10.167.252.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 20:17:17 +0000
Received: from alysaliu-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 14:17:16 -0600
From: William Palacek <William.Palacek@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, Sanjay Yadav
	<sanjay.kumar.yadav@intel.com>, Joel Fernandes <joelagnelf@nvidia.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	<linux-kernel@vger.kernel.org>, William Palacek <William.Palacek@amd.com>
Subject: [PATCH v4 0/3] gpu/buddy: find range-biased blocks in the free trees
Date: Wed, 18 Nov 2026 15:16:58 -0500
Message-ID: <cover.1795032989.git.William.Palacek@amd.com>
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
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166BF:EE_|PH9PR12MB497784:EE_
X-MS-Office365-Filtering-Correlation-Id: 977165f8-9337-4011-0476-08df45b0f146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|18002099003|261009223027099003|13003099007|261021121427099003|5023799004|11063799006|56012099006|261021123027099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	pHwIV7WvlqCOWcSmLZOCExIKjQDNKE92d7Gqsmx54UGIg2welv9B8LDDUPi3XObPZx1rTbVViXtgvApczqR/kc27PAQV4Ehh8wZAwKgneSuoXjbRPvPDjF9Be0VUOWpmydOw8/aHHS5FkUeT9dGgUhawMBiAMRjaV3ztu0pHxsM3PXy0vNstIwL9NgWsnqpIlhdVS7PxYFdOUY74rPtsLN6dhIjpoNsj/y3hH2puwbpP6RmM+2PyNaMC5aKe46TyGo6Srlpl1JfITSPXX57qcQwLQpOv3kiajyRO9tMv5SEJQKOaSb1jLV88o3iJ/4H4vzYeqx27bLz4ntRMI5PSiGQb+UmVXiJenalziTg4iLlIJNYG6o9KyxbMFxoCAsesJVmAtr39k1N3dZnSqgDpGI14u9+ppl08qNgzOFKNpOr+v721sQGDhw79Z5WVRcjjYwV8p784TwthOM3zN6lBgaG8ATX96HuDwhCMgdVVccnPvylkVPIstXuMty7DM0fiuswrcCHq2zsRqE9sDAUGmNB7QKZBU1YT3hs1fY0ssvQgSjlID6y4hSz3Yh/hYDT5YXkj8rqVt+3qG0vVIGTgGmTPXh7WPdQcBT6rmwWp1uo2cu5OXw/64PJYtDPs1cWywCHEB4rv/a06g/wMwE72Sw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(18002099003)(261009223027099003)(13003099007)(261021121427099003)(5023799004)(11063799006)(56012099006)(261021123027099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rIOhPLg8PPxQnByR8ucWa+iL/M0x/dSlBe4c4GW6oC7DnZpqwdAWTnCJtQBidHSsgwpGzy7tThVcoEUpARIVnIlX8vgmNVi8FExHbf9gn1by9KxPXl/c5g350oS+B77jlnRd8+g72z+ILrx1ybyyevcoLZ8cirVqtyuj1ULcKVepSkFnPQ2jdTwOSdptEdov63rvu2wzufI3atS0s/sBKEnUL62ELySOPRY59Hlttkp4XfLumwacCjodAU2RwE+USA0D7RZvKPZAhj6UaINh/V/hK8nEzuk0zmDb82Z5hvYnmNfOtwOjiTA1QkrIDAOFTEIF7RxV7yf6B2J/FJbc+DW4uteuPR6ZviGE4Dvkdt/fQN8/tfvl9xWXd+XViPZ8CrZHUTffAPUhys/srZXyEORA4IixYgGiJHRWAvXu4xIrnlP3qt6gfDUD3h6H/dkn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 20:17:17.3812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 977165f8-9337-4011-0476-08df45b0f146
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166BF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR12MB497784

In a range-restricted allocation, the strict pass of
__alloc_range_bias() still visits every free block of the other class
in the range: a dirty request among many free cleared blocks steps
through each of them. amdgpu restricts every VRAM allocation to its
memory partition under NPS2/NPS4, so it takes this path for every KFD
VRAM allocation there.

Patch 1 replaces the walk with a lookup in the offset-sorted free trees,
on top of Arun's range guard code. Patch 2 drops subtree_max_free_order,
which nothing reads after patch 1. Patch 3 adds tests for an inverted
range and for the NPS4 fill pattern.

v3: https://patchwork.freedesktop.org/series/178108/#rev2
v2: https://patchwork.freedesktop.org/series/178108/#rev1
v1: https://patchwork.freedesktop.org/series/176957/

William Palacek (3):
  gpu/buddy: find range-biased blocks in the free trees
  gpu/buddy: drop subtree_max_free_order
  gpu/tests/buddy: add range-biased allocation tests

 drivers/gpu/buddy.c                | 334 +++++++++++++++++++----------
 drivers/gpu/tests/gpu_buddy_test.c |  67 ++++++
 include/linux/gpu_buddy.h          |   7 -
 3 files changed, 291 insertions(+), 117 deletions(-)

-- 
2.43.0

