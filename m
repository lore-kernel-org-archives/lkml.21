Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795445623;
	b=QMObz3zxI9dWAEYDbCfKrm7pJ91LbYKfjYmVl9qd4hWcieOkoEaG2d+KOoWUjRswIyZa
	 MxNwQPsa5rl92Yncc6Cvbz+j7JAGGQJCx0CqQ6r9xbs5uXWIiPg2KibKFCNoD27nBuhxO
	 7wNGlUQZpz1JG+opg6wzX5JkIFgocPyPN/lCWsxsQS/My7IMYkY5/PEXlR42LDHIyFYEO
	 8U1Lr5czkUY5zPSIk8QN8VUTGeret2xwGSppCH8JtCzbOITvb0xLyBRm583+JPy+/oEvv
	 LT5JdU7Rk4nYWS9EJCKeXfvi8VRFtTN4Uj+RauTnWWEIL0mJmXsobVff2ibSqsdG8Pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445623;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KiznapJ9s3bPtI2/myOJZGBSxLKcyfy/8YV0Q+JSslA=;
	b=3mUIlpEftpzhQU1izHHrrr/yiGRBzECbpKsiXh/WJI5TpB5/DVWBekN6Tn+RtmlcJeRD
	 uK0/mYCb/2KoWP8z+TDLz0aYUd/nVAWmXPznxb/4pHqmQa/mON83uwr8PbWtU6D1gHyCy
	 wX4MFM0LVpLpiMZJFwkI/N2jY1zux14m4SwFZ2m9U6RONP/uFJsOT2QN/WPrb1iZi6ACk
	 1fC6VSNBdItklR0tQKW1fV/AI0WkEys67Fg06mE3ig1wNGjq6wLOkF3+M0AW1J72YmRft
	 FmkVlD4jQjWODr8ITRygCFXPN2dHHclkBNBaLaZ/ydgcBtLxrT09xHv3aKSF575mcEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PiMZSRJb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703CA60A260C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 703CA60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PiMZSRJb
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2761c69fbso2177692c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:53:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795445622; cv=none;
        d=google.com; s=arc-20260327;
        b=AhvnFmBZa1gxyAp0mDAdFV7OAzUFRhqKb8cu4kbVeul1uEai9eqX+7fjOz2gwoSJVL
         2N6KM2VmHzeR5/1XM1NRxofHh381y+A2G5ZW8vIzTFpen6Ya+8p/z1OetWtrXZEsGevu
         RMMClXS8AFTSlTz1auzYxa8Y0B+TyC/ozhFWugGMP8rD7XNOnEMHMsO8r8Jb2lmmCk3s
         FnycmLwdRia2L44yQ+vmWa866ngildk0UWdyxU2k/aCHw+FA90W/PymEWd5HVWcGnzte
         hlbV0xQ4qgYumNAo+8lE0xmA7uHzGFg+s6wbY6GtsMyg1s4mHMLcvJQnWV0WjMt0xgur
         DpjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KiznapJ9s3bPtI2/myOJZGBSxLKcyfy/8YV0Q+JSslA=;
        fh=bdcZXtdphY2+ym6LAVeFX0E9oLIYWEZAjaJ9+Tci01Y=;
        b=PqgjiT1xVsprHRfNylWaNSVlUol8f+jS2LsU+nbzK2wzR4Ie5fpl5SLK4O9S1oQErt
         oYytFUopF2XS/UI3481iPYkLi4jBq4YsKC3rxjsAYmCr7s4XMN8ExDU+P77R2ALZAX/B
         r/05rB7Fj46IHWhEZdp5g76dYWQtCUU0PkircQ8cGbqCzO9JWNJQkYsPBXKAYQXXAQdT
         YGCYizqXO+BMayd9qd892rlMCcrIkeZJYWWzxw0omGDWcOLMH9oVhFjxmmuqSH0kZILm
         Bik5sAmtlhuB9qcoueKN5YkFq1Id4+IXoQ7EmuwoB4JTkQDXRj0uch2b0NMNS6jL6LiR
         Jg/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795445622; x=1796050422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KiznapJ9s3bPtI2/myOJZGBSxLKcyfy/8YV0Q+JSslA=;
        b=PiMZSRJb2hdBJuWT4yy1Me5kar1Bb5BK9zXWfbSJNUiKI2c52eYNVL79YciceBNL+M
         8Uy8NcuE003k0Ra4dJbY/I2OQ2kOmAdUNusOEQIuD18kosJLs8Nd2jAkDHjeutoGAc8j
         Vxkh18cQc5ZmUSSXDzSFr5BabGnAkKFgo237umXEUjEc6W7JOesNQVtjLuL31kG8ZYD9
         AMSJuAwByl7OcWJgcYIN46052MA7BQr+/f68mNeEFOL62LhmDQWs9/Udw+C3eJzxUZ+W
         7uy+z1OcbFDEglGQ33vXk3oj8rZJ3ymlqJYv42FAbaKR5Rt9q4WOkaa6ZkLX9Z0RYi0K
         EiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445622; x=1796050422;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KiznapJ9s3bPtI2/myOJZGBSxLKcyfy/8YV0Q+JSslA=;
        b=GYD7PhGcTeN4qFCmHq0ZGWAOR6f8qhLTU++7sdanOHysFBdrexbQx+hf5+DMmiSn9c
         oBiINTyBEy07L6xu/iI68ovi4Bb6KG50tlbuWro+FHHLYy9vZ+imlmxgCv6ne2od+ILd
         H9wqvBdbTlfIMrwuMkdrFsjkmvX+EHwuOo25tMJrEbdaUhqU9Rqre0nLcU6HHOL+Xd0V
         VYFXzXEIZRbAEx/zcS+2Yhy7JsgruAiIwGDDbA8j0GgHYWb6OD0Ep0m8kKKCNafy94ZF
         c8alKdpzKiMl5+K0lFWJiWr6UsE0YDRXQXRd7qlfrYoTVSgpXKpEM6mhH89Xj6r5p8DM
         JP9Q==
