Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795173654;
	b=tSVzjqb+7e2faAPcttHR5qLvMz5EX7e3r6/5PScfIwy9OQ8rGYwO69cRedrhoXbmMpV7
	 aODj6nKReKHlwJwL382pNzkJ3K7WhC+VSiC62GEnsREhadKpCM9IFpx5DwXbTddj9g89l
	 joq2Nd4iz20uCO2FH8fcPvr1TQ5wlkhjvF/EsZVeohwCA9s4jy6XkiY/63sU+udvfMLLt
	 A/rhoonO8OUyaC8D/0f4NZ0wCzZQXBhwutRtjdsn38tP2PX3KyTq8MgBk+L3D9mHqA8Ew
	 69Z0wxzS1v8IeSqOMwipLaJ4cOMg3Bob3E+7ylyjJU7qSWv0zbeG68RThvToQdrPdaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UQX9LAKDbJv63O+oyEMBZ5zmGCeTuL/tuyPPcUZ7zkY=;
	b=AdiwU5FV4NW1ycut0qQfF0ca0bWrwNoI1E1VcSPmfyhIwtWOQzm8V9oMMXnmf4GoSF5c
	 zSSxbcc7vBkolS7sJD2vhC8daoaT9D8W+fJ93cFoHn2Bbwyv16NWNevkFlFfHu2q/mBOs
	 lEUgfzA9wyWgmYQGdoTLZrHEoRTPQPu1NYY0zCM86tKf2VkLeee1hl2T+gD9rCEb/8IOr
	 GSkG4dBkyqTJ5Rp3sTXNqyqiS6GAgiepnx7j3Pk13StUXYZ6EnXqtyl765Mk2J1Dnj0EA
	 DnLOriiOB+QoKvv4hdr23jWMVRxQOxwR1CXQIHkmRBj3uC2BWIKFIocIt4SWtHKpmCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloud.ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=HGhCt+cg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B26B606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B26B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=HGhCt+cg
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso878422a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:20:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795173652; cv=none;
        d=google.com; s=arc-20260327;
        b=py9AxWpohe6hl2+PhhWupqhzcd6yOg0xhp7CmFYCcbb0YRfUwdDzqdJKrlmWzd9tqn
         OGuUenSWF25N8ElLdZYyiSBFFBHm95WRw98KlRa+HQUwwyXo+fLiWUIN/k6K4cBS3hQ3
         gEwM9ex85rsfWnztb9ugxxSW00zK1rX5tlSGhaWdFRG0rpfWP01bd3lyDX+Q2R1lPG3S
         ph506yX7w3JlbUZUDrnlWlWj/jalU6U70wCiFd1GlAKGk0V5SoYFOcvnxvM5gvmIbeus
         cIMMPnuI7prWpBM1B/pdH4yaUzg6QaMb9m+ZKPJ5JhX/DTBu4gTftP/f6IuzFIDRxx/p
         8w1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UQX9LAKDbJv63O+oyEMBZ5zmGCeTuL/tuyPPcUZ7zkY=;
        fh=bEo5ItGU4mur0Y+qdzrOzRd21zzEerCxOgTLEL9ufwk=;
        b=ZP8qu0L/Js92v8xBQT7o1/n9k6THYwYtkAlUQY4AF+Oo1HF+1IDDztZMjuyckTIrIh
         UnSi+yfsBh5Lw2Dxi7gSbj9VYYtN6qZJR9T/rQxgU8jmuA8bwibQQWKWgC0MLeB38YFv
         eZ9KR0aJICAuVsPOtnd/q42owH1JACO8xGjbIAI5ndFQKQNwU7y8H+NXZtfeqhpqE4yE
         W9BuR1eXoiFrTKiIZOlR5J+kLT7PSyksF0M4mx/+HZHcqY7lzpIm4iYzUopzXprAQb0G
         PbA3m+EyqMaB8SEj59GRH75qGGO1+F6wnKhiAUcB0NT9qFmxIH35DegNw3JXzzAZsZv1
         ei8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1795173652; x=1795778452; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UQX9LAKDbJv63O+oyEMBZ5zmGCeTuL/tuyPPcUZ7zkY=;
        b=HGhCt+cgkHkc+fYj57YSXT8KfrPye31SP3vljt5ItUBjXF3Fqo0UyNq75R9e+gAovQ
         IrtVWcmnUlJq+NKn2fDamVFR1PZ5acmH5nkWFsrEeIIFGWddYEWc0NgKW5BvnZYKqeU/
         gczdBt84+rPVxAm4+Za3dVZ5hRCbWYPyc7Ggwz1AvyO0r39Yyyd/QFFaepNZgLcnmByv
         DLzGQM/RUg8Z/1XarC7itZWKS8J+sTUHGy9774gP272p4W82Z+zyRTZltQ/hLx9T7j5a
         bB2drpitti9W1X7N8msti2nogmIiiKGBpk9y7qMSmFZ4y2xJTJYeYnUzApyI0kNYF4Kq
         +pMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173652; x=1795778452;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQX9LAKDbJv63O+oyEMBZ5zmGCeTuL/tuyPPcUZ7zkY=;
        b=1efoe+8X6pyRlDLsgxBJOaA66N0MFnM+prf2cy/ADn+qy5zEC3ykp8XH/LKWDAGxSa
         ZYpchxrtZyfA7SWFP3gGGkwjnQHuUfCj/qWDNuHUr2tdpct3+k1ZUC1h8gfWmNO837Na
         SqBhJPVb546nn4tgCGlAVs0tZUBPBboVnU5iZ46/WdTk6KMfmAPq2L79QJP7Csre+Kb1
         nSt+rBoizNKK/LXTWji0ts38nkCIlAEjouJGIRf3gVDp8m008tEvbzsWy6RfZKztCaK2
         Jv2LkeU11O4yeAYFzL/mVIh1aI+d7ePYcauth1dR8gdO4KhjEWN47cyWxmxkvEAXmMBT
         sM/Q==
