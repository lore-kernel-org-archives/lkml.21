Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510406;
	b=VEVK0BWoZ4lK501dTuOCjkDGUDyfywFlBjyXE5MgB7vaEMmWJpiNZY4mXFIMMSzAu23z
	 u/Lx6pq2gWQucl9Zb5SHhRhEBX5hjEWPOjEmsKsjrj+9vqDb601cygKD7f9EUGl68gXkp
	 z+NXzP3E55tSYpBuPkR6sH/ZnuHe8CGhgVSHGRmYwU+2C8Fa3H4SWgMNjI1/h/PysAomW
	 qJ5ca2kEK87/qpEYskGmQ/Ey5/BEJ3tn5ZbZ99+7HbKDvKTvNfmdxQhlgBM+V4OIWy32+
	 NTuGLdYexi13rdNbZ5srAFVi2cO1e38roas1WkYr450rguEA/IbmGt9d/tY5ztAMuaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510406;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CQ1Jnl9WpIeR0ueGSV00aaS8i1VRkjGVw741YTuD/Jg=;
	b=aFGoY5lSjCgOJRBh86ijjvUOyesfilcCTEQfRhVS2YllnIbRkmqGOEY8SHoIhURpcpqb
	 TxrU6B1WfIdcVSid+sOv7D2baO6VoC3soWmrkLLKGXvAWyDX4Pd8WLYDzJCh8BHmwGcSx
	 BBwrJ0n8Xb3DYOJa3GEXf7Sqf785UTDpXg3gso3Bll92sO/O0V55glVdUcLGaid4Lll/A
	 bN/X+amnSPAzCCM0OmcRV1b+cupDmyFjOeKTfyUsaukOw4Pw8u9QogJE1uiJTmkoOj5n4
	 VO44auF1iH5fLqG2YWawFKBRC+Fwr55964fq0lGNuG2G5Z0eD7HI2DlXfxnQCruBLbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxJUvYyU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XEXP7fvo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE21B60A2616
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE21B60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gxJUvYyU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XEXP7fvo
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8NEbC196969
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CQ1Jnl9WpIeR0ueGSV00aaS8i1VRkjGVw741YTuD/Jg=; b=gxJUvYyUhv/RRlw0
	R39BOGparYm+4e6TxR4VPLqDmpkNuScZnJqr+9uTcR8ddE6DOcvSmu4RxJmLRTmp
	WYUInxgNABQ7oyKTRCRjBP5HIaoqOfIfGG/xHI7p6/2yIEv33srbhBSLDmT87y1u
	tM+NhB/CHR0qyz1rUo0r3TrKccnr2bEaqCIJHKuNrmGRKIXbISD6KLe506ArHUcy
	9QNvMoMZRNV1BF5kUsFf4VRm4E29OVrgJymaYb2g+UWOv80Cbd6Ph2ZsKISSyfxo
	OQWTIYGzP8ZEYmHcM+K01RMZsvHjEHF3bGxmo/RDdupRQqWmDHSqLLCIqxuBxgTV
	cvrr2g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukraqbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:53:24 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3a348a6dbso2584060c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795510404; x=1796115204; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQ1Jnl9WpIeR0ueGSV00aaS8i1VRkjGVw741YTuD/Jg=;
        b=XEXP7fvolTO5PrvpjZl6ahoBsl8kaGO0zrvn8Q4HFwXWMrqjK3ZCVcKylVKK5ZxQMS
         22LmrynI5zofwDPAdGvCWTlPG4YXHlCf74kXBdmxR625+k0LrFImsgftQXwkBcbD3FKz
         YMS2tv5u4CscPhofdb5RK4XwwdMd7E9VO6DWckPXqlH19I/tFGAUpFTidSaU26LLKhCt
         Prr/HvklLsitszXhbFIvAPA30omVBMVbvZrxziUSAWy5Wwbjb16SHP6s00JAMaTZIf1q
         24ka/beT71zYO9y6Z+Cbm3POG2a5rvLrGbHhRftmJQHGqmY2rVbgnj1hWYgO3jGGjyZK
         H8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510404; x=1796115204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQ1Jnl9WpIeR0ueGSV00aaS8i1VRkjGVw741YTuD/Jg=;
        b=L/p2x2cZBP9ktVwNXoSVv+NFOXi3gkgdTcWQhNWemBBPj7NZSkmydMGW+KN8LHY87/
         vdrK2LbArfUuA3BP7kkiQnm62FRV+wwPSt4sqELmf96ZZDmPmih2vPWkQMsgz6S4/VNp
         OEuC/TwjfC+CBH4tO0oIbMU0PT74VaFqYvbw5rXzOc0UbfSxWMq8Ndl4Njz9Y1tlh005
         VRogvSGL0i+cWvEunZv+ZB/GNAY9eFe2DJkgN82pCJOybbWqsXGXCeRYl8Vpk+dkx4xv
         ZPC/BvA3fyQhyIaaQF4kzOrzAv9Fzihyj0zpttu2NQ0lGYO9UfVpeVYOdlPcw0uucNC7
         AJSw==
