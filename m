Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414761;
	b=5PW0JqFXaezv0/msz5at7ZECugmF/tbHRcO+W6TI5DGDlXBLjjM4brEEIW+YD/knDv+V
	 pxG1mLrZcc6Pt+asgG8XcnEI2J6vS4xDN7T/vadBh6qHup/GxEhMg38s9UfIpNeIZLYVT
	 JJuM5aGIBAAEjHGH6Qx85YB7HZUMbj/u3UhQKapl8IGy1vaCDRRYpfaAVp4I2MgfVXLuu
	 unjTB1jV+kYvTILAZ5AEzgLgrNsaww+DBHpPBMalxBffwtPBu7o7UJUlfI1diHhONn0Hh
	 7LsUTvKF4yDbJos/1ykQ3VOzFRH6lZtce11o4mqGSS+hPMgC8kFBJLnf0mZAI+d+MqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414761;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XSpZkMD7Rsy2ZRPDXu5AAOdX7ZO9baxPnmoCe/lLFgk=;
	b=jZ6flBxpq4K9yAggkI5sGhHShgWkI3rwc/PD6oikHJLAT6JAby5IcRIP38q0Dyfp10va
	 fkcIOOvw7vITKA2+JxJeiY2xFJnRjJh7friobScTs3l0MzhqT+CNCxbGL0ZTonurH9paE
	 SVZYGEU8kgZh526lNNlrq3snJyeUzSbOfdtoamHkASqCTe0TjQP03tDMsyUWPEY1eTwoS
	 GPuaT+0bYF4cyK+fxal3y+AdeRcqjMuF89Lg0GpfJCoXubBXAPJY39QX45ol0B3j8RoKC
	 74fcrZoUhucDF0J+q4vTAPMsoaAs/Ft1+dV+Zxj1gaB8FbWpXO3qNNY0vlIaIMo9wYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IZM5WtfL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ew+NZLpr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB76606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB76606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IZM5WtfL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ew+NZLpr
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6DYW91490117
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XSpZkMD7Rsy2ZRPDXu5AAOdX7ZO9baxPnmoCe/lLFgk=; b=IZM5WtfLDs16Xb1d
	OxE+40nA2QskcQ4WGzwO5J/mOY6BJuP1s41V0cwcbs1a0f4gWh/iTZANrAu34GKn
	/JX8FDlx7H7XSZQWLA13s1Ctesj5MRSmKFp7+lW52J2inB+qiQ22ukwGz+WIPele
	55Vk1UCKLrJEnBb+rzpc3YD9w2iYIHy0OvEAxsHRMJ9RZa6vNoNLNc6g5ziitA9D
	yFA404bRGnm2nqXQ2+3OKLL/CQR0YQpO9XQH4D0W8966bc9xLZ86wlyJj8ZQ86dZ
	Jo38/4EEGKhov/YCB+3SqsGfjEHbvdr9Cb5U0q3zvD3AUInALKB9F4RWln6loOUJ
	5eUgZA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k00g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:19:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb96533adfso1748810a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795414759; x=1796019559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XSpZkMD7Rsy2ZRPDXu5AAOdX7ZO9baxPnmoCe/lLFgk=;
        b=ew+NZLprX0gYNpImVkaKyRc/kNQk/w/RrlxdjCnxxE+5xAGbL2q7aXzcAuTtKAKukL
         Vq13s7QC5DM1GfTCM9Zd1owd49UpGOYCc8aGQvGlTcjezYRyLqNPwcaEOJUN7l9k1vqk
         3859sgS1SISIS8tOg56E7uVa/w3XcuwZF9fKV3tbitBr0eC82c2gR12eD5QB3mlEcQro
         s59Zlhu231Ifa1QrF9v8Bfa0zpuJ7sseWIKGGoX8vYiK83PCt7HwiRe5JVhnONqz04RW
         5lt3W+khFHcWUe4f59oyYfvcH8Zo6w/3yH9ZQiDm60imreDpzaGTHc8PL2U6YjozOkhD
         K+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414759; x=1796019559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XSpZkMD7Rsy2ZRPDXu5AAOdX7ZO9baxPnmoCe/lLFgk=;
        b=A3nCB1ssu0azPdZ0qhjf0YERPnPV3n7Gqy03USsiihZx0dNVxUy/XabrkKXHGKCQ20
         6uN8oM8vhvx0EkJ1YiLSrTMxcCv5XM2tMPhiBA78TUby69UUSNooY3okLeH3b+9Tj0nH
         J8el+tbUca1GAdTs/Wl0Hsl/L7fMs1vQg6RzTt2rRqEJRUan+NvPxTzyLQ7rcKbfbvY6
         UOKDHwuaVMt6OZw6ZsD2Dj0/r4AGCwZnJxT7CtT8nKa/wmzcn0hwzHnDNDSzSFGyqr3Q
         WLd6AxFNZeJAUevGGmev8yTdbp/Y8B7LWHl1xh71jMNSWF9qK2ekrgrj77hztD9xiiFh
         kYaw==
X-Forwarded-Encrypted: i=1; AL+hErHEWgoSn/sHLKk45JRs4al99aVsLPHmM92AXseFRmhdnNcwEEw4lNPZ3RHYdjcRFPpBjXtjQKe+jKZGFHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zHidOZkSxcqUzntHHbB2ub20fU1Hj0STazy56ynyfpFqlBfUG
	qHvEptBbpPCJGW5ArgS6G2XKgMUvu68/3agMtEPOIPeyuuCXTJfyh44c4PK72DSTMnfHqIclUhM
	xlL761a6+vlEdYtYcY08/c/FqC4O0TnKw+EwLn1wyPwhXnELy6bFb9iY0zKjZK/2SH34=
