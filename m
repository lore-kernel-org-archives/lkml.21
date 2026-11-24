Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795507617;
	b=CYknuJWkfTdscQZorbtZrFTSK/01/CrNAMAJw2U2Uux9Mgd6NSOTgjJN7GaZDiFGZGwR
	 s3GE8U0pKeQDZiguO9kCkLSKfRqpNL7xeG7XC1iEnPb9jLnVaxzvfuXuCl9ysDrGxa6mR
	 w9r94aQNrk1KFe2vS6EbZd/EAmIagi4ofExv8SZ5OCOJr08FNIQYUFn0g4bIu/9LkniuY
	 mY7tX7704AaqYcZnhuR/zSuIWqGJGGUiKE63F8jcVWzL797F4EqxYwlXyVNjS6U5JWnUy
	 pOV1nxytJL5kW7TDv8wxaPCIyyC8E66EhOPqAtrDH779ejeQm6aCPYkCx/V5YHVKK0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bw6nyEiSIkuUi2FfPQWVcCbleSg58qLNpgEdKu/3YUI=;
	b=mzOqGok/lGXucGC1wpkDiSglK4m5AA0+r7zwZCeY9Wr/MKklXLXsE7UhtnQw9K/U7BR0
	 CvrL8N4v+KbokiAVCdXTYqgIMtqvy98/ByK/P2e1bjgIFiYKBG8UbT1VQS4S9wJkLRtP4
	 0JvuGf4XA77nOiSZ0WSTwP0wfjbo2Dam8IOq+jPUBkowcDUCPrWOCfEMoTFqYfwRWswaL
	 vM9a3mUgq2yJEsZRLTszDAiNlzYwYJD7I/0Q5PCr/ZVQS9mEse4ydLFPwu+QoVGSPJVuD
	 v1WbTm7occb+qCDnMknLJTBghs8h6iCdrn9G47jEHHYzL4hxf5dZkqEnGVb4Brxh1Kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rBYlwwRw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C4F606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57C4F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rBYlwwRw
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eac319a6c2so2981840e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:06:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795507616; cv=none;
        d=google.com; s=arc-20260327;
        b=o6teYqdWAD7ANFHVBcMI7DcNhi4g292qs1SIUxqa+CjYmzil2xsQ0lL+6bdr8QBJoZ
         yIaJSMm8tXRs5t05i5SGEsb/yoVvWTD4SDe9QHs9fNx8FRAvQ7nUUNED6RvGbtoHC8L3
         b6rDiUUoRnp2FXtW83b1+8OZ4ug4lZQ2hirzl1q+Hno9jVn6rECNpzz0QGb4PRHIDLgg
         /8U5e92i9Xn+JiAc4+nrJEcxRILB9X1OmDHSlPTL0w8g8B7eHstbwM9atHT3ea/fFe1Q
         hCJix/sx6z8O7LdN+Krm8Qwb5qV7UYxEwUdPOr7hEWluLX92Q6e2JRGlogJXltT295Bx
         875g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bw6nyEiSIkuUi2FfPQWVcCbleSg58qLNpgEdKu/3YUI=;
        fh=Qt2vwCON0/Edqa1Mzemr7N6c8Yb3UEjYsdyz39AWD9w=;
        b=LLr3O+cYmCfBC1r8IHJr2Izim0/7ucrns7ggn69BZTeIlR1VuxV83PGiw0blmW7RJu
         FCH8nQCh/8xm2Gree4rVbq6oucilZM+yJ91KSP1dOmlEi+SxHVhK4VOsDIydCU3jMdNb
         zhcgSU6sSNe2Q77VhrmIfb0eB5o0Bj7GaE7hmXGjJV3ZCtcQhmTZvhoXjqRyStF7E9iO
         jXDQkcCuuQviBDIJap68kno8FIFWtTRbgzHTGinhtONks9ACySVws1ddpNpwsgXzVaLH
         tmapz5JORmdDfrY3mpNjqDIBDBixiKdn6iqC1yOwuYWOs4KjnJAJsT4jxwD4T3l1LTtO
         91Lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795507616; x=1796112416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bw6nyEiSIkuUi2FfPQWVcCbleSg58qLNpgEdKu/3YUI=;
        b=rBYlwwRweAU+qTG8cIspJZn9AYxtRKgERSJDBSzWx+WtZVGAyIegisCFmfQm81aBp0
         qZh8rXG0s4SiU0qrlGKnvqlmx0LdD22coe9fYExNA+Stg8EW3uiVbXGM/EEBb+BMvEBo
         qhxkYd52t948QoMj7GSaRtdcjGEBuaVO1k9jKIsyqqLZW1CnYpUxITSMBmkvMZ6s66t3
         zcR9uAKZ6EtlLX7qasS2mAS/o5LQD5CLzG2VLpcnIxXjU5A8Gmpax/vbr6+Ai0wIpMv8
         6GX1/cp8hHwCHROI+Nlmb4loa2ZCti1dlKAE3gCwU5Qm01IbcmZjw0vVyaD8Ph/neJVn
         dSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795507616; x=1796112416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bw6nyEiSIkuUi2FfPQWVcCbleSg58qLNpgEdKu/3YUI=;
        b=kO2PNHTrzow3EnfB8sCFA3jwXAnlu49X6VwR/T4oIM7AXRy4Ce8EvehjlbgAg+VhpM
         sHdnr9+Uvaqh8TtYQk7Z0FZcrpLont0IT5drjD0y+y1neMxvMbbT35pqPIQ/YEKPyAQx
         vvANut5COCHGGngIRmvNPFnFhkumQuY5vpe9IL7J8UdPlu0wUXfaB6We8OnsSJTr+f1X
         5nxXyxJPikAXy+UpBqpiPC6qj0Wa5G7+FUMEkeIPVXHU6KNCuoe/MFbWVzpm+tB1INW0
         0PTCQm+n0zCKXhcoYfnabZbM2kzJ1tl2PQoeqSu0D/wZXYQlL926/wWhkJ7ybXjJGPfA
         +B0A==
