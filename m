Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795789588;
	b=aV3t5i3SlFMHOrhI7bmc7Lk/QDDX9JA3GF34QMdtniO/h2AhzNK0WVFAIWkOmkU6QoV7
	 3M3OaggXP7RkPoGiKwNtOIvN4Gd/63qjuHMkYBhBqh88NVzG5v4hmpRJvHaUe7EvJVlmW
	 PQGwEJrYFGL7Rha5/MArHamCZ6sTX0Vqy++8OlFGf90OA5S/8g/qKh6tnxlIdzgFdnHMD
	 LJoQwuUa9uNNByL5e1N+3V9NQfxzZJkLiNFyZ6Ah6DnSrSFovfVEFk7bAtWTl3+RQH2bB
	 wJL9eaLrvm8nHtlWRWxYRdWvvG7QP8cNcYFnLVUwGbEGXYOZxcyVaSc+ljO2dlVDH5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m1DqYt/Feo6Tg97bGood/CsVYKHCLyHFMxbJBDzqGhc=;
	b=k9CVP2X5J5wkurTmweHdvl3e4vF4FcJOM6pOby3tUcvVF12g5AEholGUyUlkLwcUQQsR
	 IcqEqtUWv24xus+RUXBNPfMlK7O91YNR8YfkUO1go2Sph67E193wWd/wfZen6sYOGT+u+
	 t7M5++ZjP6cu1CpYH0ZMwNDuxqx/VJBmE8SDxXlxI+y1MtAjabvnfewmx1SF6wmE/eDTW
	 lvb8UPd/jsQ64U3trKrTkCvPQotlnUD1ki/Bk/gF3b1UAUNRjmC9Yj2p5NK4jKjPolB9N
	 hOslqhJVAPub1Eut/nxmQSaOUT0rMrFV3x/Bl7zJmI9p70Iiiqw32b0Ol2P9FaQJocQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cC+qyaGB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.42
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CB2606A68C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36CB2606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cC+qyaGB
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67da69e7c31so8922811d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:26:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795789586; cv=none;
        d=google.com; s=arc-20260327;
        b=bZGc9ORugT5z8zXTgPE1c6l4O44m2AiDfZ5qa9Y5wiK8n6dBkdtENm4xzd9z2CKR8u
         WSm6/GYULYrT0UQJ0/FLN7yIFw41HBa3z/FImCYq+oVHu78LtsYiSSxQCyoLLEuFk/uw
         UAsYG3j7PE96JoP+R1Uoum/Jk38LTjWnvjmu20WcsMGE7Af2wgU4MFzG3/LW84noksXA
         9gMIqZ138JWJHivGup8Wnyge/xGibKgTZ435ghRjfqMtAysHatpA2wA2mrbNnDLqaqVO
         a9lFapOpbN5d2xHd26erK/DQSRJ2JthYGDT1y4W324BdaUT4ktVKkh/GBHatDJpbuTRE
         Axkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m1DqYt/Feo6Tg97bGood/CsVYKHCLyHFMxbJBDzqGhc=;
        fh=EiDAbDX5KPSKanFKNBg4ZRHrjX0TpOhwx8A3iUWcyU8=;
        b=n/9kBLclOcdorVX7Mnum5fg63lJOIlHobZYKeXCFpbbmTeesu0UAsOpyIuA7rKyNQQ
         HfMSe61jImTrY9wGv6VTDC4us71g8OSPAd5Rn7KcmlwZ8tB7/iAvu8dVlJeGqUWmfsjn
         3RPXZlZxQhR4395LqTPe4lWz8+83dOmSZxtbFg7fvdkuavDPqs+KV0ibtfDz3dsdH1up
         KuN/CRIwmt3lLxGtgnZcemALxkI7o6aLKhPzl2+MeiB8gOA+hPKJOaziXZe4J7U8wI6I
         cpec7beblWOIHFJ47eVsyi/LclvpBFOsSPXHKH3ZuIVNc4xiNgnG9rHVQcgDVm3kvfnH
         omlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795789586; x=1796394386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m1DqYt/Feo6Tg97bGood/CsVYKHCLyHFMxbJBDzqGhc=;
        b=cC+qyaGB7xL9/hIvPM4ljhUM9AVaeCKlMK0ostHAZv1kgp3lsJC8zl2UpLsbY7otIa
         QCDU6cUBKgiLBSOY57PzbUabzc8p+p2iAhbHDJrNScBluGlgc0Q+/7lPscZQ1NgYX+Mg
         OiZgV5RY8nh6r6xs478/Ymbq/NlSuyXmxF3gNVJb/WMt2D+JOcxR3B5I16d8UzC4GREF
         8b2kbs1gHoy1BP/XSOM+TplqEspcJjKGaFdKuTwX0z2lLH77QyrThzSem3Xmf9nG5O8/
         tapWNSHQpmghvv/R0hhEZHG+3z0HyAzNPU4RhLafw+Sop5lML9Y6MnGWkUm/ySctlfLU
         F5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789586; x=1796394386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1DqYt/Feo6Tg97bGood/CsVYKHCLyHFMxbJBDzqGhc=;
        b=JXxND4Wg5todWIq6LA1QMlsP/k0gP6kxBALnaIt7evav9aE+bW8ftDvlcoSNb7YYrR
         YH8eDjTRJDvN6nmyrk+0J6eGNhJgFODRCf/zaCErsf4fLjidksTL42AirsUzKx2nylDi
         avl8jektc03/b7mbYtgBA3mQJHZsWmIYV2+wDjekJEb7h392oOfJjk+fqa/nqgCF3OKO
         h4JaaY3TkPCZAY6GD//w9M7Sqnzq3FtTaboepc4TjRjf23GC15/4kLl6lHeN6AmJC7oJ
         BIafyM19kgDSoXchVQYWQiQ1mQOY8q/5yb2Rr8m5rqvrhfBPrGtapu25brhDElSSlhF6
         N4jw==
