Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658869;
	b=F6DWCS49dX3YLx0mXDOe/8z/SbM4Btraq404KTB5sSNST85bAmlSFpa/fF2BDrsBrwoR
	 WKXiqvQRQBfzfiS8keF90TMenj0QWYEu5UGdN9S2wvbh4zPMsNkmZprHXhmoI5uI7q9eV
	 Eildphaxq0keSvhgCImDEL/kU/bCDV5PpOv075mZXqPXEXECPjG5Mgyer35ZPCSJiJjxC
	 st0GryM04SmwxvTb27NgjgoXb0BGHqmzksto+RXsSWDWtsMu/4CkpZ4SSk6dFZsEBIOtc
	 RsizFakjP1JlCd90oPYgsyj8LJHiN8w39lbUpzFYrOK3Woq4n2uW1aLJDY3nyMwlmcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SyqmBY1RWa1USlwSoGhwRFBGS05QWoGC5aF9860rgWU=;
	b=2t6XsN7jf8z6uHQS869TRbG87H6Fa6R91592aHgCuPynGI+U0kT1JkOYg237ynYpp/bM
	 LtxFIAtocYRYp1xHxq5jk+nCHJcg6BT+r/IyhsHnQOkeL+W2aeoTJAMQoXHYrUTvwS8ug
	 93uXjHZcQNSP0PP7TYjmnTZtc0Hku38/B1bGnIloL/u7SntFKew0pvcsqjq1OeVlFxvKP
	 PPS3ziajujLkFsHlWGsfEcsq+hxuUX1gnugBLLSwUa3PZPXKcLlMn2d9RYScquxxCnpbU
	 YUu+tNr415EAF+mqkESbY6OjDL7Hi2u/1qMAhWh0yTaSVAEEjnDAUz8S6RnaVakZnRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mFnHGhGM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjnvWEOI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628DC606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 628DC606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mFnHGhGM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjnvWEOI
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJgvYe3661526
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SyqmBY1RWa1
	USlwSoGhwRFBGS05QWoGC5aF9860rgWU=; b=mFnHGhGM3rFVRy4cfGUkLNi777p
	77W6dCrsz7extpcJX0NH3mJD5BqQ+W6b2SHXeCyMdU4Jg21J84CvvdaaDQuYZwBx
	RzE4jB99mD2qYMcDPRqAUt3ri8d28XaKH9iTiAhOhicaRzIJaxokVQtOHM1IujaV
	mytpp1998HCbobRU94vGPUbB6yuvV5HoylcIhOtKO+spWokVChFwASrhz9jjbHj4
	cMYPeaDCASgRHa75+10Vu0Gdar/yW51dTvKBJKQMDbZulWOrqUZCTwQhI6vLWFl4
	MGmfMxJyu0Rw7TNKCKNtJ8hLFI6KsTsrgSajsGnJGoyOugkk1Y4lGl6Lsog==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y0xvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b44bcdb096so4572584a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658868; x=1796263668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SyqmBY1RWa1USlwSoGhwRFBGS05QWoGC5aF9860rgWU=;
        b=CjnvWEOIszbVAFat+QlMrrblCbMQNZHF4R6SgBiLKWngAdFq3VTuYV/Q9K/NOo6WPg
         t+479XlwXYso4ddFQnRFKiiYWwAn/7IdYErg5WfCgV13Z6tG0AO3jsdRR60NoGeiYFrU
         N9D0UcuwUI220Jw7TyXeO0GRy7e1ymtWkG0lh3wyxszLWivmek24f5WLYialkDedLazd
         D5JiPvVx22SrgJtGbRH1uHtLAW6/lXYSuiBK+MeiiS9nEKCiF24HTIKjgr7LXZf0gfoF
         xJNkKA/DZuHN/T6j909szsUqxWz7gMzuKgxxHToityxtOLwV1t/At5fdMotY9+Kr16t4
         YkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658868; x=1796263668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SyqmBY1RWa1USlwSoGhwRFBGS05QWoGC5aF9860rgWU=;
        b=2pgo4NsWClYShlMXALhE531ixVQUIsgkNuAvrpctzeVnZumbT8WwSCg2ndHPDVBOHX
         LGzQFIoKQ3t8kUQT5x/RD06uPjeSn7EqQ1Kw2XV5ZgYlIX34oZ2YV7wISoHy83MgZDgP
         L5W35IK8Tz+RMANvkH6Y9k0uyrB93g/RxqMX0D9ALv+/VAMv69+Z2e5XwCK2FPObT++Y
         t1Acy1oKMdc7GYaTRZHhMgUkuDG0II9kw/s6Yd0bXupSDKl45zVHdA8zqaXOixMCPBRh
         qRF6MNN6HvaE1idKoDabAIbrtQfZd9twbn6wNuPEdQlwK+TQZQBeMWXzoqQNzsHAli6g
         Dm2w==
