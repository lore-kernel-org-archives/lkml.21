Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517633;
	b=BOWxFvEPeBJVClMEoQ0acHRSODcfoC3UbD8dzW8eVkLu63yacto2xyZ+Sw2l0jzwY9nn
	 Ol71z52nzEnr4Tg+tPg8+2yaAo/PNtBOQpXvHHYq8WJ+eA9ouS3B5/KMArfJFwr+ezhzt
	 HU6QrLQGxrOJxOzAghmHlL4wRZXVKfBVLbwRkcmaZFv7E2MX3T0/Vwm+1OFyFHMVl9X67
	 iIXgAh699c7Ih5jEpYuKfW7YN7VznSnwfRkHFLNsaIu3knmOrWCGZe0PoDfwYx+l5t17b
	 LQ7BPdUS153aumFaM2VJrbAh3llf0/g4gWufDJAko9dW2Xt2V43FiRxwzKw3VUzL0/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517633;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bJSBeVd1nmd59BdEQIYSOqfgRiLbrJL6a61eSr7kRh4=;
	b=Il9w2IkXnQaCL45OpQ4JClZJ5I0reHbNESxJObmMBR2CKFKjuiMcVki3f7Um8YmXhPYN
	 sua7em1SK0wusNBNAQQp/12FcTM14cyuhwfwXR/4RIC2ewgKtzNm3SLtDa5e0htOFxqR0
	 CUHZO6zBaAiKil/lN6/j1PrGzX6yeu4YpsD1QlaQdG4oul43g22YQEtBU7vgowaThKtJq
	 UeN46s219GnCQzjLeitR9LnITDYu3VWrcn5VBrwHtO/6o1Uku6cgasTufNmJdr8nfM5IQ
	 Eo+RwelsNrXo3hoAzbYhQPJyoidJmSHT0L7VYS3TIEcCOrz18YOjc3dSJ3AUE9gl0ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D8mEi16O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="b/1Oxouf";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A904606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A904606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D8mEi16O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b/1Oxouf
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8e2Fd646678
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bJSBeVd1nmd59BdEQIYSOqfgRiLbrJL6a61
	eSr7kRh4=; b=D8mEi16OhT1h9GVI9NJ/ER+82d6UcxApLEMRZ24FmkqgGIGpktZ
	dhso8bPlYZ1orj79vUVVYQfZO6lF3FuPVfTW5nfSJE1sapBkUYgMqCAwCyIonQOt
	2aNMteg6WueYDNEE4M7t+WNSwBX8B8r8Dim6vyDW8t0OQgHoem31nH0nSxwOBGvS
	/P5G+yRSbN/g9/MHIm7zu4F8r3jvqpDQlGINv9vCIwoBGpXncclyYuXK/JFRTYQT
	uz4W8vLOoYOjnfBNlXGw+mComUeucBTwZMp1xGy8ymzbu5Gnehc3K1lP6Yq/wPKC
	jWMkqJ/CdveuYvoLzT8fg+xMe34qZoc9EyA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd2am9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:53:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso5018246eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517630; x=1796122430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bJSBeVd1nmd59BdEQIYSOqfgRiLbrJL6a61eSr7kRh4=;
        b=b/1OxoufCS8VBmvOSexD6teNvc5t5Vt3xW9oUeh8r0ARbrUA22zSYmrq3gKaS3RW2s
         qL5bfc5M47yQqch/UL58IpGr5hjHDcZb5bBIArKaK3MHWuIYR+6tcp0VPy5ofhnQsKD/
         Oe0f2GgKB0GU+axTbpvA+GyJz7FabOjlIyvJbVVG2nvqcauHJVEcVauAuAAcM4jnPiDq
         bwNI5/ssuZs9gSZD/4ko9hNvayq3+iNXp0b4wPGHoQrIZXTSkse/Ba3tlCyp4gklcLR9
         JuRdBQJ/DnvoNtkRA8xzplKAbjEQ4ZMLUbVm557whsqYvRIr20hOqIthflSuCuyGNMtC
         z+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517630; x=1796122430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJSBeVd1nmd59BdEQIYSOqfgRiLbrJL6a61eSr7kRh4=;
        b=JsWaL0CiWdnTaFmIkWxrFPQ6ZT0guAp0VsLmlPwmjMIiF4NWBfiozIGOvV1sZJh0/a
         CU4nXkLjsCXglV6ALXf8dymWz79psNYXueO0tWlUQomAtIC2oIdgVnLWfwXC0Fsn4GCm
         bAPlMg59XU04Pf9VBC40Aok7VQKdxbWKyVJWxG7Aq0tGN7MKGdkwf85FeqPKyXO9lPyu
         ajuxR6uMPAcVISRJ2VfFr6z5PgDGnQtr+OQGmsc9zjxt8so6Ha1j1IvQfVzoGHo1HN8w
         7DAewp4w/aVE7THbxS66GeXTjoTUIKL8pqzpcSwKtWGyGNoFi5C/uotQVl0hRvjohp18
         BBbQ==
