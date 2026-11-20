Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179308;
	b=smYpXcaAfhfr5SDPKtrNw0FmHq9a8IVLKpe5QXZlVFqkNRPALpIk0d+taMEvHyHBDjWq
	 2QOvawK8HgGO/J5hGLjbgyo77p2ajiMe15nu288uW3mbFPRVLbemp0RbnA2WZnSZZ89Ni
	 eEtNxSigSwC3yzgLYv842wdwexCQxRYfGe4USd+V3aRgYS77OTA207Z+zzOy4QA7p6d6o
	 tE3EKazTIruV/mALtLbKmax9sS3IX1xhTSNj8cJyvrDnTLBBXpTYIyneYqefASk+zUwkf
	 PHPL+HFuDLWryuAvzBL0braIHwWvKRH9U2USF85ifOMlv6atkBPhh25uyFIo/YG9k6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s7EZYmXkvRrskX0cSkYLthSXhzEPGdmwSjyGC5cmJ30=;
	b=GV0UBuN0qpTEQMxjPizt/OsIZ/+I3OYROy7dY5DAaLypuIivhMOg6z8RTgC+L1gwa7VJ
	 dHLP7xpUZYUA2X8a35cYBacZY4LYNz3VojM8+yS8+5/91oHrz1kzDdWCv78s+9aju2Rud
	 Fta2beFKebPSvfGb/5/WHaakJdQu20VM6cqyB0ANMCR4NJYVS4vL7CSzdKs5uUdV1MVq7
	 7nWSxev/G7xRabnJzRpG5qnCLNCNtTR7myCPhBwFv3BuSDK8LgRGiCMSpwPQLq58acYG7
	 BxIKKlk7xhLygaEROm+6RksD8dqKEzGBMwdCqvyn909UsmZ0Xgp0nl4fx2BLVwCfkYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VR4EShCD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XBog923V;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D1E606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D1E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VR4EShCD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XBog923V
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjocu1462865
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s7EZYmXkvRrskX0cSkYLth
	SXhzEPGdmwSjyGC5cmJ30=; b=VR4EShCDTBiGLeVD+2v9yOss+3pe8PG/7Gg4oF
	3EEAn6ZZwjsxQDzrfhHTtih/BAXiu6pNaZB+I5kTDRH6zg+VFVmey5lx2j4QizRQ
	ZpI88yRJXyqLL6FUGBIDbG/vYd4AXLBLId+waIwqXFQViGLhAEulwFym9Y76Les8
	ruDEyCaIAQY2aDhFI/0Tu99HEpAarJ6X5HgAolA0KBvoP7e9ePpANlO6e+T+zIeQ
	bkw7rzvCe0h8gyUUUk9Vo7M3UlJkPv5gj0prHQn46ttc+N/wdiWBwCH8ehJXZiy0
	anxYSjoBNqB/Rjvt1PBsHbfhRgd6jQTfmdXgIb2Z+ViTQTCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guahkbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:55:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d322fcso162313185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795179306; x=1795784106; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s7EZYmXkvRrskX0cSkYLthSXhzEPGdmwSjyGC5cmJ30=;
        b=XBog923V7O9YukmTiL6hSF7RCqPfnFWLPENoXrlnxpsIQxPNntwfjlFokVSeWVosL5
         Ao0rQpxHgbtEO9lwo0F2BA1V0CF8QGErYU3bEQofCg9QUXKqol4AE5jpGDqTj/wgtMgN
         Msy1z/McCOsy77O0G4xscBBgnf9vlMQyJm9FlS55alK9MfxUXvyT8xQ8u31fkNW9WG6N
         vPWu9Unqoz18jeJ5bRyW2iiDGCGd7x9luN3qpWAgbtgjCuGbdA3JnTlWcd1lVFzqlClz
         GEtB8GgdAJ3pRfVxyQXPg95vCcEHedLI7DkzwnarPLaL7rM4URbDgdKv4x6e8XqhDbm2
         SeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179306; x=1795784106;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s7EZYmXkvRrskX0cSkYLthSXhzEPGdmwSjyGC5cmJ30=;
        b=Gbgn9bTcFSXwe9lxKQa7kYwy2db4E+snlfpxpf1BW6iyYeekdsAZmGW054otn5/+5s
         ruPGzjHB5RfnWxB73IBnYKIohnr03DII/9/DbmE5qBcbqT7Khk7SDVn78BGmhz2nXBO0
         PGLGs1e9YvsNwenEzuRIwZi9iLUkeoSZXiuyZUlgNQo0V/Y8R2h6uXdHPw37fYWPoiIB
         qvRxOvZeD3wPNA2grGhjQRxmrRN+UV1npSFn0ULfxk4V52HezkpozaJIctDLFszG9vWZ
         Mw/kIuZ34lPZ6UJDgfiWe0TPVm9IA0V6dJIt2fDS5dWRaeIWF2ZPN16BnNAt4YVqo4B9
         AoOQ==
