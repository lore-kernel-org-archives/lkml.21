Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684867;
	b=YowMNEsO7qogYV6cMMXKVQ8IJeQ3qc3YscG2TlvqbeXEOAGCqwPf5B5RTnecHwgIo3zW
	 77D8PKfK2X8XES4L2FhGvl38sGrOU1u6CZipnJ7Xh4OmaEWXLv36nIDG0YyhtO8ok02Fa
	 fxyS19Chrt+f0LYkxd2TQGRcxsZttNpPAlyI9jkB2sIjhWGUX22+J/D/M5AuA+czUT3Im
	 ps9t+tbTSxWWwnynDTrwV0YcO6r7LJ/5FpZG6ip4nNaqveOREcMw/rYAYz0CoiwrDSMgp
	 pIAtgqF6XWSXKhe4ZJS1F2/s5fcBID+pxqaUd1TlB/2Ir2HraNBi0SnOCSsARFogbdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WnvVKxUOEbsBzUcgoyiHJ3Sjg8gE2zFQeMmUh/FoL3k=;
	b=A7nbehzM1UsZ7rbOQyniPFfYCRR+W/4btp5k45S2XK8SK6x6YwexmQ81xXucteLMQfcj
	 7bEdVbiZNt4liOGWQQRmEwTs6Rzs8E/0YV8DaTFI8BKmuA0BTraPp1ABQ7jhDVePNfT7C
	 BCGBzGbWzTpuCUrqbq+oMsE06ryIVz8R47PqhgQZzHkJfkPhJfjPXTYa3EIupNDLhFrjv
	 mbmVJ0PPKSrZyaYIzRegnek9NJ0jJsn95xs/CZP+WDV6jDAR187qGlLJ7gXHjm9CMNhyp
	 QF5hChjYtD5gZ+wR2yTG/DxPL6qETpdMO0sTtCj4bNWZHetb4AOQdSE0ULjh+FZvA3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O5fr5c1B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e43vLxih;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BDB606A6A2
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57BDB606A6A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O5fr5c1B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e43vLxih
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8NZ932860302
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WnvVKxUOEbs
	BzUcgoyiHJ3Sjg8gE2zFQeMmUh/FoL3k=; b=O5fr5c1B/l0K8y5cFs3KJrfBT0+
	uUAWKuI82Wn4qamkjhwMit9+hn6HvVoXz91FRwqOzxMLeOyTMvKy3qnX2WPRn8MG
	zUEr7kgXZTXhq9u4sMKiXaJmElq4BYtvfBCNSS5M4RMxYukplUQ2eNdI8yStT1DQ
	MbnXQ7J0r4HVmmKDRR+UUNCdo/WgSG/GxIYcBH2MQByybMQHf/7oHHdtMzeF01Z1
	tI5VgwvDA65p64QwSBNGYIodPUgogZLVq7gvnjrul0bNa/zKiKORhBs/qo8t5h+g
	ySPMmhDOMUjw/4pARVYw1w1f2JmbyYc+/qiKcX3kmAlqhLWj6l7LmYpcrJw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g87yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:21:06 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b97460a133so5220834b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795684865; x=1796289665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WnvVKxUOEbsBzUcgoyiHJ3Sjg8gE2zFQeMmUh/FoL3k=;
        b=e43vLxihjall8OVRvRhlJG01egPCpKtSLZQXdiRWqKtQytThO/J0xZrtDN0yaHTetd
         zCnetvt1t6gNBMU6pu+ADW4xk0SOQeig36Itzllv9kYjgQoXEzGc1LQ6QDQIPObOzxlx
         Nfg/ecQC8asJQw/kRedZB2twP1Ik39LNFUuHgj/91YbuJTFYs5sOqDhmbMPAbwpBqNH4
         mzhGfcoGLLiP4oSDyka1+FXeFRxZZICvvifv3JHRzmiZAyjVr1JlExvsRn6fqkOROka2
         LRl0Bf3UxXKEY03lzmoGJoptvnxW5GNTDVYYfjk/q+IaqBjW9dXDNkUKDfsJU/7TIZpq
         NAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684865; x=1796289665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WnvVKxUOEbsBzUcgoyiHJ3Sjg8gE2zFQeMmUh/FoL3k=;
        b=XqrYGSTNClJBMcnL4VRTS/cIjU4Dfz2JCU7feoI0DWrf0l424arrvuW6zXyWjIZAVq
         9ipaZJPeNL22/SpzzT1dqBU09JQfD22RLrnoenMBclNp32BSeRlsHkS6yWwoNBDTZHrm
         bGoRB0uBSoKVPXdKHXi9lUcqjRb+H/WZgzRg69DCoqV/P+cN/6rBQBMEiDQ7Hgh4SyiZ
         242wo0HCc/WT2/pJkS7IWJFGEzQyd8mNGLPI4gVrKRGbmUVAEiYhdxZUOxmoGcDkasnP
         hc2JMbbeG279RcIAwvGdaPx4vc7lQ+iP1rpa8GLKAMTu3usfjY12dNRDzWjphm2n3fOq
         y0Mw==
