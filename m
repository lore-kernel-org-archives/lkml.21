Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112044;
	b=j2/txtq67HloRtVowRxXm2MZ5yMbOpnP5S6U6LVEfxZ5IBnmjyEmy49y/IqQN4NKkMl2
	 u5y+0dcQgKyeEoVjBYdmIqux1U1j/BtnFJX4jYIZ8VftwJPK/7BiaQ2ARdC811ks6wh+u
	 u6bRaTNNzecE1wJ0Ro0MCZmFOAV+/hNBBc7+TRIZb6mUUjetPCOXAJZFIBaXo97GA7txb
	 NOc+T5pM+2WS5gLsraLmL8+qX+4l5jUj12moXftcsLUVURjVX5nSxdUFo/4joLyJG1GgL
	 H13+wQxIJI2pYjrOxDKLQXl4lqbjTBkdTUJCioEwWwBCGTbNC29WV8FdwpuDjW64AUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4Cq6/rxxWIeTxIeL3D5qEzDRvos9jyAxzRLBNNcGYX0=;
	b=VYMudMO7jIzL2bv/pHIaMb8JaDS5JxH1JSKmT2VJZrBZn0HtlP8DZqAAXTE3d+GJQ5mx
	 k39tt3KiqL3GfXJqlm3xVgnz7QikZY4WjIR9MI7rZmSwlXUsBn1MOC984klvGohRykKnc
	 OaMo85xCSCRuiyKyS4T1K2OA6FriKj0Dg/5rzgKlaLiaxc1B20fE4KQAre/giPWFd1+VN
	 mI7FQ4OBwxDjdlHHdCKYoVguQmmTTS8dMTLtk31RNFSh1r3H68LRrtb5vupNxM+BGLXf1
	 XrWxipO6Y1KX+78BIWySJ9t6/Eu4V/xSHCjUSoAXUGeQ8oT+WDvCT4RP66TCbvbJbuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUSsRbe1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Slv8FHy3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF55606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FF55606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUSsRbe1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Slv8FHy3
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJHAdER2942803
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4Cq6/rxxWIe
	TxIeL3D5qEzDRvos9jyAxzRLBNNcGYX0=; b=ZUSsRbe1xF8bJtFGnVOB8Is580v
	zFkk47ZK3FOJUgdI01m0GzIUWGEmh2Y4HlIFKGMC3hz5fxchwxqwqKdhYLOFHDzW
	431gxvob3QD+fpMe7hdYehjUc4pWqBXxjfJPS6eIm3+yAq6SZTQ/kUFTiGLIKfFg
	9hYd4NWriO3czTnRdyVHIH+yk0TTFrHUNxz9My24SNeTi14pOWZkVSEHZiavvkRC
	i0ESEQUx1xWG5O5DiPgtRvq/pQ2ZnKA3/LwWh3vMdNijqs5ceNSZCdEVx+EscBnc
	1PAEng8tUb13+smIcM93AQVsxTzFnEohPlrqJKWYk9S4BCz90K/OPd/Mg/w==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uuxb78d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:14:00 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b25d977b91so31089c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795112040; x=1795716840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Cq6/rxxWIeTxIeL3D5qEzDRvos9jyAxzRLBNNcGYX0=;
        b=Slv8FHy304SVyrAODQrywx2kXtUQascMkkYBfb/cavSclUuX6wa8Jf3J12lkLssVFK
         XO96mKV1yPRIAf+rJt0IyShMEPg28ibBiIET16tbWpvibcyxDB6jzcKl3kyDsDvjDaF9
         +C9lxyskdEIReVLJw+/cWW7q3VQhdDuxZHUpop/EsxoHXYrv7XecyEDg1jcPGAGPLd7O
         hnNwiBxMoZ+oViEjVEJ06DUd80R3pnH2KPFwSaEZ4Z2EP1HXFynxca4r45EiwPrcfgZv
         BAUpwUYkh/F2s/MerdiV/nSbZoNc6XE1Cap1KRsl+9NR69WZ1mVCo6uK9lCGA+Gft0yd
         Jwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795112040; x=1795716840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Cq6/rxxWIeTxIeL3D5qEzDRvos9jyAxzRLBNNcGYX0=;
        b=IOGX/xJ99VZm3EmXcT6SrvnpYM8mspo0Sf8BwKotELNS/LXWqNjNc1gic49sPiO7od
         0Gjm3v3wKofU2wM9PPE1kvHoikLgYxg19td+ur7ypHuOznQX+qwhsytoOndbv3Dg1+3X
         tE5vjPH5TFRsEahEO1evLHOrnuZi7FQtSjEsf85yy3T7HoqJRsC1jyPpIIWJlDZbPjqS
         KF05+9ncFF1CtnZTdo4gMdFkXm1fJS/RVfpX/PhS1w0de9+9oR5FWwK99Yyhl6seuZQC
         bMq75/XVt4OfyOc+tcK4/Q7sSzCkGFuz2OVt8bhC3Vm3A5EHMCgtuSF0jIMjQ98vTIK9
         YjOQ==