X-Forwarded-Encrypted: i=1; AL+hErHhJLcyyZYswxNYOhlXXb3BBxf4PWP8gXkfJ1+c4dSQUDLlRQAeznQn/3ImDbzS7c+EdPIbSc0upDngn6M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+v1HmzXjAO8D5u6mUybExx/UO0s7t3ZzrpEJ3kMpoqgFeRxvYN
	13c0sryduPq/yrpTkO/fmgxi71LE+Yej9ft2G7ohlx0RnbA2yH+h4vocqSsCgqpBMvR8/mFOrV+
	GUwLJqU0ErG3WewpvFUwQOfA9BYgdXTo=
X-Gm-Gg: AZFdTZcMWt0Iq/IdHKKQkAalxWAk6MpWD13oWHMMVnYJ2W+ckjuPGKQlCPpguIEI85P
	J1pyqU3nadjij2ts5AeA25PgrHN8qOVlujTigMJkqL82AxQRh8uSA4GjowxTmYkD5Z2jA+K9RVm
	igOKVAEMcWciwfa+RyorEJqZSd4i0K+ChPj8lKO2PiQzBCX0KJocpbAQxgNzAfrSJvVvutrz5AM
	gMLZHLz8lOJ7ldyvaJ0auUuWR8Y8NUQDMJa3JJXiDN2Yd977cErYNxY6jZth8wcrS9ohdFNqoTd
	DCuYbFti6eDg8Oduye2CSdQ93c7JRABsK4Wf9zR42FeA0sMJ9zJYRjunsIZovs7BUAF3DMra2XK
	cycEOyqBwrh9J1kPVPEYTo5XorwLHvJ91zfl5nnP2kLt7yF21GmYGfJNzQ5sOA5zdvyonqVXcL+
	oRgQm977zOW/I141I=
X-Received: by 2002:a05:6122:130a:b0:5e9:721c:72a8 with SMTP id
 71dfb90a1353d-5ee8ad0f9ebmr7298180e0c.0.1795507616075; Tue, 24 Nov 2026
 00:06:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123235154.315460-1-gahing@gahingwoo.com>
