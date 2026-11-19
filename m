Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795072377;
	b=Z55KO7Q+qoQMAAYMNSCWPUhDRQ6NvASHn17J/vFRaXay0DbomcH4OjKABnWjSoYtAHZS
	 dKTCnx+mpT5b+5ifxLlP+hTOoOGYKxB3UupgclZicovUUYVWZtpXU31Sra8UU6002KSRe
	 uUoqveR7/gBXy7LL4Cs+lukg7OIroOOlKLAx3I1O65nYHRKUQKzWzPYS8XoV/+llwp9Av
	 0zgc4LbLSQMghL0k1HZ6KtuHI/i1UEt/vgDnPuBLB6V9oUFKQ9fPDxpMZN2fS+CRfOzIt
	 9mWuIo1kcBJq+seXToKVpmQJJOM8QNGIq9yIGmMYvLC7s98e8CeWudY/k+8leE9AkwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072377;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:CC:X-Mailer:
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
	bh=+fE7McidcXr+JCyUe2YnvsRPaG2CfgTl8OPZehhAKKM=;
	b=Og4QVbRm261oRxHPeKAQGCkqdUe1Y7YYEMphkMyKBmdQfVY+qwqpeVXVQEhUpIBDRMCR
	 cX60Ont4DZqRROsNGCRG+7itfJZfL2yA1Irzn9fH9jmpZ1D5hPdD/b8BQE6x880rbjodI
	 mSnc+leT6IY8dndoUHakziVvKsj9r1B2hTlWunspZhQcCsP2OuZn2sd+VvR3gFX6ux82C
	 Rtjz2qVduw5V1PiaiLzjOXzLgSdXs3+XTYABxEeWbHXM/SOmKd4EZf/M8PMXabFtVr3qp
	 uxFM7meZVewDLrfEJm9zKOAq3uOsHRkgrmxYlOJUDXXMob/TVmjbBJXL0uwPXkwymXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ptDxYhjh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.41
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4207E606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4207E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ptDxYhjh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REVLoIPd0p8Ovo4X9WcP7W/xCMrueDeps8cefO3hj1J/nfkn/rIMOtdu/rU7Nkz2Hd2sfUwvzqROOQq90SYcIeiQSufNCJACDwabFCacazMV1pe6RQB47E94oRKTV3WuBWHnzHJj1V+cEYESpWYrfXtFH8fP/wO6pP0ehUgDO90krbs1zOwx95C2QfJ98aZtOQbn8u3OZqLsyw7edRq5FWJTWQuBwAPqbHo3AQOJ4ASeiMymg4cZzEzRgONL/Grc3pb3APIibDlxHgPDYVwE8yETxUdEYV9U9vZA7kYYONyBoT/PytXziPJoFXukKEXBbuPmwEim+oPABxQLf5ZOAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fE7McidcXr+JCyUe2YnvsRPaG2CfgTl8OPZehhAKKM=;
 b=VjULUO8MW9vgWWPmluNVqbCed1rv4p1GJlFan+n0i7dO7k47UV+3C8Nx2cz1PfXekQZz/8ZyW9WiryGNkvro05gazmqGsLlwRH22+AiV23thLzOF6+T4mzWnHRwuIRVPaBHHURao43RsidY+rEjQYf9a4d1IRgmi6RrUfDLZB/nJRZSvG8X9MannJCOUg0exUgO54uiO7Rwd9iGVyMX5RX9+qNV9AVcszcHXYt00tZxW+1uiqBeDcCC5SIdd9SvfP8FhukcSwd88avz3QTixI0T9p/qMI1cKEmnA3YcIhnAHC/4wia4V6izfWs6yBPc5nW69fVN/EWJoHxi8eq4liA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+fE7McidcXr+JCyUe2YnvsRPaG2CfgTl8OPZehhAKKM=;
 b=ptDxYhjhi7kTQ9i30OA2aE7MmvdNUsp1MiF3tbl1ifJEtFZXssrqrVMI+wu8D6obGVtKVtGZ3pJfezfnVf8LkWMLHl1La0oV/6NnBgjxFr6T1iF44d+fU1J8JMRt0lONPsVN68Hw7lepAz6s/bzeTJKXBBz9fv64ol+qC6pfcco=
