Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995024;
	b=Qmnmv6EZYrGuE0dnHUf9/glQzlWY23QydDbTGxNceP6daYrzVzMzpDQZnXqpKCo4tVVT
	 ap7ZOFTtLc7Ic76QvyfThTSBLA0Bw+OP5qLb2Vtd9oKY84hum+hXOsEfL1VRLOMcov2HA
	 JjJOxfwNK1AVoCxxxItxEoO1DItVB5n5AaFVNpWeF3DTvfDzIN/Zn98rY2kPZ9a8qTjkr
	 iLzTP8cw6P+UebNzw/PGM/vDRKsFC9E1AM1vR6cAPdR0HG1cxFE3eZlcm6cnrdcoxjtTL
	 ahcQhx2i3LoDJPjJAQ6THhq9ABAK1jX6MeP95qaf8jVtBGXJ9vg2JwOddSPwHKr1Peg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995024;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AUnrIqYg5oO/8dWsnNZrU8gC3RoY4sAX8r+6bIRiQzU=;
	b=DIhWJOH2/fPv5/L++PWKvZZZlIxr1J+ZrLGsRkAn9ZV2L5xX6isre65XxnqQXT2g5ihK
	 Ym7hoqq2Yc1jgpc9UtJ7tgDEFSL+1t9EwebOKM1dmi6OOyVkBamzq0a65gnfunArJgl5m
	 fKfwtT4tUjBLZD7hFynKgXn6s/lmoLy6rzJhTn1/deU+aHbmb294IdCf4pvosCyD5FhJJ
	 GXKja5AkcmtwBoQtkmvb79EikoRq/K21laT+FFkQKV9KF9GsEpf64k4+g5ZTzuCu0V95c
	 PiLonYZyLQRcU0nu6zy0pgqFCtP30lzbnE/8kXcgvDGmr3nsEY9AX7mhMiCW2p9OiMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C3AM7ma5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PIw5MLxt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CF0606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84CF0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C3AM7ma5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PIw5MLxt
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI91CXT3121739
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AUnrIqYg5oO/8dWsnNZrU8gC
	3RoY4sAX8r+6bIRiQzU=; b=C3AM7ma5b7fxMT9qvM40GoiEHIniEOXV5+aCbCYH
	wJGk7imQK3QM2W3lWYYtco0s7LmAVfO5LQPJao/v/fHyYigkAR2/KsMwOEoBbFbd
	F68H7vQ73gJLQ65ph7zygPqbPyQq0HW+yuwjvu3LFJyebvK7oMGzAxWOOqs7D1ev
	vS7/nZgpZOL1jLaaZNvXcpNVyPEZTQuonB9Z19hnSRefqK4kZfzUUnzoIeiiA3WH
	v4Ich2uHdHhBjRlaE8nAbjLPKTsY6ECcJLL1hbHEqaMVkT4/M31E9CakIaDynlCH
	wRUUbWkKpMcJqu8uUcBAUqdK9oJkHgs0nHGDvzkYIYO5mA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9javk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:43:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so148921285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794995021; x=1795599821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AUnrIqYg5oO/8dWsnNZrU8gC3RoY4sAX8r+6bIRiQzU=;
        b=PIw5MLxt5nnUKf+HorXMNmUhdInSiZiRqtc1xJV0OwZ4rHcbSbemHhMUriNPMkexZ8
         9xs3dVzfoeRMsy/61Wx5Pf5vx2Lxrr7h9CoEp7PoGCf0IxuO/tsdoaVTCcgUHRICJGX0
         Uu7jTrqn5AmReCJUmXxa8PqeZNQ9h+P+t2qP1j98pixlwsZ3bL9HZKzZGxOehbMMiKbd
         2qzeEN0PuwLBQir4jQyD+d4FHnrIAaK5eOr0Z4U0bZN8E3kaMXyK+e9AcD/ixVOMul6N
         4deEFg9kqsI0XIM4kTlxYbzG03FTuD9VI8bLMGBvlPEeWQ+QASAKroYYv89ddFO/c8lB
         sVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995021; x=1795599821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUnrIqYg5oO/8dWsnNZrU8gC3RoY4sAX8r+6bIRiQzU=;
        b=bygX7QWQNlNIM7C09TixElJIZJYY7v5Z9sWKWgBv6DgjT7HQ0aKT9QUOgqbcBBrmSH
         Mo31PuNd9I1xSmAn4qcArDEPu2wt4PYWmjPcqHOOj/PZfgRJvErQbujr60OqKfhc7SJD
         bXPqlZXvmr4uBBGI0mggj1+ugeEkSHBnu9vZJAlZPDN1a+fPm0ct8sVA6pwOvBiaOEe5
         zWE0idt50ySlLsJINBqfLyhUmFX1jHwkwxJvHPRFYvrykIZMI0qVgzPVYk4k+9tqeYjG
         EhkEOr4THvlexCdUo83+1Empl+eOK/Fo9aH216jmZczf3QlsdD4HWbFH1ARpC0LGn6Np
         Vtgg==
