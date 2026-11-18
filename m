Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970567;
	b=c7ref2Z7RyjYP7c5//V+JHM0+m/gUNkfgwtm8VosIpipnNsMG7xBPSare0L+3Stg870A
	 fqX0p5bOnGaztv/LgdyKBkFUD6c5wFa+HT5/OHUhi60I+HP5AUo5buUhf6zjkn6biOOPA
	 OZclmqtbe8KSqoYJd+l28baizo7ZKAlkkIo5c+I67iMANsbVFklbktGC9wqPGq10Yrw+W
	 PMgWB9kXN3lehqGU88+BeQdHlFAKCNPc+s/G9abTd7iL/bokcjTp5ru90fNJSky7tH+Wa
	 Zno4LaPFLeqOLrkLL0LaCUNZ1zF0x2wEyq9Zoh/Tg3yktGJV8VuoMdqofso5dp6IUeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970567;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sEL7nqXI9Qd0B10lH+KvmqjpNy+sypImUSqHw0Zi5qk=;
	b=LPi2TqwgvW9EzvzS/sutJ0E+5Ve5X25FRbZ6sZsNKz1ZqlltQ9+zGr50pK0D68BbavVU
	 d1f++xnn5x4SOWRTikt+BXLaVtOVhE6eFLubOea+de+ciBc/UjnDMrRkXVmdVAeAfhgCe
	 bf89sSu25P06gooQOXVBIwiY9bxM8cfQeWvQGZqjUdSlYVyfpPQHbyYrsDAMptUpGR/bb
	 AeNsXbELfbFQQ/oKFWcZrLNgrtl5Kkw9zdpzP3mk3dLtkbNxEsXvW800hPVhXCpESnobd
	 8uj2lv+CNbpu5HxoQkmwOBbObeVwLZ2OzmbUH/a5SsuOwMqHhQJFZsY2SC7Lr/khfOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="T/ok9eOa";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hP5S1Daq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE44606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE44606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T/ok9eOa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hP5S1Daq
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V3CT764133
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sEL7nqXI9Qd
	0B10lH+KvmqjpNy+sypImUSqHw0Zi5qk=; b=T/ok9eOaVHZOSaObsnv1EDiZf9W
	YZPCVauwFEdEDRFsaEm99+aQhh28WDR1O9OHHFFNiSPgmKNgMGG8HUVpUU2I1ULa
	05JHm9r22JjrH4sp33uGQiDQHh9YsIneGUgs6Tql2C//VIPuc+LniKvf/HHrgP0e
	dKlDEvJs/roybV368AcXKFYM4XM91UbMD8IL70ZdJMWBxVJadCrOR4d7iRdCLeQB
	zW2Zjk0LLCOj4k8sQ6i9s7lZZTfdOYL9Nq3ugkQlC+sq4PLLiJSYc4ylI/8uZ7U4
	i5VQ4js2iGfcoJxmQlDTqd9+5F/BzB6GKdOHJ960IykSLNbFPuUgGrSJpnw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb8tnv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:56:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ee184a2474so4177505ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794970565; x=1795575365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEL7nqXI9Qd0B10lH+KvmqjpNy+sypImUSqHw0Zi5qk=;
        b=hP5S1Daquo8gSY9XDKUNub+z/UL1P9qT7ugJgHk0Pa3xyUa7AW7DqWfB1MIaqNomZI
         eMI+k5hh7tHYW7fEBAJTYZOzGGA9ZUgIK7ShevmyAQFSLjA1rmHRZ2Wkp34x1w6vyQFs
         3TpBjADyxm75rkNJhySIRDeUZDOg4ciFrDnlDDTwYx9h99JbRG55A0QlpsKHmWULxlsM
         Q061OFPskdxwjmYevFVFQ+UDC/aFdDTxbW4DYM2BAmLEupDbh3iXUGfbsljmyoa4Lgg4
         PKZEzi5j43RXQAMohP6lhWJn70lAwDp1grUnL/jC3P5CIiMLcPF7Vf/19XTwddhuyVPA
         jTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794970565; x=1795575365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sEL7nqXI9Qd0B10lH+KvmqjpNy+sypImUSqHw0Zi5qk=;
        b=0C+ER67sl9Ly5ZNuiUeuSidn1FSVi5nknAN3n3wxC/B0urVzrBLrksSlL80HvYkitH
         fePXUzeI8e7c9M3QSN/n5oT8lCeEnYe6el89V+SSY/1KKLztV/2IvV8I0+3Lhaqka4WW
         bUus/kf/wvsCyBoAOJsDdL5NdQrUrAHYwJNeDuGVnRPeJPicHMh/K3gRU6ZORp5oI2u8
         2GNURcm6i2GBik7l31W6eOWbGQBKW3irYYnHFP3EF6xeBIwk2mJUocib1BJKFUlACSnL
         5jTt2ZVZpk9o5S+tFaAusRf5SUfEYCx7KdqjhnarHLga0irnh+hSGTMw5N2KyjcBouBK
         p97g==
