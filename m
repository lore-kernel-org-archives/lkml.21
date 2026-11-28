Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795873064;
	b=XF1juwu8ad5H2sn8xQPnA+d9Ku0EPJecMvY58KHRO41sTGprWU8GXRmdj1KFfpt51RAv
	 auSlfVz1hN4VNTi7pBYvUjouuOpfW3LkxmWTNEXRldbgtEhTbqFVBWevcB9ZkwQZNDCoW
	 02IDAbYKlbiNcwIT7bEHEcJfRIS+bM3O0nM98OxW2Jb89IgWHIKgmzmug8Mr0QtlTMG6/
	 HT0pIGXqXxSil40RKh9HJqccJIvkNRh3YmmCxk1mMbVfnLYvLvHtow311FC4k5MELaSpg
	 xeP62aOMXE4RMARCGqmzIGVdnVADdqiRVgMNksXU0lE83RDsfmGZCO7GGKegMipSmNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0mQsJ7irUzhfshN0tVy8gRkAjHlT+WDYsqq+luK1uFo=;
	b=eS3o9Rj51d+tsFBzZlT/9N1c028qkwjDLIEF41hvk86WAM38lOGUJK8bh3kvnj3PtrFU
	 SkS2VeAJUsUkQRhmFugy57wBQ7pfBM3QXovmfAlkmlg6OttC0I2pnaoRl9iV7AeoZaRp4
	 lw0lob8Gcg2BvtsO2oGmr4EyjEk3xXKdgkaWgHdGR3whOF2PZzk6sx6I9tFJlA9ZIOF6k
	 kpwekpYrl1OccJWWH2Ze21bmyQEpMuaGD1gTIIGxwN1CZlrch80yikqAPmBhxNG5oT8Z7
	 I37Hx5MawY5SPNLa0bZHLwH1m3cSWSfUxwwSRLg3ki9T7gsSj2LWVHLcy9ojoflXDBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c83ls7qW;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039A0606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 039A0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c83ls7qW
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49412eb1474so5909264f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 05:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795873061; x=1796477861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0mQsJ7irUzhfshN0tVy8gRkAjHlT+WDYsqq+luK1uFo=;
        b=c83ls7qW2/KknVZj+0F1q51eokF9yp9C9u22UQAVaUTM+Yh88pTevE0dG2U11BztxZ
         en71a1QYNZmV9fHDiTT3J//5fmdhHWqf/0gWBcjhwoOAF6RB6C+XUze4t43XG1QCE+1S
         rRdu/NzIemkSoKBEJlTkY//i5N7H0f71lEB88nZuFbLhsLQv6xKoCK2jH2mcbT/FBJOs
         deyaTQycIMbcZH+KvciCkk04595y3sYQWC6MtG7eIfBMVfb5fWGPzb9ZwCvHfRuJHU6V
         0fYMTwnuC0c1lztfMdV/rZjLGLw+I66S49usyPPbZ2op4ap85Ws0iKhjs74q5k5R+hIm
         hv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795873061; x=1796477861;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mQsJ7irUzhfshN0tVy8gRkAjHlT+WDYsqq+luK1uFo=;
        b=QvPiOFYF176e8dN5b7mvurxl2YGxVv7GOtnpsckz/cgo1v0siQAVVg1I80GQX1cOmu
         S81ot8WhxbydHWVBYqqUFnCLtDAOlJOwj+EMjtpS+hEr71fleLhRpeG0FIPjsZFp3BtG
         v55Kif1W0akm4OU0ZyN4vmkGLdKRKm2XpsUByuop8ar7dlqhH9NlMsdxTFKT976qYUen
         FTbIjzmk91qXWXx2+m8zpav3UZsZfjCA0/E6/eAt0yn1FOfJUtayYsg1VWtAi1QfaAch
         vf80aZopwQsesRGteXoOz0PVLLN+YS34BUamFUwX636z+gXlfnGdKlZ63GUGeOMotSit
         bihQ==
X-Forwarded-Encrypted: i=1; AL+hErFz4eEnpL9Qz66Sm1oXYyX8ZsmuUH5Db+bfrzX6EnjKLH9BZgsUorauV5pQ6Q6Rs7Wiy2VZHLOsuFVyG9U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5OgKItBpCtQcNbgyVjDYrIvgnFcAUzYRl1E5JRAqMdTnRZJXf
	kiT2ZvEHvtwcbKuGjXxXPwAahP4DmjXuG5DCZ6e36IUR0TMOh01twMny
