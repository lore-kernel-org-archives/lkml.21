Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970571;
	b=SKyAamIQ40cPMOu79sSiPE1Vb5Z3UAbXxeZpvTdDsNkbbjI9g25ohTVkEb86KO9GorZB
	 BITyZMDwRhIJ74Gqrqsg01/d/4EWK0HpbA5cTeXYwfEqLRh34xTKhjSLR+5xWpSo2I7ds
	 5bBaAcfRMVIIKnp2J/bf1sF+OR1K7vtIiOgxyZJ7O6OKdK+hVGUEfDUE8DSaskoOqbfif
	 oo67ARJwgvz9cHvhISR7bkOajb86bNtHrBLnU/7lChWw/YtJ33eXJf7o7BFetq8aqgkfd
	 BlLKHPVAwEKRxufwA6iYsSz9FY0B1G+xPP9em9GHefIE3O3gPL6umSG6pzQ2ssKwJRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970571;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BdiMUCt/wyuL4WjKB89vqWUCIcIVIxCukGj3xnm2yYI=;
	b=oLkJvYMtKf6yU9zY1+Jd77gbZehZeyp+6wUT0iC7v0xE3zV/y1zI3ORVNgKzP24U/yWR
	 HFfsiWG5zqh3Ujtx32eXEEy40iNxS3Go/4Lzb4qTnKEnk0CmK/PQkNg34qEn8XMAbS5aO
	 ika2EOGh0ba5ZWVuWT+8x/e9kT12174KlCwH2yi20hXukeoGjeqSmj2FDkkdmJyeh/nna
	 S61JfFRcI7hDkHipFn5kQ0CDBPQPXBiY1VspN4TC9/gd9sx7p6p/9LGKi7MrCOh3kqQ8z
	 QDxGlqHrAxt+mEHqfoLPJJjkE+u94B1sMSdtxJDlZFmqFUyx8YAoiBD5jcgZuAFPf7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RoWpdo95;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZB3L7dyP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A663B606A332
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:56:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A663B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RoWpdo95;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZB3L7dyP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UxDA2453598
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BdiMUCt/wyu
	L4WjKB89vqWUCIcIVIxCukGj3xnm2yYI=; b=RoWpdo95Z7IszKqYSQC91b+Z6jz
	6HN80L9NirWkjHXDyryR9i9r9wyp+uSW6mbeQCECjQXjJfWfW5K5Rha8dYxXJAb/
	pa84IZvqelZ7Dm4HsAXugu3kdVqwL2UJyi0Icpvu6Np8WGBXy63OnnEZmfpduKf6
	z6Wsq8SR3YYJREyTQE31G/z3Z1v9OKV2k6X3mYtBku9W8R9Pchat9WFhBKc9Tu2Q
	EGzHQ4NsHgwWIkw8x7l0Xyt4mszKYtDmabNLQ2NwcfuncAOQB19nlhONZ+ZSjghX
	kmgKc1gwF6hpfUSKMLqmSIzudX6VmAYKkGhNmnQQDmxQDP6VrZNNVlgDvkg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv98uad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:56:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so429670a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970563; x=1795575363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BdiMUCt/wyuL4WjKB89vqWUCIcIVIxCukGj3xnm2yYI=;
        b=ZB3L7dyPk8q1AOJ6AqNBFZOFrXhmURl4cNUKQNWUVfM7z/NrExTcaorObe3NsQrtZq
         rF0+7UQvOwwf4A9RuE4pFfqP9e/jpdbtv9a3VTeRh0C/viymzm4VWrw2UGVxEvOhngiQ
         sBjCzbpiI/5VYUD9yyImoxxJCdhoJkhPh/9r6QGMrn2ihK8w9dTOysHmfOsbTT3c455u
         vMzNOId2W+yFiZPu3jkvtPK8p5Ho02IydFxjVTKTnhXg+82As4BJIfM1+bsXocAelaaG
         wcg8VMdgR6dQ6cMHqoyDyBUJtqn4oeRY8gZawuAxb1WfkDX1InEXH58pInnBBnNafQFv
         hovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970563; x=1795575363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BdiMUCt/wyuL4WjKB89vqWUCIcIVIxCukGj3xnm2yYI=;
        b=N3h6JS2vn81ECiyKKqfixOBaDF0j8boxhhPlzI4AM/6tULBLyIuqqLUdxjpRbbwmoH
         YF52xLQKxDue7TkIDA1tbjJcfI6/dp6OAx0ZlOsA8EzRPhjzENJlz4V2JH2uT8ly8tnq
         ZJBhifmo+ucIxlcMLeT2tYBpVPu5W0mIACqDdEwtO9DroeK8g2O0rBmEVERaspQHQyE4
         z7DcllRKsmFaKHtePrhvJHSbZBrH/fCVaAzA5jg0D43zB9J8y/QxHrGVZ/48HG/CVWOP
         6WgaJnTQoOBZ1ZSPYx2cf6d3DREUY6k+wLLdmCWpF1x0dlvyt/bTwRtDkwZ5meZ0iJue
         grvg==