X-Forwarded-Encrypted: i=1; AL+hErEMe4f473dMzOKh5wGnsHELF8gMPe0kG39HuFZZA3WPKlB5p3kI5Q05eV+xGxFAg4QfjItZlZpGp/DZdd0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+alW6xMx2UQnsgTDauGsTyw6vI4HZoFA1BL4qMV/AV0EMFKhFT
	pAiK+r+rLqhkfRirCj67CWIdIgk4U+sBAehKnATBpEJ2b1Wbdva8BboCI+FHOPd7av66OW7dqNz
	wiLZnum2Cv1V1s0HxH4fH4tfoPv/7ihOkKBWE1R5g2lBH1nzbZUceS/AqbKIERdMyzkk=
X-Gm-Gg: AZFdTZcjAAE3oHES/PmKc6ANGqvg3rI6pQQ5hVScsAgb3sEzl63rj/MTmz3g2sZOXCV
	RZTheHA9+XdSfDPYDBe/k6v/ebF0XYwlf30+12QITwPzQI8jmBwIAHYjam0sA4+cKGpoXPS3w1T
	I9zWdw8KmMm7qgBxf7/Pv9r7StQgQ/9IHokDvZ+neiRP/KwhcPmgK3t2OMFXa4pjZVhLPJ5gA9F
	SIr0rQaky0DTs2dRl/EuOh0Ife00zOIdKjcNdLPL+XmPWGFecrsjfehE7VI4fHgHmzAsCxjhWM8
	PLh2FuhfrunivYpUuqrxGrgA3qML/pB8ceHHAH24YbC3Q851ug/MtuTXmCtxl6VTLfy74/LNDd7
	FUxSn7JvVjykrCf08/F8HWUofzh0RFkRIvoxGWWarnGmSUnihHJZu1Z3D+jPmm4Iy6LNzkStgYm
	SAm0hs5QdbgHGmnLnZ2B/R6RiNepK7I2E=
X-Received: by 2002:a17:902:db0b:b0:2ef:ec63:320c with SMTP id d9443c01a7336-2eff72e5ef3mr12527405ad.16.1794970565433;
        Tue, 17 Nov 2026 18:56:05 -0800 (PST)
X-Received: by 2002:a17:902:db0b:b0:2ef:ec63:320c with SMTP id d9443c01a7336-2eff72e5ef3mr12527215ad.16.1794970564992;
        Tue, 17 Nov 2026 18:56:04 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622710fsm4842745ad.49.2026.11.17.18.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:56:04 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next 3/7] wifi: ath12k: fix ath12k_mac_op_change_vif_links() for active-link updates
