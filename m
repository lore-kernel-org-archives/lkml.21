Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795145307;
	b=RV/KUu7HMnuRRduobGRZf0ugK2Bm+L25R1Le2u239HjjL12m74eLYGD80oS85Cm1tgXX
	 T6oGXN4mkxAX23RF0PaCDNGGytbiMrNLDzXRbxB0iFl7eH0/9dd0RKjneHcnOMAvSqP9K
	 ODzzCuR1pBUpTuEw1ENRc05Pg3HAGTn7i4y/p4jSyGe1AVMlCVo+vsoIVu11lCtgQxBMz
	 G6wRFGkxkiqEB+x0kDP07eRDfnPlqjqIkJnif0M1P5RPgx9osuVywjWZArVFYEiXEzzja
	 R0jXdspg6CzcBxP9dIEJOz+DJ3+8JYoU3Rnn1WQ6MLRl8F08W18EPqeNDEhO7oR2Dvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795145307;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
	b=A5OWF8E0TphuOpZU8rP7a/p7uX3QzqJgSdJP0mogjHP9Ph02clY4U09WoE/OS8EfB5Ab
	 bZI5ehaB0JnrZkb8H8xUbKzbOjZymeWXvIT2GKjDxATod2ryrdql6TMPMa6zjMiuVC0Os
	 Xyq7aUJ3D+oLTDqpm2393h44mlO9loxd059vezq99WMYzBDrQOtnxev3DlHUsCp5A6Jqa
	 A/jC+DL7eYhfjVGcXNcp/64Fx/YPV+Jf7gb0hLuuYMeSq6TdJXLe2PSXsJGwN6EqHfXNt
	 EB0uyHiIP4U5D+OFB5OCv8sV0/K0RL0wvUe70iZ9X5VM/3xrmd2zJphmRdHttUxbdIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KX/6VN4e";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAkUkouq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5820F606A335
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5820F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KX/6VN4e;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAkUkouq
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK2UdWH4160992
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=; b=KX/6VN4e3XhOxj1t
	6Exq2PHkGZ8+mGH5fZ8ShJNY6GeoDY+aDNcg5WEpZ+aP2/p+d2rU/nG0W/j3HP+k
	VPDX96mFhqiGiAXx0IkaoMIfcXDt8wNPuBiLbQN4TXc5mkg7D1jEZ7J9pUJsFQjX
	1zYpOfO/PaMbQ/zKIdUmWMLQo8mdMFj/z/kw292lMSUkZy14xRsPV0uo0nYFuSsi
	/NpyRC3CMfe/UbosFE27RrTq+hlNSXiNb7mitIszSUscrbJzPMugPtLlzqWvTfSu
	kkTcigOgiW/SLtnA3y0pyNRCpKxVYACD8EztE43ltbUyZVOl7e7etCrcTH1bakQZ
	WpBGBA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyhkpx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:28:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cddc4bde4adso286385a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795145305; x=1795750105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=cAkUkouqavsIJzvAoXAGiM+Y2yeJcnTZ/aRpCxLfEz6U1NRNrezRcttgzhgKDzPGZ5
         EeInTPqlLaKqmh5QXY2qaSEmIZICUGPkztVWeO05O/C78Cq4ni6RqkUpv3wSk5bFKBnV
         d4X6CxSrxXYMbJV6mPnQECkfKagkVe2NHKZXOkZppHktN9MDST4t1cIVqLDYFKr5MiwZ
         Mpjl4tR3rLLjz8+dRNggBEnxrNW3qEVJEi5+nTOkYez8nEa5v0Ft8Myuxv/pbYoWVcH3
         f0U/16JSuaqOhODK3yWJDF+nBBJ4chdPSdSK71THkg91eGUpyhaqjKFqbogl8t2PpcXa
         UF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795145305; x=1795750105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBpilLduGmKWuZIcWoFGh3oRU6G+tnaV5vhyAjtxcwA=;
        b=upSp9Uf8Pc6uFlGSnUit4sP5Pbfj5ivBjG9nCLnoZ1lrPRvi0AfSv0eDg5P2/QkfFQ
         jFoVUuIWXDSkWyxZUge1weIpoGUkq/3zrSPAZcOF+MOKNmi0fKaE4LdwMWtKcokClpyC
         Lrvi7upyD1rQBxSy5ckhzP+Csfcx7pZX2oMuCgh99IPVi5+DwC1dNRphslzYbpUPjkzQ
         gzlHrPnHf8rNI58ty2jeKMkSaCxk3JEtT5k8KzEHr5DtdSFTeFMQcn7q49QwEE/XsywC
         B27Y0G18kWnXg9/9SXvM1Zpf5SdfAPwK9qedxr1XbS2lXldN+fxr5ULQXjA0Wa+TpvYp
         4xBQ==
