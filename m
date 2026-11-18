Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989738;
	b=DcSQ6UwS+fBSeeKlUyJf+WRrkG0oHwt/EQcFFUUVyaz3e5bB3MjGDiiGGoEnp8dghv/6
	 aZW/E9sixkBKyRMrEzM86tLB5yOS33kkmhWG+x7NKZu1Y8lzDkbaaevQ3X7IPZpH+d3o5
	 NGjblPCU1eXQuw6fOT0FI7yQizdVn4a2uUucGqF+U/GVbIHU+iaF7W8eGO5cUU4/y9V0S
	 wu0sPBvyndcPzXxaMYc03pjafWXV1KEItF6UWymgR1YYPo0I6n6dCkxeqfSimyWsY8Na5
	 qkQ1HA77kB2Bp+12afHPADnL4LNGidns84QuyGVYqXDmqfm42t4LmQb6BqagQvbm0WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989738;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
	b=sfA4zJT+PZUUykUvZfE7nGXpi8izobHVnDxeDxX9zotsCFtC9pjv7hQzjfXCHxAQb+Tq
	 6urYQeuFW2W70eW9RBCMwfWeRix1pKNL9DYny9QqL6rqn9dRBNvyLIEc23cK0O358favh
	 qQ2FQt4eNyhSch3CipO8OzLCeE2ZnYdqryUtkOSZpByslth3m5BU+uVM6McBbprl7k8sr
	 An3ro00vfeDUYSsBf+DFhD99DDLAo9saYG8m4wnvHnuHEKYsg0xPmQuemWVSOzO0kdYP5
	 sqAnmS/fN7W7LkYn8k4aOh49zUrN8n8qzI1lAdt49ILbGQfePlmrC59G4qRtVz6/KuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hsav1JFm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mhtt8hqw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70854606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70854606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hsav1JFm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mhtt8hqw
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2UmPV3371225
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=; b=Hsav1JFm+eHuNh9f
	ltj6VIwk0l+z5kUBBl1BWoPUOHlFmLfmwQyiu+IjbCvP3mS8nLsSfApZOi96G2tz
	uXfGsZZxV3ZSS6R8/WRHgGZfRG7g7EodUaFkvRzfLnqY8XpuYgvCXZfUHjUIGuij
	eCCvsrmbjydv1hOStFf86yWFhIlVS3hPgYvoZVilK2Ushp5b0HJJdUPIN0TopjGN
	3a8dFQyS1LXWdSHe7nmEgW2dd9ofSMRVQjeqjRh2H1oz+u3LpMxsdxiBORvNXFyz
	KMaH76bOnpyvZQJxFJqUg78UOBUoOFBia8/CKzqnxohESC3krJAR5cyIecHsrhqH
	aE762w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8syeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:15:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so560467a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794989737; x=1795594537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=Mhtt8hqwmoKKIEt6PPzflC3Oqbme8g8TxxPOJkIZPobD9Em2cnfjjKOtkWHl55I1Ph
         gJdB3vQslQJrUPLoWaT9uOzwEdLgQjvK1B/L4weoLkl1PF12IyhaibytyJFLoKl5LADw
         hfRZ1vsbGdOWmisGvNWwwoupNcLx1teCiHtPW4xa/JJIxKCS3w7KBLs6FjE5ti6VzGC1
         NUiya1cS671Tbdb4iZPUFQdF/NOLy8j0CRZxkF7wQxTawcW2/g4umPJ2GcnHzlhlAkXu
         dYHjRx+ph9PIWJ/XXJKYbmNF7l4FOAXY/LJSXVXctPHi4JNDEqTN54Ove2mJqXc/tX9K
         xqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989737; x=1795594537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=cIL35bafbDDqY1zV5QAm30Rlmgs/O4sjp/4cUCECWQ4pOuAGdUwj/JMV2deuv6BACr
         KMGOdENs036lcek4JDlnfo0Ncuz33FP06ueMvBOA15JeCbqIIbhEwOyjKVoqohdCGQse
         nPrLAeIbfA7fAXCSpRJnB1pMeCXkH8bRPSh6F6+dVnXOPxKJqwlu0dNv9E5TaF6oe8FS
         XqRwh1PQpkT24cox4/zXqSB5FurlsZk/I38/sESESmOcgTIMDA7NDNZVc2CkWLSxDCIe
         7yPY2VJ2NgmWxdPXqzxunbbKKv865oB88FJGIhjNGJ/cplOYZ9gZPvq21tQ02s3l0IVd
         1FFA==
X-Forwarded-Encrypted: i=1; AL+hErFdH7yOdCqV0zf4gzy17z9KM3N7hzQE2M0nGsTvtaDN0EazbRSImzCOerGDsIr3cTUagP+mjg7YolKPwoI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8psuk/erLNb9DSW0CUqfVxdrxf8Gz40Y9nmWMm8AYfAuWX3urO
	Qpwe1yotWHCCU7P3a+AgaX0A1n2WHOA9Ob627bxhfSW+x5VzdNTQKQiFu4pEANN+/Cc0z1liebN
	dfIV1IpT5wwcj9j4sXcbzYbzFNYY4xnCUmCYfSk071+PjgZJsSu+2dxt44/fPccG9+9Y=
