Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538929;
	b=frnUBYH7FbTAuu8wjCqS+jXiSadMtmBkK9pM/HoGLWDflHLVaxdKH3A39Cl9qyJBQpFf
	 vrJhIt19D/5QbW9Qu0hvBLT0i4m6wFWSvfIrjLuAtBxt4ALo3Ukah3Nj9tdYjbPb6TJkS
	 DkbGMdlH4Kkhydyoy4z5sYYG4CKq7o4eDcDVKJg5C//+WifwIY0Nr67mHdWpwki8UApp8
	 ZdypUnSCAscC3j2MJpA8w3QafaRS8pUDaNiVfXwdA7fDC3uf3tLzXLNDF3MAzZmaJliTI
	 Cr13fR+bxX834XU3tyL4lf/M/whkxt8kDQy+q0ha0xUb/xPmNr17usOR1qxSN8C0s/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3a1UzAxON6Gb0wbVEW/7fTu+LaDAW+iOda+qUlDV++c=;
	b=Gd9oH01hMfdnprbRU5iz4CStHRz/3G5KLeoAoAe2wgvDxQ8Ui/nF+KmtjoLuzCNfLMte
	 vhA136uPCN7zOpUQ39d3LolWRGg92Jvouyn2hWfPIYrOWbZJTfCVfC+y6+NEWPOvV68vv
	 w2Agmq0Add/fgaDmTngHa5MwhcWhuHRTViKAyGe9SGVcd3egIO9L78wsLkqOFco7fq5Ly
	 2TgPb9ydIBz5fDRY+YumRMruXe2YMZeCZJtcPIrNUUk6FeG17xW+KEZC5WLwwRch6zlwE
	 6MpBUzKCMhvMs6IOH5FkUFWHfN4K23GFHXxQCRXl2DCoxPsOpFUkmtnO2EhKyDhEVNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j802lkn0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD93606A683
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCD93606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j802lkn0
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so1175489241.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:48:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795538922; cv=none;
        d=google.com; s=arc-20260327;
        b=EdsbK+R4gPjfUhhstfE15vtggp3HpSL51qiG5wqusdx4kPsAhTl9YFo1+TobQ2lKeS
         ELHCNsejLRue1sK0peNS/Nu3zm/j5Ioa1qTmBNEZEbemhrEtfKy3cMmMoNtG27Eicei1
         ZOMm7+e8jI6tR9h5YdYDGjtkIOHr5gU3dSOvW8mzmfwMIOOm4qzM78g9BjRWnxdVC7AV
         e+g2+QEXc3prKOwMhpH5WqXRJzJDV5qr6CwQalA+iL962aeT2DYDc/a0v4DLnOEbuv1m
         vFWdWqnnXdHfwUFp/6PBSYCaN9f7f/3d9UYLhocjZVnCIDM01r73V3cTtcIhv7f+uk0r
         S3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3a1UzAxON6Gb0wbVEW/7fTu+LaDAW+iOda+qUlDV++c=;
        fh=oS5kvjVz3Jh6v7dt/Whdmyf8PWx2AaTDY9lGKEW4LD4=;
        b=Wlo1y4OvFARHP4gPmWJ8CMiEWe0kOsRya6QVji1wST+VUpNcGsBhtCG9dzKG97sXAo
         4mBX3Yd0p7SxLO8DTFVC8UV9F/pyrrF95GugZGvfsok6njs5aLkQ+rEngzpeBu+ZOAmo
         1eS7UJwsPidsqZuAGkppjLpSt2J8o3L2MRxVhR/WEqUyVUdQXIPUTNR6BEaALvK0z7WC
         qk2iC0GCNNXh+idPzYxwvSxshzt9X52WqCSD9qo9ENZoEDCQOTMyjht7/Hst/H1U25Bq
         jHtEdR+A92iq+G0CqkiNyB8rR+Y6Q2Ay6um9AyKgiCU3yA8uqdftsYvdgd44vZXA0dKq
         w7mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795538922; x=1796143722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3a1UzAxON6Gb0wbVEW/7fTu+LaDAW+iOda+qUlDV++c=;
        b=j802lkn0jn13hyNcrrnqRcyqOAZuLpLL5wL1qn7j3+kERPxe/HCWDG7A8dJKb+dI12
         sDqIV66GVFqV0JLzhTvfzgWEYUSKU2vhh3aOdBsG9Jg5EvdKArdrrnCepqknZlF3O4rC
         s635dBIFbxlye3QzObbDvfB1aWlSqkfcxd5Ko/Uq+pfhB3V4BXXx/IPWroWx2etBmruf
         8cbbgZoejAeKFVxwetlXtD6DBzQLCJacugRDd5shZcJGvk20LhYFJ722vqRMNofy1ZV4
         uRRf2HKSrRwdMwFHrg0Nmn6ycT5NW8/dFAeJShIT6qnj4VgSnaxhsN30MT35t3DrO7Ze
         uD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538922; x=1796143722;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3a1UzAxON6Gb0wbVEW/7fTu+LaDAW+iOda+qUlDV++c=;
        b=r0bxt3w1vWn1JHpwc8GKz84t9qefs8PfeIEKuhFzybnh8P//CUO8n9rjMGtjx3QGcr
         lF25q7hwCbqO1AhytBPJjEffgXl1d0h6cS/RBPlczPsmKWaHeizZze3/ebQPcs+fk9y8
         iIMvY3nB/LxhU2c5S6ZRBKvrXGqaQNWGqxAwoNLET4xe9+5OaSBbnm6qrlIucia6ZCTp
         dVRHjkyOfT9jqHkaYvcBgSyHjXZK6PYnZ4fuOhTE8O3cNM99XtCRUMMggUO9Hf3EAjri
         R5KAKP7N7jjH2m0h9lbNg6iJD6Zh3KQcaNCoOcuu4wVNqLWQyw6liB/mE47zuS+e8+Vh
         RYgw==
