Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795097855;
	b=B506MqezQrGzTueAQMMKQDxirOB/bz6MoejiItJyJcvoKKc5OqYhW7Oe9/6qqY90bt6g
	 JwEMnzzWOvGpOIAVRMC2Hze3VAAGiCqXOToTVIxrA4lPHpxTliXcb7QwxMr3LURE8RNwW
	 yBN13M1dtGpbDa/r6keHtekHM3VqMH2FmxPAxt1pDUAZ7+ZqPiVVVO+hDV5jCJSDsYLHS
	 K/qYEZ+VL/Bh2k9mSt21LwbVeNFynRQ59wl/T5bK6DM2QeFqKYdiMbtp8ByNscosPy7Hz
	 iiNquOBrIR7ur9LVjUKjQhNYDZcLK+zQqK6Vu0+cn4Geqt026Aiq1VyHSqqBgnUsDjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=a0wuRDfCqI9H1yXKDYU9ffVxzYM0+S41Bo3dJny90cA=;
	b=lN+esAxD7Q8STIlujzqF9diuSsE11uIgNB1uoZoMF4Eksn5dQX3fJkz93C4m0B+UP22F
	 iEuBLUPqy/U8mzkljcgrzLCLjt5jg5EGHeSgxQLzl68Z5euUfKy9FrnMf8EI7PTgvyyhU
	 PVdXiApWhpkblOtcF/M6wFwVb5VfEkI0qLxIwS+NmxsVL4prDk9i8qumKyAqqk9rqku+A
	 0ZaOdQYJa7CFoypgO1RNmeUGtonPsqzrp/msegTIV/9V+9FTJ1V/BBKyrw7eOxnbt9jpU
	 4S74oEsK4nrcwXDiBv4S/I1WVk9X0vFvTqSBuPznpwUqWMsAuIaX/eQ1mC1q1DYIwfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbGqy1fR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E51C606A33A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:17:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E51C606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TbGqy1fR
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b8784a3284so2019625a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:17:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795097853; cv=none;
        d=google.com; s=arc-20260327;
        b=lR6MMhnLN5zZfNdhk1xz0xIB8JN8xBCi9zoOxLF/zGEuvSyigexiEgvL3e385FdFwH
         l92avw6OJTXJx9W+ZrjoKlKK/1jTbr9xBGQalsVdGAnpNnJHPxBdgtFcz9y1yg9GEqyf
         pRCzcNG4XXvNvfppoSAGf+AFWCmwk9T72quOo8OEoSUPQ+dV6zbf3/JyQZg28fcC+eZC
         G+a9EDDO3XVOkO37s6KGh3T+cBlcamnT9TrKZbvaYBh1iIn0YvubuLzFtpy5nKHmS2WX
         sZ0TIOER4bVWBXxYy0C+/R7mwEz12B1Of5UrJybmvjbi6UcZ13JDmBtCmK+GDdTiwEuA
         yCgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a0wuRDfCqI9H1yXKDYU9ffVxzYM0+S41Bo3dJny90cA=;
        fh=/dNHCRpv0xJ1ZFwECV77LjvJol2J7f0oTubeonIRclI=;
        b=SKjQ8S/GnP1C7N9CmMBy2rQFmrw3Jl7guhTqGzS5Ut+qHY9kuePoyOf46ejBeQEgNS
         SSJY8B5FNHQvaMIKZ1g2eVaeCDtk5ycc+3MahrPl4IZyL2wsg1euMqBChp/Tp52wAx/9
         jkmqk8Gl3GjpSTBO/HxdnEQP/+rV6C6hIoI8LBzDAmlM7sNQ8MD/cuZNYNmWEaPIt630
         rLlnuIYbHpXfhiZB2Ysa0+rk+5HpaHtD2sPEzlIztmi+7dVmol4XtsOFW/MRZFXiBDPj
         2qWPtqujjLB6cUk2ZfVPhAKbM3S/7FH8WY0iguWkU39an1tT2U3Tf2QB/PpJtdb0a+ML
         GoJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795097853; x=1795702653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a0wuRDfCqI9H1yXKDYU9ffVxzYM0+S41Bo3dJny90cA=;
        b=TbGqy1fRVKgwF2lZaswTfp3fokRXgv8XWxCTnSKNQvTtTRphn8ZCJfjk6bUa/Qx1BZ
         qZnEED/So4mIQd6Sr/qpNVamWkY0xMRCdoGtLZ1XTK5hFhKjhBu2rQSPHM6LzP7+pgQ9
         0rGu7OQOMr3M7/94bnSZL8OHWDeSlJe6Sfyj1YYiOpNKqIOe4+6YjDw4KiGqR1IwZxYB
         mBVvUjf2St34KYwwp5cD8OvIuQU0GN0hGHsndcf+8CKVQNdYZzzc7VJplmzUnUNjJTly
         f/HT3Z0EMjSs/OmaV9rlYCX5HUpDq8a4oL0zeaKeOqrLsetJhPwjhVHplP+/iIXL5PF8
         PqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097853; x=1795702653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0wuRDfCqI9H1yXKDYU9ffVxzYM0+S41Bo3dJny90cA=;
        b=1x1dhPItV5ujA41znEmgkom8Nq+2Wp8rpXTMggrd/QfqKYEeLhJSMAFFRlYTCSrOMP
         EJxwj2KfU2nj7jtA6ACj5z5gGRv8om2Pn0HahrtL3ifpp6l327rShbUiKJhdLRjW0GVO
         k8Nj6b6vDl93hLPLEHRXN4XA3xnFxpyGhCREsLAFbQJqsjJgBxU+Q+relRMmyHVBpY+h
         CynKwTRzJuPbVEh9wM/SkPLu/uqGRjgzxv8LS3Sj9nuRBTU92q4WBjZN5B+KiOim301E
         LZtjeygTOq9MAzPHmPmy3lZb+7BVb49n8meEKUQgY8T/JGx/xVLvmVlF4LqGFPrJDa52
         Ew5g==
