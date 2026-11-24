Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510394;
	b=ZhBG2aBlUQvDGuekW0JYdAXPfFHoQ0b9O9v1LqTOhIX6cApoLss99dvHmVzR6O/tT5at
	 1FPjgDNfef5qxedOtf9ar2q7z6QLydOQMbGD3AY5StOFaAg/KNiXgpXdRthbycjgij1P9
	 a/Nuw72wjSRnaJXe4Gq4LtWeLwoHey04ZxXOHMoJ2s4R4Yl2tDrqRRsycpTzvl7Z99gT0
	 3669u8wSLvZpeavugwvU3gR/fnWVduZbOH9NSdRooiBaErjGvTsu5t+UwLPI+pGZq8TAB
	 tYW+FMXmwOCU+ZzZjHUhGr2e9KGmc12wrQJ63atv8vInrxqFWX4VD/ul2jRLRXW8Sqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510394;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pPB/pY1wBFYHBoSZtQOu6aF2n7Jg61R8iKYjc9ctqQY=;
	b=YaqrghQD4NbdMNlGhwgjSHhlOA4DAJHFTOl4H9zmiYxkxrMKVYrzt+arbWB2dTYX824X
	 lec4gixDsBOgy5M6xde36PtzgX+ehw54tri6MF9+y+RgLtWJWACD+DZxfcquYoWfWfaAs
	 X1iim1E7Rtv+UL/uADBfqA0+WeguUj2m5KEUJmtQTIFEDxU+2wd+IveYnEZCZYrwtwmn8
	 XUoQlRTaoQPhKMr0FudVpgBkfofGP7pcJxUI9pX1GmYzOZrBSZLQM2wlykoMXJtiNRL9Z
	 xM9VLjivxztzRy54qyR9E/bbb5CaJfFFkGLEwP3qPvhiTwA+fKe/5X29PmQB2fWudbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bJ6o/gTn";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RpCN+Uaw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7865A606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7865A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bJ6o/gTn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RpCN+Uaw
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8c0mV196968
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pPB/pY1wBFYHBoSZtQOu6a
	F2n7Jg61R8iKYjc9ctqQY=; b=bJ6o/gTnyN1WGmqBTB39xjNeMfyaiToNWmvP0J
	YE6zAJFpWAVftPrcZw6bTvSQR7CoV6SEELsYiI+LwU4BKIV1wQBCyus6hxL12ipN
	O7G0Oz2bC0wdbXq8wDd77LrLrhfk3RLAJi8KQHH6mZCUO+iLXwmKIY6HD5VhAxYm
	ex5Jg3N15qv3HAR3oxYQgfsmwx8wep+3NjjL50nrgQ74C8j06+1Tj5ILK318rs/n
	GMTAbu+7IPi4LVQGBn6BfywtSrQMjXLM/FcCDOmTN1Fb/TxGHOq8ObM5LU4T3cOr
	la/2pZSX1mX3p9VkuM0rgPepZ6Pbc8gkInEUBbRR74H5F56Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukraqam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:53:12 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so4177877c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795510392; x=1796115192; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pPB/pY1wBFYHBoSZtQOu6aF2n7Jg61R8iKYjc9ctqQY=;
        b=RpCN+Uaw07VKnBSsoGVpPtYvNnlJVG/MiPxocXCFODm063iEE43ngJ2pa5dg6NS4lr
         VT4nzn4l+877/cQide/fZE58LAu3AXQjJzQQbLsqQ+lm6ndWxKmJLH+5Afn82Yetf1oo
         7pjdYjAq+DAU8gxqtGETwkwND1WKZWpXpifqmi/NbiGBMZWGWb8GUmoBPEmp5HysPark
         B0KixO18I/0zHK+rgdCx/VY1A6sXsJiVb9fHvKFY0p7Mo94o/GHiSTnZttSGZGkXcXkK
         Uh2MDyOHAB5nVz4S0azrKAdi1ISLKEv64/+0un/L93e7/hUZYQ+xVAYJNiBrbQ2Jj3EJ
         KotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510392; x=1796115192;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pPB/pY1wBFYHBoSZtQOu6aF2n7Jg61R8iKYjc9ctqQY=;
        b=DbDD+xTivvN/1AKZQH3c2rhYc0pgjUSnsVWhsunkPWMhMl/ramKS8eze067hbJv3vb
         9Qs3UcPLH964zqEVOgLbsuOCSQRQMBUNGhbtCcPIbuqRgkt7uV0YrPhfzqYTorBCq0Uv
         oVqNeeC0GctjER/gVLXspy3U4TnVn5MUHxzGyuLILNWl/BWQGlpQgLvFfKXU6Pf8v1Mn
         i/YPBZ3QHF4sEOtdeTV5INwmR1smVs0NQLqfdEjlifeoCIqZ9KskdpQsrhoC4gY9+B9S
         JBwdzLuvhZbIhgW9GgZZzGWh0ruu5gryJjrzsrJYjY/KlS1tGWT5Cu3Q60ZXXTGYk+Rk
         W7QQ==
