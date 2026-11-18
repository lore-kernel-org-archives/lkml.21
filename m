Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995071;
	b=ouafLDqq1gaSR7u974RHpiYjtAhnSMBC9tlkMLp5TiL+xZgzNirpvq0X78G2PMGcOD27
	 iWkDDBOeZG7xt9vUq+v1ldEFwOQcW4H+dOU444YGUUniZ1zl/ZKWVP7Il+Ovydl08Xgfs
	 eH0NMvlj3Z/oLSUWfdCuiI0Rxu4nLX3XxAvnpi0n/2nu+1d8Uj0i07QFB5GOauzGOHgmW
	 RBqGdebpbR9U6F1BQOQ01afuSXbBLtIkpPPf+Cel10FTypYw4khCQBOkM6G1yXljviB1P
	 j+toypDFBd5paIm6k/eoPaivQSnWtIWv+eWIZNF/ArahfV8HYfUpt6ra/PM7dQaIetA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UD6Ea5YtRKAN6/w2L3NLQU8hWxRurH6m4E/cCzEvjsM=;
	b=y86qGIAoEkqq341v2nfMi8YIz5APIR95up1PoRW23+KEqRcn84tP/8rf3QnOZOfFz+2f
	 vGkxjjBmYKHByfiDMenmlwo74bJRj5GTzeSpjNDMzX+7wxqQXWNtBLyCOriqv31R3Vows
	 oZbyO5o6hQRIKDW09XZiT7kYzTEVGqki5BcO4v/D33OXCJugfnkGDiyfbawvTZnc2Sct2
	 mkxSczULh0XZ5wWnX0CpjFNL2IBvng+GWZsyIH5zDMKZxCFhOAdKdwAIE6qu0O2jWEn9m
	 5KtsvNX8hRa6zYK/xpOlas+YluFfHOIrjPDE+Vg4Cm/zkhJ2fze5w4OL5QKxDSxxWCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="lxf6Sm/4";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dw0qR+dL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204BD606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 204BD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lxf6Sm/4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dw0qR+dL
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI868YE764118
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UD6Ea5YtRKAN6/w2L3NLQU8h
	WxRurH6m4E/cCzEvjsM=; b=lxf6Sm/4aFYe/mEejA1fegl4KiJLdCnHKNPerLji
	pCROGBJq8Jj1rXJQR6fWcoKxdvDGLJ6vziOuy+0tAKouR9hWOY6Ty1VRIoVStETj
	0oZMxfwMEyxTv8lXY8XUhB1KlUtT7mrzoYMFRnZ4A5FEkmBsRXdkvvarelUEPGyM
	fC1WLAidfAzw3KMVnE5/0a9s5sCWoAo6fpfrIPu/nC74WfMHKRZXl8AV2FZ9kouJ
	rloy4cfMcekALU6jT5LpGH/Mrq6shq1r7cIuwz1hvzROaAZP/vhMaD/MG4Cc3FSF
	24bLThos47qHsDESPVnSqCLhjB4+HwKO7zKUc0n90NASug==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvbacv0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:44:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55b9c13273dso13564221cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794995069; x=1795599869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UD6Ea5YtRKAN6/w2L3NLQU8hWxRurH6m4E/cCzEvjsM=;
        b=Dw0qR+dLZF26yg/TE++0jNgd1YISzrITswRXYLT0V2r520+dI3soxM6oqlnojpmRSK
         uaHGs5ijbzMDKsy/RuKUrDBLMppv0ONTQZ/MBlXLm7fnog7XBzQ4hW9+RvqCdL5YtyQa
         pzR9mKd3quGH+SokZ3WZAZibOTH+J0nyhlyKbgeeMPHWDsP1NreGs+r0pxedJAku3umU
         5POTzzHERV1pM8bhIIXycNEKZw9QRBr6rJKv9VCpfgz+RT4ySF3qaxQWWDL1a3mOu49D
         HL2CVei8erT2+8pthrqnaGghkWPOK8smmhXc0SG3oLzKsoqwkvc5U9cqjW59NWraQWQ6
         7oyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995069; x=1795599869;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UD6Ea5YtRKAN6/w2L3NLQU8hWxRurH6m4E/cCzEvjsM=;
        b=Z8pvHWnA52Kzj03IldLmIF0x6RKjU2wQrSyLm//fYdZub+dp3IksZVakl1IsaJaNqK
         FN4fc8gWFwa5PrwXArXHN/3lVrp1giP+HeSg8Mz/UJsDgIEEpcikPuZq4JRkQ9z+Jtvm
         xvIrBErtPm4obcnhZucNIqLFqFREMVrBhWNDb2dKSGrs/EWP9C6I0TeYqvGZjHZUMvQy
         9vZMBEJE6/mOT7FFZDw+oAJvZW8cSTw13g7MTkajAlL+TjyjD+PSvSa8PAXtF7zfzqVW
         ZLUnENc54SzgGRY3wikPORX7xqYtHGlq4hFadNAoXoxMh86pDkKfmWPweHWZ99kxWci7
         J/Vw==
