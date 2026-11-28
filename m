Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795872999;
	b=kd4yOjCrXbBnZoAcJSsktHC6p3Qdbz3K2mW7zfqqn97sdxbpeIqFowNOv8aZV/sB+JFG
	 qdPsj+1udb1zKLzf3lVEtbUFccw7lydxoS5A7ALjwvOwzHs1qan3HEt/5UTuSmW4YH86+
	 Pb4AUCv5+buI+ZrAmiWVSig4W4L95UAYQftwoX7IdTmkuLJJJBTdoDRYy6Fy6jSnapS3x
	 jhO410vWuZX4SRn4iFiP+vqnAAhwbGbrylEaLcCFIOglZx9jq0dDxoUke1q/mh2GL675S
	 5yIti8ivqoIn4GmTFX5g8mRm6KU42juZgvAkhfP2ibH10fgoAyfsbCcsa03tmH7PKcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795872999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=a5WxxRcYdBHgsweyummlp7eYA7vC+58yNVZbC9L/D58=;
	b=IuwlB/INI1o6MppjJQHQcpQf6Oz7mpTK4oH1OoOCad7KU2Y/3ys/4VQ3fnWRcTMPtv1D
	 QTWZQ1QQL9s6UFmoSdbTCUIsAgwtjVWh/wSiWGiqRH7xCO/BocSQ+iyYeEzrsC3Z59Oyp
	 DxICnEFrTLW6/L/VCYVXMeecVHaZzmJIPw8z+zUam/KA/tGEwLIJAmLZCbbxM3PTl7o+a
	 aRFjnVKkm8gZlfzO3ehHg2KXTWLiTRvmaS6lNhAEhl9lYfhOh2o9mslEn10UcgkJaqHDP
	 ChEueYoPZJRofhclfNDFM9QbPB2DpXkkMIMKHkRn6EUrdo0s5yveHZgwQwwHpYcZzRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kp/deqQ9";
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95148606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95148606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kp/deqQ9
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so6980189f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 05:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795872997; x=1796477797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a5WxxRcYdBHgsweyummlp7eYA7vC+58yNVZbC9L/D58=;
        b=kp/deqQ9IVh4qK8O0NDOHe7xQOIWdZ4nMx5bHaOb10okIw0aUCzCFBujPy9iUIEqzs
         sCZ/nWvycqf4/xC+0TaYXn+HUlLCPpvKf3pF6SZknBVO02qRgjbqkIPiEVYMN0K/2Tsm
         VNqWmPh7DpUsOzylXrV+yNFHfYwA63e1u00wFZW8HYj0XF2Ru45lgYQ/eDKgPapphx1x
         NSwM+3PP1qjAnACQGbGdK65NisXXmyLaiQ8uDMV/W7GAeCS57ZeHCJ3ro9hnVVR0k/n3
         Uhge6yisrtubcJB7cMzN6RDaIyD4cg7onO0u7xUytLj2DU2tjDepqxeL8rrGZ2Bq+OZD
         KRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795872997; x=1796477797;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5WxxRcYdBHgsweyummlp7eYA7vC+58yNVZbC9L/D58=;
        b=Q0+cqU+EsnzNxAzPDsAPydN0R7MRu8PwRajFnhfYk3FNgkEXbqxdFPxGxE1uMmwm1V
         fuu3zUAik4CC5yFhFDaW6onjSnS3FzRAGhbYzIz0vZfvfSSTU6CigvaVvlUjcfUWte32
         S6bcjHyGZ6F1dn6J4O3DjXRD6bnaW8B3iqsROAz9uO0EJzQ/VSz75dxZtVYQvGpftYuz
         wW34043njHcC2zyXTsQ7GICLd9QqZkfJMfUnlcDqZmkWa8rO05qdM8CNvOzugk9omdOz
         H2A1OLWQd3jn64Qm8ZMyDjW9LK30bZaS0JJe4gBdhEUpVMMtAKi3m9yVasWVs4Q3/t1b
         uh9w==
X-Forwarded-Encrypted: i=1; AL+hErErsNzjKTX2Q151w5tcdVjkkiWQEMos8C/n4AHQemmIzrpmyfYLK5LNRx5akJlQfae7vlDHGLy6sNonL5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8svWeNdzL+BEspNU0Arni/i1IJbCmkgb7PrfZMB8pyFXmdZhX7
	gyzgZUfE4Oes555Obb4CaUTQrfKvLBQISInjSCQaT3zbgQyumRr+gqTS
