Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467352;
	b=OAWegUvlTozUn0oJibFx0DaMpq3LIzLVFB0glsJR3BBi7WTGNfCVupYnzxyxeUPtLZIZ
	 Lhl2sM+FCXnqkf1ZyHNLe2dOrgiVNuk25Y9h0G5TXgHa2b2Uq4qM8U4jEQ11bE2i9bBUd
	 j/e0syZD72PTYyfiSZSO0Qsez8+IH0MV976yRwcQvwGGV1VMQ/k1bjfxfUvYzaxy/cJ2f
	 t4TQz4CqhRIK34TnDNtKHRSys4Z6sDdz7s9bsiUcUKkAortK/LDwFAGbLTp5DN2i3jgYP
	 I2z9RVySCD+1a7b3BlH5mpxvzDGfgeva5lCI2vF/awCQ6hBTp/PKpzZGZ1/WNbaqW8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467352;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=;
	b=fC8zrwwrldKxen4nJFHfyfX9aMpEF3WFx5daSXbZwRxBEjHCGaxvAMlp9F2OJxf6WE+h
	 lrmHzuwXQVsgFAnQvcYXBOEkthqcVTZaARalj29zqUZBsd39qRVZsSYbelfMCjaWDJ3mK
	 3LLmypzti0ZSylad7pDR5uf7EHQJILHwhWr/bKXZECzDL2Y1D5GOzy+E3RWixgHOdF6f5
	 0x3TbfqiIhIplcYnL/4H+gCvmA/n+18NdO717hIBg+Mp4rOuvq3kqmCFuK8TswhqsZnl5
	 x/PrkYTpOL/ih7dFRbUuggbfkhrTL67F9Vd9T3/yGctFAZ6KQUkxU2FBEcBAd2mXNag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APu6pruJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FiXuGchy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D360606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D360606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APu6pruJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FiXuGchy
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuQNC3255326
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=; b=APu6pruJKuRJdjIk
	YeJmkmvT43n9u64h/gmBKxcfibSMm4ZFWJ8ET9J3EmS1HcIHgEL+CPHry1D7KyK+
	/Wq7SrlmJhbrrnwrHsH+yAYsHHnAUo//U6orKs8xkVro0/nbKK7qwrBAPyytH/Q1
	rwXx0O7nEH/PuCcZXastnf5jwxYlhLo8VuwB+TD6rtwzfx8oINGwQpPi7goZTR/p
	5588ryxci1NWoZz6D0C1/nQ/eAeJ0YkuCWySf6ogCe4brNMNucKafcmQ6ancKnwd
	O+tTfpt94MvFNq2G/C0DAYz8Qv7mne4Tx1xmICX+H3ikd7FCJigAfAu3G8CE2odU
	v1PkNw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pbcyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:55:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a7af8b94so1775813eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467351; x=1796072151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=;
        b=FiXuGchydlJAO9RDU/V+fOHAIHc61fvyDp36lEe5htwztFldq1hDKyr0XOp48QriA2
         R5se3nz5xTU9DcR1yRAHvB/QZhEtwez2wS6AsWV7crZBLTvN2NZ8UBDqugKLaPkfV29n
         tVKvo3dMKafCw0cOPtYoiYiYX1oE4CxXQoM4dT9KJLz3WF9dcRne7fRykTQ2zRmiyqGG
         u0jxMJarsli2pkc4i/MUOGEDuyv3YXJNfNROFZqDH8RU7tBmAlWFxHQw3QCc6/Mmajvl
         pTe2t/+DJTg8vOMkXdzQDsp8I2CJSC3A9kGCyd6LpZXECmAVNkZodxAOYUbPJcJK76pZ
         0NUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467351; x=1796072151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=;
        b=rp2qU8ifVxKC3R0JI3UVvHbrQx9MRJHauYNoPBaAnEf9QJGwr5oKhYd2Hw0trk3EvS
         j825cmNCTynXocQRVu/G4LnFKEKBAIdvBmcqwnj90dBw5Pv0fzsRu27t2texWpa0cRYX
         +H53nk0+T3ynVgBH1zBpyvQUS9lvf3HZaGv0xl6Xti0GdxhIK540Baid0SM5k/ZHwt2j
         KSlUyCwznY0lUNnKZGVjiebcdxRyoBKrDps5Awn121D5kopfye12MpU9xj2nzUR7l4Uj
         GViE6Q+/ybNlQPohMSE6BgaExnM7AFTwDVM47HXtDT9PB/0t9xahlvFWmsz2q7LVW+IN
         jjsQ==
