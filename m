Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363764;
	b=TMckzCx/aDA38nki20AItuB/+1Fl+NWBh77Miflab4H9RJtrR+o2uC2LW7Qjor9XxZM9
	 VvQwZSlCaoTDCWnd01V5QVeZq/vhNalcd3ngnvkD/xVCNBe+QQKx6QjmB16d5Lf7Xe7z7
	 FzJf6Lo8cbPkZ0YX1kdHO6sxJHY25EkH36MFYy9ts+zuXLoZGvirucjJ29jdqnnQAPQPo
	 +cRE0NX2MvvBgHkzQYS34hMB6/BiNhSqTeyEMUlffG0omMS1WZgsTj+8N/JR4Cb8/bW6V
	 wbIS8bzZ+zCVzQL3pALv9eMQmANy8Pf1qhKtxIUUQxZKPPSE19BqZoNUEm00WTJCcvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363764;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=H/uIhGC5ktRol+7sx9IjBt3hbLidfUuEYOqITaBP6p4=;
	b=yRdvdENre+2UDtkycA5NPmIYDpUWVmDKR1JzyF85RXy3HM3jS6taAq4/f7snX1MoixkE
	 qCT1cmMImd+NkQPuEAUTzRZHdpy/4qRCHVLNOycRy9AGzUKLb8XWh3aQ0Lx3kfw/S108h
	 SCwyYkDRYOcHUiyULfwZNgg8OIDFb18GDLMRLi2E/foodBxM1ROUTY6VZi492JfK+EbGA
	 mCfq4v93o198zSA8QKUD5xk7Zmjb8AFULoyTeD10B8YtPB2/5kdO61HUSstJhrX9OtJBC
	 hOgNqguR87rIkyIvxxWoV4FagPx5StERrvSh2VVIMWnoBFqYITBLBZtpU6tu311Qnww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mtAQdl0/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NeZptIc5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C3E606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C3E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mtAQdl0/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NeZptIc5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQAO4553965
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=H/uIhGC5ktRol+7sx9IjBt3hbLidfUuEYOq
	ITaBP6p4=; b=mtAQdl0/VUmsTmBfCdsUiZlwtJktWhyrddSFvdoDARKMDsTNwg7
	1SmyLGMBNciWmtKHIeGNOeeL7ir2VLfswcIzeWnq2AUHdJY+pnkpSY/94BrU5QcB
	8z/Vy+qoCcJbX3P7yOc8cDdFZ5tgs6oyLFYEOtuooRiluGFbgzkNt5M76iLUw/FG
	8htUFfqpEWBHq0vSD/9fOQarjyjsezvEOVOk2Pc+CTZB0fGXKWbDOlhrsnUbXXI3
	cYNDz+ow+YeikSSxDtz/vgB2GJCBMXk8RZyQtVIaoZqC9wTGvLNjYWgh0YknlPbZ
	T6rUSEfzij8r6geVPJxujPz1eegQUn8YNHQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j310fc0xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:09:22 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99063f4065eso733398241.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795363762; x=1795968562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H/uIhGC5ktRol+7sx9IjBt3hbLidfUuEYOqITaBP6p4=;
        b=NeZptIc5x3Gdl7R1YrsUNR7gaLrT2n3hQn4XYyKfcx13nD0bdjM7nMhhEsa4CcNSOD
         HttxArABNmKyc5sP6/TrYrV5WjE5bYyqRVkyYvPb8FVDcqDUrFIdAOGeRkdsfIJbj6AO
         WSMCwrfNQYdLjbSWHtSVg1SVlLRR1m66yoTq2vKRcykj+TC8itUCRtu/lf2kdJur2Pi3
         EQtVh9YDmICA8F8DFg6cwsT+QmG17N6OwrU1kDcsP97GFszUeTWw6g0l38AsYbdmCJ9L
         WWLQcNATbUR7dG9B4lirQh4sf+ASZ4TzXXaAyCLfLGr80seWnEOS7Q5RnUJfcJNWoMUD
         V98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795363762; x=1795968562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H/uIhGC5ktRol+7sx9IjBt3hbLidfUuEYOqITaBP6p4=;
        b=N8GiaGldhKLrlkraPDSwUMfqdKkZ9pTFD6s7hRxgwb5A81hjr2hYq/Djj+A67Lgy3N
         4ruQA6tMXHQZxCGjKICQzTQ3KGGhRFpom+fwPkgL4GZCcOTDmP5BjuaYuOOW+7v534M2
         sG3EhyN6swN391tEzT58YTGF5AQdOmYpOR2DyciLVbtHtBs05GrbHwMigszRCNhiUVGP
         nWV5tK2WpdurkN16s1fgRdjial4pc0maS9leD5B9+Dtncy9CbgBEt+ePEmqD5HZD/eta
         9JG4LxiUsST55N+mFmRD/85/Dpnt1Ll1S6YI97siALxmmIaSKFyUvUrMPH6QyO5gvFyh
         shaw==
