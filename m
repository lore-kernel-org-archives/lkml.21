Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795363767;
	b=opSjbFcMVGO7rH+9RCJHYIYjMAafmn/zY08Hh4uLOSXs9n7jSVG8Rna2ON3qNe5AU5K8
	 vzZfamHpomdYw25IaSe2wqP3a1PKxzBJOeHuBM+YZ/jpKqWlQ+yX3buv+N6er9Mn9Ufcy
	 9qWYHLx2W7sJE6JviR/uio3mmsFD8S1NwSOo+5/RM+GfPJER6rBdSYNEpLXsGSa5YHAHG
	 IY+jtTSQNP/H3IN+hMpbP7yjdRyXhgN8OV1U4+S49aFMbR3mwGSxx1JZqLaxe4t9DJn2M
	 3/2v1F1/w/v7yW4BuKWCUPbnQlGKNyF2NNf4WLPeZv3AF0x843xh9KsrXvL2vlPBAzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363767;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dyOk/+hQC3dS2TdzY98Q2QJjFxp/lBW3s2x6G6KYsm8=;
	b=P2N9efsP09B7Xdjr9PMWvSqD6fOAwMYLqEOzBZiJaPRbvU3/5XDFNW5c9yOfznpqDPcA
	 Jf7GUSHLZ9eNUXEXdmdeNLbhFlZFzhscG8+HzXydCxtv8DkS3mBJ9KvgM/c2CcWsgYf3k
	 KEEqZ32eyETzoPVGAJPzcK9femfsBO1lzgU2fPFiQIAOEvURsjnMBTte1A0M/eLMGzeBz
	 cZz1mYPDkvhgE+UfNFvRL3Wdm+iufi2mNCvTNOlrSf3h9eR6lRq5HyhACO+AnZJEUe3PJ
	 n6XghULC4r/vfZs8L+lggNIczm74wI5+noiUJLZe8JefAspoysHYqGwdszylgtHnmEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fo11p71u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ohn6LKTA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3293C606A33D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3293C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fo11p71u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ohn6LKTA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFRRAQ1250054
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dyOk/+hQC3d
	S2TdzY98Q2QJjFxp/lBW3s2x6G6KYsm8=; b=fo11p71ugXj+px95KD0I3tYDbTh
	yS9cS8ycCi2GiMgJ1j8GedN7CBzMcbpWS4qXCxe2NuSKyGHBARcGIzocsdXToWVK
	y1bcpA4Oc+uIVfCp5gmY4cRwXXK5FO1izXGR5WE+KUAnxFEdgYpa4D2VzoemGPUx
	9QP3WefnhdCgec0yiiuJ82z0On3b11VWyTGY2JB89i0LnBcr1Wc/IjF+CXBN3Pq1
	jlNK9H+2KMoKbuQVcYjXnaIFiIDh21fggm42Y5o87jwDTYfvqiSgdNMMEwexXVwM
	htEp6POXtjAeln8wZE5NSqMceJ+3UgJjSlAUFW1XroSL2K/pTQ4etxW7wqw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w03rf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:09:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso639928785a.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795363765; x=1795968565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyOk/+hQC3dS2TdzY98Q2QJjFxp/lBW3s2x6G6KYsm8=;
        b=Ohn6LKTA6BqWlHHewDtQ7Op8x6hmRoFhaIJODQDqQFArqnHYvGawbPNDi1hz6uIWEp
         Z8V3Khewvqt5f1RJH4x83wTe97tjMNhutdFvXV/l/oVh+AM16Nx0lSk35BOVGhBZ9c0/
         OwOYYxy+HHy7EB8utYXheQBKuNb0FfBTNbHKSs9jLHXux4+F5GIrHP+vW0IBr79wjvSe
         wWJi2JsVkchgRhRpj5SfgiJ+raLyrgIubu+aDtbmgRx1iG8q0rnFPCv90Tcghy/pC9jk
         EoBdxMqx0Gd5evRWmtwTF+DKMcxge5cqkMn/TSzCcFc81/D5nLJIKUsbbq8b5Zc4pSq8
         QYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795363765; x=1795968565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyOk/+hQC3dS2TdzY98Q2QJjFxp/lBW3s2x6G6KYsm8=;
        b=bvUTleIPMujZB/mxdMbxdINkb/X7dvFpGIVROxoJeE34ytO+2i3F5IlnfLPl3fHCUb
         ytQQR1JBputWeWv50EgOQrDsWUJwGxpMX/1dYPZ/kFwfIP7ju3svjSvsch7JPlanmH0s
         aIgL8LH6HhYPY0MUfsk2uAfttkjgBxUF/YIEhtbpgQAsjWl81UqPrUjw/FiU0G/ky94T
         8zivJLEjBv5X11Y0mddds0abJUjdJ8/kQvrqNjAO3JfcqITZkAzaaZeGvOLZGlkU0q+M
         lw+t9xsJa/ogYdofBu+6HGsFAL7JervBL7vqO/yrIulrzbxlfYO051OcuZ6R1LZOIFPw
         xr6A==
