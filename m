Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795865164;
	b=iHGnqPb9YYXqdBgBLgwDV0Or0ZgHgoxO2lhLfQmPwtEjIxE6q9EdxCL7TRX4xHXEuw1v
	 aQTzoUq81CGHbQmqNEq2Wn+OHBRadpsyLB5/3agBjExDm8Krlm4PcgeC5w3wK1ipH3iSW
	 6DLyrrNYHdA8CvT+nlW11A4cauIB5tHUntZe3EgPIjBFy/QHIk82oBd7V6OG773ozPFlR
	 NkhNs+RuhvHMdEiRVTzVdJuEJCDj7xu0do7hAohv9OlolBs9WidfIEPJ2z1b7QV7pE927
	 SXRMlDV76EVzCAvmXadDIFa0lSYJ9YTbbXhp88eTeyFZfP6eAFs/P/6V4bcw+Ccan7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795865164;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=NHIBnVqdOtgtb+45LOjNsVPZ/ajhk+Np8JsuDoP7Jj4=;
	b=SPXkNZKjce8pL4a9ZZL2tfp2AVUJ75uKX+mx6M3vzp97WkPii+GR85uLoxfv4erXLi0t
	 rad2ymrfWFfb3vFunArIZla6AbXDHktbe8PG9n5lRjhFBo0YnpAwYz2XK20LILEogUP7h
	 G0ufmgKx2pqfCVIq79HPsv2BYiDoDAZL8MVR9f+IWgigMAB1AkvGe0qZO2QOJr44JbR62
	 tGu46aE3yRuAvtdss1FW2Z077l+ImJcxh1i6bnmLeCb2mjHnwAIeDEjUwi0go+PjpEend
	 +M87oTnhcuEMl9sHnfyNEl83/qEKzVSaAS2KXsz73fb7pV0bfkDPFaKasTWIpfFnN9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBKMORcH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBDA606A32E;
	Sat, 28 Nov 2026 11:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBKMORcH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A0E1F00897;
	Sat, 28 Nov 2026 11:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795865164;
	bh=NHIBnVqdOtgtb+45LOjNsVPZ/ajhk+Np8JsuDoP7Jj4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aBKMORcHfZsGFcblUGmpBld6S/oOnHECinCX1RyhQzRu7p6XqBKIMX1yjgELEZQnW
	 lA7W+g8Q7+cnqVtfY40/eFj/957wHO/5Aq3tq0UhPCNcBeXuJQH46YutiGOi4kT51W
	 n+hpzhI+XMuw2mIZN5N1qFeyDufOLjDp3Z0rAqELv4zW79fTF3yMxBEIhXCVIJir1e
	 fwAbNza9jrzeHg+KSlu2ZWPv19gGrBKIjuHQaCS1hKpTDJA+uHUpmLTgT0sb1D8vO4
	 MeJbnW+LQA/m6jTvO49AvP//qHJLdKaZXS8D2GROA6A2HIIHhlfQIc9fFAhaBFbG8E
	 AAVVJgIV4bLLA==
Subject: Re: [PATCH net-next v10 3/8] net: bcmgenet: rename ENET_MAX_MTU_SIZE
 to ENET_MAX_FRAME_LEN
From: netdev-bot+sashiko@kernel.org
To: nb@tipi-net.de
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 f.fainelli@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 pierremarinleclercq88@gmail.com, dave.stevenson@raspberrypi.com,
 justin.chen@broadcom.com
Date: Sat, 28 Nov 2026 11:26:02 +0000
Message-ID: <179586516296.3135.16116163120459465582@kernel.org>
In-Reply-To: <20261127-nb-genet-mtu-nn-v2-v10-3-749c7cc45d97@tipi-net.de>
References: <20261127-nb-genet-mtu-nn-v2-v10-3-749c7cc45d97@tipi-net.de>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In drivers/net/ethernet/broadcom/genet/bcmgenet.h, the commit
  "net: bcmgenet: rename ENET_MAX_FRAME_LEN" deletes the old comment…

--

net: bcmgenet: rename ENET_MAX_MTU_SIZE to ENET_MAX_FRAME_LEN

This patch renames ENET_MAX_MTU_SIZE to ENET_MAX_FRAME_LEN because the
value is a frame length, not an MTU. It updates the two users, init_umac()
and bcmgenet_init_tx_ring(), and replaces the comment above the macro. No
functional change is intended.

> diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.h b/drivers/net/ethernet/broadcom/genet/bcmgenet.h
> index 6ab3f73475550..afaccb7699336 100644
> --- a/drivers/net/ethernet/broadcom/genet/bcmgenet.h
> +++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.h
> @@ -28,12 +28,11 @@
>  /* which ring is descriptor based */
>  #define DESC_INDEX				16
>  
> -/* Body(1500) + EH_SIZE(14) + VLANTAG(4) + BRCMTAG(6) + FCS(4) = 1528.
> - * 1536 is multiple of 256 bytes
> - */
>  #define ENET_BRCM_TAG_LEN	6
>  #define ENET_PAD		8
> -#define ENET_MAX_MTU_SIZE	(ETH_DATA_LEN + ETH_HLEN + VLAN_HLEN + \
> +
> +/* Longest frame the MAC must accept for the default MTU */
> +#define ENET_MAX_FRAME_LEN	(ETH_DATA_LEN + ETH_HLEN + VLAN_HLEN + \
>  				 ENET_BRCM_TAG_LEN + ETH_FCS_LEN + ENET_PAD)

[Severity: Low]

This isn't a bug, but is the new comment accurate? The expression adds
up to 1536:

    1500 + 14 + 4 + 6 + 4 + 8 (ENET_PAD) = 1536

The longest frame the MAC actually has to accept for the default MTU is
1528. The extra 8 bytes come from ENET_PAD, which is not part of any frame.

The deleted comment was the only place that explained ENET_PAD, as
rounding up to a 256-byte multiple. After this patch nothing explains it.
The padded value is still written to UMAC_MAX_FRAME_LEN in init_umac(). It
is also shifted into the TDMA flow period in bcmgenet_init_tx_ring(), which
the new comment doesn't mention.

The next patch in the series, "net: bcmgenet: derive the receive buffer
length from the MTU", rewrites this comment to explain that ENET_PAD rounds
1528 up to 1536, so the end of the series is fine. Could this patch keep
the ENET_PAD explanation, so the comment is also correct at this commit?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127-nb-genet-mtu-nn-v2-v10-0-749c7cc45d97%40tipi-net.de