X-Forwarded-Encrypted: i=1; AL+hErFQ3PWDRQ6iiTZlKrgkBWVwKBo6yYuzK/gonGnocnokpX1oVYfZVvysSbT1ZuuxYobXSXegmW7LfXcFqJg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NMUKoKB2VpHQbHwT29/Pu41AKVx3MoiM0m+5m0EN6U90tsfrP
	+PWdbxW+BVK6aPojD0gMM5s5sXiPvSZNyUT8/oJxUbHxUAyxVlNxwzkx3OCMHVsJnX0gKap6ajU
	4BnpW09qOosrRQiquqGIKNxb4WRNukh8=
X-Gm-Gg: AZFdTZeum3bP3pV5Duor+qYq61QE8+9LkygXVTlYcW1XeBRaYjwbN2pYU/5sy9ORn+f
	GF/JJuB3yBXzUkt3KZ4ZHoxIZDzCSyx95vRmAt4E12osNEe8o1IscU/7W1fNu33LF7YVv8j+k2f
	BCOXyqmhhEvRJxuBwZGYTdpWYvEWKFVGcJXOy1tIl9LlNtR3yfShZVtJqWhtJv+HckhECg7V/u2
	ifD3Xky76voclZrW2nWBQVe8qhRJgLJCs2LEVFRF7JTROqa/OPqpB4EovXcZvxjomDrVqgmmjUF
	EWPFgdPDhIjBs9Tavzo42ivG4btIYDuhZlrzTlaHMVdXLZh3oQMw2YLLDkH2ghgNkmbiBXCqSpM
	ge8lQfWIXJkM9ITUzoukWnHJ402xXJH3qn1Q=
X-Received: by 2002:a05:7022:ea56:20b0:1b2:4e2c:6838 with SMTP id
 a92af1059eb24-1b5568cf7a0mr13384775c88.15.1795445622228; Mon, 23 Nov 2026
 06:53:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123124715.351511-1-ayaanmirzabaig85@gmail.com> <3d83eafc370354cef4280fd70d1228191486a212.camel@linux.intel.com>
In-Reply-To: <3d83eafc370354cef4280fd70d1228191486a212.camel@linux.intel.com>
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Date: Mon, 23 Nov 2026 20:23:30 +0530
X-Gm-Features: Aa3M54p4k_LbVFdwSVxSxoz8NO28fV58yQh4DUC_tyGXKDsdGjchmGgw3AVrmX8
Message-ID: <CAJi8Lv_M2uuiiJXPMqo2pptYT9gK_5uYBh2tWMp7CP=iUsgouA@mail.gmail.com>
Subject: Re: [PATCH v3] HID: hid-sensor-hub: avoid lock inversion in sensor_hub_remove()
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Zhang Lixu <lixu.zhang@intel.com>, 
	Zheng Shuhao <viennaoffh@gmail.com>, Arnav Kapoor <kapoorarnav43@gmail.com>, 
	Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-input@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+fb951970a334aaff00ba@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Srinivas,