X-Gm-Gg: AZFdTZeUDn36YttVslRaQn/TfHCzGHiMJ6eCIF3iEkORAMyuwDFnS1pKgaLHnN1ulNr
	mgUZWaE9WXcHywQYYSnX8OMXcS54jSUhZt4vqC9m1u2Wy4SLeW6KIMsG4774XJLv0/JkzDb5fQ+
	nAuBkeCt8XTRPm629Vv07tcVHzQmuxo/LYzR9Ay+Xh+GD1uAuhyRwP3GwLMb8IAymoCvptzwpyZ
	zIRvEtdGgeqjGKtbaqEiRhdq4CENq6yCwiRc0EY1I5208EU7ia8BGROPp9nNhhj120pstagJoNa
	mIY0E8EhUS6Cx3+xyU+JL44RCeiW/op6a+x/iB4tM4Wz4WArwcKakZTw/9bStNWi3/2a2mhn9U+
	AnmKAW9LC0wPVZBA0LYVhio+O168Whpt72GuZ9tmqINjDWvYc1nuFMWYdbOVKyDa3OpTwIIeC6i
	VZah947Lfqe06YHd/+HYz0rrlJS4zL2CZjWBY1DEseule7vQ5Jl0rcGyvZy0wGASxAo6HT4XPKS
	OUB6UGwdL3UR1syBYa0iG11bpbGo4H1R5L/CGG9ltQ8Sip1Oma/lFuLPZHdxSu1fyMgLYWnjXPU
	hhIMk3/z6h2Bt/LjHfGmkwbqTwZCMZqy7sVUb7jU2RcatYoivrvBBhhS1UP9IKw056wbNtrg2CQ
	+QbzJ4e6POUeSEkOuLmbHncL3vNs0PhurUV0=
X-Received: by 2002:a05:6000:4a0e:b0:48b:451:4f19 with SMTP id ffacd0b85a97d-4abb7971c1dmr52301677f8f.51.1795873061121;
        Sat, 28 Nov 2026 05:37:41 -0800 (PST)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm54300422f8f.3.2026.11.28.05.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 05:37:40 -0800 (PST)
Date: Sat, 28 Nov 2026 15:37:39 +0200
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net v5 2/6] igb: fix RTNL assertion when resuming from
 runtime suspend
Message-ID: <mopuzlp25nt2tl5yogp2uwfhyw5jomop2lver6lx4ohcymxbk6@mnofvjbmjwz4>
References: <20261124235723.1135808-1-antonio@mandelbit.com>
 <20261124235723.1135808-3-antonio@mandelbit.com>
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
In-Reply-To: <20261124235723.1135808-3-antonio@mandelbit.com>

