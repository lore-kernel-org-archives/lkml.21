Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426531;
	b=HQDHOo+B3HxB8ada5UHCiUMdH7Eoar+3r8T33RRvRNXZJX1l2+hKanQtBZgO7/WD+Sff
	 G1epa9U8cr1P7iJdil255t8PL9QyZax37rfGgD9cbOOtKNGHN76cwM1jimEvsDBu+Xz69
	 EQ/hUfxGI9Jhek/fq5qw4Je2wQm4Gtg24HQ2QnYFxO/qo8ONYOVOywDnxX5S3uChk8vPF
	 C1vdQw97O+BFN0b48AP3sN24UiGiBE+b3zc3O61YaeAsoM+ymJNXeFHFTnrhieiHLRtcv
	 EOEKvFiH9cp3CeklknFL1nYz2rXwW9KfP8QkjwCPTGgnvvbDo4BiyLfHRi3x3XdPVmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9zQsPrR6eGS5MgOGAOaluCJvyD3N58t9WLN33C3BzZ0=;
	b=Ky8vuQRV5bjPB5rCPDqIpxFZo81vQP2cauVxhm8693l80uDyYp2+UtMysMEAk+CaAbg+
	 44cLpJqWM4iqTeDnCOkA/OLsElSqBhd4ipUgPibVjCaQT1MTQcBZdzkjvYMws3qMke1Lw
	 KXo976NhrJLoW50vQUk7JLA2uzBSqECALudrDvFL0HfaLXliefBprtjBmi23d8SSM/3Kq
	 NjVvBof5EbCCuHCSzYlMlnin0ZV0r30dGntBiIIr5hVWwb2l3q++cGuUGjsi3OXWl6V0L
	 wj1SRlgj1x+Xq1IT1rFYlP2uCBwUNHwbHFYRUkAZdjqtzEHKDOcvog1fid3I2P6K3WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gKvFzjA2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BneBB+0S;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A31D606A685
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A31D606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gKvFzjA2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BneBB+0S
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G2hp2786330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9zQsPrR6eGS5MgOGAOaluCJvyD3N58t9WLN33C3BzZ0=; b=gKvFzjA2TTKhwh4c
	RUJa/iwce2xs0gmJYMBL3ewnpFV7UZefdnlx5p0b6gXiJV+h+clCjzyYJ87mqySf
	9crtw7uZIR6Va6Xc/C/230s5xheSxKN29AupelqAjvl1XNiO/aY+XFE6F9Wr3/vO
	4onMQrg1wMe57ss1Putu4zdDDB4m0mGQufDwyixln+JapuOgwFTzwRM7QWROFPWz
	MTqTjGCi57lib1twDAlADvhFeVwBgQFOfC2cfRT/QG6KFIaRtuzWjn3UujzGhG6d
	xdun3Zme195z8wO2zXvn6/w2QEJNVLGW7OVWiowRvQ3BGCj8G8cgd6oA48PrTXp1
	CELlHg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd0r4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:35:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55cc3c32e15so33677761cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795426530; x=1796031330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9zQsPrR6eGS5MgOGAOaluCJvyD3N58t9WLN33C3BzZ0=;
        b=BneBB+0ShYifV048NpCQQuY8vYZ2E/VtcdFnXMgQ8triwsX9dmuq30+1lbbR8E4aKz
         pSOqYnwd6EPX32dOQbN+uYnTPol5q59oZaLdhiN+lAyFDSDCrlqQpIY9JbMe6/ltluK8
         8IXQnucOdg+H5bRzBXw9sLvmwcrJyjodbqLYxTQdl0Wtq5Sg/KEglecHXyQLUAAtyjBc
         zPqH5BmJfG55AnI4WoHw7Djxc3hQpYmA2beVmTxT2iEfxR7CXSuC/bZlf7BLb3s4S5tq
         gdWsv3+MPqT80ABXN/4jEqV2d0WJAWMlZV8//nREQYaTam4OuY3bvZfCvImHm93z+JhN
         gAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426530; x=1796031330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9zQsPrR6eGS5MgOGAOaluCJvyD3N58t9WLN33C3BzZ0=;
        b=t2YnRiHgCi8bCKzGptX7efA5U+c7c81LSTvFDLtTFA29+GHsl5sxtcldLPphmw2KAz
         kIYadR0v3JUd8aXJzo1h2Xvzi7kbjj8MrIUxbXDKx+RWpDkPKNemZIMSb6/Xqy+0w9gp
         KJHw/K/dniP7GnDiZdu9J1jhJCtMFXr+Iz5xZJZGAc+V83k32sXtvafBQuRYFDjc1n6O
         b42daDPt5GB9BzEFBniWKtbwjPnB6O99fijmfXrkBpjzLen8BfFN+nM+1EO7fRrv3dNI
         G3eiXckknNn3Ms1x5FmE39gumLeE5Qxm7jGMGO8vM+tNIdy02iz4pmNnempdsOOcxXN/
         wtng==