My apologies. I missed changing NULL to data in sensor_hub_remove() again.
I've fixed it, verified the diff, and am sending v4 now.

Thanks,
Ayaan

On Mon, Nov 23, 2026 at 7:51=E2=80=AFPM Srinivas Pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
>
> On Mon, 2026-11-23 at 18:17 +0530, Ayaan Mirza Baig wrote:
> > In sensor_hub_remove(), spin_lock_irqsave(&data->lock, flags) is held
> > while calling device_for_each_child(), which iterates child devices
> > via
> > klist_next() and acquires the driver core's &k->k_lock.
> >
> > Because &data->lock is acquired in softirq context by
> > sensor_hub_raw_event() while &k->k_lock is acquired elsewhere with
> > softirqs enabled, nesting &k->k_lock under &data->lock triggers a
> > SOFTIRQ-safe -> SOFTIRQ-unsafe lockdep warning and risks an ABBA
> > deadlock between process context and softirq context.
> >
> > Move spin_lock_irqsave()/spin_unlock_irqrestore() into
> > sensor_hub_finalize_pending_fn() and pass data through
> > device_for_each_child(), so &data->lock is only held while inspecting
> > and completing each child's pending state after klist_next() releases
> > &k->k_lock.
> >
> > Fixes: 8a5b38c3fd70 ("HID: hid-sensor-hub: don't use stale platform-
> > data on remove")
> > Reported-by: syzbot+fb951970a334aaff00ba@syzkaller.appspotmail.com
> > Closes:
> > https://lore.kernel.org/all/6afddf21.a11fe2ad.1b4426.0003.GAE@google.co=
m/T/
> > Suggested-by: Zheng Shuhao <viennaoffh@gmail.com>
> > Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
> > ---
> > Changes in v3:
> >  - Actually pass 'data' instead of NULL to device_for_each_child()
> >    (missed in the v2 submission).
>
> Are you sending correct patch?
>
>
> -       spin_lock_irqsave(&data->lock, flags);
>         device_for_each_child(&hdev->dev, NULL,
>                               sensor_hub_finalize_pending_fn);
> -       spin_unlock_irqrestore(&data->lock, flags);
>
>
>
> Thanks,
> Srinivas
>
> >  - Drop the NULL platform_data guard since hid/for-next already
> > checks
> >    dev_is_platform() and !hsdev.
> >
> > Changes in v2:
> >  - Attempted to pass 'data' instead of NULL to
> > device_for_each_child().
> >
> >  drivers/hid/hid-sensor-hub.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/hid/hid-sensor-hub.c b/drivers/hid/hid-sensor-
> > hub.c
> > index e9d6eb3b3831..090e5a232efa 100644
> > --- a/drivers/hid/hid-sensor-hub.c
> > +++ b/drivers/hid/hid-sensor-hub.c
> > @@ -808,6 +808,8 @@ static int sensor_hub_probe(struct hid_device
> > *hdev,
> >  static int sensor_hub_finalize_pending_fn(struct device *dev, void
> > *data)
> >  {
> >       struct hid_sensor_hub_device *hsdev;
> > +     struct sensor_hub_data *sd =3D data;
> > +     unsigned long flags;
> >
> >       if (!dev_is_platform(dev))
> >               return 0;
> > @@ -816,8 +818,10 @@ static int sensor_hub_finalize_pending_fn(struct
> > device *dev, void *data)
> >       if (!hsdev)
> >               return 0;
> >
> > +     spin_lock_irqsave(&sd->lock, flags);
> >       if (hsdev->pending.status)
> >               complete(&hsdev->pending.ready);
> > +     spin_unlock_irqrestore(&sd->lock, flags);
> >
> >       return 0;
> >  }
> > @@ -825,14 +829,11 @@ static int
> > sensor_hub_finalize_pending_fn(struct device *dev, void *data)
> >  static void sensor_hub_remove(struct hid_device *hdev)
> >  {
> >       struct sensor_hub_data *data =3D hid_get_drvdata(hdev);
> > -     unsigned long flags;
> >
> >       hid_dbg(hdev, " hardware removed\n");
> >
> > -     spin_lock_irqsave(&data->lock, flags);
> >       device_for_each_child(&hdev->dev, NULL,
> >                             sensor_hub_finalize_pending_fn);
> > -     spin_unlock_irqrestore(&data->lock, flags);
> >
> >       mfd_remove_devices(&hdev->dev);
> >       /* Clients share one HID open; release it if references
> > remain. */
