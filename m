Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625287;
	b=vZlq3sLpDgmT5rbMSY9qtWIPU7eI4aDvEgNV3vgGLPaShDZtDBkEXB85H6Z272jsjulG
	 nHXsOqGFrSNGIE+S3eoFLhXDhoJsy0dyHH/S0ihToAGGdgjUGSx9Sy7gva/ZpqxHePrwA
	 m1EweQ2OL/mVze3iDTpF3ifGUTbMIs4cBWh50hGCVpcnYLON+z/QQQLSXFB1VTLOuw8XT
	 ZMGkryOwiSHHBACIqVIjqM5Lfwi5xXPkcr+wlvvrfFBsb7gdLd+Hd4UdQ9XJgaePZM4dN
	 ddfFF3SgGh6tXMtoebVWV8c0VIx5RZFTe8mnAFNQi/RIrr228jvHyWMtNGoByKzXktg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625287;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bD74Y7YFn2Ui/9fYlAqrumeixes5hDaDHZMnp2HNQsk=;
	b=XBcONNOC/aGDYd6LVwst30B1wcl6oiVV3S+OzJUlFNHeKgLJmAbxa3W/TwBUXE0Wk0Mb
	 vfYJF66jWotRalvkbk8KHSlWCXsgGwTdFw2UwFk7/OE3NX8igG6EwummWkl3sWIHOG5Lm
	 +8O6f+5WrA20mcj4O+88m+9u9uIwXqdOiv4Q75IgpqzroY2ytUmNQMVh+hB0+AQ/0vo4K
	 dwF8L4HEB4oaTfs/AlmblCnb7oLsDCW9kB+4/xEY7y9VYbiVVDDz5tju7vhPNlY74rdAl
	 a9hu3yrL7GZiGpmgh1eln2jLTJorcZNryc2ltK22t7IjFMpSxukHUsfoWiQKIeuGz9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="Xpydzqm/";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3690E606A337
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3690E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Xpydzqm/
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF94A1596;
	Wed, 25 Nov 2026 08:48:03 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3DB313F632;
	Wed, 25 Nov 2026 08:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795625286; bh=VEns+w1fXXjC1XMwehU4c6qcdH/ttsD7VUv+FSfusf8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xpydzqm/0VQO4mtmTCBdrfbPprGWZ7pFd8Oz9/5nfsrkZWbNcU/avVRv4CQ6u10Zj
	 2YeWqTojqZiV2uonVdrNGAEOiKFUCHlMLb8BrQQxoZrc81QAu19QeDhefDoputAyG2
	 3HvL+oW8jktEB3ZtRFFkNTNhCNOYzCk9z5OpV2ss=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: tony.luck@intel.com,
	reinette.chatre@intel.com,
	x86@kernel.org,
	Dave.Martin@arm.com,
	james.morse@arm.com,
	babu.moger@amd.com,
	fenghuay@nvidia.com,
	bp@alien8.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] fs/resctrl: Allocate the arrays in struct rdt_l3_mon_domain using kvzalloc_objs()
Date: Wed, 25 Nov 2026 16:47:52 +0000
Message-ID: <20261125164753.3759904-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125164753.3759904-1-ben.horgan@arm.com>
References: <20261125164753.3759904-1-ben.horgan@arm.com>
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

Each element of rdt_l3_mon_domain::mbm_states[] has
resctrl_arch_system_num_rmid_idx() entries.  On an MPAM system this is the
number of PARTIDs multiplied by the number of PMGs. The maximum possible number
of PARTIDs is 0x10000 and the maximum number of PMGs is 0x100. On a system
approaching these limits the kmalloc() based allocation will consistently fail
and hence fail to bring the monitor domain online.

The number of entries of rdt_l3_mon_domain::cntr_cfg is equal to the number of
counters. On an MPAM system the maximum number of counters is 0x1000 and so
potentially larger than a 4K page. Allocations of this size can benefit from the
fallback to vmalloc() in kvmalloc().

Switch to allocating cntr_cfg and the elements of mbm_states[] using
kvzalloc_objs() so that large allocations fall back to vmalloc().

Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 fs/resctrl/rdtgroup.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 57ab090072c2..c55f125ce9a1 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4502,10 +4502,10 @@ static void domain_destroy_l3_mon_state(struct rdt_l3_mon_domain *d)
 {
 	int idx;
 
-	kfree(d->cntr_cfg);
+	kvfree(d->cntr_cfg);
 	bitmap_free(d->rmid_busy_llc);
 	for_each_mbm_idx(idx) {
-		kfree(d->mbm_states[idx]);
+		kvfree(d->mbm_states[idx]);
 		d->mbm_states[idx] = NULL;
 	}
 }
@@ -4620,7 +4620,6 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 static int domain_setup_l3_mon_state(struct rdt_resource *r, struct rdt_l3_mon_domain *d)
 {
 	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
-	size_t tsize = sizeof(*d->mbm_states[0]);
 	enum resctrl_event_id eventid;
 	int idx;
 
@@ -4634,14 +4633,13 @@ static int domain_setup_l3_mon_state(struct rdt_resource *r, struct rdt_l3_mon_d
 		if (!resctrl_is_mon_event_enabled(eventid))
 			continue;
 		idx = MBM_STATE_IDX(eventid);
-		d->mbm_states[idx] = kcalloc(idx_limit, tsize, GFP_KERNEL);
+		d->mbm_states[idx] = kvzalloc_objs(struct mbm_state, idx_limit);
 		if (!d->mbm_states[idx])
 			goto cleanup;
 	}
 
 	if (resctrl_is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
-		tsize = sizeof(*d->cntr_cfg);
-		d->cntr_cfg = kcalloc(r->mon.num_mbm_cntrs, tsize, GFP_KERNEL);
+		d->cntr_cfg = kvzalloc_objs(struct mbm_cntr_cfg, r->mon.num_mbm_cntrs);
 		if (!d->cntr_cfg)
 			goto cleanup;
 	}
@@ -4650,7 +4648,7 @@ static int domain_setup_l3_mon_state(struct rdt_resource *r, struct rdt_l3_mon_d
 cleanup:
 	bitmap_free(d->rmid_busy_llc);
 	for_each_mbm_idx(idx) {
-		kfree(d->mbm_states[idx]);
+		kvfree(d->mbm_states[idx]);
 		d->mbm_states[idx] = NULL;
 	}
 
-- 
2.43.0

