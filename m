Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182249;
	b=RzBHzjqDgA2vYXjUjzlxenBA5VKPBCvV7nG2LGB8P26Mq2qwl5OUsuL0VChVs7wl0sTJ
	 kEDt3Ct+zXFvEK132uOI3yj9pnUBm/MSvbcMvwAFLUIrgAznQFD3mQ7gZ5q7DQTkgV04J
	 SJsWI3KSMGbTx0z+dhQSDcxN3C7BASgax7PLlwgFGYIGL13ZEezLqGXhxVc/jWHYTiQ/M
	 ouqqDZcy3AYTaFLOLMg13AQYxERHmlE6w6Gt2Sp3Tnj7EcJ9Ew/CzLCcYBghPR0eFoRLd
	 0UlIyM+X0NJAI8bKX31Rdw1DxNN5albsUW3IA6rb7bCDUD3aCpHJ6YxRetKKQqeFVnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182249;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
	b=opfae7Ynz0S9sJtJkfFvZXLISBOwxlpLBG+K4aKhLfkm+epAYdXtrpoA90xWgOgjSraN
	 7DvmMhbboQmd3gujfVOe7gNmbpK3DKyKitcmnUZ55vMUC+CI4AGhXGmQO8GNOqjIHcdjk
	 ahHff4myKaiZxRA09FWOJSTM+iVvq8+faCgNAnb6Z+vAsw4bDKSo5Uy7SXTJ9JQeYvicm
	 UsMDhtlaDv8HSdEchpCnucVXhWdPoukmn83TnQmxnf/mqkbJEO8ihk8qAaBAZB3GQjJQH
	 vh4IrGpwQU4L7+WgPfgCYeOQTegxG6r+cnG8FxOU8y5s8yyAXeBESGMueldCoU8zPiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ue94MDPu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="X2kRj1/8";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FC460A260B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20FC460A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ue94MDPu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X2kRj1/8
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjsrw1681938
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=; b=Ue94MDPu53ssd99b
	5yrNxR81kRUlASxau7HIGQ82RGqSPI5d7tonixUXf8jZVUgM+UXr3Mk7VWP7HiAp
	bQjMHPB2qHXkV15DTPPrWzu75QqVnQqIU4Q9wTkGZz0n+HlCbVTPjPtAS0qQSHF0
	CjP/y7ulOliQZS55vDHv+kg+8Hn+NeR4wq2PF3T5zUFRRetgm22yQJPcnl+GBlTJ
	znDEM9wqc3tGrTDBlRptgMUoLhPiwDFHAeH8VVKU6jrBRAvvgLH/Ir4gBTPAEqgu
	r8E2oqtfqiRxglS5rijqi3XlHKSodiENY8XoNVZvdiYjlfL97iKbLlxVr53Jhqqr
	yWH1vw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1tqep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:44:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3724667bc16so713862eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182248; x=1795787048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
        b=X2kRj1/8W8bs8A9uZEzmykqdQ3wluzJ+O0vlv3B8IbdFHDgPSDLLF0MBQC4SfrcAK2
         ZLfeTmK8kolsaHW7r6u8RXUz1NwjkJsFjLiEtscCCkd0yjAMjslU99DSbdRU/lvJxbdm
         Gb670DWAwLxdEIavBboTYT/D+Y/qkWSn5wbG8syyW26M4eJwEh7Qg0p2o3XYAtWDruE6
         Wbt01pEneLilcspa7+rT6LkxXl3rb2qAzlfvEG144rIHZIwr61Bp2lQ2UW6bQQgMOHcw
         eUq35fapK3Dh4tHwG+edX1/5eK5NtYNN8hB3XNl9zrvK4gguGv1Ee7E57BFrCOHZ4PBY
         pbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182248; x=1795787048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
        b=LWwK03Mxqf8mtUiF9ubOlUZQyhdytwI9y1otrnhVJEG0rbNp2D9KiILCujORjYr5S4
         HptbtFH3drih2wP1MxHAgixYFYcz0cnAaGMr/bDppb69bPNOPCOyo/J5u6JzjUEgvGj2
         /Q2GsdUlF39uEgnJEX6N+1sCbHrh5I7rz3Vf0kvkMm4SO6lC0rJQaNOZDHBD0RnSFwc8
         wyEn9FCdeo6hQNTdZJOE3TgPo1rPOnpA3KXfTjDB7eddqrcybC/XGRFiZY5zLWOUhL4C
         Nv5M0AFE3cJCz36O8Su4+OVG5lJ5OoKSNCuAxXgkqP+UoKr/+0sWxTNDlyqXIls8LaH8
         nbtg==