Date: Wed, 18 Nov 2026 10:55:16 +0800
Message-Id: <20261118025520.39269-4-miaoqing.pan@oss.qualcomm.com>
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
X-Proofpoint-GUID: g6fsCKHaKcKRPwPckYJO8uE1H3sRKdZU
X-Proofpoint-ORIG-GUID: g6fsCKHaKcKRPwPckYJO8uE1H3sRKdZU
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd13c6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Ns_Jbl9W-MFJWGn9c5UA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX6Flyj/uU/tfw
 keZ9wMqYJ+iG95O+79hBO8ul4lylzr41fcTu9oonenltmmP67uSQuJogD7OsKqs8C2ZcTjCPhnS
 4eMt14h1tQGUOhM36bv2IqJP8yM0UK0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMSBTYWx0ZWRfX8CerjwDtaaM/
 h+MKoENAq9BuIKb+IatTfzHYT5VULPbiGIHe1WuLYTDZw0b+20rX8x2HL+tMn7yeNobV3g2KhPB
 NByEYEK4+Sw+llCTM08g3Ugq6wsQWh8wthDPTqY1xyd3i6g2yLw59QHGQ+5nEkm4TjHphxhWBLw
 BWIvpgkK4NfoxQt79xb6wlOEbPSWlb3xwmLKxBP1e1Sd30hXQOx6joHiv3O+WU06tTUZXWU0Kit
 aY0bhzTnXhc1i8s9nduWRUqoRGc8li6P4CM/OFiB6iXH/R2DQ8HNzsvcZLiuU5Eia3p03vUBo90
 F3Kg4lJM9IR3vV0tD8cMfYDpwbQaTzmicyVnpS96badSgIHOH2rofCaQaUuNJQBeQ75IHGjJbeo
 2G0rb3i1rBlXdoRYy1aWX/u5UbAt9e+IznQn5uHWhbfmVfip19f7pxB4h36quBSnrF3sT3cNMLA
 VKVZvilwh2aXeo0w7CQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180011

Currently, ath12k_mac_op_change_vif_links() derives the links to add and
remove from the old_links/new_links arguments: it creates a link vif
(arvif) for each link in ~old_links & new_links and frees the arvif of
each link in old_links & ~new_links.

However, mac80211 invokes drv_change_vif_links() both when the valid
links change and when the active links change. In the first case
old_links/new_links are the valid links. In the second case they are
only the active links, while vif->valid_links is not modified. A link
that is deactivated is therefore reported as removed, although it is
still a valid link of the MLD.

To fix this, derive the arvif lifetime from vif->valid_links, which
mac80211 updates before calling the driver and which an active-link
change leaves untouched. Create an arvif for each link in
valid_links & ~links_map and remove those in links_map & ~valid_links.
A link that is only deactivated keeps its arvif. On disconnect
(valid_links == 0) every remaining arvif is removed. The WARN_ON() for
adding a link that already has an arvif is dropped, since links already
in links_map are not selected for creation.

Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Fixes: 315d80be304a ("wifi: ath12k: allocate new links in change_vif_links()")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 3f106ac6141c..28cb549b1f46 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4377,9 +4377,8 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 			       struct ieee80211_bss_conf *ol[IEEE80211_MLD_MAX_NUM_LINKS])
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	unsigned long to_remove = old_links & ~new_links;
-	unsigned long to_add = ~old_links & new_links;
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	unsigned long to_remove, to_add;
 	struct ath12k_link_vif *arvif;
 	u8 link_id;
 
@@ -4389,14 +4388,15 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 			   "mac vif link changed for MLD %pM old_links 0x%x new_links 0x%x\n",
 			   vif->addr, old_links, new_links);
 
-	for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
-		arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
-		/* mac80211 wants to add link but driver already has the
-		 * link. This should not happen ideally.
-		 */
-		if (WARN_ON(arvif))
-			return -EINVAL;
+	/*
+	 * Link objects follow vif->valid_links, which mac80211 updates before
+	 * calling us. old_links/new_links only describe the active links and
+	 * must not be used to decide object lifetime.
+	 */
+	to_add = vif->valid_links & ~ahvif->links_map;
+	to_remove = ahvif->links_map & ~vif->valid_links;
 
+	for_each_set_bit(link_id, &to_add, IEEE80211_MLD_MAX_NUM_LINKS) {
 		arvif = ath12k_mac_assign_link_vif(ah, vif, link_id);
 		if (WARN_ON(!arvif))
 			return -EINVAL;
-- 
2.34.1

