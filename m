Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173098;
	b=Gyll4P6M3w3KMbkCfCzXYNO368R0XHdSMSeHjU6Zcwm5qj2gObFY9YrGsDAMTRcPXPuM
	 3hwq6W0pTaTEoXry/+G+HRXI00v7MCwz55f42LwY0glJHaobjLLOt+IxGEqLtWLthoNwd
	 DVGieRZjryq9RwbRdFWlH5vp3JAtUDYnrfK0QOWES4qTyKe+pFlaIWnyV6ZYzZMf4oNXa
	 aGRtasZre6Plpm/+/ypGkLOM7O6XJAuPFzrvSKO3X98AyDVRSiDY11VbS7uiPxi5Of7Fm
	 QyZlzfNuba43XP1gjUmxvkkWYq8cMLaucbBFyJZbpmP/0WPpN8L2Ylm4WbygvPtSF0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=;
	b=rOUmppnEn6MfG+rqFEB/SD8pd29sg1U0u/dawMn3xVV6u/XMUtDIFHKWRTUEf/QXqglY
	 0he0BhW+Li1uzbMXyl+6jF46qNZ1XCJvwvi6DTE3i/GEx5y9ZnaZ4RnBmLx7AIIBj8ciD
	 Y45K/tD+sFAvJ/aZljOt8Xp7EwsGeq2ov7w5uHBdm0SW/Fex3f5o7RxZUOTusGd4exAtH
	 cLYFq/+kuPzYTiNTPUVDKwCbofBUY0U7LObrFW2YDnZCGtmklg0He4eQ8YM4Bu+mwJUXB
	 EgTyCHIu8M11fWMWl0EnaLA+AQrJwPRvVEVd4d16uLFa62MWVNkDZy5o8Uq1B3BpR1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DW5PlaHo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TA7kVeTa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7496E60A261D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7496E60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DW5PlaHo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TA7kVeTa
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjvhJ2155198
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=; b=DW5PlaHo+GMxM/ur
	MuT7MEh4O73P+B/nQXxKaAk1IBU5YP2fFrGOxcru62AFAsqkTk+RtkgM6ZNOVVff
	BMUUV7O1FrehgP1unaVAlZmktyO42a+Ns1LQbclsGSVLfZolyDU+4HT72QkMIXRn
	sPNInUIDtCjqeQBUW4+lSQALet/YQh0FVU9+oUmQzPbOa+qSHGrumP69v9Q5RuGt
	ASvbtd5raPeHtGsV1dK4gslr9LV7d5gQzYz96K0k2jMPdOba4suyu1b6bdSIMJ8b
	h/IUWKkp/avlhvCNUH9lcKy/mEUhA4qvNkFEClnwEpmTV5P32xlUPbAgMWNiJbNO
	oO5k1g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yhkm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:11:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383435e46f9so607391eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173086; x=1795777886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=;
        b=TA7kVeTaXLAWow+VOrwkW//92eGD+mzync2wlDV4GXB3iUQLmGa464o2G4xFWYdSI/
         By5j5QYfh6a70cAJAiw4LTNtuHdTHld8gRefCH7zQxjjRo53pkDoNpE1LgB/phm6gYwi
         rzPNOICnHLX5tONCoYllrgs44gWKbcDNkH7tnFGj0hTXrIntgxxhFHKad0YgXHkdv0QE
         0ojyKe2fJNE3TKFjZ0ZCn0FLMlLXDB5JuFXT2azEGoPtZAJ7wmF4ShiRVxVWUNR4tpbD
         Gyracv6gtGT6qsdzDuTlSehIrCqY4uJ+k5VBowwQJ9TuDctBO6FnO0h9qEaZN9yGXiCF
         H8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173086; x=1795777886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFyVGKvWzfLCM7ZESFhQabAqKjSsfD9BF+7+SB0eaNc=;
        b=hDlvG3hs+/1BF5S1TRQxtxdsi8u/o9mwD5ryKQYGQBuya3jBqH/4RHwvJC/QvZVGdf
         Ab5/2OmJ95p1VTkEDjX5NCgG7GHw/l4W+TEwuZlWaUOPKyFl6QEcFTkdEaQhyi+zbwFz
         n4GIbEVCZwUYUXcRuAVgxcbs0yupJMLZYIQ5K3jZMNeLWVTuvYCQaIeapOuwTcz9Gb4f
         x9sFXI6D55TrFmmIwhtCKbQNx/qhwvjEKbHWxsvzwkXQf8jpk4nDnCHXQcv8eNJU9B8Z
         e9L08qMDieGHdw5Pylqga+edEElYb1efucNezgepqaBWenzUJ87rBiEBu7VzTfAJSYSY
         AKOA==
X-Forwarded-Encrypted: i=1; AL+hErF+xxRPahhGiqa/OXG0M2IwiJXNOg7Sc/FmQVy1kSHSOmWte0kqpKoz1CZXDVqiN/JJzbLxS7DWNpy8ohY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oQ0l/WX9GUghuNHFa9BGAbaGpULQFmsvw5T3Tc/Gv4B23eTA8
	4ZvwXMO+LbcralCCxDEfnOfIDNgeY/b4iKMBWMN5lnP0y9Q+P59TkiM/uxt8lTlFNj+pygm9YQm
	O+O5nOc53gi4Uz4nqyxMHuEDQ/rXNW5BwtvDAfRn3qV40dAssYveQ5iER3UA0brtfVH8=
