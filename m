Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688835;
	b=XcoClr/YShJCTAzF4VZi1aXQs2khADHLgi7f/9BRWq968mvJ058dwIqXkqOr2ZK4XJF9
	 xRNg6KeuUgvLSJ+5uNTeIsqNTIy2KgqQ3QHEK5DQXdGmr6jRb3nStgoPJkzaSK6y3c674
	 Wt61qQ4DoXeU0wUd4uTstBe0p2VYmKIZJWMSkFfmfphUMotGyDGY2R1b/gnHWUrHEOpfG
	 6kh7w+E3HYvY7+mw3wsyssEV6+6H5tAtsjBBLTRZtL38BilZAlYNSKmHtbtRp1aC6leYp
	 sAx25z6PE68YconGDDkonNfFLkdBf3Zy0AvBs512lILEUnxz+q+HUfJEbLfg1Cnq4TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=hyUTUpsSAlQcCsDB6lwU6/zmOD65Zpl/jNjaMxbFRhE=;
	b=mm4bKaCHkeqFYSHTvblTocHSfONtfRis8ZQosHMDZXs3GOT6aZG+1jo9h89OQbH1dgJn
	 yCEunO6fy6RdOU74Kvjrv54mMzDYac1/KbceQ3ep5udUIf5IvoBaEUu9iLg/w44OQagcs
	 HMvtZNQ9T05FaUDLaFIj8oKeUfBTqv2yyPkbfSo9ThSb7VIaVeso8lRyfKNMmWjLyAwOC
	 WbHqn0+SXJKj03hZHhUPCN7xBUmkk3yiJ9/ZxANMaj/HuBa9vAdMyV2wL2Jj6p9z9oP+W
	 j5T1FjmeAwRiDnJEC8rnXrSdUTbqTe4Co+pMnd4aKibWmXdNt5JaMR0POP3Bj1L3bMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tqhDiL2Z;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC37606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFC37606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tqhDiL2Z
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so65174525e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795688833; x=1796293633; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hyUTUpsSAlQcCsDB6lwU6/zmOD65Zpl/jNjaMxbFRhE=;
        b=tqhDiL2ZCxkie0sVNn34wqp/FemsKe7D7Fxyd6nZD/8KKxjW+gtdqa3gMbO+DiBrEL
         tce9+3y0NedN8iMlWcQUd9ZrDixQf0mddvwE+YhwEaqWTFoDjLa9HagQ0UJaBztMl6Hb
         fnTQuFZUVxURn+5nVQTCtVOeraBztVlxWWpupR125KK83vmXpzak4OMRZM8DbdqiG90c
         U207vhlAzv1DnhC9ChY5IdtbeXAdk0qKyGpPBTqQbke99EYPTz472RJqhqWnaRHKbt/t
         I1qPvWexbisMJAANUmhpb3eOccH/1Gkhj/Fmlo35gtHBApX0PAOdsfyDcjl36iaz4X5e
         lLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688833; x=1796293633;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hyUTUpsSAlQcCsDB6lwU6/zmOD65Zpl/jNjaMxbFRhE=;
        b=kfor/mZ0y8BW86MNHeR9RPsSSrhqj1w/HubRz4Yfu466Js/s7MSxCOydYEBkwaDU5L
         qMh9CMznjMQFfWIUcKeAp5JzSewfYA/hfZnTg55ZQHnBHzmYK9mbEvmRKAw9r5YiTS0S
         UOjvVZXX7Gh78GRDGVxHmwTfxN+8Py/XMSIWywdBjcMnw4sdh4mTvrbr5fO7YMTAZFsA
         P3u6RBY0C94xfZkWZq10A/6/SodVLA/LrKfD7jCOl6AR5dQZ7CFrvJwdHaPN0torFsxG
         S2GVdTXKPtnVw1SjnIoNjFrxm9r8eNyhkK5dhI/rXFFC34e0Jj5TbWuR8YczcaRVUjNB
         ZXHg==
X-Forwarded-Encrypted: i=1; AL+hErHIBYSMaTpUbq+gv7RsqVMypsFjvS+n/T3eIHveL+JTzqTOFeoYgzvLNBW/ZJzLzDnlJhoEScAjsjT2D3o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kKyBMiV0Y47cmi6llCGGPkFjayDJiZDybIWd7ZNBd8nzmhQba
	IBQMHIhlxrz1siPfT8onAgbEJHYu704bpBsTwL8slmCNgqHw8WZ2qvvvtEblAfdCkss=
X-Gm-Gg: AZFdTZeDLPyO184wPl3/mKfblftKVNreRfsBWUojURu6qqc2/N5PzzGTcD0Qwivxd+K
	dCaYsa54KUW5/jqVglOH9j5kuH1w/32TtMGmA+mARvd78HUqFDMBZJzAS+02HA+hg7uLwea64eV
	yqbMKvPNA1Wz0R36Ib1dLeuRBxiRhOG8unOFApzt+/PMTGxCxvFny1L+aRuugc5F8kQ97GU5Hp+
	hrOJrHD9evI1srHZLUWVyz+7W451z7Vqc0vD9cLCIiE33SmZ01KUl+8PaNdnUwPfdINeY1CU4GT
	dHSpQftUiahQeEMx0q23StKw5LWYU84WXZh8dalUqZghR3DditN96Dc/8HDlhaNlXK4GW4F2Ud6
	9sWMXNptCk1xBThNpjGupbNCJCGViouxk8z9h6YSZNhvgSj/BV4AThijEOEzwRY5UycR6tl+jTa
	4e75bQw3is9zHKEle7QUOuW5UgsgDZOgHRZDs0hdQzpeB3/MTPiDNk/YIpa4nFC+HszwX1D5AQ7
	x+yW5S0j019lZgr9tQ0P9oWqQAU2c1tJ+jpvYRjsIYHRqqk5PpVVLfXTEOzkUX+1VSn8e8gXsaJ
	y1XlOgOMlFlZO/Y+QePH393dbxJcAAnJPJ0=
