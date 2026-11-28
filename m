Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795873084;
	b=4Xhc3MBsykXd8NmOBsL/vmahgNsmPc+eBjwO8uXyutTillPg1t956v5rmd/Gqv8GFK+L
	 OVDesXmYSDo3bTjdDe8XfHbDqTbnVl8nokZaZHRWwetBBEAsWgfCmWkdOFaEX8qkMmB6p
	 9TtWnLFLpE/MH42BAvdHjfWVbpLAAzZXwZoeNY1ORVQNMm16QNrfK106K4D7C3hwwQ8Dh
	 YdvMCu+DnvYZH16dlDQB6GbI5lzzlZdUM4Mi4DARrAamlrvUkUDBqyy8MlR1Kf9C7wo13
	 aIYohtqYwIfkK4ntVIXyKpLMlBRoES7ZQGduAr4aXyH1klHiOFry5ZySMEnneOj/7ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PmOWW/21uAJZG68ORk4wUvCX50AXcNvmfcHlnPOThNM=;
	b=cU5dvu8F+gWJLJqLl+fb2fgG43vQ87Z20UclPypAg0UHtvTSWQV/11YBZRuA6o3tiPmQ
	 sOJVyvEk+L9YgQrv7sFu6enq+zaRCQxJNVTeUIsX7Z/xHn74WSUpzOTTcSDue2Pzd2Xag
	 vKXAAWLcTtn1FebcYFr6xWqxCkFMyEHJHQVrscp7D4eRPV72U3hTGakAhDQX7GtjUWP4O
	 JPXRn4MJt+qVwGCT2e1r5Cr8oiTMWJo5obZW5FHGvEqY+pPL/Bj8IKPiN2riTyBPJZgk3
	 b4cEQ7utTsip5V8i7Xmvc12xdax/8YlSuqcG/poHlu7bfvBR4Vqw7hu7Wc8SItnmB5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E5CQcYzf;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA739606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA739606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E5CQcYzf
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so4894487f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 05:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795873082; x=1796477882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PmOWW/21uAJZG68ORk4wUvCX50AXcNvmfcHlnPOThNM=;
        b=E5CQcYzf1N40Lt3sqLA4SgzhJnJkPbsgPaqe2+Trm8pzzd7Bi9dzRbw1Zg4H3QF0OZ
         8Eu2RN2uOWmvf/RgS9D1q2Wtd9FuW1WJS9GaJHB9pwpeXf+WjPmrJlixe9rE9uOX4TVF
         X8grAzifmF4D8hCcCkQQNDZy+kH1S2rX6tyilEdhaSnnl/X20bUp7PhA/ySTDshysQva
         7+qECHnq16c2rOIs+P5E8+UIlobmFXgtoy2mXenqErIF0A80op1n9mHFKWbtk/cp7Lk6
         MRpbPz8E3g4rgmUM36Y+9vp+0JdweHPa7KOYYM+RebKDvUsf/VDihCbsDQZNXaJIAtAn
         60zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795873082; x=1796477882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmOWW/21uAJZG68ORk4wUvCX50AXcNvmfcHlnPOThNM=;
        b=sI/C4dhH9iKPBHjPfg9MsGPSdT3ZM7Il2IluxrJ3vl5Vvvu7EOxzYausfrPJlDi8X5
         R3VZNyLp0WLUM9efIZzKK/iSiXLoB56RouDxQWE5aj87fS+cT3g3gS2mydZA9xuslAIu
         A6A44PLtSIc+7wK+8OlO3X00wy4zVXLcUxk2FjCKG3OiRPkmiwGeJ6y3/5Qd/v2+WdBT
         mRccgJVD2JMo8H2ZvVKRdSPkcX6pnmBGa0FbKAkue0EWrgK6CpCpAHfQXdz67AUxJYsh
         fVJUX8qumt7FzBJ1/oEM9kXWL/eaQPmOAsFl4MefkEfZv0IHcOlXQSpU3k1abRe2ysmP
         T0tg==
X-Forwarded-Encrypted: i=1; AL+hErGaIjCvziocnuggSKeWM7uii5+bPdiSWdodocB0lM6KfFTklObFYUEtWcqjok5YsPWrG2l7YPSZmVT/Seo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y7Y4p/puvS/xfILjWteP6oCpgPDG4NcNrf6YUtyrXlfEZVsrb
	eUq7vAiIBnTWOGcrLmCR7UL/5PAOpSPThRxCkQ2B/2XI5zZRXJu5psB3
X-Gm-Gg: AZFdTZddyIXQI7v23fFUH/qT3SK+L7AY1+FLznKOU4+YyRENLKxsJTJyPlqrOYoossZ
	DRwrqmEuMHIO/eUv+VwzSGjvgKOWjZDtgO3nsL4SSE10X6GxBqvY4WGoiXq6bl4wvDuPiJXZoPJ
	ir+MPR4RyLVcONFgC/tDC+el5TKfGooOy1ziP0ZxebU8QMaaHofv5KGAfi7UwvTwThAvBuO9Yj8
	fQbyCg6JyLKzs+aZcuPxFmH9UOe2aHmvX1SYpulDIKP65YiivbMM0hEY/A+BuoJBpi1pUP5LtGX
	AnIiNiHAhS58W0xx1/whRSkbU1iKX77fd4y9cIp4UbIV4zymJfuU0TGlx7QZ3+1SxZIXxn+zaBz
	d4kdgJ1ZiIqDHrOK+BfCKxZ19rSeSmpt9zE0SKQe/PqESKFINR8l3Bb4VFWPZvtjhIFoB7pFHk2
	onpmZGDoGe7pAp33KxllswPqEn8rgKE04KbRfMT4Sv0ByWy/JwTwqPuk1SEL6eiyr/sCwzUGnAT
	ewcc8OlXByqVSHKf8PBkL/hbgXjIF8pxqkU2L3p50w9e6tQJaMv2POv0HkwcDDF8E5tEB8h5OcU
	u0exb6g4vmbcnla4hs3Gw2Djs9Mbr0ttPljkW5SMryfEsCRHzdIL+L0YO6autAMCEGPxoSWiiLU
	egylmp4d0KpG+G7Hx5l5aMYa6NKlNCA+Wd515OKysBELjY82boSkbmZzj
