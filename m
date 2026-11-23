Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795461809;
	b=IVKRufF0oDDLNXB1Z0sJgwkMzeUP4MJYX2AsL2pWdC5LlMoN3qPAoc0t1pKLX4adGDcT
	 GZ4gaLRg4FHR8kw1LlGQGQ+GsQyovUMv4g3Crvn6RumSPfajrp72zTcWngLwS9PigJCcd
	 JUc7XjfmZRh6gKQdWijhdWPz6yulHiT9B75Po1Vg45MPapTDKM6ppR0E27/wl/IX1Jj+O
	 Y5N7bSi49+tIl8kHTBkYaWa34G0TGAS1oTE18gXu6kwsYiJSi0FGnKMO2/s9eHreYRzED
	 Ht239kP1fK0fgofUdBSJm4xi84ZajVOYJMsnlPKRT08NhBDFCU69ozqB+BdHFvRi1uQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WLq3MWKnDvfFRPACkCbZySTur7MfMMWz5unzYWon4qE=;
	b=wXjylbuLAbP01kfBwtZI9eKGXQsKowJBxGmodnx29Eh8/tNXkXUNQwT2T600XPx3SwlO
	 JTixs5S5WZhIa6DxCGmRw9X8Aj0vrqzWYzGB++cFTjPMBxNMVe7dLooM++jkeQcMhmYpH
	 xWMZO9t/H/xn5oLFWrorVOJTM99thoOjWERk1re9rC/7OYCcoYQd15UDQcofSAJhR3w07
	 f1MgP97AVhymf2VQHzerVzRpuQVSDq3F+wnrGCrPMwVqEjiwVIxSEGC1tt2M4wlzfxO65
	 lCQLqwEXCmhQOZDlCdEgO3K6ckzFlDF/pJi8qjX7Q9L7jcsdw9CPW3OAJMUx6k/w4Ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.tenstorrent.com;
	spf=pass smtp.mailfrom=tenstorrent.com;
	dkim=pass header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=U9qvPAlU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29822606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29822606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=U9qvPAlU
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4e04eda5aso26357477b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:23:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795461807; cv=none;
        d=google.com; s=arc-20260327;
        b=XshK/cJJo7xcUCHcXSG0yzEcy6stw558qAWKiQWvVgjtokENOMkE0CoBGB6y+oEaK3
         x0HKZyl96z8PDbVGbpyi+T9udmtMLSTHZ6P8EYTO0BNUnaN5S67Njai2FKlKswheL3++
         MhmMPc10IEaf14jr05HjUNTerVVtvLabZJIJqZENnDttWRLIV0ASTAA15wnxCahIiNqS
         VeZabva2n9ZSR+t6/jZWK9Woc7jqNKZu/ugrzxTNTYhRXwgq87n+08WrKRQ/nYHt3lRn
         iHckFLHoZ43FxMSJGJm1ZKhRpcx7H3Uth+5jPw6woam9OzZT++c3nOI/DnNOoARLmc62
         qbkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WLq3MWKnDvfFRPACkCbZySTur7MfMMWz5unzYWon4qE=;
        fh=WNGUFtXb11Fvp1wqgT+V04A3my2mbWWOVB7O4bdvhAQ=;
        b=VHG7sJ7PYV5UZQeUZXul1NABOUfzyPB6asgEWwa+NpYOW0sjfdJLLQVaJIBhn8aVPu
         HxRSsKDbb22s9uGHTuCjrp6i+ctJXeg2Tc6OD7rB4TEmD1DLFaVPpwTHF8nzaB3upqIE
         MxZL0kgoBwPXXUvZ5xxYOelB/Fu5Oin1QoFNrU/8Hi3jtlablTvc99H3pyAUl4gF7kqf
         HQIMSgoOIEqkCVcQ+kZqreopK5itp4m8QuaNQjqKaBL8XiZk6pExlgFGAKaU8xo2Xqx1
         QvpQmH32t6h7/0Rkq3ujnAwDK4suJAkRr3nLmV4TNBr8j4YUp6zdFtj4RAhC20MBCGkb
         V3jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1795461807; x=1796066607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WLq3MWKnDvfFRPACkCbZySTur7MfMMWz5unzYWon4qE=;
        b=U9qvPAlUpHtmFneiecRFsim+TvMaWm4ZsmGwmpXG/Ehz+i0RIkTrHKownmbVxN7ntu
         ewHOXyDL/whyikpeAFOVehJ4UHeMw6uLqf114NMytXrCR/sb9KzCZbUXC/RleVV2Q8dd
         SS9m8kDNjm8igh1CW8i4HD/NOMSDg9/TVJbGvQiZUeqLAm0xR7in1WFJERYgQHNE89df
         qgWH6YaFnPFXgnpqtBUYZihFSSOiN5Dz1UND8bm5zxQl60sQTInzwS/J+S8KC8FI4aCF
         MBZKDNvWOLLCtuTQnLKb1/J8TxECZzFgYLblKHyVk4uAemVtHrJelnwLbBC2QNGu+aZq
         5Hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461807; x=1796066607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WLq3MWKnDvfFRPACkCbZySTur7MfMMWz5unzYWon4qE=;
        b=T2l9YeYwKIyu1L1xbcC/A18YFVpV7gv0oO37YHyUhZtPhXCEf+Q2pEcZXwcN2g3aaE
         9Gf/lcYIIjhtKKrozuiwn4oe4+79gEUR0/aCatAf9RZq19fhw2Akn7ZOd2NWok592Ofk
         kPvf9QCBHbawTWmHahciDQsY8hLshyiBU/mij68qvun1FSG/rY38NCG8IRr6GkjTMGPr
         kBo3bMY036ypcbpYX8xgOp2pwWGc8Lvq4RVEtzNJE3+XBQGCrTWJAjWeJ2n0vdIR7Pab
         8Y1/hB1uxzQjlDRz0FnEvxYgwBp879dmHvAsDeoGnHyA5Fve+T5jvvP2aMJf3R1N6FiJ
         5WhA==
