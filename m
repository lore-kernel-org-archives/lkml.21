Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795711894;
	b=RdyEBTh6ipotmTlxs0yRBOrLCr1pi8iUR1oycpAmLflv7jyMMJlj5DlcKYBVxYGPVCeC
	 kspV2Ih1yZiFpdCq0hciZ03WMzgDBI7n4dDxExXGFPqy6dJn1nZGLAVNCMvXxFxcCpeYD
	 ZY30kuakWxTGufk5W4znfpUArkd4uFFwgORepT2YC6HudQ5QXVf9wmLiHagyQJf5BiYUl
	 UaM0B2s68moFdhsD/g+HqPh+5epv8LQ1AUiWXFgN5/s85pZ+D3iev3wfDi/VGB4lNSwEC
	 fX8XM9Vn8zofS6gC5BKlCVTAqaMAWm4NqoJAkpO1ixAlaD7RhyYP9Ch19vXhqZQJzFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711894;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y/HymTHxVh9JSPRhJ7hx3UDSfUl9znRn6BmHLB/weDg=;
	b=YRRIae9pn79RhcP2kZzuPqrgxJW2kAgNe4rkyLV53Sq8VVe+xq3ae/XyRmWfjaWFNka+
	 xUCHCx8LoTpKJvpuKwFXBg2PjpPb9mKiepOfXValmsqoFtZp+1nklEneikipqhJkP+YiG
	 VvinPRCBWCHFDgyZ7WuObGWSX2y4vQLxifET60ovahqC8ec+f5RhPBrtPODzg/wkT2m+0
	 FblEJMgX9keUv10DnMCI7zEhvJ8bjcNM9B6bmtWoXh6W0Ug9xNmBoDmL0FLQbF7PTptA0
	 rSdqjjEWXZkXEhHzEWDrCkct/63iD03TR3ohMeD6/VToj6pcp5dhhV9GlGS66Iua8iQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LN8w68kC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MM8HQdIp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB98606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEB98606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LN8w68kC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MM8HQdIp
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu29k4049018
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/HymTHxVh9JSPRhJ7hx3UDSfUl9znRn6BmHLB/weDg=; b=LN8w68kCprRpgF05
	kJDoNtvjfd4aAUxe9bIeSOxX88cccqH0S0YCVlika7aERAmDsO8j3AmIdt3eEbqV
	e+OKwkZNPHQ579sxl6c5y+7iQypvPsXf9R25964wlGy2noNoKhzruXSdor7sDVcJ
	JNnx38dYK3oc89yFYC9jnumXhtRoccPim6YC2Tnj03L3WXmr0IYMM+wStPc1L7ey
	suNC8+bvVwvs9qvsyyT1ddQzK5ux3eFleUZ37cmeuguxY0d358hTse4amoa8Kt2x
	NqsubbxpPW172KRqtootduOnp2JoCEewC+LbdOLwW8OQ2CrI3V3v1G35OOGqtf52
	X27YgQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rj8je-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:51:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso4848908a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:51:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795711892; cv=none;
        d=google.com; s=arc-20260327;
        b=dJaLuNhF+2NeA+HOrG8HDPZ7lEpOnpcT/Q/9gy54dihDFV8BhpuWeqwusEQTnhwbPP
         GK2eBFiA+didebErEd/5r8VCfOj2F8NdgJNDRaHido+hlrvUOODdf1xOt+IvLWsBXrvY
         1BkzgbhW9qxLj+Ffy5QPvN3+9bD8czOXfun1U7PjDXKZWsMQn8D71OJaDxPGzrIKEhbb
         f0g26Xp4ibEDgnWbQSutZF2OzLnSkVOgwV7snNd84x20XaxoEUnJVq5eo36WTItf5+in
         k0B4GDJILjbZ/7m47s68yRXa5oej+2RxeyK8nfjOtwiQvYo7j4BX+dwFwhA1/jmmhp88
         SlEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y/HymTHxVh9JSPRhJ7hx3UDSfUl9znRn6BmHLB/weDg=;
        fh=1zKqz07wDIZn7fbOGLJLU8dyOdILc9x0DRqbzjWSl5A=;
        b=HCUrP1n5HxXBD3QxwSqy8Mg2Hno1+qq4eQL8w+KZ9aa/wiZuX7n5lA2CDKwuIVQ0Cm
         pvnOCX+3y4KIaFEy1fPBY+Arv0mCwUbwLxGO8q/Pl95IlwPYd42pWt+RbPNL9ikgjBN9
         /19jwmRm1i3rRN1yeT+jFe7eb31Tr0gYXG8CZ8X4Tz6Lzv0QPyHmCAwzDVN91llmdndo
         PTHRKKrT2mqQvQs8uMEWw+P5bwgEZPwFzMPFSrU4XDmcGOoHDR1JYzfqDHwLgfwF0tr5
         R986/GcOpRuPp7mNOk1voEQtVd8iOZpL+Ol/0Krg0CtHyAsvCLbtAzCmZ4AviVPfy32f
         F7Rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795711892; x=1796316692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/HymTHxVh9JSPRhJ7hx3UDSfUl9znRn6BmHLB/weDg=;
        b=MM8HQdIpqb5+ZCZcU8fme6VsNf+G6M2cQWwR97jYknUCZ/jYarYxJbTsnvExhZEy2y
         //dneQmJ8a6yAOcvgaXsCfLRO0HA8rnf5xUZsZcpYdnU7xi7ysCJkFGl7opOoGBVnCsT
         HYPSEpCJ1w5QuXbpQBbF6Tf1cR/VdAPhTtBhmK/S+wTJXhHrhoiKN4Jy6hp6Tob8VxJh
         4NJeWkZsbDs/o0ij7oq8WdbBZsNG+D1nq0d95KuD7RldjJGpOEjrrmtunE5H2FIPw/x5
         /Py1Yf6IIZjUYruRA+M2v8bslYgEEW5jlHL/jTJXbNq7LQ7xIZxGxNN+kI6iPc4wRvE/
         AWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711892; x=1796316692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/HymTHxVh9JSPRhJ7hx3UDSfUl9znRn6BmHLB/weDg=;
        b=h/+tyonZ+3xnrMPrHzM4+vRzaNL+7yeUgg2UVCPBb8umywWzRXEYwpQji4I8Mzb4tG
         xwgp99oQ7G3zozy0vsGv+Eowgs4Nj2mSyLeIWRsqSSeRDRy8sezGWJHloR34JaezaHB+
         aUwfGnhaLG/3BfKcWNnfFv/4/LqV/IVHWV3wCQBCdYC8eSGvTmfZrxKUwyyikD73PUFR
         kgShv8EpbS5RANGWJ2+Ue+dGgGHOuOgmoOLGysm2ZpA37+RaZUK8Aid4CKphygkZmfMC
         Ys/pXcBu/4K9zg8JTCssM6FadBZsKoFAPBYq32TZ7H5DoG6hr2ZnrTA+lZNjDZy3AGAF
         s/UA==
