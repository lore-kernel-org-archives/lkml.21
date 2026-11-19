Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088653;
	b=j1cL/LMrZlg+GBKybFoXtVYeAsqYkFoP/ljx0ne0v6hLv7jckKwvgJ09Pl3E3Sa68Swo
	 5hhatXX4AcIoHEJLyPXCPu1odRF2JcaBhO3El8B/sKoMp0431FD/bQHvkUsS1eTO2eODo
	 wGIX4rjTBkb3AOWMhQ3D6HfgS2tFnujqw3sZJ38KD3ck8Z892uYGvqRSccHw4zI2abzPK
	 HCC9NZM+838z8JpIrxF423I9RAUhxxC4cQR6E9ATuNy1hSscyF+5LkwwWGpXBX19ZcvSQ
	 Wj6Jflp3cdlWDJm/zUALmdehencqGisYu7Ec+rDlCZlntBrZGF1c5kSTRYodoJjlPfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088653;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=;
	b=Qov9dp3v7fFuL5Ds4sPUALGWAIEx/ZFJJzgQ/sOMImcn0fGvGD0mEjvbyp9Ny1sLc2Ri
	 YSf0iYCyISEmCci617Md0z76AXnXIUPGt9BCXKWmk8pR5f6uL/wPsCpwoNQ6a5Aa0oj4P
	 MSxXXvy2buNcswS8eneDlhtSVjt0iFnMPv17sY22/Hi0WcFRgVmBdGhwocoqnAcGSP3jT
	 PDo9UsPo5m0BHqIpxhxVO1I44xF3TAL+YSaKAIUNF9BwTCNBqdF97DcxhVR8oNO9QngWs
	 H7313BuizPj+EVr6GTNhqf6IQ4+Ng+hjgr41h/UfhVtvaMuv85GO1u+ipsQhE4uonMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WU26EFke;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WEP5syGt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31CC606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D31CC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WU26EFke;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WEP5syGt
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJB52Fc2093150
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=; b=WU26EFkemleH72Pp
	igpyMWtqi57bblLFZ72wUfDa3PdQMba/mixao4J8hdgOBGwZtfzuIYX/hOPkuCsi
	PI96vKLRXdCxoKYuukk2HdfAUdqliV+/JwZF2UJDrbwqkXPXql7FO+mlH+NXfYxW
	e+vvcCCPLIWXA4t3wbdtx/WrGT1acJOSQ1RKzXdgPTdCx6tIyCBSSes9pqVVfMMX
	fVZuuSYJe1dMCr24PDhfv6yuEh9Z8XJoqFDjXoZ09vcuxxGBTEw4A4GBfwtg8aem
	KSExzH+m1dlxk5fT/18smSZZs54rywbsWCzKrHnJRjZvpWgn/oQbMQPPTAmP5unb
	9n03yA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yx6841t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:44:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so974342a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088651; x=1795693451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=;
        b=WEP5syGtR5xCz4lSNAJqA9BS8aKZ4oVxRCzcyJVb3CEd4c+dEtw6tCBq8WFadRQFLU
         84ivkdZ3M+rho1EroHb8DyTE2nVfWtHWhVLzoKdbYQPXW5Ag5rIXJvlqx9hQQvx7owtl
         1GTp5SGxcukRVLnYJYjhP+w/GFDZX6tRvKFUCr7n4WkUunxo/NSomUiC9kRTR0O113bW
         rzUcEff4j/b/12ZXD/hFJxIH11DsYqnyoypX/aJD2YJo0KRQbCjRGa3ss4j4juJgVg/C
         /jt4AJa4aE3+NYMcLtPhCzNA8F+e4ZW7fjRxGCkB+1x+y4bbgJyl5nZyIanJKTCzzlPX
         0Aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088651; x=1795693451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8xRW69kBNQ8Kj0Rskt6puJpENL7w9NsJ+tqebELTsE=;
        b=EAfpKLKQwgk6b+u7i3+wz6UfDi/Ee2/M5Y1r+LehwIBlv0u03hI1vCo3tQ8OxUI+8a
         esyBVVwQcIUgJEJp+PRQZIMLc1OisKAoDECXYBhbQVyws9ojK1TAa/qpbFzupcuR6RC/
         7w3ZePp5287fc33dEWwBBWOyhN7X61oK78c3T3HfXY6R0WlxnLOH8YEjWAmab3B231Cu
         8wmbQ9g/0kRke6cXIaSjDH7z57dSyfD4+su6+LKmd1lVJNKjuWR8kBYcme1N/tn33nmK
         AdAb/LH2oDhtthRlEs1HHglAczjre7hSLktXALXylF6ehdSpzkTaR2LlSFTG5idnGQNa
         sbnA==
X-Forwarded-Encrypted: i=1; AL+hErGcf60ceX/9iCluuh1kq0y/6ViEEfk+cO4MNfgLv6qE3LmadWCEBK+xrgaCsxq1bHA2N3KNnjVfvTI8sVE=@vger.kernel.org
X-Gm-Message-State: APuU4Z894DsJT+KLdVy8/E3/vjVT2/+KWc2Sf2hYHPVFbyS86z6ScBFg
	Lm4TQxNhU7gRx6wqHaIt42nDY/AqGgmhMNY2Er/ZS9QkWTkewypOYhS2Y0CWezlxCoXAW84KMdw
	vRJnadbtIcQEPAl91UTml7EdW3S9dCdR55VCpOIrvJczzk9CTuFVwoQ/r1ls3454KRDpt1+UDkS
	A=
