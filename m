Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993210;
	b=pP1NQ5sWTE9YdVmcmzV80tAqDSeTHBmUN4meDnKv9ET2cRRgShvI/zkNYcM4Yw1kvVCR
	 ssxZGzTmcG6ySERBAgWR/gKy3Qiwz9ODZn62JFzJynDXZCO2XWQz3QbgrM/ypRF98fWFE
	 r7XtjwCENl+kwrzQ389aqifWkUrHXeA61YsEJa7vMNDy9vJNku1hUQ0aPFB/jSzLn5iU3
	 6RL/7mO/e09DA4H+2IHh1XUpGgP5O5czC+/k6WpGdUPrztw+6koP7KFw5fV0Hai3ZQyGU
	 SD2B3HSuC22wb7ETwr7EkgQsjkN7NoliNNYkD83Nby6rHm1d+JRLu3+7hsdJvS/Km2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993210;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mgNqGNkSyaCHbgQrLwcGSMfAaOL0GqaL9ZS9mVJYGS0=;
	b=dwSe41jzu57iDKn+qaGTulDze2uqWqA2fsZ1HjPO29VTVPCEYPgbANscYysCaY8aS2xG
	 XH+CfELE2rOmnuw4EAJs6YWJBCAaxTxne+ikSj5NrURnDsGTThx0epB03N3sW8BF5DBA5
	 ct+gWjhpBaqnFJEQh7Sy+u3WkLLHDa214cJE0X8zL7RZxV8GM71fI80XdmICQvCcvJZgU
	 DqHYSfqCUTmlFTuawNtwaXtvv0Pv03ZI0AX3Aap1nCKRwucO1TOzD4qnbGfRFh/oUG60F
	 4J3qDNTTdrFQiN6skNR0YKn5maO6yhk1AqHoIRrhsK4AXgX/DFN6JfLU1+KqHGfmtxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pkek45nb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PXSt+6+a;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10211606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:13:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10211606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pkek45nb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PXSt+6+a
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8N2RP2106297
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mgNqGNkSyaCHbgQrLwcGSMfA
	aOL0GqaL9ZS9mVJYGS0=; b=pkek45nbZFw72X9I8v8wMsLNJXBCsEMpfHvRIst7
	kM04LP2uU7f5U1c95BoC5DPA4ehI2dhuQ07JZHLebGvWwdE+3QTyPKALXHO+9pBP
	81621wRkxS5w17kMXJBHXH3DI9gjIFUY1HjshMe++yBiBzeM8vCxCAUWKfeqHx+j
	5o5KEEduiMP0hfg2DV+lpzrR0SSadcP6c1RJ/vHyjU0ldHfQgLjB+83SYVMqvX7F
	wDXCMQU9LGh3vLK0BTQag0/WwwhJ/YIz8LEIUKNQmeG9lqS/kVVdWN54nufevHnc
	8jbTFXaxZW/oyhFZEV8niu5HRXs/Q5hUw5ivkMM3leHNDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8t6vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:13:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so186968585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794993207; x=1795598007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mgNqGNkSyaCHbgQrLwcGSMfAaOL0GqaL9ZS9mVJYGS0=;
        b=PXSt+6+aE9/P372Gpfe00GB07ZTkanSHMmS3UrWpVLhIHmy7KJzpwxF6fdUZxOsRQJ
         ye4whvdtsVhvunvQt2Mu6It/KGAQgHFSGOslYIBA4xnG9jgWrTtpBPnR8l5VwXM4jDrW
         wrbjy1O40cDoLYBd54OdePSdmyYGyaPWcYOUEGTlsPbvTBu1ig++2yDp+HyF/oG5Z4IA
         ky8UG4uw0jlr/mj74Mt3Twfsoj3UZgUnXZKFEdjkyyAHwu/m0De+fuNZ3KQTeBbtvv+G
         bqkDzdD0ZsJ046N89187hFCs9GshFPTUjJhm1bse/aqx9CAaZjqzdlZWZJACon3A1bCc
         u6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794993207; x=1795598007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgNqGNkSyaCHbgQrLwcGSMfAaOL0GqaL9ZS9mVJYGS0=;
        b=WdVTdMtnLVBIJFjVvYspix8RZK4knEj4i8ArX3ZegggepZJKgW7alRcoNM+9GOkzde
         RZwF/Bm0uVyxtxSFaOwMGh7Cvw3GsSYkHGAS4sKVOWAtGbHz9y21j+Lki29W28urztEd
         bQiLPMacSWRqaP0AKYloYwbjR5JwbrDTxMassMTc5OFJUVDsWcGRBEyfBSuoHGzIc43i
         2b4Yf1FTqPjNt8KVxLocVb81+sNeStzTKv2rNQKJg8ikosIm/B+WRMxUZ2cCwrpIFpPJ
         5AR+YQuvpH7oLu/essWWur8AskpaRgETKcWNwGQ10mXB1eVaABUgBhGTL7bVQTS4QZ2R
         Mg2Q==
X-Forwarded-Encrypted: i=1; AL+hErFJ7stAlf5V4n73JSHQb6meGgUuprzXHkrufouvSxizR5WJeBPDni2pL/G6nmNEJlOJiLpfspXjok+kRPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+44EpbzQCx2ubdFSb6av3Mnw5JJPo3R0NaLU/GnGdSrS2NSEaL
	2j1vDPtvczTcbK2x5U7hylGtLNqKVJr/3t8RclpCgDAG+50s6E3Os5I8H6kNdalRpYBkyPIWWlt
	olzozKfBPHOxxMPoAXVxEyfhSkoNtacHQpHO3wtWxAgVTVQvo/QfC1M3/eXB9BS3EoTY=
