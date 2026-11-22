Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364099;
	b=CfxAio/AvdTPcqbzgoP89X81fUb0D/kWAdGMdblnPpgaoXnPwdqlvPjVS17EgPclAByv
	 golWjrIkQbnHbY9A052yPLwJ3GjWeDxe9BZSuJL8HlZoE1si2RY+VinIYWze1GG/3IfNm
	 lWJ3Nb8dwjJEpQB99Zyorx7cg0h29w0P9i1qAudcNsc78T1lZ+io8DfRXSGRPyPOE9Lgo
	 6gCgP/OdbKT6A9GsERBaKliImRD0VYP6LqIGV4TOqTkrgJArqMOsVqenRGyWNtCwuvYa1
	 0kL6QPONgnWKDsXG8cGGtH3btO9dHHB+DpdowQzLTRGDEnBePdfFhhW1ardAFnENZDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364099;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sdHfAwVsSM3RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=;
	b=NPW+oRNZGCFnsrD3h0jc21ZBq8krmcsDZIaIevhgT3J0C5l+RN4rutEFdffeDS27HkOt
	 IUYmXDqqVUfPZiFwLSJXsB/7SHmwq+jA/z4ToYtYynXD2mgSYHi0wefb0WGhxagHwR17c
	 +FJwvLZC40rZgA+WFb30qJZsXIAW3N96dcuNRgZIYP6LsKFAlmBakfh7jk9Tv7qkZ18Tf
	 c/8vKRSSj/uqKnvpVJz2OeYjRlSVY2Aa3PpwZj0oyMlSIL8zGkKUYduF+sN8ipG/m9Wnv
	 SWhODbePq7Dx1uS9vC5HuT5PIvpfs5r+PIDTVb3+7oT7PM26y4noWRkVQjB056Oi9tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pv5rWnXA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WCVDwtzr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D079A60A2619
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D079A60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pv5rWnXA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WCVDwtzr
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQfMX3853291
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sdHfAwVsSM3
	RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=; b=Pv5rWnXAOHiOMlusuRf6oQBoUF0
	hB7OVlCxAnYy2lRljKUro/mpgAsVeECe8RggnmLu9tQ/X9NPOp6JDokaAl4OgDMm
	0bLYWY0BUWcIF6mTWM2dTXUIYsIp7LEuLImMooQBdP+01nve5feol4hEITT94kPz
	9cbowoOZ5o6xLqlWRyfXYly+B1XFmqpmfaaZIH6bUDXHqfCwSTSQUpOwD1assI30
	MORj/NWCfD1JI+Sy4/Z7WbXLoauyE7+1dnKpms1ivyT+EOraS4Zt5+heUn2f3p+o
	FJ+dWX5o6MmuxNW620OUWUrkCLImb1XAH+Rp7dm5w1hJI2mVb16jwq9Ze1A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu3r05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:14:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so435122485a.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364097; x=1795968897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sdHfAwVsSM3RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=;
        b=WCVDwtzrOWwN+i89thKUuaWZlcr4KKpHIF0zmVvqXx1QCUQkZtUB7gBHJ2rBY2Qd1v
         ShA4FUdfa7KZA7yeGsbLuUxmbrdEwdYchuO7n5m2iZ30q0ym6RixIhTi6otASUwEcuid
         uELuMGY4pS5ruxiJ5/DH7pRnK/F50ZQ4C1lfBEAldMKJ1qgDbApCfLDFd1Jtoi/c5ARF
         ScxGdmYaU3M8na62UcWrznmlRFD047N0Qlu9uKbr5C6kIn5MilfaOO1J/2lfHiYJ79NP
         m/ejPbfVnpJKtocYLEDY8aO2FzW+VwqKPR6teIRJDkYRiVRIPBaY0dyuVaGKn5at+CuB
         GmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364097; x=1795968897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sdHfAwVsSM3RcFXjJBfo1djxmQ4t9JJY0AduxKTzTBY=;
        b=n3Qy+psRuh6YQxDN5JJChVK1P93VRgKy9yG/HCQW49lUif2YForez8PFwazmMqodJp
         HjLrg4MZZkP+R/J1aKKF1K9rqE2fPVWhH84E2N0ztuhgNNPePBqTO2NhgNANGbbcxHTy
         dHaxQoIlpGqLia1pK9gZEnb8cLjdhriHMbN+oHHv4AaNED+jtYr/eDbSWMigS7CHn25n
         9cyfDj8mCh9oi1cXzyOYDJ7h/le7HULjQ4rSgM+KBCJKDX7o2bFM3dMB+W+nz2v10N9M
         K60LcuVoFS8C7GcrYfoOC1LPCib0dDOYxVNBFVi0XTL05JBM/NQmFsOZiZmFDV8iIqKw
         ZduQ==