X-Forwarded-Encrypted: i=1; AL+hErHHz4uzkYjJrm4BEnMWeYJqaQIiqXnH0hXqioYQpRTThh6re9y7U4nuepxge4DGZh+2W8QXepC1BHLF8Mw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yzPxXMqbxZXTuJWuFNi4fS100agLNVTfvE08TO/jQzqPFbd8H
	icPhYD/L3spmkfqOn9oTYhEY2AOXuRuPSiqh5Xhas/7ynFAlCyc9FX2iRMo4AVtXVIGknJ/5AJZ
	rXA3Pvw8AE3U/EaGpU9ZtBbDbhUrX9v/DVVcr3VBMTzjHP0hAqckNdANImp0NM/GXQhQ=
X-Gm-Gg: AZFdTZcU1nmhYZdXlcOnZM3BEy57sPTk65JZ5PXdewf/HSA/FCawYeyvxZXcmikXtPz
	c0QtobHM2B2k4EB0lcd3FOaJdIpt8UDkJe7yR4CPWM9rJhMYEamVlXeUt/tv87N6n0nBiQqdfnZ
	wvkGz8FaOQqA9dNgVlIzRPp6XEBoYWRadVIdKeUpgAqKrjSJEcrmRcEmHnoNewqttOHzzQA4OWF
	BsvWZIeXZ+A8CWKz5ffilCnyhLbuCw/QElb6Al+bCYLHbNdJW/tCJaYzskkXjL6YxoV8gAT5FIk
	6882TvifrOJIgqwxXTqqFrrMTJo2G/Ddaeh/BebRxjVtMO0rPmO14JC9ohU4eewvfDZP7palps7
	3OFZ2cls1HXxiqYrA2sPCXJXslpvfm2xeZiDmpB/A86WkUSymErlHmS3FmdqFozh9srRERhsuwg
	7TQGdVB6fd
X-Received: by 2002:a05:693c:88d0:10b0:386:b894:f6dc with SMTP id 5a478bee46e88-386b894f8c8mr2555339eec.2.1795467350682;
        Mon, 23 Nov 2026 12:55:50 -0800 (PST)
X-Received: by 2002:a05:693c:88d0:10b0:386:b894:f6dc with SMTP id 5a478bee46e88-386b894f8c8mr2555309eec.2.1795467350116;
        Mon, 23 Nov 2026 12:55:50 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:49 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:47 +0530
Subject: [PATCH v5 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-7-747d5383d538@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1207;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=4gGZ4kBU9Ca0wJlDsLv1nEPxLz+5jyLqksSuJ+sGbGc=;
 b=RBVFLuG5HbWKUBG5b/9FUOJu/oqCo1UJjR508Mn6KfkxgGlMz8FiV3zsD0z5Rvk+e+mKhHNt+
 WlwErK0s24kCiiizyVJ3IlLxn8qznWUq+p/iymZiRvTfsMAQRtch8uZ
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX7+Z2Ad36Kw2Z
 hFL+2nEXIjRo2GRGRWrALPLMw8N3PAVmmTRReui8HpW61bUIgomzvnox4J5xlo8JBTHr8U05nVL
 qSI/+zQKZM/hQjC+5ownB0viECFbv9Y18lh/JBRDV80xLWpJo/x1OkUKwpPGuXcgE+vl3LMdbkp
 nXXQ2n7P2WZVAA2t6WBvqEvtGejpnxpMzOChxEldZH73cIhM03RcyppdheM7f9fgKoOw3AJKco5
 c4WPegDe3MIx/SlwjQ0BMWg+xX32aH2nS5xWGbqh6XQ9VJiqF5Kdi8KqehOoxWReAPIN3kJYxil
 4Yyj5UYRoTpMFBenEOU7udsVJ+XaxNQ7/1EbEld3GC6mH2clT9dbi7OOSYfqEQ/VbzhFU/5/4Xx
 66GOzjEjaZD4DZFXUaBISpDCIOsaVTQSO6imTjeqILCWiT/mmacfRvGNGugkZvGgMqZr1uBeNTR
 q0rKATWXTHt2ErG2CPA==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b04a857 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=I246FzBBSJD3MQbeXTIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: egUTq-VTUnO3LS2sPem--tMVAfTcQKrV
X-Proofpoint-ORIG-GUID: egUTq-VTUnO3LS2sPem--tMVAfTcQKrV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXy7fk6sQWhy8P
 EVvNdMGusDA5zGKMhmal+xB8wRKnJsJX7nfUomrItewNOsXLhzc9crztmQinkzZBYQ3sMunRJYq
 a7CbrLZLSo5RB2pn5QQG6r93cLYXIOE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index 1a24e6439e36..d9e3a1069d78 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -20,6 +20,17 @@ pm8350c_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8350c-bcl";
+			reg = <0x4700>;
+			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8350c_gpios: gpio@8800 {
 			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