X-Gm-Gg: AYBFou2lD0u/hJ4StKadkUS8xWISGH1J7iWrg/Jo37WllBbMBoGAyajJbEowDj3H7lv
	R0uTyyByrGXF0a5PJbCWc4AWYxK162s2w9iV2mXOiCCBBtGc3v/g2YEdqMOvl/r8VB3NA7WwK8c
	IlW+sKcxTZJ5chlXO995AAFFaM9lJq+udU0JUYqEWV8tulQlcHYPCvOfgoLVs2erPzQrrM2jkYG
	5rIJgy8Yofv19GfOfYy7T+jRfE8R8DOGEo3BBIKXBlIuShMGAd1oF+JdI8XCR405HD5rVWJe+Tx
	5MWDnBWclcZ4EFBcPUvKA0Tv/GHV2ivETAdVH953V8cNS7YUAzARUoR47MQ8+KQGJyPXpPSeLo8
	ao9j1+q9REQs1HQq2k3JgUyWiPCU+G1t4n+AFw87hYwzfEBXqxE6P11fFcldon85OQXf+p7aB35
	Q0a4TCEY62
X-Received: by 2002:a05:701b:2816:b0:1b5:3b83:5374 with SMTP id a92af1059eb24-1b5568cfbd9mr2321087c88.19.1795173086082;
        Fri, 20 Nov 2026 03:11:26 -0800 (PST)
X-Received: by 2002:a05:701b:2816:b0:1b5:3b83:5374 with SMTP id a92af1059eb24-1b5568cfbd9mr2321060c88.19.1795173085529;
        Fri, 20 Nov 2026 03:11:25 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:25 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:53 +0530
Subject: [PATCH v7 03/12] dt-bindings: media: qcom,sm8750-iris: Add context
 bank subnodes
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-3-25a771235a7f@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3890;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=PnAbHBLCBhwxjoECu5HtUTAmt7Aan6lX4I7y/GynILA=;
 b=qsZFnVFAbktuyaJ+PRXtoqLSAM8a7U1wDhjkQMmxbYUTZTy+P+7Z5W8SIFtEwd9cMYrvHV0T/
 RbM+XYPlqGQBWQUHMI3n4q/cX3FWka2jOvHiWOP702TcezwrbWzGial
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b002adf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX/RBEALTPAgLG
 HUxEPikvE+hcq0Rkt+SyMXjGRFsnj/KAgbu/Xnurs8OVs5QBwNYeLJApkWJ3uLVvL2DFXGqwuSY
 lvhLgT7RgwzfY/kkZVGThhnKgucrmBlYnEHCOrSEqUgS6YnvdCRr0v6p7uBq2rso5ZSds3ZVRv4
 ogwL+9GWm97i6OJ2Z5E6VDPpCPTNued/OE7zhdJDu7YjkOpaeG01cZB/IMRHlf/cWpFxmLGW5st
 k08MKr0BZ/hlfcWZoglYt2bwQ+0oBS3UGU+Cu+Yz7CZUCJ86iGVyz2j3v1qNfeH35YBCprsuz74
 McvE58JLqg7Ivm+xiAJi+zD9XTsOKugey+9GBga1uMlzRRIZqYljC3rU87TWoidpjrEgJhcvX+S
 SViFlgowWzpP36mIWvjdjpnMU6uHE1fNpEPgnbbjNYOoqEv2f0npkSqEG/1petty3kuOEFxFm8O
 QdIOfFqARX31CWicoRA==
X-Proofpoint-GUID: idtzBTt5yoe__Yt0HDzvBy4Als67V58C
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX2k43Iz8QmJak
 t1HbN13P/3+BBOS1sx59Fi3LdcQ89IXBYwh9DBBbMDVsAjc8GY/qvZ3w8oiogMgBucNER9DZXVQ
 q0tb6jN6+naN2mMtm/XOWCd4oPH4EXo=
X-Proofpoint-ORIG-GUID: idtzBTt5yoe__Yt0HDzvBy4Als67V58C
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

Update example to the subnode form. Doing so, it picks up the supporting
properties needed on the video-codec node, address-cells, size-cells and
dma-ranges to declare 1:1 DMA translation into the parent.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8750-iris.yaml      | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
index c42d3470bdac796cc878090e65becf6b62bd80ca..b6d5ded1aae6a1a6836c2c24b1dae548cdc6f9d2 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8750-iris.yaml
@@ -72,7 +72,6 @@ required:
   - dma-coherent
   - interconnects
   - interconnect-names
-  - iommus
   - power-domain-names
   - resets
   - reset-names
@@ -110,8 +109,6 @@ examples:
                       "vcodec0_core_freerun";
 
         dma-coherent;
-        iommus = <&apps_smmu 0x1940 0>,
-                 <&apps_smmu 0x1947 0>;
 
         interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
                          &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
@@ -144,6 +141,19 @@ examples:
                       "core",
                       "vcodec0_core";
 
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xe0000000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0>;
+            iommu-ranges = <0x25800000 0xba800000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1947 0x0>;
+        };
+
         iris_opp_table: opp-table {
             compatible = "operating-points-v2";
 

-- 
2.34.1