X-Forwarded-Encrypted: i=1; AL+hErEnVJvg23x6TbbJyECOUqD/6L0i8aFDolQidAP6hBskJKiYOHoxTYGZ2XD9I+0E4QfVGadbAEJQ2FWs7rU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eLtL8764tFcRWyqQqalqP85E2EHrQfBvtMCtJMn+q6+JBbRCV
	/jDGIT7+/Jb6PC/S5byvjfAZJNIjhJswCtr2H9v5xTdoltVIJmbyFfjdD0fnNAVR/WtztaLMKjk
	51EjALZ0MaSugZ18JD0gGm1TfBREUZlhI5Roj6GjRD2x8DkEKD8KRsdcnFX42yl8+P4E=
X-Gm-Gg: AYBFou0uZGRz19YfQNC2kblOpr9DzW/YMvhBBU7jAso71vdVNUQUoEOVPCqUo+EjiNL
	D/prpltOEY8ptkcI8zyrr/JxgGUBNqOK6+o49tTAR8b2jKFp7MPWpiqxtu+J7qFo3wG3dRv7W5/
	sTUMgCauoF91Z2PX8m5bbGcWwcwHo3Lv0du5UEeNB6FAuTgIxYOW9VQ4VEc9vm2qXxpi1A7VEwK
	vgzMy04xLpMr2rBtQzgr+WSPa94XDWKIir0AfNVcD6SAQZGvONcaPjh1dDqvt3Ki5f19Nodh6Yn
	rfn8bkJmptlYsBuE5dUozXCFyVw0CESv1vrcj5dNjNAGLlzdDowc9Kt1vGFzEmEX72Zk77nrgV9
	uLAX1FM3rOInc2AFoPor5z9MV2DjzHwjzf+ZWXO2lC8trru7EC2hcU9LbR4/USOU=
X-Received: by 2002:a05:620a:178d:b0:949:3066:5569 with SMTP id af79cd13be357-949995b2d4amr398314585a.46.1794995020964;
        Wed, 18 Nov 2026 01:43:40 -0800 (PST)
X-Received: by 2002:a05:620a:178d:b0:949:3066:5569 with SMTP id af79cd13be357-949995b2d4amr398308985a.46.1794995020335;
        Wed, 18 Nov 2026 01:43:40 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm3435347f8f.42.2026.11.18.01.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:43:39 -0800 (PST)
Date: Wed, 18 Nov 2026 10:43:38 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v4 09/10] net: stmmac: qcom-ethqos: add Shikra
 EMAC support
Message-ID: <av1zSpwvTVWP-2zZ@lore-qca>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-9-c41902e5f2fa@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ETxtsn8fYdG6F01d"
Content-Disposition: inline
In-Reply-To: <20261117-shikra_ethernet-v4-9-c41902e5f2fa@oss.qualcomm.com>
X-Proofpoint-GUID: 8ZtN2vWgrdV-CDZY7bmpcf32b9h855xR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX0tVJxF6EkwkH
 T7uN9VhwCTACalmSmmENn71QPENUtmxJaOckRZshd6oRJRmg3LdIhqxvkzP5M2d8lv0M82Slesr
 Xqs+26MYG8mzZJBXnzpUZzvMmsqG6ok=
