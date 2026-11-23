Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425036;
	b=U+upHQ4z3LzZEp3MhjqHAStNqG/j9usCOOq2X97V3qWgvgA33EQN9+E2vgObKw5bBYHm
	 kmf2VJZRCq/xXOc/etXE2+k8f3B5S891Bw2b6QtMPkPN/JBDQ8C9TRjY3Ckw9FLJWJtVG
	 QubWAjRuTwqkKEGcfRLob5xVt5T5oqk83/xOVStAdhYqZkQCmYlgM6rqk+gPW/Y1/sYnj
	 N3a5rSH8fXPHhnKbWrjpKzbXEb7AjipV4YYJWQnq0wUjjPyXNKQN8np2gNy3c6vO78KLu
	 wMCk/Gk1zDafgzi1JDE8t83fP0j/OcrFMdZV5k1BB5RyrSFO8/5E8BHTDmpkzHnMZHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bEFV+1B8rKYypxbhkr0bp5aOlzPIcTu7b/tbBgs2mgQ=;
	b=wqC2xJ4DyQHqykULGEttG5hkn4j1OumkOQ7/Ce19NEymdFVXj1z3ShlU9MFDJUCS5z9k
	 6XwdKYcDuE3OrSccDNw5MZU3GYXcMDBi9HtQN30bhu451dFIMswzQukbaN6JFNoNSnfad
	 kswK7C3YPaZ2BNvw976z7PRlKyy1WwydvNnqqEuWSCB7tITLhkNX3DmWdYvwCI0rO1GQq
	 kKFpnqCYT+dNHMHpd9zolzmLb+F44c3c3A3xFxwKhAc57cyvdOynIbInLoD54mXxKalV/
	 AX786uTiDo3NXnkdI+H3zPY0EMWmeqO4XYXvoCQqogqfcfijEmJbvE6h772w4W7348A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pC3tPOtG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R61Dmwgt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF29606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CF29606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pC3tPOtG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R61Dmwgt
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6PMZl3712507
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bEFV+1B8rKY
	ypxbhkr0bp5aOlzPIcTu7b/tbBgs2mgQ=; b=pC3tPOtGbJr7Gnzvnr2IUGdZWHS
	f96cQLRFXBf+RPxdpXEsipNm1ljDqUEFm7d6qv8fk+7MPJYfNKVk3E8IAUnuSa1o
	njUDZOyJm5UiHK0nxhi27pqAd8YWc8h/itjKM2KpRu0uQBlD1XBqldrNfa/C63OU
	5yzSWH71R86HyipHyU4aYCO/F1jnAmEuqPLyaawnWyV2N3rE+FDK6A7jZOtOa2QS
	6cHQDp1xDCIQ39ZgoO8iJvSudtK/fs5MFpIy/4PIW6FfwyTa2S7iRaMcFMdV38Un
	rnk63GkW/vdgcW02twbk9LPYBmqXUzm6cPNfG49RKLYF8ttINIt6+8r4VOw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g740m01-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:10:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so3523921eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795425034; x=1796029834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEFV+1B8rKYypxbhkr0bp5aOlzPIcTu7b/tbBgs2mgQ=;
        b=R61DmwgtWjbUCjFlrYqTErf8DuccdGimjPJaezallQBJuzZJks2QNszrotyFhP/MAm
         XnlgsoHOnk0VeQXADXYmInVZWbiFTzBSCAQoTLfe/+cw8Y3FiAC2AGUFwBiznkJK81yv
         3hE8s+tlMvakl8GKSBqq3/8Tq8zr1kF8RccKwDtFfSwGVT9U3pjoTNmR7wTsf2xu9X4m
         eifwXSdk96aLmMIjG8yidkwVZNk0qNrta7bJSuapRJ3BHDeOaTi6xMPxcy0L8D8lSiO2
         gAMuIgmOXgfhjpRdGCHH3mgAX42y84FwItCLUblbk2pFoKxtju+dsiUbG2800f0w9n1m
         aGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425034; x=1796029834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEFV+1B8rKYypxbhkr0bp5aOlzPIcTu7b/tbBgs2mgQ=;
        b=hpSDKiXQM2dFgs18vyFKGM00Uxmc9Qah8gM5x4DXDPEgZ1tCh7T4nzztnWNkJEXgll
         uRRjcdGkj5APVc0RO9iXmcKfhxDYZxzloNRdJHe4mBTSVt6mImKLTGoveX/e2yr1Okap
         06KpDi6os9h+LPajeVe/fRmjtQv5uF6Pa7FmsaesshCEmmMDHTdTVpYnuMff/F4ai1Hb
         Oa/xuZdfeNbQfQQDu+yPYjfawPICp0P3C1+24rtmYXDnglBbvj+iVte8/5McbNPdGCWt
         ICWZ7HxUC7TvdtrWhWCXgIOpEA1EscCBihoLeki+AWpdSq1dmrDDU324aEF0TwW0Gn4H
         naZA==
X-Forwarded-Encrypted: i=1; AL+hErF5e2Yp4aimrlvluYNYKv5zP1xnZ/cFyOYH2jx/WECIcczdSeXp2zU7ySUXBECVRqhbO93vXVqHAvie/Yo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bXLMtaWtD7EZQcmIT/mfugiLQqRu6x6B0gTHs9/t3xKWcOFON
	tMrB+u4HplP+4ig9waNWCDHliGQ7z4EwzLZHgtPDDv22NnxBO323hW6kKw5yxzxwfjHEaLDj3uJ
	Sh1Ja/PANvbD4kL6mxvxpOKQKFLP2m5aiXbO/xDkNaYCSqzwR1Umd6yIGRVaKeuQ0fvc=