Received: from SJ0PR03CA0057.namprd03.prod.outlook.com (2603:10b6:a03:33e::32)
 by DS2PR12MB127457.namprd12.prod.outlook.com (2603:10b6:8:4df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 07:12:51 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::5c) by SJ0PR03CA0057.outlook.office365.com
 (2603:10b6:a03:33e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Thu,
 19 Nov 2026 07:12:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Thu, 19 Nov 2026 07:12:51 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 01:12:44 -0600
From: Shivank Garg <shivankg@amd.com>
Date: Thu, 19 Nov 2026 07:12:02 +0000
Subject: [PATCH v2 7/8] mm/migrate: fold the LRU batch paths into
 __migrate_lru_folios()
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
Content-Transfer-Encoding: 7bit
Message-ID: <20261119-migrate-refactor-shivank-v2-7-f4535bd0bc52@amd.com>
References: <20261119-migrate-refactor-shivank-v2-0-f4535bd0bc52@amd.com>
In-Reply-To: <20261119-migrate-refactor-shivank-v2-0-f4535bd0bc52@amd.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand
	<david@kernel.org>, Zi Yan <ziy@nvidia.com>, Matthew Brost
	<matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, "Byungchul
 Park" <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang
	<ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
	"Lorenzo Stoakes" <ljs@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>, Yiannis Nikolakopoulos
	<yiannis@zptcorp.com>, "Bharata B Rao" <bharata@amd.com>, David Rientjes
	<rientjes@google.com>, Huan Nguyen <nhuhuan@google.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, "Matthew Wilcox" <willy@infradead.org>, Hugh
 Dickins <hughd@google.com>, "Vlastimil Babka" <vbabka@kernel.org>
CC: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>, Shivank Garg
	<shivankg@amd.com>
X-Mailer: b4 0.15-dev-47d62
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795072323; l=5414;
 i=shivankg@amd.com; s=20260518; h=from:subject:message-id;
 bh=HRc8/N9VNnxJhjShfuKB7xDK26VNXsT7mHZ67wTwZvU=;
 b=3PQQ4i4/Sb3o9odgTAxWBuU20uQCN6riO/4XK4lBNw3Z+bElY+/eJfhhDk4LE2JcfXDazuJYW
 Y8pqfjdDZvDBpv3MjSx2ktW0VPMF3/6G9DcJtmR6p0TFH+ab5orQ0OV
X-Developer-Key: i=shivankg@amd.com; a=ed25519;
 pk=2l2QGTeXuGkZTtfmx0nPQU8iFZfjYmX/ymMojitevx4=
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|DS2PR12MB127457:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb4352d-7d04-4c28-784c-08df460c8623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|7416014|36860700016|261009223027099003|18002099003|22082099003|261021123027099003|261021121427099003|261028144727099003|921020|261022105027099003|261102123227099003|56012099006|261026140227099003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	f3C+VyZ0jyqDQfBrEbrT5YV3h5FK/nmnhr6eKJghBJB9gujUcUswdV8j8ri6LtjbKIJClrBhShlLJyeJIsPnh07BmbZRpTUj/WK2/jJ65CV3cDtee6LaNhCZey7JjyVb4i1HBjPWQ9qWE7vF56BdRStTeD3LHZZkMElLr9udc8QwXDzVnIRyciLX2ptjSKTidBOA1ydYH1HiILI2+Fl03LCvtNhZpfas1aTG9o34VhP6vnQEHjsL8xvb6FCc1gtxWMJM3GUvqeNtjaf5y+znOvnOYbd2iGtCzQHxBdBVU5F+E3PsPbQ4n22raDvmnHmM+8AwOdM8JCUVJmUBtD4O1YgnfXsDNmt4BxYaJXpv4CWPKeBfKZg/Mv1Qfu3sTDL+BTLBqKOfeLmhJUvRvccxzbu3ovV1vv0qxThraohQSLAhqqVjuhD+OxkzRjiCy4zajzwsNYcuLEA/DbtrQQ/SxeitioXAOUc4Q528stH1KAkKfJbeqFYDxkizhH0Ra73ovRA9AyHypu5cQCN+Z90u1ibZQuniQa08DYZfUM+C0ddKP5uyhqRviMQMDMRSohqwEKwMdIimA07ZlLLTQsvnuJ2P09A+4paD988GOSCo19FbRFaa5DWSZ6n4CyIyFOsgiugbmi3YKNHQCISXKGq9D4UvAnG7x23ugGxaaZJ4r6W6KrNpEgSZnaYY90Xl6AcN0CxFivFAhnDFazCf0SBhBAsMmyr+V4fP0lJxg+70MN+TyR/Tfgy1xABM+vC0E6by
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(7416014)(36860700016)(261009223027099003)(18002099003)(22082099003)(261021123027099003)(261021121427099003)(261028144727099003)(921020)(261022105027099003)(261102123227099003)(56012099006)(261026140227099003)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xh0EAvMnG2OP88LT//dgzGkZDwz8zBeTGRCMZBf2zBn4OItckiHm3rDlZIIuVCuTH6P4DEu7n+LX81EuX9pBiR2Rq/84HUd75g0MC2T6TiC7IYoPMkSyWxsLveXUSn3pH6lO3+4iY+wit27JhFQuO3nGZegETTdVDn7s8x7yUFzsuWRZSTPB6yGgbAvY65QgANmJrrQGELPsYzKZQ7xgwctSVOsHDtUhywtZWoakodJX1r3jAB20bX7oiLpEVyAzFNHSKZvrVUZVuAzC4rdMklPXw185PVy01xaSb9Ol51uc1D22GcDxFRaPvdYM/G2hELFjyc6vMP1Pn7EOAA1TfkM2uzqR+OeTLRoREU6CSef+qV2GiOTvUrmE/DC0s/y0V1I0zk6QJsAo8hR4I169I4+lYxEuzLvROkc4Sf18WLX9llGHGHV2c+C/KKopAoY2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 07:12:51.2479
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb4352d-7d04-4c28-784c-08df460c8623
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB127457

migrate_pages() calls migrate_folios_batch() directly for MIGRATE_ASYNC
and migrate_pages_sync() otherwise, and then retries the folios split
along the way itself.

Turn migrate_pages_sync() into __migrate_lru_folios(), which migrates one
batch of LRU folios in any mode and owns the split folio retry. This
leaves migrate_pages() with a single call per LRU batch.

Keep the existing retry and accounting behavior unchanged.

Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 mm/migrate.c | 70 ++++++++++++++++++++++++++++++++++--------------------------
 1 file changed, 40 insertions(+), 30 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 1d44c6ce48cd..bad69e1e2ac4 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2200,20 +2200,34 @@ static int migrate_folios_batch(struct list_head *from,
 	return rc;
 }
 
-static int migrate_pages_sync(struct list_head *from, new_folio_t get_new_folio,
+/*
+ * Migrate one batch of LRU folios.  MIGRATE_ASYNC processes it directly.  The
+ * other modes first make a short asynchronous pass, then retry each remaining
+ * folio separately in the requested mode.
+ */
+static int __migrate_lru_folios(struct list_head *from, new_folio_t get_new_folio,
 		free_folio_t put_new_folio, unsigned long private,
 		enum migrate_mode mode, enum migrate_reason reason,
-		struct list_head *ret_folios, struct list_head *split_folios,
+		struct list_head *ret_folios,
 		struct migrate_pages_stats *stats)
 {
 	int rc, nr_failed = 0;
 	LIST_HEAD(folios);
+	LIST_HEAD(split_folios);
 	struct migrate_pages_stats astats;
 
+	if (mode == MIGRATE_ASYNC) {
+		rc = migrate_folios_batch(from, get_new_folio, put_new_folio,
+				private, mode, reason, ret_folios,
+				&split_folios, stats,
+				NR_MAX_MIGRATE_PAGES_RETRY);
+		goto out;
+	}
+
 	memset(&astats, 0, sizeof(astats));
 	/* Try to migrate in batch with MIGRATE_ASYNC mode firstly */
 	rc = migrate_folios_batch(from, get_new_folio, put_new_folio, private,
-			MIGRATE_ASYNC, reason, &folios, split_folios, &astats,
+			MIGRATE_ASYNC, reason, &folios, &split_folios, &astats,
 			NR_MAX_MIGRATE_ASYNC_RETRY);
 	stats->nr_succeeded += astats.nr_succeeded;
 	stats->nr_thp_succeeded += astats.nr_thp_succeeded;
@@ -2223,7 +2237,7 @@ static int migrate_pages_sync(struct list_head *from, new_folio_t get_new_folio,
 		stats->nr_failed_pages += astats.nr_failed_pages;
 		stats->nr_thp_failed += astats.nr_thp_failed;
 		list_splice_tail(&folios, ret_folios);
-		return rc;
+		goto out;
 	}
 	stats->nr_thp_failed += astats.nr_thp_split;
 	/*
@@ -2240,15 +2254,31 @@ static int migrate_pages_sync(struct list_head *from, new_folio_t get_new_folio,
 	while (!list_empty(from)) {
 		list_move(from->next, &folios);
 		rc = migrate_folios_batch(&folios, get_new_folio, put_new_folio,
-				private, mode, reason, ret_folios, split_folios,
-				stats, NR_MAX_MIGRATE_SYNC_RETRY);
+				private, mode, reason, ret_folios,
+				&split_folios, stats,
+				NR_MAX_MIGRATE_SYNC_RETRY);
 		list_splice_tail_init(&folios, ret_folios);
 		if (rc < 0)
-			return rc;
+			goto out;
 		nr_failed += rc;
 	}
+	rc = nr_failed;
+out:
+	if (rc < 0) {
+		list_splice_tail(&split_folios, ret_folios);
+	} else if (!list_empty(&split_folios)) {
+		/*
+		 * Folios split along the way get one asynchronous attempt at
+		 * their new order.  Their failure is not counted: the large
+		 * folio they came from was already counted as one failure.
+		 */
+		migrate_folios_batch(&split_folios, get_new_folio, put_new_folio,
+				private, MIGRATE_ASYNC, reason, ret_folios,
+				NULL, stats, 1);
+		list_splice_tail_init(&split_folios, ret_folios);
+	}
 
-	return nr_failed;
+	return rc;
 }
 
 /*
@@ -2288,7 +2318,6 @@ int migrate_pages(struct list_head *from, new_folio_t get_new_folio,
 	LIST_HEAD(hugetlb_folios);
 	LIST_HEAD(movable_ops_pages);
 	LIST_HEAD(ret_folios);
-	LIST_HEAD(split_folios);
 	struct migrate_pages_stats stats;
 
 	trace_mm_migrate_pages_start(mode, reason);
@@ -2328,32 +2357,13 @@ int migrate_pages(struct list_head *from, new_folio_t get_new_folio,
 		list_cut_before(&folios, from, &folio2->lru);
 	else
 		list_splice_init(from, &folios);
-	if (mode == MIGRATE_ASYNC)
-		rc = migrate_folios_batch(&folios, get_new_folio, put_new_folio,
-				private, mode, reason, &ret_folios,
-				&split_folios, &stats,
-				NR_MAX_MIGRATE_PAGES_RETRY);
-	else
-		rc = migrate_pages_sync(&folios, get_new_folio, put_new_folio,
-				private, mode, reason, &ret_folios,
-				&split_folios, &stats);
+	rc = __migrate_lru_folios(&folios, get_new_folio, put_new_folio,
+			private, mode, reason, &ret_folios, &stats);
 	list_splice_tail_init(&folios, &ret_folios);
 	if (rc < 0) {
 		rc_gather = rc;
-		list_splice_tail(&split_folios, &ret_folios);
 		goto out;
 	}
-	if (!list_empty(&split_folios)) {
-		/*
-		 * Failure isn't counted since all split folios of a large folio
-		 * is counted as 1 failure already.  And, we only try to migrate
-		 * with minimal effort, force MIGRATE_ASYNC mode and retry once.
-		 */
-		migrate_folios_batch(&split_folios, get_new_folio,
-				put_new_folio, private, MIGRATE_ASYNC, reason,
-				&ret_folios, NULL, &stats, 1);
-		list_splice_tail_init(&split_folios, &ret_folios);
-	}
 	rc_gather += rc;
 	if (!list_empty(from))
 		goto again;

-- 
2.53.0

