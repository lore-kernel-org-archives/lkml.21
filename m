Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795201083;
	b=ehc1cM3DoZXrVui8cBtYBFcrBONQO2S4An/PQNISlORTJHBRiRhGhsTaxk/eozYiDjAh
	 8PPXLaXIT38eODompskN3e/YrqiejScDjDRcZlKreak/rZMVBU/xDE6sCJ6sKIPc2KszS
	 if8AXFLFaEfgK9p61+LUO5lFgfH6/ydryPMU5+yRrIkFfLLqF/oBH/Mz2obtbWujvrKGE
	 IIlxBgodNVIETB0kZ1CVjQOeYcx1nwUaCADLF5XpgN5ZPf88d7yDtycNlL1FmNHittt0M
	 8ri+NgyLcK48Ad9LPXRK4kkrfnpJuSnTKLE82R/Yl+u/ODxMylB69U8I4r59e7DHMEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ar/I9wixzu0Uno/udNMX0pnEPUMbJ11YDRSQnHpj1Cw=;
	b=RJ6My3LcZnG6wNSoqFwMcwDyj1SfUvIC+HLj8K/VujmInzzO9cuTtCvLTTb4ouEWLSR1
	 AypG52ebk4JH/2l2IJzbF6LW/gULmDKIAWkYQ2Bio4konLnAaSI46Ya9vmlh/Fy2e0/so
	 8tW355GBgUvKbSiv+26kaw5sEVuL+ewelSFsxBtQd9WNqH1pufzODo/rxhkvwlNp7WVQO
	 FO49Od+tZWup+D1wc1DjP0yQpaLF+HUU7VicvPFQCqKnQIEk68oIdaIszu4aPYcDcfkwr
	 +bToQVhcrrvRPrOv1P8IdgLlKPbwqBVNa8Nifz/BZpA5mVTV1yYTEtK7e8iykvxN9rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bl8dPfEQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4635860A2635
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4635860A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bl8dPfEQ
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a018493d57so4835e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:57:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795201071; cv=none;
        d=google.com; s=arc-20260327;
        b=AIHIlTARyjaUgTXkZwgKLDERkf8NCgRiPq7ISbc5hpixgxkmojBmHuCoNLbHYqkgud
         6dlHf4i9rXXlQsXa2cBjuo+dIjvzWAYZSMgFoOAOxWnwTfa3QatWzoh6SU01lsoGSgT1
         byBdQJb9rOjDF91TIEdpmwKkPLNLFOshgF+BZJl4iyU/+7N19zJEg4KzSjOJhY8pYLlM
         BI1AJuXw6zWG3c0PWgyjB8QD/FzswEDjO3LMFW+J4elyZ6Z0kKT3LRuTINWKLm4edD9X
         R0EJFZr1jVf29zoL+P41PjWyzhuEe2vXhSXeesiOYCtiJtcxzWohz3u4dsYlRZCSXV3N
         /wjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ar/I9wixzu0Uno/udNMX0pnEPUMbJ11YDRSQnHpj1Cw=;
        fh=v+94Ml7ZM7A0YPk4XUS+Ey+wP75hbQN37cvt9xON1Sw=;
        b=AqlJqFZB7HQombkWo47jszVIT+ciHfDcbUc8ZMw91OpfSv/1uLxdSCpiRptdtFNmBm
         pffJdcYcAEBiQdBPK41F+QuouMFKkbeB0X7VzWorfehqksWUnYXmzN6b4pe2VOZOyjS2
         UOxI3uV0rImvqYsYbNkNfb/fGLeo0FLGoVPSf6mPaCTLRyXlbb8KM1Mu4LqCZuCoV/k/
         3UykYgP6Te8emPD7fZEpuIv8dvLcpR7784tV5H0AWQipZ6TBGocQ00r1YbMuzOPmhPnm
         UKYxyPadYG6OfCGKZ5HAgUq5lLcxp46HQXl+7h+fyBFByCeUgdnzPshMmw9z6m3U42g1
         6R0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795201071; x=1795805871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ar/I9wixzu0Uno/udNMX0pnEPUMbJ11YDRSQnHpj1Cw=;
        b=Bl8dPfEQb41vuRynhSi32U9qxfIhJ7cWsm0S/WOHogu0sW34oeGg2gBAjcdwDxaEOG
         ef6dYDCxPp8crLJP9rLoMi/LVbpW0i76XiGAbL/4neprGpZhLouQ/DUM/Zs124JbthYX
         0a/Lj3UqH8Ol1my8HoFKeEl3atxbTUoVmX1gqjM3xfVZFDnPefvQ9c5ng3f/a1dOuhc4
         4Du8n3L8v0CH0+MLIQ06chnnOaaFAXvKYNe5IJbeY0JwKTh8dXmM5LvaphzGfSxHvOWc
         pabCvYrWmK2XCweB0J8xb+/rhTwecMSQpmoRVCYflyRb6xnAl6cdniw2v0zHsvJZJHDi
         MLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201071; x=1795805871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ar/I9wixzu0Uno/udNMX0pnEPUMbJ11YDRSQnHpj1Cw=;
        b=jQO7GhBsT29Ck9pXk7jRLAKDFavwdHHuZGUnMyxNl6iv3GM1Uyme/b4cuzKWn45IZa
         WUQ0khM3mzq9Y8d4FIntsXlT1Xw+H2kCNy8O1RNPwl5cshiJ5ZlvRnK4RY+PGONJGAwI
         +aLoNpnT1At+pa4jHwxVsDQOxsaAFZIJAijY7J3BlWdS/CCTVVx6pXYeW+/5ZfM41RkQ
         uIxJh1EahhcukYpVxHePk87qjpnEUG4L++jCLZIAAKEiVfWMmvH2Q0KfxKwFYTn6xbTq
         x/zy7XQAWQVnCsUCr/PGNLnv9d6gzbz5kTQRZSPoKtDJmYyQ93RU2MZa7y52FJjoBYqP
         Y8ZA==
