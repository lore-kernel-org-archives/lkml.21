Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795549517;
	b=kGMwBGdZP1tPG08Imh+R7p6VSCLdElgz/TXqV69Vvvehf/tP2uRuWHyFyVp+409zgYht
	 PaYwIfU4K2sn/LqFBMJI6Og3nyyAbNZmItWnlMP+aCgnVtifsNi38juGYOXRHvxBV6K6Y
	 Pwchhj3Llb3wFHh5uBYH8uthcF6c2mlqnOqwm5cLCx5bFZCQ0K2ggUpG6y3sOBPRfhMLp
	 frJbg/+7h+Bt/Q1cmC4P+DSCb2/tP19X6gEoPuMKCesvCisEZhi1X013FekRtEGTgeVcE
	 Nb8QVnTMzvIeEQaOT/ivWhM56hBDwpqWB7vfERwKtHhDeNC8Xn9szY+ycEAyUUsm/LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795549517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=JiYqJ8pWSXf2zuz3CaHvcAmXxPwkVTLsHQb8M9JN5M0=;
	b=xgMqc+J7ulD4bpo0GF3/0taQeO4ZFZ5HBHxbMKSSwHiIDRyrgcKnhOAOb9dvPHYGiVY1
	 1QL97asOHE9EZAm2ch1V9Npo35DbFtXeBjay9g1FBHg95URIHX6tMuPG998DTsZ73KNeA
	 ZXpRKkOH1mGUCJ9GXuD6XIrPQWqLoLsN04iCBfcE1YF4hkYABGzSDMrmgg/U7iBTeUy7L
	 iZHyECGblE+UCRITg5kC4gd+k1AStM7epo6cVBO5f4y6XyJEnnio+SfTJOsrKzBQPH+9P
	 r2ZdY8+2R47vdfjfEh11MrjFHeW2/xFryqZ9LE+OlnRlkDm3cOFCcHv0WcNUaAEA6qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QfHcjZyL;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B1A606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46B1A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QfHcjZyL
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so4018047a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795549515; x=1796154315; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JiYqJ8pWSXf2zuz3CaHvcAmXxPwkVTLsHQb8M9JN5M0=;
        b=QfHcjZyLxYJIfWaGX4EKpOM9Vae2nnop4nwtgKsxgQPASWgPdudgT4kxkHdI9dIUSi
         Rk7A08/r4dpXqmnPhbZBoltj9XucbqYSu5QTIG9uNgmKMwGo/SD6/KoIR7UAln4WhaX7
         NRvz+l19OR6AQ/v8TI3S4R66pBUzAoel/1eTLtIR0z66pjI88IJ8SFCClLSEeaaZ/cme
         h5xCNLlYRu5/VNh+ww08Y+4/kLRwkFM4pj4w5xH5ZuaUpY67rz/iJNkW38+u/hY8hh9v
         KVd132ZMDq2b7plQXVqJ7sfw7VLXvJUVpI0zkb/qO8FAr2YDaJZUsF+8IubFeLbcTzkC
         2lSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795549515; x=1796154315;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:mail-followup-to:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JiYqJ8pWSXf2zuz3CaHvcAmXxPwkVTLsHQb8M9JN5M0=;
        b=AN1wdmi9p2wis89VBK46hZuy+y7s23voAtGLPRyMg95iFytkD4UBE9PSYbPaK+zbUd
         AKKRB+y++gDCV9HSCECkoIcs0oQkE8ks3TUU0HaaWaVqI0h5rTB25T2Bl3ui+PmYp6BK
         Yc6mt+RdIZ9gNqzB6EckCQmzN2pXGciMGvz0PVkytNWITPBkUvxOJ7cc11Oq5RXOj5PR
         c6m2f0gUhm8ssbk/4o5YYsIk8zCQqjZnrg146767p9sqW0UQ/xDHs0JXqeJGBFiKct+c
         ywt432SNyKhajJcGZ63B130iPJjkhVoaSYGFxJmhiLzpZknW2hZFns+zM+VS/JduCARA
         Ge5A==
X-Forwarded-Encrypted: i=1; AL+hErFrncjz3O3YXQONNhqPOmjMmDVq9E555NGYsGS6rZJpu4/tWd6+RYVRCx3Fz6GU/ZfNEznhAQ61XMnijjY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JmPESudzQB5Uz62urcDw7H1W69WrckcdwdkTJaZd9CbYsvZ1n
	PmFqTa5Ht9qDO9UGsNxsgBgm5gQYUbFmP4PMK119ygj8jiqBP1mUz8zxwO3CnaNRG34=
