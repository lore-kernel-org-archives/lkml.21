Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982821;
	b=TIOZcMGYGWRuxPrP4aW7TCDlPR7eBp7QdsxKLg7sn+VVI2PI4RneYXm+YZtO3dCmdAPr
	 0ZWtxyoZ7R8eszT1PlCSrTVQxJjyO5swoQHiTRsZzmU+4/KIJn+cab/nwEZHRBgPisN9b
	 W+CfBAr1DuPfYRgJTtiZu+HhQxbWzFWoFW1XPiBgokEakOkDc6M2Zxd2VhvQ2U0eURmoX
	 SFlZZgmTcXyprwbdbF0ZSHc/w95IXfN2P6SFvaL6D9zFOYlfqGIXuvfEyrQHt/q5GM0vG
	 3JEDplGr/7UmYGT4eBqTUQjYkDkTh1tQ3vrgnOQpD8Qq6RdP8XA0tfoo/GjDLXuy2cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
	b=gW9M+vxXUqUGkVJHuPDF13Bu66KJZzsg90VA0BsvhdA6S2KHRGjAzxkliUytd+dgE3ft
	 /bPqqllY0X2Cu2KCjaGwsBLAiE5euGfAcLS5opGc9IVbYMKXWcgPmQ1ALmWCoj3sI9L/y
	 9F7cdeWtydWPJBubO0Esn4+wO7ngIMoq+bAJ0QHxB4lqyaY/zaXZG9fL/L56tLA9jGoBD
	 8FQxeShAtbS8rc80itWokIHgAAIPQb6o10wyk2mNnQfsBVGPnfgVYID2HRunGI2JrsSRQ
	 FcyJlvX482pF8UjJu5sarqrF6ACFLRR/xv7b//UOEc6Ah4Ar29oStdCe0YL9DhdYaAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y3jPPzR8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="AXbYmap/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995F7606A89D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 995F7606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y3jPPzR8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXbYmap/
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI5u7gB2438470
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=; b=Y3jPPzR8mOV/BonK
	lBRvXmtMYaTAitKtjPjJC3235gUB87lBOZ+Yq+QA2ZsGdo5PhG9GJwPsSJ7gOPGQ
	UA0EXrG2UXygeyQnPdOsRf/q6GrnKDgfGQ77VLFP2gxuKRaLhNFCCDk/lcE8Tllv
	BluwG3MoHd8j4ikhPrWCy0xVLtVpK/bAdTrmbtM19vHPJPWfAVpEU7ULwL9jyMtV
	bBc+oL3Mi5gce+CU/Wc3CQyOAywRr8pautqHw+jbA7/Q1CHxwlAdHcIPSwIevhYx
	zvzXX6Cx48reYBN4DzWAA6+0bMOXUDdIiLaBsvpg/dniVlVA4admmHH6IwdjX3PA
	9UaghQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8hhug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:20:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3a9ee822fso810168a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982818; x=1795587618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=AXbYmap/yUONQYzHi+sHxrL0DkdW3hqI1oZEVA0G+sOu2nIdrz3c91RfRQV0JMENC3
         R1TD+pCFZcOBryO/SybWtmxn+KByR4MPYtp+v+NXWgPXgWG2HCH9E80Sb++4NCTPbZAL
         8VCmVx0mklM1Q9Q9/T9PqMquKmYsFK+goBHxRNuYIb080E81quIlaoTbd3/Z0kLyW7bI
         IJFkFlyv50zQ3c0jF6DcoOG78/J2VCpJrplvWTnpx4sUL7Mk0sngfpvqQLJcdmzcBvPz
         H1rlbIbRRzvCFmnHe6t339jcLgtrvCh8gpbYMSVcx2grdJhECeXT/PmklDuwJ2vIbbH6
         ZyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982818; x=1795587618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gx/W6tXP2KdrCc0CO/VXLdzUUudIbq1I1EKN4P81bA4=;
        b=FjExAsoXXewzUrDgiGd/ieqCCBI9t2S9XS3ZDwPn7OoCL56uLJMGx/gXp6k2oUX2hX
         v1IDVcRk5ZTnSvPMAGC8L6kqAUKKEYN2DfiKgFj4/mxoS4b2626piXkA66m+rcFvk6Vq
         aIlipqTRA1xH3R/gKVzo30AW051CR3ebeYlQQYIqBZQ53V5uXKMwkWgjN84zRI3bf3TN
         iCO57SB/8Bs/q5Vhmjmy4tj8Ui4aSOmnfl3UR0IU7moj3xv/MLNf4PWteGKXAApSBEC0
         3lE1D8fXqeb5fCiaLq1iU6JpItefkaQU+lc6WkWAmqXXtTqq6n5+C/jgobkRgefDHYVy
         fmCA==
