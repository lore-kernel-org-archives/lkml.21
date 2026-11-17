Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794947682;
	b=pEm2gPwn11Ol3Q++krAKdF7LrzPbYvxYp5xQGccvaSpmaqcgxf9A4FMN+bXtb2z1XsEb
	 fPBBVx9Ne7MfgKEN+YKAn9qrRkHp4Hx1OtgxTvlC42oXBHSJEYkYFMfXyvRaLOhmbhphc
	 mjghAZGtRqL6Rn06ceEJ2LGxhJFSMGmHDyMi17zdIdwWRxEPwj2tpWo2qBFVB3QByB6wK
	 WizWA31ZPiKh8FoC830Db7GzT6W+no9vX1YZiTUsP6M0+Qr7DAq6maIBe3uOroUL6+D3y
	 aMpqMcBscPwJeLoWHAsLZt9mJut8tAhmd/eYxgWYGiiBDr/AszmZhQ4xyqce7taPVdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mZIjSl/6dyPO7xcK3i9ocK4466rMnfHhcIzCnMUr9CM=;
	b=IFiKyWcgYoQa8AWLUntFgN7fR729HwQu1N7GwwBwIYVCnRjlZnUSxRtHrC7QAqm1En6q
	 a0tlhzrjwnEVn8fCwqOCMTz/sWXG+hYv4M/lzu08gvgAL4VMk4n8yQZY5aBFmY11rdSF6
	 tJeUfhN0RDFIPrmsyIg8hX8cp5pO6Lh58F3MR5dKlEdFSWty01k1JWcetKsTZOSfszbFe
	 it60woZsTYyORSdA2Y8Lcswvbhm1DrKHEchQkkmMB2+QGweuSnnsQcxFuhqj4rJDwGk21
	 7jmss/9KGaE3H6UF/fjPvqlCBj16b7djDyCSDVNv8l85rZK8KbjsQLKy7RfMB2BfVPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oL7MWMs0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LYLd0NCG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1151606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1151606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oL7MWMs0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LYLd0NCG
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHJ5qNA1638533
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mZIjSl/6dyPO7xcK3i9ocK44
	66rMnfHhcIzCnMUr9CM=; b=oL7MWMs0eeXbE5b7oLTpoNhUZCCSK8bHHhruSaU7
	BPBdBF8mWzMLEWzguZLAINIvYbWBRFITWRI5fh+QCUk0o4bqyCF5IgKDP0zYI9ms
	VJLQ699LUUFVzhsDJs7aa3dNktELq3rpnqFm7DyFHPJo11cpVUffLJUorZBHdtmN
	YrsWHuYzpit6omz3zDpmwgz+KdR7GwS7t34Vq2FJy4XV/BXkYENC0qg1LC7lIJqZ
	rgxjNQEHunt10tg6IPmq/fTMVwbAU79+kxoA8WHmwxa7PO6dCHZ6+g0fBWUgb2a7
	OLvRSt6xxjcjtxCgmPLG4VhLmSCwalnH3bz27Pupd3ASFA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0s9t1dpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:34:40 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99e14fa4868so58698241.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794947680; x=1795552480; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mZIjSl/6dyPO7xcK3i9ocK4466rMnfHhcIzCnMUr9CM=;
        b=LYLd0NCGudVyH47rHbLgly1nCYldPPPBc8XZXG0Umvsjlqmi94CECPLi7442ANQqWd
         4LH5c3OG4uf5CImEGfv87hD9GQ7CemHMlfmICyfOu5hY6LlET98n1KcG91QalIg7j5B/
         Hku5NUvwhJDzQxlcrnKWJKr1DT8hbctUPJHPOQT9qEwjprtsA+6QPUbbExcvMMZKLkbr
         3AS/RZTLXg6nRMADsrBsM2p89GNgv6yb2DowVS3KJ7CUfEfr0tiRY5t2GUcy31u6YqWy
         6mxxreyKN1/mQE3xzd2AcTzBEwnm5D39gejkJ37NbLwUabaBuinrKvhB6zMxNV9GGiX6
         zqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947680; x=1795552480;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mZIjSl/6dyPO7xcK3i9ocK4466rMnfHhcIzCnMUr9CM=;
        b=G3lOLuH50gEBEdQ6e5EVU3Dz0XfKnvDMhTTyHk7u2TN49HXxCgk7AF1B/6IhylEniz
         9vLEeXzUyzd9D8ePGnP4L7+iVyWDUhBaU3N2ZnWq2f5vd1sSR3fYQcGs9c9f0GBMOej+
         i2xTZ1PyRKoPS9s9sOmUOGW1K7FJrIU4fryO/njA+j+AskrJNEakTfab4ygn384ohir4
         eyQBAGL4pyFq7qoiiil3Qb9Rvg8wbxcdFgRUyKP9+8dGPH1vs41lwslTrwhhzHFzjr46
         o7cZUXFAzJZV1NlaAw07EZf17ABAFihscMH2xSDNoznTGIwqJ3lRWnfTr+lHQpdt4dv7
         kFpA==
