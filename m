Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517726;
	b=FQGFK/CHI+2tfkYr4WlYPCBnqWlpGQZ/IAvASgUArPe9c2u76IosVGCrhe7ryoSLuorQ
	 AgU+57AePF6XuotnvFciN7rSPbptdjA76k3o5HWjS8KM66vxW5LpVD3Z1zkIvLT+Ikx6H
	 03qxgKuMg1LM+Nxz5TBJzTqQFiGaa4p/uIew9QRw5foCxWTmvv3Waix2MDygpipT9E/xl
	 FbmOJSl+Qo7QgnuW+VB2+64TrRKXJ5S30Y6Y4wXhwNPEPmxRgwzWj339LWWnM6LeFyUep
	 e67+LcrFXqQpSB+CKHOsOGKVewwMjEKNC+QcFziMwWBsTycMXv93btax5oVLM6hQB4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517726;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N0eRXtNM8GKuA4yhRQycWGozRJkP3Y6KyDWRFYaD6z4=;
	b=AP/7CfX0++h/LMKmecyY5HStUv/ot+2JfD4YfdIdhxdWhnHT2a1il3N5TupkHzN3F+Ej
	 yJowpk2mBOGqVWoGDVu7YqtNnTxD6/y7/OAKQxVIqJGMd4sIvhtsxgYJQ2vWcsgncRvha
	 3XAaWDIeoT0G0PAe8/E9hlznyLj04wgQ4bIb08/inNFzPiS6DwOp5XWq05HlpDA+296gX
	 9OqOxsDCj0qxLxFyxaj5I9d9SA7ZSIlCKW1rbd3Wqsq/IU+UM95Y7eaocfCV6N+0XjCon
	 YWTo33aqp32iKdKT5P+ytkcruF02H+1qilBZY88gr87cd/1r/bguYocvr9mscUWNjRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CroK9pDc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O8svVxjy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAEC606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CAEC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CroK9pDc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O8svVxjy
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8JrAY3225364
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N0eRXtNM8GK
	uA4yhRQycWGozRJkP3Y6KyDWRFYaD6z4=; b=CroK9pDcO8dt14BJKKlzJ0ZnHzc
	s+9BoOdw9hKJJWfeqR6pbkrX8SJ4xve3wLDzhDXNpO5u0+FN80yHc6stMLmLaV47
	cIlE4AdBWmp9EHIqpt230iw9Nq+8VWtkbDmEjx8Ujqusi8cwWg59rqrmomJ41vBI
	aXempHHldje5r6r7MepoifCGHyIb6G0g7H55eXbMZ4ee2mfK6xxhC6tODOdLN73Y
	1Uiegty1CgGZt/Fu5NmWNnHS/XImYz0biKcZWHHif7l1lSbG/K4neWHJTkk5o/rY
	Yc9OdP0IbydQCHEK3cdKunzJCfBQWNcieEZKcT7vnrKrzTe8eMrjArZDxvA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f2nfh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:55:25 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so2327866c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517724; x=1796122524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0eRXtNM8GKuA4yhRQycWGozRJkP3Y6KyDWRFYaD6z4=;
        b=O8svVxjyb52ZaKM0NLZReXUFdUVUrZovTMz7bcN0JW3cESkeXs6wre5piyWlFKEh/A
         5LX3jcdJnP9l5jwPGBwsup9NWdBJCP9WT/DRGrSfGMNcnxb4UroL3VKPcf5uVClsuVBC
         Q9xnpejdJk3+y3tdKBU+GO5HJW3BlS8Ue5s0lurzNS2EWlE3mBLKOBRMRIEmtenUH1g4
         vR7Jel95DU+PSVVyJrKNnbMquMZJQnpU1gxALbXSR3tiMUY3RSH49mpRDM54NOayVIe/
         7wz58bl+t8FFUEFKYTVWwJXVRmjHY4HEivd6McPY9T4rcb2yPOEPZiaqko3BNd1O3UL5
         jwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517724; x=1796122524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N0eRXtNM8GKuA4yhRQycWGozRJkP3Y6KyDWRFYaD6z4=;
        b=rh3Vhy3tQoI5b1fCXoTfI7wc0HDquO9otSi4UFDDwcC0WfDDlNWvEu2f53RZc/J6vz
         5rBoL31IZ0nNZE1B7TW6+dwulb1aevb8LAkfvJ11iA3aZyYEiMwbLdL+RCvncLcFEyze
         O6BVWEEgUzNG6w02u3uLMrcnTnR+/3uzsaENKo7d/ahZxtm5ZPuJ14v7VSvoeCgdbV0B
         EBu/CSFlP2QZBIp+gpFewgBWzhrebqUQQjHQ0Zqbxaibmva92u0Yu2PMfMMEilNXZHtu
         mu3a5T5trA4kM17huXXr74sMe72owE68d8VhSUwC6H2HYZskrj9Gu1uplmRQKDrStTDy
         Ffog==
