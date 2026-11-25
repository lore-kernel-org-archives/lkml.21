Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612705;
	b=wH2Koy6KHT6nxmw4JtDyJJB/mCcjkE2BLAcBKT/RGrv9Gg/0gzXs24VG8KOUktBnhzM+
	 dWC+TepKNyyO7QyriIZDzVpjUl2NWPfPusWaFPFTILZRhrYDDD39TKhWt8jmbx5gCgpR6
	 9ZhLprt0MA3ICeQAnIzC9sJetwoJe3orKV3HLVahDYK1Wk/yhHlmsZNR9BfosGqqSsA73
	 e1tge5/CBWAO1V94ovOjn8r4FE6B/E+uk2m2uSQOOqLR3HrinYmbSqz123J0McUZQSlx8
	 eZMOqrjbVsF99I1KRxpU1m689tgriuK4s7+VTvLS8Z4k+dHn0mhg3+uhTfDNkywKEZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612705;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HI7aISuqjbPWHF0PdzqR/2jami8T0DRVhsGnTdgpivk=;
	b=ibab8AmIgfOf+Q4GdLm+LnatFr+omZU6dwFoq+U5Py6QuxsvZurvN6Rd+4bzwb25hnzW
	 UZGhy17XNmT08qc7qCXdFmh6nZG6QeXQCD2LZ7OzQ05J7UW1NAsCjlTdXtyoHaAr4UMth
	 JLYNcqQ4MBQvkq5/2U4RwxgXQepfozdEECyhWQgDbZNtAoO8lA5peCxrF1VGJDyke967V
	 87FHQgJIyxYA81/VtO5B5t6fMMKxkDGGU3cSH3Rmuhq57/m+XHV5nEIuiI8MNu/eecT6f
	 4Fac1jsMYUk5k/vcMhmXI//KSYsIpAUeh8jvlzARxxemHxnkCw213tUmPjpmBI+Tp+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErYnkSnD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gw7d4+bU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5289B606A685
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5289B606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ErYnkSnD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gw7d4+bU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mNg5555513
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HI7aISuqjbP
	WHF0PdzqR/2jami8T0DRVhsGnTdgpivk=; b=ErYnkSnDc7f97tbGOc8/ua+RavC
	BuGi55Il0FnifFEqK6TzDd16wy3HycBJMX5EXrtDh9LWeL/2Q1IF3gPiDmZUxHOU
	1wBdmrTlqrXQUcp3aZlfwswpM7PsPGcZWHlXHDW3Ge0N6QAQPtcA9eHVEqp1Njdq
	qPopGSFaA3/mBAfDr19rZbYamkOYFTqQwRVa0u0hlFvgYKcV+7+/taK6ibhqw1Nc
	JHEsAzAjJvXOu11BH4oicWRoGDwP8TIAuLB/s0t34SD/X3rNr3xe/Q9F1PewefCS
	wSygIo/wGMmVWDSckSrgVaKylOJMUCdw3vtsnoK8UY4isx8hBEDg52L+fUg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnry75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:18:23 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99082f450bfso3422712241.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795612703; x=1796217503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HI7aISuqjbPWHF0PdzqR/2jami8T0DRVhsGnTdgpivk=;
        b=Gw7d4+bUfH/kor9HeSg/jHEaJDTVTfGEb7yCbNWQ+Mol0uwwHlpnf11xEch92VtWGz
         aIW5XbgTOxnyDzmYwC7A+NCpZrnUc2VMwqKpqJ9Yjtx7gfEKQx13iqQeNpczZhNJRNol
         Q00a0feGNNi6QLLam/rd3yZoDSgWjIuFTjcx54opRm9cZt+DpXvBEpcevpnP9KcLkqIH
         uBTuWKolCM72hxNdtBTv4Pi+aRDA+umf9yVd+7XHnKDf51HTN9Q5CJcARxS2MC/znJyp
         x5xBiqORkYmHEcht18YesSPDFw//8pey426AMVddYKPTWgEeewYhND8YIw2SOrnBihiM
         kElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612703; x=1796217503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HI7aISuqjbPWHF0PdzqR/2jami8T0DRVhsGnTdgpivk=;
        b=h9hMUGtHIEZsUltjN86rQzcmsp0Qoq36lLH4SOUL+xZYeitXFroD7y2G0n9OIOpYdq
         pGwoNMdzVxxTTeoHkT8o9D2+78Jp2XYBECdMFILIEImEhlKosT2y/kcXyE13DlHyUl0z
         UQdgybIuhoF29RPOLW4btfwe4QUcF0Pc5REbcqez6q17fDF/vo67VlM7Uu3k96hgGBAL
         nVfLzKhRB7czI9yRUFCrkILl7+TvJbU7coa97hMSbGUOajGaD86Ol/vFhtD/zwhQESJh
         zfuJ4ushMMtn2UgM69S7UH4Lc0d+8ESUlM86vO+YY+8ULr0ubIULfq7gq79y/unBT9Ta
         ZooQ==
