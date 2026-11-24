Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517658;
	b=S3FEMS3QHdbyqmhZ6xbRGvmdOhKHN4IiBSi7bbx50wRl1ekk0sgOMEYCvhtxU5jfexFa
	 QCWEWdQlknmc16JoMzNC9O8L7N7U5jAdL0WD+W/btol41Zd2QdNBt0CcTGJD9IMy5YY2I
	 uwPUttE9g4eF0H9D/nvfgdWsczwsXUHeFTfGNV4N+Z6XPPg2mwNcIwGKS6sUKhSmrsEBw
	 KKOZT+tYIKnY1pNmTYM9lr901SuOtmEhJSaYcTDh+3RkwV08TrfalGGluFuDCxEuPJ/6u
	 QPkQZoCcpZtt49utt5r3tyr3BXCbVkFxpydJ2khvw37t4+Jkq7jywaAopTxW5FhmhLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517658;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h1XX+HZg6vGWb7gEUaIJKw206kuivjHbdONvxhwcr30=;
	b=dLLFHx1+sREw1w5beA+G9iVQ39D9zz13XsKp9T4eSfgjFpYXFc1qIWMo5AXBxMp9uQTK
	 G2n1S9Wf7TDmnsbzQo9BMgixufgn5aBzM7Qh7fNRDdQwMQsPHZJD9/sYCeip+k3sYghwj
	 sAGMas/o+EreAJbgkns6RHFNrqvcdS4P8uehmYptRPUZTbZjfpZLL4pDckq6syAljrflc
	 KQjMicCI8CBOXPzcbvBjtGjVmKYEnx7zn20hAvn+o9xvTJ67op7UFYvoMebwBjN/IzvAx
	 N3GdFlHJsqmjX1u/O+fAgHIjD1DnAy3ZoJhWelqsCabtSEyFpJT47FIMLtNzkQW/PsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f+tYYpOR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QqAFPgtL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A87606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79A87606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f+tYYpOR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QqAFPgtL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8ZCf03225405
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=h1XX+HZg6vGWb7gEUaIJKw206kuivjHbdON
	vxhwcr30=; b=f+tYYpORuLxY72FSqHvgd4pGjHoGRDy5dokiCCr6oEGKjKYnjS2
	7hLilPHsNjZH7KHHw8kLkduAcB87ouBCXsOF1ZcPGVAE5b25xbgsiWqvz7qPcVVN
	gHhQqgdLPzHI89Wey76ChcQW6/8HqL/3rDY9UzkqdAKLXarBc01+vP2kE2mVZwoi
	pgkUGalTa4rOVqTll85Mjay9e1tRr0wJdaEqiN4wsELWF+Cic9vgTKXOOsJVNewh
	8SJD2NyEfCs4C3zw1CJiQCVLU6Brl7MaiYl2eSPtheQskzruhFSISV66iMQRB7dI
	6blwZ2r6Ew8YLnmSinr2P+qJNcJo0ea6DaQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f2n92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:54:17 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b56c696405so3538341c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517657; x=1796122457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h1XX+HZg6vGWb7gEUaIJKw206kuivjHbdONvxhwcr30=;
        b=QqAFPgtLDBEIwB5ZpmLcbSoaXFUNyWdzGm3rpo0DtJe917jUkeS7jNqbRNIiQJaC4T
         g96FoS2Fc3fZHsoWhUCiI7e04Io3aI/3l9W0avbcSQBe7eHCorTKQjonxsI0qbLip2G5
         A0rSCKNXkEznCo84cuzQW2JHEB+Kde4QwgAp4hY5K95XpG4CzRQsSv7BdD7PacxqSOh9
         eTm69k0B7LlvfS0gmcSFy6g1eM6FJdzop2C7QHWy3XtGgzVftvi/jqxYqHGnU75+M4Hk
         Bpeki82pjVf5ObGaD250ud+0yJ2togmjLSjr/J77HzYdJWy1xo+DdikadBR9g/CTjWc+
         zqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517657; x=1796122457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h1XX+HZg6vGWb7gEUaIJKw206kuivjHbdONvxhwcr30=;
        b=PQf1LeQlCCJ104aq1eKkSLPtr1095V4qRv9KKn8ZiP1C6jIItDTUicb1fE/0USi9xz
         Jcngpf6+KAoNeb2mppNtutx442q49w68Rxw5gG32ZMRKO6pRXY8flFmr5QZn2Tk2rYmz
         mu03LTy9sAqf36xleh1OsPwc+p+YAx52e6R4b/rf+aSF7rM8snOQHX74/KhxdtKaBlc5
         hBhOp5ceKakspgJ0dDjJRlmBcZpPc1+WU/73xTXrxQZ9CNR4GLVZ3OfabU/y3nRoMQtz
         KGysYo+3GhywfhOn18QgN4zYt8CcVkSOLS/vEEKjzAFLv5iikZBd3rjsTIhMpESQjfCc
         Ugnw==
