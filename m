Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684861;
	b=mBjaKaNzR75wpU8Ug+g3ihfRL2S1I1YjIrZdd59Y0AtunBmYX3JA6FIbx2AvNY23VPzm
	 wkSOfv0uruOtY4uJSQEWzK8FY/rAKDuI/a60GuzblUlzZlAphGrfausl8GoWhCeirJqxE
	 aCM0fSsLzoHpRb54U87gmAZ7kQkzBKOonAr4GTZoxzCkBovE+Hza7GVKOoki9wGSSPBPG
	 NelIw2WHOsQWSg1NObJg/q/M45WiZ8ot4rjjT9mOfaQrfW5DANTIdw/AefBNITg/rTg9e
	 U50reVlPReghETb5+Ws++OAEU6zTFKGsR+DjxLXhzZAPtxk1c5UFOiRr1Ze75N5PvBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684861;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7dXCZqzkXmwN+wFfCdS/ByK9E7Gk9Xnhivu9BJqco3s=;
	b=VAWnm4aXeftAfOXRU1v0loj2GgVW92Ys8j2qMfsi2PivzdbL94H/jV/5SHbtaur1J9+v
	 5LmFLkZNsUmww9EK+8nI6xjy89FovB4g2gmpfVWALj59pC64+Fs89GRq3tTyLa6THhgkh
	 5i6mAXP3tHbGpYosFy6gQ+berFsP5F5fwsLyZcOwU6+OgXgutiS91pHuLetvRmG7PmXGD
	 q8aiWx08RdwALD5r06chNnAAoRXN1n+rLdSloPwwv+e3hm5ddVP6XxhSVisbaW+PhyFMz
	 5N+B4CB4jkgIhsZJ1x7Cjttw9cO7Kx29iXg0LD/huZT7ImrtNWjYYJa378s9QXZYQTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TMC2UZC3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NusoFDI4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239C6606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 239C6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TMC2UZC3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NusoFDI4
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8NWwc2859784
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7dXCZqzkXmw
	N+wFfCdS/ByK9E7Gk9Xnhivu9BJqco3s=; b=TMC2UZC3pbrDgsvqamkhU2BsIlQ
	1poJoRoNy4OwI8yuL1akUK2zn9laq1yp+o1rYqcUazcGrq0bCrrExETNRR/ZEDl3
	q1XFINkM/bSHmdFkDa12kTl4DqB4jgWkrJv32vGLlqMGlSm7uEMcq7o9gYksRNdG
	Vrx0CUVxiOwwObpD+uG8a5KQh/BqAIZCT0QKMFUzlE99pJRw8i3dZ5lhA/4Lwbgg
	tYwcbXZtMCDsmDPTKhHQaRg6GqNquoNEETCoAJQB16ILat2Y9LxKREI/D/i1YXVD
	F1rV8Be4an3Z7i6itjaXECFEbDGAJmY28TgJi169/HWVQPAawKMWPQ9cHlg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7g87xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:20:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdb90a6230cso3338555a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795684858; x=1796289658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7dXCZqzkXmwN+wFfCdS/ByK9E7Gk9Xnhivu9BJqco3s=;
        b=NusoFDI4t91NfrzS3bj8E3zEsCwq6mQvOJ6MNosjiS3k5r1b5C5S3plsbFtGD8TeNX
         FI0vR6h886YvjlQsJI/6+4DTgt46Lxm/HoT4bz9tM+l9ouWsTNyzbyEjL55JAorT+2so
         mTqe7BNSzdChKDZBlXBPO/sNvDq3KoKMmVzfnZ5QzcZtx7uAGHzPtXFPTf9NtrLSebFn
         oLBwnLEw0r70Az5wcFrH4uztGRFQR+cmcZBGPWcvG+uyFMkxxU/mYxrRV513ONMC71A3
         9QrwSxsRug/adq3KDI8qYnGoxUJYBc8T6Y1eV77N/FvkOs3jqFBF8FBFeihCx/J2IvRN
         FC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684858; x=1796289658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7dXCZqzkXmwN+wFfCdS/ByK9E7Gk9Xnhivu9BJqco3s=;
        b=Y/jhbQpU6nkBAIMKhHmg2SY/CO7D2WqjZlBJ1kGTokgIMtsbxdIQEtDBmkGZjlouYi
         24eRe9kWg8Kk0ysX7VZLJmjjJ8dGlnlB+jAJYhoAWE/nKZqAqTTnHSeFARy61wERpuPB
         1D67iRHHUWiEfbMxcH39K7nrsdOy+z7JluxgnHsTFfhpUftBUIf5Wio+Q8cz6MFxVUag
         946I23gGzDUU5hv5VEbF5+AKIAOxL7OzFlVljnJK33d9XpRhkyBif3NHazrI8JWkaOql
         Ul5v/MI20z6F5WDg3nJdLXRtmpKr9N2Fm9i6+CfgViaICNe2WhiYaGnavTixsuMxYqTC
         zBhw==