X-Gm-Gg: AZFdTZfXa/XL2VQx+a73NL/ZLDJK9exFwbykk59sZU/Isu8Ozd5wd4uoWRuahKlOuaq
	7IDd0UDbj/L3hICBWJ1Se98NVk66SkIiZpoNJ6Sq7KPt5zxi0HMAipX9WCLHLCK+s8pxSHDXGe6
	h2undCw+f9tnMhOcLsxgMSWh9Ibk2gjBqE6TOMGgeIy9eE2+90VjwveiElEGIBnBYGhrrjIxXjq
	ee1Rj1TYQG6xKagNMTjltJwW7BbCmEXW6edNhJ7jCs25aEHKH+InWZCzVFDya8qJ2pHZNDTNdOR
	CJWsYrZ7nGjTj3hQChPzKZNimuZNH8YFkIww7Vi0/T6KoxqLFCxG1qc8n2oha1N+MDbLbYrEsR5
	atwGK6TRgcX8BRLVyGAvwEFLUEWh/fUSvYAG58DhNcgIXZf0YLsqKVTIW/CneWn8dcufwX4/IRi
	B643OxUpah/w==
X-Received: by 2002:a05:6a20:6a03:b0:3eb:acc3:1a4e with SMTP id adf61e73a8af0-4014e25bbf2mr9414072637.82.1795414759162;
        Sun, 22 Nov 2026 22:19:19 -0800 (PST)
X-Received: by 2002:a05:6a20:6a03:b0:3eb:acc3:1a4e with SMTP id adf61e73a8af0-4014e25bbf2mr9414058637.82.1795414758727;
        Sun, 22 Nov 2026 22:19:18 -0800 (PST)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm4955870b3a.2.2026.11.22.22.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:19:18 -0800 (PST)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:48:56 +0530
Subject: [PATCH v2 1/3] arm64: dts: qcom: shikra: Mark RPM message RAM as
 no-memory-wc
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
Message-Id: <20261123-rpm-memory-non-wc-v2-1-3e868b4bfa48@oss.qualcomm.com>
References: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
In-Reply-To: <20261123-rpm-memory-non-wc-v2-0-3e868b4bfa48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795414746; l=1496;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=q0urUXoPpzalUSHd+qQCncB0vMYbbN9c151Qoe8+FlU=;
 b=B0dtJAPHvUdcfAhfswCOZ5J8atpc0/BXt3WCBPeYhbtWXTn3XLr4tkCgo7fRBXQlTu5uEZvhK
 HkRR8EnuK2RDsQtF5UCgQj3ko5YI15T0nxcGJkGnG/yy07tXH2SA4fE
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX99g2Lz1BW43S
 MSLnwQKWY6tDB0uEZIWt3DNZEdPOxbgrHK+L7vFh87KZd0t+RgEzprkx7+qFRHsZDysN0nA3GBa
 BdUiSJEJ8q84fBDbgDo47pOmP+vqaVY=
X-Proofpoint-GUID: pshE6ca55IIZWTIP7G_UMSo_qafuXCHw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNCBTYWx0ZWRfX5J1G8YtrFywR
 kG7dah/u7RQzFDfG0unKXlCcOjSPk5boG+et9YPXpMubOzzCIl6zAPq0x7dlQPJ3tUIhbr8jVSk
 J2MijCDrp+4e2262b28DtHJqzsf58RBgEd7iMxxdw2LYP3o/zmKo5BKDcMKyT9efZyWuD4PqJi9
 D5l5T65qoeiZhiPCByAVWQYutIu5nFX8tI3LKJFOgZkzF/XZj27utQpT56/oqti+pKR1txe6kJS
 C4lek7HKe1L2dRo4wTzO29UnfReNhbyHoU3zUld7X5YZujeDbk32784rawkuVcvgwLIeh5Aw0qV
 1tj9pan9hzDFG4zbZJKHfMM6A4/NZ0aVdeSwu7HnLRBTGbUScUqjI4HjND8IpPCVjDldCf4qUMv
 AipibcarLPaFgpj8BHbjFEc8ilSbtfV1vNS7jLRHiqHjN+6gfu3NljpSOP3Xv8HX+rxAInjb43t
 cf29xP2p86ocIAe5hfg==
X-Proofpoint-ORIG-GUID: pshE6ca55IIZWTIP7G_UMSo_qafuXCHw
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b03dae8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mNKF3LC1gVCpUj1y5nwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230024

The RPM message RAM is shared with other subsystems, and parts of it
are not accessible to the APSS. It is expected to be mapped as Device
memory.

The "mmio-sram" compatible makes the SRAM driver map the region as
write-combined (Normal Non-cacheable) memory instead, which allows
speculative reads into the protected parts and results in XPU
violations.

The violations are seen when Linux runs at EL2 (KVM with VHE), where
there is no stage-2 translation and the write-combined mapping takes
effect. When Linux runs at EL1 under Gunyah, Gunyah maps this region
as Device memory at stage-2, and the stricter stage-2 memory type
applies.

Add no-memory-wc so the region is mapped as Device memory.

Fixes: 66664b5701da ("arm64: dts: qcom: Introduce Shikra SoC base dtsi")
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 2623e139196f6398c57b616879a37f84b83d59ac..597aaf490519e605d50e24c090bbfb1e47b1f28c 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1347,6 +1347,8 @@ rpm_msg_ram: sram@45f0000 {
 			compatible = "qcom,rpm-msg-ram", "mmio-sram";
 			reg = <0x0 0x045f0000 0x0 0x7000>;
 
+			no-memory-wc;
+
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0x0 0x045f0000 0x7000>;

-- 
2.34.1

