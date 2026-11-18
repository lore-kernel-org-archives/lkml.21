Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994842;
	b=SCERXGZkh/IVmywLtb+mNQ5hHB23JsOg5vtQ5YoTpTVk9nQxnZ6JRXB/xtEK4A5Bi3t9
	 5XR9MDBztNyhV2evCVGMnygSakqqMsxLMrHs5U3bBviZtvnISFqfsqJFPddksezdzLX3O
	 a8995fwPnZHL3wkBtqylnV4jxn86/42hMef+eP66i/97XHHaEEtlFy8k6apNbaczffWM8
	 J1Lc0JpR4Ku+8kxf6pzptJkVtbBDK5tfH3cnHqIXe74xQvQU3qyYfL2ZK57/CMwv9BA5d
	 MjujGVxtaM8fDjTOU08mZtCx72w7YZWcA1gQx00rphQ+8nxZL8diRwDMQTUdCUynM2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jAyDX6sBJRescoz2h8Wju/7fXm9bYBb2dd0D5Xs+d9o=;
	b=kaZuNWyB8ty8L/vZ1DdtWdFdaoyKgYbCDZOI8UylW2NJiVgqJzbDlSkvb5sNXcXwBpbw
	 hlANpkTlFD5H/DibQgerAhio8LVwaaMwgT7zUrsR5E9nXG8pxB9oIyAknCrhEESnKB8X2
	 DsUKTG5ha/eAFMQO69i5zX3oo/pOnfnfyC24WL5ZTZOHOPaI+2ef7BxKTcajV65K8WKN7
	 7WYj5zf9hFNSW0T6aXdzNbopIpllx4Ut09F4jCdbYhUkb6T5vMG3qUscmA6/cUo9TQ26S
	 TfGAHTuuGBPCmxbvgPO8TuQYBVhFK9nHsF1u5riG6xAn206Hcsds8rkI3tXAYaLbCxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZcYNg8dh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FE+jOQHH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA74606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DA74606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZcYNg8dh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FE+jOQHH
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8YXfp2383049
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jAyDX6sBJRescoz2h8Wju/7f
	Xm9bYBb2dd0D5Xs+d9o=; b=ZcYNg8dhnRByell9a43mmmb6YmQfuKlErWPlGFA8
	T93elM9UY8hEJnc0ty30Qp+2NJUHvhJ08cdQ344TanLKsvrVr/TBiIc7wCMS/m7Q
	7GxvhtCAXYHo/7J6NitY8yJCkAl4CF6orJkn8MtayZ5UGSrhXwWYe9nNgUnDDeZM
	tsaDu2kNyS1tjLnvb/99CD7it1euLgpqMtfMNC8HWunt1JRLUQJP6H5c9yFFvB4r
	C7h2rmpybDaWMHQdS7IAWZutilrwYaAsgLpRi97+jMizmx6u8CGbMz1CJwv2Hhbu
	3WsxU5uCSxaMfGL6UaB9pm2wz/CqXf+ND9S5S8FUVoxwvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvatcsd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:40:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961ed97d6so134839385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994840; x=1795599640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jAyDX6sBJRescoz2h8Wju/7fXm9bYBb2dd0D5Xs+d9o=;
        b=FE+jOQHH1s3yBXIBaWm+wE2uYT5hpZVt/1bAt3EVHlZHOPMYYhdu4G4O6pByxMIwmx
         82cbOxfdmb8U63p0XUMZ6tevnTPx9QYhpVlT8PcIP/B1ARKdX4yERuKKvtO4qxj/MNPq
         rDxq4qxBsGBnjnUsFDzE9ViXzjCZqDrZEyW/nRgHZzRcgKwoWGpjjRP3C+lufEs1uBFt
         c6BjE/lNfd46G+OyotyWmCbERKTULLZp7RdyIxfYY5UDPHnqO/12jU8LUPpKNTyUlVkz
         xNSckMoUgfMzyiLVvao97XJhS+UWl0Lm1BEQiUeRe8E/y3iak0jFbjBDO2zCPLDweJoE
         l5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994840; x=1795599640;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jAyDX6sBJRescoz2h8Wju/7fXm9bYBb2dd0D5Xs+d9o=;
        b=Ay+gVQJSBud4ILha64xcirk10RC18U5yWc3t91lZVmVWcAEIOnZdPF/TrVzZQkRXT0
         FQD3dPeNISgKyRvVxnRM6VDKwb00ZIEetqBSnfbNwf5ZxXKKkj9O2g/pwSHPh1PFrBgp
         qTf4BuJuYe+Vy6zI5TM7zJAKeLDY8Lu+VLxz+c3URe1exrV/2Taryh/KOa0BIo/vNcSa
         rC/p/cKT3p+I71QmG3bw34Bq4oKZOb3SHo+/VF9ZXnM46j3FLx4HVBn1cEnQI8XSdfEw
         stlgDWEZcJV0l0cOn07LVE3XpBDE8WolF9lvaebxNekkENrTu9jgGdS5ygw2phMVB/q0
         e+GQ==