X-Forwarded-Encrypted: i=1; AL+hErGweD2ZX1KdNxRmegQBC/RcohZdYuq3x22rP0eOKFzIz8PbcJekjLY3Ym5BLuadtwBC53mBjUHim8cqw9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Fvy6ORtB49AHXWvGsWquWGvLBXkL49QC03XgbgguSM3sjz62q
	VGljhkjnBgGqEQtyHp1blOncG8mIaNJ36x8pCm2A+Xe1z4JTQFEL5DJQ3nx5VeygR8dP/VAEYtd
	i9Q4uxA5RHAu6/A2AVPf7qZKPoniQC7Ar9w69b4r0vw==
X-Gm-Gg: AZFdTZeJ6RaSZVf+bq8+RGdDDkxu3koKVR2dgEgz/2n5be4TdXQvY+gdJgnIcpMaMUQ
	L9v0YC/7GyEewcRJqdnuilJcgYqD9cDmuGk46YpHfINmDnyoITeKsI54AV30kU25yhhvQ9XYNgN
	x7O3B9sMjklvY64qSkL7oodGpuMlGDTqFlP0x3oM4M0fb9krpqIUUQEKfqS3SommqE8RyTm4OO/
	DZTNMP7xnCCn8zgpRXofMA0c17jsKcirMNTycoWLwfkkq6bvGlwyARbPmMuk5LdSrtjFZacOTch
	mmxZxThMk5Ds78tJqBAMqmWkISS2zQBVOAzQAXdgtRk4G8lWu7lHQIocmF4dTVlGvue0xqTG/iF
	lUutoVhiFPXQVd3G285EdnQAVUO3rs2ydFURrJ7o7JGV/dnxyvMLRuumGo+D6HLMMlqNV6FVO4p
	SR8thm+DEPQbTZ8RWGbSEJFUQNkw==
X-Received: by 2002:a05:690e:47c7:20b0:67d:bbf9:11d5 with SMTP id
 956f58d0204a3-67df443ce21mr4010766d50.55.1795461807055; Mon, 23 Nov 2026
 11:23:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123164834.3330320-1-lee@kernel.org> <20261123164834.3330320-9-lee@kernel.org>
In-Reply-To: <20261123164834.3330320-9-lee@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 23 Nov 2026 13:23:16 -0600
X-Gm-Features: Aa3M54rXx5AsI23DPhI8Gl_apOGxLaDoOy7tWbjmJE6RhLCtQ26K-zDZRMPyVoM
Message-ID: <CAEev2e8KMaN+Vw7usWTiQk=dyOcV5n9PEHB1o7K=cQw=fyoBZg@mail.gmail.com>
Subject: Re: [PATCH 08/10] clk: tenstorrent: Poll atomically in atlantis_clk_pll_enable()
To: Lee Jones <lee@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lee,

