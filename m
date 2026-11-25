Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795620284;
	b=BqXRhleGskIGKEjcwmDmskdPyPVyq7Ydmw5iK830djjNYxjBsUOmq/axt8imQvRRsBKQ
	 xEerdWRBiFDle03KAbYJOzY1PFcLWTtjkNB3o4B9m4Ek4k/h69auYbSdPtuo/6Ee2WRGP
	 VnfOVZtcj4WFWlHybS6vuFWmAICh0qxSU6l8em3u8vvsh+VZ/B9aiMc+D7z6C1ujx+NNr
	 zRcrsUULsdVfzrUWw7e3U2YSC8pnhKYDtceNprUXKwbfYjajzasg/1sJPOTlf5hhH8tBK
	 WIJ5uxkCahUOQJjJUZlYvnPew+R7GOzbsrwfjxfzYKJ+uaEOx3cCK2+dYQUT4aUTGfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620284;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=;
	b=CA5LQbEmpZA1a+9w6KenvzlDKTU5aOeXn07hz2WvHYgXkczF/gKDQwRELcjTjSgDAsjX
	 WWdltdxhkatuxI1n8bwZoNeEJrcyrDlIdxH5p0gviSsIoQ7ObisYf5cfP02WCovJvO71S
	 uECVKBiB7m2KESW6IZ2tX+Yc4h+O3fd6tE4k2Dc+rTUs89ubIPOY0kTfXu3S2T16Idy9I
	 +IHyLnDEi7IbYDjEM6RPqdyB2C9DktXimy3yhyZecjhSf87ob0x7Qs/aysJwy36nNRZee
	 oB0bUquxMkWo+oPbt+ia1w4ybQ0kAF+/vNR0dadPO5nRKeJEr9K9HWy8/CW0ihiEFWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="OpB6FU//";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jfXwBeJH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9066E606A335
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9066E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OpB6FU//;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jfXwBeJH
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEM7wj2729775
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=; b=OpB6FU//8xOqb7OS
	5fVG54KpU7ZjNVKjctadQgIBzM1pOMtfT+p8RLJQKyYAAI7DZyJ5qt+UOaP/9pq4
	u8sBWRPln3bzRSPYJOuCVV7hYFjGloUQUfoatqf+FTAUdrFoUXI8IRA4nJgD5hO1
	itivGuWNLrBgEQ4KnYHzi73YpEIkNS2hpwNeAhy7ZKl8SxdU6IFb+LEhb4BFL6GZ
	DmcN5Y+58aqVqcFdGV9uBwFeAW+ByxC0qjFbCfgk8N4RUZhVJhAGLOUIiB4jt5Kz
	fAq9A5IwNKwk2eFTo41CSn49JtybruJZBKPkwkWdyxqWMvEUDUxgC06m1qXnG5Yg
	jtr1nw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuksh32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:24:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso3477810a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:24:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620282; cv=none;
        d=google.com; s=arc-20260327;
        b=sYKff+AYtg1netszqFV1FBpPspA/FsXqmYbkbT+jRwmLvy2LHkWjzj73rh2xRA3fDX
         BCV8iBrJ8CdtXOeFdZrVeliWZxHPqFRDtqE3VmvsK8G2hnX1fHVjrUBpt3G2pSgxZ8mQ
         odTL5aCm6F0PrD76M0ijrbsx+T0WxXa/nSGn5hrHmxmBsHtTXpGjN7YBshHmscEb7IMo
         CUAg9m1etVgegXC6T3Dulm34eMusJGPKWxY6tifLQyoZqqFTPR65oKxPPsKkMuEfkiJ4
         TEZE9ncpBS4Jc1vDaMCgY8MUXK6+vxQ3PP65QCq5t6vRoJjnfeZS6Bvi3+n9R2w267tP
         K7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=;
        fh=sAvZ+w4tzaBehJ5JGrYXDY62cGqB7zA/cS+oA2bZtUc=;
        b=emIe727xOl5A9+nLwvxKj5y888/+o+4eqMBcGtNws1HX9g03Pp7H01A8PUzm5KjBAN
         Zo2xLZHKyHRZnrY7/sgdBxgqCF1NLhFCM5WJR1MsAbeqwrIjLoO0snY1/A5mTB3VsiF+
         iQsqQsVnYQSxprDrINci3D00CpzneNcH+irJrLFIah+o67zzGV0imH3d+C9WA9VeDnNE
         3XwQzvB7TpLZcShcfk1PwmlwJzahmxONfBVlT8RuOTShpbk2wYN1hffWqwk/JvEpzT7j
         O/By54/Bqr9jik9n0O10BuvLJy3j+oHXsKZ11AvqubEL/yQYdCwDoo8LxRs/kzT1YudQ
         k/xQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795620282; x=1796225082; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=;
        b=jfXwBeJHaTqm0iDjuvMIFsvs/CqwVAnoECsbJtJCIIapfnIpvTjm1a36ZEOwjqk32q
         OOyksAi7rRg4+mxz7cuE+2/XqNXEviIfmu9L0l4LJDcor9Nr8Y20yz2oSUVnb1waJFXs
         9E+1zaPu0SxAomNLsACeGhgb7R5oOUC1k34c+Q7GvuSiDh+N+OYz3Pm3mHukSujOFYVF
         N22CPK97xJtNj3GbYep6zfkYuBR4ob5qG/g+ypEY4qERkZMM5zyphmHCEOnRGz6Y1kyy
         8i2t2gBjANeJy6bp7rKzW4Px2ytLXlRKBtoal8JQ/hb1QXl9+UqfmcePSux0B2+BO/ji
         v4ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620282; x=1796225082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWI0oTPS6UWP+KHreqzTyFzt/bLKfNI1fMUEgGA2TjQ=;
        b=11M4olr6cYyVQcu0II5Vl9h8AIpmyZZ1K0ZDHg9CCHnlpax4FDVdH7jjV0uun8IcVJ
         0TtQXznt23Dnlc1n3rsoNA39FYdX6k1MNT0OCWDiGg5vNzhyIZDQPoX4K6Xi4XKt1AkJ
         llUiBQ5RKnupsMdls+hy73wHWT7di3cR8VIQzzfeI2QeN0P9m9v7KotTKN19gJa5dcXI
         mzzCc9B1E/iZ8WcMJjxaK224J8iQcqcZuPZr2mg1Z/l+M/cbCqdOVzAyQMEx7CWnZ0zW
         grse9rQ561Lz0cuTdAQS9LzK/fNHTI64vf+owztLZV7PRuRcieFmYYGsc+QQ6eSam3HO
         Y+8Q==