X-Forwarded-Encrypted: i=1; AL+hErHT6nMmxusbhggVl2nRK23CWIpXnPmDb2ksqLqICInAo8qvQhpWtLNV3h+5S4BRhIsgIqdIWv5YouztKjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VPhugNw3CrijifcohIKbPgf0WnFxRcsOYYdUcmdbKMOgfC/ok
	9imOOWsdRLRPuB0noBiXnM2mzmOqCq8W1GtTHWcInkDETMkhgHXw4GwTKbJ/R8lfc9hsYF8JJb1
	FX3qSbafYu2ksfuUYuLypqKoKWXONWtc/5OEfW6MzQfhsUxKc9fgIF+M2PbKhxSwqaTg=
X-Gm-Gg: AZFdTZcPwUk/sZqEO3tPBmV/rczapr8ULflT30lgTQ3/hWETJAR4akcDpmpEv4i9F/R
	CodgVMIXoKTHuBXHP97L6a9FYLLrCO8uOUvhwHir5T5ZT759DSyUxp3qd9ovPp5UthShH0/T1aj
	vyzTxq8R2rXIf1/WXqZ8Cs3tMxbxF5fi7ub14wVJoj5tGtUpuPnpAIRT2kINwjglzRP98qPA3AZ
	fgypunbUJaYpDInWP9Wmps1nV2XPwlLx3WKUnXVMrmNNj/lHrrVNLRIbvZmtorAT9IUevauyd5W
	S8tI5/fpgrccunmFuEvrmFewd2MfiDbShVVmKy/+SzD4uHv2+0ZvMxBBf8TDZcXvU/Gi5H38TkW
	ym94CzogHW8DHbOyOUnEzjkRizV4nesmSLVQSSMAUujqbS6iwTWcLkpCJTQ==
X-Received: by 2002:a05:622a:a10c:b0:55d:84ac:5791 with SMTP id d75a77b69052e-55d84ac6b5fmr130773511cf.62.1795426529516;
        Mon, 23 Nov 2026 01:35:29 -0800 (PST)
