Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684858;
	b=JdHEsJOuERIyuCcZltQfzjnYXY+irfRs2QnKB4p7Uj/wkmrvHW7PVi4aMLu6qGWWzuE6
	 CxHMThTyavAtC4UFASeS+9mekEPpvvpXZo8o2LoitLimtQ3UlmU98FxEtmF5sOA4RywDx
	 h1EDX6Yk43ch2BeqdSM+u1mA8usFvRBcvFiP+Y0kEEnKxB8KUdwgGY9zEpIUUpiAZnB+H
	 Uswi0UYCf12un7ggMa//Yuyj7pJzxbhyXT5XMLsDVre5hl+bXx69qB02n1RwAAqoCV16B
	 Q60p4hyAMyoDi3lOrkiGeXZWvgv7plJDbwNsmdLzkUBQuobO6aKNd0FBVs/qkiAI4UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qwv5F15K0gQkiOaOk8klOzfJ2jmiYtyCZXXUL00XQbg=;
	b=i/ArfzTE/MSjI6d1SbFPQs3VsNC6PhXT1aZblw4m0xtBSrTJwXubqDRNtGlz0+b0WaX9
	 56vDVe1GmN8gGWeJa+3tPcSSPXh0/E7Hn2DvAsgWU6+stO06e2FCoGiZshWh69Vv7aQk+
	 1nf1aUWlc0Uw9GSk6Yep8m9rdNODbDZv1VRwUcinLD1GnaafrQP9c9Pq0H5EveAW3jbmx
	 dbVV6JEb4Hf945IDyImda9RhFQIS7pYKtJ45UeQtKfFvF9Kk5YEyxZFl1Ox2Q2E3q0avG
	 LOf4NpuPmnN3fiUaEK/lrTmp+nHfUOBozk4NDjpa72uAffo8B27TCVF2zCysGuzhUgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gMz1m3JB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hCxKCzw0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85B1606A698
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D85B1606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gMz1m3JB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hCxKCzw0
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8NVWw2859739
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:20:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qwv5F15K0gQ
	kiOaOk8klOzfJ2jmiYtyCZXXUL00XQbg=; b=gMz1m3JB/m6cP/aEcPh9DWWnjwH
	zKeRMyin8zQqvqGFPNZoicakOZ9ZKii/LeoqVp7sv9lmJbv3gIwSHRXpaJqPLRIV
	0HGKaN9pjfJRemjr+hur4u+vYzjzJA2h/yJviwiZOZtm4Vfj9VIQV0ql8+pUA2MH
	cvnOufV4IZcQHqif5ob4YmUEJk79xtZ6T4tc+dlBTIoKfCB2GiL7drb7V36xY2c8
	LDZj8fosYJrmop2CPgXwJLt8DtP6nPlNB0W6GWcQlGBjSrGLlEW5XzH82XnWwFqr
	r4pEVwt35pG4OelrC1eE1h+Z1nDfhN4k+57/xIMnjO5gmxnYI9TZQisVdjQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g87xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:20:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a05b68f851so5777932b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795684856; x=1796289656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qwv5F15K0gQkiOaOk8klOzfJ2jmiYtyCZXXUL00XQbg=;
        b=hCxKCzw0Ot0d5kF3JhIXnrB7TdqxVw6clC+RCUOIyECWGoQRBSGTFmapoZX3sUbYuC
         Yg4AHeLwofTMydZIxGkqN9og3Icyjq+a3mjEswJuxIaMmIvtoFxUD5XnOio94tK+u6AH
         d/EKoRaxrIJwGK5igLxEaMVebjC4IbXGt6Fdw32Q6HPpfntpT0YNvcz0QU5vlryhBms9
         WnF2+pyOCNYerpIBq8/C7FpoSCHGbXBWuVKpmRTx1d76VgAwW5gMh9lHgrpaseo1tqqQ
         tsh4k0P6hagwOMv01sektQTQrDsr1TwxdRxXqbHBtQ0bu3LsTVM2F6KukXi5gKWJgVvL
         1DSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684856; x=1796289656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qwv5F15K0gQkiOaOk8klOzfJ2jmiYtyCZXXUL00XQbg=;
        b=tHTzuZ/KZSQwN4PI8dUMz0mSzaNwnVuON1dEnrS4HAD/UPKD/18nAcugRAws8+c6xY
         Tklsom/4f4RqebeE5jvDJjb7fz2CfTDQaFMn4eDoAoNROlvbjQvulzAw6NCG75VjZVBA
         gKK91Z8Rlfkdx3U8FadZi+6huj7TEnnq7l4JJJXeTmozvjcRDd8tMJCxgQQl5mLMsbVi
         IvHTlczo7r7yoOWcNxoolRXthcQD6yYQtHae6QYsP0qAiQCla9oyz8cnqgid4vDbEA87
         xtto7bzD6qSDyAR+Gj2tjHb3uQo7JbhLsO8BEVg2swUciS+58fttwRqkp9PaWyEH7YHS
         dZzw==