X-Forwarded-Encrypted: i=1; AL+hErHLqXkg04nR8URHGadb6qhtC9HhBAsD22VbdwQsl1lr/xx2xTXJTq5alwdvAG7aC3hAYOa7a5VUPurRiJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+S0zg9DDxpQ/y8cuWlvhbCi55iOmy7puNiHs0YdvLHpazcHAo
	OUrqAFpX31muZykGrRhK7VB4oB0X60mZ17EUPx05KX8D2ehLMz0VmvyQhJieZGNisqlsoadeCbB
	HE7HSMxixn/cMeet+6nkmraZaQ7c/J7sg1pfOTmscNrvHgtdKcuYzSNufUQAp8eWEeYg=
X-Gm-Gg: AZFdTZfyaDyhrQ5qSyiFH2u6aXhopfzJqDu3Uhori/OF0icr9r55tNAotNaX7Pp3fPc
	jEq7q+wykcyzivJc9wztEuCF5wSFuZQGR9ZU86yB8UdNnTCIV1TrirOmxdeztMm8juoKWkN/ljF
	wrSzQthLDYABEtO42bzwRnZ7XHS0lchQ4sKT0kU3f5f/XuuPNyxYrop6t7DRR8dsByWJITPsoV0
	aTlo0b6bC4NXiBh6dDJ78b7CpfBbyy2ab7rGpyXtPl/Ge1AjP3GHMJS0KfQFfV0bAYr71Pza98k
	Wfjbks7pvI0PwmFj2i/mtrWnDFG4PAG9nwzOnjtN1V1BGpuqkGs0T9YQR0kNnczH98KZTDKEpC+
	tzFJhWPAMaiqbrIyxQaIUL2JHncw4sG1nWcj3KWDRrQSNQSPvFQ28gAQHYg+LYg==
X-Received: by 2002:a05:620a:2682:b0:949:671a:cc77 with SMTP id af79cd13be357-949b34035a5mr1661822685a.1.1795363765163;
        Sun, 22 Nov 2026 08:09:25 -0800 (PST)
