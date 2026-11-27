Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779711;
	b=aloiw0N0GzDkJWB9wGXnRnKQ1/tF4Mr2TSPuf3CZnVzGsWIE2ioNqoOQb5fsABXvplXN
	 jFGJXdz9zMxM9Gv1L81344ptjqKrHkgp3ZbciNuVK2mHrLiDd3O7nHfTZu0CtFdvM2uPt
	 Ru5iiWYLqfRjfpJyqy08Z9zm1l3RMll8+XUEOXpdmpNiYvtMDTy+802RUJvBaezvKr0tx
	 6ZOnyFpdMnrj2ro8ETWJW+GcIF8FWkC5Y0mnFeQVo/IafOZWZZHbnuyNoyInOnBCMAqJA
	 t3+92xRgeLYgWUDgCd8IQFXYGDnXo4ZBGKyz2mMrSHmvj7V7XDkQEmNqfNzKyxSd+5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779711;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tui2aONOVvk8cBYofPtMI0v3sAqN0qQM1QPCpAp+dkY=;
	b=QFVNEKmO1ngwYGhmFiJOSK5551wsviAqj5hptjRRaa8si78VHYOfbmOh0BUyDK+LmBau
	 CiKghgv1pQmTbb0oAzhqAgqDgJFgw1xyuayeqV/EYWgnjgoHGte/dycFB0dFhgbwZtBmQ
	 Db0fJSpJQu14QVr8XHE9yJooXsZa+bw2t2HAJGtvZOwwCB82sZDv0wwJz53HH7M6gbu9+
	 Xl8x7F34mGTeJFOIhWiiFGDNgWMmgBkTCntrBgHWFRloeei639B2M/O7GPC526NxFGl8Y
	 E++v4BGc5N9P/D1+3SrGNnTOokP6YQS6yXB/wBnMLFljG5E/1ZefUNTjAKHoy4fzTCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CS/jqBxP";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dHvjvmiZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E2E60A3806
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30E2E60A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CS/jqBxP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dHvjvmiZ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp2Hd1047047
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tui2aONOVvk8cBYofPtMI0v3sAqN0qQM1QPCpAp+dkY=; b=CS/jqBxPR0FxFoC5
	pSPSKZ7d50UrShxfvjlymocXvhUnD+pa+IyRau0O2dnJhmov2uqCI/x21obm3L68
	dXlxEyBZgFCkJHOkb81Er3eMwscd39QjMl/WsnVTADbbnM5nktWNLi/6rxWBksF6
	K1n6QiC3LGU9Vh1/AtQI8n9/Zyukw2p66xX7UoUUDtefOk5UVdUOXEo1T7AWcDoG
	3DpsvBjw7f+qyNbOdQXFa0xmm985I/GwqbdyG40tIo7QodIxrVS1rdAsQF3iX6z9
	fVNFRmIoe0Np2TV1UjIGyDP5DbsujRtHVDszDPilKPQ84/IMHOpFLob9VAWj5TxK
	prjQPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqks96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:41:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d3232fso1098682485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779709; x=1796384509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tui2aONOVvk8cBYofPtMI0v3sAqN0qQM1QPCpAp+dkY=;
        b=dHvjvmiZYv9B5t7RlYFoph8sG+U2l+9Xu7W4kyZdF4CfPFbvMv3WY72vLTE/uvicRW
         Zd5Jt/fvgbCWlHg6ldGNdBnvHe8VHO4sty12lbOgO98a6lAIRGrbFaJppS1agYyP9TXs
         vACuosmc0+A9/xjkgzwS/R7MlONqdFwI/ydPIcqWbnbFBVisdcRGaYGDmvnSJ9fZLekc
         Km07xGfGS60ucqHKJyzX7qUm7o69wteUcOlRGhEz19zF5DRtQOQpxzcNOH8lhoBL0fk1
         wKO7mIPrE2HyLyV8Wh8HuCj8qcZHsszV8fKm1C4xWRM18nEbtzrPUCZLLrgjfEI5Nyxz
         BcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779709; x=1796384509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tui2aONOVvk8cBYofPtMI0v3sAqN0qQM1QPCpAp+dkY=;
        b=xV2Sm1M8UavzzsTQEFSQ6l+Ve426U4dULN12wD+OXq+tmatmG1StVyZ9bLi9qXmNsS
         p6uu969uz3mZHQCO0CcocS1conu7ISbWVnvpyJkgQLdU/XcstW040/iOxqLalSCW/5sO
         y1gi+3FaXTvpsm1FCj3qr6KTnk1W6cJnJQ/gozXB+ipywFwDxyzkS/KMwbUCcClAhM6S
         MKaqA2+3DkcfmzRMNwR6OR/6k3rgpNBkxO47n8fmrBVTdKm1eUmOHAQx5gKzG/PDMgCc
         0trJnMZfBRhid49czdXaQ7OdPwGX2bZ9B8eQsQ3ulerejNmLJLxljMLihi9D90AeGArv
         ggRg==