X-Forwarded-Encrypted: i=1; AL+hErE3UiHQdqfZONh6imKEG5+xJfY0hdbhhgVg8VNXDnR5/Q5f7oB5XDcI3cf+Lm2tNCjMW9e5Yji/iE+K15c=@vger.kernel.org
X-Gm-Message-State: APuU4Z93otkOqf2VtfUCVDxmJTGBI6Caqr0XhFfRUw/yu0JUfLY9r9U3
	v+s+2GsHP6JLQldLQ27yFb9BLtoT67TeDgv0DvaHc6o0EEZzkIdbgDrezobK86zpjo6vyBQmook
	F+juD4+jpdsxzyE5Sjv4x+visHYHrx25ZlV96aYC9+hkW64HlWKIv4UGYs5AjPMGy7jeOHrC+J3
	BPfAAizFsz2myhFlNRRL/utxLK8HcqeJUuNFcknhyR6g==
X-Gm-Gg: AZFdTZeQUTVqM4PaaozZuZREKbaimdRKAazJ0+8fjYVoN2sXvLP0Xqq8g0ta0Bx3dwu
	+hXX90f7X3b7PjSop8cE0M3js1ZtjsLzgzrUlp2KtTp3DQ4yUuvJYZLAP1VyTNbQFG2W7de3B/k
	u63vHfvt/Y/CCAzyUHKy7opEMTR9uDjrthANExJ6KRPWhu6A5bRWyRMIwz2Q==
X-Received: by 2002:a17:90b:50:b0:3b0:b35e:b373 with SMTP id 98e67ed59e1d1-3b41c7c2378mr21122813a91.4.1795711892241;
        Thu, 26 Nov 2026 08:51:32 -0800 (PST)
X-Received: by 2002:a17:90b:50:b0:3b0:b35e:b373 with SMTP id
 98e67ed59e1d1-3b41c7c2378mr21122785a91.4.1795711891756; Thu, 26 Nov 2026
 08:51:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-fix-resume-reset-v1-1-115b3da5764d@foss.st.com>
