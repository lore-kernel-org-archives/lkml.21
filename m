Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880349;
	b=gUq4EZEgYKApTpOy2BS4+x6q/+I7QvfmEG7Mh1ZxL/iopdg/v/xXvRYO86YfJA4mN69B
	 /ZGJuteAkmseHrVMQcmoYB/bzAsMWQ3lfL+x+0Ux3k2sc/5ycvTnl60PFT/UEJuhL1z9S
	 AszHlxWBquG+ciLWj/fw4PzX/SlzURuSssEghFNenRp/pfKIR3RmAIdk6Zr944fIdea3/
	 xGXJnWseIVMLrDnFPkDlPyrsSt4EAd/Ec3xOg05BnkhEZZUCcL2wzLbYd3m4+mvskZ1lb
	 wIhAjHZthSLWx90bXR9BgUBx4ls5wwQsG4MNIGLskvxVo9zInYZHVr4/lQGNmhYdw2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880349;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=LShtitvz7DRRsTeVyGIjUpCoy6XLU9LzpKYb3S4c5x0=;
	b=IvY4+TvDMZnQ5RzmsiAT3LKGEr9qyYt1MykcGubzG2LRE8HNSzSVVH/BszUW+c7mqtx9
	 hosoS0fmWFRqx04i6nZhOm9N2jH8/Idv2XMcquW+yhOKoUSNUy6PvLxwI9USn8fq7hLVv
	 77z1L0lnNVXFHlK33zZ9ShU1saeUChQvLXdKlTwUPM7n711VM5MTlr2KdhPKK9cLe3x4a
	 x6xog1SbrgsYtUQQnY7jVm7CGCLdcpccazgzPUA637LfEka+mgvGTz0F0RoNoSbMi1AGE
	 RbwJeQtU8oZL7XujPTPyR1Zvz88YTl1hsmnzjWQQ3u6yRJ+tqTdwl+HGZhf4iBQp/ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EGuT6NUG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF0F606A32C;
	Sat, 28 Nov 2026 15:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EGuT6NUG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E1E1F00893;
	Sat, 28 Nov 2026 15:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795880349;
	bh=LShtitvz7DRRsTeVyGIjUpCoy6XLU9LzpKYb3S4c5x0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EGuT6NUGO5FCeAjYFWE5zDDrS46diaMjUQmPrYMgee1ztUNv7HzCH2/hu4MjIoPTi
	 /TvR5m7v5+97FyuTamoca18j8dQHZPRTgoACUxO0XeYCIKwOpdCZ/C7KDpRxt4g8aM
	 G1d68NM/jcvbCsCPgpSHaqrbvjQa1R1LppdxXAvO35hTg4kCOWtrpyJZ1gBCV2EFo7
	 J5nUEvIr1+1B8h4gTaa1ZpnB5Dcgoa1QL+KNYZqCg6px0D+ND1KAP3inxz3gsER0Wv
	 zLaCWevGfD5ZcqMlXbarweKW+d4w6BfNa4h6hp90dnU87yOEOYr53AQzoXoTGS7Qmq
	 zwsdGlM/AmodQ==
Subject: Re: [PATCH v3 2/3] net: atlantic: AQC113: Limit multicast filters to
 available slots
From: netdev-bot+sashiko@kernel.org
To: j@jannau.net
Cc: sukhdeeps@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Sat, 28 Nov 2026 15:39:08 +0000
Message-ID: <179588034859.3135.5963966861559896048@kernel.org>
In-Reply-To: <20261127-net-atlantic-aq113-apple-l2-filter-slots-v3-2-b5efbc124dcc@jannau.net>
References: <20261127-net-atlantic-aq113-apple-l2-filter-slots-v3-2-b5efbc124dcc@jannau.net>
X-sashiko-severity: Medium
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new helper hw_atl2_get_multicast_address_max() returns
  `min(priv->l2_filter_count - 1, AQ_HW_MULTICAST_ADDRESS_MAX)`.

--

net: atlantic: AQC113: Limit multicast filters to available slots

