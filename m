Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794944546;
	b=og13UuiZLpnuggojJtf6su6s4IYVW8Bgnyof30iew+Lc62h2yXu8milNqQNqt31FEe/E
	 S/PWzW1xMLF4rcSBiWSOVUxZnlErad7uylKGALy/vwPai/tr6uf6PN1mfTVgNU7690wf5
	 iFAjW76/Ewo2+ZKCNLpZy/xfK6q0iRARWCap0Pfj5vdye86r52C4lp6byUy9cFn8LMw04
	 q9kd1UDJ9uzG0kdls/euRleyIIfzv0tFd7zBaDSqo9QHDeFjIufsEz8qpFb4aY+CGN2hM
	 fqWEYTJkYhZogp4vEm12+cvDu1CbL8WxthmP6ixevYyAhMJcgYcqrrbBGqqQuS6rvCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AFcGvIfIz79rcraQPv0Iru/QwvEijnYbQ83QE7nvTx0=;
	b=5gfXTfmEg4nPHQN43XrsdB8+9qKD4LWMQde+C6FKxRZgi9RCP6yxNB64NGzBb6tWn+UE
	 w0IqSw9RnCm3c+z9vCXfOBWFI/6GtpyMgU9rQHS559q3wAZriKGNFViDM7ZH/rqr8S0Hl
	 U1PFOMoa4qVpSh3g1lQcllzfMIha2e3sCQVhRk0PZq13DTAXLKCmeJfB7Y3PdrgTymzEH
	 6hZ/yphsqG6Qn4yLKZKqCH1/h3M382cVTshe2u5DSyGGngBps/0h0wb+T1O8Br7AOAP+d
	 Tv+RruD9Rrf+Vxb6HOp8NXc2G/SxRc/JbbhvgfZ4N/INPMoZSggx7ZGbVCX5Q2mG+aA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oviqGFpa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65BE606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D65BE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oviqGFpa
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b570ff3dfdso263930a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:42:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794944543; cv=none;
        d=google.com; s=arc-20260327;
        b=RklaIAcXAuv6yteXUKi1dwcZJCAMJwPjOnL+hK+qLdf/lUBr0HDwpYVnTLI7nQx5eP
         pUg9ULZGQYN/r32gT9KloiAxLdyiAyk09eYzWYCpyVSjNsoylUddbWG9LpKhL0oLkNR6
         /+alHgvS0Zk6Zj+skTaynRe8qneHwynmebh0vr+7yHFknKfw6rs0fRzjA/1xgI4MHgK0
         dfIgYh6bgK3cxHsQPll6E9ybveKCPv7fWFO3YBkXaUbAh/3MEt17SI72lSi8h8vnvz1/
         Ul6y4OfKhugPOsE1K4SWm1ilfpCSl/6LYREAML7jnHwmz1cyJH8xzb8QfsCV6fTbK2+o
         2JIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AFcGvIfIz79rcraQPv0Iru/QwvEijnYbQ83QE7nvTx0=;
        fh=Jr5WrWtka9JjR6Ab/zzP+vig/R6drnQ6jXabRAz/j+8=;
        b=quM4jDcf8MNsaF+Hr6zWPcPxzIK0n9VlnD7cdDnUSD9EUEAw2WleVjbnbhdZCixLGR
         1wrIEbrE1WjhGEtci0TmIxBolsIEco3xuSBRLSLaPFRlmMo/JM5O5occGQcfoORKf86D
         0cykAr9M38EuhwmnbKkqgbsoc/Em4NzqNqlrBNdGlLK+BZ2oBjM+34+qFJ+fvR5cudiA
         29L2R0tqktWlStoqK5fJ4uMp9DDo/wvekmgi+zw0pIDrXxbtLcx2ev2LBSXPabsNMKhp
         zcz72C+wkjOKYc/IRxYiPcOhUy8hemqM7bXALSbFAyOTxessisnGObVArjCgyv9Cc9aB
         CcTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944543; x=1795549343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AFcGvIfIz79rcraQPv0Iru/QwvEijnYbQ83QE7nvTx0=;
        b=oviqGFpaVJMhUyOYq63IfKVC2M6Y0yAVZp6mtybZN9nXZZ0knZkNYhA4t8g+d1siK0
         s/nckD9fHNhYryswpv9Z2thvO8ISUj0wl0L3UdTQnZQYPdxxFcxsRAc6gaqewtcXSMNG
         R82FBZ0nUzXnuhuNSCJqepdwXKBS17iv80phgagw9YoAdoiy/ARDHhRI131dP7yPEqOS
         nowVnaEYvlEG6TcT2ikfUtL9DOTR4J1vCNlEb78OBs+9R36PnF1BhIP4PGO4xKUD+T8O
         +quoQqFzKjfewAd9xK47m9X7P6P3Fe0E1qi5Zl/xkBBgMwvE67cqDYkZL6r3eF7LLCGg
         8amQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944543; x=1795549343;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFcGvIfIz79rcraQPv0Iru/QwvEijnYbQ83QE7nvTx0=;
        b=nkb9slnKlMz56NhJ8zL27MCrRWUHu9ZnrfCrX92uNcfEfXeamvWzVWHy4AOwg0mzY3
         iJ7z8ULf04IU/TFlGPtxURfUAil/cP9o942Opbgs92oaUNNwkCz1WpVzavrXyPwdaTi/
         9fDnFiM063hvuEUBaTjrCHOMkmuIx3YyE6FHEl8hJEs25RTGwD7Nwx01ISCdC8RntemM
         zrh/n8vvKlsB3HIHIGuleRh+ujUvA5e6auH11XGo0GT9HefiTMjSGtlBLx6NfhROTyMh
         QoOkbFYxMaMKN8ZNWao+GB4ZoGSoZYZum60OkbeSKf3v8NUxBPivY/wRpkVzFG4mqFDF
         A3KQ==
X-Forwarded-Encrypted: i=1; AL+hErFrydIw7eyOIcAvvEsFJBI1dPqEV7KuhBt+ls9HgfWt7YZFya18SXCcp5TVoQHIvv75/DX7jpGavvcpu18=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qbQBBGFWZnfl5RABuG2PHsVIUeMLuKXGADTV9fUhL46S7vqt/
	o+ZN9do430zFYgcXgeFS5fw08wfICnURxREMC9y3113knnKXviYgbn8GFOowQGHRe84Qnc5DF/i
	tazn2TACgtGAz2MPvuPvlNv1Sark2l9Q=
X-Gm-Gg: AYBFou2DDAIc9iYalTkCiW+dRp/SGrvHfb17xTMP+60wxdO9WcUsFx1R5C4YDtVsl++
	ekjQ1LBNRgjdi+xiW1T5ILXdlDWAs8nb6jyaUckSONzdG0asOT4ZoAFJmPTf0tNE5g6ttqTKrYg
	I7yulZOWs5S6zYoZ0IfBcB7gXw/I6YyyMHwMVgb+fzJpuHcS2w85/f8WTU/IelprCf61GMzg0DQ
	1S41UsqWNoY9R+UOA9k0h+WPsAXN5og3yO1Pny1IUbVUQeTr/NYTUYtCn0IDbpkkychSJ/fePGV
	2LQZn93vaIXYOSbSRzYGEp97YjH1y3YOhBfBbyooYP+zoIrMgDFXykHeZXbM63zoaFKJqZC6amp
	CUkAFqU8B12Nfop10g7mc5kgQThi+ngYNPmZcHT5//as7DRpk7BQHotA8osGiPhjpZOlCZiH7ac
	wB3LMvZ3AkBmkdvjrXKuvsU9r69TUG/flSLy8lo/V+tfL2BZkIKGEKO0ilIEDCDxUMRCY4a7yt3
	3sWDt5b/D5Mrg1s6kpE/QWD7hFEkA==
X-Received: by 2002:a05:6402:501c:b0:6b6:e857:19d8 with SMTP id
 4fb4d7f45d1cf-6b887e555c0mr223557a12.10.1794944542456; Tue, 17 Nov 2026
 11:42:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
 <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-1-cbc49c5c5e74@gmail.com>
 <9c247830067d2192acfe08080d1c5f2bb366cf1a.camel@crapouillou.net>
