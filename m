Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180583;
	b=Nl3cXmnMzgKgr3x36TOhj/Qin//vsbGGorK1YS1Wt9hqpxUihVqRZAtB2Zvg6/N1wBtV
	 wVqYNGZqN2NU1ALhZZaJ72g4QRcSe1WYeEddu5Ndhkh7waid1uWGEv1M0JjaXHf/Kai5w
	 p5x4A2NV87NUv+aiL44ORDlf/akgOWQxdvyVD65ACRkXgBcYk2RpmacVni2IedU6mKx8F
	 vzhpt3y8DUzpN1SKBPV6zGM0Wigi6aTiIoN2bXMNMleRCfzq3tDAJaCbda0YJ3oOQQe/Q
	 UQCWgyvYEUGSVvhURXi9wvtkIE6V+UqcaTv4MsR8RG5JN8Qvwjx2whuGCQFTRAPOOFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180583;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=;
	b=xdpIfGJeQWwK3Knh1emgf7ur62FkTKRCSzZ9fnS1ByboFhrcUc3jUMzWO7JYb+U3OQ0R
	 gf+e+WwwfuHE6v72Bh39mzgGOGqoYkun1chCr3ixfqRT17YSYWVpSIZRckwHlX/RnJeDi
	 I2FWZGD7OxVWPX+vvG7NZSYusX/NfWIJUuWa7himbZu56x36zdowK6uzPilamHSMdVNWm
	 GS4eBGr+i+Okm4xqwrXDRQtoxtRpiLQ09ML7uiPpUPeQ1ik30TqZWyGWaol5HuoohQuue
	 mfS7LyfBXZP7C8Ue56QMjG1Hz9Aud9t9ttnsxdvuG6821AJwEic/obEuyh2o1a0Iljg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FjSIE/wt";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H1AQLLl4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69548606A339
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69548606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FjSIE/wt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H1AQLLl4
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkfC43107607
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=; b=FjSIE/wtVB669Ywu
	Yrv5b0AhR6HMp8KwbhAFYqwPJrmnMkE6tbqGtWQGSfNY69n4quB3efG3+GuzhS7H
	CWccCN2osXQ9hupg59yFW4huFULjYA193VPalAeHm8XhR+rFk7VU+w6TKhPTEh9W
	O0Ito/Y87qjhx6oRzRuq2/mDV8y5cnbOXWmLWEpPF09fV12ViHCJVup84yF8npkm
	EgAEXvtxOEq5DaaK3N91C+R3jJEhiXOkbF3YCgIfbafDaSZiaS7hrJ9vA5Y0Ej69
	REzIDZy8ykZYJa4nY/aTInQlEudAJkWNaNBitmuUPhmJOUqKGR+ip/9e+didKtIM
	ED+1Uw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3uhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:16:21 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a71dd190b0so2633887c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180580; x=1795785380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=;
        b=H1AQLLl489VBCtquRGYB4brHv8i/9x5Ey0v4JdxyFJS6tQHjX6I0lq2NNzo6CT0oFz
         GrldyW/UB0gtW4MgvJw3lTrScx6CPG6OtKSrTfqY+7tydKJTVz5EcB9rhjJpTqSELsIu
         VmeJQ5NgP3++3c4/bZnvkJB9BpUEgI460vehdnTMRJvFRG+B9wQ++1MkdIdbqsiBJj+x
         5RUZ8feRWxQ8qriqryGZFpX832cw2VZCjSTonDkN4CFk6VJaXt+ZU1qzra5hti/Low4G
         oEoSvC2ZIUOTFPsyCum2b2TtNwgtfyIeL5Hu3bpaCRoHyioMjBRNEEOdIiIuDK15uABx
         Pa8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180580; x=1795785380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=;
        b=gJmNTwJFUHN+SRs6UObyayPpV8ue6bWyRsTIP58l0NBHX9DP+xDM9YOVAmihxBlGWD
         4BrDPM5ROOaJm1hzjGWSjaAGeiHk6T5I0IRPXjzdZCp5F4BHcJYtdPYHeD9EGfCcwSnC
         ZT2pq1JZVfi+InleVP0rKi7ssFTiyjTDrk0eLlvWBwjSOrHck/S2dR/G+reuk7m+VX3s
         6LH4sgvavXj9lfSi7VN9KiKSNyn03d4Udy8C/U56AuxTbExxBcXzWkTiiP9fQumAfgXX
         3iRHuh/Zig2/bznwzridWqp79AkjvBGONkTIhVigU7MofHO9oqKtzwbq38wlEmrVIsij
         kv0A==