X-Forwarded-Encrypted: i=1; AL+hErGye2pora8+smrNWT0+DoiToHYG+2FyBxnS1rvpKSImUud8MCWJP8k569Fa0SBeaB1XlsdAnwzYt/iwi5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HlSInc5yji7i4n+uIPYHj+j8Kuht6dtM11kCQkJBeKIcNx2uQ
	+54k5LNFUyqsYlTeaczP4/wnLMnRLBXyzkkotdfBrcPfU0k0VARTFKXxwjLTf7N5czA/z01WjNs
	y1sN1h0ZXn1kSy9TiGfVArrYqaNQVpfXbxVFjZHgh5vmvtQAVfIFVKS4CPX3IMT+3Ym/us2LlyK
	k=
X-Gm-Gg: AZFdTZcdeD5WEpXScjrNSfZ7kdt3GLwNJ1GfpzgYVkaNQXQsOiEFI/EnHNXQgJ/LWop
	QYoRSMov+KJwMkD3ppa9wFkZflZfspE4BPFqQDhNC4rFmKwGZwF6piTweaqX5wQVz5y7ChzL7lZ
	rIO/BRpivo/dkURf3Nm3XvelxKvCWHPLYRJuNegWFRPFPzIoVLUYrLoVrPDS5+lK+Cey3sXPez3
	hMnNcijJDtzi1Lgv9Su5TomET/ABQUQhLU74jKvN10JWJBo6ylPfygACpkMrA0DyaYBBlvledlq
	l6rLBMoXPQOwjk44EGM+F1p4jUZKhEK72ITyKaBBqieA1ecTFoe2VkZSEuHEDU8cau1bHJmQZkS
	uGFxCqs1ltuxFPUYt4dWQUMv2gn+lTjqqH9BXOrNMdNMMozdivmr2S4TFpNSDi3M42f8LAybclp
	XVo6KCt5c5kI+IB9fNsO0TXLCN7KkV4l7YOrXe
X-Received: by 2002:a17:90b:3a4d:b0:3b0:9882:9e5e with SMTP id 98e67ed59e1d1-3b41c8d488cmr19672888a91.18.1795658867794;
        Wed, 25 Nov 2026 18:07:47 -0800 (PST)
X-Received: by 2002:a17:90b:3a4d:b0:3b0:9882:9e5e with SMTP id 98e67ed59e1d1-3b41c8d488cmr19672861a91.18.1795658867222;
        Wed, 25 Nov 2026 18:07:47 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:46 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 6/6] wifi: ath12k: add debugfs control for EMLSR support advertisement
Date: Thu, 26 Nov 2026 10:07:27 +0800
Message-Id: <20261126020727.3273337-7-hangtian.zhu@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
References: <20261126020727.3273337-1-hangtian.zhu@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX8Fjkn0fUypVO
 ejqb6C+6xZXRUo0CWCvGJjFFKXofu2JLZ5YUmaIkh+8tRkGrRag92dNKtNJB0RouGzuymYR5q4X
 q+a4fChQz5R0oYtzBukVL7jxKphVsKOvXkfyb5KlE5h30zMjJvec7j8my2Vwy33QI7b+zFAkDDv
 tTQiVpnj0UFvihgRKYOMZ+j3glxXgy/sp35eGm1xbI1Ek2620cB96sr/4a7qbSEDfQRre25AHZE
 BLMlwgE1cYO8fSs6UAc7Ku9K9faH57tHSuQpN7XfzWe+3g1OHMGcqJkOWs3ZGS833NZYw1czCRW
 UR4+V7B7rywGaRJ4hSPoIn/AOac4CLowe1hysLmgYyu8kEOYj3LVimrg1AFdzR/2BkOq4S4wKa2
 R20ZDX52AlPOC31eni40Z4TihBR4l7YS0CPUNQNx2LyjyGsYsX2RxLI/EeonC3y+e3K/0xk5DGY
 njnQUw3SDbhPK4AGxzA==
X-Proofpoint-GUID: K_6pVIvDwfb5xaJYbrl-4lu24uhKPc_Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX4cAycorx9+jB
 WU+eC0Ws5tW0onsEZe+8P6nTRdazWnEomwJUdIhC4cnHXIfbXYZ/Bn9DvhM2CJWu7961Bg3B5mz
 9TWGGUYCDrN1GEWsu7xcsSI4zdf89uk=
