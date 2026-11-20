Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164178;
	b=XHGxdZNRG1z7JVVtabBIQEAR8iyQFf7F61YFjYIaLb7K9gttizEItxSKvZgHbT7aufgu
	 bvmaJevntPzW4JJr9nb7xq9kXlhcj8J29aPPtfi1hKXVFtTFUXCqnh9XKipwI+1n9oNJP
	 lpAatWslvFtU0bh4F++xXovpZjZbdiLfqnjb56CpwsUsGhuTxJAxWiC3Fsg3n+LJkyzdy
	 /XIkvcbpFNgP8SuRJPROUb+/GUT1Fe490/ONkRle8+sAltSctBmSOiVS+oZM4tJTBVV5E
	 nBb9px0tDoSvIDIewSsvgeagj3BWaU5sCZVQs87HCMX0YH/cjrwFPmzCE5wxT2lSOoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164178;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t6UM1y/KWtHHd0/uNRfFEFks1dVYieXXfq27+VcRjfA=;
	b=1zDwvNVrMxlXlLfxRiuh5IEgZ0kEIZ91axVpPlGlVY0UT5PUeci9m084iBJyM7mTBHlC
	 4tR0LQsTmBPVPk/gQJJJCIAgJzaJY0eB+b8Gwq5t3t1uHJc7Vla3SybwOkx7vFBHwG5/n
	 04PeZaclSOBXbvIPOkVqjP7t8KjY9T1qx7uSQJKROSaPo1UBafYWc+4CJLDCnIJKhpupe
	 zZZMkolXbM+M2eGy2XX4Zw/E3AxPY6I8wxH8ojgUl4CSTjIXKrWfvHrhSKCZB1en8It2a
	 quNn5XIv2bNqmndjKFRDPceK2To0BZLJwV4weZsHpwNiv2R6XVEys9dmlhS3RYcnTTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZPDyoMK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WGDTAHn2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19148606B485
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19148606B485
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZPDyoMK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WGDTAHn2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7ermp144592
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t6UM1y/KWtHHd0/uNRfFEFks1dVYieXXfq27+VcRjfA=; b=FZPDyoMK/qbktyBl
	W64Ib4x4qMGe65QsOc5Q2BqACOsqZYBtV2NVfrmUF2hdHIdcpzNoOhtIDX4kSogz
	uo+7hAtSPIW79K5OOGKsibJwnWqb3jQwiClzdrqXNczqGzPRIYrrNKbxShr1q892
	kg84zkjZbIR8dr4keKf2MP/rvYT8ylmtWA+/JAerBHJaoojJkInvQ55jEGTmN4uV
	hYP13tFjd8FkXRWOEQi+skzzjMRec/wNS3zGgx4A7RKzpZa7xNPZ4TPh2pYTlMNb
	ga6EgjCtomLIA/a1GA3VGexO9Clayvg/xNYB22a68AA8Ze6YRnMcUecBO0dhOJEE
	lAkfCA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbgunh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:42:57 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so679170eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164177; x=1795768977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6UM1y/KWtHHd0/uNRfFEFks1dVYieXXfq27+VcRjfA=;
        b=WGDTAHn2oxooq/EDQUj77BRXN0PEOYZ+LiIL+LcTVqOqJLOtFHNWC02f2riZH6qPzN
         l84jYGzDlVp3zB7k3vbNHwEulNtg9aX+1YOtpARiVWXnrZXqnXWO+eXMIJn8ACh338am
         ZSL0pNr/hJR9kybLoKH9TNhg8VFF+QxHwGaEYcZ6jZ0ZE52CO7l32NjNyHIK5rHJcFrZ
         Iv9VRutkegsnDQI12HwBafvGTgquqMXqWFmW2+aSEDZ5azyfy935wy2f9rSmh3FYbH/x
         uqFUXyJ0ohxSb9fk369sRqb0aK1OflaMAnAaU/d6pr8tvF3xprhMd+8a13OVhVyTIssw
         OgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164177; x=1795768977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6UM1y/KWtHHd0/uNRfFEFks1dVYieXXfq27+VcRjfA=;
        b=WdkgGWA1f9J/hl4AdxBuynYw243Plk2R9J7XdGpr9bHU+0f1SjIGQJ6xjUvi8K/m9i
         lfdfS99CenwYrie+KH7fCJAIp52SuwtQg/wwhbw4ZKXhgp4V0akAZXRoUSnWf8GNaVen
         qwkvJ3xr5HMpg+OXA8q/kkCOid83eY9KppXBqbQUSSkAuc96P85vgJCLaQpL7C8bzV7/
         G8jYx4S8FdOXoymhK4JpwbrsSSk1g5Odr7PIvSbTc3P6YBou5vspswPwcyyg+2aCkkAS
         ZyJSUqHcBBpOkCqNOn2hMnw+UyaB0Sy0TtszmjA7CLkVWbKKlm7aDyjD5kRWY5l2tO1R
         PHaQ==
