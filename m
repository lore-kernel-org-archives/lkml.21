Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989003;
	b=qbBMsCciLWAqDHSlAALtWs5sNOz3gxshOIcpcBasYslj5YQYIi4dmPhR6bIQdxtSAqk1
	 pcAkcGqt7Fns4xskfoGb4an3L99gqDDjAAnTuXEzMvC9dQUfiIEzknvwIKQX/SCbtdcUF
	 4UrNkUOTSAOLM6iYG7dsY2LPF9ft2IpqysJpNAHogKVEyygTfuLKZgf/uO4mBSBcF0NkD
	 sN2eWeXMFPxi7QJ96uw6w1MTRbZQNBRQvowXTykHnWDma9luJ/S7iLUEyDPneQc8CcaQv
	 zYqmI0iMhtLRLteppFLnbPXL4pRFQYpNGph5VhI1EdZlM9ajXd5QL8H+CUpW2uNhTbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989003;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
	b=jP4uxuvqOJXWbuCC3S5KaHAEtGqESJbsRcoA/sCtEjvG6i+VubuNY4+xcJJxHzunMdV+
	 7c24cgL+34tfFNQEyhV321hG25jxE4Omm7DWSuEAtMr3N2wYELMyRDhNTUNlA92o7Q0KL
	 UqofLfT0uFVbgTDyKB1CXewFBJfgolqIHa2OCo3LggoOBCutJinq0HfV/ElqelsaBnWsq
	 trRnXoFNBKXEzuhy7xdSzU31g58nH8D2dgsFdjMe/V0UxhGdx00pyy8d9PnQYZS9JPZY9
	 2Nc1/K5xjfAS1X9gekazG+iYQBX5QRLLNYn/zKDsnkfbQK3AnHpB2P14WfXgn3byACg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsEmTXv0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jALUJvUC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0778F606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0778F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SsEmTXv0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jALUJvUC
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V29h764101
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=SsEmTXv0vWkA11/A
	YWCmipZNB9/Xrnmzmq9H2O04cHvPsf3E+vQGdiWJEhEHsYBBs2phR2eT6DjA65d0
	8C8sO3ogZMwKiXUTuom0WdOdekB+VMxjIULmJz0FeaPU1UYjcsddvN08GRYlqnsc
	XV43Mpl1ED65oEndYU4JAvdYILLbpzNV/d0WWIqxnNaWTjdWZ5sbzV/pXYPbQAnO
	TxQKqZxun0kQRD9SpYIg3bHqwl5RdxRdebG4RxFveHjPpnvQv4CFuqCESimB/p3U
	xaguq6ls0bfydoJ1UejatBWAuNbLWgTbNo8P/65EatZsZHJRZMcfdNl9ISt/NfvR
	ftljAA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9xgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:03:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b1755b2f26so690753a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989002; x=1795593802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=jALUJvUCGK3jCi1Y7GKyWzxM81TVDDGs3rjJiw6kVBvSiHWU/1TsAVz8TW1EvQMfoc
         Ugn88rNxRnoKdttHQoTRb563GNNg5feqgVf2v/CT9HF4z6tS1xzeA9bJ0BSBVtlDblOe
         ExZdrEGSH5UB3rhRQtcy4W89qVd1SnK9FzYEqd+4fkUyFrJNWQFeTicAftP4G1lVH9PG
         gh+zQFf85x5tboOzSFDd8ZrW8W5v12Z2j7U2rUg2JDDmhMLdvb3wwOE60TaukJ/dmVU0
         Md/b2VrE/f5p9atiwsBsa9oDU2TNk0z301HMSY6xmw+Vr7dfi6e+gCuq07jY4bSfANmh
         DrOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989002; x=1795593802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=WEcDIVemgRDSkosTmoN9ttqeDLfkJdCr+i0umnvyuYnBq9i5uUb7uv8XYVzQehEaL1
         4cNyBZ0MkV+Ci9lJ1mb6muej+jeFshyxowQe58gSiZ39DU7D18TTin72+x55Ut4LHpuG
         xdAqMCMtdR7nCO/nF9SfnJwboUWKm2Rjrkj5ga9gf8G/uIDx4F4BEK4s9ckzIvV2DuDj
         oIHpCyjEjJA2cNNQPo9wKKf7YSdlLyTfeLdNrO7Is0jxOxkD/v3T95SQdowGBM3vkRtQ
         qfN5yRMjMpwF9+G4BPkvtl7nq0n+VIEzWcdkTM1jSDjCleAEs7Rkojrg9DNeGI6HTPYY
         QQAQ==