X-Forwarded-Encrypted: i=1; AL+hErHmNyv6+hutFH78DtsQsH9OxILkn2zfYUoMs+dLnUJRs5u5IQisXBm7rS3Q6og5un1iN83U2SVDV0vsj8U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5dTEvN087yABSpN5Oqnvp0VX3VxI+SzEoklI2kJObjoKns+Ck
	8Fuk1SEu7f5AvDPzAosGNhw/RgXzjgzLDbyPhkTRjBSwT26OC9tnFZ+vgnwaBx2hG34vFM1GPQc
	M2a5AD5tiMiNCgEWsA26+5W/CSgC0TJD5dFaUHslEgujMaweWDLkQrdz3Tu3yAUHadM0=
X-Gm-Gg: AZFdTZfgWjnx5N0Sx1iS+zMtRbG5cPSSfhP8Vjzrwlgbny38oYQ1c1YNqUV+p/Vq7Fv
	UgcR0TX4IOPH3Reh+eWf5sl1ysP/ez/eX1TFtm2nv2rd0USnQ5NjvT5Kfc3A4VM68v2tGyOfEMo
	cMmrxS7ADeiX1E++l0/EpZ9of/mg5Ho+3j5ZmmOTrn3pt6NlxPxIjCed5TgbR8Z9LiAI8KlpN+0
	2VsEMGyNKHSiOHKG8JoXZiSB7aypu1aQHdfvBwIZCgtgUlQ61IHWJDf8+iZjl1T08UyKKXRwrnu
	N1c6KcrTfy2sxAQMOisPuSx9OJh5oXRvqEq455Pd27ut9aC+hY7fpqLsGzlsr7OUfMQi2VPTVkb
	jwXQlFSbS4KgqpO+HRcVZMAu8Z3uwcoCQEKiZ+rZasaM4kLPN7SZQilp9kut7QgffcTmY+3t9Q7
	+sBEVtUgl9OsPpr/dj7s6oVKOFtq0bTz+fyOh/bVLdNYaseHAyKNQ/AOq/
X-Received: by 2002:a05:7022:1586:b0:1b2:559b:67ed with SMTP id a92af1059eb24-1b5568fa3e4mr16355901c88.26.1795517656932;
        Tue, 24 Nov 2026 02:54:16 -0800 (PST)
X-Received: by 2002:a05:7022:1586:b0:1b2:559b:67ed with SMTP id a92af1059eb24-1b5568fa3e4mr16355873c88.26.1795517656489;
        Tue, 24 Nov 2026 02:54:16 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm34644018c88.10.2026.11.24.02.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:54:16 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: interrupt-controller: Add Seca PDC compatible
Date: Tue, 24 Nov 2026 16:24:10 +0530
Message-ID: <69d22406d920bb2ca437604092b22648fc14384e.1795517650.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX0PXy2k7F4Pzb
 MaAQKSwK+HjJN2MrWPCZQfWtolLU38HdQ8fm7OiJGix2NkZv5Fu1XzDNgWM+y0eu/AiPZu7AkAJ
 D6Zxa/VPESyL/LwRhzZaLlOe26GlUTg=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b056cd9 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: F4rojNW7S9v0JUzfY2LwXVsaZ9KSKjsa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXzlrchoj9krxy
 BbKQJNirjDNoTP/E4KpQtnKoOhEFCfWT6X92pDYzPCLU33bCF7pNNkfbCNoV6DrGksorkxUgm2+
 SM6AREZAwW9zr3AELX33o8Dw64y9bUp0BYV6aRomnnWO4CyrxBXnaUpQZyrYEnVs4Suh47Ylf/N
 5ykb5/iUTmmYf6MPn1rAhVSrZqVFpxODcNBZUD9QqWteI1QdnBswmGRN250kcadenXvR8siBulK
 qXX3/oVJabCDneaZYpf5dJaWKZvsGMTS5tBLE4nQINasMCktqUxFBIT6M0RF3WKa6Qo8mkk56XH
 aCmruiVn9TE0+IXNvM3XEtftaIRUmbbL1EctpWxC1HstFn/LTIHGAeF+KF7d6KAY2VYpdAMW7M9
 YpiO4vUyHzNBsqWUAhoAW3cY5xqbdhubnv/zEA58eJ81m09R4kOMBhAjruupjFE567opFQMGLRK
 2Amw/MHXx0TURHUvYnQ==
X-Proofpoint-ORIG-GUID: F4rojNW7S9v0JUzfY2LwXVsaZ9KSKjsa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add qcom,seca-pdc compatible string for the Power Domain Controller
in Qualcomm Seca SoC.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8401d3b48e0f..e6ff08a4e979 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -49,6 +49,7 @@ properties:
           - qcom,sdx55-pdc
           - qcom,sdx65-pdc
           - qcom,sdx75-pdc
+          - qcom,seca-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
           - qcom,sm7250-pdc

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