X-Forwarded-Encrypted: i=1; AL+hErH5kQi4suU+j8+sx7JdRgTgd3PWBk7PE+YW8EbxjC+bSxo/F5HyUfi2M+gN+8ijlz+r11xx1b5Rg91Bq04=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TiM8S7hY6vWuKZ8Wu5XTCyonMEWPXtYWfKZvZ+CEHnFbSuXkN
	Kcb0zkLyxCQSaBuBcEJ6rj+QHh+8GqfwzEQPnhh0s7TtQIVtItPKBYy1yliMtMvDmn0opAKfqWl
	uyKGTuLAZflPOnfJsjnc3BG4xIPBYjHGc242Z7I9bK3TfkikQEz/lSGmgCc/hMZ5koBwnEhdsl9
	JJcw==
X-Gm-Gg: AZFdTZfdrBFcpUOlc5IQ/bCSYICqt1iuzmTfNSMjaizVHpU+Dzhnu1FCQkS6V7pwuwx
	7enzLSkYzoSWBblTgJO8LkB/dVKoLPo2ka0YY06/0gHExv6N57irXl7vp5rOZEcI6f1Zgy1qF/c
	8MqikD4z3cZg2w4G05hN8zF7tK3DB6CgngBz7V4FAkgJurHUtQC6As9inMv+LduPciajXI4RPRe
	e5SOm7PnlntIXtCj6W4OunUU2iZoqOh5UUjeBXcuW0BiTz4pG7V878ZAHzhkXgOvQ7CG1Cay+4J
	L4OkaFgd6iPLTsr1dpGLKoCsp71wm7Gv4vxcuLTP/knbo2AFExzmm6KE+qFpJHkW5Ia43hJZgXo
	TRRUV7cFDkgp6Gds8aYYoA/rTOWiNBjGdzr3DX0m/OhIo0Q1XWwsI1DV61OammPiKBWKCdEP9O6
	zXJP93HlBtj23Xw8d0EIRT3fWLkL1DMrM=
X-Received: by 2002:a17:90b:53ce:b0:3b3:8094:3221 with SMTP id 98e67ed59e1d1-3b3d07e0a3emr1097839a91.59.1794970563245;
        Tue, 17 Nov 2026 18:56:03 -0800 (PST)
X-Received: by 2002:a17:90b:53ce:b0:3b3:8094:3221 with SMTP id 98e67ed59e1d1-3b3d07e0a3emr1097810a91.59.1794970562570;
        Tue, 17 Nov 2026 18:56:02 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:56:02 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 2/7] wifi: ath12k: send overwrite flags and AP MLD addr in MLO link set active
Date: Wed, 18 Nov 2026 10:55:15 +0800
Message-Id: <20261118025520.39269-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
References: <20261118025520.39269-1-miaoqing.pan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX4r2b0pXBojbq
 dmS1LSAD6qhq9QljOBdchcnIF49g05CZJCEjVxwaxTpcyln1mPhPFErwx14fzDPpMrHPjCnF5pg
 KmOwgpz7Cg68IZ4JV6IuEkFk3CKXCmQ=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd13c4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=2wyP5r7tFOAPNzKROpoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX5Jr+JxdjMLK7
 KOAhsr8tjdYeQg2T9F49td63vUIuiW+IV9/QmCS+RAHeUGySmOJXOCmFwQeJtE74rid3rNspzWS
 m9rWSZJ2dCGYBKcuSJneQd7XRqjE9nBUZ3pHIVwYxLV2qAkqkO23cQWIGKwmudblWmv967VetQV
 BO/DeDNxantwk5MtUtrdUB5iNhgugACovwZmu1Alkg0jvYlN0X/Ol6z74rfkdZ0WCgD6OE8mmZ2
 t9dwXsH4fxXdQE2tf/jQljUy8SbBs5vYlpB85w8Id0H2xHhRhmRPeV494ByXSbG345E9QI10hL+
 5K8GUE5uHgl0aFlTWpYEUuXwiZEfClp7S+TPnYmjlH4OSul7m29MiRVAP5vo2MkV+872YwCwRMl
 vYagrBfmVTDkeFOMMEHqIdDKBpqmS6yOi+cLPfJEpDGoVN/SEce4Kil2LOdKkW77VlC1yt+jGDu
 aEuEZwbXi0/zf2OLXug==
X-Proofpoint-ORIG-GUID: l3gANfPWllBKrxw9xZ3niXp3Sfe8rB-A
X-Proofpoint-GUID: l3gANfPWllBKrxw9xZ3niXp3Sfe8rB-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180011

When CTRL_F_OVERWRITE_FORCE_ACTIVE_BITMAP or
CTRL_F_OVERWRITE_FORCE_INACTIVE_BITMAP is set in ctrl_flags, firmware
replaces the existing force link bitmaps rather than OR-ing the new bitmap
into the accumulated force state. Without these flags, successive commands
accumulate: forcing link A active and then forcing link B active would
leave both links forced simultaneously, making it impossible to clear a
previously forced link. With the overwrite flags, each command atomically
replaces the force bitmap, giving the driver precise control over which
links are active.