X-Received: by 2002:a05:600c:530f:b0:4bb:68b9:f615 with SMTP id 5b1f17b1804b1-4bb88810b22mr557268675e9.17.1795873081828;
        Sat, 28 Nov 2026 05:38:01 -0800 (PST)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm867254155e9.10.2026.11.28.05.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 05:38:01 -0800 (PST)
Date: Sat, 28 Nov 2026 15:37:59 +0200
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v5 3/6] igb: keep the stack's Rx queues that still
 have an XSK pool
Message-ID: <jecu26h33ryodbwaalfgihqzgb7axxffhwtboi4orym42pfcsn@7x7cx4r76rin>
References: <20261124235723.1135808-1-antonio@mandelbit.com>
 <20261124235723.1135808-4-antonio@mandelbit.com>
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
In-Reply-To: <20261124235723.1135808-4-antonio@mandelbit.com>

On 25 Nov 00:57, Antonio Quartulli wrote:
>When igb lowers its queue counts by itself, after a fallback from MSI-X
>to MSI on resume or when enabling VFs, xsk_get_pool_from_qid() doesn't
>find the pool of a socket bound to a removed queue anymore. Disabling
>it then fails ("Failed to disable zero-copy!") and the pool's DMA
>mappings are never unmapped.
>
>ethtool refuses to remove a queue that still has an XSK pool, but igb
>can't refuse a VF enable or a resume fallback. Keep the real Rx queue
>count up to the highest queue that still has an XSK pool instead, so
>that the pool can still be disabled, and lower it at the next open. The
>Tx count follows the device: an XSK pool is always bound to both an Rx
>and a Tx queue, and the lookup finds it through the Rx one.
>
>Tested with the 82576 emulated by QEMU and a zero-copy AF_XDP socket,
>bound to queue 2 when enabling a VF, and to queue 1 across a runtime
>resume forced to use MSI with a single queue (with a test hook): closing
>it warned and leaked before, not anymore.
>
>Fixes: 80f6ccf9f116 ("igb: Introduce XSK data structures and helpers")
>Cc: stable@vger.kernel.org # 6.14+
>Reported-by: Janis Edvarts Lacis <janislacis06@gmail.com>
>Closes: https://lore.kernel.org/netdev/xupy6jbpnziq2qji54zjbvm7neggrwkxg3sfrhlolmrd6ysifl@zptk6ynkbu5f/
>Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
>---
>v5: new patch (Janis)
>
> drivers/net/ethernet/intel/igb/igb_main.c | 27 ++++++++++++++++++-----
> 1 file changed, 22 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/net/ethernet/intel/igb/igb_main.c b/drivers/net/ethernet/intel/igb/igb_main.c
>index 2f51edc..6961646 100644
>--- a/drivers/net/ethernet/intel/igb/igb_main.c
>+++ b/drivers/net/ethernet/intel/igb/igb_main.c
>@@ -4126,6 +4126,26 @@ static int igb_sw_init(struct igb_adapter *adapter)
> 	return 0;
> }
>
>+/* ethtool refuses to remove a queue that still has an XSK pool. igb can't
>+ * refuse when it lowers its queue counts by itself, so keep the stack's Rx
>+ * queue instead, or the pool couldn't be disabled anymore: lower the count
>+ * once it's gone, at the next open.
>+ */
>+static int igb_set_real_num_queues(struct igb_adapter *adapter)
>+{
>+	struct net_device *netdev = adapter->netdev;
>+	unsigned int rxq = adapter->num_rx_queues;
>+	unsigned int i;
>+
>+	for (i = netdev->real_num_rx_queues; i > rxq; i--)
>+		if (xsk_get_pool_from_qid(netdev, i - 1)) {
>+			rxq = i;
>+			break;
>+		}
>+
>+	return netif_set_real_num_queues(netdev, adapter->num_tx_queues, rxq);
>+}
>+
> /* Some settings need RTNL, which isn't held when resuming from runtime
>  * suspend: apply them from here instead, if the device is still up.
>  */
>@@ -4137,9 +4157,7 @@ static void igb_rtnl_resume_task(struct work_struct *work)
> 	rtnl_lock();
> 	if (!test_bit(__IGB_DOWN, &adapter->state) &&
> 	    netif_running(adapter->netdev)) {
>-		if (netif_set_real_num_queues(adapter->netdev,
>-					      adapter->num_tx_queues,
>-					      adapter->num_rx_queues))
>+		if (igb_set_real_num_queues(adapter))
> 			netdev_err(adapter->netdev,
> 				   "error setting real queue count\n");
> 	}
>@@ -4208,8 +4226,7 @@ static int __igb_open(struct net_device *netdev, bool resuming,
> 	 * runtime resume igb_rtnl_resume_task() does it.
> 	 */
> 	if (rtnl_held) {
>-		err = netif_set_real_num_queues(netdev, adapter->num_tx_queues,
>-						adapter->num_rx_queues);
>+		err = igb_set_real_num_queues(adapter);
> 		if (err)
> 			goto err_set_queues;
> 	}
>-- 
>2.56.1
>
Reviewed-by: Janis Edvarts Lacis <janislacis06@gmail.com>