X-Forwarded-Encrypted: i=1; AL+hErF/OHCA5vx6K6sgDKseJCLopO85gIiR8re0e0rsOMnt3jCYpMfxpLwmSiXRCuUoYbRPW+sKochizJXIDpA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oVXSUuMvCojPz78CN9YwduIOsRx2gmcGU6HHXM42yI0wwRXqX
	ijlaHKlDJCiRNeE8FM9e9EDmBBgzOvjGE8Y+vbq+g4G6/8pUzD0h6ss5ih0Bg/Qco4VU9BYCiBA
	1hLCKdlJ4z4BL2Tid1+Usly3modQHckssYtxxs2b/KZuEym3jMGsS5mvSwD+j30u18xc=
X-Gm-Gg: AZFdTZe5J18f6wE3W8AM9JTd+9Rn5HAD9OrWYFvvAj8oN9gJUL+f79LS7zICpFzo0xO
	C/e7JFnrajeKzeKy3wEae09hiQOcIBbI4P+ogo2GSjUE2XMdUjYhIab5I+v/dhp9Igsn6PpnoCw
	d5+ZP0yU/TIZR3UOotUxzlgGV0+abAa2xm2oZ90PyShHAAwNV6Jd/1lVxvTLEm574S/13VFLfQz
	rOS5wmR+hvU8BAHuksO4IQKWdBUkoEV45js9u74ZOvisGM2Jd5Vvdgc8t1Hil6cDpj9hxoNUzCZ
	H7T0VZr1Xk+0rKM1IN5Nmv3Iou4fIs/u5qgp0S+Nysh/5GtORAE3IQDZk5jgllDYrS+T+/kedn+
	1TH1Fd4huzOWewZiU42bUGD9Fp6SNV7GNbriMSao/ztjdZIkEbvXsZEML22dETMBxP0o6344iv3
	ZVXA==
X-Received: by 2002:a05:7022:295:10b0:183:e993:7901 with SMTP id a92af1059eb24-1b556898be9mr13386980c88.17.1795510391706;
        Tue, 24 Nov 2026 00:53:11 -0800 (PST)
X-Received: by 2002:a05:7022:295:10b0:183:e993:7901 with SMTP id a92af1059eb24-1b556898be9mr13386962c88.17.1795510391060;
        Tue, 24 Nov 2026 00:53:11 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm21748199c88.4.2026.11.24.00.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:53:10 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Subject: [PATCH v3 0/4] usb: typec: ucsi_ccg: Add cypd6129/cypd6229 support
 and CC orientation sensing via GPIO
Date: Tue, 24 Nov 2026 14:23:04 +0530
Message-Id: <20261124-ucsi-ccg-cc-orientation-v3-0-73cd114e5393@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHBQBWsC/42NwQrDIAxAf2V4nkUjrbDT/mPsYDVthbWuamWj9
 N+X9jzYDgm8wHtZWcLoMbHLaWURi08+TATqfGJ2MFOP3DtiBgIaKaXmi02eW9vT8EDqlE0mh1u
 nEECia1TNyH5G7PzrKN/uxINPOcT38ajI/fq7WSQX3IiuFTVY3Vl3nbOv5sU8bBjHihbb0wX+z
 AHlAFWtGyMltvpLbtu2DyXf0uUUAQAA
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfX4xM95UZh0fyX
 RLKAYEBcd3e8L5PCyE7CD2OQRVXUK0xBhE6WFSV0veFzkdNw57bP+O4MTPAG0Rdv8C5E9fvW2Lv
 ABlyybLlxdLQqHyXHAu8y2nJuXbk4WQ=