X-Forwarded-Encrypted: i=1; AL+hErEhZaxXX+N6Bn93B8Zv60zBmgzSqe6zEPhYwcg3z2AiGieogbdVGDxZjZniqA00HTwwyC5He6h19gQRtrQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j9Z9cG99e5vCcoDyO6kpTP/8Gbh0edxSLA9KXPGvn1uy7btxx
	cZhsY4MjYjbcTCxFtct7jsBmxuqb2bPmwZUevsOeTMDiFICHBjacFU7DIel6z9aB4aiQ+8FEEp3
	Xiv6BvGuizFp60Jn5jpnjzi3D81otVPBG9JR7nEicpKu+FfPlu9VvBsvopgOe08aXf7o=
X-Gm-Gg: AYBFou11Bsg8n7rnYKQO41jCkqkb+Rk7KnzKmRLlbyHxWzEuUfXumZAh5empjSRV/cw
	WtuMwVGd5gGiQSPwVeF8nuAe79Ra+10okSJG/ezOKehWojbQyPC+fQrj+46jNMg9cQg0b0dyVQJ
	IWiNkFuS39fjPZ1zFOHHXEob3l+LXWGdGyx7Q91Lz43eKe+2wb+pjLoI8gU57FFZtfV3YBQuyFu
	Ya+HtEFntK3FBS80wwCOJBiw+gisfk1/vAT5N/JMQQ7TS75/nb3HWYSRgDaGwHz3LYNGSGlWXkt
	ejnPq09jbPNh+bfmuBtNgq5GPyXxp4Tv51GhDFqfP1/jaSz/GV9C7scVM9FwSXpKOMuO/2FJDVf
	9gFplONdGcPLdzfxlSZtdSFL89pGe44yep0FjX9reCCjMZjitYCrVOdCsWzhnU7Q=
X-Received: by 2002:a05:6102:1608:b0:7c3:72b7:7fc0 with SMTP id ada2fe7eead31-7d6ba3b91edmr61856137.13.1794947679635;
        Tue, 17 Nov 2026 12:34:39 -0800 (PST)
X-Received: by 2002:a05:6102:1608:b0:7c3:72b7:7fc0 with SMTP id ada2fe7eead31-7d6ba3b91edmr61837137.13.1794947679066;
        Tue, 17 Nov 2026 12:34:39 -0800 (PST)
Received: from localhost ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d4e670dsm10938425e9.1.2026.11.17.12.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:34:38 -0800 (PST)
Date: Tue, 17 Nov 2026 21:34:35 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, netdev@vger.kernel.org,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: preserve RX checksum capability when
 offload is disabled
Message-ID: <avy6WxJft6Aex-oX@lore-qca>
References: <20261115-submit-stmmac-rx-checksum-capability-v1-v1-1-ea26fa3689be@gmail.com>
 <630b9651-3963-4686-a51b-b670beaa45bb@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="uhqeACAWVMDeZ6jG"
