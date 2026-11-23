Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426526;
	b=PifnEMklakL0/ml0Vk6SosvzbKOSeBg7OFohivpf1stEgbAPsE4KTmA6LCZu95fa3Kmk
	 Ox5cf0JL1wF8/39pI/3ZhfWDORCAhmERpV7XHIlie/HmBrG9Tg3EA1b8PLIUzQMM9fcVS
	 QECUVyQaC3T8XpEW/jOHz33jI4NIlIXwUeTSbeTlKw4edJLJUX7Ecxo9hOOOArVFdYoR+
	 LwhQ50PuG/XNy9ctBZBl0FLBl1XDuFUyBwxo+6I3fo2F4b8pzMq3dY7aUsC/lOCCQk//R
	 h+EZCNOV+UV3N12bVibz/uSTXKGbDVe5zLE/bxw0QreyaJjb70haoebwEIgZIGrCdVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KU0CqrOg+I+DA/52+PGJIa4IqUvI00bQBx1czwXomuI=;
	b=TOEHKdj7s/isY6WkImiNMFEd6BSYwtcrTV4tKsTSJplnMEYOhk8RXQbfP7b2uOykLnJm
	 9w1nQJwCMlDRmeoUuhGduLHhC+uHDGLcYjYW++Q168pT5Ju9bVnbQuwl1JW4CoYhnOL7n
	 j2Lc9Xno9xQE1bhT+h2hUHHE9q5s9m6Bs/ep7c/qr2Oo8D4uhKryx83IXYKlUX2CNYb9e
	 J9gY/icYiiRF9m93jPHSqJeEXOlM5QzX666lxYNZl3sqHR72ruxLbNH4Vl+5dJGyaj1l6
	 MkQ+VGg7bHLVWVnZi+sC/iVqtcRoTVk4y05dd88LNc9TAQ5p+TF/W4sG83E30ZEUZuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZ+fB9Yw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GRlBPVGM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D905E606A339
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D905E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZ+fB9Yw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GRlBPVGM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FvaZ2072232
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KU0CqrOg+I+DA/52+PGJIa4IqUvI00bQBx1czwXomuI=; b=FZ+fB9YwwOl7Z56Z
	SwqQQ8THaWDWGaJJcIiAcFbnaXqBV6uco2lBY9V2oKQ5y8A3p2t+B3DOKCnzioCJ
	zXmabR+Z4WvOC6aFJjF109/4RH40+EKGJax7gA0v9wWTri6v0Ce1poJarfce789C
	7qyJ1lHF6tHSSV9QH0FCRx++hiZgLlvXxeUOKf/oWhfCLXDbNoPj/48ZTx/Ut8ym
	vT5pQCFZaqwqQj2Jf66JafYROwGHQdpf1snyPk8DX36W6NHvABKi1Pzwqxb5obTV
	35cs0mONSkHgrmFCHAZ1nuvPmX3NQTfBBvEyGS9L0qGENPnjg9ARNu8v2BTB+1iH
	YFKbDA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p8qh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:35:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94967c6d4f4so325698585a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795426524; x=1796031324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KU0CqrOg+I+DA/52+PGJIa4IqUvI00bQBx1czwXomuI=;
        b=GRlBPVGM5euRKBOh+VjQ/m6yUIMVY52aylcuFXAcbaKiUa5ul+5mGZ28JZ3clrEn2j
         6X8HWv5/OYCCRMY5GxFCmbgpXaSakQm8txlWCumzfuHYK9MMZV5KSUJUZ5vypipP2RNs
         Ln/GO0H9+HfRiQcWleKZ20QPlXxrk3TqXOJrlKNIADV0Kt/IrTDiu5/ACBi+mdNUWEHr
         EBSvLCceXo/gWnEtqiiOdG5T2IyOic+nyuSfZrJe+KUBfD6ocamPEIrRYWAmNRBkH9Wl
         euvIJ31ADm2bH/Wcr8ye3Q8xVUrnouUZIWJCDSSOBS2MoogjDAUxEwlsLfInPUl4UItM
         PwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426524; x=1796031324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KU0CqrOg+I+DA/52+PGJIa4IqUvI00bQBx1czwXomuI=;
        b=YDPywWaCO/jOmCVGVPhMtV217/zztWzEQuzJAaI3rYUTRBnrmf9PkdBVgpukehMwXn
         mtbKTDOcWS96LW3YQbo1ozm6hXr/YVUcC4dGPAKxbdbOf9THmjNcRm/0gBfAtkyCqkvM
         rjxiIRtfHLlKs9JVMeDhmGbhfijdVkLNHfmOwA16ky52tPctiyRDsRcsIHCr95G0OgkR
         B/+faGqGHnFhngEMVeqwtwO8BR9x56NEmAFG1rGA23iAe6B+s9SMwhBzICADiLPjjbit
         gzwcvvFErIzH08at2okOhV78xJ3oWVYj7eyKzcYz69w2CzeGZ8Z+X3BZsDh5A2181tNU
         plUA==