X-Forwarded-Encrypted: i=1; AL+hErE4srSTt604kM1U8i4N2q5wxIBEmj6hC9Xh/8jbBbA1UVJwb5m8j3EGjZTp1d8ksZ1at24QT35wuHIbL0M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kTy1+0QJDRgxl9cvoDFTZX3D7WeQWME72EyLtvFQp4QY7B3V9
	XOmeWOPoAHp/+z8cF36GlERKKDjY0yejMDvZOyD9ELZuANfeIVzsR9dDbYcysx3m/C78V+bI57O
	jxGYgQA/e8vL6BGo6kiyvyRwApAo/WrATftgiWrKCs5L6fmlM+l2XiJwZrqlqBMJpCf8=
X-Gm-Gg: AZFdTZc3T/0AG4veubs2uqSTytupT4g1WTZGvLiNvGj7kfkM3XhRO7iCwKkouRaBfEu
	IX5yYWinrbl2uIgSLVAtNUQvvdjUjTbNnaXJ/yNTLgJrwzWfvw8CJOX2MR3MWa6MN1yP86avmA3
	sXiZ0mC6aXRzEYU0KNJUrErncjeCNDkSjougVzFCzhl6mCdhD+JpNKG8ClTtyYZvfCJ9FtKeFqy
	RccCUX7EA/C3R15XWtmQP9R70oUr/2zrWJrZgtmr0g8urV59fTd9AFV5T12UN7+z2lH7zcGfyZA
	6IVWpnSOdKxKnmOsBSP4/uuXIvaa51B/UUuwvpkPgbblxKfwlm+G+Uz+Ycn7JezSmMqVbL9NCkx
	jfl4vo02lDkD63TPDzgpvdzHVMYgqW1LuQLjNIAANY9OuFw9FvBv9ZdMkR5VF1T+gBcgp/5TADW
	LbvurJ7PfwoQoQaNqKjPaEVcd/9rEmPJA=
X-Received: by 2002:a05:6a20:2446:b0:3dd:85aa:452a with SMTP id adf61e73a8af0-4014b5659d7mr23101904637.37.1795684858002;
        Thu, 26 Nov 2026 01:20:58 -0800 (PST)
X-Received: by 2002:a05:6a20:2446:b0:3dd:85aa:452a with SMTP id adf61e73a8af0-4014b5659d7mr23101877637.37.1795684857511;
        Thu, 26 Nov 2026 01:20:57 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm10752089b3a.7.2026.11.26.01.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:20:57 -0800 (PST)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 3/7] wifi: ath12k: fix ath12k_mac_op_change_vif_links() for active-link updates
Date: Thu, 26 Nov 2026 17:20:33 +0800
Message-Id: <20261126092037.462830-4-miaoqing.pan@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ekvogniQYM6Vi84BdnAe4sKdQyjDV1hv
X-Proofpoint-GUID: ekvogniQYM6Vi84BdnAe4sKdQyjDV1hv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX32bg3CPwFy2B
 k1iG+Mjh8vPxdOXR40SAXMlDFTxQA3+u57MvW5ehll26GZJRyZUaY/JZJttWSel0s/VSkEK1VV7
 /e4RuSR2FMJbGvi88FfCzgC0FbHWwm0Csq956NVNZCAD4qnWi9qroxvohUhBApWif4nlncdNmpk
 RVWboRhOPN/37rbvIiYvUMRG/h9nN3P6CyLraGgQ8GGerDbksTkTGQSShEoSas9zxhGoAQoCIUK
 8EYLFEPmO8IxL81mXgTcH1AYyOFij+p/1cMir5mT6dVstKek6XX8CGHYc9xQH3VXypvRjg7WuQz
 iGvpVu21wnWqHhBU1PeGBDtxP59yxvckQhzr7mbJmmvLbAUgT+pf+xMW1uGcmBTGgO29TqIowVd
 IivTapF+fRpFx+B+1cjK6jBNsSS6uhoOTwJMQkTLBdRWHB/JWSj+8XFMAgY81w0KckaPBnRhzWO
 0cPB6R9j4MLci6O2ASQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNiBTYWx0ZWRfX/n/RiJgSrPbM
 CEEvKWg5LJzZfp5Mjtx0N1O34CKhYgj12e2fR++EgdCOYh60dJH5ryXqE6V6boga4VIoD3YDjcj
 bvAlntBFfvCuuA59TUS4qD127B+mp4Y=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b07f9fb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Ns_Jbl9W-MFJWGn9c5UA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260036

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
index cecd634c5f7f..d7234ef9c025 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4388,9 +4388,8 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
 			       struct ieee80211_bss_conf *ol[IEEE80211_MLD_MAX_NUM_LINKS])
 {
 	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
-	unsigned long to_remove = old_links & ~new_links;
-	unsigned long to_add = ~old_links & new_links;
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	unsigned long to_remove, to_add;
 	struct ath12k_link_vif *arvif;
 	u8 link_id;
 
@@ -4400,14 +4399,15 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
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