In-Reply-To: <20261113-fix-resume-reset-v1-1-115b3da5764d@foss.st.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 17:51:18 +0100
X-Gm-Features: Aa3M54o4VHeMYCpg2TuAN6_-LjxGTu6SJHr08jR0_SBLE_JPiTPSxML96L7j05o
Message-ID: <CAPx+jO_V7f69HU+8r7thJW6xvUc75zsaWamHc9+L1Wsh8vyU6Q@mail.gmail.com>
Subject: Re: [PATCH] mmc: mmci: stm32: reset and restore SDMMC state on system resume
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulfh@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Marek Vasut <marex@nabladev.com>, linux-mmc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2NiBTYWx0ZWRfXxzT/bZKpaezN
 cosE56/bybGB4XMkAx1cpIQsNAXdTFBtsX7xrrXjhdgLmeEm6st0/OiwabDbwrCWkcnQsMZzS6F
 Wezukv/Air6E+Lba2i6L7/yETeZZ2Xlx5R/CZYB9xj7SFf9KKbVRZ8pwDS/zwbjRl1EMeqCdNX9
 hDgFM5EqBtJXOioYapgtzFCKEFVkUlYkl6tKog190I8JdFQnn7v2mUzPn2KRpje9JnLxAk0TPm7
 dD2M+CRRmnXrwyDlfr+DVqVg5Vd4D1GNsr8AfNR7M5ZXA7wG3JSqrDrO4+tby5+eKJYXxQx4xxO
 RRFI7+R4Gco2mFpeItWnWOB7VGM5tQeuI3OM+1JHSzrmSAr4JmMwu5bS9MRPY15PzFSLrrEEj8e
 iogjZTVqSz7H4CxQQ2ZL+D17fFzi+ytDknKzaQ8zhLo+I4dr77ioqaPuML9CqrEAVVhUrPGbwoo
 XvNnrVYa41ZyAcXyJvw==
X-Proofpoint-GUID: YMtK1lOlDla4xaZibMCD7QEU-PIg4Cnj
X-Proofpoint-ORIG-GUID: YMtK1lOlDla4xaZibMCD7QEU-PIg4Cnj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2NiBTYWx0ZWRfX7slaQ7kR+ZnP
 5R6pV0G2LC6Hp+E05V8rCk+ZMtCnDYn0evsvL5XKgYpHE8LpgZgDonPMX/WCl1yJQ1R7/tuSwyX
 J5Ln7PWAoVFtE5+Cmtl5Ta5ot77G1xQ=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b086394 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=8b9GpE9nAAAA:8 a=VwQbUJbxAAAA:8
 a=ecHELK-FIlHdQtvxNqoA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260066

