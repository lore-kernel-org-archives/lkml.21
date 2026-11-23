Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433778;
	b=eAtLVJhJAo+KRvI1/BESjqz30wFq74vszFvwf17KNfNwWAlDYYlvqofCCRcOuuR+ud7q
	 J1AX2BBzNyrUmDSsPrDQjq+mOm6eVZcJbHQWw36IFPWjMbLHo6dNi8ywgpCpZ5u4rOr15
	 DJJU3FM+w9b9VOPAj3zbrEQGtYtZwdS3AfhsH0bddY88s+WgnEZmU3XYP+NtJO7wMJAaA
	 /GiWqN9SwoMTZY6eHosezCQ2PTssOC2OwXOojegU9ElwUcu+fyFY/mw60RtdB5hCr7I6v
	 X0jbK0kPV9tuZHzNfe6RzsxT8F+/vspKgeHNYyChX4EDSx+YOtPrdjBABOvd4tOTMlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433778;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=H0lU3jlQEaKoyGca77UmWWN4srY4UKoUV0/x2GOHDbQ=;
	b=RfFL7770vFWoI6unD2MVTSRPrNwV+kyX9rTVdyqmepp4cVZAppnac+evkpv9CaJwhqOX
	 AYJJJ6fkjuBjuDWOsZelnySXEskPLOKGz3fKph1NPKKXmkblmiUW4PegVUe+2luAByIaV
	 6jbOHSsxV9B40Rmo19a4pSUX7KWZTOeJhVwdzG2rv7aZzKY4YY2S6X/xwBMLpUL+KjP8Y
	 5P/dp449y0XZnjGQU+aIjNGgRR9ItgO2zk4cYjHMRZ7WUMi0LlLHgXGvcGY2lAKerbaaE
	 32Qk+NQTHpJs9AOpl5WmgdYAxD+q0xZGHcsCFGf2rZMzJmxLe+2hOJ16ZUCXPv6jDTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DQp1Mz6J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=keTUF1xv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51004606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51004606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DQp1Mz6J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=keTUF1xv
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Fwf22528090
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H0lU3jlQEaKoyGca77UmWWN4srY4UKoUV0/x2GOHDbQ=; b=DQp1Mz6JSfNUAkzm
	De+IjjIf07j41uVRuHOwhjcx2lBv9o8kPJAstvBkVYgDW0TS3vySyyfMCrShtIii
	8u3SBaQK9OWf2mdYkIQ4tn93EsEhAulmhb2l6iEppEZUt9ojXVm/sU8P5Oi/jRrr
	CJxhDAVjEwrl5dq3BcRoYDAJKH3rSh9Xvb3VySkcvbxo2Cu5ToohSup3YX4bO8D6
	clgokL7myiHZ4sCnnpSHuHoD9GJuwfdpuwIOBR2S+bQRzCBADfpxKif5hs3AfL3j
	PNlQLABDYIi8SmaZC396ukSPCHJIrwtAvlNUEEtqoEcN6QhIXbF6MhtJ48JSG8ow
	/h+rBw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7rt54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:36:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd652c0385bso2408734a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795433775; x=1796038575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0lU3jlQEaKoyGca77UmWWN4srY4UKoUV0/x2GOHDbQ=;
        b=keTUF1xvRWA1qsmstOg8yucmR+XnZpxk4vEWWwsVp2gaZ27jMp3uiYpdGj9E6zscU0
         iFx/P/uH/Duqm2BEw1cnxHjqtF6EH0ojzWytIRHgS2aXxwGluvJqiWfPmtvlWdUQmv+Q
         p7jSfWjVemX2ZlhYmISIpUWxhZH+uhhts9aEWxS9dK4lcQpCZAnyVF/ZuLo4s4ztL+ew
         +UMKZiSsNJZm1LAiEwZYXSfgiB+bUSVVbMULcEEfDqFJw2jX5t1ZE4ZiNa/gdxEKS2td
         7QzRIxjOtbLBVTj2bPKBJ6VarB9Hw3gSbGFnQE97JLXZ5pgV0TjOyU7A2RokRBzlr2ZV
         E/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433775; x=1796038575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H0lU3jlQEaKoyGca77UmWWN4srY4UKoUV0/x2GOHDbQ=;
        b=nWUEwzILOINIF7+9zw/tBdeM0bskfJtglhNkf6VNCgLjcGk6FTIakuhkQtERXdOBGg
         ky6TbIAlGzl5GK4QuDn7rXbraV5Mgr9Ee2pOTrz5vC2uuCWSMI6vXZOKSzIqM3HfAz75
         EuX3rXg9N5uUR6w9Vk/9V2aoMbDE7tyodeoXkZzLgPyaZ6sr82mXt71ptmvpjz3gdWWk
         70xWisliGg7fIdycjk1mHzaCcNaKtts1Cgn1PzwoikZbk0oOAjWaQXAhA5OJYv8fvxGp
         P/+yOOYCM3Uo3F1TkrboOwhHK0fZyESxllWaqtKW3kS3LiJ5IDk46GweXWFJaJ/nHfWU
         moXw==
X-Forwarded-Encrypted: i=1; AL+hErHuHT5rlo2EaAm+qiv+/7AX2t0SdyXKfHxvcWKdrowy5jMxWVEDsFMx1mJ8AtKP0e0kg4mM8Z5x5jAeANY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GAYBMe7pSdkM3U3HHHqVWmATa3SWzISRWXcK975c7p9kS2DpJ
	BHSZ8PmjjbDigSRIp//i+x7BHI8Hbi99K9g0L14pwXLB3xIueD0SVvmGouQV66jUW9orLtLVwzO
	e2SoTsof7yhQa29CNPrGvd7cLex65SAgl1w65DyJ2tDvd+h5OMdnywz2IGvKwWsvklpY=