X-Forwarded-Encrypted: i=1; AL+hErF7+nZ0ATz5311bFCFm2To1QS42j1jS5zNJs+pmhKeXHGKjFhDDWCauSVsWFg8ZlJRhjKZW1Nh2uF1rIno=@vger.kernel.org
X-Gm-Message-State: APuU4Z+66Z2pAwgiYeGChEQndhKCWLzAxz0ao1NzRKW57AmiT8Y0vflF
	eLd10lucTnTpzPuFdefed2HNtbEtmHRBSQ5p/3xp7AtdpAGFyOKhmNPSsCsemPw6N269NrXjprv
	ztUYcSwcuiKwIKpTbfn5pnm9MTXycsDNEs2KInxBKFvrfj4WGUFH7suhWuPmtqdc+KSc=
X-Gm-Gg: AZFdTZfGY/z4LuZ2e0TWz94DFrMa3iVwVVZ8CJJ/owrwXuVxYBL/yfq6JQS2i/79xdO
	R5B+C8JU0xSqy/ZGsCcbPV/TZddLLkoznGBxZ8jT6E5xBh4UWbGrRLQi7SyA4kBs6xdV48aNL90
	fNMJcihEjn8d4UW/tKiGclnUU1QD8kjHg4U988p9bkv9j7s670T6IJ92RRgFJkh7Y3uYnLukLLf
	3Fy3qhwF/Q67gO5tF8RaOJpAaw/4/6HL9GYxt8XTVIvUiRtZgXJFzEKi6LTKJ+a7xrasMTXDbBb
	BvnrrLFkn+8CoDwz1se6nTbAkcNKGfBJbPO4rRGxlWJ1+eEF842CaLe/ZftQHBCXgOHU38tFhy/
	X0P96kvMbBiDNkZQLF+G+azvVe4wbRK3Nj10p3lQUkZwyegjP90qZ47L4LR4xrZQQd8vdUG07PO
	Igbzl4AO8lSx+oWn8b8flj16i/ydyp0TZER3BYRr2LKydUDFoREeW3bPmbiZgveC0=
X-Received: by 2002:a05:620a:1707:b0:93b:c58c:d3be with SMTP id af79cd13be357-949baa0f7fbmr3972939985a.37.1795779709410;
        Fri, 27 Nov 2026 03:41:49 -0800 (PST)
X-Received: by 2002:a05:620a:1707:b0:93b:c58c:d3be with SMTP id af79cd13be357-949baa0f7fbmr3972933485a.37.1795779708887;
        Fri, 27 Nov 2026 03:41:48 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm45137049f8f.7.2026.11.27.03.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:41:48 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:41:34 +0100
