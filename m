Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.139.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794976162;
	b=eUdm507SIFR5dZYMDdJoqoxlWYw10DbZTF8Ps4+1y8kAqj3oHZdUYCDgKMyYroVVRFfK
	 NafwZZZCI6bSxbIC2QuPhpqW24zU+EU1AOFu/GwkUBG10WJWMXeKn/mL4kL4K2tRd3aDn
	 GqmqIw8QGPWrUZXaPGA3Z1fUwzlASyoZ1FtHqxSR/ixr83kSS4clXnJNV6lfrkt5//Fn9
	 qQ1cyAwriYo/ZaB1zfAcqwKXtQm/Dhu2ySNXeeZSlgmA6TC+1sWC2xnvNIVkhoi4l5KeA
	 w0WHiCFtsASyumvF9IlWXDZRbJEwSyON3elnQyMqflm2Jq8O+PwvYQzV/YfQ9p0XWoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794976162;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zDdKei2vMEAeXLILC50Im1ZDZfx8CAWqdgs4l23ZWvU=;
	b=LDQhA2QK8CZFTu/oll2XcaPzzOjcoicIsiAtNsfEB+jO9qfM5d+lahydZURBqo1rPsvl
	 MSMitEn+sCCySrlcpqigCQVSqGCobx/wqBSbWlPYkC3clsAiYz/iXNPIlfkSwv0a9G3oM
	 9qoSX5GL+Udy8szZcUFGMvefKUU/RcJ7AhJZ8kMzIHVZ7v7iBTjtHuba0rtdKReArD+Ce
	 h1KRqEWbnF2biBJfkHWo4XUH7t9VgaWKYN4EB91FgymHBx6sIzcqNBJLZZSvNbWN/wRis
	 8Nz58Pr+PBQpzlAvh+O/G8OW9bcdJLKrH1rpJpUyn6Tc7Ak3QkV9kwamCArN0ObhMfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=columbia.edu;
	spf=pass smtp.mailfrom=columbia.edu;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=IhyowP8W;
	dkim=pass header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=5qtoLi6q;
	arc=none smtp.remote-ip=148.163.139.74
Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91F360A261C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A91F360A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=IhyowP8W;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=5qtoLi6q
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI1XSau3627247
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=zDdK
	ei2vMEAeXLILC50Im1ZDZfx8CAWqdgs4l23ZWvU=; b=IhyowP8WjhewUHW8kP1w
	6j0tcSqtPM8vC2Cj5KBA7d77bsmlffEPsKJQC6zFhGIrApcn9DJS8tyJANelTpow
	hj91jIPmLHO2iAhHswNyqVqzb51t+CyA6VEq3XSyZuNgNspymfxqup/lMdMkkNxU
	NH0MOXW2OWhalTUqMcK8UWIwPzknWnbIZujsabmgAfmMetEZGodmQ6ed08hcg2//
	MFrYcaGBD9iuSwEePvRhxNIUdk+lTJ+iTsSN1Qd6ZYJHjG0E+qbFs6P3+ztx/wym
	VUXWnM7xNr7Wzy+7CziaYbd8HcMv6s4avpd2/cynD2Ube4udXBQp1bja69/uHKzq
	rA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4j0yu79gd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:29:15 -0500 (EST)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495af07676so107308585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1794976154; x=1795580954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDdKei2vMEAeXLILC50Im1ZDZfx8CAWqdgs4l23ZWvU=;
        b=5qtoLi6qhhObgP3dEqAZ2oCoCVyjJ4vqdLRqkbiYp42zqt0mhr5qITubc9ZmWC9+4/
         mVBYCerdHwIh/j01G7oTZbjVuivif2HSQt2PGHLpSP9zVtU02GzmJzR1GEFXTiMt3Zv9
         8cPtSwTy+PqzZ41nlBpcrO5Gk4U6lxVMSC+nZRTbZEr/qe0b5ZOOCA/IUKjSF+IgfVLN
         iMY12yCulFoLPh9FoVJhgzYKCUyqLk2Rc2edHwrHKvxCsxqOb6t6TH9oonzzxnCHTQYw
         InjJ8PaVPOLOE933AEsAA2nhatehE2TtzrEb/BethsZGPb14a/bqKv5Od1RRGBKSkCQ2
         NoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794976154; x=1795580954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDdKei2vMEAeXLILC50Im1ZDZfx8CAWqdgs4l23ZWvU=;
        b=Wv95OnjFBNNPXLg+Jnxen3T/r5enlxUWr/CKvetbhbhA2etjMh7oJiMy1cKbRbqTMb
         5O7LdlZqQPlYOlxbuuWI3i54XFocyGG9FZENQTvpOUUAEHjyuknXWVcqd41I4kSWY4bI
         vJmLbI26LiwetIUQIrekqFhV3LeBFsV/ejf8vxntwfXyzawvhWjnom0Zr7VrbRDUIfNL
         G/kzP2z6PvD1EgmAZdxRCJiSbSmMowphTpyEaL66oKNYmI2vLl3skbxoGbG0UCZ/loN7
         g/ysPLF/Yc/uEBs4PbgJTUhz9HueUy2CUhdHdxp1vq99bJ1fkB0p6/qci48bMqHuCrDl
         7x5Q==
