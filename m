Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982759;
	b=3z6Qd+ImgeDfeimpPZkxFo1s/xy1ikXKcTx1iraztLlHNQtRcRe55E56UK/JfvPXtEJA
	 4E/N+Q4ftCjo8WKfYA9ksq7BOntrr/8HZOXmRXsNn5BcQ5pTrZU7obppO0ZxgUAcMPkXV
	 2ksYxAwekb+UQ2jKhWUTtl8HE3m+lnkgjEK6axOrLACaJR/10oNRBF2AEIWLqKiI9znNk
	 zq9TLesGKm7LQQGu9njO3N+5P+HJetU3UiL3z04kVitRcgTwkeSbsgiLtup6h+lziXFkw
	 v2zngF4fwB7ABdEnyTyS/kiF8zA5PvYdMTFry4WbTgmK9Azaijpk+DAYSZDAeeuwYmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982759;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
	b=2b9OslTnMfUsnwyuuCWV4eyxgOfyKd9LmDUmFOOoiRks4g3F65DRpv8pkkLqtjtL7G05
	 55bg2Urw9AsKBQMYX1/BSFux2nS5+t6VLxntdDVdvdcjkK/+zrw6Wr/whaI06/mBas7+n
	 YH3aDpCF909kT9VJJJpva8SwW9HANzabxkxhPSx7lv/8w6DPnYkDngbmCO8wxNsXYPZIE
	 aSH6nY/vyZ3pSZPvlUEFiRQd7fznDhpMyvNkGh5BDMiAHIIi/PGYwCFeXqTIbonhQUd7H
	 eED1NwBScuNw5uZ6e4fCJvcJRy2OyQl7B/aC5Ev7bTedmm36TqESjXituMjIhsixUAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Do76T8LS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B0HrlLuW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81204606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81204606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Do76T8LS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B0HrlLuW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VDG02106647
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:19:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=; b=Do76T8LSF05wtpgg
	Gt11GH2PLpKktrmfYjxLGxCINJ6jNabvTRQH4fUDsv/Y5iDCSpGE75bwfFRdSXJo
	MZTfJiGGZMTSqPN6brfN4ZjUmDCZ+CVjy2KiZt3mTGPfXXBbgiJ4HAcIFATRsUk2
	0WvG2jIKmvkb/7Nw2fGqTnSXki6AEhw+4BVSLgrcoUDYi0FUZGAWqlx7mR1qNWlz
	myG4kbx0wmJ/pmExKb65ugjL5zipXiCjfEnZQoPz0urufdOfPk8QBzurCLQaIs2N
	NWrqQfa+s+ZRCA7+HNmnYzJNkEAGpvtyRmk8P40r1NGKFn1C/uLsCLkFo4rbEaml
	O2hNaw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sg0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:19:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so661865a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794982756; x=1795587556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=B0HrlLuWddp5t+34hghWnEQTkNFyss6Y2zCfKRWe0lnGj/iVycNut2s3WfqXmYvrsq
         CMrB+VycTTJDkitsKnr30gO/nV0Zq1IVeAHzsshue0u44IDTcNbWeSpV6690BlVVuMnu
         LEFlrpHv8Xju214EUncgLLSAK2K+4LXF9DYUzbJB3Na1KwN1asJmUG974oq2mHaIqwrW
         yYov3Cod2rkZM7ENtwvWUgS0hCFKEdKSlkYSykRzEcvkjTatc+qFT2SkJVdyKPe5sRCA
         sV/fHoVL72uPMax2vW35IDHYyy16ztVjJ2j40ihuBaU51dakf7q6a9eGRvZJYm5xsomV
         8hdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982756; x=1795587556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HqKauYN4nYFvfrYHZN5AaX3xFfqq8PfM01eE8hOHnT8=;
        b=DGF9RBQc+jyXqxfj/WUU8k84Tg5EYc7QXUBuZp29j/zqqkwHvLOmfhPXEKdZj7ngDc
         97qt6/NtnHf/+iBKWqbTK+6EyLXeNe4ubOog63VbNPhLQAj+S+5ZX6RILXJ3KJ9IbDQE
         T0iaIRF9OJc5QXTarr25/oXaTjnPdAqkRmV1UlvgIGniacbfYTYgtHqezBWGXWGN8WE8
         Sp991s3ciw1SGmLYE3s/5vHnBq7TSgNkGxYYA+pLlBEezuOreOnt+c/DaHiQDNbMgAwo
         z0RSVxhfJPy6mM1I2qKQze0Iq0NOyqeiPXdwX60/bv0kpDLXjnIzO6uBOqwN+FplgjIt
         6lOA==
