Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173137;
	b=yPuoyVUbMB3Cqfky7y3gxYjjrhBOPukm6fq+ytrNNAXls3BpuUe6s5nKwb6REk8oXU9X
	 mapUMHRYCoaxa0tji0xLm5DRjqMjQVWyq4L+9NZAxwjktaN0PyMaXih3dl3BGLNt9ljCt
	 0FgBMJBFqQVIOe4VOKWxZW8BoScYewe1+uNbg34BQsqKPNA4dm7jV0/DnWfQ1zt7F8RP2
	 Swy9cjgvV3bJHIzcNLSDR5BD2Iit/zwoZuUq1Il+shNGXfWUR5jTws+5ivLeTjOYIWW3b
	 6GSM1p623jFabrrfQF/21cg2CFSAN8Wab6qR4PZnBbRYdP98HikOHv8HYyN1AR0OlVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ztkFIPaIXJGHL1mP2JskZ4SRuaMUJ+mxptqDiviV1do=;
	b=u1BvREUW7KQMVPzf8Kvu3C388k8aUocaglizGEGa7qfl+i7OGeBayOSYKnbwOqy0uKFX
	 X9pD7n1ooaYoyaH0+G/MgzlqR/0shiaJzBAtGdryXZddpSHzemOk6ijxRzrdDf0XgnADs
	 7OF4izJD8d2BWw9KmS2m/gy7NAs22yZOmWr0IFphQJ6VC02cf1z8/K1YO3a0OViyG1Mu/
	 swT/cexsrdf1N94Cc+SDUfkeJmDDsrqpI50tfpjmKGG9GU/NgBYTMnoDlUeTnW1Rlt8gN
	 E6JS8XjbdGUTDF3caYHldnV+yqMfN0XDbWxSAvv7oKqjWwu0QI7Lu08COo2GkELEo5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yyql6JnG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZRxj8aR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C27B60A3811
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C27B60A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yyql6JnG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZRxj8aR
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjv2u2155197
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ztkFIPaIXJGHL1mP2JskZ4SRuaMUJ+mxptqDiviV1do=; b=Yyql6JnGQHI6xssC
	DQLHvNyMp+GG0Oh9uCAvImC0qdy90u8OMXsuPSnyuIHMZlxzZKAQSyYcZH/yRbXi
	9ycxC2tXBWwK1Y2jc7elF978CJ/4hkbGnbbeuyFFoedggkEgb4NZlcLgGspnzawo
	dHT60EoDjYugKXOxypk55UqVZjiad7JaW253kF/AAvAT+KvmGBL3VxCT82uc+uhf
	fuEw4DS9XD8QE0Y/eZiwNz8JGlFBdL5twza3wR0koH1DkSHr0aIyn4FAvDaeLW8Y
	C0UlkKG2UnFtCw0YiOAHNwORG2gZBu4fJhy8dYHJcT3vkRTQDsqk2SF53114k9Cd
	JEjb0Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yhkq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:12:15 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a71dd190b0so2392670c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173134; x=1795777934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztkFIPaIXJGHL1mP2JskZ4SRuaMUJ+mxptqDiviV1do=;
        b=VZRxj8aRtobpUr0TYO4LWCit7jNM9t3RnRmfea+Wo+gRM8TFe5LbAGj1gWeyWIY1gR
         jNsnZ9efK0l8zPBdwrUhXMrvnIKjxd3rcCwwmzbiNf5/6e82SvhK6ItzmG/SpT6M2Moa
         IaAWgGOUQWZ5M/6w8xzSM6EHJ5WTYSiwqSFf162TB8IhmIRTDJVfvRyTl4QM1Mlcascq
         JHRuhb5GCOXZqxQ+x2T2vt4hXIyPagmg/ZMalpQTQlvjjsVoNua21Y7M62YmC+a5y5Qi
         dg7A/C8UnRdent/iLDooY3knwf8A1lwLi0Ar5dXPh4lD9yvn0Wsbl0OeG0gxPYi0OLMR
         VLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173134; x=1795777934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztkFIPaIXJGHL1mP2JskZ4SRuaMUJ+mxptqDiviV1do=;
        b=KN9Ag+OeteviUQKFLDlpYh2+RMMUznPs3m1/2Y4AH/MKhslhdF7FKEbZ997clo/LFR
         50e/vPWh0cWu0HcGak7/q7gQNXwlsjTnsnoU9g1eY6/reOxsli5Zr1idw0iDz0amIZgv
         RpxTSV8eh9GM/JhUwQsj4o2RhPXYKejXDIs8OHEMcOa1D3CZQT0blITvurX0oxm7hxuS
         oy6B7SzTfAlBm2LQLK4TC7W0N886oZLCoWr4rJEVzSV7Rqxam4vY09DUq0ozt4Vz0xDM
         czY9V7ifBimdwYOTEea2RFS8oc96odtU2F7Iy69iHtOel2mHwq2XeLsF0ZOsEqllbiVd
         R6Jw==
