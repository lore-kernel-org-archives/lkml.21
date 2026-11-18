Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001746;
	b=Rtf14XJUl1IN4OCNFqTTwVUknl5GY1Xe05kAT/CQ0+k+TaSP2X7DB/vmGC8ODohbuE2N
	 M//Z4v0bfwa8OvQ9Sgaa32jjSJN+dsftJ1HZw9OEe/aobRTbvNeSInHRZK40p/5dPcxih
	 Sf2hdyLaFbpofIPAZIeuaKYODlX4rQ5tR1iLcNCK5UBHXXAPAAyV6B4YnhKGvgDu3YMAl
	 DGPVAZ23BLlQtw2y6IWbI47WsOn2yMC7tXZ2XNHVPXfClNpTTrg3Ae5hJktTHBdGR5N0H
	 G2BvX7qO+Ka/A01O7kBMTtjYJR/Evbz9D9+oEnESv2bidlOQ0Nu+KekFyIQvH+l0Ynw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001746;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=dFwSCFHVqXxACR6LuAGnLm+HtsbO+RRDkySWaQotF0E=;
	b=rgjznVmqKFvTG9cMRNoD74ItAFVpnEAX7NzctCoXzzgyufDYqVAZLgbFE2zGHMRBZ6yj
	 y84r2ZQuAV3f7ten5jdx5f+tqcqs59wMby1wpFowavOLdeZUTaXDnmy9H/avA01JnwK3O
	 ap4IPkJ9aMotIgdtErgSyu9v1CcdBaoUOHms84e8j7JtHNU81EVZg3qx0l0lgcuj0rpmu
	 D5gE01sdVpSMBSV+bKCgLw73PZw+zwoD7agXFLi3pPGvBP+NRm0iZsqTxFROp7jW12Q8D
	 zbN1LCvp2+z1ywqcTmQxA/6CJAwEHzs2O59u6+BVkXBkq388435UpMyMl/KYJN7n1aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=xMcz6FJk;
	arc=none smtp.remote-ip=113.46.200.226
Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841FA606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 841FA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=xMcz6FJk
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dFwSCFHVqXxACR6LuAGnLm+HtsbO+RRDkySWaQotF0E=;
	b=xMcz6FJkcZzHIwTaUAO3UleEjhlj6Z1hZXZn7kzCYU94EDBgPPNm0VqG6dbi0EDtqiKccGmtW
	djIvKjY/ptIkmHgNhjKKiM+G03lNNW6YgC2XZ9Vs7GRpRaBsQodtAtG/4meMtjeDVjV+j2oyPUq
	642VhVYvnAe4XFv0K6IF5zE=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jV00042bLzKm64;
	Wed, 18 Nov 2026 19:35:28 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id F32BA40586;
	Wed, 18 Nov 2026 19:35:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 19:35:42 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<tan.shaopeng@jp.fujitsu.com>, <gshan@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v5 3/3] arm_mpam: resctrl: Limit num_rmids to the CLOSIDs in use
Date: Wed, 18 Nov 2026 19:35:32 +0800
Message-ID: <20261118113532.638039-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118113532.638039-1-ruanjinjie@huawei.com>
References: <20261118113532.638039-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

On MPAM an RMID is a PMG within a PARTID, so resctrl can only allocate
the PMGs of the CLOSIDs it uses. info/L3_MON/num_rmids is instead set
to the whole PARTID and PMG space when the monitors are initialised,
and halved when CDP is enabled. It reports more RMIDs than resctrl can
allocate in two cases:

- With CDP each CLOSID takes two PARTIDs, and resctrl halves the
  CLOSID count rounding down, while MPAM halves the whole RMID space.
  With 5 PARTIDs and 2 PMGs resctrl has 2 CLOSIDs and 4 RMIDs, but
  num_rmids reads 5. The count is too high whenever the number of
  PARTIDs is odd and there is more than one PMG.

