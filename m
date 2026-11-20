Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180894;
	b=nXVroAN/W5Bd5jlu4bnTbL9h5gZNDpPMhV6s4JbqiYQZxyWSaTtMkD5v7eGfmkxChIuP
	 ebNoltAQsTMd6hgTWa9T37S8LmJliz0JBu/7uxrQqgMmGYXHOzNSHEDDO8RRU6LkBiwWS
	 eoQc7FASABM8CW8tgO7X8Qi602tAdP6xEUUzycZ8+zaTOshB9g70p16f/d77lI6/I40pI
	 WGv8jpKb97S0ucwfXkRvBhUW3PDRq2f6gzKBf6or4TvqKsIMZJEa6Qakqa2eaYJF9j+ue
	 wIddG0h2mG17M+xK/szlJ4876DfCOCw3hcznsL2NtecKTXByila2pBOIuHpuZ+aiPCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180894;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=;
	b=Rk8XDjtT4Bnes3aBxdFXJvoF25uGXdt0bNMmnk52VnMQioq7hamObHTOONqi9PelbwCN
	 Rle7hhmANG7NjDxPBGJShaL4gbuTIMtjW4UuaHtiHt5ECFWq64N4DK396D1FHwCgbpVfX
	 lFHDVipE2y/ojGm8enQ0b8DX7y0EtzZTB2aHDSU7Xjy3AQSSQagnXhjU/9NGmfW8WX5iq
	 LbUQWE0befpVTiuZCKv1pEgl5MtjnWui2SwYpzqG5hjukA8ZNSxMk4txiEcaPcop9TCNm
	 LDd5iO5HRICzabvvI/iB9INkRZBDECyDp10tsadNCZ3chMS5HtJrMd4wqBYiRmIlODQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NtbiPUP6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ge1WujHI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E673B606A330
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E673B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NtbiPUP6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ge1WujHI
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk2jx2433198
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:21:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=; b=NtbiPUP6IOYwB6x9
	VM4bk/Ih0Rv8DR2WCuEE6cYxa8TBAFks4wZBEeECNsqHzIeIgVRjkvnjDlPh9twJ
	x9HTYCMGtvvgyFutnNWraNb8Y5Bbf325dzm2BGEYlXMkQ0WQNG8AMpnu+2zcKyEM
	2rn10rAaMcpVw9CRdsxrZbSssS2qlZfMfTkeJgC6ieYX52k9iV/q5oVWsJazWBP0
	BwbXxSrc3z6TEGLQSGzHBs9zwQWs/Zj5pEvg+6ogMhaW6ikLUlLatGIhMNUWDy3J
	/1/uoE8ygOWXSeUP8tnRqFFMIVk3D21DFoOJO40KAXK8Z9m+zDFXOyH4ZXHmwR6A
	VIhKWA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj9yee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:21:33 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so79824c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795180892; x=1795785692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=;
        b=Ge1WujHIFXqQAQu3ZEx7+zhiPguAPHtpXRAMnFGyYRQStCAYV3psvO/jNVQftmox74
         hHpJQSJoDYIb/uhCvuKBeOPgOddzgTFO5iX2G+YwA/Lf8ZuPVJ3VbNjWJ56qw6XsUTJO
         kuNCCF5jXMIOvaetSDv8RdMjVpSuis2jOvFrEfI+KDvutqMMWkpf138MhgUfILqGZDCF
         BP+iLVTHfVZGncaJLGsFXkD4j/l7TRNl7u1C6Lgbn2FqfSCMqQyL0QcYmpu+pLDwwK+z
         0PuoGw9kA6J7hBz5GONnk6CQ6kVQXhX7rBzszE5E5kmx53FXYNCWNpeELBDxqvQ/KNZE
         Lj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180892; x=1795785692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thTaPBQucKRchZ9oiq8PpDYPNggYExvle3GYvZIp3lM=;
        b=nOfHskOovJ4dwoswaMdXnydofxadj3V86mK1LEK3CfpDD0mgOu3zUSuUtRDx9xDBkB
         cdTi681HIo1bTswKirAB/qyl5CnJMb+oKQIcOJ6UsNnW0dAsuFbbap2OzNVR/C9gNWcU
         LzAQ2bgjUZSB3t/CDCGuA2rRP2usALV6D0ZTfBR/x2Ir+7QXxrV2Eg+jHKaeIfpvtZtr
         WPPjuta6XOwfnpgfJttXauGW4j48RbADSwoy7McR/U/Z1X3/nBoCVg2lFqANG0+eWGO6
         nNmAzOi1+T/iG+OLQth29PfM5lY/AO12fIk4gT1u5levLHfkPErupaOde7X8PyAKIFYm
         Qatw==
