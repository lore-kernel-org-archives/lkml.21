Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795658867;
	b=XCFP2JyYlgBIZdwjEO2ESBenIT1x9tAF8nDetGW7cQcGGFQjSf/h8KU+Gvz3mCNPm/ho
	 hzX5CzzIUsanEQ2ScHCCsGEWsRws/Upcwd5uRfe710GcQYTjkVE2oZ+EJizGcDP4IX0iA
	 KFfjeOCoqRGd2dH8qXFMu/YJDYQwAQuCAGdU89bR9WIQ/LGBwdUvC1vdSIK2p67R58Nrc
	 tvucWKKdfwv9iSg1TdIgSCLlDOa8QpC3ysrFyItunl1AT14OXb+3P8QWwkmHEBx1gkFAn
	 9kNch01nhlFPK36sjzBXyTVjeM6pO4uTPjjyqs+xUYjVV96fHrSBrxIJqwNmDvR4N7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795658867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Nz+ktU89He0bF1hqohmkleNWzf3Mh6uTtANssCUZtI4=;
	b=HA4UT5Fzgr6l/ezlQqhn2F6tXSW3/TDS5DriTqu/l3N0Q9IinIEyAdjTT4KsDwfAOZ3u
	 0PBegg/1MCBiMy4PPo2EDdAm/tgqUPG1vb3PtwTK24AdOc0EYPvYwCMe4ITaS1H+/d3XO
	 pcUVMx8Bj+Jvy9yuWcefRStqf6ILoySH16F2wNib9yRQVCiLreQ/lwrVFn3iMzagS200T
	 B60Gj7mpkEcKTyxvxExhsi6UfK0zvhnyMqRnoub19oboEX1wJnY7r+1tafFXDLebvYC2o
	 W3HwL9DFflg8KrMOL8+k/KDl/noi5lPGZkvWx4l1WHC0zkmNq6oatRSh1doO67iqXjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F0wORpZ1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IHSpSsBT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01036606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01036606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F0wORpZ1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IHSpSsBT
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJghDI1138083
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Nz+ktU89He0
	bF1hqohmkleNWzf3Mh6uTtANssCUZtI4=; b=F0wORpZ1u6nIPpGtOgHUU4KIF6k
	caFb5fzEQP6HdPKe7LQUsDnifWhN8AKvTM1DZpTWHCncJZgmCXFbkPbb6fYeZ0zm
	M8YK25+FKHiC8gizo3ToGlhFd+qF8d5dldaXc/pxrL+c+olLI32i4VJFXxzM6LK6
	zhegKMHQxApVN8UjHy+5FbPJIR7mKuwIRrMLPHFyCxrw47/DO3ZwX5OT3d0guWkW
	JMt+pyft4q3Q7LvN/i3jLzRhT+TtewBQQ861pH37VpiTwdqI5aIJAwptp6jsF1MQ
	gQ44i0rIavLlIaCh1XnSqgxm9l7M9l5sABLlRD7O7p+V1ZeW7/aBE7aG2ew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662s8ywf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:07:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3f3e256e8so6244693a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795658865; x=1796263665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nz+ktU89He0bF1hqohmkleNWzf3Mh6uTtANssCUZtI4=;
        b=IHSpSsBTeEZeTU0NZBHhPIU1LhAwahQfF3//USpzPAkl5J7fk4G1E8MBqoFSxjH4fv
         oWNTl3TOhJ7k9BCHDXNHURw0fcTRgB/OtjYj6XSZYq+o+7VTwEBuV2JSQJ+cMo800CUe
         cYTDuIt1p3Pvil+l+kkQ/I7iM4cz+mWMl3YCQDerAaPHwXgB3iBI5EIM2+4oiY+RX2xi
         DqHH3lXR95HC/vpoNuXAkh2a6chm+arEtVwFNJlmQpskhCf2AjDSmBoU+MgnlxyOPcPo
         6GU2OYfqWxhZWXO+I7OwfqUKr3H2qFQJXbIJQeTQoqpIlIVgDL9zW6oXYfzhZEvPXDK6
         rkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795658865; x=1796263665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nz+ktU89He0bF1hqohmkleNWzf3Mh6uTtANssCUZtI4=;
        b=SDdbx3Ek5A94s2SkX8PyIUkdkGhxU1YpKWWKXKgb7zNS+g8fSs1fITQDFmFmHNil7e
         GOx/j4cXQVQma1y4AnZOUs06hkgOxDnAcbA+DMUPsGT+ZelpF9NAB8bT0A73ZIibu5tM
         8VZuq70MBpGgj8ok9v7JJASnixN4GSypWOmk7Gqqhs96eG6MloStOoftmJ14XyT5wCkZ
         vu2JcQ8LK+mc65souFXKyDBethK8dc1rE41mcUNva6uMpZstflXwvFtb7Io/+TDd8FBg
         sbvkjnV0QlAqIAcjyZn/X69LIZS5cV6LIf4nKpKWggZse5Dh0lgWbgsf140I+aj4QKDl
         eLqw==