In-Reply-To: <20261123235154.315460-1-gahing@gahingwoo.com>
From: Anton Sovetov <anton.sovetov@gmail.com>
Date: Tue, 24 Nov 2026 11:06:45 +0300
X-Gm-Features: Aa3M54rUMtJHW-VAq-3nFFJeEzc6wZ6Xr6IR4ySmynSenaDrr1lXVW8oN5BrzrI
Message-ID: <CANLiQWot44KOq8A8dQGt0JNoX=BvH2T+HryMEV05qC6iLydidA@mail.gmail.com>
Subject: Re: [PATCH] iommu/rockchip: Disable paging on banks that still page
 before a force reset
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, heiko@sntech.de, 
	tomeu@tomeuvizoso.net, ddrake@baylibre.com, sidong.yang@furiosa.ai, 
	chaoyi.chen@rock-chips.com, iommu@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, that description matches the end state I see, so it is worth tellin=
g you
where it does and does not fit my board.

Mine is an RK3566 with a single bank. The MMU node is 0x40 bytes of
registers and
the driver ends up with num_mmu =3D 1, so two banks cannot disagree. I took=
 the
nearest analogue of your fix that exists for a single bank, the one in the
Android tree: acknowledge a latched page fault with CMD_PAGE_FAULT_DONE bef=
ore
sending CMD_ENABLE_STALL, because a bank sitting in PAGE_FAULT_ACTIVE with =
no
stall ignores the stall command and the poll times out.

Measured on 6.18.24, twenty separate processes, five runs each, IOMMU mode:

- before: 3 ok, 4 wrong output, 18 timeouts (the failures are sticky, only =
a
  reboot clears them);
- with the stale-fault ack: 2 ok, 0 wrong, 18 timeouts.

No change, and more useful: dmesg has no "Enable stall request timed out" a=
nd no
"Disable paging request timed out" line at all. So on my board the
re-enable path
is never the one that fails.

What I see instead, at the first failure: the job is submitted, the
kick registers
hold what the driver wrote, and the core never runs it. INT_RAW_STATUS read=
s
0x10000 while the required mask is 0x300, task counter 0. The MMU is health=
y at
that moment, paging enabled, no fault pending. Later failures sometimes lea=
ve a
fault in the register, but the first one has none.

Two questions if you have the logs at hand:

- on your RK3576, does the hang start the same way, with a job that never
  executes, or does the MMU re-enable failure come first?
- do you ever see bit 0x10000 in the NPU's INT_RAW_STATUS on a hung
job? I cannot
  find what that bit is in the RK3566 register map, and the driver does not=
 mask
  it in, so it never raises an interrupt.

For the record, the other three things I ruled out by measurement on the sa=
me
board, in case one of them is what your patch really fixes: TLB staleness (=
full
ZAP_CACHE and a domain detach/attach before every kick), cache coherency fo=
r the
task and regcmd buffers, and the iova width (limiting the dma mask to 30 bi=
ts).
None of them moved the failure rate.