X-Forwarded-Encrypted: i=1; AL+hErFQdksoeNv0TdmptYQAk+AcjXK7sRALrKbVLULtHo18dX+SBYEteeh57oPwMJ9XHwYciz4n4E5oIXs8WjM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OTIYLMOnoSZx+f4vwAdtNg+iAXKl6vpfiJcDXBZbD7j8GsgPe
	SvHdt6oMqHeVOu7B6E5y8WAaiLzwduqTj3vpb8d5udNbhJgyA7TXmHePZ9YzgVVgJUWzWT37kcG
	hHcw/upcuHumwbe04SDBa/1ooyZUAVzo=
X-Gm-Gg: AYBFou2wbYChsgC5IETvlWBu+RK7dlUHAFzlKxLUHQ4Ka3/FClyJWx3/sJI3fD/Smgn
	5B6zstGlBkfNodkNsjYV2Qi7C2Yz1Yu27ai+C5zhJEEtNJVEyqCWAhAJR3kvyl5m/EUZGFt020V
	cvuobsh+GFNR64Cf1S9Fo9M61Q1pgVzMwdH+57nlzBqhslWJnWI6vgZs8pIfDl3PZZ5693jJatm
	p1bY2gKcQgV7WUOwTI0OPnVJQP2Vpvosag7dueoP1bsRigHTzgOCtdo/SxvQxCc0NBnFZt9PWHV
	err4MSkLcGy94AB5G4IWE/3RDjSmE+NGId86EwFk8lq3XgVPluMgPLh7VUjam8OB/RuPWrIREev
	skpZ49JyI1BIOpg7AsEOXfHdk4MStcakcsDPiouAgbxzTNWNCjFmz30ogCtBH1JWcL+62va93PN
	okw1bIvkrA5KlW+p4=
X-Received: by 2002:aa7:c1c7:0:b0:6b8:6923:91e3 with SMTP id
 4fb4d7f45d1cf-6b887ef17admr3757230a12.7.1795097853003; Thu, 19 Nov 2026
 06:17:33 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119025942.2848130-1-neilb@ownmail.net> <20261119025942.2848130-5-neilb@ownmail.net>
