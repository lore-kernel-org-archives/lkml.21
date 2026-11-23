Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467360;
	b=4LbQJ+nt5Fe/EeucEVDXbtlX53O4yw5RVXOMVruluU4Kx+txLjHMTdm8lTVxluim3kjH
	 aQjLmFFqJyT5xzLh7c0a24I1MaDjZW0jrMWtCKtw3mFRAUi99ehZgCTxbiCJMQFrFR52F
	 U61YncXLYEccBty1Q0LiGF1SV5oS5fk9Ejy6dgymCEYokRI7O4fGTWQXPnBSWTuMa5ksI
	 pzhNhsetJyjPbXpEEvMwpb7DsO5kBna0BxtXBRqT7zfqE4vjYWTvxIf04JARlwUtn7li5
	 QMHV2/d4RR2WZFNAz+FMejSWQ22EnxSP95VzG92el1QoIXC00tu2izOsbneSDMVPVtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467360;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=;
	b=z03AKfmf2DxRL53Gso6+P4MXaLqWHnHj2cO5FGLo2pJ75Z8q/ZaFimOWDW8M3m9aGAeX
	 QcS7LdFrO/IBkp8/6pz5zKq1wncXpeO667CQuaW2Bry5VIsuzZ+jE2Wr5/FqEk/7E/J5L
	 qMlI5hw9EYwqviWUyQYJ38l2W7Az7ZybcR6ouEarMOg+rk3p9DlQN7mw+UnvLi9qPgSR3
	 WU/e9HU83jkocs87SIn9ZUERl0JBIb494oOlYQTJcfX+U65qmDPqqus0MVP3uDKzSeDEH
	 0Sz9gC+itKsPOxSgjMGP2s9jt9KLirNZgb8896F0hFdQhf+MrakB60KBUKZRrDUp3Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fx1YEHeP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LqMVSNcW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9745A606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9745A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fx1YEHeP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LqMVSNcW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuHPx3332614
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=; b=Fx1YEHePkEIEbEYW
	DhVG9OabOyItaKaqLpwpyI4QA/LS+r/OrKMZgfdc4s/lr6s6EwLJPK60p7kkpryd
	WANzPuSP9hqabKBLljK4ssJXXQHaybm1EiEo9QMshW2DzsKe4qZ7PnBSAa2OQkgO
	yCr0PLdvqy5HR89EB8+Ox8UG2MLfsnwyFNhfSy83Iil6GjH3R6ZZQm5CzRiwOFiO
	kYv8Kt9E675aXNprt1l81qcCAeBy/YBJMqeBdpXU2r065eyDJdu70OTXJVESlWl9
	l0CKzKthG9HGgGxzuhx53iJSBiiQQcMQDBDq4hPNVhIbmdj9W+AhhcnyJp20RKJY
	pST2xg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nre1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:55:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a0f79047so3427397eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467358; x=1796072158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=;
        b=LqMVSNcWsZxV/5tjPDBeiJ9SMuRLLpRJ3JxTQpvfiQ2laEJx/tZboTtG4y2N0hS2wJ
         aj3zpCbzyxlq1Hq2D5/OInsSwsKPhRWxmFITqxnuxaFrig4QMAVLRe5Fh5DOARYJUSl+
         70ghBP9lvVyuPraSLwdJQPfdX0S5fCUr0rcgYhIQ87t2SylQKH7GzNzqCk/oXzUm5WTO
         lTb6JaUICEr3xbGYoE9APOxZ7tBJAUQparexgNz9nWyQ6FDQcOUskFPcoe60mkyf1Db2
         QK6azv9VbBR8uiBfw2qfOdIlaSpq4HAqL05XDSv5LsvEigS5oJ3cdaoa8mwQgCTnjj5r
         Lt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467358; x=1796072158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=;
        b=EWM4QBKT4FKl//7GJV7pAOdXc7odg6X/kpCiv4wPD7UR7IbVBSdI8e8bkREpyzrKxl
         g7N9UPA/71pOAKJGGuI84yKStHgChb+hzA6PNlI3gaAZZ9BbKE2dSKuMaCjNuGJiINwX
         JgkR6g5oMkn3cbe4wpeLK9abXa6aBUNOnnIyT4mbZNQqVCksaqFi81MMJfFTX6E+U0wN
         7MRtFqKsTXvt/B19IFCGAdkn2kSTendQwtE7UZno3w5V5dML0WKU7xOSFfMkAwfYBzwA
         iXoSohsl3s1sqUbJSMcrY11FChJ13vio0DQGwFLiiDwWfTyn96gqQVUBGzP01QpOIW2E
         TaZw==