X-Forwarded-Encrypted: i=1; AL+hErG08ovNZD0kPnySKtAIMpiQQCip6UeEIljIgGbNc6dspwlrQqrbTTRRWkmYGe6XGUquj+uKlvE0ssgxftE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EEvhYR5B/myoGx31QGOhsM+/E6cj4e3AZ+FuhP9Q6Hqq3Pym1
	/TZb3yMlV6oZchcI+VK5PMHEJ3w4lPMTGyB91Qf/Mxvcb0fixHwsAfqAyJPZptFdwv8QuqBIwFB
	WuXwRcfp8ieHQK/cUqly9E2lEz5len45m1XPuyrcKBQBTOzz6g9A20M49ceJqaVIZgu0=
X-Gm-Gg: AZFdTZdzcUiQBPfDKKoX2xnUSOvnhYsaHihiDR4MOnDqFcbTPMxhuAwMDJk3RmAXh+4
	T5D1f6wwUo4/L1b7Hu/N2EHMtSJBxQLJA1GpF1bbiUIJae1dvLhjRjSxNPk9p7f9fIMOiQ3g+7n
	je3IOL43HmT4NcGVJXoBj/oXQNS8fTfnBe8VNe+e6hkAuBmJFCpAiv1P55jkdkRDFR3nE6shOWX
	dXNAar3uv+yBMR1bsrv/pxjmdTaGKo+JMl5hGwo6XVO4nBz+qSZKur88yy2lnv7BmHHOVkqhIyQ
	PjAb14woL06qilbKnRcQ7d5rcRl331PMIndI5LO/xPWGa3bzwIrA08OjdxrZdsY1aM+AQ1K16TI
	8qmKew5UreSD8QStBKZM4O5MMCkDkCGzRnZSedXCr/eHGegR1ahWLwDv2EAxRpLk8N8l7rD02Px
	ZHbmu+YBC2TwtnHUThJLt3dukKNEV2WNIhhJatXIdoZs8cFJCR2SKaQlsj
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr13709692c88.22.1795517724508;
        Tue, 24 Nov 2026 02:55:24 -0800 (PST)
X-Received: by 2002:a05:7022:290:b0:1b5:dc3:209b with SMTP id a92af1059eb24-1b5568ac6b0mr13709670c88.22.1795517724031;
        Tue, 24 Nov 2026 02:55:24 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm22616418c88.4.2026.11.24.02.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:55:23 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add Seca Ride board
Date: Tue, 24 Nov 2026 16:25:09 +0530
Message-ID: <845a24c91ea424ff30faa8e1d357c326eda2e5ba.1795517711.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795517711.git.yadu.mg@oss.qualcomm.com>
References: <cover.1795517711.git.yadu.mg@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXxInwerhvS+yK
 B3wxfBDpubNnAzuYbam/8iD0sMDTlbgR87j/h78nQ6z2nhMYgbAw1+6o4WHWxuvIw+MvWRnJZan
 pwxDkt+tATVzm/3HKmTP1buczCsZsrg=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b056d1d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ZyRZhyG5ClUV-WacA0AA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: a40lUl1hdq0l3tImkmGAJtCjWZCUEblX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX5Vu61iN846J4
 JDfkpGinYFaPqmnrC4U6Ne7evpG6p1JfSOzUOKggWm7OaSqznYsTW50yrYw3yFKwzBpdTg0pCLP
 3UsTyJMVTgbdTFUUuazGsJodrFLNJ658z8TAmx+i3FtCLquGy8x36KUHNwmB2cjmpCJucLwIBxt
 njBFjZ48mcPqlhVs8z6mOkdD+tZHSxrKSNpYTnWBFzAefPk+bWL+E1/HUE6YebJU/09njLjTgPX
 9TCOQvoOWCsBtH+65gR9l3RTiHHG+kgrYPiRRArqYFl8rq5uUpH4bsqt7e5lRH/Z+s8GdZNWUXx
 PXXyuQ1kFyG+otMod94pPMJTuTZXtkFe0XFphOFS9v9YGw5+j1hP2WL9akAxQLrltb7gCymNxAW
 kiPViyLRHUInQQbHMD8jNyvWusPmeAsuOl1aTuTjjHuyfSXRZwWGkv+UQFupzJ2ckWLBw2LVaz9
 8BSqVO5c+ADETFIhV5w==
X-Proofpoint-ORIG-GUID: a40lUl1hdq0l3tImkmGAJtCjWZCUEblX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Seca is a Qualcomm automotive SoC. Document the Seca Ride reference
board, which is built on the SecaAU GearVM variant of the SoC where
platform resources are managed by firmware through SCMI. The board
compatible therefore uses the "secaau" prefix, with "qcom,seca" as the
SoC fallback.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index a7157795870c..ba5dea9b0560 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1091,6 +1091,11 @@ properties:
               - qcom,sdx75-idp
           - const: qcom,sdx75
 
+      - items:
+          - enum:
+              - qcom,secaau-ride
+          - const: qcom,seca
+
       - items:
           - enum:
               - oneplus,billie2
-- 
2.43.0