Subject: [PATCH 5/6] dt-bindings: clock: qcom,rpmhcc: document the RPMh
 clock controller on Seca
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
Message-Id: <20261127-seca-clocks-v1-5-1781298e658b@oss.qualcomm.com>
References: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
In-Reply-To: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=895;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cOfO/lwWerFvv74BYZiZtxxqDUTbGn52r0I0TAxffcQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWxwBpxDUHhMVQG+XeyCyeGNmDrCcfzYqwi6e
 DpBPvYCm2mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawlscAAKCRAFnS7L/zaE
 w2KcD/92QSfcPtkyYV8dMMTsSDHNtwx6X0n3t6nE2MpvWc2C5UyR+UXpYeCgF73fQLwau1i1gKK
 t3KKEktkj5UkGynbnum+KKn5Al+ti20lgtrrh9s3Y+QnjAE/8OXEyakvVz3nJy46jvgX2nOotLs
 Nc3YdFd3CCsqTASrWaFlwKDoTlwnVdGD6X6uVIoblo83O2n0F3fsoSYksRHr5Zp0+czHBWTkZlM
 Q7RZxL/0nOAb2cEexn5vU/RXJnRYgvZANTPE1CbaH/Al0YS1UYJdFlV+pzv/9QLEc2tjAZT/wWL
 1/D2tWj1Sok0S/t7QM0dvNwnl/osFIL5kmp5kXG7jG16RWPPtfJp4yXh5FzwSC2EHY5ChsQom8c
 7WC6eEIiynYkOPBCRDfdJLCCVccv4RAHrll7P3eynqvC52KUXeJ4Up/mmacY7J6SQ6Ts+Isz1Qf
 AwyBt42FSu1I93fmU4FjD4qz3+WDoXPxza4jqNz5pcWwwGiY6mFomVdlLcjD5dtijRq0cXxPHVk
 N8NiG2S8DBkNrgCMjGwMWdZDeqD0jUg4DTBHTZn/GBtm/5gHTf1t5TA3AP9mS8x02xNIgdUnugm
 pcoCy987Hj3CE1UgEr5MAhyZ5UCrj1EueNKdWolAyR+EXRTcKtQvP+qEN75OpvQqe7HXfs2wvCM
 dyKoQJYDW/uZBGA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: dtKn_jfsH5lTKgbuGqNqbvrB9z1aNBGO
X-Proofpoint-ORIG-GUID: dtKn_jfsH5lTKgbuGqNqbvrB9z1aNBGO
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b096c7e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=2pdyNXWkZcuE2R3gGgkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX++N7kzRjg0xt
 xac5FZLjupF+aJ7I5iHB0XH9gzAhy2xPU8KVd0mBj9DvYmaxriPX1rzucu1iy7FgJmMs91TByq2
 jJRLke44D/nN+eLqMSue2yLaWDvfGpc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX9/O06xwd+3wn
 BZJc9jC7qNvyg0Hs+lMeYAwbDV6Ep7pUzphV0Q7M00u2WluDTCTjq5GsQfKwh3vOj7cy4wuOcMq
 3W74Y6N1efKIyoc1P3znMovuFFTYhIMCalcgMyvBdFWnLzdKIT8ourmSJo9zDfry8GNRtrn1FSl
 ICNF3GKJW+UMB1dSQsAvIJzmh/KoU1DQzFESqKsUZhUJ7VUT7X5SZ6lpjzXm/16zOVAleJYh+kN
 RQEPnSBMfvPzvSPR/adOwpdRFdZ9pNN88lFvhJz+uuRLGlImQrl8qYS8sj3PQ90xm2Q71QBYALL
 4nPiepY639COONGOUzC31lr4kzZyynnbmPS35xjUCawVuXzaKC6+kBXBMIX87OLcjtdFbpR7j2R
 8+1hb/bgm+tW16SbqQPwBSOF6UUNqpyOth0hXvV86U8qHctesUW83Snp2pD+IHCAd8MYs5gXzUF
 N2nhy0R7aA6UP1WfJSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Add the compatible for the RPMh clock controller on Qualcomm Seca SoC.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 5c9b653bc2aa59ea85582d5bfd9aef5c48ec6903..cfa78198b2c0cca85888303b25766b7b01e2c13e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -38,6 +38,7 @@ properties:
           - qcom,sdx55-rpmh-clk
           - qcom,sdx65-rpmh-clk
           - qcom,sdx75-rpmh-clk
+          - qcom,seca-rpmh-clk
           - qcom,sm4450-rpmh-clk
           - qcom,sm6350-rpmh-clk
           - qcom,sm7250-rpmh-clk

-- 
2.47.3

