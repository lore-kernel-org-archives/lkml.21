Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172916;
	b=2yFweDXx6ZMz59eTdcG4pAV5fBJ4UWHpuxdjw6mPCwF4XcY6fQdRnrs8CA3gq+YxW5vu
	 +76XPEkuEzoEhPalVwTdh9uSoNhZGN2PT9DQDOS2/xK4k3jd1NA+Jnr5eKkkDNweiJ7AL
	 0daoEOWLEEZRbWsugtRbbt9/2TbFCwHDwjdQJFAzaA6KjKx8nrp8hsXFDUVrqlNd4o34Z
	 QPaPHJmeVC2/gdeup9s5WYUkCDSZ+ACanIUWgo8zTZcZpdeImJeQay7wEnQZFmvUml3q7
	 IIia6yqfaM/AsCi0+N7DO05PZyNI03vFWDmsAvGgLDEg1Rav2zyRUqo42RQyNFf7QFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
	b=gSZa4hdqWpp8kBY6c1CnUHk2G3gUMkR3RnsIwftDdKqPJPWtUF77P/RP3mKm04Kap+XD
	 Xe3m4UCKZIGA5J2YVUxiTIw9i5O+eNRvrgoxTHORDwPorovs8yMrCyfsYsskeXikbUp23
	 FW8Ls3yZCp6xHT+rXRjXjAnaqUH6xwRodU+qKHKidxLGZf2415+cXnagFOY/vb21Z13PI
	 8DAhKfU0y2tAeZMobCc6t5GaDbXVHOjD4wXjfG3rTtU9dKDGvYlMljaW5ms534y0Plw67
	 1M0Hte2UuerSrS8iAekgkAVy9u+SkP02zahQcomltsi/HBfDa87TfVEnuaM80VfEBGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jDRa1RoT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OitSvhKu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C281B606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C281B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jDRa1RoT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OitSvhKu
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjqhF1681890
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=; b=jDRa1RoTaVw+kV4J
	iIijYa9u00DawX4XZajLV97ka6+MLEQEBiV/fMXc2mMzpYlSptndOwbjGglq1A89
	OMH1BMildAfBYUFQtDQ29psB8zoo7r3mp2inArRf57qeL7fml9Ua/E/HD2Avgs08
	X6PGKImROaZV31P1FdjyXf9YtRv7ojUQ9V3nkpwY7JSGOuml2T/ahjm3dA+GD7ko
	ElBYa1MES5HNqGrZDoR0o+1gUktwWeKqOStxJokhQOfb3b28tASG+uO2EHMV8D1D
	cZxmO35EZY+KHxbrowW1rHgHg4uqUeydrPP4aMDQ268wzHiqoePtZ76ovX+3rQ0l
	plqC8w==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1t42v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:35 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-382af5cfc58so2195899eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172915; x=1795777715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
        b=OitSvhKuKn70JIdRlFAzZ+teyFZm8emVOIR5evo7vRSR2NLssQhc44fBg8Btz1ndGa
         Wj7ZYztttLHrDPicUR4xBy7QDB2YdVxcdee1nFjk78obwoWcEz4ANjM6j9VP2PX4UVfd
         Q5T6/mm7BzVe0kdfIIpbFmQRuELu7/8/HtaDBFsg0f0W2d/vd705ZOYXnACymkL7pkKL
         kRMQgVJ+B4CU2iIa86YM9sN/jPkQMv7RXp3T6wFyTD1oZpA/idYV7H3Wb9qCDhnSSbUC
         19bgdtEkD8A+QyoHVF7b8BMgB7/5WfRRPYou1wtd85cH2gEuwPOPoLB63tYJUCzv3j+f
         y8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172915; x=1795777715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
        b=saYM+Dn3dMtW/HZ+Ex99Q85+AthSwWg3Se5XB0H4xb/AuHEgIId3r0Re98yxc7E8rr
         rO6SU9bNesHXWsIt400KDNzdP3pB+7dxVbRRZj4Mhvp27j910y43IziskBJpSOegiuK9
         5WhJ4Re53kERk9E6RsEB+BGPxRtHfcWr4A6mngW658wsijFxo/NTj9OcXQ0z3EzMlXCb
         suE2gv7YaEByKh0MPp6juiQgF7vi4YSDYpEraHM0TObsWHqJvPcdS98epFa2RqyFD+k3
         OB4DLgJA7diAMQUDPtVlYRZEPqFd79OoWKtVLU2zKv6LLSIC7O0/nvFIf+JT66/DrgoL
         M5lQ==