X-Forwarded-Encrypted: i=1; AL+hErEkse9q7Ftcl12PtyBLzDBHylzbO9q1Tchv79x1Pz5LTXsRoR4LSnOgHJCW+lz73bN33btTubH/xadAoxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z99YBBcBxbvWHTSWVgNDhO7wXcia5kPBtjly4ctIMz55xTE7nDt
	ozPcH4FdVS45b16YKQchmvHpzGlU1YJuEDMpQmASOoqX3HNL1Xmypv8rTFCCHPyPMl0GShUR9pO
	OKLZxoX8ltads3zKInskCCfwmwZ12ZEOD6OjLHxxRU2i7z5brHJ/JnI68X6v0aiRrr7E=
X-Gm-Gg: AZFdTZeAaXa2waBBkIJu33/nI+5KgqyKdK53A0wb7ab3iGNN557k5tbwySOgpiAKC3C
	FdYJOgfTmeAP6x1maNoIsVuiw3n0aeIWSp57eXng/e9vZwM29nt5yoC2zmqCG88KAc8y1Xydd7+
	/cbhrIhJn8dst/9VRSlkohXqic8crwbCHrKlTyx4QNhJRTtmLhVNSY7PuCqFShVGWP6IfkXonDq
	ULaC36/rnFT7LAB9hqPbTNt4cI9p7IBDR7YSEolNUN+ZrR2yz5nv/p2c/e/RxjUHYo36gPrmeii
	eGnRdnjMU/Gxt9l5aovM1AqNm4Um7QkpgOugwjwS0kqtjHi4ufFPLT06A0vc9bBrxTMhzH3INTF
	ItgYZVr4CS8MYUVXDdAkrLA3tOYJlVX2nudIzgemSiEsFzStjgmbWY3L20g==
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr1723261885a.8.1795426523959;
        Mon, 23 Nov 2026 01:35:23 -0800 (PST)
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr1723257785a.8.1795426523323;
        Mon, 23 Nov 2026 01:35:23 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm123208315e9.4.2026.11.23.01.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:35:22 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:35:14 +0200
