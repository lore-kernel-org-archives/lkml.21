Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429549;
	b=GmyR8CchdPvztbZswBvOa5iVdY1x/M7fxJsJKw1f6Em1/cclwC98FFwN/BO7GrEMDDMj
	 YESEknYDfBJQxgTGhpdO3lQBx0h4vDFZgp1AUyU6VVPyKqglYsjSGqI7gLbfTS/GdRohp
	 WMApZ5/La6KM2FfvtJo9AFLHYA8uk9Pwb139Eyn7U3euhOyi6ytDQLGnETxYOoisgbhec
	 2y3WtDTd5SDx6H9/mrVu+k13kCvNOF3uo5BmMr7gJBjnm3bODSZkDpPo/G7JMbxDw1Elc
	 9jr3TukY/OL4XAIIh9PDbeSkkNVIED4udrRI4O53KqeDhYm2cYZXndvWKQtX2J+dG9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429549;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
	b=u/63qBZj31M85XC/ncZxg+AFwn8q93vx2dEWo9yQDvD0Vhn8sn50E3ALJ5dPqaVb9z/l
	 5Jz2gfHOwZwbl9GMw66JeLPbLCi2TeLVzUrUm9fVEY3/sod1/fBA3z28z+5ukf3BiiDtN
	 kbqQv0+SDRRUKW/JbyVRYDQNx8sP/Bz3FK37WNMQTjL5tHZ+djy1z33YJXtN44jQlJWyS
	 M5lM108iEeiLoFjd0zp3xvpdggJAHDE66orsqH8gTKcv78+P2B9O73VaoID847JnQa/eg
	 z8hfUkXYnXHS1uNBJgOxlaeQtUla9zihFIKtGdDy9So1NtBn4hYOVM/0wfOSWy7Pjpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PG0catFr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMZSX80K;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C1460A2602
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C1460A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PG0catFr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TMZSX80K
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G2pN1428507
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=; b=PG0catFroHWUpcO8
	1ZieIvVdt7o3wG3I/57gd22yhfoX/Ns9c9eA2XY+mRgEM4uuU2CJFtIdL3huZGG5
	8pbfBDO8D3MnOM78UNW3OwemZ0B0O0YuSoayd5B9CDH9QVRUjx6O5/ayV2SW0XIz
	I2KBPeMBIRKY6cl2KtsMl151L2oo0tR0awxHTubgim+fmAay2mwOrjgBuxKFIlDg
	5GSUbLUG3sJZBX2OM23hyVbMeTF7FUbZQmZcjMh6swqJ51RqE7p4ZPbCEe31G95G
	6vGfadHesgz7OcG58VZakx/85fHdgtyp4pkl6En1lS+cDIBfoH1hV7KSCfE/NZ2w
	C/UX9Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyh0x7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:25:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9213e04641dso60939086d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795429548; x=1796034348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
        b=TMZSX80K4huuAHvPAe9qssG5wgmUmh7eeC6RQHLN6v4sPudTMA2U06e5s3hrnKQjEf
         pi8fwpNbGc7EE15d0RaQhwABZeHGK2V95sK7v19r3y7m5niLZZuDaQ6Ztuj+qd4B+/UL
         GvWwc7cmE5v262rI4bUpuF/Kl+40lrAGPSWcTDOwkAxHrC0BrHdPO09Ep/gIL6an5fd8
         B/zABLOSQlX3WAp5irnERObJyx+WwVbLO8xluL0CT63LPkKUtrWEcJpworoH+hMcc9WZ
         +NF4f2Zw3QIDTI6MAJcl32qQh3USQ5yKKvX+MwWNccfjGE911AeggC+v2aDVCMY+iknh
         LPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429548; x=1796034348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
        b=LuiDS3vosyOj7bibbMlOdeLEupnlgwGmmh9Oxvk7b1gckiisFeka3bwDpFSxZAPq5P
         XIZaBm7dKg0ec6hFONk9AexbYmB2SpvWY+q2uAWeZQxDkSzYba8+L11tjqQAe6iQe7ZO
         nKIXHnEe/6t1Cnk/dXUIqdRQW02Jwyb/2z/7wTs560/1ne7GNK/cpeokfskVkHMmTlUK
         ZbgO+4Z7mrZ/O95K9ajf9i1zot/cjIsyiS1puLV5waVpDO8PAYk/TiZHPLxuUcmQ24lF
         Gg3qqbag4v94F6L6IhWTyVaOarxrNHDR7pP1tF5Y350szM1DWnZ59gvlPfEyr6k9Cuu6
         4MXw==
X-Forwarded-Encrypted: i=1; AL+hErHW5RQg+oU36yoAVo21M9MaNhIkXd2cUi8dJ7ZZD+AhnUenNA9YFHQ4LJ8yvt7YIyuMv5pRsEtxzySF2FI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bPQGBKpWoDIK/nh8Lk+N94sWwy7jK/P7vVmH0bL6MCsFVffn4
	6kUY/6vWQptK7l2X+6EuVZ3ZzgnmbDGpi75G3i9bNG0X0f1VEY7TcP77txHCNgFrrvegV6VJvQG
	VnIceaMF6FPWbPm4ertQjXCsiDnmAXwCc0Ed+pX83OOG9R3cyP0Nn53I2wfWggbDqJT4=