X-Gm-Message-State: APuU4Z/85DgBMRoCDjD1AcuOdRTfdWAXW/FkOb137VV9uH4to6kCTZl0
	FuTGJoJyT7I/ZEwEGsDr+sBGOG1NUVLpUk2tWfdKB0fcM1U1MQwA1EIIAr1Sgk9+4EBGEbGiI8e
	y6Oq/Lk5iZ7pw/crcSvShJ4B5Sm6Gjtqc4JnBGK+zUN/xMTYzfEgYflxFsrnKKM74oyI=
X-Gm-Gg: AYBFou1BKVXfmRmVRxrgusM7P7Pxu0xHcnvVVNGm8vY6K5cNVJvDaCj1iaSF9bcaUvR
	qwmyh1j6f51EglBKz2YPKXavh4hDkinTeg4uJzIzKNd73GfoAS3cquo8btWICCPQHCPGMvHgdY9
	r8EgjS3APtn/62xt26sFj04Fq5wIwW92ekKMYPzDQihzrQH9nrqcAY0RyAkyws/TqJas3cKz3O8
	mlIQWeaD2sheuKlVkjpuZVv/A5r2cEWoN414VQd8FOLvOyrpB8OJIlVGKs42rcuWxhBjWFZH4SQ
	C1PhGB0Kp72m0lEg6/o8ordg1Kc5NeCjEqF4KQXFHiDWSJql/Yw3Zp6wdZlR8pAKgeex9B21T1m
	b6JrLRM5/M64AQks+Ai9zrdxPu+CEbhC+eidEzSOffMWPDcPCu1QMwIghpMfmrC7mrh8CrN7EP0
	DOnw==
X-Received: by 2002:a05:7022:698b:b0:168:3243:c91a with SMTP id a92af1059eb24-1b556865248mr489803c88.13.1795112039524;
        Thu, 19 Nov 2026 10:13:59 -0800 (PST)
X-Received: by 2002:a05:7022:698b:b0:168:3243:c91a with SMTP id a92af1059eb24-1b556865248mr489785c88.13.1795112038983;
        Thu, 19 Nov 2026 10:13:58 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm793548c88.3.2026.11.19.10.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:13:58 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: lemans: Add graph port placeholders for USB Type-C muxing
Date: Thu, 19 Nov 2026 23:43:48 +0530
Message-ID: <20261119181349.2017404-2-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119181349.2017404-1-akash.kumar@oss.qualcomm.com>
References: <20261119181349.2017404-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: naoRxasYjh8dEU6T8dQWcxGm5nqyl8Db
X-Proofpoint-GUID: naoRxasYjh8dEU6T8dQWcxGm5nqyl8Db
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA3MiBTYWx0ZWRfXygHIzmlfgQNI
 TVmUHE0Bow8ZqjpciL7Ir4hjJ8BAys/Ny98YPzYxoyl1ITeu6e7dK8I0xCgbA5jHH/IZbElrl9K
 bPubvr2kfkr963m27ZfgMqiT1+2h7OU=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6aff3c68 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=TTb3R7EhsZKQJm7uMdcA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA3MiBTYWx0ZWRfX8D+zgSe/WgqI
 8UyjmmyapOQnTMCF70SlAOYj42QO3GSjPilWIrtvw5310Ewk3aMK3YuvPqq++dbI1jGedrwVj/p
 /PfNSuG1CA/+o9tyzWiRekdKtYs9XEvV9G98khlwcwh2UCLMwBZjbuBuCob//7eiB7a6cc/6YCR
 O2oe9ox62D+ozuCXaPIHWrurHzXxjXPP69JROTinP/yLk2zfvUcPSBhikWA83NiezgnMa/a2ioS
 bImsgvS15qLxBkR+tv9Rr2si6F2h7+TkFYIWkdtelYEnkltC/IG5QleInu2EKSBOdvVwwVWJmoS
 QbtcUMcSO3+rVjiWC/+X2xIjaC5xvAfO27op9rSnWJV/TYPM9MZTlm8bZcYEwS3ypZVlrag+dxv
 8Tq7axm+DaN0I3UhPE0UBhuqBnl/9UqnlBw5FsargrTqcmQPq7oI949yOJQhs1AcXhuRoPvxkyR
 a7Ab+rkbPcxB2k4ryYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190072

Add an OF graph "ports" node under usb_1 with HS and SS endpoint
placeholders, and enable usb-role-switch, so board files can hook up
a UCSI PD controller to drive Type-C role switching and SS/HS muxing.

Drop the fixed dr_mode = "host" override on usb_1 in the Draco SoM,
since the port's mode will now be determined by the role switch
instead of being pinned to host.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/lemans-draco-som.dtsi |  2 --
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 20 +++++++++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi b/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
index 1001b6b81c31..6861cccabb2f 100644
--- a/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-som.dtsi
@@ -384,8 +384,6 @@ &usb_0_qmpphy {
 };
 
 &usb_1 {
-	dr_mode = "host";
-
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 20f329c0df75..0c24e5438935 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3024,9 +3024,29 @@ usb_1: usb@a800000 {
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
+			usb-role-switch;
 			dma-coherent;
 
 			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_dwc3_ss: endpoint {
+					};
+				};
+			};
 		};
 
 		usb_2: usb@a400000 {
-- 
2.43.0