X-Forwarded-Encrypted: i=1; AL+hErEi0bkoashnwwasUJrzxho7/esPF7CBYk399O1qywb47S79xQ1trHQtbuKg49CAxobgTaYbPaETUPwoNSo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SxlGsGh9L/nHww43G2za2TthWskPWt7LV+OYC3eBPe5hzI0fc
	mT1fVw/Df2dPNvfwHRKeZBp57gSdr18h6eBncnKJw0fZ/Ih+l9XueZHiUrmzEoxQQo/FNyl+eFr
	SWi2iRQjU56uGbfoXDTX5TEZ3EF1QCLGTsoFj5UQeEt85X7Nttq0mljOwYenDR7mqrOs=
X-Gm-Gg: AZFdTZePjEdZVtWBwxt8JfghOGROYwdWnmbkjiI6g2rBUmAbHIY2McTTivpN6N9c37z
	/CIiOu8So9CLi+3vlIwwKTLXUFFkl1VIyAsQPgCldr/X4nI4+TtNMKlM8QeD8GLITznuwH+EaL+
	LwTY7BkQwjQS2aI1dvuEsw/gUAcBG7bU+9xWJUz2HGJX4XuRKKYkF3fsTK8aDQJj4nismvLptaH
	XUfH1Dt6xGBOCx+H5PKvwsidB3zZ1CqdbgKERsamNIS8fMen+8oRzDb1wT3jis3Ku4Ajxq59B0O
	j5MqSyOzJChzJPVysi7l8Tx239/omAXFczmRWuMlV0SPyKqjQmnF7CPXr6Q8/aw64koiJrTy5NN
	Mc2qp1lhOkISyqEHzUxhAZShAgdQnj6jX8ZgwSWuvkdIXmNjge86GG4ftp4KE1w9e6gdh2n5xH6
	3j/EjWaxvgPJJotaSAb6grKI4xjHcgVxEWBBE=
X-Received: by 2002:a17:90b:2701:b0:3b4:1bf1:9873 with SMTP id 98e67ed59e1d1-3b41c8dd1b8mr1394901a91.19.1795145305138;
        Thu, 19 Nov 2026 19:28:25 -0800 (PST)
X-Received: by 2002:a17:90b:2701:b0:3b4:1bf1:9873 with SMTP id 98e67ed59e1d1-3b41c8dd1b8mr1394878a91.19.1795145304657;
        Thu, 19 Nov 2026 19:28:24 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578d771sm5278297a91.1.2026.11.19.19.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:28:24 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 11:27:25 +0800
Subject: [PATCH v24 6/8] dt-bindings: arm: add an interrupt property for
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
Message-Id: <20261120-enable-byte-cntr-for-ctcu-v24-6-2d792c6b4819@oss.qualcomm.com>
References: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
In-Reply-To: <20261120-enable-byte-cntr-for-ctcu-v24-0-2d792c6b4819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795145263; l=1754;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=icbknvjFK2vf4oKtSEHbsU4cH2Y3pwIOC3H2EHr7Svw=;
 b=R7aEuV4YZMkjdPvmUa9VoVKl7860e56ZDBGW7Tb8Eh2NeYdpDO9Vcv99ysIIYQzMJRHR/Bfft
 ovKS5/UvrrECKcu0MVYi0aYu3KSV9DDtSTIc7b96Yz+Pp6AXsL37ssK
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfXxnfFWdyhyeh1
 BxoNkdJ1k9WheYBIPaIcnPM5HUugZXSMz2VQSJqz3Qn8wq8mYsCiyFTYNM+Y4QSOy29NXgBT/r7
 UwUUli6jxTkLVj6yREzYQRn7gfyfOpo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAxMyBTYWx0ZWRfXzDXgANBBJKRL
 YvWpVifBK6BRnS2WEEXcYFfTXOZS1EN3r7ieUJnf4x8RkK1WgTjba3RmaQ4yxoHrtzYoQoJzDo2
 hrXoZ2FNXgUKxnqNNpN5VblrPHGggpJ8FQsl0LnUxCb8L0BMOohsv0w9R744aAIoVo7x2/54CL0
 C3xqR549qdIsVJBBkKaDMVBbr2Ckvett83hpp1jQ808jWBqU9yv00aIC0hWRP4s+iGiO6Lksegi
 Faz8OrOFWMA6saqX1bWFkfet85YHkC2lzKUUb2a5wumgcZiTPOLp5iZ61t/mhMpqM8dUAMGvYwK
 nQSuSSLZ3W8YC0tQh7euxAKId/HoM4Khq/+nyOo4auPrJM8SQjPZATU/+acySRDTkFjYeCvZaPC
 7lpHKhuV4TS+cIdJPr0y8xcb/duTZZ9A2Pe/r6/7cJoj26SbCKbZoEUzZxy/1thgns+8XkJ6yx5
 s1o7QYDhNrkDJ1oHvhg==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6affbe5a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: MCDK-FRa3aKyDIG9j1Jh3nmQ7o9bmdSF
X-Proofpoint-GUID: MCDK-FRa3aKyDIG9j1Jh3nmQ7o9bmdSF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200013

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