X-Forwarded-Encrypted: i=1; AL+hErFr6ToC0T5O1BREveg4lgWKrsQwiDEJxx7xPL4h0qRCKw4CIvCKjidgZV2lZ8nw5MkL50A67w5hJbPv06I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8re3O/DVCZ4cBsbrGTai6LL3svsEDItjPOuZOy3SddO7DGgNhc
	VYQvxV3cE6eCSm/QyYbAFBgkeQkTfW9P59Itq8xyjMOu3bPXyXrvYww4ata46cge6l+P2JlKEVM
	CdgDTN0p338w6KiZNrbyMV/5ipiIzNbB0w+qvumMGK+NIvtfcyOctVAq6Ldt9FJoQjEA=
X-Gm-Gg: AZFdTZfXSxkgcD9jKH37kZfbzGvBI7of146SgbL3dGJv6FCBlm2BPNz5adFXdwqTKlq
	R7Vd+wG2KmaTwiW3YArhu7Uqst+iFXqNKes8Z13uQtl6BWGoZpiN+CkjmZClzmVQvScx18K/2KY
	QRcl4eBIes05IGB63XhNB8PTRjpDMYq3DX8ThU92CLZXG3mW9tiWTuS9rBzWV38uEkhs0GV8m7O
	YtgSKDSENIUgdwhrDXQLLrwWoOkZeTC3avAlZEFDqcCvyAShnPk4qgiZwPCFt8GrzrkAjvZAevj
	ys0KWCA/iXx85knGetfbZXNGS+F0a7Pz9pAbehEM9aSRlkCKyu+UrVOt+LtwWbMX+p+/yGIe6oX
	9zmK7OmPaXR3LDe5qz5K8jR3UlsJTkSeQ5p97QyFaAdY8OEpJBvMElDa9WcNOAvmHtZalaKpgmy
	YFxGzu0WxjYAm7tzPbJklir7xG2oNvWUtyr0XUaJAM5XDJW9o7IyvnGeIedGHgbzY3OyVLb0GyJ
	OM=
X-Received: by 2002:a17:90b:1847:b0:3b0:9deb:d991 with SMTP id 98e67ed59e1d1-3b3d07bfcc8mr1653308a91.35.1794982818120;
        Tue, 17 Nov 2026 22:20:18 -0800 (PST)
X-Received: by 2002:a17:90b:1847:b0:3b0:9deb:d991 with SMTP id 98e67ed59e1d1-3b3d07bfcc8mr1653276a91.35.1794982817603;
        Tue, 17 Nov 2026 22:20:17 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:20:17 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:16 +0530