X-Forwarded-Encrypted: i=1; AL+hErFByM/feDuPj3htVv42vgLEwQH5ukoRsxvLBL5swKUDGGfMg5n6yO3uhbA93JJcYHLKbGMoyyeW3uLVytQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+AQEJDd0UbRyXjkXkuaf9ijwXEjFivA9L37thsIyOwYO48/4V
	YhLN98GTlAZPfUFZb9TBL43XOcIK3hL2KoVScHowjiZr1gKHmp9DTBEPwd7DLdpBRE1DFKzpFSO
	cguZJrwkBylCO+TOy9Q3y0KmAlZo3HWKV9Azn76I+NYdRX72/IZXveITq7VlBaum6p8I=
X-Gm-Gg: AYBFou0CY9wE7RuRszLh8gpFLyeYHPU6bBe472pYb3i0MGGDwPlrKW6pwGAtnnV0zy/
	d+SogssADiXfpsnCm7YBeqFikkDEWbThkXdccQ3sVDRjCXY6tNpy2o4Krh5kOe6FwlXVfEIEJQp
	1eqXNMgtsLU7LdyARGAubWALoJ/8+yaB80mYYjwXQK+F5MuWcv73eDvOc4aeUvvQyzN07BePEJW
	DF1B50TbFFD6CvRMGePIXoLGL5rVcLvOGW46M+hllbi8W20Me4fh3A2jEX0ndcVLTx9T9eo6Wr+
	/1TkAE5ESI47O56Bc+/GOrYx/O3ifK4HzR9ZXNLBwF2iNuvg9cSfquz76urlVfQGH4K8cChXZEv
	r3bcNl5Bc4+R4M80lAvaxvueloCFMWvZtq/OGPjQeVkAaVzSyerqj8zId+UPKfRk=
X-Received: by 2002:a05:620a:2606:b0:93e:c12d:4ecc with SMTP id af79cd13be357-9498b9a52bdmr798025485a.44.1794994839426;
        Wed, 18 Nov 2026 01:40:39 -0800 (PST)
X-Received: by 2002:a05:620a:2606:b0:93e:c12d:4ecc with SMTP id af79cd13be357-9498b9a52bdmr798020185a.44.1794994838774;
        Wed, 18 Nov 2026 01:40:38 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm190598255e9.10.2026.11.18.01.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:40:37 -0800 (PST)
Date: Wed, 18 Nov 2026 10:40:35 +0100
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
Subject: Re: [PATCH net-next v4 08/10] net: stmmac: qcom-ethqos: add
 per-platform NOC clock voting
Message-ID: <av1yk7P2_nNBvRMs@lore-qca>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-8-c41902e5f2fa@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="sQAqpoQJ5wAuuY31"
Content-Disposition: inline
In-Reply-To: <20261117-shikra_ethernet-v4-8-c41902e5f2fa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd7298 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=okzICtKxooRRR1VLav4A:9 a=CjuIK1q_8ugA:10 a=Dhi2dq_hunc8pPVQk9UA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: wa94npcWvlbYvR4JpQqNpD4xNkNfDr4q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX3D3dWq6dPeEy
 j+5mC2YOxi/Orw9VfeizNuLEookWqUZnAKmItw9GqHzDJW1W+jrR4n09OcvIpi7VzgSObR25iCW
 1BQl9qD0uSnm9okRZoDitLR2cjiUIcSduD1drWZb5HMVbmNWF/5A/iFK/5MYRmn7wIrxZtfJZ2z
 PNMocwGi/BJ0QROtf/Ygry8RaHJA29mS3PCXQ1PeXz6chPRUyIYt5FGiv9XROXZqJFucVATWdf8
 e3BFlhZCBM+qL26ijbz3YUn4h74vplpa1mDCdXG5n2qSMN4pExE4Sh5tWFyuFR3ajaB4PzRpzrX
 Sdxo5gVyfr+Ft3+7Z7UiIWYSx2caz2fhMGCiT0ozcO75tEy4qbdM1qBRP1EyXS/ajtKBkHZsCO/
 bwm2OFhiXeIk4Wmcm75A02Yh9iFoxiF54pFQcMIbQVZ77g863cKY5lHvJu6vHK/tixTy7nOgCsF
 lQS8KkY7td8utgpY6Ig==
