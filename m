Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970575;
	b=5ebsEPz86xdLvh3inYaKSGDDSybjN46RcKWgzct1ZH011An5g72na5Vm3rTV/QDpr46l
	 nsCFcA5NVjCp9YOjto4f38DEgrRxycunMzm3GPaZzxe4P8tN2oZbDK8wJdbvdqt1xI3SX
	 omOjMZJnDjtDv//S9OcCSJwa+9WM0HirisktoXva+LR7RMMJgfjl6KRV/d/0vg5fgDA0c
	 KibdVqDWvTVn+YbkDBqVItQQbvSrVGbPeJXAuFisTceHKwOcJRC3WmOQzewJfX/4RiiX+
	 tkOCbX7lKZm7tpwJfa3nY2n70UF31+2K0jTyk/2p+UU2atp6ucncmFFwBf8db6W/CTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970575;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=85SmBv0V8+7ADPhne8xBAQBkF4pjtqE4x299Tb+RoYE=;
	b=w9tg0xcNUvsj0msaLnCILJ9vBaDyK28AgN7W6Il7VwJ0CTIm9GXyYhZseUi3qwLt8yAk
	 1iBxkiEOVgU4c6PPtaizDbY81cIPNDQ4Ic93o3yEvU6MPLUSvEhpLbV5LvMm+0LTvYV5T
	 kSXg6DAJvux2wRlO7ndVkjQaLqcE5vev0YJ/pnGCn1QIefX/3HH6hvHBeV8bRAeOlnWg7
	 S3uAS3kdXRqD6dTdf0JsupWuv2gzIH/auFyf99flp/7ZCou4Ak0CxFTo65QufOJHZ8AG7
	 LZOt1j5R3EHtgD/vGacUwMim6XsxE0OFf1ETJBpuVlo1aeB8dpFWkCvMaIgvJR57uog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LtPt5SP8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ADrRmTAE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5635E606A88D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5635E606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LtPt5SP8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ADrRmTAE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UrGG2383140
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=85SmBv0V8+7
	ADPhne8xBAQBkF4pjtqE4x299Tb+RoYE=; b=LtPt5SP88+Km7da/ttHAxJQoZcL
	naplkyj0WrQ+JEPvPgfLZu5336u2oFIe3CGEU4b80/3lzsRMbIRlR7vzMQWFb9Df
	8hZj1k5d10udrzbSb8YChYPZELZVl/XymdNlNl0zGnYrfsWnEgbnaGOt0dJfdfzC
	/OKFvGqvTWtbzCa99OTqkJoy5Ij0lZ1kGUmpiwlm/y+O0cKA0yax0NizAI6zE0nz
	Fhy/PkDFtfF7vBugQxaqxIE7/fdNCIbY+tys6Gx3uLpzdN+dsraBnrVgwFhpw1RH
	SV/fK8fJ3pdLrB/XhwsX0mjXH3zpUN/vIVSPjalcywja9JrSLAJHD6zPnsQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvarusq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:56:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eaf8ea208bso4374175ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970573; x=1795575373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=85SmBv0V8+7ADPhne8xBAQBkF4pjtqE4x299Tb+RoYE=;
        b=ADrRmTAEOLgr8TxC66WMDLEOjsx1AE2NcBwNmSups19u4Wqqr5Lwc8gCjyjselA359
         FBAF4TwW7xIFy8Kx3vQPn6LbfThtoaUQZ0bUlGGKzpXO+bIhRRug/MchOhxZf57o+XzK
         tHANtT6n6IjRMKqMlx5KzPccc+pdQk3b34Zr3vKsJYrovJHPKt7ppoViFWWmLXEVAfu3
         CBwSijFb/1xQAX9VHgkOyiciXeLilYT0e5gFyoN+hYBHQLZc4F/9YWCYMp5pxhodBSce
         cJ/FhOVmrv3+31Cdb6X7TepD/LbnGxGO28f2jEePnutG3swB6hsQUNvDvB5twZWOiA1/
         gfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970573; x=1795575373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=85SmBv0V8+7ADPhne8xBAQBkF4pjtqE4x299Tb+RoYE=;
        b=BOvj8KusNXeT+mDsZyrU8FJdIQYBqCi6+TQsK2O3cniwbInt8nAa/jh8CG/ItqSdab
         ynyaexvK7EedN6Sykb2KtjT50KFmlKsD5RZTk/q1xo00c+FgxQzguLvsSdF/l+TuMf5D
         HEnFsEdxB9n+HydW4SraPZ1NLabPLeY85Lpl2ZJ/bemEjl66t8pOdgwuUZoVL+YlEXbq
         AL1+X4TKuScxHJm0ak8xdoRv8uOglKG6ZsoE5UFwo45rVqODvue4LDbpxUqMJaECNcBq
         uE3z0BFbypUAlpmIB4eIck5GG8QcZvJ3oDPPwBNjUSDi2nHU9XLZj36Ssnk5ql6pV3jU
         iTMw==