X-Forwarded-Encrypted: i=1; AL+hErELRJTLNF4qSH3cWbWzgSn7vzIy37HROXdu3LpeoGi1p4BR93JlWSuPNJWRc5i4J0PGge0d6HteDqqwhN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+v1Sg51C8J3FscTl+Ri9X8TbbD5fEcrLprXQPJRbl5evWQCk4I
	yKfEK45zk0UjDMqR8J0LXejWK5cza94i/jIBx6iMDqFZ4Lt5yYZA5QuZs64yasClMonT3xdfq1K
	2VYXzfUT+2LIqa0MsLc1lUTPKGG4yudkFXsd3QQ5K
X-Gm-Gg: AYBFou0lgS3VbGFq1xqaZv9bvEIrJMKO05ri8id0mXMoBPCH+ivOzRa+Yt9ivERXcn2
	bYAm6j6/L+Y6mLAqnKQTh29exGs6pYhdgI5MRNPlMwMxtmdkGDXZ/Oxk8g+M4K66QgODexFT4PK
	bqYEkv3nfH1ZXOEpeFFcpCa1tKDhhhN2Rc7KfgKXrAN4oSoHKdqILWqAhjUyha8fC2tslkpj1lP
	aZwGDkijQFXV7YSm2YASicBlDGjmfc3reaTGwsWLKEhCXEA/lZ1S4ABWgAYTqVNJfLh85227Uwz
	LE3aMRAbZVqQJEfZIkhb5dlFsTZeipxLTmPnvjREN48PFQgb4Bbr0F6O3ar9iZ19mgbCQ+hNXYR
	/nP/KqImyD/BdoQYhLj7CTtxqVvh1qPFV1pcWnNADwlatLIC+pkQ2vqjgnsIiEOS4Mmk=
X-Received: by 2002:a05:600c:10c5:b0:4bb:7ad8:9d1c with SMTP id
 5b1f17b1804b1-4bb90c5a063mr9505e9.6.1795201070230; Fri, 20 Nov 2026 10:57:50
 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118220154.2965621-1-shakeel.butt@linux.dev> <20261118220154.2965621-5-shakeel.butt@linux.dev>
In-Reply-To: <20261118220154.2965621-5-shakeel.butt@linux.dev>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 20 Nov 2026 10:57:38 -0800
X-Gm-Features: Aa3M54qYEmkoCcL8K-eS_MrHU--U7Q8sr1Os1o1ROUSCVqxdCeBq63ucWRqqKwM
Message-ID: <CABdmKX3-2UeZpOV0hHX7qh4K5cMWba6E5JiURhJMyp87sY4RtQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] kernfs: don't take kernfs_iattr_rwsem to publish KERNFS_REMOVING
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Christian Brauner <brauner@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tejun Heo <tj@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, Ian Kent <raven@themaw.net>, 
	Meta kernel team <kernel-team@meta.com>, linux-fsdevel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 2:02=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> __kernfs_remove() takes kernfs_iattr_rwsem for writing while it marks