X-Forwarded-Encrypted: i=1; AL+hErF/VY4o3roz6jcbBKoYtQKmIcmlCdwk5MlZHJQWaIRnnMeCygYi8b9+6eNAJmxGYFt4BP+FHZvZWvIXNxs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NHQncx5q+pb/dZ/SIqhYaaZu00slAkZvrx291HkdlhZ8IrI/C
	ubtrqf2hsmIuKqgJZAgf929/6TgzbwSn5iJbezVbd2/EPLp+810ayciDEV7JheNzJjy/7dT7vub
	SQ6TNPIqa9pF55dCfGktZbBMhrsyeMsMX1vxmLLUiX2TIhAZuYY8yFAXrOgQeuiG1YTk=
X-Gm-Gg: AZFdTZd5FeIKsmv8kEk3k+tmWfPwptnsPcFVXzSXhTKuduc38zCdFGaY5LXKFwxEXMg
	p4+pq3WQaPVNd3jrdU8aupsFrSQjjXn6mrCt02T7Q73MtWS0F5NFDYI0foXMQHl9G1sK/3dD04S
	PjUFd39LjZKpBTsIHVAzbHZA0zxMQock7yN1dwlTO38tZbuAj7Dkf4sEMa6cSg3pru39RZWhdvk
	wXAtq9/CkqWoRoxYMkZZgkhnunxdK/jJcGlEPLksuKzKezo+MuHHWduCMUjjU0EehxvJJU2DUPp
	AqQ882kJMHKJ45SwXfWBNls9tu8JylKTQzq71Toa26Q7ttMykPaibKIiPqUlduOaZCEZulxq7D0
	sc0i0woY9m7HAKj2w/ie2cmZ0SCANpVh/Y+EgMp35sSY8T1QYVtGunKmtDWa5zFH4BKV6cLYWRQ
	oGd8U=
X-Received: by 2002:a05:693c:894c:20b0:377:3984:5cb with SMTP id 5a478bee46e88-384b446b404mr4506006eec.17.1795182247785;
        Fri, 20 Nov 2026 05:44:07 -0800 (PST)
X-Received: by 2002:a05:693c:894c:20b0:377:3984:5cb with SMTP id 5a478bee46e88-384b446b404mr4505955eec.17.1795182246955;
        Fri, 20 Nov 2026 05:44:06 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:44:06 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:50 +0530
Subject: [PATCH RESEND v4 19/20] arm64: dts: qcom: hawi: Add GEM_NOC
 interconnect for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-19-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1056;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=aYGbyD3vlcsShV5PIBfgPkIOIPXgEFvWy/UpvGRwvdI=;
 b=q0jAIPDrN516XpqWB22OPyiiHWhPk4OWO4JIauodmt8cg4tveppR8S6ZONPWykogDnxodyD4z
 imV2vWiod2ECCT/tBCJlHc3jWV0NxantFLQIjX5kyP9qJhyjQ92MeCK
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b004ea8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-u0lSa1b7RXV9CCC13MA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: t_pSC9fCM3iifEbK4Tnm9B5nkiIKKIUv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX1Ct8bW7LjGra
 KQjpqlzxqNihkIFpb5XRYJ/1tTuIsQ/UiJhWo1oNANXoTj0DAR+I0hpBSUYV0i7gUI3FqIpAsob
 b0B6Fqr+b/uiPQsD2p6MHbyVc2RfqxXPsyEya5KwtGHD/mwzoTqt4UKR8okg7VZRiynTAFx0h8u
 Zrmz9JZg4M/obZ9oFYn5cXMNn0lt8BIKtjG1u4qxhszQG++ffVI6OJgDaJbcRfu79a7g/BERvrB
 3uDnz3eFONZ88FeJ7HSoLt7YG7deLW6PwK8QcsVS5xGw1pONYoUXdh/cEzgy0pXj5rRTOgSdgl/
 3aditL+Kdpwl/u3QgUH4cZV6D/BNYop7p1la389KSVRAwEgYxk/ufeoIvk6RtZp5TmN9coQ/qQT
 I56FKd1DBX6vnbqJHP3MWMTqDX1mSEkfA7Wxct1QaIzVnQGLsSaMXTi+XGuYgOIw2dmnmD60Fnc
 OSt43Er8ssub5QLvc1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX6+401lbpiZht
 qKyQMFY9wAnPPYqjjVeYHwd1MW/NZ4KxNPDeY0GJVkFGnehIeODwD1SaT3enTFl3Y5+PXYi/hfH
 61U0Fj3yPMuyr8A97+e9aXEdsHFlIEs=
X-Proofpoint-ORIG-GUID: t_pSC9fCM3iifEbK4Tnm9B5nkiIKKIUv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On Hawi the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 77d704fa6cf7..bb60ed9384c6 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -3685,6 +3685,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		remoteproc_mpss: remoteproc@4000000 {

-- 
2.34.1

