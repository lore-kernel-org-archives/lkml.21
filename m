Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001746;
	b=eL90GO9jBwyWRGqtjPol7BOUVccLEZHz3l7MTJs9pICA50w03QbSJoxtk7iyo8CR9u+C
	 SoDGLarS8Fllj36tztmK90wDIwfKkq5nLcvGjotnBvEgwvkvIBv7ERA21j4qpDWo4dIPy
	 b7FIXjkWuU487AWHEOfryHSqORZFUX/pB2gZI/38tNbksJa/WBKHeUUPGUI2XravovZg2
	 QOt/6E38xJ/SiKnNhEAsm7SInKlvTNhB5l3zwSW5r8SVZDfhUPKhxUYb6h2j8CS6iPpjq
	 kL7hiB2BKhYJzrhqMFiZeY1TLOAfBOWHfzDSsHCCFe+LPEFxPopfc03wGcKNMesvhEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001746;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=AV5zitI1IdkcOHGkiPiF8QdIMkhW2zoRM0PJ71FqnqQ=;
	b=lIxOodF/mk0OBYqbksyiIBqTId2fLReUtZ5tsGHFwD1eRm3VYAmMsbh+nJwUcwXcQxle
	 KmLCej+0DVSbQcwvT6qsj6G09S5K3yNVAb2GjnMNef4Ox9myRVh4AWShtX+kaolZXpj0E
	 RX5upWBlZz+7WIwetJwWqUxez6h7trnEVYs0qhC1yjMSM/QE7asSgOL6XYsnGXQPw3CUa
	 Y+soiat2VN4BPwM4HKS6Ok4lkJNafwQreYGpB3AeG7hNHvT5ZoAWgZYbPHJqZc2uN6kQt
	 Aqes+jUFt/ykdQrm2NFYgwZHQfc+XX8tzdb/RolQ3O4+5ahWZorVrG6vwRYXfhzorfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=X6RWyuln;
	arc=none smtp.remote-ip=113.46.200.223
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F711606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F711606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=X6RWyuln
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=AV5zitI1IdkcOHGkiPiF8QdIMkhW2zoRM0PJ71FqnqQ=;
	b=X6RWyuln2WkBkC0v+D8U0Na1zXfPiXTpyfpArrY6cGgjrIJTKDdSrmfywrF1dqqaGmpqK9v1q
	IgrKqDTd+RouZc4MRkA3m1o14TWHuzJJMvnDv9CzRtSBiCaKVG/J9dHs8PZt55TvkfRO3QzYlXw
	t6+OP9K0N5XHRJjk8Q1arw0=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4jTzzt48wqzmV6N;
	Wed, 18 Nov 2026 19:35:22 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 1A8564057A;
	Wed, 18 Nov 2026 19:35:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 18 Nov
 2026 19:35:41 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <james.morse@arm.com>, <ben.horgan@arm.com>, <reinette.chatre@intel.com>,
	<fenghuay@nvidia.com>, <jic23@kernel.org>, <zengheng4@huawei.com>,
	<tan.shaopeng@jp.fujitsu.com>, <gshan@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v5 1/3] arm_mpam: resctrl: Leave CDP off when there are too few PARTIDs
Date: Wed, 18 Nov 2026 19:35:30 +0800
Message-ID: <20261118113532.638039-2-ruanjinjie@huawei.com>
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

Enabling CDP requires at least 2 PARTIDs. If there are too few PARTIDs,
resctrl_arch_set_cdp_enabled() returns -EINVAL, but only after it has
recorded CDP as enabled, halved the monitor count and turned off the
mbw_max MBA control. resctrl then believes CDP is off, which leaves the
two sides out of step and the halved monitor count and the missing MBA
control are not undone.

Check the PARTID limit before anything is changed so a failed enable has
no effect.

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Cc: <stable@vger.kernel.org>
---
v5:
- Add Reviewed-by.
- Remove the unnecessary stable version.
---
 drivers/resctrl/mpam_resctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 5468367776e2..aa3b3a093857 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -210,6 +210,9 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	if (enable)
 		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
 
+	if (enable && mpam_partid_max < 1)
+		return -EINVAL;
+
 	/*
 	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
 	 * false on error and unmount.
@@ -239,9 +242,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
 
 	if (enable) {
-		if (mpam_partid_max < 1)
-			return -EINVAL;
-
 		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
 		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);
 	}
-- 
2.34.1