X-Proofpoint-ORIG-GUID: wa94npcWvlbYvR4JpQqNpD4xNkNfDr4q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfXxXSIk5WBAEzo
 LI/2C1t3YiMzEUB+OeaBovNXRRoqdYOLdnf80QLbX5/GFnk3tegOTolo6LtTKN34oCUphnM1dRJ
 z/AGZhVxQv/5F2oMeBNgS9wZah+jmXM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

--sQAqpoQJ5wAuuY31
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Some SoCs gate the EMAC DMA path behind dedicated AXI clocks. Add
> per-platform clock-name lists and configure them as a single
> multi-clock OPP. The OPP core programs every clock rate and propagates
> the required power state.
>=20
> Select PM_OPP because DWMAC_QCOM_ETHQOS calls PM OPP APIs for
> compatibles that describe AXI OPP clocks.
>=20
> No functional change for existing compatibles. This will help us when
> we add support for Shikra.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Hi Mohd,

just a nit inline. Fixing it:
Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Regards,
Lorenzo

> ---
>  drivers/net/ethernet/stmicro/stmmac/Kconfig        |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 103 +++++++++++++++=
++++++
>  2 files changed, 104 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/et=
hernet/stmicro/stmmac/Kconfig
> index c6559e749c0c..15639666e837 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> @@ -146,6 +146,7 @@ config DWMAC_QCOM_ETHQOS
>  	tristate "Qualcomm ETHQOS support"
>  	default ARCH_QCOM
>  	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> +	select PM_OPP
>  	help
>  	  Support for the Qualcomm ETHQOS core.
> =20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index bc443793539b..15385750b3e6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -6,6 +6,7 @@
>  #include <linux/of_net.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
>  #include <linux/phy.h>
>  #include <linux/phy/phy.h>
> =20
> @@ -102,6 +103,8 @@ struct ethqos_emac_driver_data {
>  	const char *link_clk_name;
>  	const struct dwmac4_addrs *dwmac4_addrs;
>  	bool needs_sgmii_loopback;
> +	const char * const *noc_clk_names;
> +	unsigned int num_noc_clks;
>  	/* Fixed PTP reference clock rate, used on SCMI platforms where
>  	 * firmware does not implement the clock protocol allowing linux to
>  	 * query it.
> @@ -119,6 +122,8 @@ struct qcom_ethqos {
>  	phy_interface_t phy_mode;
>  	struct dev_pm_domain_list *pds;
>  	const struct ethqos_emac_driver_data *data;
> +	struct clk_bulk_data *noc_clks;
> +	unsigned int num_noc_clks;
>  };
> =20
>  static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
> @@ -725,18 +730,61 @@ static int ethqos_mac_finish_serdes(struct net_devi=
ce *ndev, void *priv,
>  	return ret;
>  }
> =20
> +static int qcom_ethqos_set_opp(struct qcom_ethqos *ethqos)

is it clearer to have an utility routine to set a specific freq and then ca=
ll it
with freq =3D ULONG_MAX? Something like:

static in t qcom_ethqos_set_opp(struct qcom_ethqos *ethqos, unsigned long *=
freq)
{
	....
}

> +{
> +	struct device *dev =3D &ethqos->pdev->dev;
> +	unsigned long freq =3D ULONG_MAX;
> +	struct dev_pm_opp *opp;
> +	int ret;
> +
> +	opp =3D dev_pm_opp_find_freq_floor_indexed(dev, &freq, 0);
> +	if (IS_ERR(opp)) {
> +		ret =3D PTR_ERR(opp);
> +		dev_err(dev, "Failed to find AXI NOC OPP: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D dev_pm_opp_set_opp(dev, opp);
> +	dev_pm_opp_put(opp);
> +
> +	return ret;
> +}
> +
>  static int ethqos_clks_config(void *priv, bool enabled)
>  {
>  	struct qcom_ethqos *ethqos =3D priv;
>  	int ret =3D 0;
> =20
>  	if (enabled) {
> +		if (ethqos->num_noc_clks) {
> +			ret =3D qcom_ethqos_set_opp(ethqos);
> +			if (ret) {
> +				dev_err(&ethqos->pdev->dev,
> +					"NOC OPP set failed: %d\n", ret);
> +				return ret;
> +			}
> +		}
> +
>  		ret =3D clk_prepare_enable(ethqos->link_clk);
>  		if (ret) {
>  			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
> +			if (ethqos->num_noc_clks)
> +				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
>  			return ret;
>  		}
> =20
> +		if (ethqos->num_noc_clks) {
> +			ret =3D clk_bulk_prepare_enable(ethqos->num_noc_clks,
> +						      ethqos->noc_clks);
> +			if (ret) {
> +				dev_err(&ethqos->pdev->dev,
> +					"NOC clocks enable failed: %d\n", ret);
> +				clk_disable_unprepare(ethqos->link_clk);
> +				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
> +				return ret;
> +			}
> +		}
> +
>  		/* Enable functional clock to prevent DMA reset to timeout due
>  		 * to lacking PHY clock after the hardware block has been power
>  		 * cycled. The actual configuration will be adjusted once
> @@ -745,7 +793,12 @@ static int ethqos_clks_config(void *priv, bool enabl=
ed)
>  		qcom_ethqos_set_sgmii_loopback(ethqos, true);
>  		ethqos_set_func_clk_en(ethqos);
>  	} else {
> +		if (ethqos->num_noc_clks)
> +			clk_bulk_disable_unprepare(ethqos->num_noc_clks,
> +						   ethqos->noc_clks);
>  		clk_disable_unprepare(ethqos->link_clk);
> +		if (ethqos->num_noc_clks)
> +			dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
>  	}
> =20
>  	return ret;
> @@ -773,6 +826,52 @@ static void ethqos_ptp_clk_freq_config(struct stmmac=
_priv *priv)
>  	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
>  }
> =20
> +static void qcom_ethqos_noc_opp_cleanup(void *dev)
> +{
> +	dev_pm_opp_set_rate(dev, 0);
> +}
> +
> +/* Some SoCs gate NOC access behind dedicated clocks. Acquire them here
> + * and set up an OPP table to vote for the required rate and power.
> + */
> +static int qcom_ethqos_init_noc_clks(struct qcom_ethqos *ethqos,
> +				     const struct ethqos_emac_driver_data *data)
> +{
> +	struct dev_pm_opp_config config =3D {
> +		.clk_names =3D data->noc_clk_names,
> +		.config_clks =3D dev_pm_opp_config_clks_simple,
> +	};
> +	struct device *dev =3D &ethqos->pdev->dev;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!data->num_noc_clks)
> +		return 0;
> +
> +	ethqos->noc_clks =3D devm_kcalloc(dev, data->num_noc_clks,
> +					sizeof(*ethqos->noc_clks), GFP_KERNEL);
> +	if (!ethqos->noc_clks)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < data->num_noc_clks; i++)
> +		ethqos->noc_clks[i].id =3D data->noc_clk_names[i];
> +	ethqos->num_noc_clks =3D data->num_noc_clks;
> +
> +	ret =3D devm_clk_bulk_get(dev, ethqos->num_noc_clks, ethqos->noc_clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get NOC clocks\n");
> +
> +	ret =3D devm_pm_opp_set_config(dev, &config);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to configure OPP clocks\n");
> +
> +	ret =3D devm_pm_opp_of_add_table(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to add OPP table\n");
> +
> +	return devm_add_action_or_reset(dev, qcom_ethqos_noc_opp_cleanup, dev);
> +}
> +
>  static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
>  			     struct plat_stmmacenet_data *plat_dat)
>  {
> @@ -780,6 +879,10 @@ static int ethqos_hlos_setup(struct qcom_ethqos *eth=
qos,
>  	struct device *dev =3D &pdev->dev;
>  	int ret;
> =20
> +	ret =3D qcom_ethqos_init_noc_clks(ethqos, ethqos->data);
> +	if (ret)
> +		return ret;
> +
>  	ethqos->rgmii_base =3D devm_platform_ioremap_resource_byname(pdev, "rgm=
ii");
>  	if (IS_ERR(ethqos->rgmii_base))
>  		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
>=20
> --=20
> 2.34.1
>=20

--sQAqpoQJ5wAuuY31
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1ykwAKCRA6cBh0uS2t
rNQBAP4lJiuirwRLFVe8XvEt5fSxZrB9fn9Cj/z3AcKiRIBcEAEA+hNM2boDyzWS
OuhgaeR4bNxOJR5Y8qmsH2GTsrvmiAU=
=y4oA
-----END PGP SIGNATURE-----

--sQAqpoQJ5wAuuY31--
