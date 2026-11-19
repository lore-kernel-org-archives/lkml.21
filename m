Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095407;
	b=mwfpBLy1QO2FwKi0vKUGk7JNb6+p6o/N88v5TmJCeENxWI4MefmJOM1cLA1QsZCjqFyy
	 CTkcLnrbGIcw/EXIz9Gi/3o/18dq4Fdy6FHHa9tgGgs46gGbn0dGn312qY58jaz7ShED8
	 xtj8lv7MCKIYqebdVJu5zzxuu8UaZg3d2SelsaNe8lvuGfBrpRzsKlNzLrlqlvYQ715XM
	 tS+2vVX4UUTNSc/RWmTipzlAVw9lfnzYj/j4OQzC0Rl7Jh5xv7bvw+eKESwcWxShNbwR/
	 7aEVOE7c75bEyVKe4nQ0PAxcro2yzNGqSAqyT9kFjrULEvxWCWT9Ityv+Tijqm7aghQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095407;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9Kn50YQKJmadJWEKhbGZJhAnQczxOvBn+n7Uz/8fwxw=;
	b=UJXG02mkrpyEnugrkMCsqx1yygp9KoVwOjsJfhfWfdRxLitgUZwYEB7mIkxoBoqKCQ6X
	 NiQnIhFfHQ07k0rVe5fa7YX+zbx1Mb47EH+WEuqiOlVSwsAGOUFTmE6YDS4zGj/aFdbA/
	 wHpfzNKnz5GaH+gagX7hy9mwVpE8jbLyGkDWpzncKoFX+IhTa3YrBl7B54Xnxde1IDnDw
	 cVVcQu90XCu9Em4OCaIQb5lTwkIU2EGZ0sI20wLGqVfwuUqLps4JWR+WMXwK3XOL0lZE4
	 nMnwfHPPacNnuWW1DYPeojmQUyA6uZLdEAD9muB4Kif6cGYRUeaIoKlKNcKCzCD8Uxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="a2/gtZAq";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDDF606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a2/gtZAq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C786D1F000C4;
	Thu, 19 Nov 2026 13:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095407;
	bh=9Kn50YQKJmadJWEKhbGZJhAnQczxOvBn+n7Uz/8fwxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a2/gtZAq8FxEM65gZAQirIKeTd6B+cRU9ggzAoHTgpDv7aPA9RoWIxaiVrEfnNekH
	 hPKkCGciMnnNt+EFCCzAAwTOh2Cxj4nZNSwgK6KgmnBRABz6MlWuuWdBk161mCbjxU
	 S53cLOIeeVTgDP1dPH0gwhv+2wqzUlxRQvyhJI63Qy8V7KCKnaddStfbPS1lWV+6ZY
	 DR231XG1k9hiRzbBFkUkUd1bVsKN4akNR5DEEwXGgoidNUhF6cLjPv4+C97VPkBR3n
	 /flbOetOoIq+wwL3TXa5zpGn2bjefWugErqhsmvHeoqHSa0hcMTCFnbr7dhNmQuGHg
	 +y+NCR5SwcnTA==
Date: Thu, 19 Nov 2026 14:36:42 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/14] irqchip/gic-v5: Invalidate the L1 DTE when
 allocating an L2 device table
Message-ID: <av77avzIzIbk_KUD@red-moon>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
 <20261118-host_gicv5_fixes-v3-14-13c1859e8aa3@arm.com>
 <av7Ly_iLyiOAXQUR@red-moon>
 <CA+EHjTxTaEj25Ts-67B6nwxF_x1_ZTik6tg_a4sDbU+7B=FmEw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTxTaEj25Ts-67B6nwxF_x1_ZTik6tg_a4sDbU+7B=FmEw@mail.gmail.com>

On Thu, Nov 19, 2026 at 12:32:56PM +0000, Fuad Tabba wrote:
> On Thu, 19 Nov 2026 10:13:31 +0000, Lorenzo Pieralisi
> <lpieralisi@kernel.org> wrote:
> [...]
> >> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> [...]
> >> +static int gicv5_its_device_l1_cache_inv(struct gicv5_its_chip_data *its,
> >> +                                         u32 device_id)
> >> +{
> >> +        return __gicv5_its_device_cache_inv(its, device_id, 0, true);
> >
> > I would highlight why event_id_bits is set to 0 (actually it is irrelevant,
> > let's explicitly say so).
> 
> With L1 set, the effective value of ITS_INV_DEVICER.EVENTID_BITS is
> the maximum in ITS_IDR2.EVENTID_BITS, whatever was written.

Yep, that's what I meant, I don't want "0" to look like we are
trying to optimize anything in there because there isn't anything
to optimize; a comment would do.

Thanks,
Lorenzo

> nit: this helper has a single caller, so could you call
> __gicv5_its_device_cache_inv() directly from
> gicv5_its_alloc_l2_devtab() and put Lorenzo's comment on that call?
> 
> Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> 
> Cheers,
> /fuad