X-Forwarded-Encrypted: i=1; AL+hErHYF+8JOwoo3klsZz54D0Hp74wl0uLrriS/OHIZQ91WXgFdSV0mAI9HuTFwJbPzNlgCREZhSWRc7A8i41M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0Jyza4OJQj5SEiMB36zKuk7gcupV1sLbAWaoFknlXHvWLyG7Q
	luvfElaCszuLmcwGh7e/x4YWbdDTu5FYGoehpfGw5cBmQ3p6XThdvUIo3/zZFsDk6Bs3swQlpOX
	8lchTDCLe3HkM0tkVlhveLfFlt90J/ayZNWMZg5uY4NLIdumepxtWoo8VM6BLRbQcoI4=
X-Gm-Gg: AZFdTZfGyXHJbwdeapCEVqx/YXLIDfhx+54PujSkF01V2M4MG1PzIV2AkzdwNcUx0iV
	ybPEdRt/41dX5k0oWpCniMHeGdgIH6om3eMPuhZ9DwhhkCw6dvHdYPQSfekcLJeVnXu54A5XwvR
	Xag7u7meYPItomNP26ZHQy9ndPEp7U68QqD/qdifEvFTngShOsKMNb+wRxFnDMDEeEL+gZblaR9
	iTlEwMzdoqCLuALLHu1ywY7c1rY1naYQDlSOFXzli9vumqZFqQFovYwM5IwUAtTHTzhDjUChiBi
	Pz67IM9KkIFxD46Ox4LywkMU6O2QoULpqerJYGmjpgymHCXu7h2CP55JZRK8Ik6mqdWo1R3+H37
	ZhUFTlUqI4xIwzQjlT1rHaN/Xf5rGnn+x0GAx9AYJrZURVHgE9pJeATt8lPnbCXv85zkFti903z
	dugSJ3m+ho
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr14805727eec.2.1795467357357;
        Mon, 23 Nov 2026 12:55:57 -0800 (PST)
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr14805680eec.2.1795467356775;
        Mon, 23 Nov 2026 12:55:56 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:56 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:48 +0530
Subject: [PATCH v5 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-8-747d5383d538@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1250;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=p+DrbvohnZm70RkY44JTffgUjgoL+i7eEMdPZYxTZjA=;
 b=/V7wXZSXhkt0EpHZdk8xNOAG5ylHqm/2+sfQJBwLcAfPocvgsEIMFDithwf9rfQD/kDQHODQL
 b5oQJaQ2G7RCTZwrGScrPunlmiaQhmnr8+GWNz7DdAJeMCtTTR8zh8h
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX/RiKBqs+Oem9
 5cVlsOYzgYjkgAyVYWfOjeg1VcQWBc3tEduBhpJANmSFoKqu4Ij++vWuADUlWexMrU3Cjs+CMi4
 YtWTyM2ynGUYImSKBhnN862VzpsU2hYb9mUI9T2tLB2hd7vhZ6nkf3lh5GBHO8YnMwhJ0qdo9iq
 Dj2Ju0WxPAlcoRchlFC19MS3HYMDzDVqZrWGt+nGYOqP06EWPsq692pwgK1BLAr1RvXM4uRp2Hx
 atlV6Dz7mP9xcsmkg5sI3mbRymqGzaOqtbv0ZZDk7kUgNCwGRXdjq4TfbTpbRFD6EGLBDzMCe6e
 u7j12EtK8KItUlfGUPDwj9+bGTjMehXnKJV/y9y2u9/EIb0E/n3ZC1HtFXPh6kNlHFtihtWLkaE
 8kD9kAp70Su7IJeUFp36BDaDosiO1a1haoopA/5DKmmVXeu33x9K9NI5cFI/LtW+ps8nf2ArGLA
 ZRSESmhrvlaacibo91Q==
X-Proofpoint-GUID: UneUt7DXRxC_wg-bHn671mERWTos4FsY
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b04a85e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=eLLqEcyxF3qFMBJkHZQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: UneUt7DXRxC_wg-bHn671mERWTos4FsY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX9xwA/cYMUxi5
 NLdfy6YCGVXFN8EJlKKhEgDVewkXD7sUK84MHFQONATKhUNjhNW/FM13LhyW9kIaCMLQ+WPtypI
 sF2dT4xdFY4R+PmGARFNRN7AniEDkfw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pm8550
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 896bcacb6490..c4a575af7bb6 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -45,6 +45,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
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

-- 
2.43.0