X-Gm-Gg: AZFdTZebNte/siJIQM6s4ZTXhkZWgBnUJFuaCNlI/MlSrf8vWoikI7Kcn4BjAPRHN5O
	QxN4AOLUCj7UzyQoagPzlDfFPso9BiFc6fO+q9dBoYPdCOl28+Fy+opm0oQDzAQ8hJZHgmGpj+U
	8gXC03GoyHIk66irIeWtYL4XG4mrUGbwvIKA4MRIQmsMIhQ3yRk/yO1n8tYQwBC88KCOSoRvOuO
	jtavfKQxjZyJVTc0N4ZsTDI9NBNtWcHSYDcX8BRrYZ27lSXYDyvo1Q+/2K3H1qQGRvYQyv4PO7C
	AI4JYseJNBSdfmjHJF3tqXIfxso5eI03gq4+cNZyXa1sDnreXHmQDMvXY27+vstnh7D++8NU83F
	ZbGGLPzNbR0QCBKtbSf4pLh8xjSxcbblKiy9tzvVHMnosoVydcsR2iypyxB2VUwd4cBHG7kDKxK
	NUzQ+XRLFs+UuMaoBp2vsg3wNQ2xCLYHG7UWq+BJzg3+OUs8oUTCskbjv5sUPNeHZkqPWQBhUkB
	/e3rGlIhom6nF/NOm2nL0szUtbBzdfMWa1PoVtXhy76TwHFGacwwAGbjlkCK+xyKj8fzBsZEUw+
	lKytd7YaG6RvqmLk+YAaTlhfDMGdAvpZ+kdYup9fqp4=
X-Received: by 2002:a17:90b:2f8c:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3b41c92a2c1mr14856690a91.31.1795549515465;
        Tue, 24 Nov 2026 11:45:15 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4c::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm24496842a91.6.2026.11.24.11.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:45:14 -0800 (PST)
Date: Tue, 24 Nov 2026 11:45:14 -0800
From: Joe Damato <joe@dama.to>
To: Mark Bloch <mbloch@nvidia.com>
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, edumazet@google.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com, linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/5] net/mlx4: track whether a TX doorbell is
 pending
Message-ID: <awXpStIV4ZnZYvJC@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Mark Bloch <mbloch@nvidia.com>,
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, edumazet@google.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com, linux-rdma@vger.kernel.org
References: <20261117155353.2250540-1-joe@dama.to>
 <20261117155353.2250540-5-joe@dama.to>
 <add5a54b-eaa7-4507-b089-6a6c330c39b6@nvidia.com>
 <9fb09021-bd62-4a96-9218-7c2e0739734e@redhat.com>
 <fb13f8ff-41ed-4464-a182-cabbe7028ffe@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb13f8ff-41ed-4464-a182-cabbe7028ffe@nvidia.com>

