Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173130;
	b=bVTBe6reXAaAiZ+QtL42fTmpYW6pEZrmoOEIIoReddEDXbhNRTTjxZX4AyCWrA9Eqvz+
	 G59QNn/KDcaWm4H7urHmHNPjQjBJH9Wac/1xSyzH29v9rf3JgB4VLWHN/2wZ87Xl9dz3S
	 RI2K0/zuoJw2T5MSVp9ZP6Uisrdu8HwPg7x3P4psJ17fC1kKZCzQbuv7NnjzXIIaGCoBW
	 pWmlhS6NSIbsBNNMhzpwYKg25chdfaQp6RowCjiRm6npcGBi/XWdabYdbN4lwM1fb9Xrt
	 ID/42v7J7eCey9ZfuSUUMcvXX2WvZ35rnJHCuqns2QefQeC5virwdFTyj0LQc7gGOFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173130;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oqZu+4x9fDqyQ44o+g2J2eUFTLu5V88xCtdE1M3ct5s=;
	b=yEfnhhGBdUWC0WNNurGWT2VHoPjHtM0RsyTR801JdtLDkYzLZNvOuzLNlhwUYIp7ZO7E
	 /PbjF3Mhbbm6HZbu1LZaNNlx8obb1qSTUsDPZe/SOYWL9ckMQwovR6SQhMuAHDKC/bFjo
	 gBzVTiYZBGf9WsLGI1JsRxzcvrqPBYwCyYk1mS/Bv73A3MtpRJ3mYpQRqH8pLAHBiT9mm
	 7O1AyX1gj4k37KAZTQGPYk3d6P8XW5zYQDjdCU1pwTx/rAqy9BCndPL2b06NSIek8sWN3
	 Qq5/WGbmUWxYTWRZq+dqD1oTSl+4hfEvkXh6i34FEABATO1ZXxYcWzETCRXobwfoPgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KRiw0IbB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YRXwiN6A;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD66D60A3809
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD66D60A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KRiw0IbB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YRXwiN6A
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkDsu1017072
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oqZu+4x9fDqyQ44o+g2J2eUFTLu5V88xCtdE1M3ct5s=; b=KRiw0IbBHmT6Y5Ns
	ROULM0D35x5Juz2YsgzcAileMNEC80p96/qGos4/1AfXhihuyWrRAUFgOUCFrghZ
	FDYe8R7UH6vTb3hax3+v2inL5jaFX5konNj+33d4VFDbslWosxoiGr5y+U7QWmnO
	dKgfWf8htN5OTF/4uuN+ngax3H3NxGrs1Itgfm11ktF9c4GZ5wADg3YqisgSd2Jw
	xlPJp1xfyHLHttZ66y3cDDoNN4u5np7yBCmWElR5RGs7gwCnrgcvS5J/CWt5+C14
	62PQ8v0lCmgQFVAJgeuNQKUw+5BXx+jK+X918rxWNDCA0YEjODX1MJwSL9fNY+D6
	A1zASA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs86v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:12:09 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b238436265so507295c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173128; x=1795777928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqZu+4x9fDqyQ44o+g2J2eUFTLu5V88xCtdE1M3ct5s=;
        b=YRXwiN6Ad+iPRCqjxFfkYyIjFiXR1z/XFOmE3X+xLsVyX/zdXcbrpeFvlo2vh6wfGv
         4ryM+zlueYPqh21DpbXxfzkqYP3tPBUw0AubRzkjmbvX4Z1VP+IH63JItRl99bIgWoGo
         f8XnQY/vvX1hk9rAlNZ5h4sZAMwuaGSMcxwQtMxR6jb2/hgNDwE2cqt1soOUgkcuLKW6
         5lmzCdRoa92qPfVaXGbrw6ckQxHx0aK2JBQRTrfypx0czCl33ANGEbMlPBfHtjYHTDe9
         9mDvpfvKDgEUe+QbQdbWRlNrzuH3mwAK2LMxlXL/8iprHQ4HsBRuB1yfLQJpJXhNWfMp
         exrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173128; x=1795777928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oqZu+4x9fDqyQ44o+g2J2eUFTLu5V88xCtdE1M3ct5s=;
        b=gD2F4uk4rFFhJwGIlVK7bxdq46j9k5qBV21cI0GAdB2gAVzBV9/t50Z/Z96enN7wMa
         u3xjLg0vfEDAKcUDK6SooQ4SBGBKpIHpj3cwBuSS5beedACYObt53twiJCZF8d+Fu4WB
         d1pnPUqkt8aQcIHzQ9hhS+Ekkk+hdAgjMSZKBi3J5jh1jJhVWJWkDy5O1qb/3BU6y3dw
         xlMMz1bUg3NRq/qqY53OMMcBFw6d9frMadzy+r3f7kvAQHDqQjTSAkdRDo4VsENYQx7E
         DxONRKq+ydZvzgL4Y/NrvUFHnh06P01xnWTaaja4rqzk0y98Rz8UMn0PjyvPyWhGs0Zp
         uIGw==