In-Reply-To: <9c247830067d2192acfe08080d1c5f2bb366cf1a.camel@crapouillou.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:42:09 -0700
X-Gm-Features: AclHuK8Sn_AQ0t-c97ZLgnZTti2QWAbSYl3h8xi8v3RmTW0i7B2C1Xt9cbs95jE
Message-ID: <CADvTj4pQ+ArZVZKtuc94sVbP4HuMpkZMS+hSRCcj30Ey8gUecg@mail.gmail.com>
Subject: Re: [PATCH v5 01/58] nvmem: disconnect provider callbacks before
 unregister returns
To: Paul Cercueil <paul@crapouillou.net>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Tze Yee Ng <tze.yee.ng@altera.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 4:26=E2=80=AFAM Paul Cercueil <paul@crapouillou.net=
> wrote:
>
> Hi James,
>
> Le dimanche 15 novembre 2026 =C3=A0 23:29 -0700, James Hilliard a =C3=A9c=
rit :
> > An NVMEM consumer or device reference can outlive provider unbind. The
> > reference retains the NVMEM allocation, but not the private data or
> > hardware resources that the provider releases during remove. Pinning th=
e
> > provider module also does not prevent unbind from freeing that state.
> >
> > Reject new callback access once unregister starts and drain admitted
> > accesses with SRCU before returning to the provider. Cover register
> > access, keepout handling, cell post-processing and device matching.
> > Existing consumers retain core-owned metadata and return -ENODEV after
> > disconnection. Release the write-protect GPIO after the drain so
> > retained references do not prevent a new provider from requesting it.
> > The final device release frees only core-owned data.
> >
> > Give cell entries their own references and retire layout cells when
> > their driver is unbound. Remove and drain cell attributes and callbacks
> > before layout-owned state is freed. Rebinding creates new entries; held
> > old cells remain disconnected. Remove partially added cells when a
> > layout probe fails, and destroy the layout during provider unregister
> > rather than at the final consumer put.
> >
> > Track layout ownership explicitly so provider cells added after layout
> > creation survive its unbind. Rebuild sysfs cell attributes when layouts
> > bind or unbind, retaining cell entries until their attributes have been
> > removed. Free partial attribute allocations on failure and remove the
> > group before device deletion. Only notify provider removal after a
> > successful registration notification.
> >
> > Preserve the existing exporter-module references and allow providers
> > to specify an explicit NULL owner when their operations are built in.
> > Providers remain responsible for unregistering before releasing
> > callback state.
> >
> > Retain the firmware node explicitly and serialize consumer-reference
> > acquisition with disconnection. This lets MTD unregister an OTP provide=
r
> > before freeing its backing object without requiring a release callback
> > into the departing provider module.
>
> The fact that you have 5 paragraphs listing everything that the patch doe=
s makes
> me think it should not be one patch, but a dozen of them.

I went ahead and split the nvmem changes out into an independent series:
https://lore.kernel.org/r/20261117-submit-nvmem-provider-lifetime-v1-v1-0-3=
cfbd48812b5@gmail.com/

