Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088642;
	b=o8vJeHupp2KoZlJdqebASUYgopZL2PhH2K3ULTB9S9AE44stwHQYWWY66GRtSEycgeVK
	 4HepmrPgH/8cr5GnTbikzTiuNsrIspkTKw4hOY/xYuYAX8g3P5IaKCFMaOvrV8Ampb/TF
	 jC35o/yPBSHw1Ke1PA92eW7NskTIJDuQcFYf/M2baDsluQUD/+jwUS6yoZ5VHfBmXX4mk
	 SaBF0FdQkzq9Z32uLxFhTG1ZhJSgGrI1i4nfFN5jgrO7DzAFn5ht7YDWNa4faH6jwXuzm
	 f6Pg96iZbEZdc2Ltp9RSRmNUZvEw0U3y2hwTghC7ONC9lmOe5s2OokOoYPLum7dIpLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088642;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=;
	b=FdX/wIqpUEq6MqK4kHtWpfxrO18Co5qwda7P2GdZBew2Untbchqy1gUuLTMpTTS1VuIZ
	 e+yL/njhGlBsQbUGDxpEOmZRmdU5wzYLp00Kpi1p8YYfoTtiR7VuxgerNbKIQk6teycQR
	 ke/p3cWwf0xzCwo4foOwDmcyDUQbdZoFL3VJx2nKODBcp1V58qIiNPaZZo9qZBy3omO4N
	 X6DvmJO+z+VQNYRyaR20KH0qTftRS3DvzS2/NDS+PAwGG927PzqWL5cnutORwKFFn2jZ/
	 Sqt7+xVy+O+NsG1rcWL3Vgj5JuFWLdLkYaHEaXtZKZ0PIKI82+WQ66adC4pS0jqunJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BLAPjKVi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YYJoEETo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B15606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00B15606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BLAPjKVi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YYJoEETo
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAuevr869560
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=; b=BLAPjKViK9ARxWGE
	nYKV+I65HDCkLdbHDkJYTK1Ect21+6ArIIRWeZYJrlK1WLGHQXmMsrd8UELKolcT
	o078icUdSUopZ3zUz1icbGOK3oFEYHeNq5apGy06SO7VOcSKb9f+cqRvu+XbhMWN
	N2KLQfMQ5x6B5V1gA3hYrHr8pXa78n6rvnhAELI5hs16bQo26NTc7FtgJ6DHIuRx
	/Rj3VujZmU+zZ8ux2YlkW+icBSwEaL9rfKQokhmtTPATSmabjzvwCI8SBjsoE4AI
	pGij/c8O+LtYHsIFayI3yl+3CS16wOo+36AgvxVQG+e73deZJg56SXCxxmOX/efI
	kXD1xw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpnmb83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:44:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a079256596so1764713b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088641; x=1795693441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=;
        b=YYJoEETopJAt3i9xcNVPziUTsjtUIAYSdf4WBzQB06WtFI8CK0gnqt3bCXeWKHSQnW
         2PEHh+DKzw7IIQZCLLh5MpCLCCliV43QmBgaPW799NCxvYikJ2AbZHYfVP6mLNJmCnXv
         RoqRXARFaC6KOxy0n9u6xsbLvlfQ8/q8uKZoHIaqA1mSsGhFbXn1btB7QunPMrrcmi/O
         xij+aYoTfCeS+N9sGkHGq9q4Zc8wn01qdhEmWoi3KOVAO114kuMR+cdrTsXP8x30Vzt0
         7zp6WFK8OGZRmj9GgwVxIRZnTWMfGj7U6+U7BWPk6ghLjMvvc7IZQAJRwntUYcebAlMg
         3VQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088641; x=1795693441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=;
        b=O9xsmaWHwe02kfegadxg9z/PWJPSRNrUMTo5rIliP1lWiOb+am3PH5j/CzOPvFW7pH
         AhFFuvFjKI/KxFgeUlwQeof3io029FmmGrhfE+DQfZ6u6laPHW+i7FB8yeMyC8rgy7OJ
         wKkWX6GYJmVZHZU/sqGj2ZtOcwh/mbHh1vf1KY/+S+KHL+MWxa/7uPadDX1gvLUhY19Y
         VfVEPWUJ0L0x2RYhLksO8DgE5Dvz7AZeKKVZhI8dEbLuYrS1KTiaIjoROQd8y7IIXn1i
         lM60golk/49ej87ebdn+WaimVQDk/0r5c4iJYEknUxTtiP63ebB+YCNGNCPEntzSHZFJ
         2eLw==
