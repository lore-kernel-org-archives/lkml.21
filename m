Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795072351;
	b=YPKoKHfz192Ks6uXmC1jAi/YkAaLf7ueNzQ88jwB7EUR3koxqi7p5OuPr0pucre5/k3O
	 fQKPy0Bfn3U3pWPjMWgtyGbuqin89QNf2B85L0i6Xge63+koMD0I24YAOTa3sLASOTTuM
	 zCjjym7yqOi1LM9GGgKok9bAMPrgxqy5+/iYkr6kqvgazJ7Fa3hcHx4aNH6DOv8CXh1c9
	 rHhoy3YuMSDMSgnTIRQTKk8CMv7X3RvPTifz7rRXQkAaD5iCHKu4K42vMtbWdOyJLcl6B
	 CgFjb1C4e0ImYtTIwqokKxmRSYZrCdjKGwsWfW+8F/R7R2RHf7p6qyuV0+ueVgBLDZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072351;
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
	bh=nMKjG0R5C9cY8BZydqoRUAEpSU7luNrWagV4Iz6/IXM=;
	b=rqN00VUAl8s9lbLjAZjuB+W4ooa9xt06k4j58y9kLQL8o0ESnnIdP9ceCiqk70jycncl
	 o9vwkIMTSkTwGo8p5q5El/KhtveEugpRN2eBAbg8264fz63CmmjyfxYpuiHmPXnIk4CWC
	 htdW3fuhszdGjWq6hCaO8SwhBpt3yU486KaESv0JlGTFDlvlbxZ6RTkgJMMjC+VlpiBIx
	 75L0fz1oGBaawGhNyh55V5FjmYpdh32UuNCWVPPsbkWA+xNu9WS6GV8MXMm4yG2HC2ksG
	 FS7fo4WDaElMBAKfJifiSLtCfrVxVowLUUaOrw3MsLTy8K0He7pRbQHJ7kQVDgeC/lw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SoV2q9DC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.47
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013047.outbound.protection.outlook.com [40.93.201.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75029606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75029606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SoV2q9DC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dlk39xB3zlPAv9kEpsRYjy8t+nNRZt2qbPQZ9XzAPx/o5220FT5ou/k3hptsB8VPEd2RxUmyNtcjEIt3KM2i+PuBDRx+PWJ+RBNYhAhrsP6h3h5P906MVwraDyE55iCjFQN805rrrS239OZ9Q1YdtmNXdJU14WOEu7iz3mnL6X9cLeEbvQt6L+I9ZeItM7XWJSDXWFUF52zPvKfOwNEEtokqFG3R/ke92MYX8Cpz9Xl2AKAyv9sNorsklS6gEY/ZVOMZYd/QRDTSMq1CyLJh9q7tKgVTFjTcGUK/jjXAWfduTH6PT0Lpvj+Yqp5uzstft/5KvpM/RCh+NXTeDffUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMKjG0R5C9cY8BZydqoRUAEpSU7luNrWagV4Iz6/IXM=;
 b=C+68qaGaeN2HdXlFVyUheHzRyM2dkVILzaW1TO+gyqleOBmu6Q4Q3f2YqqkAGD9QnwGAOVOx8TCCurfLxoPCxZIxQyE6tUB0vBKBZ/RuQydihamdlwfVgRlJNZQM0Gjy0NwRmdNNsyQOxPAE8U/P45Sp2BRsBSedDblewGBXXE4sH9ttMKUNJ5zcDv6kOF9JOQygafveKHxNi6CqWytYkigbI3Yd7TqsHY5Le73fSE0tQWvFNjnd8Z1yEmRrt+Ih+d+aV4PJ+WLPm6NeFLWPy7UB4YyH7q/5UUtRy++lQeOqMX54tBLWxFSz3A6kW3VEZK9St9k8RyVgO+S42xZfHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMKjG0R5C9cY8BZydqoRUAEpSU7luNrWagV4Iz6/IXM=;
 b=SoV2q9DCfSfIwSUZxZrgb93LNh64NrqzxnILmN5DzgUFeXes+eHEkpaOvw8VRCTLb0DcO6yNnlZ8AcdzRhqY0F/xHTqzwN4BIBJ48gPNgo9sKBRZGkDU2UNgJ2eYjcMGTQSxPf2acTQVsJnAtUmUezNW0dK66joBrlgk0I8ntOc=
Received: from MW4PR04CA0088.namprd04.prod.outlook.com (2603:10b6:303:6b::33)
 by SA5PPFE91247D15.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 19 Nov
 2026 07:12:22 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::45) by MW4PR04CA0088.outlook.office365.com
 (2603:10b6:303:6b::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 07:12:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 19 Nov 2026 07:12:21 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 01:12:15 -0600
From: Shivank Garg <shivankg@amd.com>
Date: Thu, 19 Nov 2026 07:11:57 +0000
Subject: [PATCH v2 2/8] mm/migrate: handle retries in migrate_folios_move()
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
Message-ID: <20261119-migrate-refactor-shivank-v2-2-f4535bd0bc52@amd.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795072323; l=5206;
 i=shivankg@amd.com; s=20260518; h=from:subject:message-id;
 bh=3cFyeDx15OK/0bIWW54xS5UBpC92AWVTpMK1D0Y7CY8=;
 b=13Fvod3tNOBi1qwgUEODvKEMEFZffCbSWX/NGBS92hbEqYAIbOjgqCsmhLHmOUOLUCMUhcMBU
 mrg4ICgpDT8CTkgGtW1zI8MjGmRXlaBqIbo+zRXbrulCBNdoTY3Vjr9
X-Developer-Key: i=shivankg@amd.com; a=ed25519;
 pk=2l2QGTeXuGkZTtfmx0nPQU8iFZfjYmX/ymMojitevx4=
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|SA5PPFE91247D15:EE_
X-MS-Office365-Filtering-Correlation-Id: 981ee6fc-69b8-41bf-0c4d-08df460c749f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|1800799024|82310400026|11063799006|261021123027099003|261026121527099003|260925022911599003|260925021311599003|260925021911599003|10067099003|921020|261022105027099003|261021121427099003|261026140227099003|261102123227099003|56012099006|261009223027099003|261028144727099003|3023799007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	p4vZQMJ6KyomwMdNjoDROmMQT+9edGB4dkFITv3fixjhr1lPAlTgUSe1QVLIkXWJpfhh6kKdcC6LNfRLOYYkPj61i7ofnfHmjeBDV7fZhKLNcLZWYSKukD3z+yO4EqGFqssYTOhgTEhUs6XIBHrmZ2Rl/lq6fKxE4RbyhoXI4dGAARRVqM3D2e3/pRaingnnakfeKZp/3dyeRfZsfJRwqYHVQJ2Sg+tLP2sfd3uU5a1ci5sxwNfQtLhSvW7gaFp4dwI1tOXBIht8PJM972gyjKnJLXeR6jCpr8/RRq4YC3EPIUWmv+/SLH6F9/3Tpa1XcK2d6JJ7HEg/ZZYX+CtYs8p3X52WGfK+4x48MAennU7RiOXGB6nBv9A5OfFMaAIutcYLmMGpbApiPasyK2pNlGJ6to6UUHb/sgqEUHQzEW72YI/caeZOKwtVmwY9bgl+gXcibmsv+zh+6iYqjlfy1ZnV/K96adMg6l24GouoZRY/3FSmgZ1lM/iH3Nd/XbvDnQ6kCzgsMPxr8zW0E7s1JwovBjEuG2MlIjr/pdv4zgNS+QSf1YoKjlKKzs9ay/Gr7XHSMB4whxJFkW2DH4plqijCB/bcAgTaAiqIKyIqSggF/0razYqiuvo5sxiIWdPm/a4FVOold53yix2JLHzivDqqpcenGi4EU2wtAPvyL2mO4kCEsb7aexsK3EHLi4KKN5G61hJSOwLsFPQyTK89Fu/ErOTZMpiEGMSCcQ5TfWYvM2zNc6LpKxU446sddyej
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(1800799024)(82310400026)(11063799006)(261021123027099003)(261026121527099003)(260925022911599003)(260925021311599003)(260925021911599003)(10067099003)(921020)(261022105027099003)(261021121427099003)(261026140227099003)(261102123227099003)(56012099006)(261009223027099003)(261028144727099003)(3023799007)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CekwpVlPUlgWgi3XtKxRX2aFsr23XxiyLYyhzL4tNE5aTM681UX1anEX0wdGmWWT8WmaJi0fUbOk2uttdvEL5Ryg1Yy75AnVuptSqTTy7Jm05XP/E1Mn6Q/RrjSv0nkGoa0wwxepLKc5nB4HGalIkhIZmHnuQlvkF/NdM0cMGGwSr2+Q5RZqbbuR2z6PSuAyFlC1J7mfOPwWsy5Y6BXmWudmVpLtRWZePeRM1mdkGqszjRMTLapTKeObE4dqIZPa2FtO6uylvOWpwUI/CkTqHySjNjwNs0e+VZryFTJSnlaK/fJW/alsfIB2U8K/Omj7+K31rWI1iYSV+eaABTBZnkqKQ4KMRM9vaMGPM5FfqfFFLLLnOwwMJ8JySc+VURWCjbepIEKjnzpv4xl0PXVK4QOiMjTcvY98lgyekoHKps0lv4Quoq3S9+J2RD3yAoQP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 07:12:21.8674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 981ee6fc-69b8-41bf-0c4d-08df460c749f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFE91247D15

After extracting the unmap phase, migrate_pages_batch() still drives the
retry loop for the move phase and passes its retry bookkeeping to
migrate_folios_move(). This splits the move phase across the two
functions and requires several output parameters.

Move the retry loop and its bookkeeping into migrate_folios_move().
The function now takes the number of passes and reports failures through
@nr_failed, matching migrate_folios_unmap().

No functional change is intended.

Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 mm/migrate.c | 109 +++++++++++++++++++++++++++++------------------------------
 1 file changed, 54 insertions(+), 55 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 3f1639516623..1f4ddd23cea1 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -1757,56 +1757,71 @@ static int migrate_hugetlbs(struct list_head *from, new_folio_t get_new_folio,
 	return nr_failed;
 }
 
+/*
+ * Move each folio on @src_folios to its destination on @dst_folios, retrying
+ * folios that return -EAGAIN for up to @nr_pass passes.  Pending folios stay on
+ * @src_folios for migrate_folios_undo().
+ */
 static void migrate_folios_move(struct list_head *src_folios,
 		struct list_head *dst_folios,
 		free_folio_t put_new_folio, unsigned long private,
 		enum migrate_mode mode, enum migrate_reason reason,
 		struct list_head *ret_folios,
-		struct migrate_pages_stats *stats,
-		int *retry, int *thp_retry, int *nr_failed,
-		int *nr_retry_pages)
+		struct migrate_pages_stats *stats, int nr_pass,
+		int *nr_failed)
 {
 	struct folio *folio, *folio2, *dst, *dst2;
+	int retry = 1;
+	int thp_retry = 0;
+	int nr_retry_pages = 0;
 	bool is_thp;
 	int nr_pages;
-	int rc;
+	int pass, rc;
 
-	dst = list_first_entry(dst_folios, struct folio, lru);
-	dst2 = list_next_entry(dst, lru);
-	list_for_each_entry_safe(folio, folio2, src_folios, lru) {
-		is_thp = folio_test_large(folio) && folio_test_pmd_mappable(folio);
-		nr_pages = folio_nr_pages(folio);
+	for (pass = 0; pass < nr_pass && retry; pass++) {
+		retry = 0;
+		thp_retry = 0;
+		nr_retry_pages = 0;
 
-		cond_resched();
+		dst = list_first_entry(dst_folios, struct folio, lru);
+		dst2 = list_next_entry(dst, lru);
+		list_for_each_entry_safe(folio, folio2, src_folios, lru) {
+			is_thp = folio_test_large(folio) && folio_test_pmd_mappable(folio);
+			nr_pages = folio_nr_pages(folio);
 
-		rc = migrate_folio_move(put_new_folio, private,
-				folio, dst, mode,
-				reason, ret_folios);
-		/*
-		 * The rules are:
-		 *	0: folio will be freed
-		 *	-EAGAIN: stay on the src_folios list
-		 *	Other errno: put on ret_folios list
-		 */
-		switch (rc) {
-		case -EAGAIN:
-			*retry += 1;
-			*thp_retry += is_thp;
-			*nr_retry_pages += nr_pages;
-			break;
-		case 0:
-			stats->nr_succeeded += nr_pages;
-			stats->nr_thp_succeeded += is_thp;
-			break;
-		default:
-			*nr_failed += 1;
-			stats->nr_thp_failed += is_thp;
-			stats->nr_failed_pages += nr_pages;
-			break;
+			cond_resched();
+
+			rc = migrate_folio_move(put_new_folio, private,
+					folio, dst, mode, reason, ret_folios);
+			/*
+			 * The rules are:
+			 *	0: folio will be freed
+			 *	-EAGAIN: stay on the src_folios list
+			 *	Other errno: put on ret_folios list
+			 */
+			switch (rc) {
+			case -EAGAIN:
+				retry++;
+				thp_retry += is_thp;
+				nr_retry_pages += nr_pages;
+				break;
+			case 0:
+				stats->nr_succeeded += nr_pages;
+				stats->nr_thp_succeeded += is_thp;
+				break;
+			default:
+				*nr_failed += 1;
+				stats->nr_thp_failed += is_thp;
+				stats->nr_failed_pages += nr_pages;
+				break;
+			}
+			dst = dst2;
+			dst2 = list_next_entry(dst, lru);
 		}
-		dst = dst2;
-		dst2 = list_next_entry(dst, lru);
 	}
+	*nr_failed += retry;
+	stats->nr_thp_failed += thp_retry;
+	stats->nr_failed_pages += nr_retry_pages;
 }
 
 static void migrate_folios_undo(struct list_head *src_folios,
@@ -2034,11 +2049,7 @@ static int migrate_pages_batch(struct list_head *from,
 		struct list_head *ret_folios, struct list_head *split_folios,
 		struct migrate_pages_stats *stats, int nr_pass)
 {
-	int retry = 1;
-	int thp_retry = 1;
 	int nr_failed = 0;
-	int nr_retry_pages = 0;
-	int pass = 0;
 	int rc, rc_saved;
 	LIST_HEAD(unmap_folios);
 	LIST_HEAD(dst_folios);
@@ -2058,21 +2069,9 @@ static int migrate_pages_batch(struct list_head *from,
 	/* Flush TLBs for all unmapped folios */
 	try_to_unmap_flush();
 
-	retry = 1;
-	for (pass = 0; pass < nr_pass && retry; pass++) {
-		retry = 0;
-		thp_retry = 0;
-		nr_retry_pages = 0;
-
-		/* Move the unmapped folios */
-		migrate_folios_move(&unmap_folios, &dst_folios,
-				put_new_folio, private, mode, reason,
-				ret_folios, stats, &retry, &thp_retry,
-				&nr_failed, &nr_retry_pages);
-	}
-	nr_failed += retry;
-	stats->nr_thp_failed += thp_retry;
-	stats->nr_failed_pages += nr_retry_pages;
+	/* Move the unmapped folios */
+	migrate_folios_move(&unmap_folios, &dst_folios, put_new_folio, private,
+			mode, reason, ret_folios, stats, nr_pass, &nr_failed);
 
 	rc = rc_saved ? : nr_failed;
 out:

-- 
2.53.0