X-Forwarded-Encrypted: i=1; AL+hErGVHcibAtMcquxu4I7qn0DbgAM6vmIIzSChHm5vqo3VZzygtHrfh7pWAYJx3hesaxn34PSwcQhr0TGhtxU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C2QiGLS3QHSl3IRKCz7pu4cbNharsu8G3wzPtB9esNdidkXJl
	Z0zybo1ZT/3xRegNJKq5GzT/ljGsm2XK7BP4lPtr9NiLS8iIqbceDh0OuGnSr1fTZgF2nHypwkb
	9K6V2of4BryCTUMy+ZG8hGFX1Wiki8e1qHUeXeRRm4OdvnLhgGp9I5sJFShvUZWAj284=
X-Gm-Gg: AYBFou0WLAyevsFWUqGQRhiMQTPNKS6lYf5mu6psiBLjg/d1pG4n24jgjaxwg1MSt/e
	XBfSisFMFXzIh8pnfopKQoKeyDW3p8SGMzmHWT8mLu9rADLro9yW6BO5Wraeu+Iap8Zx0KTqzZf
	nftAa4LLQCK6Fw8EwA+/AlONk5Jm6zagLIaNesAtZlvDQlr3pz9DkrkEi/zYnt7eMdN+a0zzRmN
	jL+o5k2ItTJIddD/tSX4oKvIUe8DCelVrclGJsby3ZsbQfi77WyKFVKyi77EOjnk0cXYBDdsOsW
	LInggLKlh1GV+Im2GyJd6sA25IB4dqMsX1quONqRLIgH/tUND6x4O2YlH5vokbalmdC3TY6uPGs
	ud8a4mPJn3Wit9hbfbRQ1tbYAM6SSZZ14E/oaIn34y74SqS3LZvMIKwht4m94ybPiMVFVViTXqm
	Y=
X-Received: by 2002:a05:620a:17aa:b0:949:9985:e097 with SMTP id af79cd13be357-949ba96becfmr466590185a.15.1795179305853;
        Fri, 20 Nov 2026 04:55:05 -0800 (PST)
X-Received: by 2002:a05:620a:17aa:b0:949:9985:e097 with SMTP id af79cd13be357-949ba96becfmr466585885a.15.1795179305336;
        Fri, 20 Nov 2026 04:55:05 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm74459235e9.9.2026.11.20.04.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:55:04 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:55:02 +0100
Subject: [PATCH v2] arm64: defconfig: enable the SerDes PHY for Qualcomm
 SA8255p
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
Message-Id: <20261120-qcom-scmi-sgmii-phy-defconfig-v2-1-01d7865193e1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACVDAGsC/42NQQqDMBBFryKz7oiTgpGueo/iQpKoA43RTCsV8
 e6deoJuPrwP//0dJGQOArdihxxWFk6TgrkU4MZuGgKyVwZTmZqIGlxciiguMsoQmXEeN/Shd2n
 qecDO1lcia40mqGPOoefP6X+0yiPLK+XtvFvp1/5rXgkJfeWsN6FpyNl7EimXd/fUWSw1oD2O4
 wv/4PUI0QAAAA==