X-Proofpoint-ORIG-GUID: K_6pVIvDwfb5xaJYbrl-4lu24uhKPc_Q
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b079474 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=QCLNOAGZVNuN6bSrVjcA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007

Add eml_capa_present under the per-radio ath12k debugfs directory for
MLO-capable hardware groups to toggle the advertised
IEEE80211_EML_CAP_EMLSR_SUPP bit.

Use this control before station association or AP startup to validate
host-side EML capability advertisement and exercise combinations with the
maximum simultaneous-link advertisement without firmware changes.

Read the current value directly from the station iftype's advertised EML
capabilities. Reject enabling EMLSR if any local radio lacks firmware
support.

Update only the IEEE80211_EML_CAP_EMLSR_SUPP bit in the station and AP
entries, preserving other capability fields and leaving the generic entry
unchanged.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 78 +++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 657bdd4c7744..9852769cbbd3 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1670,6 +1670,81 @@ static const struct file_operations fops_mlo_max_simultaneous_links = {
 	.llseek = default_llseek,
 };
 
+static void ath12k_debugfs_set_emlsr_support(struct ath12k_hw *ah, bool enable)
+{
+	int i;
+
+	lockdep_assert_wiphy(ah->hw->wiphy);
+
+	for (i = 0; i < ARRAY_SIZE(ah->iftypes_ext_capa); i++) {
+		enum nl80211_iftype iftype = ah->iftypes_ext_capa[i].iftype;
+
+		if (iftype != NL80211_IFTYPE_STATION && iftype != NL80211_IFTYPE_AP)
+			continue;
+
+		ah->iftypes_ext_capa[i].eml_capabilities =
+			u16_replace_bits(ah->iftypes_ext_capa[i].eml_capabilities,
+					 enable, IEEE80211_EML_CAP_EMLSR_SUPP);
+	}
+}
+
+static ssize_t ath12k_write_emlsr_support(struct file *file,
+					  const char __user *ubuf,
+					  size_t count, loff_t *ppos)
+{
+	struct ath12k_hw *ah = file->private_data;
+	struct ath12k *ar;
+	int ret;
+	u8 val;
+	int i;
+
+	ret = kstrtou8_from_user(ubuf, count, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val > 1)
+		return -EINVAL;
+
+	guard(wiphy)(ah->hw->wiphy);
+	if (val) {
+		for_each_ar(ah, ar, i) {
+			if (!(ar->pdev->cap.eml_cap & IEEE80211_EML_CAP_EMLSR_SUPP))
+				return -EOPNOTSUPP;
+		}
+	}
+	ath12k_debugfs_set_emlsr_support(ah, val);
+
+	return count;
+}
+
+static ssize_t ath12k_read_emlsr_support(struct file *file, char __user *ubuf,
+					 size_t count, loff_t *ppos)
+{
+	const struct wiphy_iftype_ext_capab *iftype_ext_capa;
+	struct ath12k_hw *ah = file->private_data;
+	u8 emlsr_support;
+	char buf[8];
+	int len;
+
+	scoped_guard(wiphy, ah->hw->wiphy) {
+		iftype_ext_capa = cfg80211_get_iftype_ext_capa(ah->hw->wiphy,
+							       NL80211_IFTYPE_STATION);
+		emlsr_support = u16_get_bits(iftype_ext_capa->eml_capabilities,
+					     IEEE80211_EML_CAP_EMLSR_SUPP);
+	}
+	len = scnprintf(buf, sizeof(buf), "%u\n", emlsr_support);
+
+	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
+}
+
+static const struct file_operations fops_emlsr_support = {
+	.read = ath12k_read_emlsr_support,
+	.write = ath12k_write_emlsr_support,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 void ath12k_debugfs_register(struct ath12k *ar)
 {
 	struct ath12k_base *ab = ar->ab;
@@ -1737,6 +1812,9 @@ void ath12k_debugfs_register(struct ath12k *ar)
 	debugfs_create_file("mlo_max_simultaneous_links", 0644,
 			    ar->debug.debugfs_pdev, ah,
 			    &fops_mlo_max_simultaneous_links);
+	debugfs_create_file("eml_capa_present", 0644,
+			    ar->debug.debugfs_pdev, ah,
+			    &fops_emlsr_support);
 }
 
 void ath12k_debugfs_unregister(struct ath12k *ar)
-- 
2.25.1