X-Forwarded-Encrypted: i=1; AL+hErEO+g1iz4xmCHm7/DRV4DrTYZnKDfzmvQ0H65SISb2OEDiyyYYqev9qYMsP2S+AJ2GTvO39BdPSIWCkouM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BHFnbdV+5lM3Nh/Zh4ZwWsdFGWBT2KHA37W+0mzuGgKWDpra9
	mHOx9UfQDJdKpz0f6b0xk483I8eKYtgR+OMvhDI4IH7yPmHg3DgKhoTDPNY861B6rfaGS2+q/M2
	C53cD2iyryZv/Aetewf1YCJa+RTBNrb0=
X-Gm-Gg: AZFdTZeZHNaZKYLB87EH+PEdx5pP8OeqDMbKDlLWVKUtbORM1VhAvEuOWNnVKruij+Q
	Qy/7/Gne1xIO394S1AOjx3nYgT2muwosB2GQCb3aH3AgXyOwqGgNAA8ZkjUPD1bncUoOnw/ojv4
	OwJdHZwkQ0v1NwqnxVmDt4CNP+dH8YN13eGDEMh+tP9rZhcJUBVZX517i1KdqTRNUIWtfdF9EFj
	hbCMYttWDyXhRKV9cDqds6gWiQ6azeBfWGfX1jhlJB+bHgBD5PzC/N6+Xt44nrhiRaUeIJOPKsD
	zrXgridwz4b19m0tbXQm37SLAJP1jChvz4PJEgNlsP6+THZfvWT/MG3FTm5PZoVuOKhrtvMnAq0
	p7i2F6lCFeTEsiOaMsd1Y/K4/mEriKrKs9BtfQIlM6vMBJfIACNmJz8sPRYV3hnIGoo1E1TZryZ
	GMxnfaylW/1eXK1ri1ghFaYsuCcCvMgBk3fMhZ6NN3QqGnDVfnwdmJ10Ny5GZ7bQMtWotAqf9XK
	/flLcH5n56z0uOwl7FDMNp0sV0eBRDZXR/UZ0ZHqv1eVo2C9gtJ/XSRWummBA==
X-Received: by 2002:a05:690e:1489:b0:679:5bea:d3fb with SMTP id
 956f58d0204a3-67df44ff2a3mr11332814d50.98.1795789586210; Fri, 27 Nov 2026
 06:26:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <7d7b20e7-6749-46c4-a6f8-462f83cd27e3@web.de> <0302adc3-dbf2-4e62-ac9b-8923ac285506@web.de>
In-Reply-To: <0302adc3-dbf2-4e62-ac9b-8923ac285506@web.de>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Fri, 27 Nov 2026 15:26:14 +0100
X-Gm-Features: Aa3M54rU861K6hVH_v4BM8VXqJq13L8vPQqUixPloEFQahDxyt31sYLJ9SxYLgk
Message-ID: <CAOiHx=mX7HYFXt05G_cH+u3uu3pVZEF5W5j2M0tRs6PG5swd_g@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] bcm63xx_enet: Prevent unbalanced
 clk_disable_unprepare() call in bcm_enet_remove()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Hemanth Selam <hemanth.selam@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Florian Fainelli <f.fainelli@gmail.com>, 
	Frank Li <Frank.Li@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 3:04=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 27 Nov 2026 11:52:23 +0100
>
> A clk_prepare_enable(priv->phy_clk) call was specified within an if branc=
h
> in the implementation of the function =E2=80=9Cbcm_enet_probe=E2=80=9D wh=
ile
> a clk_disable_unprepare(priv->phy_clk) call was unconditionally performed
> in the implementation of the function =E2=80=9Cbcm_enet_remove=E2=80=9D.
> Move this clk_disable_unprepare() call into a corresponding if branch.
>
> Fixes: 7e697ce99ceb09538cdc1dfa9ebb3db60236b0a7 ("bcm63xx_enet: use manag=
ed functions for clock/ioremap")
> Cc: stable@vger.kernel.org
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/net/ethernet/broadcom/bcm63xx_enet.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/e=
thernet/broadcom/bcm63xx_enet.c
> index f6595fdc888d..cc9a5cd2a2a3 100644
> --- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> +++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
> @@ -1915,6 +1915,9 @@ static void bcm_enet_remove(struct platform_device =
*pdev)
>         enet_writel(priv, 0, ENET_MIISC_REG);
>
>         if (priv->has_phy) {
> +               if (!priv->use_external_mii)
> +                       clk_disable_unprepare(priv->phy_clk);
> +
>                 mdiobus_unregister(priv->mii_bus);
>                 mdiobus_free(priv->mii_bus);
>         } else {
> @@ -1927,7 +1930,6 @@ static void bcm_enet_remove(struct platform_device =
*pdev)
>         }
>
>         /* disable hw block clocks */
> -       clk_disable_unprepare(priv->phy_clk);

clk_disable_unprepare() is NULL-safe, so it's fine to call it
unconditionally. This change fixes nothing, just adds potential
breakage (disabling the phy clock before unregistering the mdio bus
feels risky).

>         clk_disable_unprepare(priv->mac_clk);

Best regards,
Jonas