X-Gm-Gg: AZFdTZeRrB5sL+ySk7CmYC8smy4q9OjRX1Gn0tTEMZ/Yoqm+aPqCSQ0Uv3VMJBWehLK
	idtt2bNHfUhmc7ds/2NfaegrSzn1UrmO79GeS8MzmFGoO6O2Ir98gVLqOd3R15gWp3dVGVykrfp
	rldM8e1e1zOBjYPi5BKZ9qIyFSl6G/AN6hmGnbqBOiS/8EcbYdlhfEK5onr1prnqQn1Ep2Yb0QL
	Htlkq3PVngvd2tLtY7w7fhTMl2WdujeV8+y+hm2wSxvR6OrXd/KLAvMLAotCF59QooqCHH7Z1uZ
	0bWvBib61TTNf6MWWQmYFR2s/L28jf/DcS3qoUVA2lMmrh3U6FNmSrBTK0rVxz/9czya2RjGy3n
	5iJ0H2vYRLlLyGcELd3Xa8JePxobxzji4o9HpI6xczRp8hbYFpt6NMqU5YYWGYcRlCcOflSawAC
	Quq9QOOb6l43oueBfUs8iPl6v+8A8DeTrtoeM2nca5BQzTUxXPy7sBCvz0inYDMjS2iO7boMU5G
	Q==
X-Received: by 2002:a17:90b:1a8a:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b3d07a2098mr1995830a91.10.1794989736713;
        Wed, 18 Nov 2026 00:15:36 -0800 (PST)
X-Received: by 2002:a17:90b:1a8a:b0:3b0:a3eb:759d with SMTP id 98e67ed59e1d1-3b3d07a2098mr1995795a91.10.1794989736199;
        Wed, 18 Nov 2026 00:15:36 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b5e8asm3369181a91.8.2026.11.18.00.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:15:35 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 13:45:24 +0530
Subject: [PATCH ath-next v3 01/15] dt-bindings: net: wireless: add ath12k
 wifi device QCN9575
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v3-1-9875d2a3953f@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v3-0-9875d2a3953f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afd5ea9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cIo56A7EWjM9ht75lhUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: GoTVurQNYSwdlrLdg2crOmVbEpURzurV
X-Proofpoint-ORIG-GUID: GoTVurQNYSwdlrLdg2crOmVbEpURzurV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfX97XCdi2XcI1T
 WbwvfSGAHANey7RlIEhCOJqvYbwtHW+1UeHyvy4Z3KrAcIr0kYnuCNDsX6fe7tNuJpHSvl6926m
 Ibzrf3MSBzUlH7V7N6HIZKQ4HCeRi6ppa6CrbkqkmlHn70ytdSKtFCf7zZQo/vO0cEozA+31wVd
 Qpjz0mE8deSHzhkr51Q0FlJIX6cKTvpZG+lvaiSURZSRMTHu/nR+XvdVro1Rn8T8tB7ncrEUVBF
 KfMNfBJZAB1GGtR/fyJyD4ltuR4K8eZyEsBQi5cCWQarAlvd8h6CQ86VNz8zugMSI02a8l9d7F8
 H65tNpo4ctWALrnlorAlaVsE/ic+dn/rC8Q56mvtVn5VABhknI5vO1GOtIqdxPXoGppQif6MMlB
 luolsBt6/thqk+xyTO7lgaJN2LKEZ0h2GHhCOs+OXiJGmSkJu2PDhfTVsXH84u6xAMBjxHvQihD
 A2I/tJnKeJAOCvH9zDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMiBTYWx0ZWRfXwf5K64iC+GV8
 2DBXLQNGPKRB6LhtHESGVm1QZZYzuz5QODV5N3r5+RH4Fy/Ys03LxJQSy4SQjux85gR6IOiC12h
 uXxptA/73U3UxHkGQwGD2Rn1aqOXIQw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180032

Add the device-tree bindings for the ATH12K IEEE 802.11bn wifi device
QCN9575.

Signed-off-by: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml        | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
index fa64c8aa56f5..dcb846258e47 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath12k-wsi.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+# Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/net/wireless/qcom,ath12k-wsi.yaml#
@@ -11,10 +11,10 @@ maintainers:
   - Jeff Johnson <jjohnson@kernel.org>
 
 description: |
-  Qualcomm Technologies IEEE 802.11be PCIe devices with WSI interface.
+  Qualcomm Technologies IEEE 802.11 PCIe devices with WSI interface.
 
-  The ath12k devices (QCN9274) feature WSI support. WSI stands for
-  WLAN Serial Interface. It is used for the exchange of specific
+  Some ath12k devices (QCN9274 and QCN9575) feature WSI support. WSI stands
+  for WLAN Serial Interface. It is used for the exchange of specific
   control information across radios based on the doorbell mechanism.
   This WSI connection is essential to exchange control information
   among these devices.
@@ -48,6 +48,7 @@ properties:
   compatible:
     enum:
       - pci17cb,1109  # QCN9274
+      - pci17cb,1113  # QCN9575
 
   reg:
     maxItems: 1

-- 
2.34.1