Encode the two overwrite flags in WMI_MLO_LINK_SET_ACTIVE_CMDID, and copy
the AP MLD MAC address from the argument into the command. Also fix the
CRTL_F_DYNC_FORCE_LINK_NUM typo.

ath12k_mac_mlo_sta_set_link_active() takes the AP MLD address and sets
both overwrite flags when the mode is FORCE_ACTIVE_INACTIVE. The existing
caller passes NULL and uses INACTIVE_LINK_NUM, so its behavior does not
change.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 10 ++++++++++
 drivers/net/wireless/ath/ath12k/wmi.c | 11 +++++++++--
 drivers/net/wireless/ath/ath12k/wmi.h |  4 +++-
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index eee3f38375ae..3f106ac6141c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7562,6 +7562,7 @@ static bool ath12k_mac_freqs_on_same_mac(struct ath12k_base *ab,
 static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
 					      enum wmi_mlo_link_force_reason reason,
 					      enum wmi_mlo_link_force_mode mode,
+					      const u8 *ap_mld_addr,
 					      u8 *mlo_vdev_id_lst,
 					      u8 num_mlo_vdev,
 					      u8 *mlo_inactive_vdev_lst,
@@ -7574,6 +7575,14 @@ static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
 	param.reason = reason;
 	param.force_mode = mode;
 
+	if (ap_mld_addr)
+		ether_addr_copy(param.force_cmd.ap_mld_mac_addr, ap_mld_addr);
+
+	if (mode == WMI_MLO_LINK_FORCE_MODE_ACTIVE_INACTIVE) {
+		param.ctrl_flags.overwrite_force_active_bitmap = true;
+		param.ctrl_flags.overwrite_force_inactive_bitmap = true;
+	}
+
 	for (vdev_idx = 0; vdev_idx < num_mlo_vdev; vdev_idx++) {
 		vdev_id = mlo_vdev_id_lst[vdev_idx];
 		entry_idx = vdev_id / 32;
@@ -7672,6 +7681,7 @@ static int ath12k_mac_mlo_sta_update_link_active(struct ath12k_base *ab,
 		mode = WMI_MLO_LINK_FORCE_MODE_INACTIVE_LINK_NUM;
 		reason = WMI_MLO_LINK_FORCE_REASON_NEW_CONNECT;
 		return ath12k_mac_mlo_sta_set_link_active(ab, reason, mode,
+							  NULL,
 							  mlo_vdev_id_lst, num_mlo_vdev,
 							  NULL, 0);
 	}
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index dde7721182af..7e06dbb1e884 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -11832,6 +11832,7 @@ int ath12k_wmi_send_mlo_link_set_active_cmd(struct ath12k_base *ab,
 						 sizeof(*cmd));
 	cmd->force_mode = cpu_to_le32(arg->force_mode);
 	cmd->reason = cpu_to_le32(arg->reason);
+	ether_addr_copy(cmd->ap_mld_mac_addr.addr, arg->force_cmd.ap_mld_mac_addr);
 	ath12k_dbg(ab, ATH12K_DBG_WMI,
 		   "mode %d reason %d num_link_num_param %d num_vdev_bitmap %d inactive %d num_disallow_mode_comb %d",
 		   arg->force_mode, arg->reason, num_link_num_param,
@@ -11844,10 +11845,16 @@ int ath12k_wmi_send_mlo_link_set_active_cmd(struct ath12k_base *ab,
 					 sizeof(*link_num_param) * num_link_num_param);
 	buf_ptr += TLV_HDR_SIZE;
 
+	cmd->ctrl_flags =
+		le32_encode_bits(arg->ctrl_flags.overwrite_force_active_bitmap ? 1 : 0,
+				 CTRL_F_OVERWRITE_FORCE_ACTIVE_BITMAP) |
+		le32_encode_bits(arg->ctrl_flags.overwrite_force_inactive_bitmap ? 1 : 0,
+				 CTRL_F_OVERWRITE_FORCE_INACTIVE_BITMAP);
+
 	if (num_link_num_param) {
-		cmd->ctrl_flags =
+		cmd->ctrl_flags |=
 			le32_encode_bits(arg->ctrl_flags.dync_force_link_num ? 1 : 0,
-					 CRTL_F_DYNC_FORCE_LINK_NUM);
+					 CTRL_F_DYNC_FORCE_LINK_NUM);
 
 		link_num_param = buf_ptr;
 		for (i = 0; i < num_link_num_param; i++) {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 68dd13cafe51..6d590b30ecbe 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -6385,7 +6385,9 @@ struct wmi_vdev_set_tpc_power_cmd {
 	 */
 } __packed;
 
-#define CRTL_F_DYNC_FORCE_LINK_NUM GENMASK(3, 2)
+#define CTRL_F_OVERWRITE_FORCE_ACTIVE_BITMAP   BIT(0)
+#define CTRL_F_OVERWRITE_FORCE_INACTIVE_BITMAP BIT(1)
+#define CTRL_F_DYNC_FORCE_LINK_NUM             GENMASK(3, 2)
 
 struct wmi_mlo_link_set_active_cmd {
 	__le32 tlv_header;
-- 
2.34.1