X-Proofpoint-ORIG-GUID: k181Ungjj74BWUP4wH2JS8UZbLJ0YpEV
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b055078 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ag1SF4gXAAAA:8 a=Ikd4Dj_1AAAA:8
 a=QyXUC8HyAAAA:8 a=dyAbrUdNo5FzdgMbFM0A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNCBTYWx0ZWRfXygu5l2A0c37R
 Bb8gmTmReYWV0UKubfLVKPz6S6f2CkLiLNPCVTk7HyauWnUW4afdJQ6F5USQVEKTr+3jJsIF2yC
 rRwC97+FBi3QEWhcMVN9LcSVETWRXebTW4+LhY1ruaRNP9Iyosg0sfqdRNVHW8bGjhA+3G+FRJ7
 aMBjEGTOwZ0gl+xU+dXivhtDYMuaa3LoyeKOkKyWuo5F7bHmaxCXTuLeW3pD8Yar3L0153UL/cB
 yPqdhqDYt+rbr7pWNeg9TSp5BIITqN17fIFnPAWlyRlDiF1//bncpwLqEfmV8A4ACrnjrgvSPTp
 nHnTvldBMBDVsAtbXYawHN6FrY3Lms1Tls47FRikD66tWOCER31DLenJ8ervSJF+OVL6PnMV5xm
 H+aO9k5W6yT75e5gMiC5jpjSjam8sdGtAwLDrSGU/COcybnhfD9Kj1ybbzPDibtKOrILZ1tR1u8
 ehVjdfGYKLhTx0itxTA==
X-Proofpoint-GUID: k181Ungjj74BWUP4wH2JS8UZbLJ0YpEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240034

This series adds support for the Cypress cypd6129/cypd6229 dual
Type-C PD controllers (same I2C-controlled interface as cypd4226) to
the dt-bindings and ucsi_ccg driver, plus an optional
orientation-gpios property so boards without an HPI CC-polarity
register can still report Type-C connector orientation to the typec
class through typec_set_orientation().

Patches 1-2 (cypd6129/cypd6229 support) were previously reviewed and
carried as a standalone dependency for this series; folding them in
here so the whole stack goes out together.

Patch 1 extends the cypd4226 binding to cover cypd6129/cypd6229.

Patch 2 adds the corresponding of_device_id entries in ucsi_ccg.

Patch 3 documents the new orientation-gpios property on
cypress,cypd4226.yaml, ordered by connector number (an entry may be
left as <0> for connectors with no sense line).

Patch 4 wires it up in ucsi_ccg: acquire an optional GPIO per
connector in probe(), indexed by the connector's reg property, and
use it from new update_connector/connector_status UCSI ops to set
typec_cap.orientation_aware and drive typec_set_orientation().

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Wayne Chang <waynec@nvidia.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>

Changes in v3:
- Folded the previously-separate cypd6129/cypd6229 dt-bindings and
  ucsi_ccg of_device_id patches into this series (now 4 patches
  instead of 2), so the whole stack is reviewed and merged together.
- Fixed the orientation-gpios example in cypress,cypd4226.yaml: the
  GPIO specifier used a literal placeholder pin number ("XX")
  instead of a real pin number, which broke 'make dt_binding_check'
  (dtc lexer error parsing the example dts).
- Link to v2: https://lore.kernel.org/r/20261117-ucsi-ccg-cc-orientation-v2-0-2e3576a11eb7@qti.qualcomm.com

Changes in v2:
- Correct sender/author identity to akash.kumar@oss.qualcomm.com
  (no functional changes)
- Link to v1: https://lore.kernel.org/r/20261117-ucsi-ccg-cc-orientation-v1-0-a0fb052c7fcd@qti.qualcomm.com

---
Akash Kumar (4):
      dt-bindings: usb: cypress,cypd4226: Add cypd6129/cypd6229 support
      usb: typec: ucsi_ccg: Add cypd6129/cypd6229 OF device IDs
      dt-bindings: usb: cypress,cypd4226: Add orientation-gpios property
      usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO

---
Akash Kumar (4):
      dt-bindings: usb: cypress,cypd4226: Add cypd6129/cypd6229 support
      usb: typec: ucsi_ccg: Add cypd6129/cypd6229 OF device IDs
      dt-bindings: usb: cypress,cypd4226: Add orientation-gpios property
      usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO

 .../devicetree/bindings/usb/cypress,cypd4226.yaml  | 100 +++++++++++++++++++--
 drivers/usb/typec/ucsi/ucsi_ccg.c                  |  79 +++++++++++++++-
 2 files changed, 171 insertions(+), 8 deletions(-)
---
base-commit: 8e31dedb9ad496ea7dd7064d77d6f7d459c1c90f
change-id: 20261117-ucsi-ccg-cc-orientation-cd3e221ed635

Best regards,
-- 
Akash Kumar <akash.kumar@oss.qualcomm.com>

