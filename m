Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467326;
	b=U4u56W4lM9pvx5QV1nN4ZbROZLImxtiDtLzNWIfw8svGMUS94Eftj7oMy2ZdGT2k5SIO
	 TmXTuxKLo/YFT0nfVAI9z8okKY0H/zGM5oP6T13s+bJ3ZubtFzn7Jt9PmG/oYDpDbazCc
	 dRbC9J736HGHITgwLfBY8SvtEndlNacM0TnnjiZ1xVeHLmIxvuGTvQJ+Ul9O4t/Jr1/DE
	 4EdZMUpeU4wLwNG5bwWPf1Q75m6U/M9yWShvD5rxBm86rX6BZX/etCXt46KXfSTs9sCyS
	 T1mwXaOVcIRGyHGczHewLYh0VE55xGiKxYuasTSFIIrmcFxs2wbENI5AVfZiLVkMbJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467326;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
	b=s1v2NTqG8pObJHguQTSyVaIbCWzIVaoRSko6sxIInLK4KnjsEqa+mqbOyrQNDpv9tm+d
	 PTYlsGNALyTPt6s+eFyeWRJJdNK68z34JteToQgmw2EImbdZAgvZeu+TioCVtg8FscVWT
	 YHqFGH9yM8nxjgyfUB6IkbeJ33n4oZYkkB7VG42gUHCKUOsVtzfJpaApsbt8y4+VbkTM/
	 gS/eh1qTPxg1T+QDPS5+NZGs75t3GwpgMZf94OiKNUx80uDNISNRQmwqPm5p9X4yTWPSh
	 n/DsfL4+pb1DJZy7CdirMTZGFebZh//gKDGy1lYEa8PVdezB1YJ58vCFw8niYyLPA9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1so8nQF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ony7BiFt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B5B606A33A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65B5B606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1so8nQF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ony7BiFt
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJueQp2827546
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=; b=D1so8nQFSfGWQh3d
	5muophMEI54gtgWnBFN4WI+jf2diOcOOh3E6uOPfZNiGNxwnI/0W0xMEqE/ELUTG
	GCDyzEkm3r0/+3nJdr0w85whv2A2PnRZrFZ71Imryfo27Qm562lS7LDh+mtr0L2b
	BYg5DctVFIU8Lvn3+T+NO2E3CiSLRcVxgwXsKLoObx2RJtxvyxUXcXXh+zDeEo9g
	N6dvyiF02lhyBis2vCBIAWddgX2OcHf++/SL2sc8YZ/Sqn/usSKSsWgsgmM6kOgn
	PjIYIoGxttyTL7vFfoqLmD6uJSAfEphAojM7Os2th1YRyYVhARjRqHWlBn/56J2V
	Nqcz4g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3m61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:55:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so6074008eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467325; x=1796072125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
        b=Ony7BiFtFn9a8vz3aPgK53D05zb5BgBX85SZdMGU9Yqcd+y+NeUog0g7aSLw/oxBMF
         yffb7sCQlmQ2UE+zoBD7h1umndQSap/DnQfFu6OKEJtjNZ/rPMoee2nSbNSmaHtHVx+r
         iUuzyT+Ify9c43EMasqMrEOh9LkM+fJcGI2UxKEtARZyMSfFELdfwMN8/zAq3VFbjjGi
         syZ1+dm8tbfqZv2MgzpMtth2r7rv9rmLCYpViHHXnK/xFn07PvBZFDZMpIWJpCVoP53O
         HpbV2i/6dINc9ADvS+oiGHE+3u7wCOeJRGZ/aQgKoowEu/YiESZ+/UaXqthLm4YIwkUP
         x8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467325; x=1796072125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
        b=wm6B81XQjLpWbHbE1dPpMR+/VwGfzOQirhppdqGmu/yHqogj361kyuY6Hn1bc+sCFU
         epLynqsx2IUCwrAKKFJAibaU90Nk6rWBgrW1rUWHoWC+CoOruHbo75iCnh8ZP3MkK7MO
         iqlYZxcsEPtOCNqHC+dF7QJ35SY9F2p3cTgm3KdFVUWSERGeshGk/1Yy4OhNwIW4dRjK
         fw4uNXwXqKUV56haJfPV9AyZ47U8MAOYepcb7Gw5zJxC0mk5b6fKFuOeykPudfwOJXqo
         nB5OMqBoY+Oj4VUiw2r6OSSfP4F74TRs4tHUg/gtRQ3RmlcsLibX8PWLgr2xgw/nBnxx
         H26A==