X-Forwarded-Encrypted: i=1; AL+hErGWwiy1DzMGRpbN5QC5szOeu/v4qSPYE9Zx8vxwERi4Rn3pqZV5Kv4edA0GEYMqEg8Hfvki+mSJz1DqEJQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nw2+6zcJAqmuLNfBpg7KWvrA+6uF9mGY58329BisfhiboujhK
	kSrhkoSFeZdPbVBq2tWFPCF/0wqOJxGq6fmkJ3W3kJktZDpc1FltmnZaMZCkAYoUaRp24Y3AkGk
	ng2ofmHWlVdN4y4ZycSV1tkDs2WYIH/UBIDesdkXY47FnNHuD9B2PcLE34B1+K1K90mY=
X-Gm-Gg: AZFdTZfHF9BERBx356OeIzUzHFgv2W+ta9V+Xx/LK/CZvzIrCkEk6VvDad4tt5vuQ0F
	so1FhIN+JkAaFBE8rhe6X3BkEypPqwEEElJNL3XU0SW4nJ5uy5lBJiVyxMroTb5X+WEWN1YgAjg
	U7dvskcGO1GtXb5gn7C/ZnD7Is6jZqBBK6R5ESA3Uy2GscpElCrvm35pgSj2zA+9ao7iy0n4XVG
	HUW4A7+7Ez0SiZ6jnANw6sxMFlApPR/msoQFUb2G+vlwDDAyJNgI/z1Y+7ohJ9Mn3sGSiGlHAXP
	6EB/Xhj5e4bEs8ddAt2xLGc//P6vW501Vj+Qkw0i1qBkLhJL2gCGDTgvXXBykE+H/GkrtrU5k//
	G1kBrv9IAjvZUXiQzwXtPJLNXt9GyiA7lX+9j4B3xfohU4Tghkt9je8xVk8i1bf664dS0iYIR9D
	SbWagTVCmDtIuM8gB+TRH90c0=
X-Received: by 2002:a05:7301:188e:b0:381:685a:e1ee with SMTP id 5a478bee46e88-384b3e78a26mr3649590eec.12.1795164176728;
        Fri, 20 Nov 2026 00:42:56 -0800 (PST)
X-Received: by 2002:a05:7301:188e:b0:381:685a:e1ee with SMTP id 5a478bee46e88-384b3e78a26mr3649570eec.12.1795164176217;
        Fri, 20 Nov 2026 00:42:56 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:55 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:29 -0800