Subject: [PATCH ath-next v2 13/15] wifi: ath12k: add Wi-Fi 8 hw ops for
 QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-13-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: boA4jrJ9YsGmgHdvOY4IIZa0HcBs45A7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfXw754/oEeuwzA
 Cyi+6FaDN2eODYfZQsug90PQjit0PA0t1DpPiWIvUK97UJYG7KiZUed9lonEsDm05NRLOWmDSBU
 +nl/+cJvLUGpFbDhzCQmvlqHjbZ8/3U=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd43a3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=L9wxWISAF5v3VASzmuUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX5eTQel4ckvfe
 ZH3gskTiAAHqYeHFhVcbcdaaWKFKUxT/8tVZoPCRjZLj6A8IV0wJS3/d6vK4V0oE/+k/4nfgaQw
 6N/ROn8jIJJ9eQVDoJwqxgYMXQqAYyTdRoWTYrqy9nGk+xNywFO3z4JX6/vPpDPqBWU3DoTr5qJ
 o0fSTxrLrrznOKzcAxFr9mMw+fg8pCOI02E0e7xomjqMHzeOXukYcCOR14HpC98y5M2kgbArYaa
 RhnCN0B/sygqprGhsdhtqjF/gkYsniote3nPkpgSQ/PbOWdOOMk4uDHonePO63kr6Fg34rFCvYQ
 FDLe1Q+eEiusYPcfDRobH6taaqz3zLbkZldGbaGjCRccULVXXOJcqceBC7T16UYi+/MMooL67hH
 qnLA5iRBR/3zrM1k80UEc/JVHoZnQD1uZCvSPjYc6dF02hql/7InYG3gF7A+d2/QgiTCnG/z1Og
 +N6qnxb9HZgH2pwvc0w==
X-Proofpoint-ORIG-GUID: boA4jrJ9YsGmgHdvOY4IIZa0HcBs45A7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

Implement hw_ops for QCN9575.

Add QCN9575 hw_ops (qcn9575_ops) in wifi8/hw.c implementing pdev/mac ID
mapping, srng ID lookup, and TX ring selector callbacks. Update the
QCN9575 hw params entry to use qcn9575_ops.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wifi8/hw.c | 38 +++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hw.c b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
index 74873fc5f3f3..92c897de16f4 100644
--- a/drivers/net/wireless/ath/ath12k/wifi8/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi8/hw.c
@@ -18,6 +18,42 @@
 #include "mhi.h"
 #include "wmi.h"
 
+static u8 ath12k_wifi8_hw_qcn9575_mac_from_pdev_id(int pdev_idx)
+{
+	return pdev_idx;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	return mac_id;
+}
+
+static int
+ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575(const struct ath12k_hw_params *hw,
+					  int mac_id)
+{
+	/*
+	 * TODO: QCN9575 supports 2 radios (max_radios = 2). This currently
+	 * maps both radios to srng 0; per-radio srng mapping will be wired
+	 * in by an upcoming DP patch.
+	 */
+	return 0;
+}
+
+static u8 ath12k_wifi8_hw_get_ring_selector_qcn9575(struct sk_buff *skb)
+{
+	return smp_processor_id();
+}
+
+static const struct ath12k_hw_ops qcn9575_ops = {
+	.get_hw_mac_from_pdev_id = ath12k_wifi8_hw_qcn9575_mac_from_pdev_id,
+	.mac_id_to_pdev_id = ath12k_wifi8_hw_mac_id_to_pdev_id_qcn9575,
+	.mac_id_to_srng_id = ath12k_wifi8_hw_mac_id_to_srng_id_qcn9575,
+	.get_ring_selector = ath12k_wifi8_hw_get_ring_selector_qcn9575,
+};
+
 static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 	{
 		.name = "qcn9575 hw2.0",
@@ -37,7 +73,7 @@ static const struct ath12k_hw_params ath12k_wifi8_hw_params[] = {
 		.qmi_max_chunk_size = SZ_2M,
 		.internal_sleep_clock = false,
 
-		.hw_ops = NULL,
+		.hw_ops = &qcn9575_ops,
 		.ring_mask = NULL,
 
 		.host_ce_config = ath12k_wifi8_host_ce_config_qcn9575,

-- 
2.34.1