X-Forwarded-Encrypted: i=1; AL+hErHRL1VcEg0AboMHHZI4Rf0eRuNlTEb+qdM18SjZ+V+66r0EN0GePLtsJIys6qJd4fHuwZtMa6VmKkgy5dI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3SAaH4/vjya1V+1cBkETiM2P+jdGCzuSMX7dcRKIIOiIZrFRV
	+XjXVyJ3sDbALzi9A+39T6QUEg/M1Ne1dSVApgFYpwX1orln8u2TFsSCbKv9sIPzDrZP+IUYJXQ
	ZRIwAwNIRkqetFPMo044KNJSBdvjgIAcTf0KvoHw6R1oD87eJ/1QevUY1vMLgwamsMo8=
X-Gm-Gg: AZFdTZeguE6aJOhyXxpd7YiGFysZ3M+4++RhOHWCDWPnwatqEcqXuMB9CUZgG+PcPva
	J/iPLCIhlLUm4v8G+WzD9bBpZsnpls2hlDHalc2ECNGhxczrASxa3pifRY8fIVhT6IIwttfN322
	gY0qCp4Veag19C/7/BNeIDsKDYlJ00fN/0o3HMkX8cuIIQCEIpZ4oSTsGbcnFNBwixCNjrBVP0p
	75uH2QXUysg0QuW3n3H0nEGS3rxQxAkudi7EwUvr5xk7/lPv9NdAX63pvqsy1oB4uxjxv8L85G3
	DNiJOpBTQwnx3FQQbkTOzS9iwghwswuDP7aRbAZrP9FNtkLhj0gdPo6nwuiS6mXKvZRi65Bgv7t
	1Wg/GcTsd6o/DJRSeToGlQPiFnagLqIKYzxF4I7/7xD+qJc33bN0ad9ZfIBXVeC9pIHFkge2Uuk
	gPZDaO0Lr2yFeR65Nm16k9vJEtBq6ASfc=
X-Received: by 2002:a05:6a00:1f12:b0:8a0:3ed7:939e with SMTP id d2e1a72fcca58-8c87d80e2cbmr18038860b3a.60.1795684865197;
        Thu, 26 Nov 2026 01:21:05 -0800 (PST)
X-Received: by 2002:a05:6a00:1f12:b0:8a0:3ed7:939e with SMTP id d2e1a72fcca58-8c87d80e2cbmr18038837b3a.60.1795684864637;
        Thu, 26 Nov 2026 01:21:04 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm10752089b3a.7.2026.11.26.01.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:21:04 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 6/7] wifi: ath12k: use WMI_MLO_VDEV_BITMAP_SZ for vdev bitmap bounds check