X-Proofpoint-ORIG-GUID: 8ZtN2vWgrdV-CDZY7bmpcf32b9h855xR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX5o+rH7cxnMTa
 p2pSd6Aoisi0D+LZ+8dr1n+Dk/eUz9lB+Er1y2zD4dd6qStfZkCd8m753ge6P1F7JdkZN5bs24n
 GVWyuyFVRcs0ftTUjg5NwwvunfZE+nvk6t0zGtmgB/eFXxKS+GuMPWztRl0DcDR+dXikMHmsY6R
 lBGR5xc8XqMnsnrCCmFMezU6aTC0Bc21AEsdDeYAEMHZWj46E5Bz2vxfVJ6lBN5epCcAmPR+alR
 kVQ6NCJe9PlqZXuoLxydRj4Jqh0TZ7Eb8rpY5A3JmGkqd6X/9Nq+D2c/R3n1Br+7w8Xz773BbMu
 WU0aZ1MDKhapdf1lXO7GINmzO3E8jYrs7Pe1Xshz/eZtq04nXHC6cncFvxao1FnU1HEipog8TOb
 f2WKVC495ienHew9XZ6WQJa84zyz5LlZdP59IKOY6cTv+uH9xEkYJ+5rHyB9Mh+b6S3qv9pwFfI
 SOsRaEhHodFWozXN7vQ==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd734d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=LGXQo2T9AS_8CfUs2oAA:9 a=CjuIK1q_8ugA:10 a=AOVp3MrtItf36BpiwHAA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

--ETxtsn8fYdG6F01d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 17, Mohd Ayaan Anwar wrote:
> Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
> GMAC IP, similar to previous platforms. Register qcom,shikra-ethqos
> backed by a new shikra_data descriptor that enables the three NOC clocks
> required for DMA memory access (stmmaceth, axi-noc, pcie-tile-axi-noc),
> and the 36-bit DMA address width.
>=20
> Set the NOC clock rates through an OPP table to ensure proper voting of
> the VDD_CX power domain. The stmmac core enables stmmaceth before the
> glue driver applies the OPP vote, both at probe and on resume. This is
> safe because VDD_CX only needs to be voted while DMA traffic is
> ongoing, which cannot start until the glue driver applies the vote.
>=20
> Shikra's intended rgmii-id configuration supplies both TX and RX delays
> in the PHY. Therefore, enable phy_managed_delays to select the
> DLL-bypass sequence. No POR table is needed for this intended bypass
> operation.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
> v4: set phy_managed_delays to true for Shikra and reworded the commit
> message to clarify concerns raised by Sashiko.
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 +++++++++++++=
++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 15385750b3e6..a7fdba73da2b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -332,6 +332,24 @@ static const struct ethqos_emac_driver_data emac_v4_=
0_0_scmi_data =3D {
>  	.setup =3D ethqos_scmi_setup,
>  };
> =20
> +static const char * const shikra_noc_clk_names[] =3D {
> +	"stmmaceth",
> +	"axi-noc",
> +	"pcie-tile-axi-noc",
> +	NULL,

do you really need it?

Regards,
Lorenzo

> +};
> +
> +static const struct ethqos_emac_driver_data shikra_data =3D {
> +	.dma_addr_width =3D 36,
> +	.has_emac_ge_3 =3D true,
> +	.noc_clk_names =3D shikra_noc_clk_names,
> +	.num_noc_clks =3D ARRAY_SIZE(shikra_noc_clk_names) - 1,
> +	.rgmii_config_loopback_en =3D false,
> +	.phy_managed_delays =3D true,
> +	.dwmac4_addrs =3D &ethqos_dwmac4_addrs,
> +	.setup =3D ethqos_hlos_setup,
> +};
> +
>  static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>  {
>  	struct device *dev =3D &ethqos->pdev->dev;
> @@ -1101,6 +1119,7 @@ static const struct of_device_id qcom_ethqos_match[=
] =3D {
>  	{ .compatible =3D "qcom,sa8255p-ethqos", .data =3D &emac_v4_0_0_scmi_da=
ta},
>  	{ .compatible =3D "qcom,sa8775p-ethqos", .data =3D &emac_v4_0_0_data},
>  	{ .compatible =3D "qcom,sc8280xp-ethqos", .data =3D &emac_v3_0_0_data},
> +	{ .compatible =3D "qcom,shikra-ethqos", .data =3D &shikra_data},
>  	{ .compatible =3D "qcom,sm8150-ethqos", .data =3D &emac_v2_1_0_data},
>  	{ }
>  };
>=20
> --=20
> 2.34.1
>=20

--ETxtsn8fYdG6F01d
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1zSgAKCRA6cBh0uS2t
rPbRAP9BOltPilAtM/l/jP103hZDb2bBRLwQa1hr5OhxYjxr7QD/e4//9SJ8S8YW
RN03Uozs6Lfhs9Mz/3nOHiTwyhZ/zQ0=
=rI6r
-----END PGP SIGNATURE-----

--ETxtsn8fYdG6F01d--
