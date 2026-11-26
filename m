Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795686820;
	b=gudvc+QcJqgNUKZuw5Y1/SBECxA5EcTH+2u26I1+Iq8y6P7C9VilnjKfTvK1AdktxoRf
	 AbSTmWV+853XS/oARVdvD0bRH4gQihLAboLs3CmsVL+eT/WfOzbQm9gQt0278mhk1NWJA
	 uAyo2fddoIydwReYiLnvwfociyPwkAfLkhdMLCxF8pAkRuzbxOTCYe7CC0TXsU1Mj7qoY
	 R0UGhGfHuDVVPGBQa9UVb9nYUyfdCwtOA8xcDuFEb1Y7+/V6K3l+FB+F1OEIrE9cunTDp
	 coDTeZtgOirLUAhQrJmNZxltsLVUQkkc53VY3QJcwt2HqGvqc+NMLNYInONUY31ZCTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686820;
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
	bh=ivxskwGpIUUvWRUAvKGC3t4tlefUNzVuGpyVCMKinfk=;
	b=MtQ5qM30VddUx2BEXKqqNOwPtUSjKPgXrXuC43n/RS70v50SNhEVxuOhZuNiAj69u+pj
	 vE55ufSBhMcQedCCPASgPd8+c+qME1OKcHtMhPGDfOXZ+V4jOb9HyRZVaouLthtkVpP8P
	 k0rnqDz+31YaKoOhmzjEFvWcNFkIIE/RfWTarOAYCxj56TMmkEXsebgQBwLMaLXciawPL
	 dUUGnfOu0+N5tnZIFXvsXFlavxGgwlTcaCpknctcUA0LzBxdaJ3E5yUc6RdhbDJQNq44q
	 HmsbxzdGfQzTMchChmAF+vp392jK1ssCRPRMEOALuF13S8LM9Zh88laNRo+Yr7CRAWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3a3ogroZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.30
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013030.outbound.protection.outlook.com [40.107.201.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DE2606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96DE2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3a3ogroZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFk75+9Zn35wxtFxO+WZMWedQsFIyMstyTxiDjwqQwo5BnqgYX0ICOgqzbmtOEeZ2HwW7SADF3r+ePN7kqI2XQHUWt8JdbK611GZhkIOm6gNI0pwXDnBuORuu5PS9nKj2xlQ3U33biZUO4c+RbaK9NxC6iEo0nyLhttLgzC4IhI7WA/SkS6iWM9nTvcC7r2+DEapCAeHqwLvuZ2njrww5vOO+XbqnHLt/6GhbtS8Le/D7XQyRwg8dFa5AaoU5c3a11Nhpa4VNfcNERjqtBYO88cC7VeIzazAzSXDjHqj3tL3+CISehBNT3licGKuaCeC609TfP7KEoFFMZB5dJcSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivxskwGpIUUvWRUAvKGC3t4tlefUNzVuGpyVCMKinfk=;
 b=m8vvm7pQc0aCOing21MZlr9PeBn5wv4Yrm2XtoRSHiL/v1nNlgkelhZBuHmeDu4BW9xxw2DvmO0myvfEU07fK/mO1cDuRZrM8eW4IkldEi2y9yux+uUNXauv0MTYzht1SWIaUTd3nptF09Izm4GaeixEqu/pLtJs15EVbF9GKdb2bvio4ZWobZP6sv0KbiJdH18XzjPVCBToRgHSUi6aTQ86vseATkeLajtoWqH+lvpZzgGg+B1K3syodakzhKMinmt2Y7h4dIOyRqXN6cDKwO0zkSTPVjtzR+pkkH5wfWq1WXgxW4vQ2biLrvBw2FKGa36WfJWGSpPnMgQCwY6XxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivxskwGpIUUvWRUAvKGC3t4tlefUNzVuGpyVCMKinfk=;
 b=3a3ogroZ02uzJezJM2pJgLw1oSuNe0kmmp7GW3zd2bCDV8vRv00thppWrSK6WFMrzuh4RdQQe16QbNz6mFKV55IvSw+J506yVZDB3N+9AVLFhJ1l4Hg2ZpiZekiknKbwS5ZmDkoth607trGgf+aSn80cKIV4Td8VFoEvfYmVlb0=
Received: from CH2PR07CA0048.namprd07.prod.outlook.com (2603:10b6:610:5b::22)
 by MN2PR12MB4485.namprd12.prod.outlook.com (2603:10b6:208:269::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 09:53:34 +0000
Received: from CH01EPF000BE94F.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::7d) by CH2PR07CA0048.outlook.office365.com
 (2603:10b6:610:5b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 09:53:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH01EPF000BE94F.mail.protection.outlook.com (10.167.244.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 09:53:33 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 03:53:25 -0600
From: Shivank Garg <shivankg@amd.com>
Date: Thu, 26 Nov 2026 09:53:01 +0000
Subject: [PATCH v3 1/3] mm/rmap: factor out migration PTE construction
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
Message-ID: <20261126-migrate-rmap-batch-v3-1-4112998fb472@amd.com>
References: <20261126-migrate-rmap-batch-v3-0-4112998fb472@amd.com>
In-Reply-To: <20261126-migrate-rmap-batch-v3-0-4112998fb472@amd.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795686783; l=3397;
 i=shivankg@amd.com; s=20260518; h=from:subject:message-id;
 bh=d5xmsxwRy2+9rbyys7MIo3SJmy8OTWyOXMzoxPJtqAE=;
 b=OwrbxZNuGkFP89x+JKbf4fvwOlQ+z36bwnitfsBJEKU2XIn51ooRGN8h6t0UWbIlz1Lxcaggb
 Wmlymf2NKQhBM87z7MAOyUaE1PYS2Z+zRmAMCo5oNRfSGKZt6ffZFHt
X-Developer-Key: i=shivankg@amd.com; a=ed25519;
 pk=2l2QGTeXuGkZTtfmx0nPQU8iFZfjYmX/ymMojitevx4=
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE94F:EE_|MN2PR12MB4485:EE_
X-MS-Office365-Filtering-Correlation-Id: 0924949a-9c1f-4198-f518-08df4ba32260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700016|376014|23010399003|22082099003|18002099003|921020|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261021123027099003|261102123227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	WRO58mCosr4vioG7WreJ23XhLn4+sQ/29sLtBFm+1HOUSqQN6vOFrjPirMCNAcITkwcYLalWzaqSL+R2wS0C1UbZyAy/z8ssWi6hBVdZZ0+sutdEPVs/jTO0OSgDs1SDr8ZLu9UOQcMTA+y/8i3UAXjNI9GHiP+3rztCys5jMqywy9A3dOon5uAmuzO6Y/vm4dA0b/5Uidt/6n122VLBphRhqMekwzhyocWshM4ibljcybkLjT0A1sxQpW7+y6XER4nwYbjC4jM1eMqpfQSiXFWm20ibsr7IPcKNdd5vcuFQtbVD/eSwB4I5SDDxRJbWv2HdfElAbhGkrvobVJXvA5i4YlKq51i3PGRF+Cbd82FEIv2zfD8FRyt4ux2La4v4T8IX77HNQak0wa7V/22xt2D3hiHvhJz0QK1b8GHc0cTrFeDgen0uhnwWxkxJfHQutY3EFeA2N2/Y1i4AhWYnT7SzcbLdjAWV6lR8wCJVByJFuPTkjWBKl9RktmXe32nfaccTi0tPrZ1Fw4tMDXxb6UUkr6O97OXmGSTaE3pQEXQcszZeY6ocNQ+zmUc1TOLveSZ8zaZvg556XmpJjJgC+Mp0I98RQT5TjfOYl6RCfKunT62B1NtZsmrZlXrecDfBgLVRK8LuSciqWeLiE/RMrDJIKpIR2lVnRCIJ5WOiN/9JyPH8nYD6BZNVacxTCNb4AWlzvRm/83NH3pNwmGARo9I8WpnaMf3o4yUi3fxh918=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(921020)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261021123027099003)(261102123227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+gNnDb/PyQ81fuhq5pKHd0i5/do9QK5WeeezRTAA3uab8wCAPV4hKdNQA1ti39h6VzrAgqncXOKVqtMMczdZnO2IhvBxUWzcY3RlfuOAL9ySNM5iDfTDr3F6uFcOn0mxZAzKmEIrHi9vkozDF4c6+8lVTyX793BSbeKuEnOtvzgwi9lu+xgffzvmu8tphdh2wks6R58uMHVakSH17yCZRfVBIUsBIyr0MrbCrIVNUIAIS+CY7sge9T26smB4lqm6bceCkSuOQIX5qxLwk07ulwOxoHMK5kj0mOWq+sgg1JedSppJKi3HCn9pcw7K7t+inPNGE/18S+XaniDNa05ssbvpQjJaAnYCuSHldQcosRGkTEYgsTChuGapgie6R5PfIoc7cR/nfCIZ6a8E06HbFYUWlUlLIhUTHoNYJbtffzuqEjXfqHbLHY9FNKWBK5iG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 09:53:33.7861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0924949a-9c1f-4198-f518-08df4ba32260
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE94F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4485

try_to_migrate_one() constructs the migration PTE that replaces a
present PTE or non-present swap PTE.

Factor it into make_migration_pte() which can be shared when the
hugetlb migration path is separated.

No functional change intended.

Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 mm/rmap.c | 65 +++++++++++++++++++++++++++++++++++++--------------------------
 1 file changed, 38 insertions(+), 27 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 61f0813e7f23..304581856d67 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2517,6 +2517,42 @@ void try_to_unmap(struct folio *folio, enum ttu_flags flags)
 		rmap_walk(folio, &rwc);
 }
 
+/* Build the migration PTE that replaces pteval for a page. */
+static pte_t make_migration_pte(struct page *page, pte_t pteval,
+		bool writable, bool anon_exclusive)
+{
+	swp_entry_t entry;
+	pte_t swp_pte;
+
+	if (writable)
+		entry = make_writable_migration_entry(page_to_pfn(page));
+	else if (anon_exclusive)
+		entry = make_readable_exclusive_migration_entry(
+						page_to_pfn(page));
+	else
+		entry = make_readable_migration_entry(page_to_pfn(page));
+
+	if (likely(pte_present(pteval))) {
+		if (pte_young(pteval))
+			entry = make_migration_entry_young(entry);
+		if (pte_dirty(pteval))
+			entry = make_migration_entry_dirty(entry);
+		swp_pte = swp_entry_to_pte(entry);
+		if (pte_soft_dirty(pteval))
+			swp_pte = pte_swp_mksoft_dirty(swp_pte);
+		if (pte_uffd(pteval))
+			swp_pte = pte_swp_mkuffd(swp_pte);
+	} else {
+		swp_pte = swp_entry_to_pte(entry);
+		if (pte_swp_soft_dirty(pteval))
+			swp_pte = pte_swp_mksoft_dirty(swp_pte);
+		if (pte_swp_uffd(pteval))
+			swp_pte = pte_swp_mkuffd(swp_pte);
+	}
+
+	return swp_pte;
+}
+
 /*
  * @arg: enum ttu_flags will be passed to this argument.
  *
@@ -2747,7 +2783,6 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 */
 			dec_mm_counter(mm, mm_counter(folio));
 		} else {
-			swp_entry_t entry;
 			pte_t swp_pte;
 
 			/*
@@ -2789,32 +2824,8 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 * pte. do_swap_page() will wait until the migration
 			 * pte is removed and then restart fault handling.
 			 */
-			if (writable)
-				entry = make_writable_migration_entry(
-							page_to_pfn(subpage));
-			else if (anon_exclusive)
-				entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(subpage));
-			else
-				entry = make_readable_migration_entry(
-							page_to_pfn(subpage));
-			if (likely(pte_present(pteval))) {
-				if (pte_young(pteval))
-					entry = make_migration_entry_young(entry);
-				if (pte_dirty(pteval))
-					entry = make_migration_entry_dirty(entry);
-				swp_pte = swp_entry_to_pte(entry);
-				if (pte_soft_dirty(pteval))
-					swp_pte = pte_swp_mksoft_dirty(swp_pte);
-				if (pte_uffd(pteval))
-					swp_pte = pte_swp_mkuffd(swp_pte);
-			} else {
-				swp_pte = swp_entry_to_pte(entry);
-				if (pte_swp_soft_dirty(pteval))
-					swp_pte = pte_swp_mksoft_dirty(swp_pte);
-				if (pte_swp_uffd(pteval))
-					swp_pte = pte_swp_mkuffd(swp_pte);
-			}
+			swp_pte = make_migration_pte(subpage, pteval,
+						     writable, anon_exclusive);
 			if (folio_test_hugetlb(folio))
 				set_huge_pte_at(mm, address, pvmw.pte, swp_pte,
 						hsz);

-- 
2.53.0