X-Forwarded-Encrypted: i=1; AL+hErFl3oUhz8QKakky1JdDkmJ3cepbuea3Fr4GIAE5rwWK2MQqD2bu79V2SORd+b+be6Iplut01e1VcJAus4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CtmDxHo4jWaua/H7bwVnLOk0EFT2d2qAXbqIErSa9D5Lv1fah
	y/GWJkDj/ATvGrwku0zMF7G2eMG42bCliY28yZd5qS5VgJ5uNMemkD8IDxryrgBLmVJO8qNZxY3
	RFTxraDFdZ5rJZwGRhfbXTwOa7u8ocuIs7Y09F7xWHmivdvaEuldbU61Vey3sJ/O7LV9fQ5ful8
	o=
X-Gm-Gg: AYBFou04v7pgQdlQ5v4AydwKj/hP3d7pQ9j777u1V7RJ0eccrbUWw3K6bOnZw1NwbC9
	Uc9cP1VH5cf3bviQrUEQYHpqO6kgWiPhcgndsM0wmD9ApPtewgqX9Ki5mJUWOOipzVXauvgtrfm
	n5O1JqiZ5HvDu1audgxYembmjfuBEOJzBU8HXhjWw2cenuqZInNJIk19qYJYz+js6bemc0FxBcy
	Xfom7n2Asbb36YjMOT7wCKx8xNDBi263tZL74so6/enuVoqNihJ7+UceRCT9g4i6ImAkWC82YcR
	LiixUsH0KaEj3oC3azRUqvSq+ChESarLGqFx8FWmVtV8d7l2RKoqkFPLlgLjwYa2jCd2/BYQd+5
	5FRJNETnuOMQcP2W55g3KEPvAbsy/h2OK1+R+CzGsZSNtvZ2g/ntjORWq2hm7utPT
X-Received: by 2002:a05:6a20:4323:b0:3fb:5869:81f1 with SMTP id adf61e73a8af0-3fe978e927emr5875806637.26.1795088640399;
        Thu, 19 Nov 2026 03:44:00 -0800 (PST)
X-Received: by 2002:a05:6a20:4323:b0:3fb:5869:81f1 with SMTP id adf61e73a8af0-3fe978e927emr5875771637.26.1795088639718;
        Thu, 19 Nov 2026 03:43:59 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534854b1sm1613960a12.12.2026.11.19.03.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:43:59 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:13:44 +0530
Subject: [PATCH v6 1/5] dt-bindings: remoteproc: Move iommus constraint to
 SoC-specific bindings
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
Message-Id: <20261119-shikra-el2-v6-1-0e91a1467e79@oss.qualcomm.com>
References: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
In-Reply-To: <20261119-shikra-el2-v6-0-0e91a1467e79@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088627; l=13099;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=+o0b31Dm1RBTdPfDwLMNjJUq7df600C1I0aEPpq1j9s=;
 b=5SzsF9/EVNgXALOlWfOC/dRfEzVdmSqgnRLg0wBu8Vjfp5hYGOWIy+MPzxwn0XMYfChWKsxJs
 IM2sbTlbWoUCTM67WqNt+RL38ga6tSrGWs9cmrGAkxWLEtF4e4uj6IN
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: UsSvb_aCDJ42AJGzNPYXhvl6YTU-MFC-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX5jWGIUD8pxPl
 F1SR5vKWQDZZwfrbLHmcZ+6NMRae8hw1r2ZyxGJWEFJRgqnNigNiL7Y6J9bUn//Fx89ck84JpXd
 qVQqD1mfU2OahNdJJj3wBX1/0UYY5oZNuhxYUP7ZkOG3BmysaOemGKF02susaQr3vdb5j7I6Pik
 Sp/uDOlXe6rf5OL/mQii5/qL74hmjwKiLreK5+Q024jLBi4ekDW4EgUNCAjkcT4wgeBTzMhWrQc
 EFgIk0cXNjs/07Hz2nJQZ0cRvcTIXdJ2tH3QncKtbnqkZz4XIzRpzN+Cn4HdahhIWhzK73gyQ/M
 ugzzT1BfK+muN/j/CBgNPH6Yu901voVL9Fg7LaEATHVXD+RFFZVisAzQTrNG5CN3a7x6kZZzej+
 IjPvN2fsiKMDiPyVkfMpe6L8XkSeUL1G15S7XyXrdHvrbObuQA0s6NjIJ+UL1sux9kGn7tjs7Av
 y0WHbbecNkbwcV6BqJw==