Subject: [PATCH ath-next v4 04/10] wifi: ath10k: also wake remaining
 blocked waiters
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
Message-Id: <20261120-recovery-v4-v4-4-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=3115;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=xYQJfPHtqX9vuxRlxr/c5QyrNSA+dqNPa2wUFMiopAk=;
 b=owhOCcr49FGFhwZPYvjUG3cGjpX6+180EF2O9AiSsCeEhXZWaK6s3h7uiI0gBGBEU3wZNo8c8
 uSNP3QYre7yCWkhCp675zLgLBKY35xnh+dssyKLB1fjo8Q28up6pcpw
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX7TxqQSaXJYRg
 Joz2XX1nZB7BH4wxH1/041Ic3nDD9I0JFLWhi9s+vfE6KCl6a+FD0WHpvH74THffB3wX5k7394R
 HUnIBx1Cl3lwrWfuF4evuYtnc8Yo+LQXXHjDdBvkE8KE5X0jbDVG+9yjT3BffjFvt3aTUYjd49U
 73f3JTIJVGO1fnMcm94GZDNVffIt507plEuAx14NWL8VOJ2y7hgQm+DovvfBzCcIK5gp8Fe6sFc
 2HkqyBxLj+GV/vTk+Oz4Tj2hJA5cisnmQEtJuOU5zqW0aLsnuY3Dy5tCenS4pQOYLvXYhkHM9yb
 xlWp3l405nhaeeLJGhPA6PZvLeMJXTrtBAVx0RYzl6YauAM9bGv+IiGUsN/Pz75iM5ONFavvWAf
 tBZO+YCYoTg+vgUTSyhM5u3ZJ4e5wmqk/nZdtw6KKPJxTPFjYbLLmluhCNxHGdVGt4V/D/nIpNi
 2MQEyBL9SA+vGFGVoDg==
X-Proofpoint-GUID: ZSk0RSEZ1If-xTp0XId1vkg0J2GpQKHR
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b000811 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IOUMnZVgalWeg46eWFIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: ZSk0RSEZ1If-xTp0XId1vkg0J2GpQKHR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX/CdtsvrhNhiG
 uUw65re/myWpgDISGzaekMe0rjl1y5w3C9zmX7b8wjvDJZXzb/gP4RncPrBRGKmaVF6rfUXBPYx
 Z6+STQV1Qsd+5lMUuQuul03doyCIlOs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034

ath10k_core_wake_all_waiters() still misses several completions,
leaving their callers blocked after the driver has given up on the
device.

In particular, callers waiting on peer_delete_done, target_suspend,
wow.wakeup_completed, peer_stats_info_complete or wmi.radar_confirm
continue sleeping until their individual timeouts expire even though
no further progress is possible. The WoW and suspend waits are on the
suspend and resume paths, where these delays consume watchdog budget.

Add the missing completions to ath10k_core_wake_all_waiters() so the
callers are released immediately.

peer_delete_done is not otherwise reinitialized before every wait.
A completion left signaled by recovery would therefore make a later
peer-delete wait return immediately. Reinitialize it before sending
each peer-delete command.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 5 +++++
 drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 3bb4d2742c30..99960f12dc66 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2542,7 +2542,12 @@ static void ath10k_core_wake_all_waiters(struct ath10k *ar)
 	complete(&ar->install_key_done);
 	complete(&ar->vdev_setup_done);
 	complete(&ar->vdev_delete_done);
+	complete(&ar->peer_delete_done);
+	complete(&ar->target_suspend);
+	complete(&ar->wow.wakeup_completed);
+	complete(&ar->peer_stats_info_complete);
 	complete(&ar->thermal.wmi_sync);
+	complete(&ar->wmi.radar_confirm);
 	complete(&ar->bss_survey_done);
 	wake_up(&ar->htt.empty_tx_wq);
 	wake_up(&ar->wmi.tx_credits_wq);
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 74aca0af11c8..695df1821e5c 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -843,6 +843,7 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 vdev_id, const u8 *addr)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	reinit_completion(&ar->peer_delete_done);
 	ret = ath10k_wmi_peer_delete(ar, vdev_id, addr);
 	if (ret)
 		return ret;
@@ -5897,6 +5898,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 err_peer_delete:
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
 	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
+		reinit_completion(&ar->peer_delete_done);
 		ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
 		ath10k_wait_for_peer_delete_done(ar, arvif->vdev_id,
 						 vif->addr);
@@ -5959,6 +5961,7 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
 	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
+		reinit_completion(&ar->peer_delete_done);
 		ret = ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
 					     vif->addr);
 		if (ret)

-- 
2.34.1

