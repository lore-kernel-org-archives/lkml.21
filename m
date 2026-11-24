Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542555;
	b=KKF45YlnorbrpjsaXcOBT9IqI6O1Sw5yyAHeC+gaVKITio9oBy+6/W0LPvvkUDC+quYc
	 0RZ8FQPK0c5g0d8gctdxBHoKgN8Ih1FHT5+doS79yr/kwobbCHqljCv+vXW3XnDgQvus9
	 axAIDJqDelxJfuc+uSs3U1C6lDGw63+IqQkzZZaegVaQz82u/B73XMdD01oSu/kKEDSVQ
	 VxBN9yguyTHh8oFAB99r2pWacZPViC/lZs48ppzAKJdnVob6ABRY5Q5mJkk3dBmOoCsvz
	 UjR2dDpMEqKrRQc8/Rj/BPWWB8Q3TXJq6CVRYIMadc001XjqBI0JJe4EEfXNq8ldDYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542555;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Sfqj8GQEe8Ctm8nPT/0qV5MLtb/lLvRLhVjLF65l9O8=;
	b=0digaQIInBFwHsYQ2uOSliNHoRrobWQ+JV4+/OF/rucCenuDirfpAMngGJMFSc6r+X9z
	 r6COyVWT5TiXBN+aVKFNP3cmy0aahDDGMNXPu0vI7q1gTTJrpZnvuioEejGPDm5DDrBn1
	 I+ZD2tjjXWznPRKq2SyTWh5r/d4BbKc+9a4IpRXNRQS+3ov16PXqaxDftejAKm/auZ6uU
	 P977OlKk2MMZ0Kghb93VptKki2u0S+pHDzNfwwSToK+7v5M4QX6ZuuP2gtRFiRYnbZ+fi
	 ocMGwVA7ct4/EPcZwCIMA1rs1ziiURw9PnPnBiFU0LHq2nH9QfrWAX9JZjnrFOtt6JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aBJSctzz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yz9qrsPP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB569606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB569606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aBJSctzz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yz9qrsPP
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFtmlU1684103
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:49:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sfqj8GQEe8Ctm8nPT/0qV5MLtb/lLvRLhVjLF65l9O8=; b=aBJSctzzFJkx4XTq
	QVlCkgmgoNiS4ygeu58LQLgHbiKTABuGbpyTtkPOtJ3cKy0DpQ8dy9Hs3S9IEeWs
	V5zItmodZd1GAexTxjGoyCrY3190eNx8PTXG04hZiBglzo7oeLnzZ2Ma9BWk05yW
	c+3l5Vpp/vLdXqZYibG+US5IcrTdrxEsJhPt0caD2gnUmDQGFAFvk3VDExVl3MB9
	HJAK0Tk6VdKvl/3gvU+rEcJWFmceAa+IwbFvibLYeyFOwtqMFt5zjrwYalgjz9A9
	YCuQC4WTb0My3bkJKkwAO1GHOgpcXRq5GU0bsCGuLzDExeun5B4Ds5qHQ91rl0ra
	EBGWVQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5dnggjaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 17:49:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so782719985a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795542553; x=1796147353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sfqj8GQEe8Ctm8nPT/0qV5MLtb/lLvRLhVjLF65l9O8=;
        b=Yz9qrsPPOC4wt7Lx9hbfn/pOLROYxHYBPlwffMb+0qX7owGsfSjoKE/z3piOprkMAI
         rl6g1jTMO68wS2vTQ/9T6VQWiypLGUcJvt4O7caz47/b2H0H5D94xGlXjTtT1kJZxfhQ
         rhhKzpCHHyojml+FowqTf1M1seZKyIYhBHGcT3zK2ocbhSIHmBqWeHLVrbNiwM1eBHGR
         fUQ4GIpFvhhbZcOMDeFC82bUGLfzBJQaMXf21bdW3ai+4cLc4HGSwMrFMhImgPXRNsO0
         fqXITMoD69LA66VE17ITvBMuNA/vkhZRhY7lDxJ/VqvMqVmxFbNafCCUhy4OukcNWiEl
         0yzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542553; x=1796147353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sfqj8GQEe8Ctm8nPT/0qV5MLtb/lLvRLhVjLF65l9O8=;
        b=Ew5+yrUHO63O+FeKhwPSHigmAcNKf/zllZv/yF9CVZwtqpUW2b/IGQC6noBLG8pvnV
         NRfjI8PclLBYqKtPabNZ2AVrxBxN7rGlBxw/gjAKTiF6vEhlG8CUEVrDT/DvA/R1pGmr
         YPiL/A4r+TBrL5rJpaBc1RyC9aEcwwIk5gxXSIRQrJJrpDfMim+zX+025DmIae1DiqBb
         QwdkArv+ixP86KKP6tZdHB99RxvTTX46RczA+wMl4G6bhJZmgFb6AxKwUrmRaSPEUtvH
         lFuz7ATaUBWtY67+vaoBE7rh2eUngTrekFNdUMrcG9//+Ug05JhOQDhkqkGDL/0Coebh
         hWDw==
X-Forwarded-Encrypted: i=1; AL+hErGHhXa2w8Z6rdG2gYBTRj+igqS+uMOe2lg5aNTRoyzQQG3VjhmTTdjd3Ggsjr1l7V0+dZy7j3C0ZZJIQXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Um4u9OHEyiER+KAfVbkgEvFzd84WQCfj68Xk8IfE9ALpmwzxu
	8JNaUW3T88MqwxsUIhwQZ456c0Fut4pXbNEY3zYl7GAEIJTYAHsQogefBJIxWbFi9ZpT02QfDmF
	b3bMUAd0hqPPgrpg8elOUhTPiwDfYX5omTxgDpzcvMuHAazS/OgsLpiPyU+IKQMu/W8E=