X-Forwarded-Encrypted: i=1; AL+hErHB0ClD6fGtXH0kd+vIYAnsArJZDy/+qMMooZ20d+j6vId6J1YBP785Mf0isIri8GuOWLJZNzgf1rKJUNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GkXTlFxnRBrVen9xzDQAFlAPqjCBCqKV0hrdIAdwN+UjSuwhR
	9gDNn8BYKsujusAnKyuELmulrCUk/NSNW4ZJBzJD8bOQNT4NRxPHrW1THHV/p+nUUds1B+/r/O2
	/n1xUOX3lb/eL8foiuLh2EaKe/pwXnPO071niUsjRhUQQtO2bIMJNd2X3JFCPPMdicIg=
X-Gm-Gg: AZFdTZciiRHyUIjFp9dlZmyQPBk6sELjvI/Kuu5vg76fUVk3bwEtRB5YBIcPIpdfQKA
	ibTg5MJGvMywOwiI9Z7lpvcrL2HliSUljcYsZL/bD74EnQTzN+MzCkVhzhLy0tz9b6eD44s1sGM
	Wa1aYa14QcAojJNCgbIz7EWzWrtkp5OUD6GbmkVqipJog0KP+fExzqFIf4OlK+ZxmLIRVZkSI9J
	3kOMiFRRF+JE9g3jghPFjIVnvlzJA1Had/pB0hQOrilXygarOoprDcT0Kh0sIhirN25KU51EF3y
	EIWd4t4AmRyTSXJV28k996p4xFJdcmEyYYgjDAdUr+0QsEmdrUCDxqHgz3CXoyP1hP7Z2+cdZOO
	d1s9qS0YOyCsAAtWcl+HZjes0asxgQOasTOJFZC2ANME3g7Dg6D9Ozhw4iRqE4Q/YzqpSqAGa4V
	yTLSiPtlK1
X-Received: by 2002:a05:7301:7d03:b0:386:9cef:ac3a with SMTP id 5a478bee46e88-3869cefaf23mr8905418eec.28.1795467324796;
        Mon, 23 Nov 2026 12:55:24 -0800 (PST)
X-Received: by 2002:a05:7301:7d03:b0:386:9cef:ac3a with SMTP id 5a478bee46e88-3869cefaf23mr8905387eec.28.1795467324257;
        Mon, 23 Nov 2026 12:55:24 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:23 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:43 +0530
Subject: [PATCH v5 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-3-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1726;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=zhna6efU8UrOq6A/hPXjtJfGBmOdiUoack36KYf7d+I=;
 b=JUF+Qvr1MfhBjQofxRFWz8itf9IQztM3tWFITF/Ndgd743dfOYnitwBPWbZGE0CaK4sM7mgmL
 BxKmzmW7mDgCmk6pKpOjoazilMJLtWkZCPzxl3zdJKpzLxtemj9S+hx
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04a83d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pei3ZxCQ2QdDqwo0ZtEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: RnC8QEz0P67ZvKn9P5FMzY861uUbn2MK
X-Proofpoint-GUID: RnC8QEz0P67ZvKn9P5FMzY861uUbn2MK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX0MgKFr5wOZn1
 RxtdVxpdRjRR7yZqODCguhFCzTlnYkr5keV0VODhUtYSZYfBb8ET4DnywCE5i+wYxDmpVW9GGlw
 uw4buBIPzbYUJBHlJPAOL3YSwGm2r+g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX16iwXqClVBlq
 hCnIJ8LUU4NVRdaCcxNGOKjkGFIb32asOKUjEW+EDgzuAytAt2B+HpxrlJNEupKs2FW4lsxwuL3
 7WvYemCuTLptFpQI25aaF5Jnd3XRt9Yddxdwd4R2e0XWvedP9wmhKCv8xni+IjPKIEJxjm74nTK
 gE3Fb9OVRWGnlIaRMcpS6xlYO1UUnk7r7YKjYQWu0Nhmq/tJ+KSvqKBFRPq3AtaGDuETw/gnYl8
 Nv+YmmsmF/b+3//uQ+XkE3++EQexpk85L2dksJPm6yufsMVmFRpY66wYHG5O/qwRkW1JBrBLNyC
 o9lg7vPwNq9xYce+7DShJBrt136NWuynjKw0PABVL8F3aDccpmfaOl3oyfcipI1ErLhN7iLtUWW
 n+A4mEVvxOK8L4q80/VO9iMzG+SBZu6r6fEW2/vimws+F3mCdwWPk5kcWdttY+3P4EEdrPVNEfL
 itSxTT7YofVBsgyWukg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for
hamoa-pmic. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 7fad4a9b92fa..6b17d568188e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -426,6 +426,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			io-channel-names = "thermal";
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -674,6 +685,17 @@ smb2360_0: pmic@7 {
 
 		status = "disabled";
 
+		sensor@4700 {
+			compatible = "qcom,smb2360-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2360_0_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2360-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