X-Forwarded-Encrypted: i=1; AL+hErGq2FsLt4heZuAhf6dBpWA3iJbiyg7LIN8JgHptR4SdKSEX9hb1/sNOUv3VeuHAfiqDpB2nqqJ+Ds9gqEE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OgysKCGBbzyW2f60oVKT+B4m4n4cmszbS7GTYHY7dEw1u6tDc
	TlvDXZyevor6McaxpMFGhoXkOwHrrJo1dp1bRm+zDvHqjP5Ipgk+JZyiKh/C/k9g7bNwfHZUQYV
	15Zfv75S3ShQyz97X4pfaGgHK+r1DarIX0ojxRqWkrg==
X-Gm-Gg: AZFdTZfkF5qXCFgjLb2DxIuFii3Tn/hjnuJR3f+SDMlfQ0naimEhiJ8zPzkv9BGp6rU
	pAwjrNggHPqKS2gxaUl5Gg9NATTqRjQv5sQFPldbaYhruxXZzeww57G1uo2IxHHItBB2lsoREh5
	efvfMl8CVYkll9wflqy6eIBDZzqPueMOFijeubhPsyiu7rtHiUKXAZ7eM6Z8NTS8EUxffVpjRBH
	A6+Xm+RhB5pYAgadloTfNcRRwlNHvvJk1b2qeppsUDOuNtq4dToObDWlLaACK+B8r8/IcnKfKXp
	M/mrhQXoj3eqgDsVckg81LDAJ50Ko/BCZ2zbOYLiQvR+3CXD9DYMCj8WbNtXkzou5Sz3mEU3HOC
	vz5IVfFkkoKghGfGguL4sxyHYHbQrgHSbd1wXtjlf+YoRdbJjqq8CLy/ZXVe6ydrBhqZs9esIwD
	btxHGiHX/C+ib6aFQGym2VA8h31DMVd5XhB/2PIFBtBoj3BitqlI7m9IPsgBLJ75I7nyKFOT8+8
	msbt81mGBAzszInz1oZzMBxsFQIqgjZCvNJWTxskhU00vQ8CCtPPhxcAhw=
