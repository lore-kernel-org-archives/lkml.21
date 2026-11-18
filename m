Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970567;
	b=XbNjf4A+g7qSfJcZebmi3J6lqD2Hu/msdah+/QlFFQxNcfWTILJ1g9XCtvxz2UE8sp1K
	 Y1HicoQ3HEnxhREVegEGftcI/PU1ZrCb8L7evU+K6E/G01dsCCeykBAVVGmjQg1h6nIq3
	 kFYCrUUxgOEKGQ9RNzncoywd4hjr+oytU8p+B20T9VHPBeImvOEnpX6roWwJEfHteA+s5
	 SO2+kRcmZOBFvhjrUTr4iFzSakSwWCNzLowjJwj8NRgZm2GOsQ9BGcbVtdOjpsE8BB1f6
	 lxL0pRArhqUnfOjzCOwmX0ywgwW05j8YPKAZaoqzUhofrKQgpOrmiqZo2/G2WnlwGjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970567;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qqFoFfjg0LgxOhYxjsRtaWmnrkm2cmfDdBwc9cQbRWA=;
	b=PEfGkL1EsKSgAmj5UhzDrNZhycuevI3H02sKh3UYZx2NBqo2OqGOboYU59W2lngcxqWh
	 2Avn6UC5dv7O7uqfqA9DjLeNYs5BCzx8r+U44Q5XeCawwy2hx+v6dF/4bcJaZ1grPTzMB
	 bY6xtlr43LkEIXdS3hzPvRNLMuRJb0WJ71Y0B+bZidGiv+rTsXjSQDO0tFusmGHSr8t2d
	 T/3qdGGwXxr3f+Nw/GvDu8wabzgGYvDgiDt71cAOdVWbjxdcfcxx+nAj+Xkec1GyGGpSu
	 qeFdEDZs9rX4hS5L3c8CX/j+fQweRjEiO38Ak5YYJ+F9fR5UJg2LPNqR1e5rlOBEXhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gnUpZZNI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O9+o4TsR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0954606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0954606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gnUpZZNI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O9+o4TsR
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VwxJ4059979
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qqFoFfjg0LgxOhYxjsRtaWmnrkm2cmfDdBw
	c9cQbRWA=; b=gnUpZZNIsdUC13YA4pt34bt0BVyTZC5Q3gRtl1AoIbzlGG1qXF+
	aTmcM0nu5OAA2KERuC5hr5Bda/sSNVeNNyNcCYMJf1GN57uahMkPW652kL6JEiSB
	Af2PXhPxroCgzPEav55rz5MPw76fLebcKhgrcmgT7G1K8IweaMedDmOKTHYufQsC
	NZ0xR6R2CKlxo3nETRt5BMED0cW0Aoy1m/8hf4OjCkE8EfcOREAaYNR8EaKQau0y
	Fx/KgXZwZtJStgFD6QKbsfBLIqQtr/VEso3PiN0zKF9xjyYIAgOKy4agcYtOLiQP
	yjIXSkJRxKur69I8lqU/Kh48c4IToV7USSg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcgvd9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:55:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efd8a0a38dso3535775ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970558; x=1795575358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qqFoFfjg0LgxOhYxjsRtaWmnrkm2cmfDdBwc9cQbRWA=;
        b=O9+o4TsR/NxHZrDnHba5e5FzG2SVkTkRRPAMGz5CODxuwb2YjeiAoD54A0AZ1AAPjw
         +lol4s/Zdl9EiwtCZ6YvQDEUsUC1w0EeGw71qoEI5AOqGNWoQ8FueWS2sKOXEfN1CCF+
         f3btytCmctSBbJFleCxT2GI9q2bUBNmNyYItzDsGc1GvVbkSNuBvNurtetrEsXhWcrif
         4O5Cq9V5zegpHuCX8QqensJTTfu1Yj9I3vJv+y6Ib30Tm6Pyi49uRvVoiLMth00rDZH+
         IYcrQcvO1lKUrUjL/e5EzOTb9qw5EjyyRmSBo9vuRzQTlOOBkw2hX3ToEicv3qFcEQeW
         HTiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970558; x=1795575358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqFoFfjg0LgxOhYxjsRtaWmnrkm2cmfDdBwc9cQbRWA=;
        b=nieKugpvInXq8Zaz8F6mEOntT77e9mYTt8EiZTXZ6/jpWWLJ3bvFinpEQkDdU4Nj4P
         DpiPODUehzKww9Q4OLAgI1Ic7g2SGsSOiz2ERpnDI/6qO9oGI2xwQUd6h2mDjvm6kAZa
         KtxXZiNL8f3j2rqfe38mnd2zmzBzlQ6S9ef6kwPAM+pXccwcmmCLZllfwxT3lS/lHP7X
         k2gePdC9MLqm5SzbT4nW14Su233RMkpE1ABpvUYghOsGxxT9/JfE2UnFMlqZHT1NSQwi
         tsPcj/IrjJllHCU9vqcOvvW1F7YGPFMoI967GCkU42b7NmOiWdhe+C8A46qJ9ONzXagi
         EqUA==