X-Forwarded-Encrypted: i=1; AL+hErGYgGH7nusHaGqwlMwJE/D55B8SRMYjqRZ8Z3rdVRCTk96N4QrZUpomV8nRB+KP4w/AH2v171jZTTj2aac=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dJSJAuldJivT1KVUuIIpaKNA0c7XzUFpRhxJWsuoSFfUXDmVv
	YAG4kLy9bO1lavuthbi0ttemRibiS84zukQ0T+qT0jRvUveJ30PpENkqOiM+ZBt71t+Jsykmrqy
	SiLDOKZrXjoBXg+8vcbKs09eqzJ4w1pA=
X-Gm-Gg: AZFdTZfP3WEMe3AWK7l2FJ+iHK65sdFkBBdQ+MNrIo8R02rNk1KYF+3H5j1kTuniVkt
	9OGqNLbx/TzcJG+cwgvTyoXtPOWtqAijjilQiIau7kJCpj/uJIA2RXYikj8ru8sP0XuQRSzmg4K
	f6PLnpTGxj8ApZmAwCJgoZSszxIaMARLXZksj3whb03VREcWBK+XxzxBfjCh+M91p02U1cJn3pF
	6LmmX76PQlk1cCUg+q1lxsY14uB4//AKrw1DIbTcd+/vsf9ekgKcJ2nGpIqTucgDBtJ2/BrfvE9
	8RUWB3bbNiZGiZekO+LApyzmeHHGRfT9KUPRDkT4xSSVy5GXebpF5PbjAlcw5N/ye4ebai7hQQq
	hh+KQsSlasM3ElYB0tUq9cGqloGMOelN3RG9gb07aEX6zpwOfleLARJwB65XHEwknaPmmq1mceM
	JJ2oOss9z0kfLhL6sT3tTeIUNazF6oCShVhtgoe8BGaGNQys97v0jlDC4x/jQYYoJtg0fjeeX6d
	eNozxGMz9EfSWixPmc5rZXosW/J+w==
X-Received: by 2002:a05:6102:a52:b0:7cb:bbcc:e52 with SMTP id
 ada2fe7eead31-7d71e34b0b8mr6779532137.0.1795538922506; Tue, 24 Nov 2026
 08:48:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-submit-nvmem-wp-serialization-v1-v1-1-539d121f8f5e@gmail.com>
 <8c0a616b-e7a5-4043-bc86-3bee5d0c9e48@kernel.org> <p4nohmtiuicrys4i2ipwstdjt7sj3g2yyli4beygutkyn5ghky@d54oxjwiyzm4>