X-Received: by 2002:a05:622a:a10c:b0:55d:84ac:5791 with SMTP id d75a77b69052e-55d84ac6b5fmr130773231cf.62.1795426528909;
        Mon, 23 Nov 2026 01:35:28 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm123208315e9.4.2026.11.23.01.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:35:28 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:35:17 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the Embedded Controller
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
Message-Id: <20261123-t14s-gen7-ec-v2-4-3420a6202366@oss.qualcomm.com>
References: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
In-Reply-To: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=BAVqgS/qgUxiqab4nI54FtnixP0O4Z6zoFxM5h+c0Bo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrBAjW5TM/NoCLzhtz3zqVQlL5Uql6ptQ/zdwHl
 10qsnARGayJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawQI1gAKCRAbX0TJAJUV
 VopbEACHyaDNyjMFdq4gV8+iQhzyeSr3cwsVm9D1JhQl1IqfA5MxZ1BPphZi+DDVvbGHHNWID8X
 ahVHWHcHd1JhdsVv+mdlWqhIcgHLOpsxkciio0AvY8txfylk44RmEn39fONU1UAUsvCcmIX4v8z
 kal1f3kbiQUgQ6M2LAiPjfKpG1tHQRLwspzlLI8VfchClzFiS/7utJkR/hCVuQLzzG9LDuYdT7W
 7EZVhA2CBDsuA2Aq470x/PooiNDduc2UeV03g17r9Yv3/4iFfQHzlNxwnaZG/EKNVdphN+Nwmgs
 DvpKJEaa45HD7qjjrWN1mgecfAQbzRWwx+i+/zOz+AKsjyGZ4dJuAGP7LCJxky6iUNfxW1z0u9h
 w/Pm8s1T12rybBUdqhbi1Yvhbn2HLHBe9GSblAmmYwfICaP6B/yyz5LiTiSQDhMfByJ/RETP2wN
 hbM0gbEfUepoTQcRVWzpMR+3O2lvSgDWGoCPuNVqrT8vl7Bg3Lfrs01vEZWzc+cLl9ZTI5VVOgc
 0MKo1yggVdlPSo0VV8J4o5nkEMb23EqnBkDL2HcRsg3DUKq5wJVYg5FSjmREtpLzuhfIxHMWXfP
 HN1tOryA85CEGlbUV13ppdvLpUlH4BrvT24asRXz3fmcL5D5yUwRFzectm5zPHvUFKLF5A0H8uj
 Dauq7pbH2jbyUfg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: AB7zpblUJRgP1BCku67E4W1C1zYIsXfI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzOCBTYWx0ZWRfX+j3VFeNGBIn3
 K1fkODZ89WENQb9pQ+0YO6GY/XD2HIJ6jY7JO62Nt2w29JMLVPJ+UhgpIiXA0pT4OFvKMO3EEEN
 rVtjeZrm0kpzYofRgB5cCCfmJfiQSvrNBza3Vyo/la1eb5gyOtud33HYr3nTw22ssEIrUhKdoyl
 hhdbPNkPucSHupumes1k0RsJClGns31bx9nIl5H8Y7plKj0h8U9AMnpkgePf6F6dEWXvLVjVPzy
 N1YxaYkFEmndLV9lGveL0x6AMmJgXcHhmxeTAq6WAOQuQbzH61xpEcpl40xE7OrhIltLOmjsXjV
 mMRQ5rOEAS2+0M7eNoTJKxPMeTSuBee6mLe6ljRrHLI8sS8Gs1FduUEoxfmjHZ52hzQjXYLs+Js
 b+I0K4gvKRFnb6GxXvAqtAi1gODGIYHfQJLbOGQFe3ilqdcPFbgWPYqGu7BDa/zDR2DoK2dTZg4
 WjfdWSvmwv6p6j433eQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzOCBTYWx0ZWRfX0dBRrihOWa6J
 rrwI86L3BDGhDrgkORIIxD+FMiY3eDMMpN3FWV9eHQ7TyWgfUk6Lz0BqBfKGW/zFOX3kaKQa48g
 5P92uhyCzYWB0p+cuwufIgjexm2ozQk=
X-Proofpoint-GUID: AB7zpblUJRgP1BCku67E4W1C1zYIsXfI
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b0408e2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-ko0rdnKxUD0urDMsK4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230038

The ThinkPad T14s Gen 7 has its embedded controller at 0x28 on QUP
i2c9 (ACPI \_SB.IC10). It uses a different command protocol than the
Gen 6 one, so describe it with the Gen 7 compatible. Its interrupt is
GPIO 66, as on the Gen 6, but the firmware describes it as edge
triggered, active low. Using a level trigger makes the handler fire
continuously while the EC holds the line low, with no event pending.

This provides the EC hotkeys, LEDs and keyboard backlight.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 9bda86f82a99..7e7e9b861899 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -735,6 +735,24 @@ ptn3222_fpr: redriver@4f {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@28 {
+		compatible = "lenovo,thinkpad-t14s-gen7-ec";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
@@ -1007,6 +1025,12 @@ edp_bl_reg_en: edp-bl-reg-en-state {
 		bias-disable;
 	};
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	kybd_default: kybd-default-state {
 		pins = "gpio67";
 		function = "gpio";

-- 
2.54.0