X-Gm-Gg: AZFdTZcurHf2x89vDbxWcPP/Rdx/FS03Ato4BIzhp1ducvjPWn7epWHfmk5zAiV1Ouj
	xx51ODA4G0WiDTzkELV4ZSrUC7EaNqzrkqglaW6WSR3LBufQQ3s4KQDAgMeukjYPeH2ivLnJTo0
	t3FywR4jYw9q52sM7bShuXlzgMBycIb8DxuUPJTpX+ghlv1JIQxFtilTsfEuzG48cmN8eYn55u+
	ObQIaRq/yCYHmdQ+xngoFyqcOfjShTCgfc388h35kSzIfSnzbgaBSwhkMcdBZB4PJwoMXl7GB+O
	fK5zgaJ7aZnahLVy6OKkcMAzvsDRW99KqvW3b0bVeDcWUa+2BN3ZA0gbFIPSBFWrG6wxzcAwsxV
	ZBhLytajKSprL2nTnCeVP/IDgW2vGaEpoCsWjnO24nPyvIvcqDkwOTA2m52xBeTuQ0R8QU18QYM
	c/nJ9/HRCw10ikecKn/ptR/Yja2Rr/ickzQd70p9cJNl4/ihCZOeu+526yNJIPkK8U+OhD8xQ75
	CEiCYw08ruf3B+w0K9ZVJkxE2u57NOrW4R+NxIejX/p0Ydy2AqfD6AXXlj6vh9vI/ts5kNpO9xO
	LqdD95ieQh4yxPgg4goCMsIa01u4yk9kRAqmMQVTGtFLR+L6Ut88EGnheHwMK11uv1rAyu2Nnt9
	gHeoLk/FrA8+fDU6brrK19D5c++d9OWV2Zao=
X-Received: by 2002:a5d:64c9:0:b0:4a6:bc53:2478 with SMTP id ffacd0b85a97d-4abb0d5256fmr54313922f8f.13.1795872996813;
        Sat, 28 Nov 2026 05:36:36 -0800 (PST)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm54895678f8f.58.2026.11.28.05.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 05:36:36 -0800 (PST)
Date: Sat, 28 Nov 2026 15:36:33 +0200
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, Kurt Kanzenbach <kurt@linutronix.de>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v5 1/6] igb: don't touch rings that don't exist when
 disabling an XSK pool
Message-ID: <qyifvivvv45lstdhummsoji6jdlgxzkfcai5uet53w2spppj6g@amdcea4m54w5>
References: <20261124235723.1135808-1-antonio@mandelbit.com>
 <20261124235723.1135808-2-antonio@mandelbit.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20261124235723.1135808-2-antonio@mandelbit.com>