X-Forwarded-Encrypted: i=1; AL+hErGHjETvuA1+FbhETohfXxG9qgNiRwSXa0KI8ei0GJTujxvf9byFUzlcy9RlLwKSYhkj/7YSaCfJpMStkz8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+miWLvawYZ0lcL/NWctJCWsigDQ2n+Lm1NlP6MSEXzPlkklWPb
	mQ8v4UkWMK9hSRKucZDkv9t6J8TLkZxwFrBucUwlEEkM/0br7tbrfumOpQdh4npOWxTmtTFxzT6
	GDUfM8bZRBa/wfuWx3nzKayAWJFBpUL9oVIeKdeJ7p2DmNn11GiTQntudhQAux2JLDCo=
X-Gm-Gg: AZFdTZcAyyk5hxlLZ1P65wQ5DizoG6w8Fon4E9WNfYSPdAdylyQHs7cMgXZ2fcdGOKF
	dQAe9WaWPXk7doRmheNWI522j+YY1LNCUCevm7fuPRXWUbVHPwrq7Oanen27Dv3ad/k2vnVL4h/
	SFeQ01XduqO/PyCp9YmPJIi6BzJqmKfs2RkhBN7mvL+llQL5O2uQysbxOlZ8cA3s1CkHEnTVRJW
	j5gy3jTBpF/CWmDyV2OJLb8fWR+g6lUQ/+Cif7ht/d3BrjAT3Wbi+qK+4UkLK+h9XqbtbAGBFYk
	FxIdFpebzdhnVILlFb57dmWLYnqHBHM09cXZW8p79LLIal1j4I7nfPe6r+mw/BkxrZ6JW0lahjw
	fWQi/V8di8f19jO5414h16EUcztiTk7iQY30zpU9sY1x1xS6pYYnH+fdaMBJztQtz
X-Received: by 2002:a05:6122:30d3:b0:5ec:3e18:a188 with SMTP id 71dfb90a1353d-5ee8adf1536mr11257287e0c.1.1795612702668;
        Wed, 25 Nov 2026 05:18:22 -0800 (PST)
X-Received: by 2002:a05:6122:30d3:b0:5ec:3e18:a188 with SMTP id 71dfb90a1353d-5ee8adf1536mr11257217e0c.1.1795612702105;
        Wed, 25 Nov 2026 05:18:22 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm205035365e9.0.2026.11.25.05.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:18:21 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        taniya.das@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 2/4] dt-bindings: clock: qcom: Add LPASSCC reset controller for Glymur
Date: Wed, 25 Nov 2026 13:17:55 +0000
Message-ID: <20261125131757.1163466-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfX5sY7W0AsCPpy
 ZfWQUzJ70ikf975lE7LWEPAyMOdvm1DSawkHgppfxR1M14Bv4Rk4D1CPlNk9KzXLcO+tve0sei9
 mFERQRk93qL3pjO3uVWeFmiARJOMZrrENgT932/nMndq7KpL92Ntg4NUfn9PGvU3eygpj/xTQIh
 qP3fEW3Pp4R3YBlFCd+T34H0WM4eRlVfCY3xuSIRgwQDmPJMgXKx3QKajr55HklgitHKUHQAbaj
 HAsCGjANfznKFQfwdTlnnyupmJpqtEncJebW/nk95oMwbxZIK7fbDGukhO0arsR2SWnqCXQxSLH
 jSmX07Rjka7gIlcBwKZi6yeBaY53uC8jA+XZvHQ6jLMwil3Ee9zg6/83kB0EVx80DCfdrNrRHMx
 b/jLWnQu946uDxqp1LYQwVl01SHnrenW8GJ1zOAFM9+lN0LzB66YoI0Oz3OyCQBDMVVE5ShLpf6
 GFOuMmslZbuEuipO3vw==
X-Proofpoint-ORIG-GUID: kuAQS4dnCLFIyXCw3OUf7ukOpZM4kV_U
X-Proofpoint-GUID: kuAQS4dnCLFIyXCw3OUf7ukOpZM4kV_U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MiBTYWx0ZWRfXx1U/kyoFXdVj
 /7Kk33r+MB/FAgx3Uly1cHHq4hhc6RJzn+E4mtAgI+ajB5GfMDuhzx3fZm+wgjca/03xyFY1wTn
 ZFJIvYZR5S/c4jEQbSD+vXQKIEdI6Mk=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06e01f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uR8O5Y6ZOet9NXHzM84A:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250052

The LPASS (Low Power Audio Subsystem) clock controller on Glymur
provides reset support for the SoundWire TX master when LPASS is under
the control of Q6DSP.

Add the qcom,glymur-lpasscc compatible to the existing
qcom,sc8280xp-lpasscc.yaml and add the TX reset ID to the Glymur
reset-ID header.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml       | 1 +
 include/dt-bindings/clock/qcom,glymur-lpasscc.h                | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
index a25e043ab894..b611f1a8b42b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
@@ -22,6 +22,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-lpassaudiocc
+          - qcom,glymur-lpasscc
           - qcom,sc8280xp-lpassaudiocc
           - qcom,sc8280xp-lpasscc
       - items:
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
index 3006b12e385e..3fc8e7313cab 100644
--- a/include/dt-bindings/clock/qcom,glymur-lpasscc.h
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -13,4 +13,7 @@
 #define LPASS_AUDIO_SWR_WSA3_CGCR			3
 #define LPASS_AUDIO_SWR_WSA4_CGCR			4
 
+/* LPASS CC CSR */
+#define LPASS_AUDIO_SWR_TX_CGCR				0
+
 #endif
-- 
2.53.0