X-Forwarded-Encrypted: i=1; AL+hErHmZrcYVxcbP7+JMdNnOfooKJjS8t6zjMKKB5dMUdNtfMlkyhWrK6xmMWqQRXngBXVNgx4QAOEvItmOGLY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l6P7bmARkwRxFyMQG1B54QzOdrIrOAvHLC+e+FzpiBeJR4i4a
	BeTmkIepH/rnlqPSYZ/Ib+wROnO7QVhcX26z3Oa/oyq7YDQsq3ug8qVmE8LAPHYcGQ1b7jXlbiL
	zzNrxbK3BdLAn3P1F0EXIVWqq8BMFpYPUwH4GKzEwQvVDaAEGiPTzWBUh56VRNkXipJM=
X-Gm-Gg: AZFdTZfcIycJrwtop5suWsdEdoau5PGXUuC1xedRW1heXyHm95qkto+GOEIoJn3KAZf
	kAPUWVqOzk0Pm7oaiSG1DkEuxXnHe+aPnC1DCwGZ25TMcl4iW8/kMhW5KXMAGwPT2S7uETXkKzF
	Cp21YHgguIen6qnhXTmNIqmnjmEgSkt/nLFgzPgQy0TDuqAQfEyVa+JwHnEYpvUwfHbQadcAmoo
	7m2SMqBvPgcfaYsM2PTXt284ooq+meCpDyffTV7fZNbKRVKNn6BksUpp2QqlLnIwBWeRGTuZJvC
	3/lfawmztGE+am6n62ohXefZZmix7laQJ0VkYNHjMHeCfwIivPtJs1ZLOjfMBgGyPvJYqw8R4vP
	JfhoKHrtoJtFItRYkF85gfWX4DSQHGH6f7gqkvQ62M2lubkZ5CO/vIkgPydVjlFV/egh6wxvPVi
	N5bPAmJ20uyLhdhtJ985zRfbACavQFWpU=
X-Received: by 2002:a17:903:4547:b0:2ef:da24:e76d with SMTP id d9443c01a7336-2eff752e549mr11276625ad.35.1794970558448;
        Tue, 17 Nov 2026 18:55:58 -0800 (PST)
X-Received: by 2002:a17:903:4547:b0:2ef:da24:e76d with SMTP id d9443c01a7336-2eff752e549mr11276405ad.35.1794970557932;
        Tue, 17 Nov 2026 18:55:57 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:55:57 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 0/7] wifi: ath12k: fix MLO active-links handling
Date: Wed, 18 Nov 2026 10:55:13 +0800
Message-Id: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd13c0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=6kQku5dBW61KixfneSkA:9
 a=EUlzmMyR4JpyyxVz:21 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: SsG1pKjZqYm1cy13RM_vASQ1-_sdIQkb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX9qaUABqNTPoA
 QahYgvkfqcgOPBn7d5Hq/ARog+JIAaNX+DBl7W6WCodb+kQPD1gDni6XWcofp0LGz6rTKhQ4oWC
 +7UxXj0gUTokxuplcJbTBUh6eiI+0zY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX8X6GtiUbgjGD
 MJto4vCw0+iu2wf9lVOhqVqNaHsGcAWGfjFY7vhWXc5kZURrd23os9+xXGasUn5K6pz63PiuQil
 wtleOL04fRU7qAIW+rj6VLWmqQVUJmGovH6DVX0yW7qkttd2JLhjpj0j8eY4DWti1/7G3dtjLRq
 vZMgCXwjBePzaWQmM1C7xBUlPIS/JNNXw1UhJxdry4wtSNppivJpXZiFeP9ZiThcrPH3YSU69gu
 xPKp3mwh42wAWXQPngzwmnGFWxQSTeNjuwLI72ocUmiiB8sKsQvCTQuNMgs66OuM9wq3Hqt2xcH
 HH0MC/2XW2GKVecTubfMq3nfAOXkKpJ4o4CaQXYBwpRJYIWbVErUcmr/qlxEGILULC+cFETQVJ9
 grbyt9VUNkHfZW7mTkji4GqCpKQ1BItMc3mBf6/1Q+rMhBsHDDz0Xt/jGA+uVe4hJgyrNPy+ZVM
 5b8mLZePd5bLYipRgJA==
X-Proofpoint-ORIG-GUID: SsG1pKjZqYm1cy13RM_vASQ1-_sdIQkb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180011

mac80211 calls drv_change_vif_links() and drv_change_sta_links() for
both valid-links and active-links changes. ath12k does not distinguish
between the two, causing WARN_ON/incorrect teardown in change_vif_links(),
inconsistent vdev state in the chanctx callbacks, and silent
firmware miss in change_sta_links().