On 25 Nov 00:57, Antonio Quartulli wrote:
>Since commit ac8c58f5b535 ("igb: fix deadlock caused by taking RTNL in
>RPM resume path") __igb_resume() doesn't take RTNL for runtime resume,
>but __igb_open() still calls netif_set_real_num_{tx,rx}_queues(), which
>require it. An asynchronous runtime resume (e.g. after the link comes
>back) then triggers "RTNL: assertion failed".
>
>Only set the real queue counts in __igb_open() when RTNL is held (open
>and system sleep resume), and set them from a work item taking RTNL on
>runtime resume. Until it runs, after a fallback to fewer queues on
>resume (MSI-X to MSI), the stack can use queues the device doesn't
>have: drop those packets in igb_xmit_frame() instead of mapping several
>stack queues, each with its own xmit lock, onto the same ring. The
>stack can't be kept off those queues instead, as __igb_open() and
>netif_device_attach() start all of them and changing the count needs
>RTNL.
>
>Tested with the 82576 emulated by QEMU.
>
>Fixes: ac8c58f5b535 ("igb: fix deadlock caused by taking RTNL in RPM resume path")
>Cc: stable@vger.kernel.org
>Closes: https://bugzilla.ipfire.org/show_bug.cgi?id=13562
>Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
>---
>v5: no changes
>v4: no changes
>v3:
>- set the real queue counts when RTNL is held (open and system sleep
>  resume), and from a work item on runtime resume, instead of not at all
>  on resume (Janis, Sashiko)
>- until then, drop packets for queues the device doesn't have
>- stable: netif_set_real_num_queues() needs 5.15+ and
>  dev_core_stats_tx_dropped_inc() 5.18+; older backports can use the
>  separate tx/rx calls and netdev->stats.tx_dropped
>v2:
>- keep setting the queue counts in __igb_open() after igb_request_irq(),
>  only skipping them on resume (Sashiko)
>- drop the reference to igc
>
>Note: igc has the same issue: it sets the real queue counts only in
>igc_open(), before requesting the IRQs, and never on resume. A fix will
>follow separately once it has been tested on igc hardware (Joe offered
>to test).
>
> drivers/net/ethernet/intel/igb/igb.h      |  1 +
> drivers/net/ethernet/intel/igb/igb_main.c | 73 ++++++++++++++++-------
> 2 files changed, 54 insertions(+), 20 deletions(-)
>
>diff --git a/drivers/net/ethernet/intel/igb/igb.h b/drivers/net/ethernet/intel/igb/igb.h
>index 8c9b020..79d7fcc 100644
>--- a/drivers/net/ethernet/intel/igb/igb.h
>+++ b/drivers/net/ethernet/intel/igb/igb.h
>@@ -586,6 +586,7 @@ struct igb_adapter {
>
> 	struct work_struct reset_task;
> 	struct work_struct watchdog_task;
>+	struct work_struct rtnl_resume_task;
> 	bool fc_autoneg;
> 	u8  tx_timeout_factor;
> 	struct timer_list blink_timer;
>diff --git a/drivers/net/ethernet/intel/igb/igb_main.c b/drivers/net/ethernet/intel/igb/igb_main.c
>index d4a897a..2f51edc 100644
>--- a/drivers/net/ethernet/intel/igb/igb_main.c
>+++ b/drivers/net/ethernet/intel/igb/igb_main.c
>@@ -110,6 +110,7 @@ static void igb_init_queue_configuration(struct igb_adapter *adapter);
> static int igb_sw_init(struct igb_adapter *);
> int igb_open(struct net_device *);
> int igb_close(struct net_device *);
>+static void igb_rtnl_resume_task(struct work_struct *);
> static void igb_configure(struct igb_adapter *);
> static void igb_configure_tx(struct igb_adapter *);
> static void igb_configure_rx(struct igb_adapter *);
>@@ -3426,6 +3427,7 @@ static int igb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>
> 	INIT_WORK(&adapter->reset_task, igb_reset_task);
> 	INIT_WORK(&adapter->watchdog_task, igb_watchdog_task);
>+	INIT_WORK(&adapter->rtnl_resume_task, igb_rtnl_resume_task);
>
> 	/* Initialize link properties that are user-changeable */
> 	adapter->fc_autoneg = true;
>@@ -3889,6 +3891,7 @@ static void igb_remove(struct pci_dev *pdev)
>
> 	cancel_work_sync(&adapter->reset_task);
> 	cancel_work_sync(&adapter->watchdog_task);
>+	cancel_work_sync(&adapter->rtnl_resume_task);
>
> #ifdef CONFIG_IGB_DCA
> 	if (adapter->flags & IGB_FLAG_DCA_ENABLED) {
>@@ -4123,10 +4126,31 @@ static int igb_sw_init(struct igb_adapter *adapter)
> 	return 0;
> }
>
>+/* Some settings need RTNL, which isn't held when resuming from runtime
>+ * suspend: apply them from here instead, if the device is still up.
>+ */
>+static void igb_rtnl_resume_task(struct work_struct *work)
>+{
>+	struct igb_adapter *adapter = container_of(work, struct igb_adapter,
>+						   rtnl_resume_task);
>+
>+	rtnl_lock();
>+	if (!test_bit(__IGB_DOWN, &adapter->state) &&
>+	    netif_running(adapter->netdev)) {
>+		if (netif_set_real_num_queues(adapter->netdev,
>+					      adapter->num_tx_queues,
>+					      adapter->num_rx_queues))
>+			netdev_err(adapter->netdev,
>+				   "error setting real queue count\n");
>+	}
>+	rtnl_unlock();
>+}
>+
> /**
>  *  __igb_open - Called when a network interface is made active
>  *  @netdev: network interface device structure
>  *  @resuming: indicates whether we are in a resume call
>+ *  @rtnl_held: indicates whether RTNL is held
>  *
>  *  Returns 0 on success, negative value on failure
>  *
>@@ -4136,7 +4160,8 @@ static int igb_sw_init(struct igb_adapter *adapter)
>  *  handler is registered with the OS, the watchdog timer is started,
>  *  and the stack is notified that the interface is ready.
>  **/
>-static int __igb_open(struct net_device *netdev, bool resuming)
>+static int __igb_open(struct net_device *netdev, bool resuming,
>+		      bool rtnl_held)
> {
> 	struct igb_adapter *adapter = netdev_priv(netdev);
> 	struct pci_dev *pdev = adapter->pdev;
>@@ -4179,16 +4204,15 @@ static int __igb_open(struct net_device *netdev, bool resuming)
> 	if (err)
> 		goto err_req_irq;
>
>-	/* Notify the stack of the actual queue counts. */
>-	err = netif_set_real_num_tx_queues(adapter->netdev,
>-					   adapter->num_tx_queues);
>-	if (err)
>-		goto err_set_queues;
>-
>-	err = netif_set_real_num_rx_queues(adapter->netdev,
>-					   adapter->num_rx_queues);
>-	if (err)
>-		goto err_set_queues;
>+	/* Notify the stack of the actual queue counts. This needs RTNL: on
>+	 * runtime resume igb_rtnl_resume_task() does it.
>+	 */
>+	if (rtnl_held) {
>+		err = netif_set_real_num_queues(netdev, adapter->num_tx_queues,
>+						adapter->num_rx_queues);
>+		if (err)
>+			goto err_set_queues;
>+	}
>
> 	/* From here on the code is the same as igb_up() */
> 	clear_bit(__IGB_DOWN, &adapter->state);
>@@ -4242,7 +4266,7 @@ err_setup_tx:
>
> int igb_open(struct net_device *netdev)
> {
>-	return __igb_open(netdev, false);
>+	return __igb_open(netdev, false, true);
> }
>
> /**
>@@ -6617,12 +6641,7 @@ cleanup_tx_tstamp:
> static inline struct igb_ring *igb_tx_queue_mapping(struct igb_adapter *adapter,
> 						    struct sk_buff *skb)
> {
>-	unsigned int r_idx = skb->queue_mapping;
>-
>-	if (r_idx >= adapter->num_tx_queues)
>-		r_idx = r_idx % adapter->num_tx_queues;
>-
>-	return adapter->tx_ring[r_idx];
>+	return adapter->tx_ring[skb->queue_mapping];
> }
>
> static netdev_tx_t igb_xmit_frame(struct sk_buff *skb,
>@@ -6636,6 +6655,17 @@ static netdev_tx_t igb_xmit_frame(struct sk_buff *skb,
> 	if (skb_put_padto(skb, 17))
> 		return NETDEV_TX_OK;
>
>+	/* After a fallback to fewer queues on runtime resume, the stack can
>+	 * use more queues than the device has until igb_rtnl_resume_task()
>+	 * updates it: drop those packets instead of sharing a ring between
>+	 * queues, which aren't serialized with each other.
>+	 */
>+	if (unlikely(skb->queue_mapping >= adapter->num_tx_queues)) {
>+		dev_kfree_skb_any(skb);
>+		dev_core_stats_tx_dropped_inc(netdev);
>+		return NETDEV_TX_OK;
>+	}
>+
> 	return igb_xmit_frame_ring(skb, igb_tx_queue_mapping(adapter, skb));
> }
>
>@@ -9639,8 +9669,11 @@ static int __igb_resume(struct device *dev, bool rpm)
>
> 	if (!rpm)
> 		rtnl_lock();
>-	if (!err && netif_running(netdev))
>-		err = __igb_open(netdev, true);
>+	if (!err && netif_running(netdev)) {
>+		err = __igb_open(netdev, true, !rpm);
>+		if (!err && rpm)
>+			schedule_work(&adapter->rtnl_resume_task);
>+	}
>
> 	if (!err)
> 		netif_device_attach(netdev);
>-- 
>2.56.1
>
Reviewed-by: Janis Edvarts Lacis <janislacis06@gmail.com>
