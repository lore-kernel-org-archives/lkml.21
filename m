Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795926;
	b=5bdVv2FmzU0kwxEa9VctUnsHGnVnzhzTPIVd6yrKKE99wXLwW6VS9IDLVeocCFf3onGl
	 0t2cuQpOrBmARHZTNvq7vbVmIZYE0jsLu0cbvE58k5F7Yvypi8Wt6QK7xnxy2/NFQXxdm
	 IQtRAvqbmvgHnk0TG0iJm9lij8csds1d3/JaIdgYEMVviQzf37DY3kWlK+C3/FtYGqXgW
	 rV+mLH3amoJVlwhL/ztuxhGh11I6H1L0sWtKeMZoChC9lZfTqFBSClmVuKlLFytwF9gRb
	 pbjLEUZbxPJyvsQYj76XiebrDgLNynlFLhJ+ayfv+6pY35KY89EkjssIZCV8nUXSi+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795926;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GooQ3L9XZXoCVxo5mmAJMLT2ANqJQJ/bB4X7SGKdHqM=;
	b=3LgGRpSALWsV/NnQZZe1z/IoJrkT2LipcWJm7Mwu2tB5XFGiUy133IxQUHPsAV1nhKbw
	 08PEvftjAk2261oLHP8nPWm/+GI1l7KCABg5g0tCklJfKSp6NBx0SzbAaWMHx6AioKfoV
	 lI/dsQTXhaaMFoZ5dEa+KFQZUmoPhe9pkgzIDVrWwY1Y1/aNk6K4jcq88bWXJLVoL6Q10
	 OYRe2SBx8fa3o1wTwzYss7bZzE2b0KKX5ICeXSxLhJPLiak7NrQ9Oj0YG2o66K/pbP4gz
	 ZUwPXNrxbKA3KOzMHhv/g8PpadpnO+PXOwg1AhHvIBzExHYXntSPnLjfwcn+7PCuy2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JmQvho+R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xw7QwWQl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F41606A327
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F41606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JmQvho+R;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xw7QwWQl
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp7Wo2711969
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GooQ3L9XZXoCVxo5mmAJMLT2ANqJQJ/bB4X7SGKdHqM=; b=JmQvho+RZj1WUlsU
	d1zRu68u4+cm4D6e2Rx10hBpURMkblxTFDmF9lJL1C6ujOYEWbVvQjFFAD+bECIo
	OQ6TkJbhfDj7lNHN0QOHjpOC5go8S2PSK2Ij8HQBeR68CU890MngO3kKAPJmJkqb
	qdLM5lT15N4Os3j0Sltbr8ZW8iBa+LJZnNaJElYmv070+J1EyhKg+BDsZNg0CMgI
	nlOHzeOTixDZEvOaEjf+7lbc1q+c7U8tzHdRV0554iXtsqeb3PV01lgP2S4vrzZU
	hYxAf0bSZE+kTnwKxXHltCBma4FP4Z6Mr2gg4FoURq/m0NdjAWivo0gwnyMSqCQ0
	/al/DA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gat6x8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:12:04 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b3342f229bso112184707b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795924; x=1796400724; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GooQ3L9XZXoCVxo5mmAJMLT2ANqJQJ/bB4X7SGKdHqM=;
        b=Xw7QwWQlrFlSnSCYESZnXNulPWaqHrwHId18HyKYvMz+v+7ms5+nuYw4LAJD8FYHrx
         qR9Gh9aK0q/vQVg0M80BZWj/qn7ju1NSoALeOA2uq+Ajk/GA64kWxnGLIagPo4ayaSQ3
         mlhF4otM5siuhHvdluqK5rrRBCoDKcuLzEFsLko4tUE7MU0NH3umAJU1yziY2se6pdUc
         lzm3ehbm801+IExSPn9DCWeewNcXl1fsfMRPD5GKuWgcd+kbv4HwTbbTOz2JVd0qmOPX
         n7s+aX0coTOb5xhT6rysUtsUMjpLJvmEamU5blvozK4B+Kl3jb/3dysR3yBt/8wpmJn+
         GlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795924; x=1796400724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GooQ3L9XZXoCVxo5mmAJMLT2ANqJQJ/bB4X7SGKdHqM=;
        b=yHoOr/icLsXk5bzICqBG+he96DAYK4FUW/zJh3JMqNsHWmPHPUiUL8ZoCFk9B7uTNo
         PGszc7gIHSQyBArZxRQ5686l6oh0JwYcvoSZTVzhEueC+HCV2r8o5dBL8Lpzr3z3oOjh
         cgxUGJ5aHL4xmaMWmVKKw9+FHeeKf6cpRfaKP+gRJDP0Dp7Y21lP7Z/K55qyBgtpT+cv
         prwbWMqeOzD1ZY0bg3Kv0C9LPP2A+sK33dlePa/cZAYZ4u9MvlGxdT8hOooh2uqR1/Nx
         aGMYcyqh+i9WeQ5d81Ymu21oxXIK3O5uI85+btX0MYgVlHYnMrrin7uCSugAzjttHrEt
         LAMw==