On Tue, Nov 24, 2026 at 02:08:37PM +0200, Mark Bloch wrote:
> 
> 
> On 24/11/2026 13:55, Paolo Abeni wrote:
> > On 11/24/26 11:46, Mark Bloch wrote:
> >> On 17/11/2026 17:53, Joe Damato wrote:
> >>> When the stack sets xmit_more, mlx4_en_xmit() skips the doorbell and
> >>> relies on a later call in the same batch to write it. Nothing records
> >>> that a doorbell is owed, so a path that ends the batch without writing
> >>> the doorbell leaves the WQEs posted before it unannounced to HW.
> >>>
> >>> Add ring->doorbell_pending, set when the doorbell is deferred and
> >>> cleared whenever a doorbell or a BlueFlame write is issued, so such a
> >>> path can flush the deferred doorbell.
> >>>
> >>> Place the flag in the cache line dirtied by mlx4_en_xmit(), next to
> >>> prod. That line has no room left, so move tx_dropped, which is only
> >>> written when an skb is dropped, to the end of the struct among the
> >>> fields not used in the fast path.
> >>>
> >>> Signed-off-by: Joe Damato <joe@dama.to>
> >>> Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
> >>> ---
> >>> v2:
> >>>    - doorbell_pending moved to the area of the struct marked as cache line
> >>>      used and dirtied in mlx4_en_xmit. In exchange, tx_dropped is moved
> >>>      among fields not written in the fast path. It is only written for
> >>>      drops and is read for stats.
> >>>    - Update the commit message.
> >>>
> >>>   drivers/net/ethernet/mellanox/mlx4/en_tx.c   | 9 +++++++--
> >>>   drivers/net/ethernet/mellanox/mlx4/mlx4_en.h | 3 ++-
> >>>   2 files changed, 9 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
> >>> index 97f27e005810..123071a47bed 100644
> >>> --- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
> >>> +++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
> >>> @@ -194,6 +194,7 @@ int mlx4_en_activate_tx_ring(struct mlx4_en_priv *priv,
> >>>       ring->prod = 0;
> >>>       ring->cons = 0xffffffff;
> >>>       ring->last_nr_txbb = 1;
> >>> +    ring->doorbell_pending = false;
> >>>       memset(ring->tx_info, 0, ring->size * sizeof(struct mlx4_en_tx_info));
> >>>       memset(ring->buf, 0, ring->buf_size);
> >>>       ring->free_tx_desc = mlx4_en_free_tx_desc;
> >>> @@ -757,6 +758,7 @@ void mlx4_en_xmit_doorbell(struct mlx4_en_tx_ring *ring)
> >>>       iowrite32be(
> >>>   #endif
> >>>             (__force u32)ring->doorbell_qpn, ring->doorbell_address);
> >>> +    ring->doorbell_pending = false;
> >>
> >> Can we keep this in mlx4_en_xmit()? XDP_TX calls this helper too, but
> >> tracks its pending doorbell in a local variable. If the XDP TX ring
> >> stays full for the whole poll, this store can dirty the producer cache
> >> line even though we didn't post a single WQE.
> > 
> > I guess you quote the wrong slice of code and that you are referring to
> > mlx4_en_tx_write_desc(), right?
> 
> 
> I meant the clear in mlx4_en_xmit_doorbell(). There are two paths to it:
> 
> skb TX:
> mlx4_en_xmit() -> mlx4_en_tx_write_desc() -> mlx4_en_xmit_doorbell()
> 
> XDP_TX:
> mlx4_en_poll_rx_cq() -> mlx4_en_process_rx_cq() -> mlx4_en_xmit_doorbell()
> 
> In the XDP_TX case, mlx4_en_process_rx_cq() passes its local
> doorbell_pending by address to mlx4_en_xmit_frame(). If the TX ring is
> full, mlx4_en_xmit_frame() sets that flag and returns NETDEV_TX_BUSY
> without advancing ring->prod. At the end of the poll, the local flag
> causes mlx4_en_process_rx_cq() to call mlx4_en_xmit_doorbell()
> directly. The new clear can therefore dirty the producer cache line
> even if the poll posted no WQEs.
> 
> >> diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
> >> index c5d564e5a581..9d8a4ea473f1 100644
> >> --- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
> >> +++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
> >> @@ -1074,6 +1074,7 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
> >>          send_doorbell = __netdev_tx_sent_queue(ring->tx_queue,
> >>                                                 tx_info->nr_bytes,
> >>                                                 netdev_xmit_more());
> >> +       ring->doorbell_pending = !send_doorbell;
> >>
> >>          real_size = (real_size / 16) & 0x3f;
> > 
> > AFAICS, preserving the state across poll() invocation is needed
> > for correctness. To avoid writing the cacheline in the XDP case,
> > mlx4_en_tx_write_desc() could return the new ring->doorbell_pending
> > value.
> 
> The proposed assignment still saves the state in ring->doorbell_pending,
> so the next mlx4_en_xmit() sees it. Returning the value from
> mlx4_en_tx_write_desc() would work too. I suggested using !send_doorbell
> because mlx4_en_xmit() already has that value and it covers BlueFlame
> as well. Patch 5 would then clear the flag after the drop path flush

Thanks for the review, Mark, and thanks Paolo for taking a look.

Mark's version seems better to me, so I'll go with that and send a v3. In
patch 5, I'll factor out the logic of clearing the flag into a helper.

Here's what patches 4 and 5 of v3 look like:

[omitting the data structure change from patch 4, which is unchanged]

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 97f27e005810..b98eb9edf4a9 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -194,6 +194,7 @@ int mlx4_en_activate_tx_ring(struct mlx4_en_priv *priv,
        ring->prod = 0;
        ring->cons = 0xffffffff;
        ring->last_nr_txbb = 1;
+       ring->doorbell_pending = false;
        memset(ring->tx_info, 0, ring->size * sizeof(struct mlx4_en_tx_info));
        memset(ring->buf, 0, ring->buf_size);
        ring->free_tx_desc = mlx4_en_free_tx_desc;
@@ -1099,6 +1100,7 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
        send_doorbell = __netdev_tx_sent_queue(ring->tx_queue,
                                               tx_info->nr_bytes,
                                               netdev_xmit_more());
+       ring->doorbell_pending = !send_doorbell;

        real_size = (real_size / 16) & 0x3f;


and patch 5:

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index b98eb9edf4a9..944146d21053 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -760,6 +760,14 @@ void mlx4_en_xmit_doorbell(struct mlx4_en_tx_ring *ring)
                  (__force u32)ring->doorbell_qpn, ring->doorbell_address);
 }

+static void mlx4_en_flush_pending_doorbell(struct mlx4_en_tx_ring *ring)
+{
+       if (ring->doorbell_pending) {
+               mlx4_en_xmit_doorbell(ring);
+               ring->doorbell_pending = false;
+       }
+}
+
 static void mlx4_en_tx_write_desc(struct mlx4_en_tx_ring *ring,
                                  struct mlx4_en_tx_desc *tx_desc,
                                  union mlx4_wqe_qpn_vlan qpn_vlan,
@@ -1132,6 +1140,8 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)

 tx_drop_count:
        ring->tx_dropped++;
+       /* an earlier skb in this batch may have deferred the doorbell */
+       mlx4_en_flush_pending_doorbell(ring);
 tx_drop:
        dev_kfree_skb_any(skb);
        return NETDEV_TX_OK;

---
pw-bot: cr