X-Received: by 2002:a05:620a:2682:b0:949:671a:cc77 with SMTP id af79cd13be357-949b34035a5mr1661816685a.1.1795363764668;
        Sun, 22 Nov 2026 08:09:24 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884911e3sm320526755e9.6.2026.11.22.08.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:09:23 -0800 (PST)
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
Subject: [PATCH net-next 2/2] dt-bindings: net: dsa: Flag unexpected ethernet ports
Date: Sun, 22 Nov 2026 17:09:09 +0100
Message-ID: <20261122160907.200727-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122160907.200727-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261122160907.200727-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6422; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=reMATxFxVxRB+raQ83jYfeaAK2V6mtUNc6Wp2ta7pEM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrAxOkOJWDsz07omJXLZhaMWPp6woHPL8+pCClu
 +kZC4bdMluJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawMTpAAKCRDBN2bmhouD
 1xQIEACaFedbtKzfFmbnBJcFU8CEz4FyuAcxxPgxdFqxRqpIg1xHeRGybC4E37WJVdFmDXL+IiM
 FZdr8VzQM8M2DA6tywEWp/eKIa0cZKVKpdARltyyNDRG/YtWqJgjc5BMnYxsVAqb7Vo6kjQr5Vm
 9nVSouM8M+29Ue122ZMOG4/rUOQog384qunka/dtrk8IysLT+e6UvBvHLsiPuA95hYzqS9KOVzL
 3VHZybyVb6e2m2Y/r7XzFzlhR5H0EDq7gJ5NJy8MOG15tAcJ+TU3plPFRbtBjkSOB7i8Ubysvhr
 xUQCrae3P5pSL4fWowBqQNdGvP3fPkhgA+w5tyOvHSAdCed5brmxQdvHogqCW4+KCWT+PWfpMQH
 R7E1iMnrzjWZp2X9SbexuwXUPfw2orGQ5jZJslTL6ODd8dCeVJ/YuYRvCAVsGKviS5w5MsmZY3z
 r5KeZ3KftGG2iI7ViBELF45gUtCNed55Qf+zyf4tmwZzBmPz7BisgagXHW2QHhCdw/R6L3sid4m
 HnJPr8+IH6gyV7s8rtUJVLJImgJ495iS9vziAi328myZSRS3NjFllSR3IYkdwjgnXOHgWtYTbau
 4GUlpviCm+QmtNUAHyKzm7LGUNZsQzrtIigRBlx2oqktTVRCSLB7mGcLj6/GlI8SrWpa+q7CJCW LmkHerMGT7PwnEg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXx8n/+7nEcgQN
 Jb70e7x8WQW84BPQ0yqk8QXZxH0KWDM31/4FLkqtNvXfwl7izAkiMsiNp7RZTiK49AGvUcTBUJt
 aQrFg9iYhaA8H3x89+IsilSMjjr0ELttujeIi6TFiIGTX8PLQOxrCYVZz4Bp0+8MLrtVVJaoGJl
 aLJvZ7AfpxwrMNPQpq+N0uauAa7lDWI5/9OybGH9AvH+jOq9/kb1GsUbakHvjEtPPIB4d19GhWe
 R5nWwHdS79vDrahG+llW10I4riyfJdI+Z3E6n+ijD1sUZkzTJ2fxgoncmJncMaPECLos2LdalWW
 S6OSXJ1uTUyrXGl4ytGlCkg1QD4/jVgB+R9QstmHMn0engLFYK1sjsZDHpxlxO0nhb4Y5Owle+J
 0OTN+rlPcs/QPMRjHnQhbTdFlDxqp3eOQ2xSPLmj+0WcZzkzWjMqcXlNNCPqLNX1xUtabCsba42
 JOSGuhcfqUWChy0TO9A==
X-Proofpoint-ORIG-GUID: eLqkHyWVTinBHDujFhRH1k0mW1VGg4fY
X-Proofpoint-GUID: eLqkHyWVTinBHDujFhRH1k0mW1VGg4fY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX/4G7/scUtGAb
 Qf/UC+B0CpmxFgxCFTZhDU2hj0gkow2k8S5tgY6L3uUFSHAmGpGTOCvCe3uyIlvgUaSMmLQnhRa
 mViMOCiZP0coRz0ZjVz+wsF6lBWnG1o=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b0313b6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=DPh3dRPQxyF78rqZMbEA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Bindings which reference dsa.yaml ports and restrict their own
ports to specific subset (e.g. with pattern "^(ethernet-)?port@[0-6]$")
actually silently allow ports with any unit address, because they use
"additionalProperties: true".  These additional ports are incorrect and
should be flagged by the schema.  Solve this by dropping the unit
address from the pattern completely and adding proper constrain on the
'reg' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/net/dsa/lantiq,gswip.yaml        | 4 +++-
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml     | 9 +++++----
 .../devicetree/bindings/net/dsa/microchip,ksz.yaml       | 4 +++-
 .../devicetree/bindings/net/dsa/microchip,lan937x.yaml   | 7 ++++++-
 .../bindings/net/dsa/microchip,lan96455s-switch.yaml     | 6 +++++-
 Documentation/devicetree/bindings/net/dsa/qca8k.yaml     | 4 +++-
 6 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml b/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