On 25 Nov 00:57, Antonio Quartulli wrote:
>xsk_get_pool_from_qid() checks the queue id against the stack's real
>queue counts, which can be higher than the number of rings the device
>has: on 82576, enabling VFs leaves a single Tx queue while keeping two
>Rx queues, and igb can fall back from MSI-X to MSI with a single queue
>on resume. Disabling the pool of such a queue, e.g. one bound to queue 1
>before enabling VFs, then passes a NULL Tx ring to
>igb_txrx_ring_disable().
>
>Only disable and re-enable the rings the device has: skip the queue if
>it has no Rx ring, and only the Tx part if it has no Tx ring, so that
>an Rx ring using the pool still stops using it. This also stops a NULL
>dereference when the socket is closed while the device is runtime
>suspended, which frees its rings.
>
>Tested with the 82576 emulated by QEMU and a zero-copy AF_XDP socket on
>queue 1: closing it after enabling a VF no longer oopses and the Rx ring
>no longer references the pool afterwards (checked with a debug print, as
>QEMU doesn't spread traffic over the PF queues with VFs), and without
>VFs queue 1 keeps receiving after the close. Not run under KASAN.
>
>Fixes: 80f6ccf9f116 ("igb: Introduce XSK data structures and helpers")
>Cc: stable@vger.kernel.org # 6.14+
>Link: https://lore.kernel.org/netdev/20261116153041.3002666-2-antonio@mandelbit.com/
>Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
>---
>v5: the message also mentions the runtime suspended case (no code
>changes)
>v4: also handle queues with an Rx but no Tx ring, as with VFs (Sashiko):
>tear down the Rx ring and skip only the Tx part; tested with a
>zero-copy AF_XDP socket; subject was "don't disable rings that don't exist
>..."
>v3: new patch.
>
> drivers/net/ethernet/intel/igb/igb_xsk.c | 37 +++++++++++++++++-------
> 1 file changed, 26 insertions(+), 11 deletions(-)
>
>diff --git a/drivers/net/ethernet/intel/igb/igb_xsk.c b/drivers/net/ethernet/intel/igb/igb_xsk.c
>index ce4a7b5..3b4212a 100644
>--- a/drivers/net/ethernet/intel/igb/igb_xsk.c
>+++ b/drivers/net/ethernet/intel/igb/igb_xsk.c
>@@ -31,15 +31,22 @@ static int igb_realloc_rx_buffer_info(struct igb_ring *ring, bool pool_present)
> 	return 0;
> }
>
>+/* With VFs, the device has a single Tx queue but can have more Rx queues */
>+static struct igb_ring *igb_xsk_tx_ring(struct igb_adapter *adapter, u16 qid)
>+{
>+	return qid < adapter->num_tx_queues ? adapter->tx_ring[qid] : NULL;
>+}
>+
> static void igb_txrx_ring_disable(struct igb_adapter *adapter, u16 qid)
> {
>-	struct igb_ring *tx_ring = adapter->tx_ring[qid];
>+	struct igb_ring *tx_ring = igb_xsk_tx_ring(adapter, qid);
> 	struct igb_ring *rx_ring = adapter->rx_ring[qid];
> 	struct e1000_hw *hw = &adapter->hw;
>
>-	set_bit(IGB_RING_FLAG_TX_DISABLED, &tx_ring->flags);
>-
>-	wr32(E1000_TXDCTL(tx_ring->reg_idx), 0);
>+	if (tx_ring) {
>+		set_bit(IGB_RING_FLAG_TX_DISABLED, &tx_ring->flags);
>+		wr32(E1000_TXDCTL(tx_ring->reg_idx), 0);
>+	}
> 	wr32(E1000_RXDCTL(rx_ring->reg_idx), 0);
>
> 	synchronize_net();
>@@ -47,24 +54,27 @@ static void igb_txrx_ring_disable(struct igb_adapter *adapter, u16 qid)
> 	/* Rx/Tx share the same napi context. */
> 	napi_disable(&rx_ring->q_vector->napi);
>
>-	igb_clean_tx_ring(tx_ring);
>+	if (tx_ring) {
>+		igb_clean_tx_ring(tx_ring);
>+		memset(&tx_ring->tx_stats, 0, sizeof(tx_ring->tx_stats));
>+	}
> 	igb_clean_rx_ring(rx_ring);
>-
> 	memset(&rx_ring->rx_stats, 0, sizeof(rx_ring->rx_stats));
>-	memset(&tx_ring->tx_stats, 0, sizeof(tx_ring->tx_stats));
> }
>
> static void igb_txrx_ring_enable(struct igb_adapter *adapter, u16 qid)
> {
>-	struct igb_ring *tx_ring = adapter->tx_ring[qid];
>+	struct igb_ring *tx_ring = igb_xsk_tx_ring(adapter, qid);
> 	struct igb_ring *rx_ring = adapter->rx_ring[qid];
>
>-	igb_configure_tx_ring(adapter, tx_ring);
>+	if (tx_ring)
>+		igb_configure_tx_ring(adapter, tx_ring);
> 	igb_configure_rx_ring(adapter, rx_ring);
>
> 	synchronize_net();
>
>-	clear_bit(IGB_RING_FLAG_TX_DISABLED, &tx_ring->flags);
>+	if (tx_ring)
>+		clear_bit(IGB_RING_FLAG_TX_DISABLED, &tx_ring->flags);
>
> 	/* call igb_desc_unused which always leaves
> 	 * at least 1 descriptor unused to make sure
>@@ -148,7 +158,12 @@ static int igb_xsk_pool_disable(struct igb_adapter *adapter, u16 qid)
> 		return -EINVAL;
>
> 	rx_ring = adapter->rx_ring[qid];
>-	if_running = netif_running(adapter->netdev) && igb_xdp_is_enabled(adapter);
>+	/* The stack can know more queues than the device has, e.g. after a
>+	 * fallback to fewer queues on resume: skip the rings it doesn't have.
>+	 */
>+	if_running = netif_running(adapter->netdev) &&
>+		     igb_xdp_is_enabled(adapter) &&
>+		     qid < adapter->num_rx_queues;
> 	if (if_running)
> 		igb_txrx_ring_disable(adapter, qid);
>
>-- 
>2.56.1
>
Reviewed-by: Janis Edvarts Lacis <janislacis06@gmail.com>