X-Forwarded-Encrypted: i=1; AL+hErH8ptQbRT5IUOr/bWg8NH18RhxeHpT4kfVN0itahC69zowf7xYqRq7MRE0tA0i+Vb0lg8q+LSAsCs4v8VI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fBqcSLNubhPHbs2TzDdiuiaAI9mP3GoAFpvSdSbNv4EtlRUEw
	L2IIebK2z00oBNJz1iYhDCJxXhqE7Xs1tu2ogRroY8tfQ71Nc01XBa5c8KuUy6XddPKCrxd00SH
	1Tmxpb9IiCNBSzv5RX+Umf3QOzOQWZxPa0PcHUoUxCXe6FOgr/481qe9DusvOowpsEl8=
X-Gm-Gg: AYBFou2cMnmSiXzZMk6u0xn80a0L4ZY7nkP1eQz3mHsfE+M+1ZnVx7tmCY8CwckaihZ
	XlZwtyLO1DlM0LrM/FR+ZbX4f/wSwOES1A43cghw4t8wYQv79yqAq+qWXr8Nv78IuM2/MyekzMZ
	blGKXhtejyOft0lbD1JhpthsZutONF/etfwX7xFj7jcBhU6SCFrJUZdfu5g/c+ISz7MGfcuXsfh
	zHT+6CrMPT1nx2/aTjE90SCiXB+BwdKoBiRmBtUG7A11qf1bYRTYEE7jkjEpAkjXl/0w0TxmbH2
	fDrmfm3nhMw2Nq/wScUpyQCKRLfD2YIeQfgl2T+P6RVkYR/59zUvn19WcF3X62PG6fmJiVHRpYu
	4ahQnOflJe7MeIDFzevAXVIIWGwXWrlNnt2ceps+JCl+LWzB/BiwNS3rxTnhExIbd
X-Received: by 2002:a05:7022:b908:b0:1b5:25e:9582 with SMTP id a92af1059eb24-1b55691dbe2mr2596734c88.37.1795180579656;
        Fri, 20 Nov 2026 05:16:19 -0800 (PST)
X-Received: by 2002:a05:7022:b908:b0:1b5:25e:9582 with SMTP id a92af1059eb24-1b55691dbe2mr2596706c88.37.1795180579034;
        Fri, 20 Nov 2026 05:16:19 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm10494874c88.14.2026.11.20.05.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:16:18 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:46:03 +0530
Subject: [PATCH v7 1/5] dt-bindings: remoteproc: Move iommus constraint to
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
Message-Id: <20261120-shikra-el2-v7-1-b19595f24eb1@oss.qualcomm.com>
References: <20261120-shikra-el2-v7-0-b19595f24eb1@oss.qualcomm.com>
In-Reply-To: <20261120-shikra-el2-v7-0-b19595f24eb1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180567; l=13099;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=+o0b31Dm1RBTdPfDwLMNjJUq7df600C1I0aEPpq1j9s=;
 b=pJX/OF2V+Z+7KkI5hMnrh2tKRSII1jY0r1PflRpX7g6FaE7XVquaIj14pI8JBOlJghE4mollX
 QJ4wGKD54leCWPvSLUPA2OBS128eVfwipIJeZxiirQjYpFFDu/rhyZs
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MiBTYWx0ZWRfX9D9711ppncqP
 AfoMBWD8BtAny5LhHJEXh9RgugfN5mM8GHNtw/RxbHFzbkHfzB4AdRAB5bzVeO1pOO6qc2K3ye8
 JeBVoZA9rdqCVH3gXcJSIed6BxkGZqdS+pN3s/XuCxtI/KNGNGd0MRLb8LseLa/aOIfYb7xAS8N
 EObsxLZFTXgaIERtktb9s/Gl1N3pzfm/iXt3C6XBn1prUE7gJ591WutbyCjFw5v2FpAlnl8sqYi
 qNcRLKxIzCeIhQsDoEqmXzvlwbL0gxXvxuYBNZfHq0wizpW0jJXQqrbOQlGJ2JdM0Y9cYd6b/zG
 YYSehVM39fnpsaNhjtrPWCr4mwrTWdFrAxYVMV7S9QHnE0r+TOT7/aqVkIkUQWT6STC+NsBfjuw
 OcueYuTCRe3smU4vSsJSfL/O64ykAFujWqqHhGJlMxwLLN3HkrB+3CpuRVoHcH+MndospUNW29F
 gC2Rhacjaat2eFIGA4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MiBTYWx0ZWRfX1ezJzH78xTn6
 VhVrBL6LgNdxLPpTzyDgcblC7Fn2wqNDoE6/whnV0o1xCYsSrITOG9K2m+47LmQJ4ULpJDUHRjT
 svXw1tq4GX1O5/e/BjpRhI/927mlxSo=
X-Proofpoint-ORIG-GUID: EVzjkP8St8N_FfaTPeVeyCwTba7LIYKz
X-Proofpoint-GUID: EVzjkP8St8N_FfaTPeVeyCwTba7LIYKz
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b004825 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Xh12SZzz1sePY-9oQmYA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200052

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

