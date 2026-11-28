Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795880348;
	b=ZqZy5BDEWo/fX9VLyJ6uTYfiVnMuNIGN6BBvq3bCE35w0ApCDVlPzEwREJ6QRYdl+URB
	 e3Bo+2BP0wTaJsYHAanvEOAtosb0LCSD2jGqsF/jD2F0/4aUvh+6mEbgSaIZ1iEmluZAF
	 ey7/P8Ez1jCIec/B1piSgvQC4utgvcEYy/md5w9D1za0Bj3+8qNSLC37BMBAR5xXy7Jux
	 DpXN34MWUwshCCAIjvfNgtglK16z4Trvq8+ZB+g/do50ez6QpooZ1xxahjXWXDKcOzr0v
	 J7wmW+nmJUC1dHBDIhLNi5nrD+7AJPq9huJf/L2HX8SLStzxIkf5DdPnKJ1r4YljpTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795880348;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Fmy4rzhXADrFx5343JuQbx0N6B9LmQdVdPfeQBW7Weo=;
	b=vvxXB8Gn2u0ugDPyUuDyf7bp9aS1I8pyINMxFcv9qyiHEUjZKg4LRaPajuq24UbyIbYT
	 lcWy2l0xnd+e6ZhWvPdAiRjNiwwTEtk8GRfgDjAubZRoSqNV1a+7hDeaMqBgRsYJgAIE9
	 aQ+r7HajaRRRv4o0M+Y6rAR2mnPhVcObqYYMXHSh70MPsNsTMWwW5qS0keQm+1NJSPQRs
	 LkoFCPzvPNLUgwXJGl72IQqALYLAP0nju78BqrET/MYua0gINV50lLVKVFvmpj749UAr3
	 Esisrd27cxOjZFoCx2w6RQ3UsqjcEtQboSbXRdLCu9OXlKufDREl6nLCqJqO3lbETpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T4HLycHz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0E4606A31C;
	Sat, 28 Nov 2026 15:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T4HLycHz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B5E1F00897;
	Sat, 28 Nov 2026 15:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795880348;
	bh=Fmy4rzhXADrFx5343JuQbx0N6B9LmQdVdPfeQBW7Weo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=T4HLycHz+E9dYAD4kDKrJ99qUUlZbBlt7F9Lbcasa8pC0wGPZK5AT0diEyk+6EBdN
	 Ue9nMuYqHfpQmNxpCciq+fzgh2FFENBLixHsR6MErCpQYmH/oJeHcemsGbsdXlwT4K
	 ZxfHICQTe2OedD+rSr4JWtdm0l+BO4a3OHyfpFtnprH29vJ7Qj3QMM1NmXyhDyspOL
	 MQ1hIw+pqxbQb93tvnjy6I2zREhw7tXMcb6DUSoOiBPXm+x38BfVnCUDNxpL2e0unE
	 5/aB8cjX9uCgrpNvrqQe+YVLPjK/yOXMiRBmEXsl52dxY3hG8xgzVwKoctKNJCSrDe
	 GjypCfOIPO+Ng==
Subject:
 Re: [PATCH v3 1/3] net: atlantic: AQC113: Ensure L2 filter count is valid
From: netdev-bot+sashiko@kernel.org
To: j@jannau.net
Cc: sukhdeeps@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Sat, 28 Nov 2026 15:39:07 +0000
Message-ID: <179588034739.3135.6933254779227340437@kernel.org>
In-Reply-To: <20261127-net-atlantic-aq113-apple-l2-filter-slots-v3-1-b5efbc124dcc@jannau.net>
References: <20261127-net-atlantic-aq113-apple-l2-filter-slots-v3-1-b5efbc124dcc@jannau.net>
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

- [Medium] In hw_atl2_utils_get_filter_caps()
  (drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2_utils_fw.c,…

--

net: atlantic: AQC113: Ensure L2 filter count is valid

This commit checks the firmware-provided l2_filter_count in
hw_atl2_utils_get_filter_caps(). If the value is outside [1, HW_ATL2_MAC_MAX],
the count is recomputed from the already validated l2_filters_base_index.

> diff --git a/drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2_utils_fw.c b/drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2_utils_fw.c
> index dc9b2ef4640b1..9ad5bbb11bdf8 100644
> --- a/drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2_utils_fw.c
> +++ b/drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2_utils_fw.c
> @@ -629,6 +629,8 @@ int hw_atl2_utils_get_filter_caps(struct aq_hw_s *self)
>  	if (priv->l2_filters_base_index >= HW_ATL2_MAC_MAX)
>  		priv->l2_filters_base_index = HW_ATL2_MAC_UC;
>  	priv->l2_filter_count = filter_caps.l2_filter_count;
> +	if (priv->l2_filter_count < 1 || priv->l2_filter_count > HW_ATL2_MAC_MAX)
> +		priv->l2_filter_count = HW_ATL2_MAC_MAX - priv->l2_filters_base_index;

[Severity: Medium]
Should the upper bound here be HW_ATL2_MAC_MAX - l2_filters_base_index
instead of HW_ATL2_MAC_MAX?

The fallback treats the count as the number of slots from the base to the
end of the 38-entry table. The accept condition does not apply that bound,
so a count that does not fit after the base still gets through.

For example, base = 30 passes the base check (it is below 38), and
count = 38 passes the new check.

Later patches in this series use l2_filter_count as the bound for
multicast programming:

hw_atl2_get_multicast_address_max():
	return min_t(unsigned int, priv->l2_filter_count - 1,
		     AQ_HW_MULTICAST_ADDRESS_MAX);

hw_atl2_hw_multicast_list_set():
	if (count > (priv->l2_filter_count - 1)) {

With base = 30 and count = 38, this advertises 32 multicast slots. The
loop then writes slots base_location + i, which is 31..62.

The register addresses are linear in the slot index:

	#define HW_ATL_RPFL2UC_DAFLSW_ADR(filter) (0x00005110 + (filter) * 0x8)

Slots 38..62 would land on MMIO 0x5240..0x5304, which is past the L2
unicast filter block. Can this misprogram unrelated RPF registers?

In the final series, hw_atl2_hw_packet_filter_set() clamps with
min(HW_ATL2_MAC_MAX - base_location, l2_filter_count - 1). The multicast
paths above use the raw l2_filter_count without that clamp.

Something like this would give every consumer the same window:

	if (count < 1 || count > HW_ATL2_MAC_MAX - base)

The Apple firmware reports base = 9 and count = 29, which is consistent. So
this only applies to firmware that reports a mismatched base/count pair.

>  	priv->etype_filter_base_index = filter_caps.ethertype_filter_base_index;
>  	priv->etype_filter_count = filter_caps.ethertype_filter_count;
>  	priv->etype_filter_tag_top =

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261127-net-atlantic-aq113-apple-l2-filter-slots-v3-0-b5efbc124dcc%40jannau.net
