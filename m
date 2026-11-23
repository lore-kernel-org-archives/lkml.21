Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463562;
	b=1/ZryZ7S+0+ZQBOoTIv+wApQTchJ/5cRdnRMKgGlYMx6QJ7EjgaW/BUw9YdMS/f4u0re
	 7p9ZNJAdxgWRYo7QLIIKPoQeAG7VYhLAkENtTtAOOKtVBGIlbL1oX9MaCkejlSApqKhhn
	 4uOpoZrY1QIuVEn/p7k2+oa5QzFg+uSE3zxSdlygcsex6vJFpfehnMmg9BD+I9n2ll7iO
	 bDmuiJzfw6eEYKKAJKi1s68Tk/RAPVjIJVrfSf29Ev0td2ZtD0mFwKz8PImE0UhYwqwat
	 fHCOZotwWfeYsamTuv6xzM6X+kcjbVzKzPXOPJI01lfpOYH5JiubYCFQLgV3WLqnnUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8ckrSPVsjExE0zofMEyb/7LGF90QWOS3C9OwQZge+cQ=;
	b=aNpi5mNRK9Zuf1aCva7Z8AY3dAgUuAvNogt7J8eLi8ZO03GUoYNRFbhGGR/Tv7zqUhUn
	 hLsIaeDEkq7wmGrMlmKZ2cB62S7qgfhQd7L4x43HNUqoIdN48ux2fnZf1sWRlb+VEoiCA
	 4ptrgwD34zAQDNZOFTzrDPIPDWKRCHxyCJxALFvz1Vh+e65KyWyZ1xyjlUa0YxvIKkmWw
	 RQBZXexF1e2vLu+Pb9FmxIJsOMHgDUn97pajbyMfz8MfHykrUDJQExwaUG/qanzyDazF+
	 juqaEFpXb/gbEaCRHt8BPXtYL9R7m3eC5dUHGqyGT6yZF/zmbP7yu7f3HNLS/VvdJsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1TDKnn7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkDTIqSE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21E1606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B21E1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1TDKnn7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkDTIqSE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH2pp1093797
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ckrSPVsjExE0zofMEyb/7LGF90QWOS3C9OwQZge+cQ=; b=I1TDKnn7QhMB3PBK
	No8NilYpEKgpq1suagt+vSY0Zndoz2v9cnxfOBRkDUDFDxgeztcxIHprmYU+88mk
	P2d4Fk7zObzRHTTsxOMRVCBQ+xHmPr/9w05OJ0F2XR/C6+ol0XQGRig+2Y/0u+no
	indcRaRuB74V+/Jl+ktGR8Hsq8fsCsJSEnqgbuL3rlOlehQ/leh/Sx5QL1bDxZDL
	sg3jVdRVf61tb6CwajufuM7mLNeuHy/da5V2cLAaIG5BrhGbg4qotPO9b4ExoZOo
	cjfPtI0BxqlTZyiVFljLsQ9vjKpa4CVTyXhDQ/gB0SGaNLXr+6lG2dRonkIuL+lA
	RG+miw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0t4d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:52:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386b8624cf7so1965377eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463560; x=1796068360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ckrSPVsjExE0zofMEyb/7LGF90QWOS3C9OwQZge+cQ=;
        b=PkDTIqSEy6bRPMwGBYNwbhMF05vtOcZjDqvIbI3qKKaVEtRcGBz3JzsNFVan/aYzkj
         dC0RUiWClaNhw2DO0ka6hQnpEamqX86ekSfRj/Ik2JtSIQs9sOj7Lh72O93MU/x/yQhG
         p+eI+Y+AVFaYr+8n2w349bzflzB1jY8Q/WPEV+wG2Dw6WIMOLwuLxQ38C4ba5lQBxR8E
         tM7HgrByYFFi8sh5nDy4YHNQyEwVPV+apE6NKjyk2RhS/oRg74WzaffPTmK2zub9vW+v
         UIHgsU2fffmjonD7QpyQ3TA9u4fgio3aUwrbhKxPfzTT+96leXKRACvB7b869MZ37eKS
         z2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463560; x=1796068360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ckrSPVsjExE0zofMEyb/7LGF90QWOS3C9OwQZge+cQ=;
        b=ui343s0Fa0XqsymtxacnsZQGtmY6uVe4I5ABvj5EHLinDnV60Pf0fRowl03LR90npW
         iIKrVNVGjh/XIMq5gMoSuTmr6bMr80+Btok3cyBdVc+JaAXhxGuqgIOlH1ZNqY9w5ZGW
         lZFJ/osttf5/Z6S5Ly6kpXkK2y/a/V/T1WbwHrQmPQT/a8q8D2zFTrYCsYkH/pSJw6x+
         Xv468IvD/5yHWNtmog87yuNPMKKQsPyBKiTR3jCr5EKsqDl4OqZwDy5KTWySuhYIVoyO
         JVDVrflnATzqtUYLtesu1D6U7d+J/LTJuuqxUxuPkqWCJuT7F8shUtxPyxxFb/3euu1Z
         MKhw==
