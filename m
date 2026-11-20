Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173124;
	b=fSrKxX6EkSAqZdiQsWjbHAoLdKvUgQf5fDXYDIP+hVRNMPocXk7odeL9b/I6Cun1q0+h
	 sUXIGFa7dnTJHXtke49y69Mmr10IwH3azNHMnUE7lK0P5bLCxSD8AdxtI9svSjFUR1Mo3
	 du4QW1NR9Kk9DhednlI6qL9DRJHVPaEuNJIwODO2/t/U4liZVswNBZQHrMZ0n5UfJIZ2f
	 5RmWKx+Ulgd1OCxaaXqTEwm+nEXvUns5LuRN/y5KJn9Z+DGj/87yKKLGA8a2gFEjSgifi
	 KoIOvFyeKTcsOQTVqqQW/YjuLxbY2j6L6coEqebN0lhbXnD87bzWiG0b7p+h+DmvpDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lE5xj15jcc5cyCI7YZbR77iVofNOa0iPpb7G6xuz40w=;
	b=KqlcnKDmSlcAtAVmeoQ/xWoQWNAhoEFmdOeKmYKIdVvtYiBfkhMZkMQU8ciMmmuMwruU
	 zIUd09TzdKTya5unLnpe5oPR7Js5tXkO52xlg1zzVYCoJTMZakk/iwHJAXVa3F7HAJ6pn
	 uOzAM2wF+p+D0tvPDam6S4X3eJppqNDW/X+b6xiIIow/IKiDySwLiCw+jziNgZQ8AwIPL
	 8OJjyozaqJDrz5X2qQmCz0iALYF5ad1ExjtQEVOpDs91ZcQgg7kDw9hffzBcHCmUbfuJE
	 QM9zcLdZtrsbOPt5A6HaSfZEwe6J3ZpMNko/I7vVfcweikJNkQcF/VDjAgrX85iFjfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hG8h5jf7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YMgbiwOO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0415560A3806
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0415560A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hG8h5jf7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YMgbiwOO
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjoLB1462889
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lE5xj15jcc5cyCI7YZbR77iVofNOa0iPpb7G6xuz40w=; b=hG8h5jf7wZlF/Rcc
	CDBwFO+PgpNGqKlBcHeYh28kDAO2x1JlT4ISO4G15PL/05NIPgqsr3az7CBHB8zH
	ljGzAj54E8s/9U4uR7NCyVWfOIt24EdMNgCb/yFTJkAZ13WHI1UvhRKbFc/40GWA
	5NVP04SaZSg7dZ21FFFyFHDyhm/tX7wHzG39OtnF8PAKOrL5a+8oDcr9tSgqK7BO
	DU3NFPwxKmgLrW2jIrVy31CGu5UEiMIZz4skrYVFqmWxCw6zWdhZJ4+pJZIi6fK+
	OUuMZsguYkfXx4Tvfvku/AA8u3/o1StBeupLivRvjTYUDoW4UcQnr/UIvZSLR5bn
	oH2S0Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah6f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:12:03 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3a348a6dbso1472214c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173123; x=1795777923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lE5xj15jcc5cyCI7YZbR77iVofNOa0iPpb7G6xuz40w=;
        b=YMgbiwOOTyJXhJ8Na8bgg+5++JLnbl8bNvs0BCTt4yNlTaCsaYG0ogpuzzcp+jQnw9
         lSMSq9I9uvNxao3k1L6xyFYnIv3p3Lxxswt5STpyU77NixIJfJxByzb1pUnQErM8IIk/
         FO1q1OkfQsaHGgeOLvWcR4G2TTn6ZKshbxUoH2vkasNJMtrsUo2SWOd1RuU/NmMcXHaF
         s7IaRw2Oxv+7hDfh+qYbmd9v+q+Ep+GwOOk3s2PovJrmKGl/Fqmd4/ZZ40HFUwg/UNBx
         UMR9J2eB7oyDWMtT3MjV5DUYpftv8snAqK4iOuRwbXSqrR8eYDRDEOMEvrhkJm2CmQif
         2DOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173123; x=1795777923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lE5xj15jcc5cyCI7YZbR77iVofNOa0iPpb7G6xuz40w=;
        b=E6xcMez4bpx0HlyKMvi7z0XQ3RdadS7uPmO/m/SV9F1zYlTPWLe9ve718xZS2paPnP
         RgSXw9qzutmHC4Kxjvjw14CD5oCmxhXc/X5BfJS7Zr7X0QR56QpwoSljqobwzDDfSo0C
         U6QgBxXIHaOEMHMWxgY03l9nNJ2dc0RRAciRKiN/TC/DzluMz3UdSe2bI4qe6lJZDWXn
         qx5/sE0bv2g5p78QZWgFBWfAwoPPTu6Amy+vYGfDJIGCO75VKLB9ULayQsz3XNhkI315
         G8MtY00Wmsn2GvpbPzADtXaRF+TglgMzLk0aHfmDYsjkyB8k7glc7zexwSlq0LeK47k1
         2LDw==