X-Forwarded-Encrypted: i=1; AL+hErFdxl2pNpnMrMeOQipzwGFwM7Lme1YZfRgF5L+EyqUfp2MIfuW+Epb5rkW2S1gqal1pZUXJxQirh6u+Lgo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3wfgO5eGPFU2DBqzSJhQeLDMUuZD+19nQBbr/DK3rY45CbskA
	CWIrodnR5TXMizXP+Mr+01hv4uh9oQgUGSYSdHnnHErE2FDX6rb5cTiFNeCp/uIWR7RTIBKq9FL
	zvrVtn2+2ZqvE33hQpksf3xoLR9RLnTLWMl/Na8oTSdi7Sb128Xuethv2T8CsFOIGvWs=
X-Gm-Gg: AZFdTZcfFLZLo6xMzWaAPMKvUHMRGrgAbUgOeHQ3u29Tfxr5UmiJfYYR0l+Ub1yhmTR
	fkEZjYwUfdcY3M6iS18uDBM/pIG2Zo8RG+Zf1HnJFg1mUH3m4z5q7F9Ew1IZoAQZGJpjfISMygN
	01MQESo26D7d2wu3IfRqF8iO4Xrw5vFAS2Cg6HKxkZxfzPaBmwA39kmDS7Kcx9NEUfRpEjyF1Nr
	oo7nhr/zPF3N+shZqa/TmBM/z1078wqZEfKFuTwBjv93TxTXIWDNGHdnlN4Us//40DNZea4Zxg1
	MZ3HB5ZywN4EhFh8rcIOpAJP1f8/eBpxeqrITmQh1nqPH0SXlV+RA3b6OqCFyMIpMpSoOVekdNL
	ZwFfEKzQ79jsoKVVUwIHz9Hm3w0a9IYUCFtwU3rxl+6hGYJrHjtqPOHCqujP73d42XsObrQ1suO
	IqSzUvQqEYg3irBppMafQDRb5XqCVXG6qkuXSSZjAp1EDk71iXrZRKs6EGc5PcnZ/IWt4biRoqm
	Rogjj2BAhmb0sdEp2pt/OGN2Yyt
X-Received: by 2002:a05:690e:1697:b0:67d:bc17:1110 with SMTP id 956f58d0204a3-67dec491d6fmr10546383d50.35.1795795924126;
        Fri, 27 Nov 2026 08:12:04 -0800 (PST)
X-Received: by 2002:a05:690e:1697:b0:67d:bc17:1110 with SMTP id 956f58d0204a3-67dec491d6fmr10546347d50.35.1795795923561;
        Fri, 27 Nov 2026 08:12:03 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:12:02 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:11:55 +0100
Subject: [PATCH v3 5/8] media: qcom: camss: csid-gen3: Fix the RDI
 timestamp controls on Titan 690
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
Message-Id: <20261127-camss-hw-ts-v3-5-e4b6ad98ce9c@oss.qualcomm.com>
References: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
In-Reply-To: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 55muCKY6MCGeeSef77fWv-fUvStZKd9W
X-Proofpoint-GUID: 55muCKY6MCGeeSef77fWv-fUvStZKd9W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX4YolSUtXL0a5
 kDaGkacKdKomd0RTtVPjF8hg2w6eEtyYShKjLRe201THNDaJkjBoj1PXBGNK6SAofTYNBYBZDoP
 ZGGj2jDr7sYCT8RYi82wK641ASBwzovQ2R6nFXSEit5Mvp9bzTf7ODOeExHrRwtDFSegrUprDlk
 g/MV47ay0SSbLbx2rGnHl23LcS0pRIsNFVglXCER9clWy22yBzPcAtfFo1rbCBU3Ip/NbzO8rLD
 CjBI+n1EfH5p+Zs/66drqc2kGmVp2m2Q+4XJarTK5CKiDD3yu3o/yhSWDqNy379h7k+keaXA1vj
 M2ATJy4ehXrdMv8KBLqocIMrAolepHm0Cb/Ia9PNBdVGeYY8Pm0t3kTeZxtu0Ek0KlmLCd5lTgs
 XXQ5dYdKiwzbIScRigzdY2AUsqSMwZdQfCXy4F1CEDrYYRX6AvufcFg578jlIfQtJB6YjEMnlHz
 34WISmrEXyx/S9DV3nQ==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b09abd4 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=bcQctLKMNhu4RQlVDfUA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfXyLywvgLLYyfk
 QeaFDJPT/H59w2+0CW9sCq3Wn/UySO0OtnfFFCqicIwsNLHRLQgHqcDQgT+eRQciID25vgzsqD7
 FB7bvummITNUaKyewjd0ri402idJwR0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