X-Forwarded-Encrypted: i=1; AL+hErFJ5PdHegijdan6JDxn4VbUz/5zYaH98Mwy4742jg2SYQyRcbyd7UxKnCvfk/rf0/vT5oqBihzJ4szQ8HU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Zim70Il3U41DsiBeh+0pb8kQ+kVY9pvqpCDizyo5HklPMbJCW
	pWjdQSc/E+GZw1596UItUz2b6Njxx+JzlkOUnUpHDZSggGFswU6//dmokFo1abK3QZ+AKZpL2Rc
	93JJuVOFdi4YTbT2mZOV6hbf6286rfFOaAgIsZ6JjO1KXXG+pCSMoA1JRrw2Kn9gzi48=
X-Gm-Gg: AYBFou2mUZzDW6EgL5fQUYD6KC8ElzW1s1sNrPhbyUtwdsOpzBhmf8ksrOzQwMgUMoL
	cq7NavBD326BqghTWJbwNvyaSOmVB/oIkcFv3ZyZAQzSkXmywbNhDkEX7jEN7PRxGDDTTpaJTVj
	deUyG1j4ziNnqjaFI5yY04IHJoLsUKTMFO8NGCyEE5hc5AlUgd3eWGkW2FvVmD+fJC6V5e3JdHX
	V49dtuRL8xsNUViTwtZIH3Sz4/6iStX/lSR03FahDBC1IIp1aGpTzwHLPfQW2cMiCUf18cgycwo
	S5A7SVymdcVbnR+F6v4TWabXppXuO0uG/r/0iZiooWjilUFGDwe45cqV8bshtJ0UIVi1OPqW3Ld
	TFwMW1CFxoDSxtZDyhBsim9XyJvS3i45ZPI1k8a8iAqWQKGxmWUIVTiWjHUFIxOk2NlDei+UKE2
	dD3csrkKwF
X-Received: by 2002:a05:7022:7f01:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5568bb55cmr2509375c88.29.1795173128323;
        Fri, 20 Nov 2026 03:12:08 -0800 (PST)
X-Received: by 2002:a05:7022:7f01:b0:15e:9126:c60f with SMTP id a92af1059eb24-1b5568bb55cmr2509353c88.29.1795173127795;
        Fri, 20 Nov 2026 03:12:07 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:12:07 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:41:00 +0530
Subject: [PATCH v7 10/12] arm64: dts: qcom: monaco: Add Iris context bank
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-10-25a771235a7f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3345;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=Squ3Ho/x38HQ+PfZC/ca25g9bdRa6cMHaBF7TD1Laj0=;
 b=UNXJXTR7SlrBfmvrYKPiC2eatMbpTEzjm36wV1DMG5gn/2evsMiYH/2ID9Rs2v1PE5eoAwkT1
 vtf9osnY5iXDrjjBBqQxWdoDXxeeR2WAPbvutj9EinTL4wAsFMByhG/
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX+pEYlA7ibM9T
 pk1i/TJmCB6mGUeuaPr9Kn9QqJU3ZwLM+RtRLZe99dJsQ9Si7I4r/m3BKk5idqjTaPe5MJCp42G
 cUjAD19uED+oaeqYybFBdQfvNZ1v6LFunpbstvuOiKqVoWnDSD1IVWStAbCDdmPKANAnfyX1Kq+
 XE0B7H0c7Uoi3QNocnAURTj79G6XeRI6CYx5K9NRbWY3vwvTRw6NlO0hCgutRbamFTmCLhnB6hc
 vFTJKkakFrZ1Gl1oJrqeuMoD32C1J4UoygA2JxPsRG+wwOfbqLf7Br9pbdExUFgXYSvQokHFW8W
 bUbfUis7hlVQqm0Yc1+1wpF9qvkrzb/karTGQ19wejzOPrNuHt1te0tjQlqO14BgKyuzoAQ56Im
 VTVudURgBIHnAnFi2waK7qiEbvN7NREWOEILRAb70/dBsElkdh3U975jURNcxvlbUaK1N3vvcM3
 wg2tqpUJXw3t1NOF4DA==
X-Proofpoint-GUID: 070NObqWc8CwJTTd1jO41WQkYnyYrPU1
X-Proofpoint-ORIG-GUID: 070NObqWc8CwJTTd1jO41WQkYnyYrPU1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX+teZI03+cC9N
 FariNkuMTswalDppaolVn4fkl3YkaRpWiN52YdGFH0Q5RqIU9hEFlkGFTAfSwY5a0lS7PdFlhOI
 ia5l22wtDU3CFLy5xCCGWMCh6+qo2j8=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b002b09 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

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
 arch/arm64/boot/dts/qcom/monaco.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 3541313a79bf47fe27499f6dc370cb778d780a08..e4805479e82595f3e4583f051cf664ff97b43aaa 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5419,12 +5419,23 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