X-Forwarded-Encrypted: i=1; AL+hErG/D2mTUsnnhUupfLPCZPWkmj4S9ebr0WA24781P3K0DRG7L9dAn2AIYqt4U7qddvJ4J/NOcVVeMnW74CU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yfTsotASBy1KR315khdJLjyhCi6muNVV/++8YRvZ+4UT9KrKU
	mXOOFzADtVBHrC+fXXdZtAoIgha21Vj+SvxeJ8CIgs19L9HDzMjsQH+xzngtrlwFetOPJPa50kG
	A+qx1+hJowrBS2Hn1ly/QIrxG2EPjhpsmnHzOPLwkYRQCe6l77pkPt7Jsfm6EixklhVw=
X-Gm-Gg: AZFdTZeQXvOIwnt6Uyg2Ur5RGaI/VaUMDzwwCsEjJCz5hoZ0ny6xpIDlakA6h2D6fyf
	SJ706T/Io3SA0GTyX8/NJm75M3v9fhAI2avipM72eHn6GaWhLhausnmq5J4ZWIZlaqxXx5fmaLF
	PsopVqgSzB5oRxRCNpPPWmjzmTaa1tv0IDZvE1SN7OZN4i7gyYLp4XsPpvjCzzItfpldeUGvZEh
	MmY/YSO6tojw47jiTZQkdNWSjrPwAMGHpOZIifBwQ1158uNaRz37FOLcu2nnSRy21wDGlVpu5d2
	ex8DAdiETs1Tlrur4QOLvrfFma4KNv2xKg4/LJ5NgemzHCw1FAv09aXYVZkK1jt+tIbjyCf+hRZ
	htmHFEegYvA3NhITeMC4ikdPzuoHO2n5sg57udUIeNQCB41TlFEzCHJRIstPqP+OCNYy2p8JZEX
	uHHG9b88gs0ceK+2dYmSB7mnJLqX32iBY=
X-Received: by 2002:a05:6372:a713:b0:3e2:3392:53f4 with SMTP id adf61e73a8af0-4014d456ca2mr13153519637.18.1795684855621;
        Thu, 26 Nov 2026 01:20:55 -0800 (PST)
X-Received: by 2002:a05:6372:a713:b0:3e2:3392:53f4 with SMTP id adf61e73a8af0-4014d456ca2mr13153503637.18.1795684855128;
        Thu, 26 Nov 2026 01:20:55 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm10752089b3a.7.2026.11.26.01.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:20:54 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 2/7] wifi: ath12k: send overwrite flags and AP MLD addr in MLO link set active
Date: Thu, 26 Nov 2026 17:20:32 +0800
Message-Id: <20261126092037.462830-3-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
References: <20261126092037.462830-1-miaoqing.pan@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: gGn7Or7AMCWelivJTOJlTuDgsHhWfvVE
X-Proofpoint-GUID: gGn7Or7AMCWelivJTOJlTuDgsHhWfvVE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX4ND4ZSazZK96
 ekznmc+2+c6LTssCS46PDlbHjOgdeynKK4tobeC9b9CICx9tsIr2Gb0au6+D8oE7+WaWf9xf0KB
 tTz/9rdLM7ooIrfL5gzTauofgtADLxvf0EfjCbUKJ0kG432oQ0gjsWLF4+aGBpGtD8lGrzMif+J
 H+qxLSsyHhFz6e7Wn4aEXFsSg6T1tRFizTpDCo9JO3rgsiJmsNpZ41S2cx5G2JjeAVwSES+4MIC
 Epc9rNByJKi6A5CyZh7qLb1u8lKlRH8SCdqBuLrSNh2dFwJ/3QKEbc2zKvEL9/q7VwHWEZ8S1nU
 /VOOukjERuT55p05NnfDfUfBxDbwG99qzDbNz7jtN/zBS5z4sK13O6ap/D3sdq14SMjoWYwtRCF
 TTmCM6Vh5305/6Fw8Tz6k1zNf5zuKSIrnKedYuCmTX2d5YJBZYcMsK0mNVN98pws8FatVle00ww
 b2ENGkdJMUghNpMWoSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX57ZOZE1eIRQb
 hzpjTJKz2eStfpn9NZsP9b29zv0GN5KQsVlw7gsu5evW7uKgPKCWiHOhYLoaMzVq3k7RDfCoysb
 5EjBuAgAt/W3bybNR/NJ1Uf0h5NCzlw=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b07f9f8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=2wyP5r7tFOAPNzKROpoA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260036

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
index a247dcf387de..cecd634c5f7f 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7573,6 +7573,7 @@ static bool ath12k_mac_freqs_on_same_mac(struct ath12k_base *ab,
 static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
 					      enum wmi_mlo_link_force_reason reason,
 					      enum wmi_mlo_link_force_mode mode,
+					      const u8 *ap_mld_addr,
 					      u8 *mlo_vdev_id_lst,
 					      u8 num_mlo_vdev,
 					      u8 *mlo_inactive_vdev_lst,
@@ -7585,6 +7586,14 @@ static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
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
@@ -7683,6 +7692,7 @@ static int ath12k_mac_mlo_sta_update_link_active(struct ath12k_base *ab,
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