X-Forwarded-Encrypted: i=1; AL+hErEuYrwgk+9DJALTUCYzLMBUG0jynT3kBaW3sanDGJ4Z9jfkdhT6FLXZRnkouF8oBnZoZzotOkXP0AVHW+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GSnYANeAfvo4reJYc0bc6QZJH0QF2rtjVCHjpx8trnNef2j/o
	N4H3M1x/M2FHeLxyHj6B2N4D/mnMksnilr8Otqj2fRsnzg5zx1zTjCnVYLXu9SUlQsGiuHGSeMV
	9QBRkdcZU4uyiiv1QgKSAqIyNdUMCJH1xp7L15oSMxC3IRyKqvLzEIc3bEaFGqalztoM=
X-Gm-Gg: AYBFou1lTPFXYthPweH/8a8IDRiDqrJkYYjtueAryI/jASjij5GjV9+GfjQmchHgOo3
	svRoT8Zi/PFGxhC9yLp6ya3E9aLIPaFGOmggTkFPwJHdot75Di98+d4V3uNSPugZyyaD0+pJfOm
	Pi/bP+MX1SUBqCePq3GiWX1WE9UTKHDsQBQKu7IhJGiLpl4t1Cpty3w/yrNH+nG2pfiavyrTGxX
	Ev9EwatI1g81/tKIPtB0WwhIQ4GekLIDgU+tF+ImdaWfXYB5+sv38njf5StDtEGvie8AiqgL9pB
	n70dud4jLVyqBPsF5fndCm/Ooqv8y1v1AJWpE9+DbceAsETAA7cCm5AnXZWJHcJ+A3LohsYNlAE
	1goOL0UfNq8IyFLIeOQD6AV3ibwS0/d8dqQjSl/N5uF/s6fkVSyEI37jVf7OWLHXh
X-Received: by 2002:a05:701a:815a:20b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1b556695bf9mr2705042c88.0.1795180892036;
        Fri, 20 Nov 2026 05:21:32 -0800 (PST)
X-Received: by 2002:a05:701a:815a:20b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1b556695bf9mr2705000c88.0.1795180891219;
        Fri, 20 Nov 2026 05:21:31 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm6929628c88.10.2026.11.20.05.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:21:30 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 18:50:49 +0530
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
Message-Id: <20261120-shikra-el2-v7-1-9d9000eb50d4@oss.qualcomm.com>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
In-Reply-To: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795180879; l=13099;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=+o0b31Dm1RBTdPfDwLMNjJUq7df600C1I0aEPpq1j9s=;
 b=9myfbHZmPdy/YZigoqeCtZSX+dGbcVCP8AmCuxuM41OkOP2KPFGlNPcIpxWvdKfjn6fEa4YjU
 FR8G7NoT9q7CITaDrZ5BVrHzGqjighsLKoDrIHztaamJeLUCpJczg8m
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b00495d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Xh12SZzz1sePY-9oQmYA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX9enmdx+mYd2e
 Y8XDzYfTqGUUd1nml20vOPOKxpI7M97Wl/r3fMX3pE9O0EJqZK4h9XT2DCwAx9MrURFNDSbDndH
 r/9GDck3Hqq4+f8zVYO/l4kw1hK90H8=
X-Proofpoint-ORIG-GUID: 7sDs7fr-z8spAwPAJpTvf4ZThTR6qw4F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MyBTYWx0ZWRfX+onnNVpHLmoo
 7StKbYThJ3GmNDF1bzdfguTOEyrdBTBEqzLh0GvdmZugfyPMDLFTTwwmkfuVHqqyxV6gsU6vYen
 yqeE4syDAoNpl9QvzqrISXdCstpih0C+5pOvDDW2JaCrOCLKnz4T0C+cvEZO8qQWt6DN7+p9AuU
 fwAae1sOLwCzumI9jc0W3JnWOK3bHjjKDzwrmboBXTGo74Xr7CtQP5zo+sSsJZscu/c+2FGwFJ/
 CyxnkOerjdkV/hA9z7l/HqQ46DpDKLTVWpps5tZADD86vKKN+XZi9f5bPvhqKIaAm4f4iKtERs/
 lwfBpEx1FvSWaEKkEX3+2UuTCL4/TVt2ahSdGjEKdUDLI3ArOVrIJVR5IgstQvSjast8ek1WN5E
 Ue/CJTog8lMIkW/2B7mRnxll+zIOObxR4xpK0/ruIBBbfV+tbBTtO4SMBErE64HCW4E2RvGsP8O
 Ha74tf86pkW3MimOp1w==
X-Proofpoint-GUID: 7sDs7fr-z8spAwPAJpTvf4ZThTR6qw4F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200053

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

