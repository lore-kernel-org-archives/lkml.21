Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795537879;
	b=CSe+Q8el9qi5/xfRFlL6B+ytT2GGFydESEAAbZPPJYYhZi7I3h4hCIPQnCD38w5O1ln0
	 +2YG1Nmw9K6lSyinCfEG//4SKi1V3fyZYSB60C1Ot7Dvl52bRzm5qU3QBOhwU39cruDf4
	 HaCNml2kChLB4k8MftoGfxGm/qbB46vMasl5BXYF4CU8qU1bPnU2hqJvifiDVvED/2cbX
	 6bPo1Vr0TdE7ZGH/YSoOoR9zS3/wr4dV8jea72+LSWY6LiFk6krBIjoltU5Y44xinwcqU
	 ekZF6oulrYZivynTQDm3c0c4kjfG3F7jicfD2ndDS2F2CUqYGsqUUH4saYrOlesFktQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Wbz5MHgrotvmvS234Ul0ZoF8Ky6iZRkQglERKXzkxJE=;
	b=X4ZL9Sq2r0equohy+FDs41IOX4Kp6vEnfBbvg27iY+viDwMtcYD57RTN8rPujebUrOfM
	 QlR8HoUpJIRuQC+ayH20DmYBeaFvvLfoENFdXg30An2iKAHOgSnhKMXh1tn70pKftFe1b
	 zoON4/+bL3dH4sbqltoPHqZAP8gFCe0jRNNc/Fcb5eyrKiBQTECD2xfXcjXsqi7uWcCW5
	 o4Aqp/VntP0UlvD9smqF6fNuIN3ULrabWDwDjQGb1INKY6zadtzaSsTeepvjzlu8WIzxx
	 ocHHOlRaLWFvccnAHCJUDqmA20YJyVOElfvZS63rdIagHjrHiHRlZOrBclA0HK6cSNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKjkz+CS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD911606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 16:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD911606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SKjkz+CS
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7a6e560f580so2998729137.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 08:31:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795537878; cv=none;
        d=google.com; s=arc-20260327;
        b=eNwDbyPaf41WDJ6FE7VIpXbbexLIz2Q+TyGS7d8tYHvaoW2fF2cMEuMLNYHJHWO3G/
         xpxWoWUxReo5DH7GfegwLleFP0+LRq+gQdbm3SUS2PcSw/FybfEliPs04rqBpL2GnJlG
         3GKSgWooERR4eSShEfY0SIov4aDTFdIKdKeuSXXvbG7BgkqcI2ccp3hI8Y5bXhln1f5c
         efqww+GJX9Pl+n4PFEhNfTZxU4Oz4nCrzf7L2Lmh9rSQ7bd/78ZklrhwjqLRP2BXvfCO
         J956aUikBYxiSw8U9jLt/YscHuQlBoeHWClJhBphSKY59nKZ9YzaBXcquGCsvYPR1x1b
         WVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wbz5MHgrotvmvS234Ul0ZoF8Ky6iZRkQglERKXzkxJE=;
        fh=ssDhC8J6TmhUPbLChUlBu2M5tNYOIAd3L7SckXSgWyE=;
        b=UDlbcZs1/GUTMO7psdOsXYUFBe0pXet+qL9cb8tHeFmg9Y91oZnG9ZwxnsrSasuDZm
         96zIu/NxEKzHz8HyQaNQKmJBG2dwlzImXRtPh/3DOvg2nBok8yIoX60PHnMmsjqsU3lR
         unlRoNbjkTklWWUUMt3FfGitAuyCV97GNhvbh4VpNgMCqF+5Bzz6ddE9AI5DmjG1BIlm
         538DBT84Zk9lhu1D7ktalwaG/9Ko0ef3Fs2Tgj4oEc6spsfuVsvsTFRqBBMkFPcqpCgU
         Im45P/YNLILuj6g5O79krARxRiSN/xlXrvV1LTAaAMbEMwjnHwtQHvrcsgg0kz4m6Jpk
         tWDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795537878; x=1796142678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wbz5MHgrotvmvS234Ul0ZoF8Ky6iZRkQglERKXzkxJE=;
        b=SKjkz+CSzFRatCJksOBZLL5X8iAEw4K1PEcqG7GdnHn3UfMBMB/pp40SO5lXbb9bTI
         iOQKjt5Y5ow9gEaCxIR03T9pOiOOfa3KudQZKL/I6yEVMe+shu3/B22UDgySUo5qkr1h
         RIFEadNvw7/+m3Gr52BBYsOVcTEYNVFWCOQPwYb0kVXWlj5Inbjz3DYk2FEObyuLPDKv
         NdXNoPe9w437/Q5LbLP20o0OHthU5JAnm7t1DcaeaQK5sfGGyHP9771+mnSasCbRDOvW
         qUAb8nI3rFPDoP4jnhRJWNo7RYvxA7ywFqd48mUOCwJbBTqf/SyBk8aNCHekWNisCMEp
         ELqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537878; x=1796142678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wbz5MHgrotvmvS234Ul0ZoF8Ky6iZRkQglERKXzkxJE=;
        b=AK+Fm5bBnenNJRHT4oZtkesV9iYSkk58fDaBeCOfAh1Vf+OdUDASZD19qGilOaOFhZ
         VLBfjICihjcG7xcd7mdRZRAmYTsyd3yJWSHwYC2I8hAzWUN9iVroRgcVOfA4wfJFRLcc
         yGejfpjlQcwTPmI19z9Ug/GvyWBooJsY/ootiM9BVky8wQ6oghVfpZiMRQ30/f/ilCKY
         SDe0/t15+OC1i6MBufjOA2mqbYl3VtXNXcAMvEAgX+UNzNUQRUEff7QGWv1mFJTFpuit
         o1xmsmwcoPTuzecUSJYmO+/Lshsd+FBj+uM8Xud/1NJQpUHZDlns+IwLWx9QeieJyZcA
         cL8Q==
