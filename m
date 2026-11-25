Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795625285;
	b=Hz4uzofA0VPan0gD5qim9eZxWoZCtZ/4Whu2jrooj9rSUquMqyHDdDoNDIFea8DYVwXP
	 c+hd6vUovkXqEHQRHFqVTrR5gWkss+8wkZgAjW1XF4MqHLX3P9LrMcDmFm078Ft1kAhAJ
	 Yh1VQEPx+1h44u2T0TIfVXBew74XQBpVCDlrUFxd/F6APCL6RI2Ka7mlDRHuD3W2r7Q86
	 P9pisjhqKgbqEUQJd3AoTNbDiqnHie1bhn948tEivywBIYPkAilWstRT4famqcqMbu+fC
	 caHiRH5Jr3nCkzQGdv9kTDdd+niYsIIxUSY8l18Znlqu/c+CMgSeyr4RL5J+ObrYx0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795625285;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7RkYLX6a8M/26okTQV83aZhZBr76rvCBKvwK8frWHdo=;
	b=nB9ot6UCe0ArEWYQct1uY0MKCJgaCcmV73QyPX8zKEzUz2V4i9PzZO2XIcrZsgpGr3Ts
	 BHoFjBUbv2fqDi0dRYWBIbdU9R1gjwLvw+quMvsHAlRZS29bCJN1uaDYMX7YC6sxiN/ei
	 9jKONCsB67XbvcHhlSzv5IzOhIh0bZ03Ey46rAqEm1KTH+hz9IlBk2W42hgjHg2IJRbZI
	 k40i5rx5GN7QWLXoZqqlPPM5zz549EDskmbEw8f8joam64fqi7XX3um+i1sPSbVVV9cEt
	 ivqRvnEvqnPrPc+ANwEcCkmbDwiuS/EpEBgpSKg72uuCJhs63gF76eao950QR3zNeMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ADr9YWdh;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847B1606A338
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 16:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 847B1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ADr9YWdh
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C8E7339;
	Wed, 25 Nov 2026 08:48:02 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F65B3F632;
	Wed, 25 Nov 2026 08:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795625284; bh=J/tiVoZWUAOcXdjZUOn1hEEooozK5c3yODIrAZFX5gk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ADr9YWdhvKcpBIEyKQNgOzi63foPf4kPMxV0cAvDN+zoonUBN1Lrh+17a+W4pAEHI
	 6MsuiRY0ZoJdRMtwBLJEhIMwqdqdttEsZo+gSOEs3ypQUPQvSmhUN17U5nHEH53PrU
	 h1OOMZfWHGG6osyfx+uCsn+MTdN/OIhLFhCouHCQ=
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
Subject: [PATCH v3 1/3] fs/resctrl: Allocate rmid_ptrs[] using kvzalloc_objs()
Date: Wed, 25 Nov 2026 16:47:51 +0000
Message-ID: <20261125164753.3759904-2-ben.horgan@arm.com>
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

On an MPAM system the number of entries in rmid_ptrs[] is the number of PARTIDs
multiplied by the number of PMGs. The maximum possible number of PARTIDs is
0x10000 and the maximum number of PMGs is 0x100. On a system pushing the limits
of the MPAM specification this can be large enough to consistently fail the
kzalloc_objs() allocation and hence fail to mount the resctrl filesystem.

Switch to allocating rmid_ptrs[] using kvzalloc_objs() so that large allocations
fall back to vmalloc().

Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
I found this by testing the extremes of a software model and don't expect this
to effect real systems.
---
 fs/resctrl/monitor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 04e4ea612b7c..9c383abfbbe0 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -979,7 +979,7 @@ int setup_rmid_lru_list(void)
 		return 0;
 
 	idx_limit = resctrl_arch_system_num_rmid_idx();
-	rmid_ptrs = kzalloc_objs(struct rmid_entry, idx_limit);
+	rmid_ptrs = kvzalloc_objs(struct rmid_entry, idx_limit);
 	if (!rmid_ptrs)
 		return -ENOMEM;
 
@@ -1010,7 +1010,7 @@ void free_rmid_lru_list(void)
 		return;
 
 	mutex_lock(&rdtgroup_mutex);
-	kfree(rmid_ptrs);
+	kvfree(rmid_ptrs);
 	rmid_ptrs = NULL;
 	mutex_unlock(&rdtgroup_mutex);
 }
-- 
2.43.0