X-Forwarded-Encrypted: i=1; AL+hErEsw5EplIHJzorHndmJPZYXb6gzubEM7QwD4cMGiWn68ckhPa9b0+mHbt8lQAj6jiYklyHL8t8jeJvINKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2lZRVNFNtCoVoDqf+NgUOpznHy6dfIc5hc0OZ8bWx8wCSvsQV
	uZV00jSOGw4cQkUZ/agoYJUtYP0RkVVtnO/rZa0a2tGasZW8IhBtUMb3YA0RHAa/hs5XivYheDV
	MHsbxk1Wa1yXmoF1pgKZBkeOGF5y3SGBnKmCobuxZIrQ9sg/0Hdy7+dLfK47ClPoE2Ms=
X-Gm-Gg: AZFdTZdVD8K85PNhAnfjCtOEs7O9jTxIDp7NZ0+7oCw6kb+fCtTbxShXhPCpC1hPw4W
	3LrNESiYCelDSCOBd/f2VhOobaPRnKrJt/jK48gsgSyrK2sFqqlR83JoZmqBKWBKLFWXO2sy7At
	zgrA4fJtm1NQHbd0GmObStWfcB89WgyGjgDNaDYXHHQ4iLNvTle6olym13wAkaRpyE+pOU7o7gl
	OnE36HUBLS2/GgjBeT4Kg1DqXvyViPHZ7/jpC9mHW4z3nXD+zrl83BcNgOPnQEfG2O3dmmtSL5T
	d3gOH5bTk5irt73Dumdouq4Jg66Ib8SBCYgTVHOtJSFKwQCyJiJDc1QZc6FN/Pm1INAPcknkTDg
	WVTSnNpv09bNu47SoLOZnMPFxFZmb55cAlXHnD9zNN+965RRxwsf3fsyrVmL+f9XOEwPhGg3Lla
	2uuRyW
X-Received: by 2002:a05:7301:6407:b0:386:2300:db04 with SMTP id 5a478bee46e88-38623101ee2mr1056756eec.22.1795172914347;
        Fri, 20 Nov 2026 03:08:34 -0800 (PST)
X-Received: by 2002:a05:7301:6407:b0:386:2300:db04 with SMTP id 5a478bee46e88-38623101ee2mr1056700eec.22.1795172913510;
        Fri, 20 Nov 2026 03:08:33 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:33 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:36:01 +0530
Subject: [PATCH v4 20/20] arm64: dts: qcom: sar2130p: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-20-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1058;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=jWnycFT0az2p/u5EzI2kuq2uyYSvSmt1HyCePSsKymg=;
 b=thxi+hGWX+1dy5BZtvJRpmYMDr9qfMtvkKDe2syJpJn9Hx1JY85585k9BWL5+9rHULVGt5OVu
 82NLnnek2Z5BqczmG6nsufHpIxgrHR4f3gkqXhQm+/IQ6mf3ViKyScb
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b002a33 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=BzZyaU2VGnUrTJno3XcA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: DS6fT6O-DqPa5Ffqf00gSHZBiNG-9kTA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX4dNJskIgSF9B
 au2q/1k9h3Yz0NSqkd9xKoudgt94bWFr54y+zo6yqe3QjaKWOWsk58XtSMXOwZKgUzDZw+RpUfv
 UDMShyI/TPF7mcAndLHb8/BflSUmywwJwtLwr0C5UXQ2qNVdSaYRRkfx7BO0wK5SP5VErCO0Y9l
 AzXKN5XNUymZTwU+26n0WOu1DdzF/bNqlsYfEpbbr2q5xjYqM8ynzAkwAOhXRXio04TVKFKaUvc
 cFV8h8ZbCmRVXpYutnKDfHXL5NC1WL4EhjIhe7DiWw+oN/8gBRzTkQtZCvw6JbpS2GkSYLHq0Sv
 NC0I2fQ+LOaYRnekSYKuMWCIT09aNC39phvUQyfOBCNZViwbTU/Ipa+uotH80XwUX44O6UUyjiG
 VdyAuP0F0TfKdUJHNdNs/VHna+5nxerqzpib4eYJaIKdKTzfaVXuWqIqMQRFVquL1EnHyfoCU9u
 NK4yrBHshfTt6Vq/img==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXw3kermuz/TzY
 AQ5ZIpIdXUAhBqp5ivitZaKejy+zMZw/CflW2pFxuZ9g6LNwt0kh5OXBQ3BIhy9x0seiCkgxYRq
 Tfw514lkPMjt8hd7LzDM/FcT3VUGolI=
X-Proofpoint-ORIG-GUID: DS6fT6O-DqPa5Ffqf00gSHZBiNG-9kTA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On SAR2130P the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index cc4077005e66..950fb83f26db 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -1857,6 +1857,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		usb_1_hsphy: phy@88e3000 {

-- 
2.34.1