>
> This is just impossible to review, to be honest.
>
> Cheers,
> -Paul
>
> > Cc: Srinivas Kandagatla <srini@kernel.org>
> > Cc: Tze Yee Ng <tze.yee.ng@altera.com>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/nvmem/Kconfig                |   1 +
> >  drivers/nvmem/core.c                 | 463 +++++++++++++++++++++++----=
-------
> > -
> >  drivers/nvmem/internals.h            |  16 +-
> >  drivers/nvmem/layouts.c              |   2 +
> >  drivers/nvmem/layouts/fixed-layout.c |   2 +-
> >  drivers/nvmem/layouts/onie-tlv.c     |  20 +-
> >  drivers/nvmem/layouts/sl28vpd.c      |   3 +-
> >  drivers/nvmem/layouts/u-boot-env.c   |  25 +-
> >  include/linux/nvmem-provider.h       |  16 +-
> >  9 files changed, 373 insertions(+), 175 deletions(-)
> >
> > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> > index c36c2a4c2a0b..550f3118071a 100644
> > --- a/drivers/nvmem/Kconfig
> > +++ b/drivers/nvmem/Kconfig
> > @@ -1,6 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  menuconfig NVMEM
> >       bool "NVMEM Support"
> > +     select SRCU
> >       imply NVMEM_LAYOUTS
> >       help
> >         Support for NVMEM(Non Volatile Memory) devices like EEPROM,
> > EFUSES...
> > diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> > index 0556d140170a..b71d80d140dd 100644
> > --- a/drivers/nvmem/core.c
> > +++ b/drivers/nvmem/core.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/idr.h>
> >  #include <linux/init.h>
> >  #include <linux/kref.h>
> > +#include <linux/lockdep.h>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> >  #include <linux/nvmem-consumer.h>
> > @@ -26,7 +27,11 @@
> >  #define to_nvmem_device(d) container_of(d, struct nvmem_device, dev)
> >
> >  #define FLAG_COMPAT          BIT(0)
> > +#define FLAG_REGISTERED              BIT(1)
> >  struct nvmem_cell_entry {
> > +     struct kref             refcnt;
> > +     bool                    disconnected;
> > +     struct nvmem_layout     *layout;
> >       const char              *name;
> >       int                     offset;
> >       size_t                  raw_len;
> > @@ -54,31 +59,30 @@ static LIST_HEAD(nvmem_lookup_list);
> >
> >  static BLOCKING_NOTIFIER_HEAD(nvmem_notifier);
> >
> > +static void nvmem_cell_entry_put(struct nvmem_cell_entry *cell);
> > +
> >  static int __nvmem_reg_read(struct nvmem_device *nvmem, unsigned int o=
ffset,
> >                           void *val, size_t bytes)
> >  {
> > -     struct nvmem_operations *ops =3D nvmem->ops;
> > -
> > -     if (!ops->reg_read)
> > +     if (!nvmem->reg_read)
> >               return -EOPNOTSUPP;
> >
> > -     return ops->reg_read(nvmem->priv, offset, val, bytes);
> > +     return nvmem->reg_read(nvmem->priv, offset, val, bytes);
> >  }
> >
> >  static int __nvmem_reg_write(struct nvmem_device *nvmem, unsigned int =
offset,
> >                            void *val, size_t bytes)
> >  {
> > -     struct nvmem_operations *ops =3D nvmem->ops;
> >       int ret, wr_ok;
> >
> > -     if (!ops->reg_write)
> > +     if (!nvmem->reg_write)
> >               return -EOPNOTSUPP;
> >
> >       ret =3D gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
> >       if (ret)
> >               return ret;
> >
> > -     wr_ok =3D ops->reg_write(nvmem->priv, offset, val, bytes);
> > +     wr_ok =3D nvmem->reg_write(nvmem->priv, offset, val, bytes);
> >
> >       ret =3D gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
> >       if (ret)
> > @@ -154,6 +158,10 @@ static int nvmem_access_with_keepouts(struct nvmem=
_device
> > *nvmem,
> >  static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int off=
set,
> >                         void *val, size_t bytes)
> >  {
> > +     guard(srcu)(&nvmem->srcu);
> > +     if (READ_ONCE(nvmem->disconnected))
> > +             return -ENODEV;
> > +
> >       if (!nvmem->nkeepout)
> >               return __nvmem_reg_read(nvmem, offset, val, bytes);
> >
> > @@ -163,6 +171,10 @@ static int nvmem_reg_read(struct nvmem_device *nvm=
em,
> > unsigned int offset,
> >  static int nvmem_reg_write(struct nvmem_device *nvmem, unsigned int of=
fset,
> >                          void *val, size_t bytes)
> >  {
> > +     guard(srcu)(&nvmem->srcu);
> > +     if (READ_ONCE(nvmem->disconnected))
> > +             return -ENODEV;
> > +
> >       if (!nvmem->nkeepout)
> >               return __nvmem_reg_write(nvmem, offset, val, bytes);
> >
> > @@ -289,8 +301,6 @@ static ssize_t bin_attr_nvmem_write(struct file *fi=
lp,
> > struct kobject *kobj,
> >
> >  static umode_t nvmem_bin_attr_get_umode(struct nvmem_device *nvmem)
> >  {
> > -     struct nvmem_operations *ops =3D nvmem->ops;
> > -
> >       umode_t mode =3D 0400;
> >
> >       if (!nvmem->root_only)
> > @@ -299,10 +309,10 @@ static umode_t nvmem_bin_attr_get_umode(struct
> > nvmem_device *nvmem)
> >       if (!nvmem->read_only)
> >               mode |=3D 0200;
> >
> > -     if (!ops->reg_write)
> > +     if (!nvmem->reg_write)
> >               mode &=3D ~0200;
> >
> > -     if (!ops->reg_read)
> > +     if (!nvmem->reg_read)
> >               mode &=3D ~0444;
> >
> >       return mode;
> > @@ -333,7 +343,6 @@ static umode_t nvmem_attr_is_visible(struct kobject=
 *kobj,
> >  {
> >       struct device *dev =3D kobj_to_dev(kobj);
> >       struct nvmem_device *nvmem =3D to_nvmem_device(dev);
> > -     struct nvmem_operations *ops =3D nvmem->ops;
> >
> >       /*
> >        * If the device has no .reg_write operation, do not allow
> > @@ -342,7 +351,7 @@ static umode_t nvmem_attr_is_visible(struct kobject=
 *kobj,
> >        * can be forced into read-write mode using the 'force_ro'
> >        * attribute.
> >        */
> > -     if (attr =3D=3D &dev_attr_force_ro.attr && !ops->reg_write)
> > +     if (attr =3D=3D &dev_attr_force_ro.attr && !nvmem->reg_write)
> >               return 0;       /* Attribute not visible */
> >
> >       return attr->mode;
> > @@ -466,59 +475,102 @@ static void nvmem_sysfs_remove_compat(struct
> > nvmem_device *nvmem)
> >               device_remove_bin_file(nvmem->base_dev, &nvmem->eeprom);
> >  }
> >
> > -static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
> > +static void nvmem_sysfs_free_cell_attrs(const struct bin_attribute * c=
onst
> > *attrs)
> >  {
> > -     struct attribute_group group =3D {
> > -             .name   =3D "cells",
> > -     };
> > -     struct nvmem_cell_entry *entry;
> > -     const struct bin_attribute **pattrs;
> > -     struct bin_attribute *attrs;
> > -     unsigned int ncells =3D 0, i =3D 0;
> > -     int ret;
> > +     if (!attrs)
> > +             return;
> >
> > -     guard(mutex)(&nvmem_mutex);
> > +     for (int i =3D 0; attrs[i]; i++) {
> > +             nvmem_cell_entry_put(attrs[i]->private);
> > +             kfree(attrs[i]->attr.name);
> > +             kfree(attrs[i]);
> > +     }
> > +     kfree(attrs);
> > +}
> >
> > -     if (list_empty(&nvmem->cells) || nvmem->sysfs_cells_populated)
> > -             return 0;
> > +static void __nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
> > +{
> > +     lockdep_assert_held(&nvmem->sysfs_mutex);
> >
> > -     /* Allocate an array of attributes with a sentinel */
> > -     ncells =3D list_count_nodes(&nvmem->cells);
> > -     pattrs =3D devm_kcalloc(&nvmem->dev, ncells + 1,
> > -                           sizeof(struct bin_attribute *), GFP_KERNEL)=
;
> > -     if (!pattrs)
> > -             return -ENOMEM;
> > +     if (!nvmem->sysfs_cells_populated)
> > +             return;
> >
> > -     attrs =3D devm_kcalloc(&nvmem->dev, ncells, sizeof(struct
> > bin_attribute), GFP_KERNEL);
> > -     if (!attrs)
> > -             return -ENOMEM;
> > +     device_remove_group(&nvmem->dev, &nvmem->cells_group);
> > +     nvmem_sysfs_free_cell_attrs(nvmem->cells_group.bin_attrs);
> > +     nvmem->cells_group.bin_attrs =3D NULL;
> > +     nvmem->sysfs_cells_populated =3D false;
> > +}
> > +
> > +static void nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
> > +{
> > +     guard(mutex)(&nvmem->sysfs_mutex);
> > +     __nvmem_sysfs_remove_cells(nvmem);
> > +}
> > +
> > +static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
> > +{
> > +     struct nvmem_cell_entry *entry;
> > +     const struct bin_attribute **attrs =3D NULL;
> > +     unsigned int i =3D 0;
> > +     int ret =3D 0;
> >
> > -     /* Initialize each attribute to take the name and size of the cel=
l */
> > -     list_for_each_entry(entry, &nvmem->cells, node) {
> > -             sysfs_bin_attr_init(&attrs[i]);
> > -             attrs[i].attr.name =3D devm_kasprintf(&nvmem->dev, GFP_KE=
RNEL,
> > -                                                 "%s@%x,%x", entry->na=
me,
> > -                                                 entry->offset,
> > -                                                 entry->bit_offset);
> > -             attrs[i].attr.mode =3D 0444 & nvmem_bin_attr_get_umode(nv=
mem);
> > -             attrs[i].size =3D entry->bytes;
> > -             attrs[i].read =3D &nvmem_cell_attr_read;
> > -             attrs[i].private =3D entry;
> > -             if (!attrs[i].attr.name)
> > +     guard(mutex)(&nvmem->sysfs_mutex);
> > +
> > +     __nvmem_sysfs_remove_cells(nvmem);
> > +
> > +     scoped_guard(mutex, &nvmem_mutex) {
> > +             if (nvmem->disconnected)
> > +                     return -ENODEV;
> > +             if (list_empty(&nvmem->cells))
> > +                     return 0;
> > +
> > +             attrs =3D kcalloc(list_count_nodes(&nvmem->cells) + 1,
> > +                             sizeof(*attrs), GFP_KERNEL);
> > +             if (!attrs)
> >                       return -ENOMEM;
> >
> > -             pattrs[i] =3D &attrs[i];
> > -             i++;
> > +             list_for_each_entry(entry, &nvmem->cells, node) {
> > +                     struct bin_attribute *attr;
> > +
> > +                     attr =3D kzalloc_obj(*attr);
> > +                     if (!attr) {
> > +                             ret =3D -ENOMEM;
> > +                             break;
> > +                     }
> > +                     sysfs_bin_attr_init(attr);
> > +                     attr->attr.name =3D kasprintf(GFP_KERNEL, "%s@%x,=
%x",
> > +                                                entry->name, entry-
> > >offset,
> > +                                                entry->bit_offset);
> > +                     if (!attr->attr.name) {
> > +                             kfree(attr);
> > +                             ret =3D -ENOMEM;
> > +                             break;
> > +                     }
> > +                     attr->attr.mode =3D 0444 &
> > nvmem_bin_attr_get_umode(nvmem);
> > +                     attr->size =3D entry->bytes;
> > +                     attr->read =3D nvmem_cell_attr_read;
> > +                     attr->private =3D entry;
> > +                     kref_get(&entry->refcnt);
> > +                     attrs[i++] =3D attr;
> > +             }
> >       }
> > +     if (ret)
> > +             goto err_free;
> >
> > -     group.bin_attrs =3D pattrs;
> > +     nvmem->cells_group.name =3D "cells";
> > +     nvmem->cells_group.bin_attrs =3D attrs;
> >
> > -     ret =3D device_add_group(&nvmem->dev, &group);
> > -     if (ret)
> > -             return ret;
> > +     ret =3D device_add_group(&nvmem->dev, &nvmem->cells_group);
> > +     if (ret) {
> > +             nvmem->cells_group.bin_attrs =3D NULL;
> > +             goto err_free;
> > +     }
> >
> >       nvmem->sysfs_cells_populated =3D true;
> > +     return 0;
> >
> > +err_free:
> > +     nvmem_sysfs_free_cell_attrs(attrs);
> >       return ret;
> >  }
> >
> > @@ -533,6 +585,10 @@ static void nvmem_sysfs_remove_compat(struct nvmem=
_device
> > *nvmem)
> >  {
> >  }
> >
> > +static void nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
> > +{
> > +}
> > +
> >  #endif /* CONFIG_NVMEM_SYSFS */
> >
> >  static void nvmem_release(struct device *dev)
> > @@ -540,8 +596,8 @@ static void nvmem_release(struct device *dev)
> >       struct nvmem_device *nvmem =3D to_nvmem_device(dev);
> >
> >       ida_free(&nvmem_ida, nvmem->id);
> > -     gpiod_put(nvmem->wp_gpio);
> > -     kfree(nvmem->ops);
> > +     of_node_put(nvmem->dev.of_node);
> > +     cleanup_srcu_struct(&nvmem->srcu);
> >       kfree(nvmem);
> >  }
> >
> > @@ -553,22 +609,30 @@ static const struct bus_type nvmem_bus_type =3D {
> >       .name           =3D "nvmem",
> >  };
> >
> > -static void nvmem_cell_entry_drop(struct nvmem_cell_entry *cell)
> > +static void nvmem_cell_entry_release(struct kref *ref)
> >  {
> > -     blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE,
> > cell);
> > -     scoped_guard(mutex, &nvmem_mutex)
> > -             list_del(&cell->node);
> > +     struct nvmem_cell_entry *cell =3D container_of(ref, struct
> > nvmem_cell_entry, refcnt);
> > +
> >       of_node_put(cell->np);
> >       kfree_const(cell->name);
> >       kfree(cell);
> >  }
> >
> > +static void nvmem_cell_entry_put(struct nvmem_cell_entry *cell)
> > +{
> > +     kref_put(&cell->refcnt, nvmem_cell_entry_release);
> > +}
> > +
> >  static void nvmem_device_remove_all_cells(const struct nvmem_device *n=
vmem)
> >  {
> >       struct nvmem_cell_entry *cell, *p;
> >
> > -     list_for_each_entry_safe(cell, p, &nvmem->cells, node)
> > -             nvmem_cell_entry_drop(cell);
> > +     list_for_each_entry_safe(cell, p, &nvmem->cells, node) {
> > +             blocking_notifier_call_chain(&nvmem_notifier,
> > NVMEM_CELL_REMOVE, cell);
> > +             scoped_guard(mutex, &nvmem_mutex)
> > +                     list_del(&cell->node);
> > +             nvmem_cell_entry_put(cell);
> > +     }
> >  }
> >
> >  static void nvmem_cell_entry_add(struct nvmem_cell_entry *cell)
> > @@ -583,6 +647,7 @@ static int
> > nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
> >                                                    struct nvmem_cell_en=
try
> > *cell)
> >  {
> >       cell->nvmem =3D nvmem;
> > +     cell->disconnected =3D false;
> >       cell->offset =3D info->offset;
> >       cell->raw_len =3D info->raw_len ?: info->bytes;
> >       cell->bytes =3D info->bytes;
> > @@ -639,20 +704,17 @@ static int nvmem_cell_info_to_nvmem_cell_entry(st=
ruct
> > nvmem_device *nvmem,
> >       return 0;
> >  }
> >
> > -/**
> > - * nvmem_add_one_cell() - Add one cell information to an nvmem device
> > - *
> > - * @nvmem: nvmem device to add cells to.
> > - * @info: nvmem cell info to add to the device
> > - *
> > - * Return: 0 or negative error code on failure.
> > - */
> > -int nvmem_add_one_cell(struct nvmem_device *nvmem,
> > -                    const struct nvmem_cell_info *info)
> > +static int __nvmem_add_one_cell(struct nvmem_device *nvmem,
> > +                             const struct nvmem_cell_info *info,
> > +                             struct nvmem_layout *layout)
> >  {
> >       struct nvmem_cell_entry *cell;
> >       int rval;
> >
> > +     guard(srcu)(&nvmem->srcu);
> > +     if (READ_ONCE(nvmem->disconnected))
> > +             return -ENODEV;
> > +
> >       cell =3D kzalloc_obj(*cell);
> >       if (!cell)
> >               return -ENOMEM;
> > @@ -663,12 +725,45 @@ int nvmem_add_one_cell(struct nvmem_device *nvmem=
,
> >               return rval;
> >       }
> >
> > +     kref_init(&cell->refcnt);
> > +     cell->layout =3D layout;
> >       nvmem_cell_entry_add(cell);
> >
> >       return 0;
> >  }
> > +
> > +/**
> > + * nvmem_add_one_cell() - Add one cell information to an nvmem device
> > + *
> > + * @nvmem: nvmem device to add cells to.
> > + * @info: nvmem cell info to add to the device
> > + *
> > + * Return: 0 or negative error code on failure.
> > + */
> > +int nvmem_add_one_cell(struct nvmem_device *nvmem,
> > +                    const struct nvmem_cell_info *info)
> > +{
> > +     return __nvmem_add_one_cell(nvmem, info, NULL);
> > +}
> >  EXPORT_SYMBOL_GPL(nvmem_add_one_cell);
> >
> > +/**
> > + * nvmem_layout_add_cell() - Add a cell owned by an NVMEM layout
> > + * @layout: Layout registering the cell from its add_cells callback.
> > + * @info: Cell description.
> > + *
> > + * The cell and its post-processing callback are disconnected when the=
 layout
> > + * is unregistered. Provider cells added with nvmem_add_one_cell() are
> > retained.
> > + *
> > + * Return: 0 or a negative error code.
> > + */
> > +int nvmem_layout_add_cell(struct nvmem_layout *layout,
> > +                       const struct nvmem_cell_info *info)
> > +{
> > +     return __nvmem_add_one_cell(layout->nvmem, info, layout);
> > +}
> > +EXPORT_SYMBOL_GPL(nvmem_layout_add_cell);
> > +
> >  /**
> >   * nvmem_add_cells() - Add cell information to an nvmem device
> >   *
> > @@ -729,6 +824,7 @@ nvmem_find_cell_entry_by_name(struct nvmem_device *=
nvmem,
> > const char *cell_id)
> >       list_for_each_entry(iter, &nvmem->cells, node) {
> >               if (strcmp(cell_id, iter->name) =3D=3D 0) {
> >                       cell =3D iter;
> > +                     kref_get(&cell->refcnt);
> >                       break;
> >               }
> >       }
> > @@ -789,12 +885,17 @@ static int nvmem_validate_keepouts(struct nvmem_d=
evice
> > *nvmem)
> >       return 0;
> >  }
> >
> > -int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_=
node
> > *np)
> > +static int __nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struc=
t
> > device_node *np,
> > +                                  struct nvmem_layout *layout)
> >  {
> >       struct device *dev =3D &nvmem->dev;
> >       const __be32 *addr;
> >       int len, ret;
> >
> > +     guard(srcu)(&nvmem->srcu);
> > +     if (READ_ONCE(nvmem->disconnected))
> > +             return -ENODEV;
> > +
> >       for_each_child_of_node_scoped(np, child) {
> >               struct nvmem_cell_info info =3D {0};
> >
> > @@ -827,7 +928,7 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nv=
mem,
> > struct device_node *np)
> >               if (nvmem->fixup_dt_cell_info)
> >                       nvmem->fixup_dt_cell_info(nvmem, &info);
> >
> > -             ret =3D nvmem_add_one_cell(nvmem, &info);
> > +             ret =3D __nvmem_add_one_cell(nvmem, &info, layout);
> >               kfree(info.name);
> >               if (ret) {
> >                       of_node_put(info.np);
> > @@ -837,8 +938,19 @@ int nvmem_add_cells_from_dt(struct nvmem_device *n=
vmem,
> > struct device_node *np)
> >
> >       return 0;
> >  }
> > +
> > +int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_=
node
> > *np)
> > +{
> > +     return __nvmem_add_cells_from_dt(nvmem, np, NULL);
> > +}
> >  EXPORT_SYMBOL_GPL(nvmem_add_cells_from_dt);
> >
> > +int nvmem_layout_add_cells_from_dt(struct nvmem_layout *layout, struct
> > device_node *np)
> > +{
> > +     return __nvmem_add_cells_from_dt(layout->nvmem, np, layout);
> > +}
> > +EXPORT_SYMBOL_GPL(nvmem_layout_add_cells_from_dt);
> > +
> >  static int nvmem_add_cells_from_legacy_of(struct nvmem_device *nvmem)
> >  {
> >       return nvmem_add_cells_from_dt(nvmem, nvmem->dev.of_node);
> > @@ -851,29 +963,68 @@ int nvmem_layout_register(struct nvmem_layout *la=
yout)
> >       if (!layout->add_cells)
> >               return -EINVAL;
> >
> > -     /* Populate the cells */
> > -     ret =3D layout->add_cells(layout);
> > +     scoped_guard(srcu, &layout->nvmem->srcu) {
> > +             if (READ_ONCE(layout->nvmem->disconnected))
> > +                     return -ENODEV;
> > +             ret =3D layout->add_cells(layout);
> > +     }
> >       if (ret)
> > -             return ret;
> > +             goto err_unregister;
> >
> >  #ifdef CONFIG_NVMEM_SYSFS
> >       ret =3D nvmem_populate_sysfs_cells(layout->nvmem);
> > -     if (ret) {
> > -             nvmem_device_remove_all_cells(layout->nvmem);
> > -             return ret;
> > -     }
> > +     if (ret)
> > +             goto err_unregister;
> >  #endif
> >
> >       return 0;
> > +
> > +err_unregister:
> > +     nvmem_layout_unregister(layout);
> > +     return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(nvmem_layout_register);
> >
> >  void nvmem_layout_unregister(struct nvmem_layout *layout)
> >  {
> > -     /* Keep the API even with an empty stub in case we need it later =
*/
> > +     struct nvmem_device *nvmem =3D layout->nvmem;
> > +     struct nvmem_cell_entry *cell, *next;
> > +     LIST_HEAD(cells);
> > +
> > +     scoped_guard(mutex, &nvmem_mutex) {
> > +             list_for_each_entry_safe(cell, next, &nvmem->cells, node)=
 {
> > +                     if (cell->layout !=3D layout)
> > +                             continue;
> > +                     WRITE_ONCE(cell->disconnected, true);
> > +                     list_move_tail(&cell->node, &cells);
> > +             }
> > +     }
> > +
> > +     nvmem_sysfs_remove_cells(nvmem);
> > +
> > +     /* Old cell handles retain data, never a departing layout's
> > callbacks. */
> > +     synchronize_srcu(&nvmem->srcu);
> > +     list_for_each_entry_safe(cell, next, &cells, node) {
> > +             blocking_notifier_call_chain(&nvmem_notifier,
> > NVMEM_CELL_REMOVE, cell);
> > +             list_del(&cell->node);
> > +             nvmem_cell_entry_put(cell);
> > +     }
> > +#ifdef CONFIG_NVMEM_SYSFS
> > +     if (!READ_ONCE(nvmem->disconnected) &&
> > nvmem_populate_sysfs_cells(nvmem))
> > +             dev_warn(&nvmem->dev, "Failed to restore provider cell
> > attributes\n");
> > +#endif
> >  }
> >  EXPORT_SYMBOL_GPL(nvmem_layout_unregister);
> >
> > +static void nvmem_disconnect(struct nvmem_device *nvmem)
> > +{
> > +     scoped_guard(mutex, &nvmem_mutex)
> > +             WRITE_ONCE(nvmem->disconnected, true);
> > +     synchronize_srcu(&nvmem->srcu);
> > +     gpiod_put(nvmem->wp_gpio);
> > +     nvmem->wp_gpio =3D NULL;
> > +}
> > +
> >  /**
> >   * nvmem_register() - Register a nvmem device for given nvmem_config.
> >   * Also creates a binary entry in /sys/bus/nvmem/devices/dev-name/nvme=
m
> > @@ -883,10 +1034,8 @@ EXPORT_SYMBOL_GPL(nvmem_layout_unregister);
> >   * Return: Will be an ERR_PTR() on error or a valid pointer to nvmem_d=
evice
> >   * on success.
> >   */
> > -
> >  struct nvmem_device *nvmem_register(const struct nvmem_config *config)
> >  {
> > -     struct nvmem_operations *ops;
> >       struct nvmem_device *nvmem;
> >       int rval;
> >
> > @@ -900,15 +1049,15 @@ struct nvmem_device *nvmem_register(const struct
> > nvmem_config *config)
> >       if (!nvmem)
> >               return ERR_PTR(-ENOMEM);
> >
> > -     ops =3D kzalloc_obj(*ops);
> > -     if (!ops) {
> > +     rval =3D init_srcu_struct(&nvmem->srcu);
> > +     if (rval) {
> >               kfree(nvmem);
> > -             return ERR_PTR(-ENOMEM);
> > +             return ERR_PTR(rval);
> >       }
> >
> >       rval =3D ida_alloc(&nvmem_ida, GFP_KERNEL);
> >       if (rval < 0) {
> > -             kfree(ops);
> > +             cleanup_srcu_struct(&nvmem->srcu);
> >               kfree(nvmem);
> >               return ERR_PTR(rval);
> >       }
> > @@ -918,9 +1067,11 @@ struct nvmem_device *nvmem_register(const struct
> > nvmem_config *config)
> >       nvmem->dev.type =3D &nvmem_provider_type;
> >       nvmem->dev.bus =3D &nvmem_bus_type;
> >       nvmem->dev.parent =3D config->dev;
> > -     nvmem->ops =3D ops;
> >
> >       device_initialize(&nvmem->dev);
> > +     mutex_init(&nvmem->sysfs_mutex);
> > +
> > +     nvmem->priv =3D config->priv;
> >
> >       if (!config->ignore_wp)
> >               nvmem->wp_gpio =3D gpiod_get_optional(config->dev, "wp",
> > @@ -935,24 +1086,23 @@ struct nvmem_device *nvmem_register(const struct
> > nvmem_config *config)
> >       INIT_LIST_HEAD(&nvmem->cells);
> >       nvmem->fixup_dt_cell_info =3D config->fixup_dt_cell_info;
> >
> > -     ops->reg_read =3D config->reg_read;
> > -     ops->reg_write =3D config->reg_write;
> > +     nvmem->reg_read =3D config->reg_read;
> > +     nvmem->reg_write =3D config->reg_write;
> >
> >       nvmem->owner =3D config->owner;
> > -     if (!nvmem->owner && config->dev->driver)
> > +     if (!nvmem->owner && !config->owner_is_explicit && config->dev-
> > >driver)
> >               nvmem->owner =3D config->dev->driver->owner;
> >       nvmem->stride =3D config->stride ?: 1;
> >       nvmem->word_size =3D config->word_size ?: 1;
> >       nvmem->size =3D config->size;
> >       nvmem->root_only =3D config->root_only;
> > -     nvmem->priv =3D config->priv;
> >       nvmem->type =3D config->type;
> >       nvmem->keepout =3D config->keepout;
> >       nvmem->nkeepout =3D config->nkeepout;
> >       if (config->of_node)
> > -             nvmem->dev.of_node =3D config->of_node;
> > +             nvmem->dev.of_node =3D of_node_get(config->of_node);
> >       else
> > -             nvmem->dev.of_node =3D config->dev->of_node;
> > +             nvmem->dev.of_node =3D of_node_get(config->dev->of_node);
> >
> >       switch (config->id) {
> >       case NVMEM_DEVID_NONE:
> > @@ -972,7 +1122,7 @@ struct nvmem_device *nvmem_register(const struct
> > nvmem_config *config)
> >               goto err_put_device;
> >
> >       nvmem->read_only =3D device_property_present(config->dev, "read-o=
nly")
> > ||
> > -                        config->read_only || !ops->reg_write;
> > +                        config->read_only || !nvmem->reg_write;
> >
> >  #ifdef CONFIG_NVMEM_SYSFS
> >       nvmem->dev.groups =3D nvmem_dev_groups;
> > @@ -1010,7 +1160,7 @@ struct nvmem_device *nvmem_register(const struct
> > nvmem_config *config)
> >
> >       rval =3D nvmem_populate_layout(nvmem);
> >       if (rval)
> > -             goto err_remove_dev;
> > +             goto err_unregister;
> >
> >       /* If the device has WP GPIO, default to read-only */
> >       if (nvmem->wp_gpio)
> > @@ -1019,23 +1169,25 @@ struct nvmem_device *nvmem_register(const struc=
t
> > nvmem_config *config)
> >  #ifdef CONFIG_NVMEM_SYSFS
> >       rval =3D nvmem_populate_sysfs_cells(nvmem);
> >       if (rval)
> > -             goto err_destroy_layout;
> > +             goto err_unregister;
> >  #endif
> >
> > +     nvmem->flags |=3D FLAG_REGISTERED;
> >       blocking_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
> >
> >       return nvmem;
> >
> > -#ifdef CONFIG_NVMEM_SYSFS
> > -err_destroy_layout:
> > -     nvmem_destroy_layout(nvmem);
> > -#endif
> > -err_remove_dev:
> > -     device_del(&nvmem->dev);
> > +err_unregister:
> > +     nvmem_unregister(nvmem);
> > +     return ERR_PTR(rval);
> >  err_remove_cells:
> > +     nvmem_disconnect(nvmem);
> >       nvmem_device_remove_all_cells(nvmem);
> >       nvmem_sysfs_remove_compat(nvmem);
> > +     goto err_put_disconnected;
> >  err_put_device:
> > +     nvmem_disconnect(nvmem);
> > +err_put_disconnected:
> >       put_device(&nvmem->dev);
> >
> >       return ERR_PTR(rval);
> > @@ -1048,24 +1200,31 @@ static void nvmem_device_release(struct kref *k=
ref)
> >
> >       nvmem =3D container_of(kref, struct nvmem_device, refcnt);
> >
> > -     blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem=
);
> > -
> > -     nvmem_sysfs_remove_compat(nvmem);
> > -
> > -     nvmem_device_remove_all_cells(nvmem);
> > -     nvmem_destroy_layout(nvmem);
> > -     device_unregister(&nvmem->dev);
> > +     put_device(&nvmem->dev);
> >  }
> >
> >  /**
> >   * nvmem_unregister() - Unregister previously registered nvmem device
> >   *
> >   * @nvmem: Pointer to previously registered nvmem device.
> > + *
> > + * Stop and drain provider callbacks before returning. Existing consum=
ers
> > keep
> > + * their core-owned metadata, but further access returns -ENODEV.
> >   */
> >  void nvmem_unregister(struct nvmem_device *nvmem)
> >  {
> > -     if (nvmem)
> > -             kref_put(&nvmem->refcnt, nvmem_device_release);
> > +     if (!nvmem)
> > +             return;
> > +
> > +     nvmem_disconnect(nvmem);
> > +     nvmem_destroy_layout(nvmem);
> > +     if (nvmem->flags & FLAG_REGISTERED)
> > +             blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOV=
E,
> > nvmem);
> > +     nvmem_sysfs_remove_compat(nvmem);
> > +     nvmem_sysfs_remove_cells(nvmem);
> > +     device_del(&nvmem->dev);
> > +     nvmem_device_remove_all_cells(nvmem);
> > +     kref_put(&nvmem->refcnt, nvmem_device_release);
> >  }
> >  EXPORT_SYMBOL_GPL(nvmem_unregister);
> >
> > @@ -1103,17 +1262,33 @@ struct nvmem_device *devm_nvmem_register(struct=
 device
> > *dev,
> >  }
> >  EXPORT_SYMBOL_GPL(devm_nvmem_register);
> >
> > +struct nvmem_match_data {
> > +     void *data;
> > +     int (*match)(struct device *dev, const void *data);
> > +};
> > +
> > +static int nvmem_match_device(struct device *dev, const void *data)
> > +{
> > +     const struct nvmem_match_data *match =3D data;
> > +     struct nvmem_device *nvmem =3D to_nvmem_device(dev);
> > +
> > +     guard(srcu)(&nvmem->srcu);
> > +     if (READ_ONCE(nvmem->disconnected))
> > +             return 0;
> > +     return match->match(dev, match->data);
> > +}
> > +
> >  static struct nvmem_device *nvmem_device_match(void *data,
> >                       int (*match)(struct device *dev, const void *data=
))
> >  {
> > +     struct nvmem_match_data match_data =3D { .data =3D data, .match =
=3D match
> > };
> >       struct nvmem_device *nvmem =3D NULL;
> >       struct device *dev;
> >
> > -     scoped_guard(mutex, &nvmem_mutex) {
> > -             dev =3D bus_find_device(&nvmem_bus_type, NULL, data, matc=
h);
> > -             if (dev)
> > -                     nvmem =3D to_nvmem_device(dev);
> > -     }
> > +     guard(mutex)(&nvmem_mutex);
> > +     dev =3D bus_find_device(&nvmem_bus_type, NULL, &match_data,
> > nvmem_match_device);
> > +     if (dev)
> > +             nvmem =3D to_nvmem_device(dev);
> >       if (!nvmem)
> >               return ERR_PTR(-EPROBE_DEFER);
> >
> > @@ -1121,8 +1296,7 @@ static struct nvmem_device *nvmem_device_match(vo=
id
> > *data,
> >               dev_err(&nvmem->dev,
> >                       "could not increase module refcount for cell %s\n=
",
> >                       nvmem_dev_name(nvmem));
> > -
> > -             put_device(&nvmem->dev);
> > +             put_device(dev);
> >               return ERR_PTR(-EINVAL);
> >       }
> >
> > @@ -1337,8 +1511,10 @@ nvmem_cell_get_from_lookup(struct device *dev, c=
onst
> > char *con_id)
> >                               cell =3D ERR_PTR(-ENOENT);
> >                       } else {
> >                               cell =3D nvmem_create_cell(cell_entry, co=
n_id,
> > 0);
> > -                             if (IS_ERR(cell))
> > +                             if (IS_ERR(cell)) {
> > +                                     nvmem_cell_entry_put(cell_entry);
> >                                       nvmem_device_put(nvmem);
> > +                             }
> >                       }
> >                       break;
> >               }
> > @@ -1347,12 +1523,6 @@ nvmem_cell_get_from_lookup(struct device *dev, c=
onst
> > char *con_id)
> >       return cell;
> >  }
> >
> > -static void nvmem_layout_module_put(struct nvmem_device *nvmem)
> > -{
> > -     if (nvmem->layout && nvmem->layout->dev.driver)
> > -             module_put(nvmem->layout->dev.driver->owner);
> > -}
> > -
> >  #if IS_ENABLED(CONFIG_OF)
> >  static struct nvmem_cell_entry *
> >  nvmem_find_cell_entry_by_node(struct nvmem_device *nvmem, struct devic=
e_node
> > *np)
> > @@ -1362,25 +1532,15 @@ nvmem_find_cell_entry_by_node(struct nvmem_devi=
ce
> > *nvmem, struct device_node *np
> >       guard(mutex)(&nvmem_mutex);
> >
> >       list_for_each_entry(cell, &nvmem->cells, node) {
> > -             if (np =3D=3D cell->np)
> > +             if (np =3D=3D cell->np) {
> > +                     kref_get(&cell->refcnt);
> >                       return cell;
> > +             }
> >       }
> >
> >       return NULL;
> >  }
> >
> > -static int nvmem_layout_module_get_optional(struct nvmem_device *nvmem=
)
> > -{
> > -     if (!nvmem->layout)
> > -             return 0;
> > -
> > -     if (!nvmem->layout->dev.driver ||
> > -         !try_module_get(nvmem->layout->dev.driver->owner))
> > -             return -EPROBE_DEFER;
> > -
> > -     return 0;
> > -}
> > -
> >  /**
> >   * of_nvmem_cell_get() - Get a nvmem cell from given device node and c=
ell id
> >   *
> > @@ -1443,25 +1603,17 @@ struct nvmem_cell *of_nvmem_cell_get(struct
> > device_node *np, const char *id)
> >               return ERR_CAST(nvmem);
> >       }
> >
> > -     ret =3D nvmem_layout_module_get_optional(nvmem);
> > -     if (ret) {
> > -             of_node_put(cell_np);
> > -             nvmem_device_put(nvmem);
> > -             return ERR_PTR(ret);
> > -     }
> > -
> >       cell_entry =3D nvmem_find_cell_entry_by_node(nvmem, cell_np);
> >       of_node_put(cell_np);
> >       if (!cell_entry) {
> > -             nvmem_layout_module_put(nvmem);
> > -             ret =3D nvmem->layout ? -EPROBE_DEFER : -ENOENT;
> > +             ret =3D READ_ONCE(nvmem->layout) ? -EPROBE_DEFER : -ENOEN=
T;
> >               nvmem_device_put(nvmem);
> >               return ERR_PTR(ret);
> >       }
> >
> >       cell =3D nvmem_create_cell(cell_entry, id, cell_index);
> >       if (IS_ERR(cell)) {
> > -             nvmem_layout_module_put(nvmem);
> > +             nvmem_cell_entry_put(cell_entry);
> >               nvmem_device_put(nvmem);
> >       }
> >
> > @@ -1575,8 +1727,8 @@ void nvmem_cell_put(struct nvmem_cell *cell)
> >       if (cell->id)
> >               kfree_const(cell->id);
> >
> > +     nvmem_cell_entry_put(cell->entry);
> >       kfree(cell);
> > -     nvmem_layout_module_put(nvmem);
> >       nvmem_device_put(nvmem);
> >  }
> >  EXPORT_SYMBOL_GPL(nvmem_cell_put);
> > @@ -1628,6 +1780,10 @@ static int __nvmem_cell_read(struct nvmem_device
> > *nvmem,
> >  {
> >       int rc;
> >
> > +     guard(srcu)(&nvmem->srcu);
> > +     if (READ_ONCE(nvmem->disconnected) || READ_ONCE(cell->disconnecte=
d))
> > +             return -ENODEV;
> > +
> >       rc =3D nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
> >
> >       if (rc)
> > @@ -1742,7 +1898,14 @@ static int __nvmem_cell_entry_write(struct
> > nvmem_cell_entry *cell, void *buf, si
> >       struct nvmem_device *nvmem =3D cell->nvmem;
> >       int rc;
> >
> > -     if (!nvmem || nvmem->read_only ||
> > +     if (!nvmem)
> > +             return -EINVAL;
> > +
> > +     guard(srcu)(&nvmem->srcu);
> > +     if (READ_ONCE(nvmem->disconnected) || READ_ONCE(cell->disconnecte=
d))
> > +             return -ENODEV;
> > +
> > +     if (nvmem->read_only ||
> >           (cell->bit_offset =3D=3D 0 && len !=3D cell->bytes))
> >               return -EINVAL;
> >
> > diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
> > index 4e610deeaa7b..6c6d4a690e8f 100644
> > --- a/drivers/nvmem/internals.h
> > +++ b/drivers/nvmem/internals.h
> > @@ -4,14 +4,10 @@
> >  #define _LINUX_NVMEM_INTERNALS_H
> >
> >  #include <linux/device.h>
> > +#include <linux/mutex.h>
> >  #include <linux/nvmem-consumer.h>
> >  #include <linux/nvmem-provider.h>
> > -
> > -/* Hold pointers to callbacks owned by the nvmem provider module. */
> > -struct nvmem_operations {
> > -     nvmem_reg_read_t        reg_read;
> > -     nvmem_reg_write_t       reg_write;
> > -};
> > +#include <linux/srcu.h>
> >
> >  struct nvmem_device {
> >       struct module           *owner;
> > @@ -20,6 +16,8 @@ struct nvmem_device {
> >       int                     word_size;
> >       int                     id;
> >       struct kref             refcnt;
> > +     struct srcu_struct      srcu;
> > +     bool                    disconnected;
> >       size_t                  size;
> >       bool                    read_only;
> >       bool                    root_only;
> > @@ -34,12 +32,16 @@ struct nvmem_device {
> >       unsigned int            nkeepout;
> >       struct gpio_desc        *wp_gpio;
> >       struct nvmem_layout     *layout;
> > -     struct nvmem_operations *ops;
> > +     nvmem_reg_read_t                reg_read;
> > +     nvmem_reg_write_t       reg_write;
> >       void *priv;
> > +     struct mutex            sysfs_mutex;
> >       bool                    sysfs_cells_populated;
> > +     struct attribute_group cells_group;
> >  };
> >
> >  int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_=
node
> > *np);
> > +int nvmem_layout_add_cells_from_dt(struct nvmem_layout *layout, struct
> > device_node *np);
> >
> >  #if IS_ENABLED(CONFIG_OF)
> >  int nvmem_layout_bus_register(void);
> > diff --git a/drivers/nvmem/layouts.c b/drivers/nvmem/layouts.c
> > index 07a34be9669c..32995c9be68d 100644
> > --- a/drivers/nvmem/layouts.c
> > +++ b/drivers/nvmem/layouts.c
> > @@ -118,6 +118,7 @@ static int nvmem_layout_create_device(struct nvmem_=
device
> > *nvmem,
> >
> >       ret =3D device_add(dev);
> >       if (ret) {
> > +             nvmem->layout =3D NULL;
> >               put_device(dev);
> >               return ret;
> >       }
> > @@ -192,6 +193,7 @@ void nvmem_destroy_layout(struct nvmem_device *nvme=
m)
> >       dev =3D &nvmem->layout->dev;
> >       of_node_clear_flag(dev->of_node, OF_POPULATED_BUS);
> >       device_unregister(dev);
> > +     WRITE_ONCE(nvmem->layout, NULL);
> >  }
> >
> >  int nvmem_layout_bus_register(void)
> > diff --git a/drivers/nvmem/layouts/fixed-layout.c
> > b/drivers/nvmem/layouts/fixed-layout.c
> > index 635d448b3dd2..b97f39897a75 100644
> > --- a/drivers/nvmem/layouts/fixed-layout.c
> > +++ b/drivers/nvmem/layouts/fixed-layout.c
> > @@ -19,7 +19,7 @@ static int fixed_layout_add_cells(struct nvmem_layout
> > *layout)
> >       if (!np)
> >               return -ENOENT;
> >
> > -     ret =3D nvmem_add_cells_from_dt(layout->nvmem, np);
> > +     ret =3D nvmem_layout_add_cells_from_dt(layout, np);
> >       of_node_put(np);
> >
> >       return ret;
> > diff --git a/drivers/nvmem/layouts/onie-tlv.c b/drivers/nvmem/layouts/o=
nie-
> > tlv.c
> > index 8b0f3c1b8a0e..99e7a5406b4c 100644
> > --- a/drivers/nvmem/layouts/onie-tlv.c
> > +++ b/drivers/nvmem/layouts/onie-tlv.c
> > @@ -95,18 +95,19 @@ static nvmem_cell_post_process_t onie_tlv_read_cb(u=
8 type,
> > u8 *buf)
> >       return NULL;
> >  }
> >
> > -static int onie_tlv_add_cells(struct device *dev, struct nvmem_device =
*nvmem,
> > +static int onie_tlv_add_cells(struct nvmem_layout *layout,
> >                             size_t data_len, u8 *data)
> >  {
> > +     struct device *dev =3D &layout->dev;
> >       struct nvmem_cell_info cell =3D {};
> > -     struct device_node *layout;
> > +     struct device_node *layout_np;
> >       struct onie_tlv tlv;
> >       unsigned int hdr_len =3D sizeof(struct onie_tlv_hdr);
> >       unsigned int offset =3D 0;
> >       int ret;
> >
> > -     layout =3D of_nvmem_layout_get_container(nvmem);
> > -     if (!layout)
> > +     layout_np =3D of_nvmem_layout_get_container(layout->nvmem);
> > +     if (!layout_np)
> >               return -ENOENT;
> >
> >       while (offset < data_len) {
> > @@ -123,12 +124,13 @@ static int onie_tlv_add_cells(struct device *dev,=
 struct
> > nvmem_device *nvmem,
> >
> >               cell.offset =3D hdr_len + offset + sizeof(tlv.type) +
> > sizeof(tlv.len);
> >               cell.bytes =3D tlv.len;
> > -             cell.np =3D of_get_child_by_name(layout, cell.name);
> > +             cell.np =3D of_get_child_by_name(layout_np, cell.name);
> >               cell.read_post_process =3D onie_tlv_read_cb(tlv.type, dat=
a +
> > offset + sizeof(tlv));
> >
> > -             ret =3D nvmem_add_one_cell(nvmem, &cell);
> > +             ret =3D nvmem_layout_add_cell(layout, &cell);
> >               if (ret) {
> > -                     of_node_put(layout);
> > +                     of_node_put(cell.np);
> > +                     of_node_put(layout_np);
> >                       return ret;
> >               }
> >
> > @@ -136,7 +138,7 @@ static int onie_tlv_add_cells(struct device *dev, s=
truct
> > nvmem_device *nvmem,
> >               offset +=3D sizeof(tlv) + tlv.len;
> >       }
> >
> > -     of_node_put(layout);
> > +     of_node_put(layout_np);
> >
> >       return 0;
> >  }
> > @@ -221,7 +223,7 @@ static int onie_tlv_parse_table(struct nvmem_layout
> > *layout)
> >               return -EINVAL;
> >
> >       data =3D table + hdr_len;
> > -     ret =3D onie_tlv_add_cells(dev, nvmem, data_len, data);
> > +     ret =3D onie_tlv_add_cells(layout, data_len, data);
> >       if (ret)
> >               return ret;
> >
> > diff --git a/drivers/nvmem/layouts/sl28vpd.c b/drivers/nvmem/layouts/sl=
28vpd.c
> > index e93b020b0836..1e65a0b6c61f 100644
> > --- a/drivers/nvmem/layouts/sl28vpd.c
> > +++ b/drivers/nvmem/layouts/sl28vpd.c
> > @@ -124,8 +124,9 @@ static int sl28vpd_add_cells(struct nvmem_layout *l=
ayout)
> >               info.read_post_process =3D pinfo->read_post_process;
> >               info.np =3D of_get_child_by_name(layout_np, pinfo->name);
> >
> > -             ret =3D nvmem_add_one_cell(nvmem, &info);
> > +             ret =3D nvmem_layout_add_cell(layout, &info);
> >               if (ret) {
> > +                     of_node_put(info.np);
> >                       of_node_put(layout_np);
> >                       return ret;
> >               }
> > diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts=
/u-
> > boot-env.c
> > index 33ec2350386f..83c687e43e5a 100644
> > --- a/drivers/nvmem/layouts/u-boot-env.c
> > +++ b/drivers/nvmem/layouts/u-boot-env.c
> > @@ -49,11 +49,13 @@ static int u_boot_env_read_post_process_ethaddr(voi=
d
> > *context, const char *id, i
> >       return 0;
> >  }
> >
> > -static int u_boot_env_parse_cells(struct device *dev, struct nvmem_dev=
ice
> > *nvmem, uint8_t *buf,
> > +static int u_boot_env_parse_cells(struct device *dev, struct nvmem_dev=
ice
> > *nvmem,
> > +                               struct nvmem_layout *layout, uint8_t *b=
uf,
> >                                 size_t data_offset, size_t data_len)
> >  {
> >       char *data =3D buf + data_offset;
> >       char *var, *value, *eq;
> > +     int ret;
> >
> >       for (var =3D data;
> >            var < data + data_len && *var;
> > @@ -78,14 +80,19 @@ static int u_boot_env_parse_cells(struct device *de=
v,
> > struct nvmem_device *nvmem
> >                       info.read_post_process =3D
> > u_boot_env_read_post_process_ethaddr;
> >               }
> >
> > -             nvmem_add_one_cell(nvmem, &info);
> > +             ret =3D layout ? nvmem_layout_add_cell(layout, &info) :
> > +                            nvmem_add_one_cell(nvmem, &info);
> > +             if (ret) {
> > +                     of_node_put(info.np);
> > +                     return ret;
> > +             }
> >       }
> >
> >       return 0;
> >  }
> >
> > -int u_boot_env_parse(struct device *dev, struct nvmem_device *nvmem,
> > -                  enum u_boot_env_format format)
> > +static int __u_boot_env_parse(struct device *dev, struct nvmem_device =
*nvmem,
> > +                           struct nvmem_layout *layout, enum
> > u_boot_env_format format)
> >  {
> >       size_t crc32_data_offset;
> >       size_t crc32_data_len;
> > @@ -156,13 +163,19 @@ int u_boot_env_parse(struct device *dev, struct
> > nvmem_device *nvmem,
> >       }
> >
> >       buf[dev_size - 1] =3D '\0';
> > -     err =3D u_boot_env_parse_cells(dev, nvmem, buf, data_offset, data=
_len);
> > +     err =3D u_boot_env_parse_cells(dev, nvmem, layout, buf, data_offs=
et,
> > data_len);
> >
> >  err_kfree:
> >       kfree(buf);
> >  err_out:
> >       return err;
> >  }
> > +
> > +int u_boot_env_parse(struct device *dev, struct nvmem_device *nvmem,
> > +                  enum u_boot_env_format format)
> > +{
> > +     return __u_boot_env_parse(dev, nvmem, NULL, format);
> > +}
> >  EXPORT_SYMBOL_GPL(u_boot_env_parse);
> >
> >  static int u_boot_env_add_cells(struct nvmem_layout *layout)
> > @@ -172,7 +185,7 @@ static int u_boot_env_add_cells(struct nvmem_layout
> > *layout)
> >
> >       format =3D (uintptr_t)device_get_match_data(dev);
> >
> > -     return u_boot_env_parse(dev, layout->nvmem, format);
> > +     return __u_boot_env_parse(dev, layout->nvmem, layout, format);
> >  }
> >
> >  static int u_boot_env_probe(struct nvmem_layout *layout)
> > diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provi=
der.h
> > index 6063fe5b7784..87d871a6d5c6 100644
> > --- a/include/linux/nvmem-provider.h
> > +++ b/include/linux/nvmem-provider.h
> > @@ -81,6 +81,8 @@ struct nvmem_cell_info {
> >   * @name:    Optional name.
> >   * @id:              Optional device ID used in full name. Ignored if =
name
> > is NULL.
> >   * @owner:   Pointer to exporter module. Used for refcounting.
> > + * @owner_is_explicit: Use @owner even when NULL, without defaulting t=
o the
> > + *           parent driver's module.
> >   * @cells:   Optional array of pre-defined NVMEM cells.
> >   * @ncells:  Number of elements in cells.
> >   * @add_legacy_fixed_of_cells:       Read fixed NVMEM cells from old O=
F syntax.
> > @@ -107,12 +109,16 @@ struct nvmem_cell_info {
> >   *
> >   * Note: Specifying name and setting id to -1 implies a unique device
> >   * whose name is provided as-is (kept unaltered).
> > + *
> > + * Provider callbacks and @priv must remain valid until nvmem_unregist=
er()
> > + * returns, or until a failed nvmem_register() returns.
> >   */
> >  struct nvmem_config {
> >       struct device           *dev;
> >       const char              *name;
> >       int                     id;
> >       struct module           *owner;
> > +     bool                    owner_is_explicit;
> >       const struct nvmem_cell_info    *cells;
> >       int                     ncells;
> >       bool                    add_legacy_fixed_of_cells;
> > @@ -144,7 +150,7 @@ struct nvmem_config {
> >   * @nvmem:           The underlying NVMEM device
> >   * @add_cells:               Will be called if a nvmem device is found=
 which
> >   *                   has this layout. The function will add layout
> > - *                   specific cells with nvmem_add_one_cell().
> > + *                   specific cells with nvmem_layout_add_cell().
> >   *
> >   * A nvmem device can hold a well defined structure which can just be
> >   * evaluated during runtime. For example a TLV list, or a list of "nam=
e=3Dval"
> > @@ -173,6 +179,8 @@ struct nvmem_device *devm_nvmem_register(struct dev=
ice
> > *dev,
> >
> >  int nvmem_add_one_cell(struct nvmem_device *nvmem,
> >                      const struct nvmem_cell_info *info);
> > +int nvmem_layout_add_cell(struct nvmem_layout *layout,
> > +                       const struct nvmem_cell_info *info);
> >
> >  int nvmem_layout_register(struct nvmem_layout *layout);
> >  void nvmem_layout_unregister(struct nvmem_layout *layout);
> > @@ -212,6 +220,12 @@ static inline int nvmem_layout_register(struct
> > nvmem_layout *layout)
> >       return -EOPNOTSUPP;
> >  }
> >
> > +static inline int nvmem_layout_add_cell(struct nvmem_layout *layout,
> > +                                    const struct nvmem_cell_info *info=
)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> > +
> >  static inline void nvmem_layout_unregister(struct nvmem_layout *layout=
) {}
> >
> >  static inline int nvmem_add_cells_from_dt(struct nvmem_device *nvmem,