X-Gm-Gg: AZFdTZfwePsr4g5TT9896w8CVlR2lmr+vxwC+Z48ezbu3Q1AM6kUYr35kTOBQdoHo3t
	tSDNHM0MJYlj0gXirbbitrbmLma/d8BOW15tILiZ06pjvbqTOtE2C0SCw7gk1Po6kojmytGQ8wZ
	DlSi10zMffLK3+Md7lB8RvhrmZ6zuP4K1d6TXSQ5F0BtuOyCSz6cJwjhvDD6gv+WfDLUhKQxgTK
	PpTEhCgQk7TLojsPgliGtNI63UJ0VUPqvAjXPL+PHNFNGckbF/uOI+wSOOm9QZ39UravsheWORe
	KxN1L0TeCaMH5g1YCs55Byp/tqL9tGkBFbvxwdeuzkRLyLIuwiITNn2L57H/OvIzji/k7sqoanx
	rKfma2F8wGNiE/OiUM1r4LrRGXb7H1k2DS+Yl+5izK6DTq52P/IbFYw3rwVD1kw1TUuTXeOglK/
	ZvdfDS
X-Received: by 2002:a17:90b:2f8c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3b41c92a519mr9916315a91.29.1795433775374;
        Mon, 23 Nov 2026 03:36:15 -0800 (PST)
X-Received: by 2002:a17:90b:2f8c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3b41c92a519mr9916282a91.29.1795433774905;
        Mon, 23 Nov 2026 03:36:14 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm17489024a91.11.2026.11.23.03.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:36:14 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:05:59 +0530
Subject: [PATCH v4 1/2] dt-bindings: media: qcom,glymur-camss: Use linear
 CSI ports
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
Message-Id: <20261123-glymur_camss-v4-1-d7db74f59e22@oss.qualcomm.com>
References: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
In-Reply-To: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795433764; l=1681;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=zjnor/BWgyrwK6XP+tfmoWltCexIIqOeeDD8ZoHZrVc=;
 b=D2i60IsClkxDgo2LFO2Fp0mVDOAaqsoJMbmRuw/7mcKjIsPCRStwSDKQezh6yKM0TR7PFY/KC
 Iho5S9xtIDyBKr0n99/buIibSEyLHV24bQB71iCdGuhO9EKpSCwRZ8U
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b042530 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=oASzbMbbwVaaZ2OwXzoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NiBTYWx0ZWRfXyH9MUypS8iSy
 5rNqPN4JDQYfN5kT2pcG4cIItWOP2MPuDr9n4cRqmbCipulygMFsFxSHiU0EzmIsSyr9rdjg0IS
 q5WLkJoLR8/mJsJzRNgb3+6QNrSOF63zk/cM0XNfp62X8vI/5jwFzAthgdGJ5Zk9rwiOLEsCa7Z
 5dwzxx1xuziuSd5xFGfehUIB+EA7ie30gIT0kimBbBb5+ObhgY869Fuk2Z/fnBeU0LoYnZmqIh5
 Q6FJPW2eM9oPsZup/XTuEyIx0lnSdtf5WlVe6tY71meCD0yhRUCZ0LAdwb/R6OZA/5ByU8yBrYY
 kHS078pnqGBT20b9lUqhyijaxlc7gpUZpwZQ3al5lsWgro6r657WWzVgx2+UyECsQIR3Xbsqzac
 Mz6UwkvtWtuUtjJMVio9IPSul47upVIP/QFYMIfRX9UCtmcAZCh3TMh798wu55VXHuQvu+RgE+9
 D2oD5CeYNxcwqNBEIog==
X-Proofpoint-GUID: jIGUrR65K9M7boTt9RC_9Gyt4YDVP-Gu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NiBTYWx0ZWRfX1JVEfMnOmefG
 QnF1obBzxS3R9LvAUWKnlwo5K3cIMk6H9WCTWFkKbF8Ff77cTVqy4M7Mpsp3To1LfRE43CRutfZ
 EfUBfgvgstxWhyyj9d82akR/FVrgvfA=
X-Proofpoint-ORIG-GUID: jIGUrR65K9M7boTt9RC_9Gyt4YDVP-Gu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230046

Glymur has three CSI2 PHY connections: CSIPHY0, CSIPHY1 and CSIPHY4.
The binding documented CSIPHY4 as port@3 because the initial driver data
reused the X1E80100 CSIPHY table, where entry 3 maps to hardware PHY id 4.

Fix the current v7.4-rc ABI to use linear graph ports 0-2 by replacing
port@3 with port@2 for the third CSI2 PHY connection. The matching
Glymur driver data maps port@2 to hardware PHY id 4.

Fixes: 1e0c8f82d710 ("dt-bindings: media: qcom,glymur-camss: Add Glymur CAMSS")
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
index a0b77edc212319fad69113f3d55ca24f184d4b23..18a38fc4f9025f6b927780f55ed4fab194091c02 100644
--- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
@@ -109,7 +109,7 @@ properties:
       CSI input ports.
 
     patternProperties:
-      "^port@[0-3]$":
+      "^port@[0-2]$":
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
 
@@ -288,8 +288,8 @@ examples:
                     };
                 };
 
-                port@3 {
-                    reg = <3>;
+                port@2 {
+                    reg = <2>;
                     camss_csiphy4_ep: endpoint {
                         data-lanes = <1 2 3 4>;
                         remote-endpoint = <&csiphy4_out>;

-- 
2.34.1