X-Gm-Gg: AZFdTZcvhYV4tyV66FQ/LSurWyK4jLmgSYur479XN4YTwYuziQ9se+U67tC/E3ds7U0
	lWETQ2h087xcn28gYtISTGCnI+fd1MnLfHe6ZXLV27EBhOXlKWBKa7/CGqLqTj/mrwIHfnOVxUV
	ioLQ1QLbVNhicMJrK82ne0GmQhG+8yssFct9OQbq1CygrkJD2iwsZ4+58eisHFwD6UTAc8xsW+Z
	79BkfLiztlelA1rouc6QbZaSU7MwtU20saKLKXdIonkd5kzMvGjqqbtIOyDzo9QFyI3RQ3UlLje
	99k7YQpSYP06D2J9NoMNCaCgJyuEXiMUCVFzciq3k9DFey449sgSj128MBd9hEM9X5qHTNUkeiY
	K4D4D8e4A36nrDnFLPlQIZXVhOIrFaVuThtoQijojq0+P5kY5H9cyw7a8mQiWFgYI
X-Received: by 2002:a17:90b:21d5:b0:3ac:8741:e2ec with SMTP id 98e67ed59e1d1-3b409eb94demr499411a91.1.1795088651363;
        Thu, 19 Nov 2026 03:44:11 -0800 (PST)
X-Received: by 2002:a17:90b:21d5:b0:3ac:8741:e2ec with SMTP id 98e67ed59e1d1-3b409eb94demr499391a91.1.1795088650893;
        Thu, 19 Nov 2026 03:44:10 -0800 (PST)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde534854b1sm1613960a12.12.2026.11.19.03.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:44:10 -0800 (PST)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:13:46 +0530
Subject: [PATCH v6 3/5] dt-bindings: remoteproc: qcom,sm8550-pas: Allow 6
 iommus for SM8750 ADSP
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
Message-Id: <20261119-shikra-el2-v6-3-0e91a1467e79@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088627; l=1816;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=DfSqnikNSHzMY2hBFUqjQHSQRxokU/djZVzyyL26sSI=;
 b=pGu0zY1XyLxlrASpCoMqPSG83qmdxILDZDlB0yZoXwChYVIP96LNlsT+alnkitTg9GVioRKyA
 tdrnz9A8gORAgU8RX8G9//H1/y89nL0U2TqzFX/29VAaOjAk34JpA6X
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: A8vSWUKRjqhq46iGXMulpxLFadjbM_hQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX4+kil9gQelq8
 Jq0LI2F9PFJjrt82EPyCEmcHUzD2ybsZxXC0hShFGVGMFNSKRkjxIjyZqDIWYpB0sM3TpSQ4Pi6
 VIDe/dCS6/zgYJZGbv0swtjHB88QxSQ=
X-Proofpoint-ORIG-GUID: A8vSWUKRjqhq46iGXMulpxLFadjbM_hQ
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6afee10c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=heRerMffL7N6zYf9F1AA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX3WNBTGVRRahZ
 B+pRfrHElG4x+aet5xDTNcjgENM/mtcfkY5uW2AAbHop9Jjg0DcK3RVK3yvgj/u4NW8vPhWX6+q
 LK14jaTbkyn7UnsuaJ5YGZE4Yfdf+B6wX2W9sZgkSh+FPKdZD8vMUi84+eArX7TbXN1TooPe3bg
 B3LQ1HayRSXo9J5feCVQOjVW+oJz5mZ7BsRBjZPxWvagbyE59hFX2HSiE5VXrM+gQIfLBD3HMPD
 yXdOZAN7oOYZN4vb8urOUFBYw0Fcgmr9kHI/PKij+eFbgkx3zF1RxbEntgDDCfXEiBG9IF+DnmV
 Gw9awl1373w56J3YONkFO5Imp9VY5Nj6oWgZgMdEq514UyBiVVZI5qEUiUxbg3hMJoFwXU+vCQd
 6OSaCdzopKTzTQWLW7W/dhDWdsjP1V5QPJJmEAPGnIAeMMkZjAtM8najbblPOgTxRw8LoYEMIb+
 DidbKDnf7xxgunFmBOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190046

Remote processors behind an IOMMU may use multiple firmware streams. On
SM8750, ADSP uses six IOMMU streams, which exceeds the single entry
currently allowed by the binding. CDSP uses a single stream, while MPSS
does not require any.

Allow up to six iommus entries in the binding. Require six entries for
qcom,sm8750-adsp-pas, disallow the property for qcom,sm8750-mpss-pas,
and retain the single-entry limit for the other compatibles.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index a3131e6417f5..45cc50d9c1b7 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -119,7 +119,8 @@ properties:
     description:
       IOMMU specifiers of the streams used by the remote processor
       firmware for its memory accesses.
-    maxItems: 1
+    minItems: 1
+    maxItems: 6
 
 required:
   - compatible
@@ -323,6 +324,29 @@ allOf:
             - const: mx
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8750-adsp-pas
+    then:
+      properties:
+        iommus:
+          minItems: 6
+    else:
+      properties:
+        iommus:
+          maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8750-mpss-pas
+    then:
+      properties:
+        iommus: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.34.1

