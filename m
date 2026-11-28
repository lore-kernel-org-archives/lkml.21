Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880351;
	b=kleWS49wV77RMMwfvefS7F73FhHW6pfr/qrwEgg4AYZ0tmbv/YM9f7d8qu10mBIEP2j1
	 RrXYESeRq95BspBZtukCfyzak6C80r/bnw2fPkPiDFd0uX5v2OjAq0f3/4YD7DmAL/lXP
	 FNvTLTX5QHm2FEOgPR+b8vDp3jb/L1viYKOkNv2Wh30/57ZLoGbs3ZumBF+/XW+t0Xs4B
	 nKJ7ziZCJzCd7/oqFl6jOaSwLq2LlgrmcpryUR96hcFW4mFiwxIgQtTzYXdnc9vXsXB0J
	 ftPxiweRNubfyXnOb7D+L820V2UKcMbMZNDBA3dRrK0s4aLsOj7kt8Ka+DxAo1g05yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880351;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=LZkDUpW5lcBiMmS7XikDtOe8pmsL+bMP3t+U/T7flfw=;
	b=KS7pT5/wqTG2zY5MX4InJvIoldVMJ2KckZiNchkHSonVwRvQfbmbsDz7UeCWfmf21a83
	 ng2leQEwxbwEUB1lWniJoTKNJ+yi+zfooTHGdXkUMJlJFOxRUoZ2PgdvH2j1ZI5ggO9Vq
	 JPCHhFvs8Sglni+OwUGmv4n2jpnAajZeBUsHBjD63d3J3s8ndmQY0367O+vpVi9BxlTL2
	 ymc3NfB5Kn4zbt1Y7VI3JVhvz5pqmyc0hIrO00H7K8Uq7wSPE/wzIB6E+JTng1/+m2nc8
	 CBjnuQTvhcnGgmhL1BSzEnINj2cOmxGKwoeKoDl1bNeMZjcXaaP089EBN2wthq4VmCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Aou6cs1I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59AB606A31F;
	Sat, 28 Nov 2026 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Aou6cs1I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C931F00893;
	Sat, 28 Nov 2026 15:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795880350;
	bh=LZkDUpW5lcBiMmS7XikDtOe8pmsL+bMP3t+U/T7flfw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Aou6cs1Ib4ILaFtM8rok7LwIZ7Ry7XDFdvPbD+P4XTp9UkNaqeo+y6QIZfpZrTErr
	 wH+h52n0tz8h0dBpon1kJt9Q8j4JNR3MrKucnH1h9SMHj7ScD5etsaWeo3N8hphoEF
	 z0janFbdyckzDK46/sm1TDdX64pgAC9ayxf0+c7+dUySdDhHVwY6/EXJ0xcfELoCnh
	 1P8TYYUkKkkPvz8yrvQGzBn22hP4z0+hJxxtZc6JT3gS1rNSb+Ey9dalucwSPkLdir
	 u095DdOazykJoFSUzDqD2y2BCdmyYOzYYfcoJ0wqVtM+K8siEmKd4UE/LiE9NWQi98
	 wy7IHzi1WfmDg==
Subject: Re: [PATCH v3 3/3] net: atlantic: AQC113: Fix
 hw_atl2_hw_packet_filter_set for L2 filter base index > 0
From: netdev-bot+sashiko@kernel.org
To: j@jannau.net
Cc: sukhdeeps@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Sat, 28 Nov 2026 15:39:09 +0000
Message-ID: <179588034965.3135.11135930842841069370@kernel.org>
In-Reply-To: <20261127-net-atlantic-aq113-apple-l2-filter-slots-v3-3-b5efbc124dcc@jannau.net>
References: <20261127-net-atlantic-aq113-apple-l2-filter-slots-v3-3-b5efbc124dcc@jannau.net>
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

- [Medium] This patch adds an off-by-one in
  hw_atl2_hw_packet_filter_set()…

--

net: atlantic: AQC113: Fix hw_atl2_hw_packet_filter_set for L2 filter base index > 0

hw_atl2_hw_packet_filter_set() used to wrap hw_atl_b0_hw_packet_filter_set().
That function enables or disables L2 filters 1..32 without taking
l2_filters_base_index into account. With l2_filters_base_index = 9 on Apple
silicon systems, this could disable the MAC address filter.

This patch copies the b0 function into hw_atl2.c and changes the unicast
filter enable loop to start at base_location.

> diff --git a/drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2.c b/drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2.c
> index 0b5a5bc420e92..89841612be168 100644
> --- a/drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2.c
> +++ b/drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2.c
> @@ -759,9 +759,43 @@ static int hw_atl2_hw_ring_tx_init(struct aq_hw_s *self,
>  static int hw_atl2_hw_packet_filter_set(struct aq_hw_s *self,
>  					unsigned int packet_filter)
>  {
> +	struct aq_nic_cfg_s *cfg = self->aq_nic_cfg;
> +	struct hw_atl2_priv *priv = self->priv;
> +	u32 base_location = priv->l2_filters_base_index + 1;

[ ... ]

> +	hw_atl_rpfl2broadcast_en_set(self, IS_FILTER_ENABLED(IFF_BROADCAST));
> +
> +	for (i = 0; i < num_l2_filters; ++i)
> +		hw_atl_rpfl2_uc_flr_en_set(self,
> +					   (cfg->is_mc_list_enabled &&
> +					    (i <= cfg->mc_list_count)) ?
> +					   1U : 0U, base_location + i);

[Severity: Medium]
Does this enable one more L2 unicast filter slot than the driver
programmed?

The old b0 loop started at HW_ATL_B0_MAC_MIN (1) and used the absolute
slot number:

hw_atl_b0_hw_packet_filter_set() {
    ...
	for (i = HW_ATL_B0_MAC_MIN; i < HW_ATL_B0_MAC_MAX; ++i)
		hw_atl_rpfl2_uc_flr_en_set(self,
					   (cfg->is_mc_list_enabled &&
					    (i <= cfg->mc_list_count)) ?
					   1U : 0U, i);
    ...
}

The inclusive "i <= cfg->mc_list_count" test was correct there. Here the
loop is 0-based and offset by base_location, so the same test enables
mc_list_count + 1 slots: base_location + 0 through
base_location + mc_list_count.

hw_atl2_hw_multicast_list_set() only programs count slots:

hw_atl2_hw_multicast_list_set() {
    ...
	for (cfg->mc_list_count = 0U;
			cfg->mc_list_count < count;
			++cfg->mc_list_count) {
		u32 i = cfg->mc_list_count;
		...
		hw_atl2_rpfl2_uc_flr_tag_set(self, 1, base_location + i);

		hw_atl_rpfl2_uc_flr_en_set(self, (cfg->is_mc_list_enabled),
					   base_location + i);
	}
    ...
}

So slot base_location + mc_list_count is enabled but never written in this
pass. Take this sequence:

- add a secondary MAC so the list has N + 1 entries
- remove it so the list has N entries
- hw_atl2_hw_multicast_list_set() rewrites slots 0..N-1 only
- hw_atl2_hw_packet_filter_set() turns base_location + N back on

The hardware would then keep accepting frames for the removed address.
With mc_list_count == 0 and IFF_MULTICAST set, slot base_location is enabled
even though it was never programmed.

This affects every AQC113, including l2_filters_base_index == 0. Should the
test be "i < cfg->mc_list_count" in the new 0-based loop?

> +
> +	return aq_hw_err_from_flags(self);
>  }
>  
>  #undef IS_FILTER_ENABLED

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127-net-atlantic-aq113-apple-l2-filter-slots-v3-0-b5efbc124dcc%40jannau.net