X-Received: by 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr422256135e9.18.1795688833275;
        Thu, 26 Nov 2026 02:27:13 -0800 (PST)
Received: from [10.1.1.59] ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm399651265e9.4.2026.11.26.02.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:27:12 -0800 (PST)
Message-ID: <f203e85c22e97363a220fc09b45ff6ba33c3f59d.camel@linaro.org>
Subject: Re: [PATCH RESEND] power: supply: core: give each supply's epc_sem
 its own lockdep class
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, Hang Nan
 <2122295973@qq.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 26 Nov 2026 10:27:29 +0000
In-Reply-To: <20261125-power-supply-epc-lockdep-key-v1-1-c8a41b8a4470@gmail.com>
References: 
	<20261125-power-supply-epc-lockdep-key-v1-1-c8a41b8a4470@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9+build1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Ryan,

On Wed, 2026-11-25 at 17:23 -0600, Ryan Brue wrote:
> Since commit 9f7f7a859451 ("power_supply: serialize property access with
> unregister"), power_supply_get_property() takes the target supply's
> epc_sem for read. Every supply's epc_sem is initialised at the same site,
> so they all share one lockdep class.
>=20
> A driver that reads another supply while holding a lock that its
> get_property() callback also takes is then reported as a circular
> dependency, even though the two semaphores belong to different supplies.
> sc27xx_fgu_get_property() does this with data->lock and the charger, and
> a fuel gauge driver in preparation did the same with its charger:
>=20
> =C2=A0 WARNING: possible circular locking dependency detected
> =C2=A0 kworker/2:1/60 is trying to acquire lock:
> =C2=A0=C2=A0 (mutex_#2){+.+.}-{4:4}, at: mt6397_battery_get_property+0x50=
/0x23c
> =C2=A0 but task is already holding lock:
> =C2=A0=C2=A0 (&psy->epc_sem){.+.+}-{4:4}, at: power_supply_get_property+0=
x34/0x80
>=20
> Lockdep then turns itself off for the rest of the boot.
>=20
> Register a lockdep key for each supply, so that only a supply's own epc_s=
em
> is ordered against its own locks.
>=20
> Fixes: 9f7f7a859451 ("power_supply: serialize property access with unregi=
ster")
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Thanks for the patch =E2=80=94 I hit the same shared-class issue on Pixel 6=
 (Oriole)
with max77759-charger reading properties from its TCPM supplier via
power_supply_get_property_from_supplier(), which triggers a "possible
recursive locking detected" splat.

Two minor suggestions:

1. It would be helpful to also mention the "possible recursive locking
   detected" case in the commit message (e.g. consumer callbacks calling
   power_supply_get_property_from_supplier() or power_supply_get_property()
   on another supply), so people hitting that variant can easily find this
   fix.


> [...]
> diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/sup=
ply/power_supply_core.c
> index de15314ef954..76bbe8772143 100644
> --- a/drivers/power/supply/power_supply_core.c
> +++ b/drivers/power/supply/power_supply_core.c
> @@ -1662,6 +1662,7 @@ static void power_supply_dev_release(struct device =
*dev)
> =C2=A0	struct power_supply *psy =3D to_power_supply(dev);
> =C2=A0
> =C2=A0	dev_dbg(dev, "%s\n", __func__);
> +	lockdep_unregister_key(&psy->epc_key);
> =C2=A0	kfree(psy);
> =C2=A0}
> =C2=A0
> @@ -1765,6 +1766,7 @@ __power_supply_register(struct device *parent,
> =C2=A0	if (!psy)
> =C2=A0		return ERR_PTR(-ENOMEM);
> =C2=A0
> +	lockdep_register_key(&psy->epc_key);
> =C2=A0	dev =3D &psy->dev;
> =C2=A0
> =C2=A0	device_initialize(dev);
> @@ -1810,6 +1812,7 @@ __power_supply_register(struct device *parent,
> =C2=A0
> =C2=A0	spin_lock_init(&psy->changed_lock);
> =C2=A0	init_rwsem(&psy->epc_sem);
> +	lockdep_set_class(&psy->epc_sem, &psy->epc_key);

2. Because lockdep_set_class() stringifies the key argument, the lock shows
   up in /proc/lockdep (and any future splats) as "&psy->epc_key" instead o=
f
   "&psy->epc_sem":

     ffff0008068e26e0 FD:  167 BD:   13 .+.+: &psy->epc_key#2
      -> [ffff000816c3eee0] &psy->epc_key

   Replacing init_rwsem() + lockdep_set_class() with:

     __init_rwsem(&psy->epc_sem, "&psy->epc_sem", &psy->epc_key);

   like block/blk-crypto-profile.c does, preserves the lock name while
   using the per-supply key.

Tested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Cheers,
Andre'