X-Forwarded-Encrypted: i=1; AL+hErE8MtzL68vLaBBmkQe24wvVVbS26NBGxvdmHhyiyhDK129AudbzpeoX+ZZePh8NfiLdXb+KLYVO0DEq9Aw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+a/2rSnATe6MTb+dhqb5Vk+E6U9PtKVrihRjNUolzUJblPqe7P
	H+xGyhH7cADceGAigYeHchVJ0SYtSKSarXX/XUuvxFU+5RYpSdInrEMhUbhDb7COdjTV9QtdXBh
	7KAWHzKMZv8ZKhvus7GUC9r9woR+9JLpgxq8/VxN27JHm0wxMUDc91qRfJLViHvZXk2bXaEeA99
	c=
X-Gm-Gg: AZFdTZc0LtuJfyI2vBk0p6rRu+1r1tVn+xXCdq6cbiFq1jU/GtpzJ0WkUob8/MouWLA
	rVRfPg+mg0B44v6Jm1JDtFQ9FzvBbFJBDZnDujb+qpQ2jiPCEqxqqAK3KAcu/jfMTNTgXlQkaB8
	OpffKNwaotvvTeTyMqh2OvW74SherV5HMCFuPVv3QejJS82ozUFEttcsJMoakPON5n/xVoU5QrC
	VzylxFdVKY+rXmJNEj4LDD+0dDBaPqZs33V51wyJjRd6j5OlFkBjJsWm8Shofd+hQ2pV1QMaiOm
	2iAFM8w/nXYWHIObrzJ2/1Rd/FPjnujk/zn1uXvdWxU7KiV1ZoZLyd4fXdIWJYMLr/Rp/cc94I8
	g0083Ppg4wHkENZ0Z6dOTK3Sj/t6SKw1RpXIEC1thx/1Gn1RBl1veRFvU1kxQ3FP2g/VhLEjlln
	Q6dA==
X-Received: by 2002:a05:701a:cc84:10b0:1b5:709f:d510 with SMTP id a92af1059eb24-1b5709fd63fmr6813640c88.22.1795510404074;
        Tue, 24 Nov 2026 00:53:24 -0800 (PST)
X-Received: by 2002:a05:701a:cc84:10b0:1b5:709f:d510 with SMTP id a92af1059eb24-1b5709fd63fmr6813611c88.22.1795510403539;
        Tue, 24 Nov 2026 00:53:23 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm21748199c88.4.2026.11.24.00.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:53:23 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:23:07 +0530
Subject: [PATCH v3 3/4] dt-bindings: usb: cypress,cypd4226: Add
 orientation-gpios property
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
Message-Id: <20261124-ucsi-ccg-cc-orientation-v3-3-73cd114e5393@oss.qualcomm.com>
References: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
In-Reply-To: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akash Kumar <akash.kumar@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX6SIsyPDS/GrL
 TEpvnVSjSRFJVscIqG8cSzn5m+zbATOJCN/T472lo/lyIzj/PprGPZwhPDzGBsWpF/YMnGRtGxV
 nuss+uWiUCvMzObhNeY2D3m8ac4WrIc=
X-Proofpoint-ORIG-GUID: MTmDIQ_LzFSSzQM0gUAkH2rc19nCPUWw
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b055084 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=kY59nFXYWS7NJFzbzp4A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX3EgVyKsFdi92
 CgXLnZPDKlctrDyPrJikl6FgnqFM4ZbgFFpOo0V2qCzO8UrygAb1xdZWPLOA7u2RSt+r3mSXvIA
 llHJDga5fzvRezcAX2pCvctRWXueyVPK+zsU7mmLWrgVnYRarC9jr31524e4otlRorQ1bjjsxb2
 6giVb7rS7uvtfnn0tFRBbDK1vCYFNjS59vPAG+JzV3e9X+TcU+ZgnGwgkt7deJFzTuZo4jQTZCS
 XPFqTfiFzfvCRjbFDNxfewUgWRPPfxSFsF7BPVqKHAAnfTxvybZIq6vqJPEFyWTPlnMLmicHuuJ
 QH+rbFiMQRs/lL8Rezqte5uW7t2Rf9uV633zdU9q+aanfouJfr0BIb354v82o4MerdrTeXBOwpk
 xboI1cVlFZwtJ2qWEk0jLgWRuCW1TK964WPV7kLfddKf7FW2uBI9/953O1JXm//Gr3g1Tp2GIo9
 BRpSrju8CYfFZ1JW2fQ==
X-Proofpoint-GUID: MTmDIQ_LzFSSzQM0gUAkH2rc19nCPUWw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240034

Add the optional orientation-gpios property, used to sense the CC
orientation of each Type-C connector on boards where the CCGx chip
has no HPI register exposing CC polarity. Entries are ordered by
connector number; an entry may be left as <0> for connectors with no
sense line.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
index d923ef82ecfa..298afd2542d0 100644
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
+            orientation-gpios = <0>, <&tlmm 137 GPIO_ACTIVE_HIGH>;
 
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.43.0