X-Received: by 2002:aa7:d351:0:b0:6b4:86e1:cc67 with SMTP id
 4fb4d7f45d1cf-6ba37ea0b91mr1306429a12.27.1795173651526; Fri, 20 Nov 2026
 03:20:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260802031350.1468599-1-shuangpeng.kernel@gmail.com>
In-Reply-To: <20260802031350.1468599-1-shuangpeng.kernel@gmail.com>
From: Haris Iqbal <haris.iqbal@cloud.ionos.com>
Date: Fri, 20 Nov 2026 12:20:39 +0100
X-Gm-Features: Aa3M54plvx9H83qo4LJ7Ae2TaDMpFtDwJLUnuLmm5c3StPpYcDm0-SgN5HSqv5Q
Message-ID: <CAJpMwyjS_sCanPxHJAP7d_j4x8m9FQ4a8zq_nCc13jBZdXmVRw@mail.gmail.com>
Subject: Re: [PATCH] rnbd-clt: fix use-after-free on device sysfs creation failure
To: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
Cc: Jack Wang <jinpu.wang@ionos.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 2, 2026 at 5:15=E2=80=AFAM Shuangpeng Bai
<shuangpeng.kernel@gmail.com> wrote:
>
> rnbd_clt_add_dev_kobj() initializes dev->kobj and adds it below the
> gendisk kobject after rnbd_clt_map_device() has returned a live
> rnbd_clt_dev to rnbd_clt_map_device_store().
>
> If kobject_init_and_add() fails, the helper currently calls
> kobject_put() on the embedded kobject. That put can drop the initial
> kobject reference and run rnbd_dev_release(), freeing dev. The caller
> then continues through the normal error path and calls
> rnbd_clt_unmap_device(dev, true, NULL), dereferencing the freed device.
>
> Leave the initialized kobject alive until the normal device teardown has
> completed and rnbd_clt_put_dev() drops the final device reference. Since
> kobject_init_and_add() failure can leave the kobject initialized but not
> present in sysfs, only call kobject_del() from rnbd_destroy_sysfs() when
> state_in_sysfs is set.
>
> Fixes: 581cf833cac4 ("block: rnbd: add .release to rnbd_dev_ktype")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

LGTM!
Acked-by: Md Haris Iqbal <haris.iqbal@ionos.com>

> ---
>  drivers/block/rnbd/rnbd-clt-sysfs.c | 2 +-
>  drivers/block/rnbd/rnbd-clt.c       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/block/rnbd/rnbd-clt-sysfs.c b/drivers/block/rnbd/rnb=
d-clt-sysfs.c
> index eb485e4c12e2..9f5d30659f3d 100644
> --- a/drivers/block/rnbd/rnbd-clt-sysfs.c
> +++ b/drivers/block/rnbd/rnbd-clt-sysfs.c
> @@ -498,7 +498,7 @@ static int rnbd_clt_add_dev_kobj(struct rnbd_clt_dev =
*dev)
>         if (ret) {
>                 rnbd_clt_err(dev, "Failed to create device sysfs dir, err=
: %d\n",
>                               ret);
> -               kobject_put(&dev->kobj);
> +               return ret;
>         }
>         kobject_uevent(gd_kobj, KOBJ_ONLINE);
>
> diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.=
c
> index 4d6725a0035e..5fe5c7e259b7 100644
> --- a/drivers/block/rnbd/rnbd-clt.c
> +++ b/drivers/block/rnbd/rnbd-clt.c
> @@ -1658,7 +1658,7 @@ static void rnbd_destroy_sysfs(struct rnbd_clt_dev =
*dev,
>                           const struct attribute *sysfs_self)
>  {
>         rnbd_clt_remove_dev_symlink(dev);
> -       if (dev->kobj.state_initialized) {
> +       if (dev->kobj.state_in_sysfs) {
>                 if (sysfs_self)
>                         /* To avoid deadlock firstly remove itself */
>                         sysfs_remove_file_self(&dev->kobj, sysfs_self);
> --
> 2.43.0
>


--=20

Regards
-Haris