Subject: [PATCH v2 1/4] dt-bindings: embedded-controller:
 lenovo,thinkpad-t14s-ec: Add Gen 7 support
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
Message-Id: <20261123-t14s-gen7-ec-v2-1-3420a6202366@oss.qualcomm.com>
References: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
In-Reply-To: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=aW/Ws2tcO1sy5bYtB2QMD9F+QpXYhZTfqTiGgY5aZZw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrBAjTZo2x+nFetcp/vZWh5OUfrT/X2LS3oAmUh
 a+YqdMfBZCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawQI0wAKCRAbX0TJAJUV
 ViA+D/9AIYpciGbl2CH361KLQrGAlgpvHSNrjn/Fpn8HtxTv6jdjj8tpKpHv2tZf9BUR8nNQGr7
 uT5BI/ONMTqdWu9UTQ/bo5X5aklNg8SLS5NXHjUYth+1ZV/fifVBGOkWjDfICtuLMwN67tWUsZO
 gOtlYu1odRhvJ+l98QDXFIFOuZAinvMsyLMPTuapUrils36EGR923a9LszGOfoTM6IupbJOxvOS
 ERIWVgiPFJ1BvpfIypqjbbM5ercI9lz+z3Ix2mT0DJp/XgpReU0HNeVinkGB3HF4mAJgV5oe1C0
 IWpdFmWc1n7xi6Qu1ku+CYbnG2c9dt9cjHZ+2KkEnF54u1pVfVKANsWE8BDrY4I7ff64lYGjR28
 07weAb+ObQS0mYbbaS+9Hu3XUveGAiq9W6jDehs7Egrh5b3AE63SlHKLcVyLCPtGwjvhBsX/DOQ
 9BCo0sTNP/l/JIQQgN34LKBkYHb7gDGFAfxGNBCpaw1TNk4EwPh32Nl44j0wi+1dlriPxHy/h7k
 TDTlgzNfwdQE/Kr8+5x51HmH4JoYm4Y1svWj0CiyYF+hrP4Y7xSzie+hbzF2Cirm9lSfEb7i/UI
 SUGcf7W74pcUluJ7bUv3SEk8EdSQZehnn8ljC4Y5BcOGmfke25Zo3OwnnqP8SVQkkRJzECimzXs
 /3VWrBZENrk3U+A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: WpvRWnZpqs8P9DNSF6c_u-X6qUwYDnDz
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b0408dd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=uZMt55wJAR8SEHwxpHMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNyBTYWx0ZWRfX9frkn7tshckG
 nRvQ+uAF8KBI0y2iTuxZ3YUvRvpSEZ+JytWo97UZhRloXCW7Ou3OTjgvMKDp6qyrMf0lyKBXljQ
 ChxIHsShVl4UqJEclFCqIWOHb8EFytM=
X-Proofpoint-ORIG-GUID: WpvRWnZpqs8P9DNSF6c_u-X6qUwYDnDz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNyBTYWx0ZWRfX/PLOJ3cXOjp7
 HzKOl2YChdNHqm039O218B227NbgV0ZR9N2bG+Ibg6I8Yz7Tabf+BKY86qJ2OXyuTO7bk+l2Fd6
 VOTrwLGtRMXNcmEPS2XJQyNR3tPuRV14HFYhxP8ijG/80xRAkjEQ7WX1bVqnUKPXA3PjoZIB2K1
 jL8MvARhAq8JOgMNSzPyV1d1hZnJ/RPyTh4x+TaoA2u8+EROizESSqqOqDDZRwDmi9aPEnMHfSn
 EE31pB8suXLAYLXYf0y1ZEVonsn9t+73QHM4hPhiu2BYgCKxyg8EnJk0lzDMA9JgaoCHWsq8n2L
 0B13tmIjhsM3R6h7r9CXtfRc9F0gJtqr7gYKU0H0nD3c6+kGSYwpMAB1llMwyvf/FQgk3sIeuCw
 f5VAKSJ00EqE7SFKZb7Oaoe/pPoPf4ksDsVBGq/MmuDcahnaLqkOh+/uGR7pLzuE+kvKL4/l3z6
 sME18DVV5nlhC3bguMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230037

The ThinkPad T14s Gen 7 (Snapdragon X2) has an embedded controller at
the same I2C address as the Gen 6 one and reports the same kind of
events, but it talks a different command protocol.

Add a compatible for it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
index c87ccb5b3086..99e5e7ae3cb6 100644
--- a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
@@ -16,7 +16,9 @@ description:
 
 properties:
   compatible:
-    const: lenovo,thinkpad-t14s-ec
+    enum:
+      - lenovo,thinkpad-t14s-ec
+      - lenovo,thinkpad-t14s-gen7-ec
 
   reg:
     const: 0x28

-- 
2.54.0