=D0=B2=D1=82, 24 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 02:5=
2, Jiaxing Hu <gahing@gahingwoo.com>:
>
> After an RK3576 NPU job timeout resets the core, the banks of its IOMMU
> can be left in different states: bank 0 is still paging while bank 1
> has been reset.
>
> In this state the existing stall and paging helpers do nothing, so the
> force reset that follows fails as well. The IOMMU can then no longer be
> enabled, and the NPU stops working.
>
> When the banks disagree, stop paging on the banks that still page
> first, then run the existing sequence.
>
> Tested on a ROCK 4D with repeated forced job timeouts. Without this
> patch, one in every 2 to 10 timeouts was not recovered from; with it,
> 20 out of 20 recovered.
>
> Fixes: cd6438c5f844 ("iommu/rockchip: Reconstruct to support multi slaves=
")
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> ---
> Not tested on the RK3588.
>
> LLM-assisted.
>
>  drivers/iommu/rockchip-iommu.c | 61 ++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iomm=
u.c
> index 1fa3110b142a..5eabefb0ad14 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -507,6 +507,64 @@ static int rk_iommu_disable_paging(struct rk_iommu *=
iommu)
>         return ret;
>  }
>
> +/*
> + * The helpers above only act when every bank agrees. After a reset of t=
he
> + * master, one bank can still be paging; stop it bank by bank.
> + */
> +static void rk_iommu_quiesce_paging_banks(struct rk_iommu *iommu)
> +{
> +       int i, ret;
> +       u32 status;
> +
> +       for (i =3D 0; i < iommu->num_mmu; i++) {
> +               void __iomem *base =3D iommu->bases[i];
> +
> +               if (!(rk_iommu_read(base, RK_MMU_STATUS) & RK_MMU_STATUS_=
PAGING_ENABLED))
> +                       continue;
> +
> +               dev_warn_ratelimited(iommu->dev, "bank %d still paging, s=
tatus %#08x; disabling it\n",
> +                                    i, rk_iommu_read(base, RK_MMU_STATUS=
));
> +
> +               if (rk_iommu_read(base, RK_MMU_STATUS) & RK_MMU_STATUS_PA=
GE_FAULT_ACTIVE)
> +                       writel(RK_MMU_CMD_PAGE_FAULT_DONE, base + RK_MMU_=
COMMAND);
> +
> +               rk_iommu_base_command(base, RK_MMU_CMD_ENABLE_STALL);
> +               ret =3D readl_poll_timeout(base + RK_MMU_STATUS, status,
> +                                        status & RK_MMU_STATUS_STALL_ACT=
IVE,
> +                                        RK_MMU_POLL_PERIOD_US, RK_MMU_PO=
LL_TIMEOUT_US);
> +               if (ret)
> +                       dev_err(iommu->dev, "bank %d: stall timed out, st=
atus %#08x\n",
> +                               i, status);
> +
> +               rk_iommu_base_command(base, RK_MMU_CMD_DISABLE_PAGING);
> +               ret =3D readl_poll_timeout(base + RK_MMU_STATUS, status,
> +                                        !(status & RK_MMU_STATUS_PAGING_=
ENABLED),
> +                                        RK_MMU_POLL_PERIOD_US, RK_MMU_PO=
LL_TIMEOUT_US);
> +               if (ret)
> +                       dev_err(iommu->dev, "bank %d: disable paging time=
d out, status %#08x\n",
> +                               i, status);
> +
> +               rk_iommu_base_command(base, RK_MMU_CMD_DISABLE_STALL);
> +               ret =3D readl_poll_timeout(base + RK_MMU_STATUS, status,
> +                                        !(status & RK_MMU_STATUS_STALL_A=
CTIVE),
> +                                        RK_MMU_POLL_PERIOD_US, RK_MMU_PO=
LL_TIMEOUT_US);
> +               if (ret)
> +                       dev_err(iommu->dev, "bank %d: disable stall timed=
 out, status %#08x\n",
> +                               i, status);
> +       }
> +}
> +
> +static bool rk_iommu_banks_disagree_on_paging(struct rk_iommu *iommu)
> +{
> +       int i, n =3D 0;
> +
> +       for (i =3D 0; i < iommu->num_mmu; i++)
> +               n +=3D !!(rk_iommu_read(iommu->bases[i], RK_MMU_STATUS) &
> +                       RK_MMU_STATUS_PAGING_ENABLED);
> +
> +       return n && n !=3D iommu->num_mmu;
> +}
> +
>  static int rk_iommu_force_reset(struct rk_iommu *iommu)
>  {
>         int ret, i;
> @@ -947,6 +1005,9 @@ static int rk_iommu_enable(struct rk_iommu *iommu)
>         if (ret)
>                 return ret;
>
> +       if (rk_iommu_banks_disagree_on_paging(iommu))
> +               rk_iommu_quiesce_paging_banks(iommu);
> +
>         ret =3D rk_iommu_enable_stall(iommu);
>         if (ret)
>                 goto out_disable_clocks;
>
> base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
> --
> 2.43.0
>


--=20
With respect,
Anton Sovetov (co-Founder and CEO of 3d-club LLC")
https://3d-club.ru                        tel:+7 (999) 246-78-36