X-Proofpoint-ORIG-GUID: UsSvb_aCDJ42AJGzNPYXhvl6YTU-MFC-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX2LJYm1JZAjci
 amHvnWmkbJdHTUN0iP6fXB0x3nwliQwOjat6fLEYzbljwh5DugzvMj7Bq6bnD32ipjo5d8bLqsY
 qqkovKT5pNvmAg1+40glTLm9+zBb7o4=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afee101 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Xh12SZzz1sePY-9oQmYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190046

qcom,pas-common.yaml limits iommus to a single entry for every PAS
remoteproc binding referencing it. This is too restrictive for SoCs
whose firmware uses multiple IOMMU streams, and a schema referencing
the common one cannot relax the inherited limit.

Drop iommus from qcom,pas-common.yaml. As this removes the property
from every binding referencing it, define it in the top-level
properties of each of them, with a description and the same
maxItems: 1 limit, so that SoCs needing a different limit can override
it in their own binding.

No functional change intended.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml         | 6 ++++++
 .../devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml    | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml    | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml     | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml   | 3 ---
 Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml   | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml  | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml   | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml    | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml   | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml   | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml   | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml   | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml   | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml   | 6 ++++++
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml   | 6 ++++++
 17 files changed, 96 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 6cac1f77993b..99c567da3e98 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -82,6 +82,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - memory-region
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
index e6c78d621d17..06aeb45fb2d7 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,kaanapali-soccp-pas.yaml
@@ -84,6 +84,12 @@ properties:
     minItems: 2
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
index b24e6f6eaf37..4a033ccdecbb 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml
@@ -76,6 +76,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
index e90d2953ba69..b1d84d8be4c6 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml
@@ -89,6 +89,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index f75cab6b4ed9..4662fe4cff62 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -32,9 +32,6 @@ properties:
     minItems: 5
     maxItems: 6
 
-  iommus:
-    maxItems: 1
-
   power-domains:
     minItems: 1
     maxItems: 3
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
index bf9bf1af9ff1..c8898a041fb3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,qcs404-pas.yaml
@@ -67,6 +67,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
index dda2d144b720..73d25efed820 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sa8775p-pas.yaml
@@ -82,6 +82,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
index b20780e5e26b..33c9ff6522ce 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7180-pas.yaml
@@ -76,6 +76,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
index 4bbe4a986c7c..6bff0ed118a3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc8280xp-pas.yaml
@@ -73,6 +73,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
index 8c16b01c53e4..83b9d7289e06 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sdx55-pas.yaml
@@ -79,6 +79,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
index 34a2f15e9361..74f83b7ce08d 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,shikra-pas.yaml
@@ -88,6 +88,12 @@ properties:
     items:
       - const: stop
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index 454ba82bd6f1..6ea56b497f89 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -79,6 +79,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
index 42e02c64347a..28e44a1dcc7e 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6350-pas.yaml
@@ -73,6 +73,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
index 274f87880e2e..710dae4589b4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6375-pas.yaml
@@ -69,6 +69,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
index 5a7c5f8c92d1..9fbf1b6aed76 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8150-pas.yaml
@@ -89,6 +89,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
index 72d0db5698c5..15da49130146 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml
@@ -83,6 +83,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 99e9aeeb4f62..a3131e6417f5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -115,6 +115,12 @@ properties:
     maxItems: 1
     description: The names of the state bits used for SMP2P output
 
+  iommus:
+    description:
+      IOMMU specifiers of the streams used by the remote processor
+      firmware for its memory accesses.
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.34.1