In-Reply-To: <20261119025942.2848130-5-neilb@ownmail.net>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 19 Nov 2026 15:17:21 +0100
X-Gm-Features: AclHuK8T6bEqIG7WMipfNp1tO_FH1yaTNDotviQIju2dOKQkw2iC5zD9XaDKryQ
Message-ID: <CAOQ4uxgan=mpQ9yHOyZwZZp8E69+oH3uaPJ5CBkP7Z5BCO-5jA@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] Add d_for_each_positive_child family of iterators
To: NeilBrown <neil@brown.name>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Kent <raven@themaw.net>, Jake Edge <jake@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 4:00=E2=80=AFAM NeilBrown <neilb@ownmail.net> wrote=
:
>
> From: NeilBrown <neil@brown.name>
>
> Provide iterators for the d_children/d_sib lists.  These iterators only
> report dentries that are positive (though they could be negative by the
> time they are used).  As DCACHE_DENTRY_CURSOR dentries are never
> positive they are never reported.
>
> d_for_each_positive_child() takes the parent lock and sets the iterator
> to each positive child in turn.
>
> d_for_each_positive_child_continue() can continue after an existing
> dentry, or (when initialised to NULL) behave like
> d_for_each_positive_child().  This requires that something prevent the
> start dentry from being moved before
> d_for_each_positive_child_continue() can take the parent lock -
> typically ->i_rwsem.
>
> The use of scoped_guard() in these macros makes it safe to "break" or
> "goto" out of the loop - the lock will be dropped in that case.
>
> As there are reports that large numbers of negative dentries can lead to
> soft lockups when walking the d_children/d_sib list, particularly in
> fsnotify_set_children_dentry_flags(), we call cond_resched() as needed
> during the walk.
>
> To achieve this we use an on-stack dentry (about 330 bytes) to place a
> cursor while calling cond_resched().  On-stack dentries are not standard
> practice but should be safe since
>
> Commit 3df5153c5f12 ("make cursors NORCU")
>
> made cursors NORCU, confirming that they can safely be released without
> waiting.  Also importantly nothing ever takes a reference on a cursor
> that it doesn't own.
>
> To facilitate this, a new __d_init() is split out of __d_alloc() and
> used in d_init_cursor() which can be called on an on-stack dentry as is
> done in the new d_next_sibling_sched().
>
> Link https://lwn.net/Articles/1079407/
> Signed-off-by: NeilBrown <neil@brown.name>
> ---
>  fs/dcache.c            | 119 ++++++++++++++++++++++++++++++++++-------
>  include/linux/dcache.h |  67 +++++++++++++++++++++++
>  2 files changed, 166 insertions(+), 20 deletions(-)
>
> diff --git a/fs/dcache.c b/fs/dcache.c
> index 0dc54ba31d8c..bacb218400a8 100644
> --- a/fs/dcache.c
> +++ b/fs/dcache.c
> @@ -1950,6 +1950,27 @@ void d_invalidate(struct dentry *dentry)
>  }
>  EXPORT_SYMBOL(d_invalidate);
>
> +static void __d_init(struct dentry *dentry, struct super_block *sb)
> +{
> +       dentry->d_flags =3D 0;
> +       lockref_init(&dentry->d_lockref);
> +       seqcount_spinlock_init(&dentry->d_seq, &dentry->d_lock);
> +       dentry->d_inode =3D NULL;
> +       dentry->d_parent =3D dentry;
> +       dentry->d_sb =3D sb;
> +       dentry->d_op =3D sb->__s_d_op;
> +       dentry->d_flags =3D sb->s_d_flags;
> +       dentry->d_fsdata =3D NULL;
> +       INIT_HLIST_BL_NODE(&dentry->d_hash);
> +       INIT_LIST_HEAD(&dentry->d_lru);
> +       INIT_HLIST_HEAD(&dentry->d_children);
> +       dentry->waiters =3D NULL;
> +       INIT_HLIST_NODE(&dentry->d_sib);
> +
> +       lockdep_init_map(&dentry->dep_map, "DCACHE_PAR_LOOKUP",
> +                        &sb->s_type->d_lookup_key, 0);
> +}
> +
>  /**
>   * __d_alloc - allocate a dcache entry
>   * @sb: filesystem it will belong to
> @@ -1959,7 +1980,6 @@ EXPORT_SYMBOL(d_invalidate);
>   * available. On a success the dentry is returned. The name passed in is
>   * copied and the copy passed in may be reused after this call.
>   */
> -
>  static struct dentry *__d_alloc(struct super_block *sb, const struct qst=
r *name)
>  {
>         struct dentry *dentry;
> @@ -1991,14 +2011,14 @@ static struct dentry *__d_alloc(struct super_bloc=
k *sb, const struct qstr *name)
>                 p =3D kmalloc_flex(*p, name, name->len + 1,
>                                  GFP_KERNEL_ACCOUNT | __GFP_RECLAIMABLE);
>                 if (!p) {
> -                       kmem_cache_free(dentry_cache, dentry);
> +                       kmem_cache_free(dentry_cache, dentry);
>                         return NULL;
>                 }
>                 atomic_set(&p->count, 1);
>                 dname =3D p->name;
>         } else  {
>                 dname =3D dentry->d_shortname.string;
> -       }
> +       }
>
>         dentry->__d_name.len =3D name->len;
>         dentry->__d_name.hash =3D name->hash;
> @@ -2008,23 +2028,7 @@ static struct dentry *__d_alloc(struct super_block=
 *sb, const struct qstr *name)