index 89f78a1bc113..83cdd6c80d09 100644
--- a/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml
@@ -108,13 +108,15 @@ patternProperties:
   "^(ethernet-)?ports$":
     type: object
     patternProperties:
-      "^(ethernet-)?port@[0-6]$":
+      "^(ethernet-)?port@":
         $ref: dsa-port.yaml#
         allOf:
           - $ref: /schemas/phy/phy-common-props.yaml#
         unevaluatedProperties: false
 
         properties:
+          reg:
+            maximum: 6
           maxlinear,slew-rate-txc:
             $ref: /schemas/types.yaml#/definitions/uint32
             enum: [0, 1]
diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 90b3582b7619..80cda7ec5cb6 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -179,12 +179,13 @@ patternProperties:
     additionalProperties: true
 
     patternProperties:
-      "^(ethernet-)?port@[0-6]$":
+      "^(ethernet-)?port@":
         type: object
         additionalProperties: true
 
         properties:
           reg:
+            maximum: 6
             description:
               Port address described must be 5 or 6 for CPU port and from 0 to 5
               for user ports.
@@ -208,7 +209,7 @@ $defs:
     patternProperties:
       "^(ethernet-)?ports$":
         patternProperties:
-          "^(ethernet-)?port@[0-6]$":
+          "^(ethernet-)?port@":
             if:
               required: [ ethernet ]
             then:
@@ -220,7 +221,7 @@ $defs:
     patternProperties:
       "^(ethernet-)?ports$":
         patternProperties:
-          "^(ethernet-)?port@[0-6]$":
+          "^(ethernet-)?port@":
             if:
               required: [ ethernet ]
             then:
@@ -246,7 +247,7 @@ $defs:
     patternProperties:
       "^(ethernet-)?ports$":
         patternProperties:
-          "^(ethernet-)?port@[0-6]$":
+          "^(ethernet-)?port@":
             if:
               required: [ ethernet ]
             then:
diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
index 4ed13870ed3a..9cc14aa7b4b1 100644
--- a/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/microchip,ksz.yaml
@@ -129,10 +129,12 @@ allOf:
       patternProperties:
         "^(ethernet-)?ports$":
           patternProperties:
-            "^(ethernet-)?port@[0-2]$":
+            "^(ethernet-)?port@":
               $ref: dsa-port.yaml#
               unevaluatedProperties: false
               properties:
+                reg:
+                  maximum: 2
                 microchip,rmii-clk-internal:
                   $ref: /schemas/types.yaml#/definitions/flag
                   description:
diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
index 9973d64f15a7..36a7c81df747 100644
--- a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
@@ -39,7 +39,12 @@ patternProperties:
   "^(ethernet-)?ports$":
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-7]$":
+      "^(ethernet-)?port@":
+        type: object
+        properties:
+          reg:
+            maximum: 7
+
         allOf:
           - if:
               properties:
diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml
index 517bc4c00de3..17e3c00f5a32 100644
--- a/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan96455s-switch.yaml
@@ -105,11 +105,15 @@ properties:
     type: object
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-8]$":
+      "^(ethernet-)?port@":
         type: object
         description: Ethernet switch ports
         additionalProperties: true
 
+        properties:
+          reg:
+            maximum: 8
+
         allOf:
           - if:
               properties:
diff --git a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
index 167398ab253a..3840b336bdb9 100644
--- a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
@@ -75,13 +75,15 @@ patternProperties:
     type: object
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-6]$":
+      "^(ethernet-)?port@":
         type: object
         description: Ethernet switch ports
 
         $ref: dsa-port.yaml#
 
         properties:
+          reg:
+            maximum: 6
           qca,sgmii-rxclk-falling-edge:
             $ref: /schemas/types.yaml#/definitions/flag
             description:
-- 
2.53.0