- On a monitor-only system there are no control groups and resctrl
  only uses the default CLOSID, but num_rmids still covers every
  PARTID. With 5 PARTIDs and 2 PMGs it reads 10 while only 2 RMIDs
  can be allocated.

RMID allocation is limited to the CLOSIDs in use, so only the value
reported to userspace is too high. Creating as many monitor groups as
num_rmids allows fails with -ENOSPC before that number is reached.

Count the CLOSIDs resctrl uses instead: every resource has
mpam_partid_max + 1 CLOSIDs, halved and rounded down while CDP is
enabled, and a system with no resource that can allocate uses only the
default CLOSID. Report (pmg_max + 1) RMIDs for each of those CLOSIDs.
Count at monitor initialisation and from resctrl_arch_set_cdp_enabled(),
which resctrl calls whenever a mount or unmount enables or disables
CDP.

Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Cc: <stable@vger.kernel.org>
Cc: James Morse <james.morse@arm.com>
Cc: Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Fenghua Yu <fenghuay@nvidia.com>
---
v5:
- Add Reviewed-by.
- Remove the unnecessary stable version.
v4:
- Simplify the fix with mpam_partid_max, cdp_enabled
  and resctrl_arch_alloc_capable() as Ben suggested.
v3:
- Drop resctrl_arch_set_mon_rmid_count() and count the CLOSIDs in the
  MPAM driver instead, as Ben suggested.
- v2: https://lore.kernel.org/all/20261105123304.2281987-1-ruanjinjie@huawei.com/
v2:
- Also fix num_rmids on monitor-only systems, as Ben suggested.
- Retitle from "arm_mpam: Round the CDP RMID count down to whole CLOSIDs".
- v1: https://lore.kernel.org/all/20261104101622.563280-1-ruanjinjie@huawei.com/
---
 drivers/resctrl/mpam_resctrl.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 24d5b2fa4bca..8e9d5c68c2c1 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -191,6 +191,21 @@ static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)
 	 */
 }
 
+/* The RMID count follows the CLOSIDs resctrl uses. */
+static void mpam_resctrl_set_num_rmid(void)
+{
+	struct rdt_resource *l3 = &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_res;
+	u32 num_closid = 1;
+
+	if (resctrl_arch_alloc_capable()) {
+		num_closid = mpam_partid_max + 1;
+		if (cdp_enabled)
+			num_closid /= 2;
+	}
+
+	l3->mon.num_rmid = (mpam_pmg_max + 1) * num_closid;
+}
+
 int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 {
 	u32 partid_i = RESCTRL_RESERVED_CLOSID, partid_d = RESCTRL_RESERVED_CLOSID;
@@ -223,10 +238,7 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	cdp_enabled = enable;
 	mpam_resctrl_controls[rid].cdp_enabled = enable;
 
-	if (enable)
-		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx() / 2;
-	else
-		l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+	mpam_resctrl_set_num_rmid();
 
 	/* The mbw_max feature can't hide cdp as it's a per-partid maximum. */
 	if (cdp_enabled && !mpam_resctrl_controls[RDT_RESOURCE_MBA].cdp_enabled)
@@ -1347,15 +1359,7 @@ static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,
 	l3->name = "L3";
 	l3->mon_scope = RESCTRL_L3_CACHE;
 
-	/*
-	 * num-rmid is the upper bound for the number of monitoring groups that
-	 * can exist simultaneously, including the default monitoring group for
-	 * each control group. Hence, advertise the whole rmid_idx space even
-	 * though each control group has its own pmg/rmid space. Unfortunately,
-	 * this does mean userspace needs to know the architecture to correctly
-	 * interpret this value.
-	 */
-	l3->mon.num_rmid = resctrl_arch_system_num_rmid_idx();
+	mpam_resctrl_set_num_rmid();
 
 	if (type == QOS_L3_MBM_TOTAL_EVENT_ID) {
 		int err;
-- 
2.34.1