X-Forwarded-Encrypted: i=1; AL+hErFofwxucsOUcgdj3xRS4pHCMUFCC7GwsgiWw5hRy09Rad2BFMaGEtZcp+OSXZG55cdH2ioxQ9d6+eQZQNc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9W5WYYd8dQ+xCTCDejlJsEb/AGRnPlIEg05PswVzjzbWC1DSj5
	cpLB92kHfS8Tgw+AHrXliQwCySVq02pCzGRrLmlR4iFREP54S57FMrlAq84uX8wWUdOaWzHQrpk
	8WAllfB9ffuLieFCC4apzy73X7ugkhrc=
X-Gm-Gg: AZFdTZdDgGlSBUlMoXi50Uv8gf0RXfAp1viop7eiKYI0uwWZ8sl2YaanR1yfLEyxY2w
	PJgFhkY0109O/uIjmCfV/zoEvPIA9jpFBDrcJ2FPqvQ9mIasE2nwV57biDuf2Yok7dAm+DP8KrF
	Zyy/Fmp+6Y6oGGItfA30v8kZz7e9c8KLpvbvYvnt/U66tvrgZFmaZATcwsCbKKP7IlSRVLpU2tp
	t39GtuFDKHpqqvR06lx22i6rF2JHjNpc0iewl+Sd4qaLbzWbFtANQsdbZ2qnbJJYpomUV/J3Bai
	9a+Bs+1OXNAAuODWgZh/hlEhtd6BRNe8Gs3bJQkgDCVqKxt0MvctY14xmA02D3sJSRr/QTHlXaI
	oLYn+aVGdZl86CDUUFddRbO7FKjlt0IyGpMWXPnDpwz9/maV52RTYIZ65kwF20VZqDtDYMPWYgq
	5cZJw2kEsytJI8ehdRXV7C5N0duux/57atlQ/l3awAyucTCI7aEJAEkwHqwGXJLytxoGm/rMC+P
	2SkBQw1Hq0R8eFED4mXVZRJeqbUbw==