X-Forwarded-Encrypted: i=1; AL+hErHeRGVRBQIpDXNY2V14JE9fweQPX2EHVEa2XKuVCQW2EZkU6hVlMb5IWaN4sBevqkn42KQO9GUkuvp2VbI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HCiiD+Izi14kAW6XF8837oqMpS+Cj1P/5YVmjl9kBA5KEj2Np
	+4vPvLNypJniMnTyNjM33PhySYW5sybdqLrGLLYrcnoAkfs/7KF4dnziBCAZv5z9FwxQGeL0PpD
	AxGcX1Yo63Wftu3imfsRlGtEXvTXbKXMoB+zusJVaH4k+oh+LUeA+FBBAWsU5ao2KY84=
X-Gm-Gg: AZFdTZdM1UNK+vbogZiNI++t2AC7x8gYByteVGM2RR4aD00Bg6Rv/xUT5HwTRN6cvqS
	1LW+9PS1WvswZNT8gquHGj6IxitPcFyzD3uEPqJ89CBj5O5YA9V6WYu4t0v5OHdYJEOlNUiqcyf
	i62c29QDWav9hddE51QJGqX09zS6RXL2QKYy5pcCOuhKPZv+xCPR/1B7DRs91290DICZd9O6A5s
	pw9xFwdfBIdI5Ht8za7Rq+QG7j4MOM2ET1Bdy7iV+d4vbL9d/Uvh5MBgxfJ6G0UXh/Ft/CUWb/G
	dxdHnF7BpobCzZG5oXsFEoTveg4y9ao0QN3o3oZM1ZGpXrhN6uDKOE11bOasGIh5XbhEKI5Ntfp
	SZhdWMC52YXKUAsSZSao7lA4sSkO5iOJbbI8weGATYA6nlU17AKMdk7NX71WvGA==
X-Received: by 2002:a05:6122:d96:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5ee8adf69a3mr4700270e0c.1.1795363761843;
        Sun, 22 Nov 2026 08:09:21 -0800 (PST)
X-Received: by 2002:a05:6122:d96:b0:5c8:46e3:ec57 with SMTP id 71dfb90a1353d-5ee8adf69a3mr4700265e0c.1.1795363761433;
        Sun, 22 Nov 2026 08:09:21 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm320526755e9.6.2026.11.22.08.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:09:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
        =?UTF-8?q?Jens=20Emil=20Schulz=20=C3=98stergaard?= <jensemil.schulzostergaard@microchip.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
        Daniel Golle <daniel@makrotopia.org>, Marek Vasut <marex@denx.de>,
        John Crispin <john@phrozen.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH net-next 1/2] dt-bindings: net: dsa: nxp,sja1105: Properly apply ports up to 11th port