X-Gm-Gg: AZFdTZdAizaWmVLX/eVoiMGH4z7m/5R5A8WIN7v1vAieirEaZMqxXHIcNir6wEHNpKV
	oPkf+KWhi7m1KZEt0td/oUDuydaBra1MYDvpEBf8AX6diyjKDLmDmkb2FZu2dN/GGCKM4ltgwiy
	+rUrSP9ESJhGeNpnUxx70cMRsS5neZWg9OlD/f7teObuAhEWp07umBXt2ckJ2khuNsUcfFSsjBw
	r/vYMN2a33BAxbZYXRA/GOsM1V/o28lUcC0IF27NwKqZu2qBwNsf8SOUgwqsr4RSmUDBfgZrg33
	2Lyx76CWe2ZIT7zSX1meYWCDCgqHKZjcD5STj5uAtCRhICxATxUu+jE0yoQc/ZO3BszIjV+ZPzq
	tXg7jXrn5FumfHUZVL7cInzGD3TvVSVXRguJ20b2l8Tg8+MeS64n7uSdDbB4V1QAdcCjXUqGscU
	25U2UBycjm1SxjLE2YQWtSzPXHN0KuhHxUpoOrIBnRRCLLhzR0OInD4lVfFZUSS/Ork39lDbY7p
	Qdh4hblVEqFTFdwgQO/r6XzcVIC
X-Received: by 2002:a05:620a:2b45:b0:949:a7d0:9fbd with SMTP id af79cd13be357-949ba9e2668mr1901699885a.41.1795429547599;
        Mon, 23 Nov 2026 02:25:47 -0800 (PST)
X-Received: by 2002:a05:620a:2b45:b0:949:a7d0:9fbd with SMTP id af79cd13be357-949ba9e2668mr1901697885a.41.1795429547152;
        Mon, 23 Nov 2026 02:25:47 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:58b4:dc38:81d5:3c3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm634166845e9.4.2026.11.23.02.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:25:46 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:25:38 +0100
Subject: [PATCH v8 7/8] dt-bindings: connector: pcie-m2-e: Add vendor LGA
 connector compatible
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
Message-Id: <20261123-monza-wireless-v8-7-a8b38604be6c@oss.qualcomm.com>
References: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
In-Reply-To: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=NM1AaE6g c=1 sm=1 tr=0 ts=6b0414ac cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX11SXH1R00FZQ
 x/7XN9CXWgdqbOrnMqfYarGyeU3geOJ6hGrH9ajGnjJWwAtMSiH1bqbpdQa3QWRez9rzPUsVp2x
 NbP7lBI3Nkepex7K6Q/wyOis0cIeOZk=
X-Proofpoint-ORIG-GUID: qeKW9H5rYMwxTycL-vMY9mD8YuT1hSbW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX0HTVoYqdv1rX
 Ibvyp1sRA0Q5mmqXJMO7EmEomhP/9PW5LRtrp60g56P8GU7KIbB/+pMC0rw92ioVnuHX5eiH0C7
 jzNPEagPqJ5aRSV3HVL3nwReI/Hx9OwEk2gZS1zRaxupOY//JYzq9HLXbn5FFdYYy5Ij7rLK1O+
 4ngogUVsr7eJKDmNY2iiMpY1xnGhxe3Y1gcbBwS8kbOSMRYgTP/9FcCiCBFrKlpcjqqARErtnfF
 W+sY9URPlFJAnySM+yb4oI1yDMkYAzoF9lO/y1zOSWtGIdmZeOxbpv69XjerPciMIrK2QHoHXq7
 sz5VM8oF7oI8Z+GNwZGy8mz4xzhfB4xLkRwoEI+yuqk9jyJo+rTmK6I0Ho9XhWFtwB4jkQscP+W
 IiE9eZvFRH9j3Ygg2pV9q5MRUadVgsqhSmOkNiFqAEjtwfQRrtyQlNE1B0zgJEv30txIiAeChLk
 wcn0q/672Hcs0CaNNig==
X-Proofpoint-GUID: qeKW9H5rYMwxTycL-vMY9mD8YuT1hSbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230041

Some modules (e.g. the Qualcomm QCA2066/QCNFA765) expose the same M.2
Key E interface signals but are physically soldered as an LGA package
rather than plugged into a real M.2 Key E connector socket. Such designs
are not actual M.2 Key E connectors, so describe them with a dedicated
vendor-specific compatible while keeping "pcie-m2-e-connector" as a
fallback for the shared signal semantics.

Add "qcom,pcie-m2-1418-lga-connector" for the M.2 LGA 1418 found on
Arduino Ventuno Q (Monaco Monza).

Add "qcom,pcie-m2-1620-lga-connector" for the M.2 LGA 1620 found on
The Lenovo Thinkpad T14s.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/connector/pcie-m2-e-connector.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
index f7859aa9b63469cb43919c0b5719c18694c5364d..ce6173a0ec41cfe8ab4a5780940999c18674ab7e 100644
--- a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
@@ -17,7 +17,13 @@ description:
 
 properties:
   compatible:
-    const: pcie-m2-e-connector
+    oneOf:
+      - const: pcie-m2-e-connector
+      - items:
+          - enum:
+              - qcom,pcie-m2-1418-lga-connector
+              - qcom,pcie-m2-1620-lga-connector
+          - const: pcie-m2-e-connector
 
   vpcie3v3-supply:
     description: A phandle to the regulator for 3.3v supply.

-- 
2.34.1

