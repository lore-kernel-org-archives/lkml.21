Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001749;
	b=fiEBpfccy8hcyCV5mZzRFyJRigiUhjZCfXIgsL4JYKX78FJwLBaTsetWZ/m1HfSgesLM
	 txgILkeChPXDJl4VILMfG54TtpHxgDy1XsO1Oo5O3/gIN3lXzRjVHt6Awh2sKAe9mm/VS
	 EUBjrPgtGdoylTgkTN5AdRGtmnLomm4VvoMnCNOu6rW0rurp4eszKwAXaJ8FVH1CeRk+F
	 wVcWJd6gB1UzY7rYZGIEn9dPI11DhbGNjJkPL/qAXVBdIafuOnO69UTONmJkZVKioJQu2
	 fCJnyq39OVQh4tbQuIK0wcCkiPD+8q/liimpd2jQU4airRMV9uViQFqSgrijFHdp77g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001749;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=0aTBV71xTxqk+aXXztmUVwD3L3D+RwrT27yBkRKCFu0=;
	b=XHH1XF9tpW3N9vX+k05NSXCvSG9OYARKFJ14gRz6DDh+S1GcVk00TKPKcDbjmu1efuSC
	 uJOr3CKtwbZZj3+8hEsjQ+UqvyTDCUTw54qAqfGSljon4UlnJcHIbo2PVD5aws138nGtr
	 v2uZ2O2MAe0ksua+IJEW6/31lDnlDu6tKFqfVHSh7M26aByfCWka5mehPxnZdzkSzHvLh
	 PxQ5wmp7KhEPj8j33Z/Uam91+fVZwdzoOpHm8gpHY8GzEWizncKAopeJjEGAlTvH4l+eq
	 39TXSvqkfGR1S3tokxks5ymceh/wdaLlN7WlWRiIe7Ic4XJXa2rP4NXsaXJ+fHZypAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=CtWwwSpR;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6016460A2615
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6016460A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=CtWwwSpR
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0aTBV71xTxqk+aXXztmUVwD3L3D+RwrT27yBkRKCFu0=;
	b=CtWwwSpRqz1hboFyQdDmtCyh5mgihj2TxH+I0pbF8ZzaUV93Ytj/oGl6pejJ9FF4SuAtLjsDO
	Bl8tVdZ7F9SGgwf53NFbU5oHpLTyqdvJQA/Yb4k5/KyZa/6ZhzoQyaBdcx84lykPwlgF+ta7nQf
	pMAlSVZncfBbWxb5TA7FTwk=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jTzzG2MPRz12LCq;
	Wed, 18 Nov 2026 19:34:50 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 82DC94056E;
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
Subject: [PATCH v5 2/3] arm_mpam: resctrl: Only enable CDP on a resource that supports it
Date: Wed, 18 Nov 2026 19:35:31 +0800
Message-ID: <20261118113532.638039-3-ruanjinjie@huawei.com>
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

resctrl_arch_set_cdp_enabled() allows enabling CDP on a cache level
that has no MPAM cache controls (e.g. mounting with -o cdpl2 when only
L3 is capable). This turns on system-wide CDP emulation without halving
the CLOSID count, causing upper control groups to map to PARTIDs beyond
mpam_partid_max. Accessing these out-of-range PARTIDs indexes past
internal arrays and triggers MSMONCFG_ID_RANGE, disabling MPAM.

Reject enabling CDP if the resource is not cdp_capable, matching x86.
Only the enable path is checked since unmount disables CDP on both
cache levels.

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Link: https://sashiko.dev/#/bug/linux-05c19551-0bba-4a06-aa2c-3c90fab5853d
Suggested-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org>
---
v5:
- Rmove alloc_capable check.
- Remove the unnecessary stable version.
- Simplfify the commit message.
---
 drivers/resctrl/mpam_resctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index aa3b3a093857..24d5b2fa4bca 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -213,6 +213,9 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
 	if (enable && mpam_partid_max < 1)
 		return -EINVAL;
 
+	if (enable && !mpam_resctrl_controls[rid].resctrl_res.cdp_capable)
+		return -EINVAL;
+
 	/*
 	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
 	 * false on error and unmount.
-- 
2.34.1