> a subtree KERNFS_REMOVING, inside kernfs_rwsem.  Commit 507d8ce13f5b
> ("kernfs: Don't set_nlink for directories being removed") added it so
> that a refresh would not set the i_nlink of a directory whose removal
> has started.  The refresh no longer sets i_nlink, so the lock is not
> needed.
>
> The flag is only set here, under kernfs_rwsem.  Inode setup reads it
> under kernfs_rwsem.  getattr reads it without and reports the old link
> count or 0, either of which is right for a stat() racing the removal.
>
> Drop the lock, mark the store and the load, and read the flags once in
> kernfs_dir_nlink(), as the type bits share the word.
>
> kernfs_iattr_rwsem write acquisitions (lock_stat), before -> after:
>
>   5 dummy netdevs created and removed     1110 ->  740
>   100 cgroup mkdirs and 100 rmdirs        4500 -> 3000
>
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> ---
>  fs/kernfs/dir.c   | 10 ++++++----
>  fs/kernfs/inode.c |  7 +++++--
>  2 files changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
> index ef23eac684c6..890aca5d8d70 100644
> --- a/fs/kernfs/dir.c
> +++ b/fs/kernfs/dir.c
> @@ -1604,15 +1604,17 @@ static void __kernfs_remove(struct kernfs_node *k=
n)
>
>         pr_debug("kernfs %s: removing\n", kernfs_rcu_name(kn));
>
> -       /* prevent new usage by marking all nodes removing and deactivati=
ng */
> -       down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
> +       /*
> +        * Prevent new usage by marking all nodes removing and deactivati=
ng.
> +        * KERNFS_REMOVING is only set here, under kernfs_rwsem.
> +        * kernfs_dir_nlink() reads it without that lock.
> +        */
>         pos =3D NULL;
>         while ((pos =3D kernfs_next_descendant_post(pos, kn))) {
> -               pos->flags |=3D KERNFS_REMOVING;
> +               WRITE_ONCE(pos->flags, pos->flags | KERNFS_REMOVING);
>                 if (kernfs_active(pos))
>                         atomic_add(KN_DEACTIVATED_BIAS, &pos->active);
>         }
> -       up_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
>
>         /* deactivate and unlink the subtree node-by-node */
>         do {
> diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
> index 2f463c0354a5..ca234f69882b 100644
> --- a/fs/kernfs/inode.c
> +++ b/fs/kernfs/inode.c
> @@ -165,9 +165,12 @@ static inline void set_inode_attr(struct inode *inod=
e,
>   */
>  static bool kernfs_dir_nlink(struct kernfs_node *kn, unsigned int *nlink=
)
>  {
> -       if (kernfs_type(kn) !=3D KERNFS_DIR)
> +       /* KERNFS_REMOVING can be set concurrently; read the flags once. =
*/
> +       unsigned short flags =3D READ_ONCE(kn->flags);

Hi Shakeel,

I'd like to ask for some code comments / documentation.

This lockless read relies on two rules for kn->flags... the type bits
and flags set before publication never change, and the other flags are
only changed with kernfs_rwsem held for write (except KERNFS_NS).

Parts of this are explained in a comment in kernfs_dop_revalidate()
but not on the field, and that comment doesn't cover KERNFS_HIDDEN or
KERNFS_SUICIDAL/SUICIDED.

Since this series adds a lockless reader that depends on these rules,
how about a comment on kernfs_node->flags like:

/*
 * Type bits, flags set before publication, and KERNFS_NS are stable;
the rest change under
 * kernfs_rwsem (write).  Lockless readers of changing flags must use
READ_ONCE(), taking
 * one snapshot if they also test stable bits.
 */


> +
> +       if ((flags & KERNFS_TYPE_MASK) !=3D KERNFS_DIR)
>                 return false;
> -       *nlink =3D (kn->flags & KERNFS_REMOVING) ? 0 :
> +       *nlink =3D (flags & KERNFS_REMOVING) ? 0 :
>                  READ_ONCE(kn->dir.subdirs) + 2;
>         return true;
>  }
> --
> 2.53.1-Meta
>