X-Gm-Gg: AZFdTZcfT0jnpxxPBRVjBbUDYj6sfV2wEazulKkXWjRXRtwEPB+b6C2dWvfjaA5X9O1
	ai5HMgLQMvZg9n/U2SM7J7g7kBhOZDZKDUaKwriI6N6tPOhA292isiNzJCo7bO0VXmqvy/uUJBP
	d5afsbQ9ZaPP2oxaBPHY+nYyWIBw20xROUDa4dTijwp9qui0ukxT0lJG4CpLZCWnmqmS2JfoibJ
	wkoNSx2ImpGm0A9zqJKhaW75eHuj5Q+KOcDFzvriElJJcFn9Jb92J5V/3CSP2yCLnkbwEIFXtUo
	1XefVfAV1OBvs7qJUi0c4jnrnmYBeoGV+0zaQCjF2FedSHh3ErTPa1q+hX8TPeFzEYa6Lje+1zD
	+Sdm6/T46fsYpyTRZmSuV5yxYGX3r0jV5RJF7GpVGKay+MqZYZJV9jRG7QOIiDR+oGgmCNdmxM+
	GB0w==
X-Received: by 2002:a05:7300:50fa:b0:383:9f52:e54d with SMTP id 5a478bee46e88-3856ff52e83mr12610660eec.8.1795425033550;
        Mon, 23 Nov 2026 01:10:33 -0800 (PST)
X-Received: by 2002:a05:7300:50fa:b0:383:9f52:e54d with SMTP id 5a478bee46e88-3856ff52e83mr12610639eec.8.1795425032934;
        Mon, 23 Nov 2026 01:10:32 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm58687105eec.3.2026.11.23.01.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:10:32 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: usb: cypress,cypd4226: Add orientation-gpios property
Date: Mon, 23 Nov 2026 14:40:23 +0530
Message-ID: <20261123091024.2214918-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123091024.2214918-1-akash.kumar@oss.qualcomm.com>
References: <20261123091024.2214918-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-GUID: 7fobsGHIxuVHIvabNgwIroRz2Z5zkt3q
X-Proofpoint-ORIG-GUID: 7fobsGHIxuVHIvabNgwIroRz2Z5zkt3q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfXzTdLiaV+q7+T
 L7BlllDXUTOG/U+2mrdX+mRBGHzcYWxZyjUv2w8ntCj2GjJrkmZNWsKNQtPBPNQrdM8oYpLU/nb
 tueyTf8UooLPqhLWp5GPd/OVDa0gDRs=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b04030a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=kY59nFXYWS7NJFzbzp4A:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNiBTYWx0ZWRfX9Zu696WBGdOl
 ZMcuJ+//YQc/f0PiGfF68TGtIqJRt3h3dCLJqHm9k9LY4QhlVXSkCYUfkhaA56nBY4MSRSRIko8
 5Jm9aLYuh+ujZep+2BKlTaWpxS6rqrtn4uNScBJHf/zD5IPuI32RigjIHW3e26IUYxw6km6qRsd
 uCIWUstqFc2vJENe2AmSRcw4y7mPatjDMNAsycOW8AFBfywm1kOBFzVLS+SGb7ncUO5FJN6om5A
 m3GFWQReoCU3M4Y+7/jV2EKMWX4JQv6+JbnxhH6uGPlfcsjBmgm1k1Vdt8L+VN0DnrUwsYJnJkX
 G1faKtuXXFfo5tyU+CtFC8oLn6hfHfLAoj3+dfWlxONk8GmtKnwrAPKGvIKvKlJJRVtOHHhanW7
 RfEEIjB2kkHDCnnLYVHbfkieSQBogzSD9EDeUYHca6sgJorz0A74LmGoczVAFwULSJVcV5iJtRe
 rqyai1HR2iAmGP41xmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230036

Add the optional orientation-gpios property, used to sense the CC
orientation of each Type-C connector on boards where the CCGx chip
has no HPI register exposing CC polarity. Entries are ordered by
connector number; an entry may be left as <0> for connectors with no
sense line.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/cypress,cypd4226.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
index d923ef82ecfa..5716c045d87e 100644
--- a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
+++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
@@ -59,6 +59,14 @@ properties:
     description: enable IRQ remote wakeup, see power/wakeup-source.txt
     type: boolean
 
+  orientation-gpios:
+    description:
+      GPIOs used to sense the CC orientation of each Type-C connector.
+      Entries are ordered by connector number, i.e. the first entry
+      corresponds to connector@0 and the second to connector@1.
+    minItems: 1
+    maxItems: 2
+
 patternProperties:
   '^connector@[01]$':
     $ref: /schemas/connector/usb-connector.yaml#
@@ -129,6 +137,7 @@ examples:
       };
     };
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     i2c {
         #address-cells = <1>;
@@ -141,6 +150,7 @@ examples:
             pinctrl-0 = <&usb0_intr_state>;
             pinctrl-names = "default";
             wakeup-source;
+            orientation-gpios = <0>, <&tlmm XX GPIO_ACTIVE_HIGH>;
 
             #address-cells = <1>;
             #size-cells = <0>;
-- 
2.43.0