This series derives link object lifetime from vif->valid_links and
sta->valid_links, which mac80211 updates before calling the driver,
instead of from the active-links sets. A STA link vdev keeps running when
its link is deactivated. The active/inactive link state is programmed to
firmware with WMI_MLO_LINK_SET_ACTIVE_CMDID, sent to each device that
holds vdevs of the STA, and only when it differs from the state last
programmed.

Patch 1 adds WMI infrastructure: the response event struct,
WMI_TAG_MLO_LINK_SET_ACTIVE_RESP_EVENT tag, and the event handler
registered in ath12k_wmi_op_rx(). The handler only parses and logs
the event at this point; delivery to the waiter is wired up in patch 7.

Patch 2 sets CTRL_F_OVERWRITE_FORCE_ACTIVE_BITMAP and
CTRL_F_OVERWRITE_FORCE_INACTIVE_BITMAP for FORCE_ACTIVE_INACTIVE, so that
firmware replaces the force bitmaps instead of accumulating them. It also
copies the AP MLD address into the command, and fixes the
CRTL_F_DYNC_FORCE_LINK_NUM typo.

Patch 3 fixes ath12k_mac_op_change_vif_links() so that link vif lifetime
follows vif->valid_links. A link that is only deactivated keeps its link
vif, and a disconnect (valid_links == 0) removes all remaining link vifs.

Patch 4 makes ath12k_mac_get_vif_up() skip links without a channel
context. A deactivated link keeps its vdev up in firmware but has
released its channel context, so it must not be used to derive the
target pdev. The WARN_ON() in ath12k_mac_get_target_pdev_id_from_vif()
is kept.

Patch 5 stops clearing is_started for a STA vdev in
unassign_vif_chanctx(). The vdev is not stopped there, so the flag now
keeps matching the firmware state. assign_vif_chanctx() then compares the
new channel with started_chandef: if it is unchanged nothing is done.
Otherwise the vdev is restarted on the new channel, or stopped and started
if it is not up. Station removal clears is_started once the STA vdev has
been stopped, so that a reconnect on targets with vdev_start_delay starts
the vdev again.

Patch 6 fixes the bounds checks in ath12k_mac_mlo_sta_set_link_active().
The vdev_bitmap and inactive_vdev_bitmap arrays are sized by
WMI_MLO_VDEV_BITMAP_SZ, but the checks compared against
WMI_MLO_LINK_NUM_SZ. Both are 2 today, so there is no functional change.
The checks now use the constant of the array they guard.

Patch 7 makes ath12k_mac_op_change_sta_links() create link STAs for
sta->valid_links that are not yet in links_map. Link STA removal is
still left to STA removal, as firmware does not support it. Once the STA
is authorized, a link holding a channel context is active, and a link
with a link STA and link vif but no channel context is inactive. The
result is compared with ahvif->fw_active_links and
ahvif->fw_inactive_links, and WMI_MLO_LINK_SET_ACTIVE_CMDID is sent only
when it differs. It is sent to each device that holds vdevs of the STA,
with that device's links, and the driver waits for each device's
response, except in the INACTIVE_LINK_NUM case, which is sent without
waiting. If a device holds some of the STA's links but none of them is
active, the update fails with -EOPNOTSUPP. If the device crashes while a request is pending,
ath12k_core_pre_reconfigure_recovery() releases the waiter before it
takes the wiphy lock.

Patch 7 depends on patches 1, 2, 3 and 5: it needs the response event
from patch 1, the ap_mld_addr argument from patch 2, link vifs that
survive deactivation from patch 3, and a STA link vdev that stays
started across deactivation from patch 5. Patches 1-6 each apply to the
base on their own, and the whole series applies in order.


Miaoqing Pan (7):
  wifi: ath12k: add WMI response handling for MLO link set active
    command
  wifi: ath12k: send overwrite flags and AP MLD addr in MLO link set
    active
  wifi: ath12k: fix ath12k_mac_op_change_vif_links() for active-link
    updates
  wifi: ath12k: skip links without channel context in
    ath12k_mac_get_vif_up()
  wifi: ath12k: restart STA link vdev on chanctx assign if channel
    changed
  wifi: ath12k: use WMI_MLO_VDEV_BITMAP_SZ for vdev bitmap bounds check
  wifi: ath12k: handle MLO active link updates

 drivers/net/wireless/ath/ath12k/core.c |  15 ++
 drivers/net/wireless/ath/ath12k/core.h |  25 ++
 drivers/net/wireless/ath/ath12k/mac.c  | 335 ++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/wmi.c  |  54 +++-
 drivers/net/wireless/ath/ath12k/wmi.h  |  11 +-
 5 files changed, 405 insertions(+), 35 deletions(-)


base-commit: 4016f6c3149e7e3faccc1654db6a3030c069383a
-- 
2.34.1