This adds a hw_get_multicast_address_max() hw op. With it,
aq_nic_set_multicast_list() can fall back to IFF_PROMISC or IFF_ALLMULTI
based on how many L2 filter slots the firmware really provides. hw_atl2
takes the value from the firmware-reported l2_filter_count, and the bounds
check in hw_atl2_hw_multicast_list_set() now uses l2_filter_count too.

> diff --git a/drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2.c b/drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2.c
> index 25dd7150aaaf2..0b5a5bc420e92 100644
> --- a/drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2.c
> +++ b/drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2.c
> @@ -777,7 +777,7 @@ static int hw_atl2_hw_multicast_list_set(struct aq_hw_s *self,
>  	struct aq_nic_cfg_s *cfg = self->aq_nic_cfg;
>  	int err = 0;
>  
> -	if (count > (HW_ATL2_MAC_MAX - HW_ATL2_MAC_MIN)) {
> +	if (count > (priv->l2_filter_count - 1)) {
>  		err = -EBADRQC;
>  		goto err_exit;
>  	}

[ ... ]

> @@ -1602,6 +1602,14 @@ static int hw_atl2_hw_vlan_ctrl(struct aq_hw_s *self, bool enable)
>  	return aq_hw_err_from_flags(self);
>  }
>  
> +static unsigned int hw_atl2_get_multicast_address_max(struct aq_hw_s *self)
> +{
> +	struct hw_atl2_priv *priv = self->priv;
> +
> +	return min_t(unsigned int, priv->l2_filter_count - 1,
> +		     AQ_HW_MULTICAST_ADDRESS_MAX);
> +}

[Severity: Medium]
Should this helper also account for the firmware base index?
hw_atl2_hw_multicast_list_set() writes slots starting at
l2_filters_base_index + 1. Neither this helper nor the new check above
limits the count to the part of the HW_ATL2_MAC_MAX (38) entry bank that
sits above that base.

hw_atl2_utils_get_filter_caps() checks the two firmware values separately:

    priv->l2_filters_base_index = filter_caps.l2_filters_base_index;
    if (priv->l2_filters_base_index >= HW_ATL2_MAC_MAX)
        priv->l2_filters_base_index = HW_ATL2_MAC_UC;
    priv->l2_filter_count = filter_caps.l2_filter_count;
    if (priv->l2_filter_count < 1 || priv->l2_filter_count > HW_ATL2_MAC_MAX)
        priv->l2_filter_count = HW_ATL2_MAC_MAX - priv->l2_filters_base_index;

This means firmware caps such as base=9 and count=38 are accepted. With
those values:

  - this helper returns 32
  - aq_nic_set_multicast_list() can pass 32 addresses
  - the count > 37 check in hw_atl2_hw_multicast_list_set() passes

The loop then writes the DA LSW/MSW, tag and enable registers at
base_location + i, which covers slots 10 to 41. Slots 38 to 41 are past the
L2 unicast filter bank that hw_atl2_hw_init() initialises.

HW_ATL_RPFL2UC_DAFLSW_ADR(f) is 0x5110 + f * 8. So slot 40 maps to 0x5250,
which is HW_ATL_RPFL2MC_ENF_ADR(0), and slot 41 maps to ENF_ADR(2) and
ENF_ADR(3).

Can this overwrite the L2 multicast filter registers? The Apple values
(9 + 29) add up to exactly 38, so this only happens with firmware that
reports base + count > 38.

The later patch in this series, "net: atlantic: AQC113: Fix
hw_atl2_hw_packet_filter_set for L2 filter base index > 0", sizes the same
slot range like this:

    min_t(unsigned int, HW_ATL2_MAC_MAX - base_location,
          priv->l2_filter_count - 1);

At the end of the series, three places therefore use different slot
counts:

  - this helper
  - the check in hw_atl2_hw_multicast_list_set()
  - the loop in hw_atl2_hw_packet_filter_set()

Could the helper and the check both use the same limit?

    min(HW_ATL2_MAC_MAX - (l2_filters_base_index + 1),
        l2_filter_count - 1, AQ_HW_MULTICAST_ADDRESS_MAX)

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127-net-atlantic-aq113-apple-l2-filter-slots-v3-0-b5efbc124dcc%40jannau.net