X-Forwarded-Encrypted: i=1; AL+hErHp3HMCHYX8xecRjOjevJukQ9FBJ09flG8KLY/gWRmyzVi0aoKQdpBJfXi+uKyJbTMFV7rfRd7bmnjPL9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rx4Fmb0/BICW61ONIItP7q9I1TXKmHWyInAVyjKAyPy2fBG/1
	C+WGulOL/vU4AdOM+5Xt/m3Se7POipIY5Wd6x5YmH4QvX+IfwSpH3nJFa9zN6jOeekyMv9x/Wl8
	agHZk8qEV8DAha6140Li3Y/13wFCUpgcDbTLjTtgnKnFnRsNwX1Ezg9UlbBns8BdOhVgHT2cngZ
	hWOA==
X-Gm-Gg: AZFdTZc2u+AdOmRFc1OoLZAxamagpCULforBU6ZLX7QLLXXYsFG5dqENBHLUAxEkAW7
	bnIvOPs7Si7me1gboa/tVGVG5xs1lDChxqo3HkPTSug/zYo7qkPNiBD8JeN9MRk+a3VVNvN+gXX
	dnJ8xuYr2pCTTuK463O96ycrgO72MsttewuvIsMZyirk8jvpZ3Bo6X+NwYFM6NHXo1P/aA41GqT
	G33OP2R91CSCB/DLrOZURGBFAus44pywvmGqu4Z1AaXcW6HhWHp8H+Ru8Goo16dSvOjyiQkDXkF
	AXYDFXu5d8f0P5KWk92SXMW3dDjbK/mOnfv912fJJ6cxCeRApQxExUusB/Fx70JmPHjIsFgMVVZ
	7mCG6QYb+3zkTz0R8gE0dsDEK8bvEGftGY1fvPmgXDzTAaWzQ/jkWsAF6FM+cmUZ/JulNkMLrpX
	bNjAwvHtQPOxZJEOKhGUzGD6/ad7JKP5Y=
X-Received: by 2002:a17:902:f70b:b0:2e9:6788:9381 with SMTP id d9443c01a7336-2eff7100e1bmr12651875ad.7.1794970572847;
        Tue, 17 Nov 2026 18:56:12 -0800 (PST)
X-Received: by 2002:a17:902:f70b:b0:2e9:6788:9381 with SMTP id d9443c01a7336-2eff7100e1bmr12651685ad.7.1794970572382;
        Tue, 17 Nov 2026 18:56:12 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:56:12 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 6/7] wifi: ath12k: use WMI_MLO_VDEV_BITMAP_SZ for vdev bitmap bounds check
Date: Wed, 18 Nov 2026 10:55:19 +0800
Message-Id: <20261118025520.39269-7-miaoqing.pan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd13cd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=LZTIgfvDWzmdvsE2OGQA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: hh-s4_K1ogEOZECj5Yyujh6WpX-GAICu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX+PHxAPqr2ndZ
 mlyoUAtbWmS86uYTC/LIO09M6GvPvbjKF0bi2HsfgPGqBuAAgMHzmvw7Pdopl3dD2IhS8Yf8dS7
 zIXdsRG5HvQLcb8KvZE6YXMzaFyz/35fbdYxk144gPPUOlqBXqgpre4AUd+20rzxlol0NFhIu/i
 FUJkhdV61d+UmjZl99Tu3yNmWTQqc5qnpo53FFZSsx77xKuTcoK5ftA3BFJfH6pv0L7AMTxH5Bu
 JZrlI+iB3NdNuLQt2IYqzbiAfTHqtBV3/miLUN3TUTPFYzVS3NCJ3CsSEkR1t3PMQrJfKmyZBZZ
 l30YLIkZ6b4oKv8wwtCZD5jkUM7rinT9Yo6K5Twq/M/y89VPrYKVy1gMfV3e2d6LxII6EQA8NmH
 dCLpk7q5Jm/Dq4nwfs7WC3nJKvbvfh5vuU4zra/Pg3D9rLEXQwL1I/9K5WKB5aECiJQ054CqJRR
 9PxWtmtg3lFoLwZ8QhQ==
X-Proofpoint-ORIG-GUID: hh-s4_K1ogEOZECj5Yyujh6WpX-GAICu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX52Sj0I5lql0M
 5tY4yvfqQ+vDb5P1nTBUO4UqMSIjfVY80D/TDrXSYaboeScXXTKzTd7TcNZDMmcXZycBXTiAX/b
 wN8O+IkWDcTmyYKiD81hGOVCT3sfHes=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180011

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
index f57d4ef413e8..dfb0f6e678ac 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7605,7 +7605,7 @@ static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
 		vdev_id = mlo_vdev_id_lst[vdev_idx];
 		entry_idx = vdev_id / 32;
 		entry_offset = vdev_id % 32;
-		if (entry_idx >= WMI_MLO_LINK_NUM_SZ) {
+		if (entry_idx >= WMI_MLO_VDEV_BITMAP_SZ) {
 			ath12k_warn(ab, "Invalid entry_idx %d num_mlo_vdev %d vdev %d",
 				    entry_idx, num_mlo_vdev, vdev_id);
 			return -EINVAL;
@@ -7625,7 +7625,7 @@ static int ath12k_mac_mlo_sta_set_link_active(struct ath12k_base *ab,
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