X-Forwarded-Encrypted: i=1; AL+hErGpKzy6fj3dHOZlj/2wuDJxWepkhnCi/ixaSH8DZHRPs1+KMF8V0h1Uvm7rcmo+1Wom81Wpieiv2A44DlQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Cnbh9jYmy5uty7MuTtwOMeSzjqTMGkY0VJ19ghuauUk1PayYR
	dcg1uQj07Cn6vFm5PZc2VgHWjGYlx4YiLBQ0aF5MtROBPlJZf7E4xcX022R6uS/+7o19X4knKzK
	BgPeW0dPnV5m4m3L8UfPpTotkp9PgmtOqoTj2TAv1H4FZs09kThIYIY0okJDSlHckKPg=
X-Gm-Gg: AYBFou1FCXFcb4ISt1drMu6HgvVMtYjkLqpWDjkmbK3KmKoDPrSYiOkWpN/Qt0dyPVN
	M0E7EBwPLXgDadktjRq9qqc58GjzQ/tXAd0riIFW4BEi1RL/FUaSZCXWWXKp/jDF5oe2KAAxocJ
	+PREZ4JlmReuYIwI75/IL3RW28oymeqUKFT46UEzlaSH7rHXggyQHIuM+wpSnoEqlbSKBwkW461
	ZVovF5bBjikAT3Pxmli0rMxlo/2D/Wbn54LWZmcsshaxDdK4p8oNXVvZBMZ+vJfknSj0Clyik8G
	Gt/nV/jKglpWKBxXDQE8kgV4H4PE/iXaPsMxjnrzHuZJlol3QJquCTvS6agwpR95HK+cgQEXogC
	BqT2DK1A+mY0NAscZ15XlwuRXFS9KNocTODe/DtLnWq3IPzTlbW6MT7vaQvdIbX4G+0yn+vPAJy
	grgrT/Lf/4
X-Received: by 2002:a05:701b:2313:b0:1ac:1343:fa54 with SMTP id a92af1059eb24-1b5568b4960mr2485764c88.14.1795173122176;
        Fri, 20 Nov 2026 03:12:02 -0800 (PST)
X-Received: by 2002:a05:701b:2313:b0:1ac:1343:fa54 with SMTP id a92af1059eb24-1b5568b4960mr2485735c88.14.1795173121667;
        Fri, 20 Nov 2026 03:12:01 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:12:01 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:40:59 +0530
Subject: [PATCH v7 09/12] arm64: dts: qcom: lemans: Add Iris context bank
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-9-25a771235a7f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3241;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=56nqMJ7UtioVIbaYHGKCWesxnXtWYsw/x1i531cBKTU=;
 b=lRvZJjsmKhcuLMAi7DZJOHQ+WUurx0XOetzcQkrDSzXR3Jz0RD6hSGPXGG5ocIdAkXwyFb5Re
 dLX364Jpk7MD8HxJZeVFqQykfy/FvTMdT+DdOoDSXTEdjP8W0m4IhC4
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX+3OOyitkkumo
 9j51q3Geuyak3kc3Ia0HsxlMRReD7yYxrHt1kjwrUC59wnvl/wNpDCSyGloKe2uY+pzTSvV2m5i
 fyOD+iLAE5RehIAzkhbsi4nyfGix4AEndQcRl0vIadmcwUkdA8DonWG0x8vAOlMzfQOwpSE47Lj
 AO316LNYyAhBsXAIDPofR6zVF1/JgWTPko4VPqxaHRLb0/uOGdHiqq7yIBus7GpQqrNxqIC5C9B
 FtAmPy0pWLa5SAjKBsroA6KqepN+zxyEB+jcXdA9JLInVa7l1zAboSMRFvXbXzUHpEvE3dpp7yG
 Q9sb3QvuhT9d9184JPnDd33aJAqaazZAvWZ6qdG5f/CH7MX+3KEvL47bSXDYeTThyGy969YaNmk
 080kiWWXLff9WdX25b96Pz/jL1FKROsPTnCGQ60Q19kO+r8hALAgSV12jplGbfNjX1z1Qxh6117
 YEL6hYPi/wb9ZjqiIoQ==
X-Proofpoint-ORIG-GUID: OZnV1oQtTpm1aTzhuwip8B-rOvFcma04
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b002b03 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: OZnV1oQtTpm1aTzhuwip8B-rOvFcma04
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXzTSXqCjg+qPA
 LqjLzfL8nLg0WhzRU963CnmOMHzly3H0987zZYJMTwRm21tuZLGCnOrK3hFeSaXA8FKuQpXfnun
 a3Ig4HvZYIVgkXK+7ekkm6QgBftLT+Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
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
 arch/arm64/boot/dts/qcom/lemans.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index e298747c06bc4519d10f3f0765d0d6a54aac19b3..26f5b292f4b7525dbc365800ce8aaefe0ce174e5 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3241,11 +3241,22 @@ iris: video-codec@aa00000 {
 
 			memory-region = <&pil_video_mem>;
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			status = "disabled";
+
+			non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
 		};
 
 		cci0: cci@ac13000 {

-- 
2.34.1