On Fri, Nov 13, 2026 at 5:36=E2=80=AFPM Christophe Kerello
<christophe.kerello@foss.st.com> wrote:
>
> On standby exit, the bootrom may reuse the SDMMC instance used as boot
> device, leaving the IP in a state not known by Linux.
>
> STM32 variants do not set pwrreg_nopower, so MMCICLOCK, MMCIDATACTRL and
> MMCIPOWER are neither saved nor restored by mmci_save()/mmci_restore():
> their content is expected to be retained by the hardware.
>
> Add a reset_on_resume variant flag. When set, and if the card is powered
> off and a reset line is available, reset the IP on system resume and
> restore the cached MMCICLOCK, MMCIDATACTRL and MMCIPOWER values.
>
> This is done from a .resume_noirq callback, so that mmci_irq() cannot run
> on a state left by the bootrom once device interrupts are re-enabled. It
> also runs before pm_runtime_force_resume(), which does not resume the
> device if it was already runtime suspended before system suspend. The
> clock is therefore enabled locally for the duration of the sequence.
> Clock and reset errors are reported to the PM core.
>
> Enable the flag for all STM32 SDMMC variants.
>
> Fixes: 46b723dd867d ("mmc: mmci: add stm32 sdmmc variant")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mmci.c | 58 +++++++++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/mmc/host/mmci.h |  4 ++++
>  2 files changed, 62 insertions(+)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 5ecb4d0bdaa5..f5affe4fe1b2 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -278,6 +278,7 @@ static struct variant_data variant_stm32_sdmmc =3D {
>         .busy_detect            =3D true,
>         .busy_detect_flag       =3D MCI_STM32_BUSYD0,
>         .busy_detect_mask       =3D MCI_STM32_BUSYD0ENDMASK,
> +       .reset_on_resume        =3D true,
>         .init                   =3D sdmmc_variant_init,
>  };
>
> @@ -307,6 +308,7 @@ static struct variant_data variant_stm32_sdmmcv2 =3D =
{
>         .busy_detect            =3D true,
>         .busy_detect_flag       =3D MCI_STM32_BUSYD0,
>         .busy_detect_mask       =3D MCI_STM32_BUSYD0ENDMASK,
> +       .reset_on_resume        =3D true,
>         .init                   =3D sdmmc_variant_init,
>  };
>
> @@ -336,6 +338,7 @@ static struct variant_data variant_stm32_sdmmcv3 =3D =
{
>         .busy_detect            =3D true,
>         .busy_detect_flag       =3D MCI_STM32_BUSYD0,
>         .busy_detect_mask       =3D MCI_STM32_BUSYD0ENDMASK,
> +       .reset_on_resume        =3D true,
>         .init                   =3D sdmmc_variant_init,
>  };
>
> @@ -2586,8 +2589,63 @@ static int mmci_runtime_resume(struct device *dev)
>         return 0;
>  }
>
> +static int mmci_reset_on_resume(struct mmci_host *host)
> +{
> +       struct device *dev =3D mmc_dev(host->mmc);
> +       unsigned long flags;
> +       int ret;
> +
> +       if (!host->variant->reset_on_resume || !host->rst ||
> +           host->mmc->ios.power_mode !=3D MMC_POWER_OFF)
> +               return 0;
> +
> +       ret =3D clk_prepare_enable(host->clk);
> +       if (ret) {
> +               dev_err(dev, "failed to enable clock: %d\n", ret);
> +               return ret;
> +       }
> +
> +       ret =3D reset_control_assert(host->rst);
> +       if (ret) {
> +               dev_err(dev, "failed to assert reset: %d\n", ret);
> +               goto out;
> +       }
> +
> +       udelay(2);
> +
> +       ret =3D reset_control_deassert(host->rst);
> +       if (ret) {
> +               dev_err(dev, "failed to deassert reset: %d\n", ret);
> +               goto out;
> +       }
> +
> +       spin_lock_irqsave(&host->lock, flags);
> +       writel(host->clk_reg, host->base + MMCICLOCK);
> +       writel(host->datactrl_reg, host->base + MMCIDATACTRL);
> +       writel(host->pwr_reg, host->base + MMCIPOWER);
> +       mmci_reg_delay(host);
> +       spin_unlock_irqrestore(&host->lock, flags);
> +
> +out:
> +       clk_disable_unprepare(host->clk);
> +
> +       return ret;
> +}
> +
> +static int mmci_resume_noirq(struct device *dev)
> +{
> +       struct amba_device *adev =3D to_amba_device(dev);
> +       struct mmc_host *mmc =3D amba_get_drvdata(adev);
> +
> +       if (!mmc)
> +               return 0;
> +
> +       return mmci_reset_on_resume(mmc_priv(mmc));
> +}
> +
>  static const struct dev_pm_ops mmci_dev_pm_ops =3D {
>         SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_re=
sume)
> +       NOIRQ_SYSTEM_SLEEP_PM_OPS(NULL, mmci_resume_noirq)
>         RUNTIME_PM_OPS(mmci_runtime_suspend, mmci_runtime_resume, NULL)
>  };
>
> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
> index 4d3647f9ec06..3a053e40d113 100644
> --- a/drivers/mmc/host/mmci.h
> +++ b/drivers/mmc/host/mmci.h
> @@ -334,6 +334,9 @@ enum mmci_busy_state {
>   * @supports_sdio_irq: allow SD I/O card to interrupt the host
>   * @stm32_idmabsize_mask: stm32 sdmmc idma buffer size.
>   * @dma_flow_controller: use peripheral as flow controller for DMA.
> + * @reset_on_resume: on system resume, if the card is powered off, reset=
 the
> + *                  IP and restore MMCICLOCK, MMCIDATACTRL and MMCIPOWER=
, as
> + *                  the IP may have been used by a bootloader or the boo=
trom.
>   */
>  struct variant_data {
>         unsigned int            clkreg;
> @@ -382,6 +385,7 @@ struct variant_data {
>         u32                     stm32_idmabsize_mask;
>         u32                     stm32_idmabsize_align;
>         bool                    dma_flow_controller;
> +       bool                    reset_on_resume;
>         void (*init)(struct mmci_host *host);
>  };
>
>
> ---
> base-commit: d2616724e01132376c78872b8324f38659af9f28
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git nex=
t
> change-id: 20261113-fix-resume-reset-9bb5714fd505
>
> Best regards,
> --
> Christophe Kerello <christophe.kerello@foss.st.com>
>