Content-Disposition: inline
In-Reply-To: <630b9651-3963-4686-a51b-b670beaa45bb@bootlin.com>
X-Proofpoint-ORIG-GUID: UBTSQWWPcDCKz8PYLBybnXmn3-qCOPyy
X-Proofpoint-GUID: UBTSQWWPcDCKz8PYLBybnXmn3-qCOPyy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA4MSBTYWx0ZWRfXz3gF7xqR+YDC
 Ry2XIoOz8Al/zf5RayAXGop1uSeWVKVTbQ1xEWeOVmQREOZuiYAUqk/N7mqo+XEANUAGZ8SHrGp
 7JvJl1dvDIYSfanIj+S/rOy9eP4XC+PMLdiBIS0a2mzuiMXi0uWp5sOL48Vn61xz5kG2XgINI++
 /NWvmZSDW1iaa2s+Juhp8pqN9GGgQo1QWXVQcIOxLZUD0ej7lkRH39gYMDjlm/hpKXBL/l8z8mT
 gWrW1zItxIozUuD8w4m4buUlTBV4KqxdB1RPBIzA6Qkg7SmSvMcek4SH1Btu5114qfpp3o1Mtja
 seJXaXqZ6iMvZclUJSQkYKWPO2STYSbHFX4P4NXdEL712kQkggslSOr/Jeia33YD/1luNhhatYA
 BBdsikFy6bEgyCqgQ0pLtJIkUnp/ne0L4oXMXOME2VQXgDTxwvvNpXMUwZTn7BihUlYCZYEJpqF
 LwVgbF66DwrTUEPGukA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA4MSBTYWx0ZWRfX+xluE7dP/nxm
 vYVp9EMp64S5u5OGLfGH1LExh8p4LRfnEatC5pKsq2YQNrPFTSUdJWz266DWK8LlR67OIFzF2P9
 afro4baM42DmDKlQOXgxZ8bJeWh2uNE=
X-Authority-Analysis: v=2.4 cv=d5xgWhjE c=1 sm=1 tr=0 ts=6afcba61 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=9R54UkLUAAAA:8
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=ui44w_YjaUHB-fKmfF0A:9 a=CjuIK1q_8ugA:10
 a=dSt14DRd3il9wOMU6T0A:9 a=o1xkdb1NAhiiM49bd1HK:22 a=YTcpBFlVQWkNscrzJ_Dz:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170081

--uhqeACAWVMDeZ6jG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi James,
>=20
> On 11/16/26 01:49, James Hilliard wrote:
> > The GMAC, GMAC4 and XGMAC rx_ipc callbacks return whether checksum offl=
oad
> > is enabled after programming the requested state. A zero return is
> > therefore expected when hw->rx_csum is zero.
> >=20
> > stmmac_hw_setup() treats every zero return as a lack of hardware support
> > and clears plat->rx_coe. Disabling RX checksum offload with ethtool and
> > then reopening the interface loses the saved capability. Subsequent
> > attempts to enable offload are rejected by stmmac_fix_features(), which
> > uses plat->rx_coe to filter NETIF_F_RXCSUM.
> >=20
> > Only clear the capability if offload was requested but could not be
> > enabled. Keep calling rx_ipc when offload is disabled so that the hardw=
are
> > is still programmed with the requested state.
> >=20
> > Fixes: 0f280e4d23c2 ("stmmac: fix the rx csum feature")
>=20
> This tag doesn't exist :
>=20
> https://netdev-ctrl.bots.linux.dev/logview.html?f=3D/logs/build/1212156/1=
4986330/verify_fixes/stdout
>=20
> Besides that, this is legit. Tested on AgileX5, CycloneV and stm32mp1:
>=20
> ip l s eth0 up
> ethtool -K eth0 rx off
> ip l s eth0 down;
> ip l s eth0 up
> ethtool -K eth0 rx on
>=20
> Without patch:
> ethtool -k eth0 =3D> rx-checksumming off
>=20
> With:
> ethtool -k eth0 =3D> rx-checksumming on
>=20
> Please respin with a correct Fixes, feel free to add :
>=20
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
>=20
> Maxime
>=20
> pw-bot: cr
>=20
>=20

Reviewed-by:Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


--uhqeACAWVMDeZ6jG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCavy6WwAKCRA6cBh0uS2t
rF/MAQC94F9flu7V6ymO/GXi8P606jehIfn/ClLwmubRWdBLwgD+NBZl2irSTcCd
Ctt9MnmK8y9WyqY20+Ps+VFO9H9BxwU=
=Jn6z
-----END PGP SIGNATURE-----

--uhqeACAWVMDeZ6jG--
