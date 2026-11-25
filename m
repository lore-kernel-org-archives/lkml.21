Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625289;
	b=HPwjGECL0s2L6kN2gdgCDPV1lEl444xaDnNUVUPfXbbDnl/cZVgDTcnM0pg602ZF1zak
	 UP/hnHQObRpBwqBewRALiHDRcP6sQfdSp3QvxxOoNh+uGoLsIqmgDXV5o8I24zdp14d1d
	 XoUyIzR+pQVsQurEkgJukIZ7cr2jrMF4cvcWM/5bW42w2G7gwVMYzCefo/YGcjVQS7pcu
	 WtSyYM6GFNK+NN6Vxu3MljeLro1KJOsXbVcNIKQ/KXl1nHogZi5TVGvhzUw0NkFPqegvf
	 YHR8JKG6uuEGcUqYzuPm2HnUhM0TAgn0YCobZ8EhSEjkNo/1bpZNhMHTpeWEm7DlhGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625289;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hhe212rNII2sWmQ6hlJLZbOJYm+nvtbvSILz6we7yXQ=;
	b=qqGeXMFXfeuXmTapQ1mRRGLsDkU8v8qbe4UB8D8rTUlW5GPMnOH4UWcXl6527C3v+gqW
	 ctJCG/gwD3MkGCW+os+y5H2cJ12YN8kFN+MZ7jQS3qexYuQL5nxBta4LT5vM5FgM0JAEE
	 cU5JqkTRYG/2zpfGgk3ONfFEUGZcqCY4n4JhujvGFTQ7gXnYNkO5oUi8cw5jGU0Na1zq4
	 Vae30RH8rr8BmqdoaGQi93ZfgWPC7/KTt2Vm40Pk4wi/7HigEZ5cKCfoYE9JhmewDvyUa
	 m5oAOd/SeJDrq69dRVWREXjl4XOfRV+bQBup7/1UFl2zOTcib7jhcaLdO5/1HQF/xUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Wwsr4cHw;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD026606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD026606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Wwsr4cHw
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E4EF175A;
	Wed, 25 Nov 2026 08:48:05 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E05CF3F632;
	Wed, 25 Nov 2026 08:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795625288; bh=9DV2B2gleJ6dT1bntFLa+KvpgVo7cqnohsvuBVky40s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wwsr4cHwFssgAnxTTGBd1N2un+1NZKgjD/6Iz+U77YJCDfztjAkMjOLlPz4jiKkU7
	 kJBZ4OgzThtQbLBu4u0EHTIUTLWQ5/W9NpiLyY+lVzm2AVzuMcMyZX3mQ/YM/krTgD
	 dya/1Az3fKWCffL15iayBqkTVUK0+qHpcHnpUlEI=
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
Subject: [PATCH v3 3/3] fs/resctrl: Allocate rdt_l3_mon_domain::rmid_busy_llc using kvzalloc_objs()
Date: Wed, 25 Nov 2026 16:47:53 +0000
Message-ID: <20261125164753.3759904-4-ben.horgan@arm.com>
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

The bitmap rdt_l3_mon_domain::rmid_busy_llc has
resctrl_arch_system_num_rmid_idx() entries.  On an MPAM system this is the
number of PARTIDs multiplied by the number of PMGs. The maximum possible number
of PARTIDs is 0x10000 and the maximum number of PMGs is 0x100. On a system
approaching these limits the kmalloc() based allocation will consistently fail
and hence fail to bring the monitor domain online.

As there is no equivalent to bitmap_zalloc() that uses kvmalloc() or vmalloc(),
open code the allocation of rmid_busy_llc using kvzalloc_objs() so that large
allocations fall back to vmalloc().

Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 fs/resctrl/rdtgroup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index c55f125ce9a1..a8eebb5a5c4b 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4503,7 +4503,7 @@ static void domain_destroy_l3_mon_state(struct rdt_l3_mon_domain *d)
 	int idx;
 
 	kvfree(d->cntr_cfg);
-	bitmap_free(d->rmid_busy_llc);
+	kvfree(d->rmid_busy_llc);
 	for_each_mbm_idx(idx) {
 		kvfree(d->mbm_states[idx]);
 		d->mbm_states[idx] = NULL;
@@ -4624,7 +4624,7 @@ static int domain_setup_l3_mon_state(struct rdt_resource *r, struct rdt_l3_mon_d
 	int idx;
 
 	if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID)) {
-		d->rmid_busy_llc = bitmap_zalloc(idx_limit, GFP_KERNEL);
+		d->rmid_busy_llc = kvzalloc_objs(unsigned long, BITS_TO_LONGS(idx_limit));
 		if (!d->rmid_busy_llc)
 			return -ENOMEM;
 	}
@@ -4646,7 +4646,7 @@ static int domain_setup_l3_mon_state(struct rdt_resource *r, struct rdt_l3_mon_d
 
 	return 0;
 cleanup:
-	bitmap_free(d->rmid_busy_llc);
+	kvfree(d->rmid_busy_llc);
 	for_each_mbm_idx(idx) {
 		kvfree(d->mbm_states[idx]);
 		d->mbm_states[idx] = NULL;
-- 
2.43.0