X-Forwarded-Encrypted: i=1; AL+hErEyLDWVq+rBKz3pKnQTRoqBOIEA/8YE3JUJDBKqyo6JMO6eMLi8DT0r/g4MpZkofO5UJlwXDmRRNJB141U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lqYAvocdZNJyZ7BQd04CoEv8SvZrELwx9NcySk5u7gFdbaEnf
	obde6ypeUNb63iiGi6Ldac1ek1Zt1WF62CNse2WfuEqx8zUCPeioNZHiTr52e2YHE7fh44ZAcQo
	OskA0uCZOP7y6DySrk2Ry8xjfVJhTtc/k7g2/vCucA6dscU7tvbD4xDyZJcqlTChdAB8=
X-Gm-Gg: AYBFou3qK5lJgV0ZRS8yM6o0zfOzlp2CBlUROCJCdvvtLxucPcczmyFIJ9bWLbXzxfX
	tSKNFrooun+9JLURAV/V1kyLNx0nQ5bNHmR3LY94vbleJqPJzatj7je0maBVVvsVmjakV7PkuLw
	obJhlF2YsGqJpkT7h+t9gdAem8Bn/Ef44np5p3NYVaEOVr67mQzeIVLuAkOCIaC5rUwHtBrXwPW
	ONf2+prnjirhddtXeLjvv7jJkkYmKHQLxhGm1xDoZLZGs0pgWx2XTLmO/cz4xBlEBOmgUzEmAKZ
	W3zhGw/ri0K9SU7hHzmMdZ/9XEEGA8+NrKtLsFF9qRrxUuplTWAzNLGFGmOxKPSdWMAjZ91CCav
	Qhfg847y+mY0NyJ+4pzYd0RyKHdSk1k0K/iLSo21qCQyV3gM+kdkwkH67p7BQv/pYO2E8xwGbjz
	hgZ+ZPXEiG
X-Received: by 2002:a05:7022:e80e:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b556924b07mr2781708c88.40.1795173134478;
        Fri, 20 Nov 2026 03:12:14 -0800 (PST)
X-Received: by 2002:a05:7022:e80e:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b556924b07mr2781681c88.40.1795173134004;
        Fri, 20 Nov 2026 03:12:14 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:12:13 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:41:01 +0530
Subject: [PATCH v7 11/12] arm64: dts: qcom: sm8650: Add Iris context bank
 subnodes
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-11-25a771235a7f@oss.qualcomm.com>
References: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
In-Reply-To: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3502;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=W4XxK+uUtwa6RFdkeL/rZGVqVGU3B0sS4/gBlQHEJ5U=;
 b=1IS2OiI2FOtb91uQ+P4MxcszNruZNbEsaRR0QoCPwgjV4gyrVV2HChI/RK7aUl93QvtO3A0Si
 f4Wwp6drd5NDjOC3dQg0CTgjmSp1x4eU1waA4Q1fTKaQRwx3OMh7sfH
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b002b0f cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX36woAuk3MkkC
 PvcTquwsYn2Lu5I73tDLhrO3tQKAKbwTCdU27sX4N6bVUkLQzEWAWobjFvgTyp2zkOtIJB148oJ
 eQmtkFM5789zHcjyu18UyWzHWPBjvEskLLtnWCe97eirk//nmj82X4McLLnpIT+dc+6bipD7Toi
 mK56kxn2v6+PmP2513kk3lPQwfyAds0+lg2d3ISVuz0s5FIAIn+zPezw+HV7gkzh/k/tQ+OfEMs
 MJiZ9gmRNaZseIplYoPMHi2h5kqhSuzNoN9BXrWhQHK3Hcex9meVH8Zgog6qz6hXkTjUByKFmgu
 e5rcFgLKgcJbNItujL8P3aWTP80ua0XCcZMhI60y0H8HXMlgXs0z3uhipEq640Iz/q4I4BWDIJu
 1t4aNOm1gI9dp/uF97vbpFBDwJwNVYzj/tq9eK5WmO+7jiQF2ht1ai29KLkShTbfw6Eqgf8xxSM
 GMt6+mRQJMDJ4Szua9A==
X-Proofpoint-GUID: 5gjxg5nzrG3-eh78fa2pG9_z492KN65X
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX8PwGOLX3ejKp
 1HYWxlvUNjn5sf2gtThUERN0oFzOW2aj762l0E4QU1tONcDgRcTfiQlc+OKUyhIYRw5sJ8MmpkF
 caIqtdrSboxTJe2PYPGM8LGc0i7z8DI=
X-Proofpoint-ORIG-GUID: 5gjxg5nzrG3-eh78fa2pG9_z492KN65X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 5a030f9646c878675f82138ba99ab5889eeb0854..b68859c6a893aa452af2d7d273c7f3d97811a737 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5275,11 +5275,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 				      "xo",
 				      "core";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
-
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5287,6 +5288,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