X-Forwarded-Encrypted: i=1; AL+hErHJQizZoveQJ7T+2/uj/d4v++6mNbh7HlX2T2aZl4jZjM+ObBfVZ7j9LQb3JvP8xLA1Tpbysc0njZ1cIX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q5XDF2xOZTxDpjAEQKEpKR/vRGMJGn4hy3DWwR6jPbsz9Sr2h
	UI1A1/ELu2VO+Sf9fSlCMn52vv2vlHL2eqT1R/uHesSD8cbBaO5wDBEDvpmWT0XOw9JaiONkU0k
	1sL1MMiTpKj2j7pahnywKNLD5nK+nICqI879NIv9CgLw5YITHb80N6r8o0+TS1zkXo/Q=
X-Gm-Gg: AZFdTZc4zp6otLhTmDIHlxYK6XTTzizB57XbCXikR0caDTTXBKUraIe60DcHpOjVfZS
	aery7hgPRhRimU+UftLocpPwx/uxnl9xNc8Gk3xeKpcKgsTgvCZNm8EThgBEJIfKCA722AlHwUt
	mR0ErqiCddd9bKhwskSeTQgnZWB6VJ5gIZb3Gyu9qbK+guQJnxBHh0w43ZjGWRKj7WBdHPJ/+Rj
	rpQNvcVPeMeRQ7SdQjmGhmRhfvnzPugOaxvYAAh3bS6ALlBEio3KDjRsK2EKFlQh9AUpe2O1ehR
	f0zm0aWXlUfG7V/5/IoBDhQhVrhpGhk87i3LfUxe4Xg6N0N7c0Y5/QnqRdRV0kfl94w3V+qBq2k
	mlK8sKzdTu1vRqxY+wnUs+aHR3UTJTHZxcDAyWdaY39HWaXx09fk04KymaqCYooE9V9ZlJ4hjJb
	Ygf2UzjBHrtw5pA2oCQ4HsK6TCQgRjzgDOAsJO
X-Received: by 2002:a17:90b:4a04:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3b3d07598damr1763248a91.20.1794989001599;
        Wed, 18 Nov 2026 00:03:21 -0800 (PST)
X-Received: by 2002:a17:90b:4a04:b0:3ab:e588:c275 with SMTP id 98e67ed59e1d1-3b3d07598damr1763208a91.20.1794989001103;
        Wed, 18 Nov 2026 00:03:21 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6adasm3004072a91.9.2026.11.18.00.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:03:20 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 16:02:27 +0800
Subject: [PATCH v23 6/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
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
Message-Id: <20261118-enable-byte-cntr-for-ctcu-v23-6-67fd9db6bc0e@oss.qualcomm.com>
References: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
In-Reply-To: <20261118-enable-byte-cntr-for-ctcu-v23-0-67fd9db6bc0e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794988961; l=1754;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=icbknvjFK2vf4oKtSEHbsU4cH2Y3pwIOC3H2EHr7Svw=;
 b=0uAuvsb5ehgZ9RURv9BLhMCPJgyhvvKonYmDULG7SkPd4DrZLgbXUrsbMqHtUbbHfKuhil9kp
 819ZRtxxx5ODCvOgG+GvhrxxzOjsPYA3wxE5vyI2KaDMvD3lM4Bx3x8
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: Bl1-4VT232W_X4WLBBD7M0OTMbEE61PH
X-Proofpoint-ORIG-GUID: Bl1-4VT232W_X4WLBBD7M0OTMbEE61PH
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd5bca cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX8z3cgyNCHxMO
 f/Sd5EGrEZZhJzFRX9uzywQoFyE25gF+fNodzo0t/6m0g0sxpvByxeDV/X07yKJ44ArKUMGr1Sw
 CucMvKUyg+jAVL1UVaLN+CEFqT1Z1tE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMSBTYWx0ZWRfX48rTMLn2ofQ9
 l0/95u6L4hm1uV35hRKxl/kozhfAEWrNQ8ES517aDHTiavArLVEN4TIYI0EV2xQ475lN2YjMQ9m
 j84cNWIQlgfQWEasH2FqHedmxCg7c9WRJotwAXDDZkjMFSF9s6tkMB5Ks7awSniBudMfLjY6x0/
 I/LsE3SHO7+4wAiTpUoEnrdlFBlD9J2GbUbiOjBfsfkle8wBUo+VzSXikgZqVJ0YmHGcn/vTA6A
 k5NOIfSe0HhlpPGmoYo+3CRgQJBRnEo32PGOseQGDajT1UycXxoI5ijlB6ozs7BmwDIZWH9msX0
 wMMlVm9qRaSpvMYEOLSLX2eYN77fMkZm+YFSaSWAyRtQ7w9AmGfVNzIXNLhK7IguNLcXNnEtmpn
 Ki1TTxj5Q4y+cZEIipm8PooHevMbkrn80KsPG+hfX8dH7czKv+lGsoVZW6g8W0c02W+BBiryD1Z
 gnW+zSAArAz+M03nZ0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180031

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..decb404e2ab1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -49,6 +49,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -70,6 +75,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -77,6 +84,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1