On Mon, Nov 23, 2026 at 10:49=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> The Common Clock Framework invokes .enable callbacks in atomic context
> with interrupts disabled and enable_lock held.  In atlantis_clk_pll_ops,
> atlantis_clk_pll_enable() is registered as the .enable callback yet
> waits for PLL lock using regmap_read_poll_timeout() with a 500 us sleep
> interval, triggering a sleep-in-atomic bug via usleep_range().
>
> Since the PRCM regmap is backed by MMIO, use
> regmap_read_poll_timeout_atomic() instead.
>
> Fixes: 23c8ebc95284 ("clk: tenstorrent: Add Atlantis clock controller dri=
ver")
> Closes: https://sashiko.dev/#/bug/linux-980395a6-f282-478a-bf18-b5695a725=
735
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/clk/tenstorrent/atlantis-prcm.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Thanks, I was able to reproduce the bug on the tt-atlantis qemu
machine by using a kernel built with CONFIG_DEBUG_ATOMIC_SLEEP=3Dy,
CONFIG_DEBUG_PREEMPT=3Dy,  CONFIG_PROVE_LOCKING=3Dy.

[    1.895417] BUG: sleeping function called from invalid context at
drivers/clk/tenstorrent/atlantis-prcm.c:329
[    1.896093] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid:
1, name: swapper/0
[    1.896616] preempt_count: 1, expected: 0
[    1.896990] 3 locks held by swapper/0/1:
[    1.897251]  #0: ff600001808a7938 (&dev->mutex){....}-{4:4}, at:
__driver_attach+0x68/0x11e
[    1.898561]  #1: ffffffff81d70bb8 (prepare_lock){+.+.}-{4:4}, at:
clk_prepare_lock+0x1c/0x80
[    1.899134]  #2: ffffffff81d70b30 (enable_lock){....}-{3:3}, at:
clk_enable_lock+0xb0/0xd8
[    1.899750] irq event stamp: 25978
[    1.899968] hardirqs last  enabled at (25977): [<ffffffff80d12254>]
_raw_spin_unlock_irqrestore+0x4e/0x70
[    1.900552] hardirqs last disabled at (25978): [<ffffffff80767d00>]
clk_enable_lock+0xa0/0xd8
[    1.901195] softirqs last  enabled at (25724): [<ffffffff80053e72>]
handle_softirqs+0x54e/0x590
[    1.901798] softirqs last disabled at (25717): [<ffffffff80054132>]
__irq_exit_rcu+0x1f0/0x25c
[    1.902422] Preemption disabled at:
[    1.902447] [<ffffffff80767d10>] clk_enable_lock+0xb0/0xd8
[    1.903375] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
7.2.0-00071-g9a0518d4d70d #3 PREEMPTLAZY
[    1.903558] Hardware name: Tenstorrent Atlantis RISC-V Machine (DT)
[    1.903643] Call Trace:
[    1.903687] [<ffffffff8001927a>] dump_backtrace+0x1c/0x24
[    1.903718] [<ffffffff800024ba>] show_stack+0x28/0x34
[    1.903734] [<ffffffff80011262>] dump_stack_lvl+0x60/0x88
[    1.903750] [<ffffffff8001129e>] dump_stack+0x14/0x1c
[    1.903766] [<ffffffff80084b76>] __might_resched+0x23a/0x26c
[    1.903786] [<ffffffff80084be6>] __might_sleep+0x3e/0x62
[    1.903801] [<ffffffff8077fb02>] atlantis_clk_pll_enable+0xd0/0x1aa
[    1.903818] [<ffffffff8076d10a>] clk_core_enable+0x92/0x2fe
[    1.903835] [<ffffffff8076e130>] __clk_register+0x5c4/0x874
[    1.903851] [<ffffffff8076e558>] devm_clk_hw_register+0x44/0x96
[    1.903867] [<ffffffff8077f812>] atlantis_prcm_probe+0xbe/0x18c
[    1.903883] [<ffffffff80806eda>] platform_probe+0x46/0x78
[    1.903899] [<ffffffff80804946>] really_probe+0x86/0x234
[    1.903914] [<ffffffff80804b58>] __driver_probe_device+0x64/0x104
[    1.903930] [<ffffffff80804cba>] driver_probe_device+0x2c/0x98
[    1.903946] [<ffffffff80804e22>] __driver_attach+0x70/0x11e
[    1.903961] [<ffffffff80802908>] bus_for_each_dev+0x60/0xae
[    1.903976] [<ffffffff80804488>] driver_attach+0x1a/0x22
[    1.903991] [<ffffffff80803c36>] bus_add_driver+0xce/0x1d6
[    1.904006] [<ffffffff80805a5a>] driver_register+0x3e/0xd8
[    1.904022] [<ffffffff80806c0c>] __platform_driver_register+0x1e/0x26
[    1.904038] [<ffffffff80e31bc8>] atlantis_prcm_driver_init+0x22/0x2a
[    1.904057] [<ffffffff8001296e>] do_one_initcall+0x76/0x39a
[    1.904073] [<ffffffff80e01416>] kernel_init_freeable+0x2b4/0x33e
[    1.904088] [<ffffffff80d065d4>] kernel_init+0x1e/0x13a
[    1.904103] [<ffffffff8001440e>] ret_from_fork_kernel+0x20/0x3b0
[    1.904119] [<ffffffff80d13c22>] ret_from_fork_kernel_asm+0x16/0x18

This patch fixes the issue.

Reviewed-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

Regards
Anirudh Srinivasan