X-Forwarded-Encrypted: i=1; AL+hErH9VT36gr+XeDm0tLujqqzpr/5UV6mBXnq/ziiLB/SqV4UrKSKp0c1+urLg/k72xaqhSUb8HJc6whD2yOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RmJuSiVNcCvEo8ZX1TLs8ntVGFldAnuzZSemS/5chycS5D8mC
	ZZ4YYYbNbf5ZTx8vvOA+dXDwRPKDKrsj/CwoFx18xxgdyYHeI+hKXHAxiPk+iZC4iN7nMAjtxO0
	KzKS4jzX+22PHCcXjKZXoPFYF2i+MSNKJNPKXM4CVkCAIjYwDMe8Z2Q5N/QpCVg==
X-Gm-Gg: AYBFou0GQkMe4jhsotIbab/7z2T7HMjzPO2+uE5FxnLE2zLaKx9sfn2/Xy09pvpjGjU
	abGiFwdJJiLbnBXcnzrdFGsoMEWwPqW2zApgG508YBbhp736qkfNhsaRAsJY1LTysJpRes12rg4
	x0KXw9KAcUkHJJsEp0KTNq1Wrgy4yLGe2fLwiovnlveffrcFTnPoiujex0qrr5gXWjsELT0ANV2
	joAA6exKf+zDJvNN/zXLaU6lFBcOpeTBHtctL5Y91RN8pLmAYIOjQmnLfNYny23Cw72COorflSs
	+U4EVK+N3NHXLJGb3hTe01mDBLiHRXN7vy5Z7dG2hlD5YK4KOAZWjIYeyd7FPfbFMf6BXtKWf4+
	viqA1NbLFJVExNPe9TM2Fe72jpFUQ/PUIIQxOUY0jrdNwhCTZfcqMplESYIVv83YzLV/D8g2VIl
	NcxMpuWqUurITGrb3wmQ==
X-Received: by 2002:a05:620a:6cc5:b0:939:6dea:4f1b with SMTP id af79cd13be357-949997683b6mr310407485a.49.1794976154746;
        Tue, 17 Nov 2026 20:29:14 -0800 (PST)
X-Received: by 2002:a05:620a:6cc5:b0:939:6dea:4f1b with SMTP id af79cd13be357-949997683b6mr310403485a.49.1794976154331;
        Tue, 17 Nov 2026 20:29:14 -0800 (PST)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b743a8bsm89678085a.17.2026.11.17.20.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:29:13 -0800 (PST)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 17 Nov 2026 23:28:44 -0500