X-Forwarded-Encrypted: i=1; AL+hErG5FajC58yyAYbuqiiAsM0BwSpumvfZflG/xBcTVIWbE9cXsKDnoo49blN/T20F0aSd7QUYxMhM0dQZOKE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0mey6l9655KLxjz/xJG918KsStyqtiQpcDJqEinDsTgqBnEMc
	bG+nsLIQ0oQU9XG6MC+2FLw9LDJxAqFhtk8nnGlHpAVZ8qWK2P+wpNNFT9udS0TP8lIeflsGWMC
	L0tua606admKpiikFQByFoQfMy1yBlaBcT1hJGDifEc5cqRexPNuL0aUlUXNzRDEBpDE=
X-Gm-Gg: AZFdTZflHDQ2UJq7HuZObHfclKDIHiqqCtLjDYrju6E+2DIj8KiVJ89CekGM2KXsaBz
	8JoYQESau9WHFxf5OagIdpZQHOv2RPPtbalbJqYMAx09EpsxeL7sd/0JAS6Ae9oSYtmMfd5aHvb
	0Ko2Gcg+kbm/YnH3O6782aIsOzybr3Vjy7EYZr1mG/BN47QGYdxvnFtWuTlSU/gpS13zxcgSM24
	HsO4b1jYdfgp/qw+h3eWBsyDqmbVYpd2W2dmbR9+fj/x+zRMks1Gkq17y4i2e5frQUDZP4b8+em
	6CnripuSEAzIlFDnUEPZh/B08epH3z2A6XiPlmSz8J1SINMJytw0PxE/I5+zVpQf+3pWg/B0am+
	x2AogsuiruAWo+MSGN3V0+36IIW+EQh8E92JaKMKbMb3HSkfIEJWoA8IAzD4jT7Niuxi39RvqN8
	03eI20kgikyDdRInDLgSt5nh9yTrucCUdp4U3m
X-Received: by 2002:a17:90b:2e47:b0:3b4:eb3:a34e with SMTP id 98e67ed59e1d1-3b41c8fe15emr17358142a91.21.1795658865335;
        Wed, 25 Nov 2026 18:07:45 -0800 (PST)
X-Received: by 2002:a17:90b:2e47:b0:3b4:eb3:a34e with SMTP id 98e67ed59e1d1-3b41c8fe15emr17358115a91.21.1795658864718;
        Wed, 25 Nov 2026 18:07:44 -0800 (PST)
Received: from hangtian-z2-2004.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm29626356a91.3.2026.11.25.18.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:07:44 -0800 (PST)
From: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
To: jjohnson@kernel.org, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH ath-next 5/6] wifi: ath12k: add debugfs control for MLO simultaneous links
Date: Thu, 26 Nov 2026 10:07:26 +0800
Message-Id: <20261126020727.3273337-6-hangtian.zhu@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b079472 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=oayyblq_nbOQyOWrDy0A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 439d0L_w42JwP7GA4wgLs5hR8RALJvx_
X-Proofpoint-ORIG-GUID: 439d0L_w42JwP7GA4wgLs5hR8RALJvx_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfX257EoPDWIQAk
 z3ELrXYYQV0BHe/2fblwQIYmtp5ujRvVAaAj5nbk/ipePfeO6gc9NIhj3LESfX4xFESetuQW+lh
 lovtt/3tiLiwGNaBNzsnSbKFjGbuLTqZe7sUwiV6lKeCiRzkccNoaqy3EM4UDjq5RBjS5CzmPAP
 VwTc+3s+AE2LfZOpdMwhMwWpbkmGt8DNFqaZWzLvuyl3GVekcTyHA2EVakcTWaHqhCEwTAys6Wr
 DIsg2asHP2pHQ/9HAJ5ZVQY+PSCm+EHqIQJwT9VJrFhdhsUaTVm/nXYCpI2937CalfddbzsS4Be
 r9zHp5UD9OmtB+sa4SkcoNUEVVSP7gxGkOqC8K1rOd1QH4R8C52MgdI31I5HIHCNGnw/SozEkaB
 hFSDcpiUBwL/DoXRq/5dtZ0SnYtVNyEUWliM63d0s3cJXmPCE4TBVJk2UrHanx3mC039GPt/IRv
 XZ6QQq/JEhO0Un3exxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAwNyBTYWx0ZWRfXzeegmc5ZlEc8
 51MSCRKj5N6CDC8g3cFHgB53rG8WzRElTWBniM8U/Z/6C9qfZKxpdhJTPn4Dq9Sb9X0oF25VkIK
 vFj27LNKuVJj+boEv79hYGeyU0QiChc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260007