>         /* Make sure we always see the terminating NUL character */
>         smp_store_release(&dentry->__d_name.name, dname); /* ^^^ */
>
> -       dentry->d_flags =3D 0;
> -       lockref_init(&dentry->d_lockref);
> -       seqcount_spinlock_init(&dentry->d_seq, &dentry->d_lock);
> -       dentry->d_inode =3D NULL;
> -       dentry->d_parent =3D dentry;
> -       dentry->d_sb =3D sb;
> -       dentry->d_op =3D sb->__s_d_op;
> -       dentry->d_flags =3D sb->s_d_flags;
> -       dentry->d_fsdata =3D NULL;
> -       INIT_HLIST_BL_NODE(&dentry->d_hash);
> -       INIT_LIST_HEAD(&dentry->d_lru);
> -       INIT_HLIST_HEAD(&dentry->d_children);
> -       dentry->waiters =3D NULL;
> -       INIT_HLIST_NODE(&dentry->d_sib);
> -
> -       lockdep_init_map(&dentry->dep_map, "DCACHE_PAR_LOOKUP",
> -                        &sb->s_type->d_lookup_key, 0);
> +       __d_init(dentry, sb);
>
>         if (dentry->d_op && dentry->d_op->d_init) {
>                 err =3D dentry->d_op->d_init(dentry);
> @@ -2041,6 +2045,81 @@ static struct dentry *__d_alloc(struct super_block=
 *sb, const struct qstr *name)
>         return dentry;
>  }
>
> +/**
> + * d_init_cursor - initialise an on-stack dentry cursor
> + * @dentry: the dentry to be initialised
> + * @parent: dentry of parent where cursor will be used.
> + *
> + * A DCACHE_DENTRY_CURSOR is initalised for use in marking
> + * a place in the d_children/d_sib list.  While sb-related
> + * fields are filled in, they should never be used.
> + * The filesystems d_init is not called and a final d_put()
> + * should not be called, else d_release would be called.
> + */
> +static void d_init_cursor(struct dentry *dentry, struct dentry *parent)
> +{
> +       const struct qstr *name =3D &slash_name;
> +       char *dname;
> +
> +       /*
> +        * We guarantee that the inline name is always NUL-terminated.
> +        * This way the memcpy() done by the name switching in rename
> +        * will still always have a NUL at the end, even if we might
> +        * be overwriting an internal NUL character
> +        */
> +       dentry->d_shortname.string[DNAME_INLINE_LEN-1] =3D 0;
> +       name =3D &slash_name;
> +       dname =3D dentry->d_shortname.string;
> +
> +       dentry->__d_name.len =3D name->len;
> +       dentry->__d_name.hash =3D name->hash;
> +       memcpy(dname, name->name, name->len);
> +       dname[name->len] =3D 0;
> +
> +       /* Make sure we always see the terminating NUL character */
> +       smp_store_release(&dentry->__d_name.name, dname); /* ^^^ */
> +
> +       __d_init(dentry, parent->d_sb);
> +       dentry->d_parent =3D parent;
> +       dentry->d_flags |=3D DCACHE_DENTRY_CURSOR | DCACHE_NORCU;
> +}
> +
> +/**
> + * d_next_sibling_sched - return next sibling, but schedule() first
> + * @child:  current child
> + *
> + * This behaves like d_next_sibling(), but drops the parent d_lock
> + * and calls cond_resched() to avoid any soft-lockup.  A cursor
> + * is inserted as place holder.
> + *
> + * Caller must hold the parents d_lock, and must hold a counted
> + * reference on the parent.
> + *
> + * Returns: the next sibling, or %NULL if there is none.
> + */
> +struct dentry *d_next_sibling_sched(struct dentry *child)
> +__must_hold(&child->d_parent->d_lock)
> +{
> +       struct dentry cursor;
> +
> +       /* always skip cursors to ensure we make some real progress */
> +       while (child && (child->d_flags & DCACHE_DENTRY_CURSOR))
> +               child =3D d_next_sibling(child);
> +       if (!child)
> +               return child;

Why is this skip loop here and not after the resched?

As this is written, if the caller passed @child which is another cursor,
now child the next real dentry after another cursor and hlist_add_behind()
below will insert our cursor after the real dentry.

Thanks,
Amir.

> +
> +       d_init_cursor(&cursor, child->d_parent);
> +       hlist_add_behind(&cursor.d_sib, &child->d_sib);
> +       spin_unlock(&cursor.d_parent->d_lock);
> +       cond_resched();
> +       spin_lock(&cursor.d_parent->d_lock);
> +       child =3D d_next_sibling(&cursor);
> +       d_detach_cursor(&cursor);
> +       WARN_ON(d_count(&cursor) !=3D 1);
> +       return child;
> +}
> +EXPORT_SYMBOL(d_next_sibling_sched);
> +
>  /**
>   * d_alloc - allocate a dcache entry
>   * @parent: parent of entry to allocate
> diff --git a/include/linux/dcache.h b/include/linux/dcache.h
> index fff8393ec06b..7150ecd81d72 100644
> --- a/include/linux/dcache.h
> +++ b/include/linux/dcache.h
> @@ -692,6 +692,73 @@ static inline struct dentry *d_next_sibling(const st=
ruct dentry *dentry)
>         return hlist_entry_safe(dentry->d_sib.next, struct dentry, d_sib)=
;
>  }
>
> +struct dentry *d_next_sibling_sched(struct dentry *child);
> +
> +static inline struct dentry *d_next_positive(struct dentry *child)
> +{
> +       do {
> +               if (need_resched())
> +                       child =3D d_next_sibling_sched(child);
> +               else
> +                       child =3D d_next_sibling(child);
> +       } while (child && !d_is_positive(child));
> +       return child;
> +}
> +
> +static inline struct dentry *d_first_positive(const struct dentry *paren=
t,
> +                                             struct dentry *child)
> +{
> +       if (!child)
> +               child =3D d_first_child(parent);
> +       else
> +               child =3D d_next_sibling(child);
> +       if (child && !d_is_positive(child))
> +               child =3D d_next_positive(child);
> +       return child;
> +}
> +
> +/**
> + * d_for_each_positive_child - iterate over positive children in the dca=
che
> + * @child: iterator dentry
> + * @parent: dentry of parent
> + *
> + * Iteratively set @child to each positive child of @parent.
> + * @parent->d_lock should NOT be held.
> + * @child may no longer be positive when the caller examines it
> + * so care is still needed which could involve locking the child
> + * or using d_inode_rcu() to access the inode.
> + *
> + * DCACHE_DENTRY_CURSOR dentries will never be returned, only true child=
ren
> + * which have at some point in the past been positive.
> + */
> +#define d_for_each_positive_child(child, parent)                       \
> +       if (({might_sleep();0;})) ; else                                \
> +               scoped_guard(spinlock, &parent->d_lock)                 \
> +                       for (child =3D d_first_positive(parent, NULL);   =
 \
> +                            child;                                     \
> +                            child =3D d_next_positive(child))
> +
> +/**
> + * d_for_each_positive_child_continue - iterate over remaining positive =
children
> + * @child: iterator dentry and starting point.
> + * @parent: dentry of parent
> + *
> + * If @child is %NULL this behaves identically to d_for_each_positive_ch=
ild().
> + * Otherwise @child must be an existing child of %parent and subsequent =
children
> + * in the d_children list of @parent are returned.
> + *
> + * Safely using this requires that something prevents @child from being
> + * renamed to a different directory before we get the lock.  Holding
> + * i_rwsem on the @parent is sufficient.
> + *
> + */
> +#define d_for_each_positive_child_continue(child, parent)              \
> +       if (({might_sleep();0;})) ; else                                \
> +               scoped_guard(spinlock, &parent->d_lock)                 \
> +                       for (child =3D d_first_positive(parent, child);  =
 \
> +                            child;                                     \
> +                            child =3D d_next_positive(child))
> +
>  void set_default_d_op(struct super_block *, const struct dentry_operatio=
ns *);
>  struct dentry *d_make_persistent(struct dentry *, struct inode *);
>  void d_make_discardable(struct dentry *dentry);
> --
> 2.50.0.107.gf914562f5916.dirty
>