X-Forwarded-Encrypted: i=1; AL+hErFypRAObPVq43uRADqm0VRnEFvV7EPqQ6Si9w7GDDo42sdZ96BOPJuuBeZAgp/tWzl2RzH2z0y0ftnt4RY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FmYcgFO3avrZjWi14oyvNjfdJGl4xLlsY8atrz8RL2YsRHVYM
	BAOegHCNzGw0NP3bssoDzB6FhLodpvYBTS8hfs8PUSQnsfubzUmVEBwoCoAI0KJCuMtXCA98O9O
	lyIvjZEpoui+PeWTDHrHP+EqE8izQgtqA5YfQ0ILC2irt6AAAwahebyoTU6Uc8OrHyWMoHRUMbG
	8HewPG2RWInMsauwalVSYmKMVCYU5Ly9tkRoHQUfnebQ==
X-Gm-Gg: AZFdTZeztjVLazHsBv4jrrVDXhV/8rIKWP87BVlXHY512dPqYlGSVSNSTzqJwEu5ISE
	twG+lfqW6S7XybZgQOEsryZRMGajQMKWTJJaPevnDMZmoovv6TDAsQu/nfanunbkWjapaFnz4Oc
	+ejTB6bwTlVoVdrN2lOaUZgXKM/3ERSzr2eefKXDsr/Sg3pW4QjLg49r0rmA==
