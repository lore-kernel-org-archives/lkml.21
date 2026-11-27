Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796558;
	b=1WQe4ibt4+NcFHLxQJwUc2Z+ekxnYawydlfDZRzlP20vr/wbfB4IOEWveIRlK6gUHhuz
	 cKrbgbl0kDd5a5CDrZfe02LgKsut0Nqp5J96lqgavKgLrtipQ9pCNdhcBP3+oKSw6pXld
	 lYxmLReiwEX39prrrCFhnR4u0OL6Nv748YWsacrEij6ArGuA0kIOwQy6lktEdV0tp+A/Z
	 8roRbLLAdnfv37WS9k51PbJnkiAYifDlDZljDe+8orWl2c8i/nxPsn1xn+75H6IJQbRx+
	 wgkg5XFNwfprgVwZnxfCahMNw1CmWPCliQ8eWsSN4q7o/IOap07R2UmoodrmhV/EaCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796558;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2FluCkB23A2rX2sPHBDAcwkjRgUYCjrVI/IlnA5wVSI=;
	b=VfXrE6I7r2Tq65NMsD1sTPmLHuHYDz8CzgnA6enWuXT5BiDcsAMGX+mtZPk3M87SaYtw
	 8w8aNiIDUZ/XoR4hZzKJkQS5yMopT+q4d44wcb7j7G3WLjgilYv6Y4BcfUeifG4iV/QJe
	 +63L4qLGf4o06PdQtzO9Thaw8g1sehMh5V8aXKlRcjT05VhyDi2cjibrd9m5MvbushMDq
	 omzJ67RY5u58LHcoIjNNYuVqYxOvsNt3J5lGLFK2gRislMhOuNBwix40Ef5GUpl+Zi19o
	 /X8yk0JipzN3treoT829CVOzbmQSo7neVDTDM3N2jfG+Sp+8QxWn4RT3MijMOhG12QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4A4606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C4A4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b4e04eda5aso61435827b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:22:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795796556; x=1796401356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2FluCkB23A2rX2sPHBDAcwkjRgUYCjrVI/IlnA5wVSI=;
        b=MB4G+M6E07RPLIGHP0/d6118ncx8YFnLh6TzXV3bsYJFj0Yuq5DdOzh+wiiLaYtzC2
         UKcMLpkDCdVaGZBYVM1Vd/FbHMMYbFAI8BRMu6ETTZDZCFm9cVWps1925kvkWILw7j6H
         LpLk5uVCbSnK4x+5IJ4vcC5iUPlkedEO9LgYELKEOd92LuOKP0G9tW9D1lrIybZByE01
         kJ97F7x3785lg1VbypoCsQFsl19VTGhkHrVLXcsmXZ0lif1XiN+D8vgJ2565MW4L650d
         6RWxCXsMdQWbeTBO6A9eXPhtBTpSoUBfgkgKgTdzV0RN9l/YNuYNmBcr2FYxXlJtYFnG
         ZJbg==
X-Forwarded-Encrypted: i=1; AL+hErGDivikJm+7zT57/8ztdXA6QqS1caPm62TzWXzTkLSnD0gNism9O1VY15AXb2oitc/NnwsD5sdPNR55sIY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5Ev3nq6ZPgqoHB0R96hJ5Phz36lnpySOu2WgIhruKO9uOAMAs
	5H7SsXqQF7/a8qfOzcYbvKDwuLtUH4vtHeANQVijmEgy8HEu19GTfW8OnKf7zg==
X-Gm-Gg: AZFdTZe5Yx80W6Iqru1ML0RlsFGbMG6Q8UasxSG36+yIhEcYkswp/qo9tBo966afc+F
	cFJfv44LxrZ5pww/zZHT7cq9WLYQYmhl3NN87569lxSnBOTHNQ0uU45qBAb68FkXPqiVuNur8Pe
	kxbnxAg7Na20TgBf3Mz+j9b5BktaQaYOSRLZhDXBnj9QdgV24a45o7vLdD10zDr5ZlN88w8Qx/B
	Suv8IO0fHy3BXTwDYvnJx6A198Nh7YLAei2wXOD5Q0+hMKgB5xf3dDEwisZNcEEfsCpWl9KEtkH
	nmYtMjjWOP3BLHL2SxZiACh0caFdQ42IGqX2SAmUqdRqEDVYdR0GyeP4aQPqev2sTioSa1DQTUv
	TqAc4iMb17TO+kWx2wq+XuKPTbUiBGtNxTRRNhkotUa5YO4KBWZLORlV6OCxWsysQ2SgXlcY9SI
	aIvAFJIBU8QceSe0dMkyXekSm1uCI+1j2ZPSDacYmsW+mcN4SFUjs+pGPbttbrp+WNFhSM8RuFb
	rEVghYnrUBr1MHoRiDRQRmMBe2tK54K1a6gI4eDsPkIBKI+P9tTeC/4suPKejrd3FgirSUuo9y9
	dryT7wRDyzYTfVrAeA/WwPFsOYTAKZMTgIL8SX7dfM4kS7V1sB0epuDmv+pVqmsYqCwpSlccuR/
	U+OMopLaSEpcSSAOh6UGDOACXKQH9t7VJtow5NNvIE6IiqQadnDu53ePTEQ==