Date: Sun, 22 Nov 2026 17:09:08 +0100
Message-ID: <20261122160907.200727-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1186; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=k0dJnwwVOMUlPc+I5R+F03eCmWOTtijHmMPA/BB2GhY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAxOju/4Z86N0mMZw+6sMiO3a7sqHSvn4onpHC
 tSJ0snI4fGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawMTowAKCRDBN2bmhouD
 12p5D/4xaQ/IqdB5b/zXL7JJOMdwpoOJvhCY5xO3BhYDj2VfkgaUsxoy2xYJmK30cmwXITVYD4r
 kvQ2E8lPZVSNbkquqmYyv1bWwufE0xZj+5gPZr1phRuJyyactBViEXTcJDcagSilgixm/PTF+u7
 z5y1S6qnTXywKiLuIQliVhMXJuBnHjNxqLe4mLuljad0siZklmDDulm8ia9LjSm+zmKXfJd36RV
 dutmfs5njSG1lRa/cSDh3xk2Rz9U1SNO045QHN70NfTgRT7qpXKTDYns+QvbrZmkF3qg2llRcw/
 wE/p/M24NbKFYpFCqVEDtz9JgoId3ADhL/pR1JRovVXsb0JQAtpwS4E0cnkKbKC3xCVOTJnzjlP
 qq8lb0t6g9QAkFLlbNjd1gU4o/f0gtTYuAgGO8LmT3oxxldhJwO7WeryuFoHONCFAMf6X+j2ooQ
 IUAYKNRsI3DHDl7un82Eo13QGV7OSjGroEWz04mzkajrj0Jhqt50VnGuVynmaLPlNs7lM2AbZvR
 b7i9+JQSwFl2bDlHFZ8LNYXGgKjm3hkUYhhpEv2uEq8wCfoD1RS1Z2vNl7dIaY8dyhnJLWyH265
 WS5FNaYYHg8yyxtirYCjADcL0ofnaweqCxmiu3Tr1P43bVhROoiAxR76amWY7rPkK5g5roH2N4s j6WjETiSGU4vMzw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX146zggHAf2Nu
 o4eQ3gQLnRmtkB4zitfQUNFvINTFHGgm2hJ/mKX7QNJtiDR4/KarOjpkoSh57Lz4ZdW1Xi3fuuQ
 /C0wZWEUkd5sUf/zGjpVS4RCRuclKNSW6UhRyXAroCz5VfiY/ceI8k/V08B54y0/ENaLqWSjGhm
 H40RkKhrc5ZtkWjA4VQcudmwwqMonQTx55mBkgcgwO7eqQ438v0ssW8fcfv35uEAhrQ5ZsWllPT
 QSJ+iUtZEb61IWu/GtMFolc3aFBMeHXSGGhRuqxwlYGddgKD/HeLoiMxxTp5Q/DVi9h8JxPNJMM
 ThBCaQODvso3mTPkgjDabGB5NZvRt7lheVfpzikqUJKx3BsfeT/y4jUg8QyKKMOADYs9y7GAs1K
 fMK3W9Xqj08gNHjAtscclXcz2HLcZTvYnz5QekzkKfcCDchcjyYjuk9+4c2auUFpDQ7rm5HPzDL
 4blll+2717RPBst6GzQ==
X-Proofpoint-ORIG-GUID: eSeCMIhIGpj0XZIgP6BxlUb8yGTaho1y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX1HVYjS4W7mYY
 OLQPY2jlJkL23Xp12Q3mUoCreBRl2xqVuzmuiZDQNZwSUGMFnSwZgK+iTXIh3vYyponv4Rb0mg5
 uyN9XaVUDy8LPEApMKe12UWSzi37/fQ=
X-Proofpoint-GUID: eSeCMIhIGpj0XZIgP6BxlUb8yGTaho1y
X-Authority-Analysis: v=2.4 cv=UN1Ijyfy c=1 sm=1 tr=0 ts=6b0313b2 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=1gOBQcDwdZx5nJ0sStIA:9 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

nxp,sja1110 devices have up to 11 ports in DTS (highest port@a), so the
pattern was missing applying schema to the last one.  Fix this by
dropping the unit address from the pattern completely and adding proper
constrain on the 'reg' property, so child nodes beyond port@a will be
properly flagged as incorrect.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
index 0486489114cd..e9b53820cc36 100644
--- a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
@@ -89,7 +89,12 @@ patternProperties:
   "^(ethernet-)?ports$":
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-9]$":
+      "^(ethernet-)?port@":
+        type: object
+        properties:
+          reg:
+            maximum: 10
+
         allOf:
           - if:
               properties:
-- 
2.53.0