X-Received: by 2002:a05:6102:f11:b0:7d0:6cf3:d8f0 with SMTP id
 ada2fe7eead31-7d7393ff876mr9420859137.18.1795537876719; Tue, 24 Nov 2026
 08:31:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-submit-mtd-partition-publication-v1-v2-1-8098cde01961@gmail.com>
 <87bj7ettng.fsf@bootlin.com>
In-Reply-To: <87bj7ettng.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 24 Nov 2026 09:31:05 -0700
X-Gm-Features: Aa3M54okleW4Lj0RRelpnmYTI5rOyLuDyszpkPnhLAOeuLzYyHg1VmfHbZ2XORk
Message-ID: <CADvTj4qup+jzmE++MiDEXfwEUcAMXDrsaM3+T+qX_Yoa+==W4Q@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: serialize dynamic partition registration with removal
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 3:23=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> On 20/11/2026 at 09:02:06 -07, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > If a flash driver is unbound while userspace adds a partition, removal
> > can find the new partition before it is registered or release it before
> > its sysfs attributes are added. If removal finishes first, the ioctl ca=
n
> > even register a new partition on a master that has been unregistered.
> >
> > Hold partitions_lock from the start of partition allocation until the
> > device and its attributes are registered. Mark the master as being
> > unregistered under the same lock so a later ioctl fails before allocati=
on
> > can read bad-block markers. Clear the flag when registering the master.
> >
> > Fixes: 5daa7b21496a ("mtd: prepare partition add and del functions for =
ioctl requests")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes in v2:
> > - Use mutex guards to keep publication and teardown lock scopes explici=
t.
> > - Link to v1: https://patch.msgid.link/20261108-submit-mtd-partition-pu=
blication-v1-v1-1-cbff20b1351e@gmail.com
> > ---
> >  drivers/mtd/mtdcore.c   | 4 ++++
> >  drivers/mtd/mtdpart.c   | 9 ++++-----
> >  include/linux/mtd/mtd.h | 2 ++
> >  3 files changed, 10 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> > index b170c3144ca8..5ee1eb29fc1a 100644
> > --- a/drivers/mtd/mtdcore.c
> > +++ b/drivers/mtd/mtdcore.c
> > @@ -918,6 +918,7 @@ static void mtd_set_dev_defaults(struct mtd_info *m=
td)
> >       INIT_LIST_HEAD(&mtd->partitions);
> >       mutex_init(&mtd->master.partitions_lock);
> >       mutex_init(&mtd->master.chrdev_lock);
> > +     mtd->master.unregistering =3D false;
>
> Maybe this is worth a WRITE_ONCE() to tell robots that there is no
> possible conflict on this access?

This initializes the flag alongside the two mutexes, before the master
is published. A plain store should be enough here. After publication,
the add and unregister paths access the flag under the same mutex.

>
> >  }
> >
> >  static ssize_t mtd_otp_size(struct mtd_info *mtd, bool is_user)
> > @@ -1206,6 +1207,9 @@ int mtd_device_unregister(struct mtd_info *master=
)
> >  {
> >       int err;
> >
> > +     scoped_guard(mutex, &master->master.partitions_lock)
> > +             master->master.unregistering =3D true;
> > +
>
> Actually I'm not sure my proposal actually fits. It does not make the
> logic clearer. At least not implemented like that (and below).
>
> >       if (master->_reboot) {
> >               unregister_reboot_notifier(&master->reboot_notifier);
> >               memset(&master->reboot_notifier, 0, sizeof(master->reboot=
_notifier));
> > diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> > index ddded0dbe77e..b20fa4309084 100644
> > --- a/drivers/mtd/mtdpart.c
> > +++ b/drivers/mtd/mtdpart.c
> > @@ -278,13 +278,15 @@ int mtd_add_partition(struct mtd_info *parent, co=
nst char *name,
> >       part.size =3D length;
> >       part.offset =3D offset;
> >
> > +     guard(mutex)(&master->master.partitions_lock);
> > +     if (master->master.unregistering)
> > +             return -ENODEV;
> > +
> >       child =3D allocate_partition(parent, &part, -1, offset);
> >       if (IS_ERR(child))
> >               return PTR_ERR(child);
> >
> > -     mutex_lock(&master->master.partitions_lock);
> >       list_add_tail(&child->part.node, &parent->partitions);
> > -     mutex_unlock(&master->master.partitions_lock);
>
> That mutex becomes super wide. I'm not a super big fan of it. Isn't
> there a possibility of deadlock with the notifiers or any other lock
> inside? Would there an alternative?

I haven't found a specific deadlock, but v2 does call the MTD add
notifiers with both partitions_lock and mtd_table_mutex held.

Could we use the lock that already covers BLKPG instead? Both the
native and compat ioctls hold the master's chrdev_lock until the add
returns. Unregister could take that lock to set the flag and release
it before starting teardown. If the add gets there first, it finishes
setting up the child's sysfs files before removal starts. If unregister
gets there first, the add returns -ENODEV before scanning for bad blocks.

That keeps partitions_lock out of the add notifiers. The exported
helpers would need the same protection for direct callers, without
taking chrdev_lock twice from BLKPG. One tradeoff is that unregister
would also wait for unrelated ioctls on that master, so the lock order
on the unregister side would still need checking.

>
> >
> >       ret =3D add_mtd_device(child);
> >       if (ret)
>
> In case of failure, should we clear the boolean?

Not when add_mtd_device(child) fails. Only master removal sets the
flag; a failed add just removes its list entry and frees the child.
If master removal itself fails, some partitions or OTP providers may
already be gone, so it wouldn't be safe to allow new adds again.

>
> > @@ -295,10 +297,7 @@ int mtd_add_partition(struct mtd_info *parent, con=
st char *name,
> >       return 0;
> >
> >  err_remove_part:
> > -     mutex_lock(&master->master.partitions_lock);
> >       list_del(&child->part.node);
> > -     mutex_unlock(&master->master.partitions_lock);
> > -
>
> I think there is a rule where we should not use those guards with goto
> statements.

Using explicit lock/unlock for the list updates would let us keep the
existing error label without mixing the two cleanup styles.

>
> >       free_partition(child);
> >
> >       return ret;
> > diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> > index 8d10d9d2e830..cd7b4671c456 100644
> > --- a/include/linux/mtd/mtd.h
> > +++ b/include/linux/mtd/mtd.h
> > @@ -224,6 +224,7 @@ struct mtd_part {
> >   *                not only the master partition list, but also all
> >   *                sub-partitions.
> >   * @suspended: set to 1 when the device is suspended, 0 otherwise
> > + * @unregistering: removal has started; protected by partitions_lock
> >   *
> >   * This struct is embedded in mtd_info and contains master-specific
> >   * properties/fields. The master is the root MTD device from the MTD p=
artition
> > @@ -233,6 +234,7 @@ struct mtd_master {
> >       struct mutex partitions_lock;
> >       struct mutex chrdev_lock;
> >       unsigned int suspended : 1;
> > +     bool unregistering;
>
> Maybe unsigned int xxx : 1 to be consistent?

The adjacent suspended bit is changed by mtd_suspend() and mtd_resume()
without taking the same mutex. With adjacent bitfields, setting one can
write back the byte containing both. A separate bool avoids that.

>
> >  };
> >
> >  struct mtd_info {
> >
> > ---
> > base-commit: 14b6830335eb6d70dec7a235094d66c22d38eb07
> > base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git =
mtd/fixes
> > change-id: 20261108-submit-mtd-partition-publication-v1-4629be94d7e6
> >
> > Best regards,
>
> Miqu=C3=A8l