Date: Thu, 26 Nov 2026 17:20:36 +0800
Message-Id: <20261126092037.462830-7-miaoqing.pan@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: a0DPQG9c_lFP7CLwd37ZyKDQ0dy7X4JR
X-Proofpoint-GUID: a0DPQG9c_lFP7CLwd37ZyKDQ0dy7X4JR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX+SMfLjs7ZoBz
 k9GG1AhxdpmOr1G6CV6GZUDoH6u8Hzcyk0S4UWcBbZKnZdOHtAyFUCNK9wnGmv85iEZEHlwh9X8
 t+MpaXem1mYmwO1XzLlwyn9ZyTJAQYfdmFrXU3X1pJsICV+bS30CoWQTXY4zZD0pIjqmMIh0TZW
 t/JVGdPreB0Q8iKTCZ7y8RiKOl052Du8plzaS9Bh25rx+wWKXkNSu4BcKrMY5ouwm2Z2aast6NP
 iF/Nf8/WlEClKJLbdTdOWyX4bKBWfUreWQIimX+ZCXfRv1x8iwUppRWwBRyNNMoyrvRYxtDR2zN
 Jk8fQil883VaH+KF7R0xHHno5LUHdUJJ88QrxUqAUCZVc4YmnwRUUD/R7MssrUW6OMlAtE9ORim
 8lp8VSy0+Ktzmw3iOuuVAdTKjs+4y7C/+rao/pKDw6ADpTnl02kxv0T9mCKR83rX1vifPTBVYVU
 cRFvATiMl0/nCUrA3iQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfXy57sxs3UkN0A
 +uGJwskp/tgKRZkSX2RFX3gHuJhJ7OLt3HBe/befvMSIgtL/eutyJyqJRo8Ny+kwOlsAUa4p7WT
 uFFJzgT0nc5Rt3MkmL/1tg7RzXkHQ+w=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b07fa02 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=LZTIgfvDWzmdvsE2OGQA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260036

ath12k_mac_mlo_sta_set_link_active() fills the vdev_bitmap and
inactive_vdev_bitmap arrays of struct wmi_mlo_link_set_active_arg, and
both arrays are sized by WMI_MLO_VDEV_BITMAP_SZ. The bounds checks on
entry_idx, however, compared against WMI_MLO_LINK_NUM_SZ, which is the
size of link_num[].

Both constants are 2 today, so nothing changes at runtime. The check
still has to match the array it guards: if the constants ever diverge,
the wrong bound either rejects valid vdev IDs or allows writes past the
end of the bitmap arrays.

Use WMI_MLO_VDEV_BITMAP_SZ in both the active and the inactive vdev
checks.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index e79a9e55c248..d50148fe761d 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7616,7 +7616,7 @@ static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
 		vdev_id = mlo_vdev_id_lst[vdev_idx];
 		entry_idx = vdev_id / 32;
 		entry_offset = vdev_id % 32;
-		if (entry_idx >= WMI_MLO_LINK_NUM_SZ) {
+		if (entry_idx >= WMI_MLO_VDEV_BITMAP_SZ) {
 			ath12k_warn(ab, "Invalid entry_idx %d num_mlo_vdev %d vdev %d",
 				    entry_idx, num_mlo_vdev, vdev_id);
 			return -EINVAL;
@@ -7636,7 +7636,7 @@ static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
 			vdev_id = mlo_inactive_vdev_lst[vdev_idx];
 			entry_idx = vdev_id / 32;
 			entry_offset = vdev_id % 32;
-			if (entry_idx >= WMI_MLO_LINK_NUM_SZ) {
+			if (entry_idx >= WMI_MLO_VDEV_BITMAP_SZ) {
 				ath12k_warn(ab, "Invalid entry_idx %d num_mlo_vdev %d vdev %d",
 					    entry_idx, num_mlo_inactive_vdev, vdev_id);
 				return -EINVAL;
-- 
2.34.1

