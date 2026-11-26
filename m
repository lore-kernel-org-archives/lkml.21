Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795686836;
	b=IY5whAu4FuoJQEHGUAqKItOQA+9RlFrNWWmJHE8BIwCK15l0jR92/rL788Pn8BDG6/0a
	 jV+4BwTDcIdggE39+OELCFigq3jtXt5kvgBwooPFnEWNz61hF066ukdZXMKOqcTuqnYl/
	 am8xwYGZekVymE208kio7qwPijk5O5UwTXmTaLnl0b2BcT3RpohYAmwn2MtFYATrHoMg2
	 w9motXUb8mJPdYuM8TLBVto6FMLoLo5nzHwH1D/e670iTXl1uZ/vDL38mFnfcF9wwmBJa
	 LeLMDgHZXQ/y+6dw2eQgk+WI1JYKaUONhNkhhKWbovjty5nkFFM0tzbt0T9kci173TQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686836;
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
	bh=OjnOXgYstCE0C9YCR9njZdUbtJHdqG/Lq0QBg70+/TU=;
	b=QfwXnKmq7rcQKuWTZTx6FFaG/LEbMlP994Jjh9Hx4Z5rGpTv3LxGk57qNwMA7J5tzcC4
	 e9RHDPBQsjSeSJaqZG7a07AzXKhFRi/9nAnUWkwbxgJmKZZ8Z6XXEik7c7csZ+if3dr8b
	 i+fdxhhIPRt2ixf+FEenAKMcygp88+jSQWNu9bZ+COdSrw30FYHvprh5BEi8jGottWXkw
	 1wOiq9JlPIaYaGWguhsvs9x/ZDqiqfeEDSegIALfKXuhCE3TIcMQ6UQ3nNjyVQGPKE/t2
	 NqGb5xWELh39Mbo9MREuGnlj/VOl583eEDhz5kdjaJv868Ef2YhrH+3FrOuiaVIIAfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="F/3WKl/f";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.3
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011003.outbound.protection.outlook.com [52.101.52.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF7460A2613
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BF7460A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=F/3WKl/f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FF2pFVf6cR4INW8wLFrh9ko0gEr3n2jrX22m12ozwlkhuXvCMpNkpzLaSqDx5ZlNtVgafDUZtyhOFSxccto4BoWMavRyduhJIemJYLiNNHI/VL5lnZP5ljOqBAd8Sr3GoDxQZzxa6Mf+iUXnoSHnhd4ENZ4stuIa9CuEXcmHJaoWjd0PdEu9qIk3E8SY0SpapwDVun5HUJNtcE3BKj5V3e0pQs2SE9iZTXcVEdnwKbnBaWLIpjSWdrgGC2DZVvSwzSVe/dxhDhr1qHVOxZJbSAoc5z5aITbi0uWRjW3lmvI2hUs03aS9Ekt1cdAw9ImszD3L7L8Z3QyZ6J5Q8e1TaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjnOXgYstCE0C9YCR9njZdUbtJHdqG/Lq0QBg70+/TU=;
 b=ov2zTPsHRkIU3/Z4xj+KNJPvyiHPcBMVvwPsFggyYC7nGgK2EhxOuYa/W6kIPJGD0d1VIRyP5MPZM37YohUtL+CR9Oj09JdTU4Arzme8BnLy4duU8tcRl3iiunDAXAT6c15vbeI/kgqW6iw7dZEUB+itbtPZOAFNsjJBqKAYPyq6oOIa+WMHmxkxp+YLxqHZz5XMKrr/z0Pe9DcejZr1/h0mrV1keqpfRbno3YbNkqIV70Z8a08/EIPtzc9vn5T0Ahrfg1EAe60YDTRZ8+1Q8QzHCfPhQ2/j6fyIhw0evMDIEh17PqVd7ZE5J5g8r7ELxAsve3WiDqkNRBjTZUvofg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjnOXgYstCE0C9YCR9njZdUbtJHdqG/Lq0QBg70+/TU=;
 b=F/3WKl/f6nU0+l3y4OWwx3Bef888+6tSaeDRa5CBzeN4rN/esP+TLQkN9177F/goBqi4Yiyk/1nzMka3qX0tdcXri0jQ4NP5YmjuLkTKCV0Hd7j3F2fdAdNxgXb689RImfyRlOZVNfneBwnRJad5TNS9uJCL8BrsTYPkQZi9ZRg=
Received: from CH2PR07CA0050.namprd07.prod.outlook.com (2603:10b6:610:5b::24)
 by SA1PR12MB6893.namprd12.prod.outlook.com (2603:10b6:806:24c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 09:53:49 +0000
Received: from CH01EPF000BE94F.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::9b) by CH2PR07CA0050.outlook.office365.com
 (2603:10b6:610:5b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 09:53:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH01EPF000BE94F.mail.protection.outlook.com (10.167.244.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 09:53:49 +0000
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 26 Nov
 2026 03:53:41 -0600
From: Shivank Garg <shivankg@amd.com>
Date: Thu, 26 Nov 2026 09:53:03 +0000
Subject: [PATCH v3 3/3] mm/rmap: batch the unmap of large folios in
 try_to_migrate_one()
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
Message-ID: <20261126-migrate-rmap-batch-v3-3-4112998fb472@amd.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795686783; l=8293;
 i=shivankg@amd.com; s=20260518; h=from:subject:message-id;
 bh=zflR1U0F3SSHk1jxPLyQBthLla8zAKyZlFltmBuWnkk=;
 b=13Ei60LjJ4BmQ8KJNuBqXy7QzW6cko+oTNDeG5Wplsuwet+ICO9TeD9zB3gdfbxw5aAvBEbxm
 gLMYaztMp+XCIIckXuHigKSqm0x72aYNwGrLmHknXG1GJksX75KkY7K
X-Developer-Key: i=shivankg@amd.com; a=ed25519;
 pk=2l2QGTeXuGkZTtfmx0nPQU8iFZfjYmX/ymMojitevx4=
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE94F:EE_|SA1PR12MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: 64051038-0585-4a6a-2cff-08df4ba32bc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|23010399003|82310400026|921020|56012099006|10067099003|11063799006|5023799004|261022105027099003|261022075727099003|261028144727099003|261026140227099003|261021121427099003|261021123027099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	l1BXUcXuVcHbl2UzzW0dPSH8gs2npRVq0NhEpSHS7F+cQtE6JDHb/Zno/ELGurONxFIcRZ7oUn/05eLjYYHAEZTT5Uutf5nXk2m7tTpgJcD9JxjN9KESS2L6OKUyZpZM/7X8IzXkv9eUpeT3F3HOSk+9hz7OTMnQqsCfKgXs38NqzAYNgLuWQQucmZyg4UODvkOWSDp2UVHVi254DFoTVA6Zw1oxz1CmcWpj7JWghoqJyCnXkgrspgmp2QqFeOvf4WJm2BWy2a0QzTC3hIBP0gJy48zKfR3Zzc1EruMQ/hIxO13ncoWbmgjcRHeAEx4C7zgAytVK+3lwtDTl1Z+CsJdlNkCW4l8wsHidN/CgdHuQPtZesRdDU0qbYBVBhll8t9ZIouSoJt7EeqdkiHd6l/wzpGXcMJ9NmaAKuvDXxHgajQx3AWiMpf/9stRt8EGHXQDcIeIKQiPabRfLattJLkoNPrFcfJwYCkZe9jqrYiIbBI5YRsZ4QXfgbNMsCwDD8e/7wlrAyG5PSyNDRlh8965e5t8Ca12qouvNW25L+2p8XF+3ZEeqPRdGnlhNlAIEObYXPpnpMYupDV16O2GhmeHjob4Zn8jJV45rgddDnq8hpaO9/nqjwGawcNfZIMaF96Q2PZiN+7jVeGTyL+Rgk/2NUrMfdLQaStyUn/PjgGWlUub4b54f4YLNCs2s5QLNYP+Aqvuj+sK7nfHoqx1sa/bnXugCeHwESBKeRY5c4TwdVlDGQ91Kl4hVFEhTyCip
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(23010399003)(82310400026)(921020)(56012099006)(10067099003)(11063799006)(5023799004)(261022105027099003)(261022075727099003)(261028144727099003)(261026140227099003)(261021121427099003)(261021123027099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nfn5TvHHy5vFWGaS9zjbgRopoBB3xWf+vY64+lq7fk858UbydqGfDOcfwmUz8YQ9f3ltp1S7tqaz4xzwunaTZivSZHe9dNDiGN5qQc+T/A4uYxNKDIMAkgw4kLHea87/GPq9IMheWjXWY7JmExAvSKStlMIboifeC5lopdnggeNg51auLt0reFAY/cIPyaOv8Qy2XXfKOKdgwJKoWMMqSDN1L0+3JkSrjhnU0+RyCEK6y9JOKe7VBtv+eZrTnpi3FKeuE7fDS4FyN4TA+a52gf1xDaoonK0SyvzCqZSDVENyA0e078ON1kKd69fEx6gb03A4KMMmVBQvP57NHLf2FJKhLFo6vudBtQYFJPO+4zLm7e8jg8g0oQYr+74xPZJ2AGt7UgO82FGlS7Gynl3N8sCiFHM7W+Dhr2QJCUUdAEa1EWSiA7L82SF/RhSE6Vcx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 09:53:49.5111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64051038-0585-4a6a-2cff-08df4ba32bc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE94F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6893

try_to_migrate_one() converts present PTEs to migration entries one at a
time. For a PTE-mapped large folio, this repeats calls to ptep clear+flush,
the migration entry build and set, folio_remove_rmap_pte() and folio_put(),
each re-entering page_vma_mapped_walk() once per base page (256 times for
1M folio).

Mirror try_to_unmap_one() to introduce folio_migrate_pte_batch() to detect
eligible batch for PTEs mapping consecutive subpages of a large folio,
and convert the whole batch in one shot using the batched helpers.

Batching also avoids a spurious deferred split. Unmapping a PTE-mapped
anonymous large folio one PTE at a time leaves it partially mapped between
iterations, so __folio_remove_rmap() queues it for deferred split even
though the folio is about to be fully unmapped. Removing the rmap for the
whole batch at once skips that state when one batch covers the mapping.

A side-effect of this change is trace_set_migration_pte() will record
one event per batched run instead of earlier behavior of one per base page.

Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 mm/rmap.c | 130 ++++++++++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 101 insertions(+), 29 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index fe87df06fa06..ed2f2c956fb5 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2685,6 +2685,59 @@ static bool try_to_migrate_hugetlb_one(struct folio *folio,
 	return ret;
 }
 
+static inline unsigned int folio_migrate_pte_batch(struct folio *folio,
+		struct page_vma_mapped_walk *pvmw, pte_t pte,
+		struct page *subpage)
+{
+	unsigned long end_addr, addr = pvmw->address;
+	struct vm_area_struct *vma = pvmw->vma;
+	unsigned int max_nr, nr, i;
+
+#ifdef __HAVE_ARCH_UNMAP_ONE
+	/* Cannot batch unmap if arch_unmap_one() is defined. */
+	return 1;
+#endif
+
+	if (!folio_test_large(folio))
+		return 1;
+	if (folio_is_zone_device(folio) || folio_test_has_hwpoisoned(folio))
+		return 1;
+	if (pte_unused(pte))
+		return 1;
+
+	/* We may only batch within a single VMA and a single page table. */
+	end_addr = pte_table_clamped_end(addr, vma->vm_end);
+	max_nr = (end_addr - addr) >> PAGE_SHIFT;
+	/*
+	 * If unmap fails, we need to restore the ptes. To avoid accidentally
+	 * upgrading write permissions for ptes that were not originally writable,
+	 * and to avoid losing the soft-dirty bit, use the appropriate FPB flags.
+	 */
+	nr = folio_pte_batch_flags(folio, vma, pvmw->pte, &pte, max_nr,
+				   FPB_RESPECT_WRITE | FPB_RESPECT_SOFT_DIRTY);
+
+	/* Limit possible batch count to a uniform PageAnonExclusive value */
+	if (folio_test_anon(folio)) {
+		bool exclusive;
+
+		nr = page_anon_exclusive_batch(0, nr, subpage, &exclusive);
+	}
+
+	/*
+	 * memory_failure() sets PG_hwpoison without holding the folio lock, so
+	 * folio_test_has_hwpoisoned() above can still be false while a tail
+	 * page is poisoned.
+	 */
+	for (i = 1; i < nr; i++) {
+		if (PageHWPoison(subpage + i)) {
+			nr = i;
+			break;
+		}
+	}
+
+	return nr;
+}
+
 /*
  * @arg: enum ttu_flags will be passed to this argument.
  *
@@ -2696,12 +2749,12 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 {
 	struct mm_struct *mm = vma->vm_mm;
 	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
-	bool anon_exclusive, writable, ret = true;
+	bool anon_exclusive, hwpoison, writable, ret = true;
 	pte_t pteval;
 	struct page *subpage;
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
-	unsigned long pfn;
+	unsigned long pfn, end_addr, nr_pages;
 
 	/*
 	 * When racing against e.g. zap_pte_range() on another cpu,
@@ -2754,11 +2807,8 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
 					!folio_test_pmd_mappable(folio), folio);
 
-			if (set_pmd_migration_entry(&pvmw, subpage)) {
-				ret = false;
-				page_vma_mapped_walk_done(&pvmw);
-				break;
-			}
+			if (set_pmd_migration_entry(&pvmw, subpage))
+				goto walk_abort;
 			continue;
 #endif
 		}
@@ -2783,10 +2833,24 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		subpage = folio_page(folio, pfn - folio_pfn(folio));
 		anon_exclusive = folio_test_anon(folio) &&
 				 PageAnonExclusive(subpage);
+		/*
+		 * memory_failure() can set PageHWPoison concurrently without holding
+		 * the folio lock. Snapshot the flag here to decide whether to batch
+		 * PTEs or install hwpoison entry.
+		 */
+		hwpoison = PageHWPoison(subpage);
 
+		nr_pages = 1;
 		if (likely(pte_present(pteval))) {
-			flush_cache_page(vma, address, pfn);
-			/* Nuke the page table entry. */
+			if (!hwpoison)
+				nr_pages = folio_migrate_pte_batch(folio, &pvmw,
+								   pteval, subpage);
+
+			end_addr = address + nr_pages * PAGE_SIZE;
+			flush_cache_range(vma, address, end_addr);
+
+			/* Nuke the page table entries. */
+			pteval = get_and_clear_ptes(mm, address, pvmw.pte, nr_pages);
 			if (should_defer_flush(mm, flags)) {
 				/*
 				 * We clear the PTE but do not flush so potentially
@@ -2796,11 +2860,9 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				 * transition on a cached TLB entry is written through
 				 * and traps if the PTE is unmapped.
 				 */
-				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
-
-				set_tlb_ubc_flush_pending(mm, pteval, address, address + PAGE_SIZE);
+				set_tlb_ubc_flush_pending(mm, pteval, address, end_addr);
 			} else {
-				pteval = ptep_clear_flush(vma, address, pvmw.pte);
+				flush_tlb_range(vma, address, end_addr);
 			}
 			if (pte_dirty(pteval))
 				folio_mark_dirty(folio);
@@ -2819,7 +2881,8 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 		/* Update high watermark before we lower rss */
 		update_hiwater_rss(mm);
 
-		if (PageHWPoison(subpage)) {
+		if (hwpoison) {
+			VM_WARN_ON_ONCE(nr_pages != 1);
 			VM_WARN_ON_FOLIO(folio_is_device_private(folio), folio);
 
 			pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
@@ -2847,19 +2910,15 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 * so we'll not check/care.
 			 */
 			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
-				set_pte_at(mm, address, pvmw.pte, pteval);
-				ret = false;
-				page_vma_mapped_walk_done(&pvmw);
-				break;
+				set_ptes(mm, address, pvmw.pte, pteval, nr_pages);
+				goto walk_abort;
 			}
 
-			/* See folio_try_share_anon_rmap_pte(): clear PTE first. */
+			/* See folio_try_share_anon_rmap_ptes(): clear PTE first. */
 			if (anon_exclusive &&
-			    folio_try_share_anon_rmap_pte(folio, subpage)) {
-				set_pte_at(mm, address, pvmw.pte, pteval);
-				ret = false;
-				page_vma_mapped_walk_done(&pvmw);
-				break;
+			    folio_try_share_anon_rmap_ptes(folio, subpage, nr_pages)) {
+				set_ptes(mm, address, pvmw.pte, pteval, nr_pages);
+				goto walk_abort;
 			}
 
 			/*
@@ -2869,7 +2928,10 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 */
 			swp_pte = make_migration_pte(subpage, pteval,
 						     writable, anon_exclusive);
-			set_pte_at(mm, address, pvmw.pte, swp_pte);
+
+			/* Set nr_pages migration entries, advancing the PFN. */
+			set_softleaf_ptes(mm, address, pvmw.pte, swp_pte, nr_pages);
+
 			trace_set_migration_pte(address, pte_val(swp_pte),
 						folio_order(folio));
 			/*
@@ -2878,10 +2940,20 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			 */
 		}
 
-		folio_remove_rmap_pte(folio, subpage, vma);
-		if (vma_test_any_mask(vma, VMA_LOCKED_MASK))
-			mlock_drain_local();
-		folio_put(folio);
+		finish_folio_unmap_batch(vma, folio, subpage, nr_pages);
+
+		/*
+		 * If we batched the entire folio, there is nothing left to
+		 * walk; stop right here.
+		 */
+		if (nr_pages == folio_nr_pages(folio))
+			goto walk_done;
+		continue;
+walk_abort:
+		ret = false;
+walk_done:
+		page_vma_mapped_walk_done(&pvmw);
+		break;
 	}
 
 	mmu_notifier_invalidate_range_end(&range);

-- 
2.53.0