Add mlo_max_simultaneous_links under the per-radio ath12k debugfs
directory for MLO-capable hardware groups. The value uses IEEE 802.11be
N-1 encoding:
0 advertises one simultaneous link, 1 advertises two, and so on.

Use this control before station association or AP startup to validate
host-side MLD capability advertisement and exercise link-count-dependent
MLO behavior without firmware changes.

Bound writes to the first local radio's normalized firmware capability.
Infrastructure targets derive this field from the hardware-group radio
count; client targets using the firmware-count policy expose a single pdev.

Update only the station and AP iftype capability entries, leaving the
generic entry unchanged. Read the current value directly from the station
entry.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/debugfs.c | 90 +++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/debugfs.c b/drivers/net/wireless/ath/ath12k/debugfs.c
index 12791e267d1a..657bdd4c7744 100644
--- a/drivers/net/wireless/ath/ath12k/debugfs.c
+++ b/drivers/net/wireless/ath/ath12k/debugfs.c
@@ -1587,6 +1587,89 @@ void ath12k_debugfs_fw_stats_register(struct ath12k *ar)
 	ath12k_fw_stats_init(ar);
 }
 
+static void ath12k_debugfs_set_mlo_max_simultaneous_links(struct ath12k_hw *ah,
+							  u8 max_links)
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
+		ah->iftypes_ext_capa[i].mld_capa_and_ops =
+			u16_replace_bits(ah->iftypes_ext_capa[i].mld_capa_and_ops,
+					 max_links,
+					 IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+	}
+}
+
+static ssize_t ath12k_write_mlo_max_simultaneous_links(struct file *file,
+						       const char __user *ubuf,
+						       size_t count,
+						       loff_t *ppos)
+{
+	struct ath12k_hw *ah = file->private_data;
+	struct ath12k *ar;
+	u8 fw_max_links;
+	int ret;
+	u8 val;
+
+	ret = kstrtou8_from_user(ubuf, count, 0, &val);
+	if (ret)
+		return ret;
+
+	/*
+	 * debugfs value uses IEEE 802.11be encoded form (N-1), matching
+	 * MLD Capabilities and Operations per IEEE Std 802.11be-2024
+	 * Table 9-417n:
+	 * 0 means single-link, 1 means dual-link, etc.
+	 */
+	guard(wiphy)(ah->hw->wiphy);
+	ar = ath12k_ah_to_ar(ah, 0);
+	fw_max_links = u16_get_bits(ar->pdev->cap.mld_cap,
+				    IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+	if (val > fw_max_links)
+		return -EINVAL;
+
+	ath12k_debugfs_set_mlo_max_simultaneous_links(ah, val);
+
+	return count;
+}
+
+static ssize_t ath12k_read_mlo_max_simultaneous_links(struct file *file,
+						      char __user *ubuf,
+						      size_t count,
+						      loff_t *ppos)
+{
+	const struct wiphy_iftype_ext_capab *iftype_ext_capa;
+	struct ath12k_hw *ah = file->private_data;
+	u8 max_links;
+	char buf[8];
+	int len;
+
+	scoped_guard(wiphy, ah->hw->wiphy) {
+		iftype_ext_capa = cfg80211_get_iftype_ext_capa(ah->hw->wiphy,
+							       NL80211_IFTYPE_STATION);
+		max_links = u16_get_bits(iftype_ext_capa->mld_capa_and_ops,
+					 IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+	}
+	len = scnprintf(buf, sizeof(buf), "%u\n", max_links);
+
+	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
+}
+
+static const struct file_operations fops_mlo_max_simultaneous_links = {
+	.read = ath12k_read_mlo_max_simultaneous_links,
+	.write = ath12k_write_mlo_max_simultaneous_links,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
 void ath12k_debugfs_register(struct ath12k *ar)
 {
 	struct ath12k_base *ab = ar->ab;
@@ -1647,6 +1730,13 @@ void ath12k_debugfs_register(struct ath12k *ar)
 	debugfs_create_file("ext_rx_stats", 0644,
 			    ar->debug.debugfs_pdev, ar,
 			    &fops_extd_rx_stats);
+
+	if (!ab->ag->mlo_capable || IS_ERR_OR_NULL(ar->debug.debugfs_pdev))
+		return;
+
+	debugfs_create_file("mlo_max_simultaneous_links", 0644,
+			    ar->debug.debugfs_pdev, ah,
+			    &fops_mlo_max_simultaneous_links);
 }
 
 void ath12k_debugfs_unregister(struct ath12k *ar)
-- 
2.25.1