Subject: [PATCH v3 4/9] mm/migrate: warn on a writable migration entry with
 the uffd bit set
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
Message-Id: <20261117-uffd-state-fixes-v3-4-b617009d1a4a@columbia.edu>
References: <20261117-uffd-state-fixes-v3-0-b617009d1a4a@columbia.edu>
In-Reply-To: <20261117-uffd-state-fixes-v3-0-b617009d1a4a@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
        Peter Xu <peterx@redhat.com>, James Houghton <jthoughton@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Balbir Singh <balbirs@nvidia.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
        Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
        David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@suse.com>,
        =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andrei Vagin <avagin@gmail.com>,
        Muhammad Usama Anjum <usama.anjum@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
        Ying Huang <ying.huang@linux.alibaba.com>,
        Alistair Popple <apopple@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
        Kiryl Shutsemau <kas@kernel.org>, Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        =?utf-8?q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794976146; l=2256;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=iVphMSJ7Urh2fIXcYVatrMOzIkJtjyML23OJSADW9gA=;
 b=ufH6wJASUrwLe+a2SyLTMf7lQHuEBbZ7mTnTLAFziy7DuvjbLfMCP59gSJiwfXv3bKRlnt5EK
 RqrfDVkmiExBSNfYuxADHn5NDFZ2h9wOlHN/h1lWWBjjh5ZZDmfFBMS
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Authority-Analysis: v=2.4 cv=LvgHWXdc c=1 sm=1 tr=0 ts=6afd299b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=Le39LiMa9jTJABa3:21 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=x7bEGLp0ZPQA:10
 a=A0y_DWxS2BwA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22
 a=azVShVRs0zEubeQ0wG0L:22 a=LFElCxfDvO3_aldaUb0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: kyy5WVlgEw3sQanF_6BEUsvGGaIwxlF9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfXxruf43pI8Am0
 G6xI2LD8DtaaQOuTJ6FDg+/GnvBSucm8Kde812aGmEcPLydU0Cjh1id+9ihkZiUgPgITXc7A/BH
 DHHEy2H1JeQBFUFwdeBj6yiRLAO4vDimwDhz+Riad3eCQueLAGRW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxNyBTYWx0ZWRfXyCTjgISWY16/
 ihs1g/DdNt0jUsQ6bQjwSOGBPWhYJLbDpiyb7HjVi3m1hjlOHC1Uc5ORm2Q6oYqy1kT2KjKCqsb
 BhRbbqidJnqPoo9qdYf6tTRF25N7g8hcDTsargeDzgOT3GNnlcrBmRM4ZvsUZfheicmYwwu+CXP
 L+5RtsqrnqGQfzY4xx/RWk3uB+uQUcxVfwiLwxOG2DjFnEyQpCDrcQ15/4/z4KQVCLKQRUbnCUK
 GMN1zbbIh+nWn1omNq7vkCNa+pVREHlteG9dsl9tUoK/BAVYb92KiGS7HYWZyjeSqvO5UXimZon
 PKMWTQIDJLxQAVxmNyw9ZxW6UvylfjB3szYXVzZhWXhqKCpfRXNPGdQm6npBlvmSv3KYvI/2S7e
 Xj0H7ZsRiCuSHhQ8Oe+Rr/6sOQLib/uY/mIA+yqZJz6YjZQegk9qGYa+GvCCyVxv63OJUUJBAPk
 nEoiwoNeRwLjHkl+b4Q==
X-Proofpoint-GUID: kyy5WVlgEw3sQanF_6BEUsvGGaIwxlF9
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11969
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 malwarescore=0 phishscore=0 lowpriorityscore=10
 priorityscore=1501 adultscore=0 bulkscore=10 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180017

A writable migration entry must not have the uffd bit set. Every path
that sets the bit on a migration entry makes the entry read-only first.
PAGEMAP_SCAN was the one path that did not, and it now does as well.

remove_migration_pte() restores such an entry writable and drops the
uffd bit, while remove_migration_pmd() sets the bit and write-protects
the PMD.

Warn in both paths on a writable entry with the uffd bit set. Also make
the PMD path only set the uffd bit for a read-only entry, like the PTE
path, so that the two behave the same, as this should never happen.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/huge_memory.c | 7 +++++--
 mm/migrate.c     | 7 +++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 0d589be136d2..4a4e187ae3b1 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -5225,10 +5225,13 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct folio *folio
 
 	if (pmd_swp_soft_dirty(*pvmw->pmd))
 		pmde = pmd_mksoft_dirty(pmde);
-	if (softleaf_is_migration_write(entry))
+	if (softleaf_is_migration_write(entry)) {
+		/* Setting the uffd bit must make the entry read-only. */
+		VM_WARN_ON_ONCE(pmd_swp_uffd(*pvmw->pmd));
 		pmde = pmd_mkwrite(pmde, vma);
-	if (pmd_swp_uffd(*pvmw->pmd))
+	} else if (pmd_swp_uffd(*pvmw->pmd)) {
 		pmde = pmd_mkuffd(pmde);
+	}
 
 	/* See do_swap_page(): restore PAGE_NONE for RWP */
 	if (pmd_swp_uffd(*pvmw->pmd) && userfaultfd_rwp(vma))
diff --git a/mm/migrate.c b/mm/migrate.c
index 28a8d7734735..c5b0f57343ab 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -397,10 +397,13 @@ static bool remove_migration_pte(struct folio *folio,
 		else
 			pte = pte_clear_soft_dirty(pte);
 
-		if (softleaf_is_migration_write(entry))
+		if (softleaf_is_migration_write(entry)) {
+			/* Setting the uffd bit must make the entry read-only. */
+			VM_WARN_ON_ONCE(pte_swp_uffd(old_pte));
 			pte = pte_mkwrite(pte, vma);
-		else if (pte_swp_uffd(old_pte))
+		} else if (pte_swp_uffd(old_pte)) {
 			pte = pte_mkuffd(pte);
+		}
 
 		/* See do_swap_page(): restore PAGE_NONE for RWP */
 		if (pte_swp_uffd(old_pte) && userfaultfd_rwp(vma))

-- 
2.39.5