X-Gm-Gg: AYBFou2N/q2kWtvzoO+oOiPrGknco1nBeSW4vzl/uZGPjSXzCEjt0SpUvsaQ+gv+MnI
	gL2xTu3LIOQx7AD53nBtlm5K9aVE5qiL5r+qEBvIj1/5ydDdn7qYFEcCAwKgy2wQScK8jnkobtf
	Xqm2Lac6EwDVUxY4Qc/uRmzk4hZv3iaDnaHSWKsDlr/Wc8aro88lNKNQu5mo4rvzmpoxmJG+kSa
	4081OdS+gqTmfnoOlG45ubOgQv94Oa0J+tmaqN6bNrVg5XUGeodGap4oIcT0cnGZBA13n/fztvE
	yp5iEVUE7jn97Y4zyr+LdB9RLLBRFqoUdBi1IB0lq/EDFw1mhxfEFDGzYs7xbK5p/AEC+VIUwp6
	k4hwpI7f0+QQTF6jq+ECPZWdxh1HtEX1I598d716ebYGf0cdEKTAbMrw6QjNnZ/0=
X-Received: by 2002:a05:620a:4413:b0:947:81e0:bd0b with SMTP id af79cd13be357-9499957e922mr390439785a.20.1794993207078;
        Wed, 18 Nov 2026 01:13:27 -0800 (PST)
X-Received: by 2002:a05:620a:4413:b0:947:81e0:bd0b with SMTP id af79cd13be357-9499957e922mr390436285a.20.1794993206497;
        Wed, 18 Nov 2026 01:13:26 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65693389dsm3301484f8f.48.2026.11.18.01.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:13:22 -0800 (PST)
Date: Wed, 18 Nov 2026 10:13:21 +0100
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
Subject: Re: [PATCH net-next v4 06/10] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
Message-ID: <av1sMajsn4Al-xgw@lore-qca>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
 <20261117-shikra_ethernet-v4-6-c41902e5f2fa@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="rKfa5t58Xe8YK57u"
Content-Disposition: inline
In-Reply-To: <20261117-shikra_ethernet-v4-6-c41902e5f2fa@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: w9X2ao_hiBgU30FlvbfwQbTR5hkf23g3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfXypC/ZpM4o52O
 E7BsXEx8GM2qUVL3eublj9/kQYChKIkzjgcKqOFTGCEDvSSk+Fi/InA0SCqVKqFUrJ3pbiKYdBE
 9MK6E5O2ICFJXrc6U+Obm3ZcwkcCw2Q=
X-Proofpoint-GUID: w9X2ao_hiBgU30FlvbfwQbTR5hkf23g3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNiBTYWx0ZWRfX41JXDz6P5mRd
 9OBYESasV/2BAK395w8Pn7Chh7fHaFlmwJcoqigef2kSomysCI2NFWc/yp2hbCQSiTKMdD/1I57
 /rnhUri3iOmHvn3AEI4LNpJ5PScuRLjGPZ7wNfA/8QW6pMv4WOtAQ8TWJbCmT+JgVQ7UUn88tOR
 k9YBJu/PfWdVG9IsPakNwHToOS5KRlkMUS8wTVLo2XN7vQbEZLC1SNIwo37NkmMVZsXJ0UIg6BO
 LXuCQn0fsVY8JsKV05zmK+C1b1II/YOH6yCGp61TzEPH9wbvEa3NxpHi+1tem4VnC/TB3Eo4uFX
 2AEWzHOXFGpJ1aMskxNZh7h3T8zt7fmaBOwrAcYlJ9bFyi3nl46QwB4EuqRu4PeHMAsu07qUzXj
 FhpOJCdxp9VDjthrUkBCOkgaV9INCODbepTdObY6A/NFG6/dhanrs1dvrTaCOo3yvxc7wlYbb9H
 PBQN1QJlqXE8w+ddzTw==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd6c37 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=RmR1C2qGtOR5igIFRNkA:9 a=CjuIK1q_8ugA:10
 a=qFG7hDbQzpJO8DkesHAA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180036

--rKfa5t58Xe8YK57u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On probe the RGMII link clock is initialised at SPEED_1000, which
> translates to a 250 MHz source clock even when no PHY link is present,
> drawing unnecessary power.
>=20
> Initialise at SPEED_10 instead; set_clk_tx_rate updates the rate once
> a link is established.
>=20
> The DLL locking is not affected by the current clock rate. This has
> been confirmed with actual hardware testing as well as the fact that
> the existing code performs the DLL lock first before changing the clock
> rate when the link speed changes.
>=20
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
> v4: add some details in the commit message to address concerns raised
> by Sashiko.
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 99ea7e0cfb00..192788e00dfa 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -828,7 +828,7 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethq=
os,
>  	if (ret)
>  		return ret;
> =20
> -	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_100=
0);
> +	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_10);
>  	qcom_ethqos_set_sgmii_loopback(ethqos, true);
>  	ethqos_set_func_clk_en(ethqos);
> =20
>=20
> --=20
> 2.34.1
>=20

--rKfa5t58Xe8YK57u
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCav1sMQAKCRA6cBh0uS2t
rEoxAQCXFnBdtRXO+i6NHOYmwXKbg0uyCKdVXH/7nhAU25CIswEA79MQ20mTgIZQ
/VNRnKPr2gb/4bOoyHks5lzMSJAhZQs=
=aBpG
-----END PGP SIGNATURE-----

--rKfa5t58Xe8YK57u--