X-Received: by 2002:a17:90b:2ecb:b0:3ac:8446:c1a5 with SMTP id 98e67ed59e1d1-3b41c988620mr15762976a91.48.1795620281123;
        Wed, 25 Nov 2026 07:24:41 -0800 (PST)
X-Received: by 2002:a17:90b:2ecb:b0:3ac:8446:c1a5 with SMTP id
 98e67ed59e1d1-3b41c988620mr15762922a91.48.1795620280668; Wed, 25 Nov 2026
 07:24:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com> <20261125-halliday-dts-v3-2-5c8311c0b70b@gmail.com>
In-Reply-To: <20261125-halliday-dts-v3-2-5c8311c0b70b@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:24:29 +0100
X-Gm-Features: Aa3M54pQyww1I_PbdCBse1VupHYmzcQQ8jGP2HKCbG8YvURb7jcXXUW3MJhTLAI
Message-ID: <CAPx+jO9aHqEwVu3j5CdVTsfrhk8cMRawA5rj51EA7AdVtn-U+A@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] dt-bindings: power: qcom,rpmpd: document the
 Halliday RPMh Power Domains
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06fdba cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=yRSEYQ9GznzmN70rNvQA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: V8-TNBBRVj9ULrhZHIIXoBpp4nvDOm70
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX0xzXr+FrAO/F
 VMHYKviYYhglMWNkDkqs0lUT++jKOvNjr4aYQm9oBa6eSWjaUObQCFWE7sB7kULxW2ygh1o0mHG
 olyxPgITus2n9Ipg75k2pRzU2gK8crw=
X-Proofpoint-GUID: V8-TNBBRVj9ULrhZHIIXoBpp4nvDOm70
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX9njWOvLonnqw
 qn+CQvgz6Grts0xwghbkEQyCYiuk1GNMI+s4cXaCf9j5G0XNE7Ds051cHNQFpC4rbIeO1Tyi7dj
 cxp/n1id82nc7RQocJ1jVf1fF7AIR52l2j/5UadbaaR3CQMjIovtLOLJJp9T8TnJV8xw/NYnLWs
 CzEKQZrhuKAlVCGja8dvou6zTeIpjQKXkCc0ma+gQNX25O5QKVYMwd3Byd+N5V7FOXYQJFMq5h+
 w3X39EV+tlDzRnUEE81LSJyFL6WJ/ZIEqiOcEqChM0QonL4njQUOAUeHw+G4289VL8kUJYtryU9
 PcEYflwEFuNyDadzxeiECy2WP1DwYJINElpD4u1zoTpFbY2o9XZqK0eqY93HNi/Pkiv9bhbFcum
 rpeXko7laQTv0CFYAJwsV2x+hlEjNdATvxvq2l52G6wQ8M4vN8wSfrhjB4UG1FejJyKzPNECQrM
 Kjv4O8ejGvTb8S/c2KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250061

On Wed, Nov 25, 2026 at 4:44=E2=80=AFAM Stanislav Aleksandrov
<lightofmysoul@gmail.com> wrote:
>
> Document the RPMh Power Domains on the Qualcomm Halliday SoC
> (SXR2250P). Its command DB has the same power domains as SM8450
> (CX, EBI, GFX, LCX, LMX, MMCX, MSS, MX and MXC), so use
> qcom,sm8450-rpmhpd as the fallback compatible.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Applied for next (available at the immutable dt branch as well), thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Do=
cumentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index 8ee1c25a7c9d..663baae9cc64 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -82,6 +82,10 @@ properties:
>            - enum:
>                - qcom,maili-rpmhpd
>            - const: qcom,hawi-rpmhpd
> +      - items:
> +          - enum:
> +              - qcom,halliday-rpmhpd
> +          - const: qcom,sm8450-rpmhpd
>
>    '#power-domain-cells':
>      const: 1
>
> --
> 2.55.0
>