X-Received: by 2002:a05:690e:1906:b0:67c:6ff:f070 with SMTP id 956f58d0204a3-67df42b4b3amr14462000d50.7.1795796556349;
        Fri, 27 Nov 2026 08:22:36 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df31fa7afsm11269692d50.1.2026.11.27.08.22.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 08:22:35 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b4b9ba815bso48816297b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:22:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFnS7/11+n5ghC6PKMDny/BDY1I/8bfrOQ78F+fQGvGvmbklBfbXpo2J7czYTnKniPVhVjPwJwN5iRopjk=@vger.kernel.org
X-Received: by 2002:a05:690c:9a82:b0:8b0:c71d:2b2b with SMTP id
 00721157ae682-8b5205137b8mr119923687b3.45.1795796555253; Fri, 27 Nov 2026
 08:22:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114133738.52817-1-tanure@linux.com>
In-Reply-To: <20261114133738.52817-1-tanure@linux.com>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 27 Nov 2026 16:22:23 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+15Vit+pU3XE+DiUH4u6APf-FYBuhnrVGx9=pZC8MGpWw@mail.gmail.com>
X-Gm-Features: Aa3M54quNMc8BBDlmy1z8lmGJhR7RotCtAP1c_2g21GpRyDjwzEWIScV0cEj9Ts
Message-ID: <CAJX_Q+15Vit+pU3XE+DiUH4u6APf-FYBuhnrVGx9=pZC8MGpWw@mail.gmail.com>
Subject: Re: [PATCH] iommu/rockchip: do not walk the page tables of a disabled MMU
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	"open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Cc: stable@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 1:37=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
>
> A page fault handler running while another CPU detaches the same IOMMU
> can read a cleared RK_MMU_DTE_ADDR, turn it into a linear-map pointer
> and dereference it, which panics the machine. A dummy or firmware-left
> address is as unsafe.
>
> Seen on PX30 at reboot: the display controller still fetched an
> unmapped framebuffer, its IOMMU sat in a page fault, ignored the stall
> and paging-disable commands, and had RK_MMU_DTE_ADDR cleared during
> the handler's second run.
>
> No wait works: the master shares the line, the RK3588 NPU driver
> detaches from its interrupt thread, where synchronize_irq() deadlocks,
> and synchronize_hardirq() skips a force-threaded handler. A spinlock
> orders the walk against the register clear.
>
> 6.1 vendor kernel log, rk_pagefault_done is the walk, per CPU:
>
>   CPU 1, init, reboot path:
>   [ 1069.789374][    T1] rk_iommu ff460f00.iommu: Enable stall request ti=
med out, retry_count =3D 0, status: 0x0002cb
>   [ 1069.791314][    T1] rk_iommu ff460f00.iommu: Disable paging request =
timed out, retry_count =3D 0, status: 0x0002cb
>   [ 1069.830197][    T1] Call trace:
>   [ 1069.830922][    T1]  iommu_detach_device+0xd0/0xdc
>   [ 1069.831483][    T1]  rockchip_drm_dma_detach_device+0x1c/0x34
>   [ 1069.832033][    T1]  vop_crtc_atomic_disable+0xb0c/0xc44
>   [ 1069.832751][    T1]  drm_atomic_helper_commit_modeset_disables+0x348=
/0x690
>   ...
>   [ 1069.836601][    T1]  drm_atomic_helper_shutdown+0xa0/0x158
>   [ 1069.837152][    T1]  rockchip_drm_platform_shutdown+0x18/0x2c
>   [ 1069.837870][    T1]  platform_shutdown+0x3c/0x54
>   [ 1069.838599][    T1]  device_shutdown+0x194/0x260
>   [ 1069.839160][    T1]  kernel_restart+0x40/0x128
>
>   CPU 0, page fault handler:
>   [ 1069.790364][    C0] rk_iommu ff460f00.iommu: Page fault at 0x0000000=
0ffee0000 of type read
>   [ 1069.792129][    C0] rk_iommu ff460f00.iommu: Page fault while iommu =
not attached to domain?
>   [ 1069.792184][    C0] rk_iommu ff460f00.iommu: Page fault at 0x0000000=
0ffee0280 of type read
>   [ 1069.794604][    C0] Unable to handle kernel paging request at virtua=
l address ffffff8000000ffc
>   [ 1069.805998][    C0] Internal error: Oops: 0000000096000006 [#1] PREE=
MPT SMP
>   [ 1069.809484][    C0] pc : rk_pagefault_done+0x1b4/0x3c8
>   [ 1069.810548][    C0] lr : rk_pagefault_done+0x19c/0x3c8
>   [ 1069.832390][    C0] Call trace:
>   [ 1069.833116][    C0]  rk_pagefault_done+0x1b4/0x3c8
>   [ 1069.833844][    C0]  rk_iommu_irq+0x64/0xc8
>   [ 1069.834395][    C0]  __handle_irq_event_percpu+0xe8/0x2ac
>   [ 1069.834945][    C0]  handle_irq_event+0x40/0xbc
>   [ 1069.835675][    C0]  handle_fasteoi_irq+0x118/0x28c
>   [ 1069.836404][    C0]  generic_handle_domain_irq+0x44/0x6c
>   [ 1069.836954][    C0]  gic_handle_irq+0x60/0xf0
>   [ 1069.837505][    C0]  call_on_irq_stack+0x3c/0x5c
>   [ 1069.838235][    C0]  do_interrupt_handler+0x4c/0x94
>   [ 1069.838963][    C0]  el1_interrupt+0x44/0xa8
>   [ 1069.839446][    C0]  el1h_64_irq_handler+0x18/0x2c
>   [ 1069.839997][    C0]  el1h_64_irq+0x78/0x7c
>   [ 1071.215224][    C0] Kernel panic - not syncing: Oops: Fatal exceptio=
n in interrupt
>
> Fixes: c68a292152d3 ("iommu/rockchip: rk3288 iommu driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  drivers/iommu/rockchip-iommu.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iomm=
u.c
> index 1fa3110b142a..0f40d9678344 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -115,6 +115,7 @@ struct rk_iommu {
>         struct iommu_device iommu;
>         struct list_head node; /* entry in rk_iommu_domain.iommus */
>         struct iommu_domain *domain; /* domain to which iommu is attached=
 */
> +       spinlock_t lock;
>         const struct rk_iommu_ops *rk_ops;
>  };
>
> @@ -543,7 +544,8 @@ static int rk_iommu_force_reset(struct rk_iommu *iomm=
u)
>         return 0;
>  }
>
> -static void log_iova(struct rk_iommu *iommu, int index, dma_addr_t iova)
> +static void log_iova(struct rk_iommu *iommu, struct iommu_domain *domain=
,
> +                    int index, dma_addr_t iova)
>  {
>         void __iomem *base =3D iommu->bases[index];
>         u32 dte_index, pte_index, page_offset;
> @@ -563,6 +565,12 @@ static void log_iova(struct rk_iommu *iommu, int ind=
ex, dma_addr_t iova)
>
>         mmu_dte_addr =3D rk_iommu_read(base, RK_MMU_DTE_ADDR);
>         mmu_dte_addr_phys =3D iommu->rk_ops->pt_address(mmu_dte_addr);
> +       if (domain =3D=3D &rk_identity_domain ||
> +           mmu_dte_addr_phys !=3D to_rk_domain(domain)->dt_dma) {
> +               dev_err(iommu->dev, "iova =3D %pad: page directory %#x is=
 not the attached domain's, not walked\n",
> +                       &iova, mmu_dte_addr);
> +               return;
> +       }
>
>         dte_addr_phys =3D mmu_dte_addr_phys + (4 * dte_index);
>         dte_addr =3D phys_to_virt(dte_addr_phys);
> @@ -593,6 +601,7 @@ static void log_iova(struct rk_iommu *iommu, int inde=
x, dma_addr_t iova)
>  static irqreturn_t rk_iommu_irq(int irq, void *dev_id)
>  {
>         struct rk_iommu *iommu =3D dev_id;
> +       struct iommu_domain *domain;
>         u32 status;
>         u32 int_status;
>         dma_addr_t iova;
> @@ -606,6 +615,8 @@ static irqreturn_t rk_iommu_irq(int irq, void *dev_id=
)
>         if (WARN_ON(clk_bulk_enable(iommu->num_clocks, iommu->clocks)))
>                 goto out;
>
> +       spin_lock(&iommu->lock);
> +       domain =3D READ_ONCE(iommu->domain);
>         for (i =3D 0; i < iommu->num_mmu; i++) {
>                 int_status =3D rk_iommu_read(iommu->bases[i], RK_MMU_INT_=
STATUS);
>                 if (int_status =3D=3D 0)
> @@ -625,15 +636,15 @@ static irqreturn_t rk_iommu_irq(int irq, void *dev_=
id)
>                                 &iova,
>                                 str_write_read(flags =3D=3D IOMMU_FAULT_W=
RITE));
>
> -                       log_iova(iommu, i, iova);
> +                       log_iova(iommu, domain, i, iova);
>
>                         /*
>                          * Report page fault to any installed handlers.
>                          * Ignore the return code, though, since we alway=
s zap cache
>                          * and clear the page fault anyway.
>                          */
> -                       if (iommu->domain !=3D &rk_identity_domain)
> -                               report_iommu_fault(iommu->domain, iommu->=
dev, iova,
> +                       if (domain !=3D &rk_identity_domain)
> +                               report_iommu_fault(domain, iommu->dev, io=
va,
>                                                    flags);
>                         else
>                                 dev_err(iommu->dev, "Page fault while iom=
mu not attached to domain?\n");
> @@ -651,6 +662,7 @@ static irqreturn_t rk_iommu_irq(int irq, void *dev_id=
)
>
>                 rk_iommu_write(iommu->bases[i], RK_MMU_INT_CLEAR, int_sta=
tus);
>         }
> +       spin_unlock(&iommu->lock);
>
>         clk_bulk_disable(iommu->num_clocks, iommu->clocks);
>
> @@ -921,16 +933,19 @@ static struct rk_iommu *rk_iommu_from_dev(struct de=
vice *dev)
>  /* Must be called with iommu powered on and attached */
>  static void rk_iommu_disable(struct rk_iommu *iommu)
>  {
> +       unsigned long flags;
>         int i;
>
>         /* Ignore error while disabling, just keep going */
>         WARN_ON(clk_bulk_enable(iommu->num_clocks, iommu->clocks));
>         rk_iommu_enable_stall(iommu);
>         rk_iommu_disable_paging(iommu);
> +       spin_lock_irqsave(&iommu->lock, flags);
>         for (i =3D 0; i < iommu->num_mmu; i++) {
>                 rk_iommu_write(iommu->bases[i], RK_MMU_INT_MASK, 0);
>                 rk_iommu_write(iommu->bases[i], RK_MMU_DTE_ADDR, 0);
>         }
> +       spin_unlock_irqrestore(&iommu->lock, flags);
>         rk_iommu_disable_stall(iommu);
>         clk_bulk_disable(iommu->num_clocks, iommu->clocks);
>  }
> @@ -997,7 +1012,7 @@ static int rk_iommu_identity_attach(struct iommu_dom=
ain *identity_domain,
>         if (iommu->domain =3D=3D identity_domain)
>                 return 0;
>
> -       iommu->domain =3D identity_domain;
> +       WRITE_ONCE(iommu->domain, identity_domain);
>
>         spin_lock_irqsave(&rk_domain->iommus_lock, flags);
>         list_del_init(&iommu->node);
> @@ -1051,7 +1066,7 @@ static int rk_iommu_attach_device(struct iommu_doma=
in *domain,
>         if (ret)
>                 return ret;
>
> -       iommu->domain =3D domain;
> +       WRITE_ONCE(iommu->domain, domain);
>
>         spin_lock_irqsave(&rk_domain->iommus_lock, flags);
>         list_add_tail(&iommu->node, &rk_domain->iommus);
> @@ -1227,6 +1242,7 @@ static int rk_iommu_probe(struct platform_device *p=
dev)
>                 return -ENOMEM;
>
>         iommu->domain =3D &rk_identity_domain;
> +       spin_lock_init(&iommu->lock);
>
>         platform_set_drvdata(pdev, iommu);
>         iommu->dev =3D dev;
> --
> 2.56.1
>
ping?