X-Forwarded-Encrypted: i=1; AL+hErFFnzvAlbZK+hFGpUvimddC6EBIMz8deVRjn4O02fZLkT0dBnXg4jxnvwzxCqEvSkd1msfNe4uAKEFkHBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+st2BbEjTw8YeozoqYfuoTi4esCVvrSdueJUaZDAsyIe27U9MV
	IxHNP1SqGd5HJH6fv/P6fXoM6z+Zym4rn2Ylh4qO0fK95dVIG9quzJ7lcP+n8Z7ibZH+/0ARuuZ
	Bsd9A4+zvS6egkMtMeO9DbR/izXbThy7x41g4eUDc2476dsRr8+BK51uPwca8V0PdQO4=
X-Gm-Gg: AYBFou2gJ+kR43YVYY98hqtrzy++Sk1qpJfaFNALd+r0IO47S3ZkwaXEQ3UkR0e9ib6
	nmKF9Cioj7s41wHZPZA0qggaQGgrvtOfTB3CnlSGtmb9N+aVgU4vok9JAE1ZnAtT+F2sFMS/yIq
	hMhDtwyIU0rsIHbZv8p3SUE3sKHaL7+xB9fXWfhMDwC2RX4fetW1fpH6ctOHvd7T6w36jcboGkv
	yapV2KYo1kDZJv6rih8PFJ7arsOMYSph5dtzDP7Bp7OK8QwmDkFhHvO2GadzfRIYbZu6n2LeU8Y
	Rph3btHwzRgoBmhCq/bWm+QL56mfKa70aALphHY703kWvcbliu2Ngci7QSSZDWVC8c4lct3sExd
	vo53Li4gIG9cFBR6HGsf0hdS8z1m9zNsWh7shtG9VKTshIZ23PKW+quxma3UZV1E=
X-Received: by 2002:a05:622a:5807:b0:55d:2e60:886c with SMTP id d75a77b69052e-55d5a57f065mr29804371cf.16.1794995069148;
        Wed, 18 Nov 2026 01:44:29 -0800 (PST)
X-Received: by 2002:a05:622a:5807:b0:55d:2e60:886c with SMTP id d75a77b69052e-55d5a57f065mr29804001cf.16.1794995068605;
        Wed, 18 Nov 2026 01:44:28 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm240232215e9.3.2026.11.18.01.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:44:27 -0800 (PST)
Date: Wed, 18 Nov 2026 10:44:26 +0100
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
Subject: Re: [PATCH net-next v4 10/10] net: stmmac: qcom-ethqos: add QCS615
 EMAC support