X-Forwarded-Encrypted: i=1; AL+hErEeggTMzKEpQFyKR/gepTTMIBeHJ4gg9T8/VQ81orp7sZtmRLP4+aOCzEE7BdJrIPk02JRq2r3gtZG93Mw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f5FD5YSweDNUI5EThzktP4PoQiT+CnTQknz81M0hMBuEPKwZV
	dJO06ZmewZ0c6bILjDFxwHzVA4dQUsnr/ki+NsP4M8eHPcfOwK1AwZBshOVjat2N2cWhUKna4gC
	bogjAH28IselvuoHbR2U44l4ayoQS7fJDOLOF5LrY+0DZAOMWPErKIn8wzfuY1BhGDwY=
X-Gm-Gg: AZFdTZdG8ubJILyzgg7lpcSnY91OpGOIKfa9K71grfrevI9bnaFNCQ0HmqFb81z2SE9
	N8fPr0+VhCEK1IhlZ7J4sfQBNDWDssvIESSgLm9MKdkTYap4AXRM1CRkhP2TJU844fm36q4tXt5
	LDPXRwq3VuBZVxBy/6mRMjO76lwZsqy8NBUZVYzcAal6I5s0pp+Djbcup+EsDcBdcK7Pgx1/Eve
	fUlrr420lUkmQ9OF3FRwgtxaZyVWlCCIdlKEzTNE3dm6r+g/uMn+BdLFsFkY37pzunaUzci/U+8
	LdDckMNVvHjHoQ0cj1fy1O15PKWPoovSNVhfs8HhL0Scsqr0jfOmelWHOSOasB+KPTQVqZcUNt6
	4P1AgYjkQSJ8rsYoaYTesFfRb7BDMk+P8quJALBxjyOxTBQFDCbXNe/JnlAEsBDQeRm+hDg0aFL
	opIXL2BKfJOZuS6LTPMfFmm86NMPJhMQi1zGk9dz9cHEWxSamfIUuyEKM=
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr15017996eec.36.1795517630115;
        Tue, 24 Nov 2026 02:53:50 -0800 (PST)
X-Received: by 2002:a05:7301:6908:b0:382:f0d4:1e77 with SMTP id 5a478bee46e88-38571219f03mr15017970eec.36.1795517629438;
        Tue, 24 Nov 2026 02:53:49 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm46282021eec.6.2026.11.24.02.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:53:49 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mailbox: Add Seca CPUCP mailbox compatible
Date: Tue, 24 Nov 2026 16:23:37 +0530
Message-ID: <5bfd311f596ea5945b7c2251199d2d0ccff41133.1795517617.git.yadu.mg@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b056cbf cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX/yNpjWjO8l0U
 leTrqbqrNnCXDJliX824buRjTksM2w758IivZ9XJ4g2DVDzrQY94KIrwUbyzOpBwYUe2tY4deev
 k26DbIhDkCIlUkuEwc22SqCsDWQ4JAX5q8Zc5Qjo1tYC5kb7P/bHaq1HgqEIvoVz0yFVlB1lsPI
 5eTAvDh6Du1R+BMjz5FYXBrBWXP8h5/88dEWq4sdQp/GsuM/uYOMsRumWPsiSLbrBFAa4RKs7jl
 WSKM5hfF9EiJ7eQ0AQEEDK6Pq79/UKen+tX7Cgll4eZJ5fXnRmdxg4F5fp37TScc5dFHyAU5uOa
 8F+DjEN+uKQQA9tlqXRJBvxQr5pk+rS0wyUDvD+Y8vHFfd3xC4IL55Mr16GVlzpGbKIH79ZYenH
 02p6T3BWzmk07asfak2hBkwuDiZOgP+ffpGxbqdjgftsr17gqRpnJH/xJUgePKBToHPqgIIWrcU
 aO6oAvdAbsz7ImKtFyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX8MjDlB8CwJT8
 7Sp2tME+89HEIg1dK3G8e6eC1V393FTN/bF3rxfYLzPJQ0OXPy3vBUbBBFVPVhCtypGNj0nruFF
 TsixJBYxERJoMbRUgL1dey/ThnNqs5c=
X-Proofpoint-ORIG-GUID: xFKCtvA5TdyN8wz8B1zX5-SxshxfaOPh
X-Proofpoint-GUID: xFKCtvA5TdyN8wz8B1zX5-SxshxfaOPh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add qcom,seca-cpucp-mbox compatible for the CPUSS Control Processor
(CPUCP) mailbox on the Qualcomm Seca SoC. The Seca CPUCP mailbox is
programming compatible with the Nord one, including its channel count,
so describe it with qcom,nord-cpucp-mbox as its fallback.

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
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 2185920e1b5d..4e0527203e5b 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -16,6 +16,9 @@ description:
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: qcom,seca-cpucp-mbox
+          - const: qcom,nord-cpucp-mbox
       - items:
           - enum:
               - qcom,glymur-cpucp-mbox

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