X-Forwarded-Encrypted: i=1; AL+hErHHxUxTdPBx/sjxAG6K2uCXTqiqR+RoNBTkXF+3hlWw0vja8UWJITDN0VPHJkaPAqlSDzFs7XXgtDNTTLs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8q+2LsxWBvK/QOXfIcpD9uZSjD74euNYyGtocyB5T5FsUZJHP0
	IgGhdsSg90tOHzcVrvPqIpEvQI2bQ8foiautTVB3BvlwH5sqU1r2Biqbaewhj1OGjibSQ9CSTa0
	4/2zNETiGWB4bkv/mUAI/Tpi/0qjfPuwgzzJjQ8T4auVUShNN84J8jmAD1vY3AJ3FWDs=
X-Gm-Gg: AZFdTZeN63r1ja7v2DpC06UjdEBT98DwCEAZXLJUyUnUl7znjm03u2DbH/ZrS+m8UG2
	CO59+KcLzRcNY1hOH00gsUCZINbHp+LXObsL+noU8IXqMpvUgbwkr323n2RZza0OWwcz7KtA2Iz
	9py6FQ6RshccZSfB223+A/cXBPlkJbiavF0Oe9OUnw7qm298RMgTrcu3grbuRtn4N0e1skT8C8k
	EFVwUn1FDSAh0SRK4aTrc92rKdWkun+1FDI3R/SyZZsg30aVXgv94A7wpYWnlZKoKTEHQpMMumL
	lNkiVc89uaH941j2kAt5QMc3L9mATK92DZ1ZU+wg8OPB8p7teHb3KBUxDda4aFY0tZr0QHi6ivB
	rotoLbC/Rb333R+fDZzOoCWdylXksn+FWAkE7hZUs7/WVzXfvmYaF6QZKgQ7mdfAJPFjtGKXEN6
	7ahDsQkwBT3CpCk2pmCHP7nyRRyO9gUybgOI4ZcW7V3gxS7I41xobUF15lYvMQKhuyQeo3EgbGv
	vw=
X-Received: by 2002:a17:90a:e18c:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3b3d074db1amr1569824a91.21.1794982756155;
        Tue, 17 Nov 2026 22:19:16 -0800 (PST)
X-Received: by 2002:a17:90a:e18c:b0:3ab:afca:1d79 with SMTP id 98e67ed59e1d1-3b3d074db1amr1569814a91.21.1794982755695;
        Tue, 17 Nov 2026 22:19:15 -0800 (PST)
Received: from hu-madhgane-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac255634sm7395464a91.5.2026.11.17.22.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:19:15 -0800 (PST)
From: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:49:04 +0530
Subject: [PATCH ath-next v2 01/15] dt-bindings: net: wireless: add ath12k
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
Message-Id: <20261118-wifi8_qcn9575_bringup-v2-1-d81a3046290e@oss.qualcomm.com>
References: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
In-Reply-To: <20261118-wifi8_qcn9575_bringup-v2-0-d81a3046290e@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: mGvNqAQeFUP-rv4JkKfAAMlyD_wEf202
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX1s91XSis7wfi
 qE8/OCSn7GAX4d1+iCrgaGe+XBV2/KRaWLjKQfi9seUTH6DRAjGYLhqavtcNLezTIQkI+0kEVvu
 xewjWs+axPFyLV7p6PhOguGtzMluf7M=
X-Proofpoint-GUID: mGvNqAQeFUP-rv4JkKfAAMlyD_wEf202
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyNCBTYWx0ZWRfX6ziTQE4RP1BY
 Mn4EBhSHba2M2zMeJC/n9Mw9auVFtZSsB9T6qUR5q8E1ZkMEPjIVKO6qM+bn62xrQgeb1yF2JpH
 36BBUIvnbZ7k4NJTt+VEcpcxtcNgIq8o60uTN7KCjxUmDUUx0nxWuGWmhzXoQNXfSDekSV/tBP0
 18DJfH6oabT/OOyIE8tHcW8KqTDYvKgzJz/L1Q+DruadcNYnvaWunuW/Ua7h8mUmY3paNpydDUD
 X9N8HO3PYeNQxGSDTjVpMd90mt9qgbqnfUP/Q4vj/NOcguUHuWky4JsWCDYEGJWMD+TFj1Xh0RL
 OMrtjmiVSv5NOCfthKrJWAqE4Z0ps3GDI0ipiK4MmJJwABbyVufw/g1hdAVduqfgf7YiELeA5Gq
 GpgwqHZKbLxGok/HZ0je25RLpCMpBMY0yi/2i/JpKSWRXHqQcNiKQPMF5T8FTV72OHrRLMP+dCW
 7OV76ysJs1FWwcLQZJQ==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd4365 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=cIo56A7EWjM9ht75lhUA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180024

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