X-Forwarded-Encrypted: i=1; AL+hErGdrdbEAxH7RSrDmtbK40QKTrufJazRGjL+HGt+fTImXt2TyqB5NSka9VslrhSVHywGzoE34WZexi+r42Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NlYGJmBtqbK+vcjfN2KjRkGpN6MU+t7RQl2jhZ6MUb6NvEYjz
	f/llJJn0vSVUVmlYgkGZZGX/uGnfuFsxfMSXuuDGc1rfpWGcwGCJ8lzq8Qp8Gz2kSSZxlQqdj5L
	3W6NGNVeN+/IeGsH3LoahyllqQztFEAhse22piI76HlZ6b14SHx0LJm5s42a95+QbA6I=
X-Gm-Gg: AZFdTZeOBzQsv9zLt8lYipGRDOGUStMhbgSNjPKMbi3RHcY1oXnowX5qhZfbR0u/hvg
	WAdyivZwy7JtWI8KDvhKSohozvVqhQa4vfP8m4qJQosA4sKHKx2ccOBcHhhAWQdBRajpQMlgVq7
	QlrBkx8CqAdDR2uDSOnoTqPHjtCpfl4NE5TQ5tNOSPfM2gJj17XBRSZcpmu8eGKppHo4xS1wnYa
	/UPR6BeC7NMstefa3j3htTuS7NgIWmy+RcCOyZhAtU/vhi3PG8et4gS+Uf0tsgDX4KCcmsCeim5
	qE8FilT9grqQ3/N6b/sONC8sY2hy+l5YTQg16YshgpqRsi7Bw7s/1EAROMqKBBueRoZjSip4rc2
	bXpzhDxSmx0k76/i9TQDO4lje6fuvZBA6P+vmdd+3c5Dt4GxtANesjwRXoJWaebACAJPPz56gvA
	==
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr6475640eec.31.1795463560508;
        Mon, 23 Nov 2026 11:52:40 -0800 (PST)
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr6475613eec.31.1795463560078;
        Mon, 23 Nov 2026 11:52:40 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:39 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:39 +0530
Subject: [PATCH v3 08/10] arm64: dts: qcom: qcs615: Add GP M/N clock
 controller
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-8-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: LtjRA0kabLtL5HhvB4Klq8zyW78FNYd5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfXzX/QLxh6zDCE
 3sL0IrJ8jvdY4sxCSvRVy7Ybbc8g7ouoXjE0bU/nTdEBQm84f7hYiLfa03sZu9YTl7/Wc3pCaJV
 Fx6EhiQKPXMb4CJetjhoUApbOusf9yc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX+8eg4ztXLB51
 vZNu6CglOvFBQS5NmPViX5bATGNRVHEkchobleBF48FEUd30l4BXhIjgmvUWTiuV7xqU6iZoiHg
 DxYwTcFsHSByhY+MIMZ/D3i+K0StYIHyecQ5oGiGcOgmUd4Bvxx1Pvw8ToB1lYQqHyA7NkdSjO9
 TqHrRa1S9A2MLcefeqtnrNInYM9g8vgkLjLSEPBzLI/6rwghifQPfJadXo4PNg/mC9Tw3zDpw2y
 hG8oe2lcxT0jVR5wZWF+LvoSh8Y229T+/qwlRQeekGHKtakucZVCQYKSXSDa6gTAXHK2WMdnP/x
 nVJdTySc++TmwNiWw9sehFnQ7sP1gCWyvGEKgssVcvizfKjqoGjodSZXZnltYPX70nER8GimAU2
 x9kc8gCoO/LYGdM0A6dYv+lwbuoxWE7wwTFKtCUOo0VEwU4309H0BoYEwgjhZOzx356oKqBaX7q
 qQsWPY6UKIPaybCne3A==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b049989 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pimPiyicOD4MdmKq59kA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: LtjRA0kabLtL5HhvB4Klq8zyW78FNYd5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for QCS615.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio29.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892e7aa65296850816dc9ebaddbe3af..a6f195509ac2e27a4862e49e82cd9a0fda67d153 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1626,6 +1626,13 @@ cam_mclk3_default: cam-mclk3-default-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio29";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_i2c0_default: cci-i2c0-default-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";
@@ -4031,6 +4038,20 @@ opp-202000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,qcs615-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm", "ahb";
+			#clock-cells = <0>;
+			pinctrl-0 = <&gp_mn_active>;
+			pinctrl-names = "default";
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		qspi: spi@88df000 {
 			compatible = "qcom,qcs615-qspi",
 				     "qcom,qspi-v1";

-- 
2.34.1