X-Gm-Gg: AZFdTZe43gPlVoyuuA0J7AyNMa4XbK8sGVR7PttBFUh/3ZxFmEtePGttdLqdj7KYQ/H
	iM2uIAhcANmaiL5x3XDUtBh1GB7YzAOyrIMa5nOOqpHKPlOAW+OEai2SfOUazQzQjkumKq1YibR
	/9JE6bp3KL5bujM2RYsOgimZF9SGDQElx8TGIDHUoKEhRVXfwZ3n3kEs5c6wK9hTUPfxr0fFgD6
	LDWbCoQBIkn6ytviTao2uV7Vok7kfhRJ5Sq6SIpAAlivltxNlERE/aRDWY9z4/JQvnwE8j0reMH
	ZygU1FcBBBts65zewqQioaJTLt+KLt+e+cf3/m2ZvAZd20H0fNTXwq7VhXTOw4HaDD4sYJjD91c
	djQzrF0dKACAgQD/gcyM4CPWOtKYx5uVDR/qxY6mGVFowPenAT91iJBK8DzVVFycl3ybc8aIBWX
	IrGgzDclOitxlf
X-Received: by 2002:a05:620a:1332:b0:949:6193:acd0 with SMTP id af79cd13be357-949bab4d91bmr2688287985a.81.1795542552909;
        Tue, 24 Nov 2026 09:49:12 -0800 (PST)
X-Received: by 2002:a05:620a:1332:b0:949:6193:acd0 with SMTP id af79cd13be357-949bab4d91bmr2688284585a.81.1795542552469;
        Tue, 24 Nov 2026 09:49:12 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e77d8sm6899678a12.14.2026.11.24.09.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:49:11 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 18:48:52 +0100
Subject: [PATCH v3 2/3] arm64: dts: qcom: agatti: add the Embedded USB
 Debugger
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
Message-Id: <20261124-qcm2290-eud-dts-v3-2-b3e5af3701e7@oss.qualcomm.com>
References: <20261124-qcm2290-eud-dts-v3-0-b3e5af3701e7@oss.qualcomm.com>
In-Reply-To: <20261124-qcm2290-eud-dts-v3-0-b3e5af3701e7@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX/sFAypo36vdS
 A9NzlYVpK/rYk99SRHhUxnWxIlrz6PlL63Qp74UIRyGjeLr2LUcAsKKUgfnzavItglD2NIe+tat
 QiWq3265+rgCc33T0NJ6R3fracIQcb8=
X-Proofpoint-ORIG-GUID: -Tk8qQBAl--AxGGOFEEzLEPMLtIbYUDr
X-Proofpoint-GUID: -Tk8qQBAl--AxGGOFEEzLEPMLtIbYUDr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2OSBTYWx0ZWRfX8Y9RoFOKnfql
 9lisH7Jy/MlzN9OCJo4zfdkgkGT3I0+mMnyZQCKJ5E9OmVbGainTre+67ySPHQlq4FzgTTquMWJ
 6mwYRS6habjGKM7hlfYNQGrVdq078FlO7BQJwMqmvvgUV3Oa8ncCIBIwuwtjMeUYBpHVa7U/0mZ
 wRoYp2AHjLh9CtjAL4h5Y+ls7iRks6cImkpOIu893YL6/LvJGo09nHlXhc3+OfdzZp6eMV4aHc0
 vB/8+ooSVTkmgOIosWbl74oWs2PadrER0NeNNfMDWpth4SW/9+9QLe3R6PSyvJyfzfIN/eBr3rX
 eoX2IwLKtfXkOsx/GdZE6RvqsuSZJ2S65Qe5Hi5dXJY4zqZu0g74L0XWFgqdj+loVLw3EbXdGjV
 I4H19MCbpoRaqVixrgHHaRP4+bkfHNoU3vcDiElGY8uwhTKT02LEfmkHXyOEGXBD7yEM5jYIOfe
 xF4YcYyaFdhBmwVWB8Q==
X-Authority-Analysis: v=2.4 cv=U9cHnuru c=1 sm=1 tr=0 ts=6b05ce19 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FHn9pCZiDirsiwHFROYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240069

Describe the EUD:

- its CSRs at 0x1610000 and the mode manager register at 0x1612000;
- TCSR_APSS_SPARE_REG1 (0x3e5018), as offset 0x25018 into the TCSR
  syscon;
- its interrupt (eud_int[1], GIC SPI 189).

Hook its port to a second endpoint of the dwc3 high-speed port so the
driver finds the role switch, while the board keeps the first endpoint
for its connector.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index ea9b39b1ed43..ac7a653a6f03 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -826,6 +826,30 @@ gcc: clock-controller@1400000 {
 			#power-domain-cells = <1>;
 		};
 
+		eud: eud@1610000 {
+			compatible = "qcom,qcm2290-eud", "qcom,eud";
+			reg = <0x0 0x01610000 0x0 0x2000>,
+			      <0x0 0x01612000 0x0 0x1000>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+
+			qcom,tcsr-reg = <&tcsr_regs 0x25018>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					eud_ep: endpoint {
+						remote-endpoint = <&usb_dwc3_hs_eud>;
+					};
+				};
+			};
+		};
+
 		usb_hsphy: phy@1613000 {
 			compatible = "qcom,qcm2290-qusb2-phy";
 			reg = <0x0 0x01613000 0x0 0x180>;
@@ -1680,8 +1704,16 @@ ports {
 
 				port@0 {
 					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 
-					usb_dwc3_hs: endpoint {
+					usb_dwc3_hs: endpoint@0 {
+						reg = <0>;
+					};
+
+					usb_dwc3_hs_eud: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&eud_ep>;
 					};
 				};
 

-- 
2.53.0