Message-ID: <av1zehivK9azUIom@lore-qca>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-10-c41902e5f2fa@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="YRK1tvd/MI9w8hzH"
Content-Disposition: inline
In-Reply-To: <20261117-shikra_ethernet-v4-10-c41902e5f2fa@oss.qualcomm.com>
X-Proofpoint-GUID: FvbmBl1HK0jf4uivTzY70SPgoidWedbl
X-Proofpoint-ORIG-GUID: FvbmBl1HK0jf4uivTzY70SPgoidWedbl
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd737e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=8Sm9gzTdqpzl8EHs-poA:9 a=CjuIK1q_8ugA:10 a=7X8ZIgrw44ctfyHyHP0A:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX2PWqMqChdPzp
 j8433B2BlQ3CrGADy7AOPzDWbuDEq/pFiFprcgiEAZK9B2u32lj02JSleyQu/Ps4DSiET7/b7ak
 jCJUwqw8NrFoOhwmc6GeRVviKdtD1Io=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfXxMmBJjzpzTZH
 VS1+Sf0wEG4ltHgqXfcjauwig36QfV3xdVE8NHVTccMlFz0UmYNo0bIxRadVw53QOFTBzIt0o39
 SpseCnXmaF5/H+hufzejUOQ6LF99kccfMlOVT++CuE2F3V8D04+i6WHQqfSwTBMhDsCKJYrdpNW
 RNiRpe9YmpRjkcknUYiTN2DjEz3kp4NeVMVOyMPxf/uMeSonH71kk1gnbaTdzkOxWdnPAkLh2bv
 MYOQC/LXs+inQ6X/Wtw32ltVjbzQ+vuykkd5wjsRsJrMCIBRQgYQD+5sefvnXcUPuJCymeLv0Qj
 INwyp1s94N4TiITFBkVRulkehfeq/vjPok/zYZxnhiOuCwJsUhYqbOAgEMD6NtyU0PCvu0r2x36
 VIhGR0cPBay3SzsxYUxIbFrg4R/J/N6WIBXT98V9iS0yTtfDOr/v9QKH27HDNxBX73GE7B1zTbq
 A6rhHKeIj8LvHFeEP+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

--YRK1tvd/MI9w8hzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> QCS615 (Talos) uses an ETHQOS controller which is extremely similar to
> the QCS404 version, but unlike QCS404 its RGMII clock source supports
> the 25 MHz and 2.5 MHz rates used at 100M and 10M with PHY-managed
> delays.
>=20
> Add a dedicated qcom,qcs615-ethqos match and descriptor and enable
> phy_managed_delays so rgmii-id uses the DLL-bypass configuration.
>=20
> The bypass sequence has been tested on three QCS615 board designs,
> two with a Micrel KSZ9031 PHY and one with a TI DP83867 PHY. The
> existing compatible binding and qcom,qcs404-ethqos fallback remain
> unchanged.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
> v4: this is a new commit which ensures that the phy managed delays only
> affect actually tested hardware (Shikra and QCS615).
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index a7fdba73da2b..790159ae1be7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -250,6 +250,13 @@ static const struct ethqos_emac_driver_data emac_v2_=
3_0_data =3D {
>  	.setup =3D ethqos_hlos_setup,
>  };
> =20
> +static const struct ethqos_emac_driver_data qcs615_data =3D {
> +	.rgmii_config_loopback_en =3D true,
> +	.phy_managed_delays =3D true,
> +	.has_emac_ge_3 =3D false,
> +	.setup =3D ethqos_hlos_setup,
> +};
> +
>  static const struct ethqos_emac_por emac_v2_1_0_por[] =3D {
>  	{ .offset =3D RGMII_IO_MACRO_CONFIG,	.value =3D 0x40C01343 },
>  	{ .offset =3D SDCC_HC_REG_DLL_CONFIG,	.value =3D 0x2004642C },
> @@ -1116,6 +1123,7 @@ static int qcom_ethqos_probe(struct platform_device=
 *pdev)
> =20
>  static const struct of_device_id qcom_ethqos_match[] =3D {
>  	{ .compatible =3D "qcom,qcs404-ethqos", .data =3D &emac_v2_3_0_data},
> +	{ .compatible =3D "qcom,qcs615-ethqos", .data =3D &qcs615_data},
>  	{ .compatible =3D "qcom,sa8255p-ethqos", .data =3D &emac_v4_0_0_scmi_da=
ta},
>  	{ .compatible =3D "qcom,sa8775p-ethqos", .data =3D &emac_v4_0_0_data},
>  	{ .compatible =3D "qcom,sc8280xp-ethqos", .data =3D &emac_v3_0_0_data},
>=20
> --=20
> 2.34.1
>=20

--YRK1tvd/MI9w8hzH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1zegAKCRA6cBh0uS2t
rKbqAP0Y9Jlze5h2MB2o6B8iauLXSq6ptrMeehkAecNddaYyHgD+MmMk4Rpz4f13
U9ddshl+n6SmpBBaR7puRzI+Ei3OuA0=
=s6vu
-----END PGP SIGNATURE-----

--YRK1tvd/MI9w8hzH--
