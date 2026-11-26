Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795686815;
	b=SELIJmZhV7E+W7rR34bpSzM/OV2n7xr1czBCy0WD6OSPeXx6KILeencobXzN2/qv3J+l
	 SMHE/OsI1AxF++vgGz8ez6oFqN3esdZi6yhoqtQgmNcBfbitD+Y5sse/PkMRcBMIqnB7p
	 byCNbAY0TGNLZ8fDZTI8cqSNkqG7RctO5YOtBuJog373pXFLI8VdFpXCTs1Fid0tQoFx0
	 golIWYCVttzXgeJYKvD+eeu3lThFcVnHZs5v7IsB59Gvj6Te/MpLWqyXG/awfiFtNKoho
	 JG/EKqsib0QJzmKoFy//nfBdGwGphaPukWDttNafaiYGgy/XwKuVgSJxCLAP1nGfKFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686815;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Originating-IP:
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
	bh=UUTCTAzqam8zHqG9Alk8rxHAVtB7F6aZe20yGeHWnrs=;
	b=0Xv1wFKIWCcdAI5N5ONfnsAXJ1iQ2QeUw13k3nwIzE44W7zTB8R0quUoc98q9mBv4zlF
	 gKpsKihLlAkPYGYm4ukWP+EwFkeONePgophXAQio6FrtVI9vGfcFysMluy9lUN47G/L37
	 2/t3uSKBsAptVLjHX3N6C8ZlTdy7FuG5K1kcf4PDoS/FTcZPptbpK8/rm0XwRgcXkNkZk
	 uKA8E31UrX9FdrsttjO9Mnm4f9iUL+vSQVEAMqwel9vYktV1hFKeP3n6N8G+tW6MHDOW4
	 FZEQ927W2zZimBS60lfoMQSJT/arojGKEv1CnTGlfOt1hX7vQ1y4oT1BNJFgvr4uaDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="1gxl1h/g";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.46
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012046.outbound.protection.outlook.com [40.93.195.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EEF606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92EEF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=1gxl1h/g
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqvuC7Aa6U4kBiu3weWsvCelkKnYwNCj5SvkRijJFlAaNryYfYk3/djKAaj5mc5lbaoj/mavtYFRyo5lgVG0FLs3R16gV7zzSlVRdtK67pMppHWBk8FD/A6GQ7qmDZf5h2Cb/4madq/9Tg/WcHsjB9H9TqHRt6a35VOHxs/0EeMqr1GgcxvVEfCoSQxb20aTTJLRHl48F6YYRb2xaWz0ttTlgAoL0i4SsBtAMN1hnMPv4qJcq3/mFhURfUWDMIoe1Ff/ps7FRcCDc5yNb1ojlLkWbvvDOKQqUeA1FgdOYH1yewgpT/faq5wJfG30XEjLvUo7vAqqzvheJ4K4WIgshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUTCTAzqam8zHqG9Alk8rxHAVtB7F6aZe20yGeHWnrs=;
 b=sPTzUWvqDF6BB6N869CsOw493H6wHHvZFbg2i5Efc00sIFotB3bCwDIjhkSP8MBCaYxDLytSNhUE2y9ERyl+2PulGfXYDQf2SEsOrZlQ+BRqoXQzDzGdkjOFvufJTni8fax0QFcswlx+rjTdE8LgBM6LuR7gs8McvpFuN3B2HcL80p/fRcMwBszXS5QuEDtJEA6Jh06bZnUYoh0iO3eT9z4SGyJAeEO8ZpzdUUei6U5vqYMCzdlZJiKRF9WQnSVcJ/1DZVQ3ONW5hD+K/U+PUoGbGZLsONycrlJO9x3N5Yh3eXxsgSYk6YS0zMpJ8GrlzYV9FPMu6zjBEAE57XDOYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UUTCTAzqam8zHqG9Alk8rxHAVtB7F6aZe20yGeHWnrs=;
 b=1gxl1h/gA2HreWEhcp6VnsQ7oXUqJUGaU1SCM9QHAfeogeUrVy4Pw2AGBl7p5JZuSbSOs2zpxORm8rjYnBRmK2Gzkfl8MaGIIVeSQkIKyeUekb46w+hgCjoVs1+BLvO6yUq+WD5Tp2D2aYP4IM0/3gV3pNjDfb3bFFG2+GDDivg=
Received: from PH2PEPF00003849.namprd17.prod.outlook.com (2603:10b6:518:1::66)
 by SN7PR12MB6789.namprd12.prod.outlook.com (2603:10b6:806:26b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 09:53:29 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2a01:111:f403:c902::15) by PH2PEPF00003849.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 09:53:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Thu, 26 Nov 2026 09:53:28 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 03:53:16 -0600
From: Shivank Garg <shivankg@amd.com>
Subject: [PATCH v3 0/3] mm/rmap: batch the unmap of large folios during
 migration
Date: Thu, 26 Nov 2026 09:53:00 +0000
Message-ID: <20261126-migrate-rmap-batch-v3-0-4112998fb472@amd.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23PTW6DMBAF4Ksgr2vk8Q8GVrlH1YUZD8GVHBKbo
 lYRd6+BRTbZ+VmaT+89WaYUKLO+erJEa8hhvpWgPiqGk7tdiQdfMpNCNsIK4DFck1uIp+jufHA
 LTrwlRKE9QScMK4f3RGP4PdDPrzMnevwUezk/WaSc3WH31S4DSCWMMlrVsjO6sRy4p7X+duF2c
 SnWOMddHlwmXt4xLH1loMUBcTAt6XFskTpvyTeiE6pBYzo/ehwbSWzvMIW8zOnv2LnCUeKcBPL
 dpBW44K2VziqtFXi4uOiPFju2yhfQgnoLyAIoNFrq0sWgfQHbtv0DHMtH73cBAAA=
X-Change-ID: 20260701-migrate-rmap-batch-8ecc04de1905
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel
	<riel@surriel.com>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka
	<vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, Jann Horn
	<jannh@google.com>, Lance Yang <lance.yang@linux.dev>, Mike Rapoport
	<rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
	<mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, Matthew Brost
	<matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim
	<rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price
	<gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, "Alistair
 Popple" <apopple@nvidia.com>, Joanne Koong <joannelkoong@gmail.com>
CC: Karim Manaouil <kmanaouil.dev@gmail.com>, Frank van der Linden
	<fvdl@google.com>, Kinsey Ho <kinseyho@google.com>, Wei Xu
	<weixugc@google.com>, Bharata B Rao <bharata@amd.com>, David Rientjes
	<rientjes@google.com>, Dev Jain <dev.jain@arm.com>, Usama Arif
	<usama.arif@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>,
	<linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Shivank Garg
	<shivankg@amd.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795686783; l=5412;
 i=shivankg@amd.com; s=20260518; h=from:subject:message-id;
 bh=hCWrcfjh62kyUwHZjNBcmTr+WyNRQRB0VdxsudcPYAY=;
 b=BYIVeiyG3lbO+U4YtOcP7k9sKHEoajddCozp5RNoNImc+VvWKuY1+YD81sZmEHzH0SX+XG8cG
 Xy0KAUpf+32DRZ52MRBHpQ7j8c7OyQLww2B43QrMFa9OLQxFP0LefSO
X-Developer-Key: i=shivankg@amd.com; a=ed25519;
 pk=2l2QGTeXuGkZTtfmx0nPQU8iFZfjYmX/ymMojitevx4=
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|SN7PR12MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: a409c22e-f43e-4fa4-758f-08df4ba31f75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|1800799024|82310400026|921020|10067099003|56012099006|11063799006|261026140227099003|261026121527099003|261028144727099003|261022075727099003|261021123027099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	G7G7ZhJuoFpHtG/hNAdj+FL/gl7o24M9D0BvkElywBO+uJaQYxw5h7zqZ0P/B6xesuIcRuVhZhlpkjtaTm9Qm2cT9ZgpX+JmJLsMcaU6n2YFxLBp1rVFnj1LannBtXbw+ucmk3dhZvGAUak0QdQimu4aYCtfm4ut3KS3LdTfTFUoWwEKNJ/kWG+dA1xwGuWS9CuH7rVe2XEfkENZ+bXwS/0zqADGBSAI7DaK1MMt3o6kTD/nEp2yA4I2qtXxW3sYsAKT5pTFDrLeZLmrYhtpfVfYjaLK8GQ/1m0SPDy5isR5CRNwO/fZcEuwhKUFOIM8rItmLETzKy+DfCdnd/Xo/6JMJvEVY8UWYqviQXzFUn6peTfi0rmNYZIRWWLzbvBBwW5IZSFnAnEaHxY/WdQ67Jkr7TavfH/W1AYjVk1SOCwU5vTqwCTWZlZp00MBmD92Dz8JjO2rRHotNBTsr6Da6p+6/SD0uHJbEaxSv9dKtHVL1jeoFgsPlHQ/LuoPobhcM0sW6BCvUP2gy0lx3yBj14qeXAiTEyUv/XuHUOD8NOyTMkV513pikk23J+Q9cK4sk3ic72P0clqERU+rJmj+DCX3lOpO2c4xTczlfUYtRXTipxh5Fyv6TDG3iliaYpmGmfOlPDwRiuyhuTHUVIUmycBE6yPQifsECnAP6OdbjQ7b44GsUo/nigClrOOcute6
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(1800799024)(82310400026)(921020)(10067099003)(56012099006)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(261022075727099003)(261021123027099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RJBqdj0oG2VbYMqgkzY8izSGwMejfS0DzOq6WSC6V4Fb71cgiYbgDgUsAGdiIgm2DdmErmhx+yTA14NkuY5zeZu9ArxpGtwZG3ipXg+pvSmOGLTc0JWf/MHTszojbmONHtV5U7fA1tlO3ZeMWofzELjIgwqwu+qh79xDah2mwhH8aXpWtiZCQvk/OV0SrXgEd3zpy2YQekeKBs1cs5mDf4kd7PngRhcNLy1TPrVGkTQRerEn1dcs7kkQwsUkRF+Q98YAwPg5ccxYcICcW3Ol7oaZ+aKyrEtNdrCaCTIT+nELNiEt+toIY3nlbabFWEvdDm/Q+0YIGxQV1Vj/bRXML5POQNfkUZE4rw5gS5KYwEUNoZwBbGUk5wnixaVQ4yOsswH2H7s1EpNePnPrlgZavVqxzFIkGwvK8WQkEp3U3SS6TbeC2FTiOFcKj2I/vhaZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 09:53:28.8176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a409c22e-f43e-4fa4-758f-08df4ba31f75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6789

Migrating a PTE-mapped large folio replaces its present PTEs with
migration entries one page at a time: try_to_migrate_one() repeats
page_vma_mapped_walk(), the PTE clear and flush, the migration entry
setup and the rmap/refcount update for every subpage (256 iterations for
a 1M folio).

This series lets try_to_migrate_one() convert a batch of consecutive PTEs
that map the same large folio in one go, mirroring what
try_to_unmap_one() already does, with some refactoring on the way.

Besides the walk overhead, batching avoids a spurious deferred split:
unmapping an anonymous mTHP one PTE at a time makes it look partially
mapped partway through, so it is queued for deferred split even though it
is about to be fully unmapped. Joanne's underused mTHP shrinker series [1]
sends every underused mTHP split through this path, which makes this a
blocker there [2].

Performance:

AMD EPYC Zen5, 2-socket system (1 node per socket), mitigations=off.
move_pages() migrating 1GB between the two nodes, mTHP of the given
size; base is mm-core/for-next + Dev's v5 [3].  Throughput in GB/s,
mean of 40 runs (2 boots, both directions):

  folio   base           patched        gain
  4K      3.39±0.02      3.39±0.02       +0.1%
  16K     4.65±0.02      5.12±0.04      +10.3%
  64K     5.51±0.04      6.46±0.05      +17.2%
  256K    5.78±0.07      7.47±0.01      +29.2%
  1M      5.94±0.02      7.64±0.02      +28.6%
  2M      9.09±0.03      9.08±0.03       -0.2%   (PMD-mapped)

Time spent in try_to_migrate() during that move (ftrace function
profiler, mean of 6 runs):

  folio   base       patched    delta
  16K     43.7 ms    28.2 ms    -35%
  64K     45.6 ms    20.0 ms    -56%
  256K    44.2 ms     8.1 ms    -82%
  1M      41.8 ms     7.1 ms    -83%

On AMD EPYC Zen3 (refer V2 cover), the unmap-side batching gave
around +25.0% at 64K, +38.4% at 256K and +39.5% at 1M.

The restore-side batching from v2 is split out and will be posted
separately.

Applies on mm-core/for-next + Dev's "Optimize anonymous swapbacked large
folio unmapping" v5 [3].

[1] https://lore.kernel.org/linux-mm/20261103212004.1356327-1-joannelkoong@gmail.com/
[2] https://lore.kernel.org/linux-mm/20261109220958.2071687-1-joannelkoong@gmail.com/
[3] https://lore.kernel.org/linux-mm/20261123053543.295467-1-dev.jain@arm.com/

Signed-off-by: Shivank Garg <shivankg@amd.com>
---
Changes in v3:
- try_to_migrate_one(): memory_failure() can poison a tail page without
  holding the folio lock, so check PageHWPoison for every subpage in the
  batch. (Lance, Miaohe, Ying)
- Split the series: this posting is only the unmap side changes. Restore
  side batching will be posted separately.
- Rebase onto mm-core/for-next and Dev's series v5; adapt to
  finish_folio_unmap_batch() and page_anon_exclusive_batch() changes.
- Use vma_test_any_mask() in try_to_migrate_hugetlb_one()
- Link to v2: https://lore.kernel.org/r/20260813-migrate-rmap-batch-v2-0-3c5424c555c7@amd.com

Changes in v2:

- Rebase onto mm-new, drop the borrowed folio_try_share_anon_rmap_ptes() patch
  and add it as dependency on Dev's series and adapt to recent migrate/rmap changes.
- Switch to recently added batched helpers - finish_folio_unmap, set_softleaf_ptes,
  and page_anon_exclusive_batch.
- Rename migration_softleaf_entry_to_pte() to migration_entry_to_pte(). (David)
- Split PTE construction from hugetlb handling into separate patch. (David)
  Mirror the split in mm/rmap.c patch as well.
- Rename make_migration_swp_pte() to make_migration_pte().
- Early exit the single-entry hugetlb page_vma_mapped_walk() paths - removes
  unnecessary nesting.
- Add the missing page_vma_mapped_walk_done() in remove_migration_pte_hugetlb(),
  which leaked the huge-PTE lock. (syzbot ci, Sashiko)
- Fix handling of hwpoisoned subpages in the batched unmap. Read PageHWPoison()
  once and skip batching when mapped page is poisoned, and use same result for
  hwpoison handling. (Sashiko)
- Remove the pte_unused(pteval) handling from try_to_migrate_hugetlb_one() (Sashiko).
- Link to v1: https://lore.kernel.org/r/20260712-migrate-rmap-batch-v1-0-872a734431d1@amd.com

---
Shivank Garg (3):
      mm/rmap: factor out migration PTE construction
      mm/rmap: split try_to_migrate_hugetlb_one() out of try_to_migrate_one()
      mm/rmap: batch the unmap of large folios in try_to_migrate_one()

 mm/rmap.c | 434 +++++++++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 277 insertions(+), 157 deletions(-)
---
base-commit: 518cbccb58e4ff8ce9d7ed609036c559dfdcf62e
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mm/core.git for-next
change-id: 20260701-migrate-rmap-batch-8ecc04de1905
prerequisite-message-id: 20261123053543.295467-1-dev.jain@arm.com
prerequisite-patch-id: 5dc23d00736b03a60a420bce56fdb59aabb57d97
prerequisite-patch-id: 87ecef5648d4102fd0ac1d2c1875aee3476635eb
prerequisite-patch-id: 43f01b72e0fdde751109e0f471c30b15d9f192ac
prerequisite-patch-id: 18bf3505aa2499f4e18446b4930e503d4085346d
prerequisite-patch-id: e79055c5dcb6fae5cb425feddec0e809959fd563
prerequisite-patch-id: 98bc99c6bc274594946d022b3998f5f1dc70012f
prerequisite-patch-id: dd35ec00b82bf235f2e41e286d16eab6a3fd1e9e
prerequisite-patch-id: d6f05c7d00e839fea93a5637b68348a1df345cc4

Best regards,
--  
Shivank Garg <shivankg@amd.com>