The RDI timestamp enable and strobe select bits are programmed at fixed
positions in RDI_CFG0, but Titan 690 moved both controls to RDI_CFG1 and
narrowed the strobe select from bits [9:8] to bits [1:0]. On 8775P and
8300 the current values therefore land on unrelated fields of RDI_CFG0
and the timestamp latch is never armed.

Pick the register and the bit positions per SoC, and program them with a
read-modify-write of their own rather than folding them into the
RDI_CFG0 value, which is where they no longer necessarily belong.

No functional change on the SoCs that keep the controls in RDI_CFG0.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 23 +++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 6a538d825f78be5cf64691c351149b0a8fa68c3d..5dce6f722d05817f43341d22560cbe32def08cf0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -80,8 +80,6 @@
 #define CSID_RDI_CFG0(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
 					(0x300 + 0x100 * (rdi)) :\
 					(0x500 + 0x100 * (rdi)))
-#define		RDI_CFG0_TIMESTAMP_EN		BIT(6)
-#define		RDI_CFG0_TIMESTAMP_STB_SEL	BIT(8)
 #define		RDI_CFG0_DECODE_FORMAT		12
 #define		RDI_CFG0_DT			16
 #define		RDI_CFG0_VC			22
@@ -103,6 +101,17 @@
 #define		RDI_CFG1_PIX_STORE		BIT(10)
 #define		RDI_CFG1_PACKING_FORMAT_MIPI	BIT(15)
 
+/*
+ * Titan 690 moved the timestamp controls from RDI_CFG0 to RDI_CFG1, with the
+ * strobe selecting which event latches TIMESTAMP_CURRx at bits [1:0] instead
+ * of [9:8].
+ */
+#define CSID_RDI_TIMESTAMP_CFG(rdi)	(IS_CSID_690(csid) ?\
+						CSID_RDI_CFG1(rdi) :\
+						CSID_RDI_CFG0(rdi))
+#define		RDI_CFG_TIMESTAMP_EN		(IS_CSID_690(csid) ? BIT(4) : BIT(6))
+#define		RDI_CFG_TIMESTAMP_STB_SEL	(IS_CSID_690(csid) ? BIT(0) : BIT(8))
+
 #define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
 							(0x348 + 0x100 * (rdi)) :\
 							(0x548 + 0x100 * (rdi)))
@@ -188,10 +197,8 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	 */
 	u8 dt_id = port & 0x03;
 
-	val = RDI_CFG0_TIMESTAMP_EN;
-	val |= RDI_CFG0_TIMESTAMP_STB_SEL;
 	/* note: for non-RDI path, this should be format->decode_format */
-	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
+	val = DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
 	val |= vc << RDI_CFG0_VC;
 	val |= format->data_type << RDI_CFG0_DT;
 	val |= dt_id << RDI_CFG0_DT_ID;
@@ -207,6 +214,12 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 
 	writel(val, csid->base + CSID_RDI_CFG1(port));
 
+	/* Arm the SOF timestamp latch, whichever register holds its controls */
+	val = readl(csid->base + CSID_RDI_TIMESTAMP_CFG(port));
+	val |= RDI_CFG_TIMESTAMP_EN;
+	val |= RDI_CFG_TIMESTAMP_STB_SEL;
+	writel(val, csid->base + CSID_RDI_TIMESTAMP_CFG(port));
+
 	val = 0;
 	writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(port));
 

-- 
2.34.1