X-Forwarded-Encrypted: i=1; AL+hErEprrullFV9PQmcAFVJR7ndNSXoYMV6vkF6aSfnQXglxHZY/W5yvuT6JkmUY02AfBnHH6oxO01NxcZr/8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z+ItMOA7R/PBVK2J/UjZqGQzSjlWGa4h8OadieURKN+FqXDMh
	3Zb/ckO10FzMmtWi4BUXmjZWZ4YpF/PSteiUPb0dC5o2yjpX1JdJjYFN97dVZcquG8sPuxAwdvx
	bycaB0s4X5H4GLBJYC0FOpGXe5DSFwv6ChcaSkFLt2TqoLcIfjOB+l//N/QUqaHp3/9Y=
X-Gm-Gg: AZFdTZd8G3GgYmBq/Tob0ln7Fs71WQI99CNGSWfNH/+EeSst9Aau6yu7O7wMi0BLlXx
	/ZbzIi9/QTkodCTEWtnVSAlQA3ZJwp7PPYH+c4pgW7N1wDB9TN251kUe5gOTdsGvYdxkxEc2ejo
	d04LBmb5H2psN0abCJJV967lI8FcEPcAR/ZOIEFhl+FMS3z1M2ztb6ZrcyTx5rLVlh4rwC8xVi8
	WX/ztRcqkzW2+Cl6acW3cHGF+OeawHl4UooXgQM6xAuKUae2R8L19chDYOHmw86E8cZH3TJ5Dx8
	hhxs8Tl52NPdDueJNjuYyTaBidfm6bWtDGgs3muBrLpr82UTUSIIzkK1SBS1tdheOkIKOjhYDqg
	88OBs1ZHyT4ZGjPF+v6FkNTI1VIwIg+fyYTg2Z8u3Cy/BZdH+6VM/bUdb32coJTma
X-Received: by 2002:a05:620a:4403:b0:93c:7f48:8f46 with SMTP id af79cd13be357-949ba7e2b4dmr1532057685a.4.1795364097188;
        Sun, 22 Nov 2026 08:14:57 -0800 (PST)
X-Received: by 2002:a05:620a:4403:b0:93c:7f48:8f46 with SMTP id af79cd13be357-949ba7e2b4dmr1532053785a.4.1795364096750;
        Sun, 22 Nov 2026 08:14:56 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:56 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 05/24] ASoC: dt-bindings: qcom,wsa8840: allow one sound DAI cell
Date: Sun, 22 Nov 2026 16:14:18 +0000
Message-ID: <20261122161437.5994-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: A6wsYAxQJ-zEt3oZCGFoMjhoTwn5bdTd
X-Proofpoint-ORIG-GUID: A6wsYAxQJ-zEt3oZCGFoMjhoTwn5bdTd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX2UXYD16vSwiO
 7z8atOwosfvgaAzv9Q7DAkes5vO1tPYECphlEn6t/aMsVQMhMBBoK8PAQAbLcbzNB/E5Sfc5COl
 V0BFJGYBd5ndf0j5PXPY81N2quEO2yt7f87eUwLGxwnNdbtDn1IP6La9rGLtO4zN4xvIREESr+R
 3pe+FIE3FrHSNtu7QBSD5XcG5NkgY/vaFCFObjpBVA0ZiaKtodko1ujL9LxuVxYfQWIWmt3Vj4t
 QVZk8u3zwnmjTdjyvaD/YzDj8XRVJKS9s9RurzIB2pfGNuZ+A/IKizNumDnS6ZJWlYT9tVxTbi4
 JdBKLqgc382IRDhreRGZr+n0rDqv+Yz5A3QODYz9B29W7gnuDc0vNwRahZOAWIgFjxX5IzcvHcB
 yGgtxXI9kMNF8oLBWxAKr5Wm/MeLuvM3XHKDzmq+ue0CRUCo45twjgRRSfie3Z8vuQ3sHWha3TR
 g569POUavIExAk+1hxQ==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b031501 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=kSI3p4Jxhxt2vPjtXf4A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX5Xiuly+Xl29J
 9T2IcuevHJGEq51fMnPutQWYDD1gfXPGhPJOwrE84812TGKBnlYHyV/XcCFfP0uxaaEk4q580Pd
 2GTRzygRu1pIWr940xBRIjGQFFHkM9A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>

The codec now has a VI sense capture DAI next to the playback DAI, so
boards which wire up speaker protection need to address them separately.
Allow '#sound-dai-cells' to be 1 for those, keeping 0 valid for the
boards which only use playback.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index 866c5e780fb0..42ae6d60a874 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -41,7 +41,10 @@ properties:
     maxItems: 6
 
   '#sound-dai-cells':
-    const: 0
+    enum: [0, 1]
+    description:
+      Must be 1 on boards which use the VI sense capture DAI, so that the
+      playback and capture DAIs can be addressed separately.
 
   vdd-1p8-supply: true
   vdd-io-supply: true
-- 
2.53.0