X-Change-ID: 20261118-qcom-scmi-sgmii-phy-defconfig-a76311772311
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MbhJU5JdafzJplM18yrnxkgbY8RliXw7RaC10h8GUmU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEMn7dCkiYsmQ7cU7h3YI4zhblZKcKY0yYd9E
 svxGIqKxkyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBDJwAKCRAFnS7L/zaE
 w1sZD/4+pgtUivxmlQlSri4BgFxa8N5QiS0S/E7+GmcFiB314lQHYzsENBVJ4+xoJBvW3svATTF
 r8Zgr3rHZ7Y8f3iOEAgG1AIeB2vgi5KBsJgnePFfHtPlBsQfXtapWx9+Ozomna2iz8LbV2MBaz8
 GoIRDAGfG04pMSlUgtthVhykRQr2zrfWBIQKPnhTZK/QHtoYF4mTtHX0glr46XgfYeEFUz7gJ1v
 1Wbw6Xesb85zZIzIfaujhhaiLIhcRT1+NnB7C1UqUzHpWWlE3TXRhsgmNLNJiEMkpls2QHug8rv
 aY6fsb5G7MZlz4CzuITd7aDFLPi9f6whMHfOEDMG0eOjJyc11AYkrXnXKgD0gkJrycmWqDNuLec
 wCNZ2mqUkNCXj6OUHHQHxVQgAVWJHB5wqE38IlvD0ovUl/j3kNcLplhPxInCj5aNuqA5lb6P8u2
 cx0Jw/0aiMcrvz1lLNECOkD8C0AdTQpqIVD4Db/epZeY+zm5rx36nH+NwbTEpKmQUh+OHVRb5RZ
 nwvO1WViHmNKgwVZnK3gNLGkUA2706DBNGXj+cM+4inG0fkBcUqTry2VF0wrxgWjafZBavcST39
 UJRNy9TvCa0r52sC9VBrhCYheac8Vaq7YyNbzGI2he2thRglKyySkcRTa+sPuIfplLwTZIEmUky
 KXnnwEU2CYI6pXA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MSBTYWx0ZWRfX9P94Ei0gKj5h
 KQLpghw2VG+Hx8+eE23sVQB3+RN4m25n4E0h2gXUBXICTnJkP+GuaRJvrmOdGPYjxHgBKKnTufD
 EgwoLGHxhfhNXJ3wi1ZbAjZdFlRhgqPVxz+yfuJyscGEPUYOalW3KmmHm+R3E0BDYMrfoaQM4my
 otkWSD9xIBZJ9e3KGR5swJtryv2PL8WioMBWEB8YcmPSRbODU1DXRIz/EWETsSaEebojOBgjiyB
 bFJcW68EeJKe+DNDXGm1y59bf0Ra5gXqMptvdy0IqEe/1cxnDB0b4fCGMPyWq6D8An+qdwpfSwJ
 IVwnqqF1vGX6XkLp/mehUeZ6FKEqlVjvWT7R9l2uefTmuPSDRGB09kzF5GXETeizum5lh9ELpga
 e+sRK3uMGwRMfYn0v8ikGOXDQ+NJFp08TH/A+mNxcswSaa0V2Qo0AIuzjBG+/o1vv/JuH+Q8Hm+
 5rCtHq+3BhvBHHoKwIQ==
X-Proofpoint-ORIG-GUID: r5BVRPvsfVKdm_RFTXqSVTxK88843H0s
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b00432b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=BpbMfEP1g1sSJNOxg3sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: r5BVRPvsfVKdm_RFTXqSVTxK88843H0s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MSBTYWx0ZWRfXwfx1s+2gLkf5
 fjYGnriPI55hV9y6H8/2sjS8lYTa6qkLsmFCAozInftRIxLzRYrxAf0Op2s4uoQfrYYUSpQSkmN
 5RI50Qy/K8ZQt4JuLXi0znQ+YqUd7JI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200051

Enable the SGMII/SerDes PHY driver for Qualcomm SA8255p which is the
firmware-managed variant of the Qualcomm Lemans (SA8775p) platform. This
module is required for ethernet to work on the lemans-sa8255p-ride board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Attempt to make Krzysztof happier with the commit message
- Link to v1: https://patch.msgid.link/20261118-qcom-scmi-sgmii-phy-defconfig-v1-1-d0c7d2e881c7@oss.qualcomm.com
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 52a4f0b45707976590d2b5ed09427737e4e5c644..213445d7e3cfafd678bb1f5974a8dac46b679df8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1671,6 +1671,7 @@ CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m
 CONFIG_PHY_QCOM_USB_SS=m
 CONFIG_PHY_QCOM_SGMII_ETH=m
+CONFIG_PHY_QCOM_SGMII_ETH_SCMI=m
 CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y

---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-qcom-scmi-sgmii-phy-defconfig-a76311772311

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