In-Reply-To: <p4nohmtiuicrys4i2ipwstdjt7sj3g2yyli4beygutkyn5ghky@d54oxjwiyzm4>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 24 Nov 2026 09:48:31 -0700
X-Gm-Features: Aa3M54rl89evM17dx3plH-kopVYIX-ZwZ8BLirVjwFm8RebbVDbXT4NQijY58eM
Message-ID: <CADvTj4ou6+gg8xK4p9623xr=mZecmrgPpV76pU_-h=qS23UUrg@mail.gmail.com>
Subject: Re: [PATCH] nvmem: keep write protection disabled while writers are active
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Khouloud Touil <ktouil@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 6:04=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Mon, Nov 23, 2026 at 10:56:54PM +0000, Srinivas Kandagatla wrote:
> >
> >
> > On 11/17/26 10:09 PM, James Hilliard wrote:
> > > The core deasserts the WP GPIO before calling the provider and assert=
s
> > > it again on return. Two concurrent writes can both deassert WP before
> > > the first one finishes. That writer then protects the device while th=
e
> > > other is still writing or waiting for the provider lock.
> > >
> > > Count active writers per device under a mutex. Only the first writer
> > > deasserts WP and only the last one restores it, including on provider
> > > errors. Keep the mutex outside the provider callback so providers tha=
t
> > > forward writes to another NVMEM device can still nest.
> > >
> > > Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
> > > Cc: stable@vger.kernel.org
> > > Link: https://lore.kernel.org/r/sashiko-outbox-219526@kernel.org/
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > >  drivers/nvmem/core.c      | 35 +++++++++++++++++++++++++++++++++--
> > >  drivers/nvmem/internals.h |  2 ++
> > >  2 files changed, 35 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> > > index 7d4cce8e2742..c0da902d909b 100644
> > > --- a/drivers/nvmem/core.c
> > > +++ b/drivers/nvmem/core.c
> > > @@ -70,6 +70,36 @@ static int __nvmem_reg_read(struct nvmem_device *n=
vmem, unsigned int offset,
> > >     return ops->reg_read(nvmem->priv, offset, val, bytes);
> > >  }
> > >
> > > +static int nvmem_wp_write_begin(struct nvmem_device *nvmem)
> > > +{
> > > +   int ret;
> > > +
> > > +   if (!nvmem->wp_gpio)
> > > +           return 0;
> > > +
> > > +   guard(mutex)(&nvmem->wp_lock);
> > > +   if (!nvmem->wp_writers) {
> > > +           ret =3D gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
> > > +           if (ret)
> > > +                   return ret;
> > > +   }
> > > +   nvmem->wp_writers++;
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static int nvmem_wp_write_end(struct nvmem_device *nvmem)
> > > +{
> > > +   if (!nvmem->wp_gpio)
> > > +           return 0;
> > > +
> > > +   guard(mutex)(&nvmem->wp_lock);
> > > +   if (--nvmem->wp_writers)
> > > +           return 0;
> > > +
> > > +   return gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
> > > +}
> >
> > This refcouning belong to more generic framwork, I see few more drivers
> > doing pretty much the same.
> > @Bart has this been discussed before?
> >
>
> Well, we have a use-counted gpio-shared-proxy, but this addresses real
> hardware components sharing pins. This is a case of "logical sharing"
> where you have a pin requested by the subsystem, which is then used by
> multiple consumers. Normally, we do this at the subsystem level, like in
> regulators - which BTW probably suffer from the same issue - but here
> it's more visible and more likely to be hit.

Both NVMEM writes use the same WP descriptor. They look like one
consumer to gpio-shared-proxy, so it can't tell when the last write
through that descriptor has finished.

> We can either address it here or we can possibly introduce a use-count
> helper for GPIO descriptors at the GPIOLIB level and re-use it in
> regulator core. In that case, we'll still need serialization but I don't
> like the idea of using a mutex and holding it over the entire operation.

The posted patch drops wp_lock before calling ops->reg_write(). The
mutex protects the writer count and the GPIO changes: the first writer
finishes deasserting WP before a second writer can enter, and only the
last writer reasserts it. The provider callbacks can still overlap.

One detail for a shared helper is how to handle a GPIO error on the
last user. regulator_ena_gpio_ctrl() keeps its enable count if disabling
the GPIO fails. In NVMEM the last provider write has already finished,
so we return the error if restoring WP fails, but there is no writer
left to count.

> How about a read-write semaphore, taking it for writing, checking if
> we'll need to set value and keeping it for writing during
> gpiod_set_value_cansleep() or - if not - calling downgrade_write() and
> running the actual nvmem callback allowing for concurrent operations as
> it is now?

If every writer starts with down_write(), a second writer still has to
wait while the first holds the downgraded read lock across its callback,
even though WP is already deasserted. Did you have a way for that
second writer to take the read side directly in mind?

>
> Bart
