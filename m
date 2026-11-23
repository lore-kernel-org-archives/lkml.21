Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432782;
	b=HQWHGyGiY54kchcaWdLr3gg8hI0lpWLiB1LUpqZLDsmJn76UT8DzOmb9uvwDueTqe/LY
	 Gi9p51OQ/S3SQKs7+Sf3iqF2Zld44+5MKfGIwbHtwveAXZNFV1oYhOU340eM6WgCMS/Ow
	 +ng7mw6j+idNXr3pS2DuYbSelR7NVEQiTgftUMKq7vQDHEvs3Xd9YT8bnZzawPCaURynH
	 b3m4PRdzv2RN+Lat/64VbTA/ggIpHIZI4RS3dyjcUDZcUI1+IonjgTZrLGrX4Pqo5FtwN
	 ZDFvXhIXgvXfNeCcGyC2a8xO+CMBtD1ncE3bDAw2R1fHKybyL/wJ7IDHtm4tAcnwbbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432782;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AvyjWw34qS9OlEUPI1fE3LAPxIifzbhD/rIgZIaAJXQ=;
	b=bnJZF3yp28P98zEdtQ39dp9ZYTMMZdrgiKO/250yE1YvBXXJ7ucZFo7j45n3ATKmKyY7
	 Rcl85SeX/BYhnXINQQ6WXZTkay9R5TQk2nDJ6dxTNkHX3hpSy5O5xQCJEBFFUwcs7+tHu
	 X6qbREjqHLYhnn35YrD31UPqIUfdkyZkLQoX2HUU10mTI1cAok3LycWlYu6gg1RMVyP/z
	 WR3HcFLnATyK4ol6vjjnibNTZ8i4hduLVnZoUWFwf/mSzPr20NJ38cmdssTVqhSZ9TmGU
	 2KvEUxbcpHlrcWb34Fo/+DIy6pMlETiUyKkeoBOpHVxL47PDRcQFOJOf6kWAqgD5tWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BW2tarOx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92552606A336
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BW2tarOx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59611F000ED
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795432781;
	bh=AvyjWw34qS9OlEUPI1fE3LAPxIifzbhD/rIgZIaAJXQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BW2tarOx9KxJlUQkUgcuJH+nCFvRwkPt3UI1KIOb093fDe8Pi+yxo5NVtISGFJUNQ
	 YmMfiYL8j1Hf3tu76vKpvc9DCQCae4Sn9AuqBa89VUYe1ikcTbByK9cv0BxidNnXJQ
	 LzuWX3zup5OfZSg6UiJxxlC+RPmUwXbXijcPOhYRd2AaxYkgYaiCgm9ZUDMkxQCMs+
	 aNB4DoKi05BWPJQk6vEjVcZjKIEE4vng/6+4Dlz7iT8xQB21eiTyuXQ+eAEFqLNQDZ
	 KAcT7mTvb1FVQFrjf/cXxdwNaHrl0Lhq90u1enWtXXYJ/cBmF/m4PkLi9W0XDsJaUf
	 6BGNASAD21FDg==
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7d2d18f1bf5so1809084137.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:19:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFcXUZH6TNMiKAqBcXk7mUokJCf+rtNKAmhQ2R6HnNJNqNB4cvy9LIR8O187n5lxcBxH8Mz1m56cDTdoUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vz9Baq7lsEebWDk8P4GAYW/YEFQhDvEIrZqgKQSETyVMDmOiD
	4hG5tU1dRtZGiyGk9ATkbkKKnbEJXtpU7/tikbkcCKtCDttm1HgaMJBJwcWd9JhlNhnNSmLWT6G
	NSRXaKMGMbxDwdLGI50CATc8ySWXlakE=
X-Received: by 2002:a67:e115:0:b0:7cc:115:ddf4 with SMTP id
 ada2fe7eead31-7d73961ffdfmr4029572137.25.1795432780942; Mon, 23 Nov 2026
 03:19:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-b4-btrfs-data-integrity-v3-0-4de4b91b826e@toxicpanda.com>
 <20261120-b4-btrfs-data-integrity-v3-3-4de4b91b826e@toxicpanda.com>
In-Reply-To: <20261120-b4-btrfs-data-integrity-v3-3-4de4b91b826e@toxicpanda.com>
From: Filipe Manana <fdmanana@kernel.org>
Date: Mon, 23 Nov 2026 11:19:04 +0000
X-Gmail-Original-Message-ID: <CAL3q7H4Af3N8A9rmam4ZPY51hXcUb8qXVB599E_OkNToJpeDFw@mail.gmail.com>
X-Gm-Features: Aa3M54qT09cckYJ_pmlcy_CAempV0zvf4WEts6KOhN7Q1BIMugwof-rOFb14Pvc
Message-ID: <CAL3q7H4Af3N8A9rmam4ZPY51hXcUb8qXVB599E_OkNToJpeDFw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] btrfs: make fsync wait for all incomplete COW writes
To: Josef Bacik <josef@toxicpanda.com>
Cc: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
	Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <johannes.thumshirn@wdc.com>, 
	Qu Wenruo <wqu@suse.com>, Boris Burkov <boris@bur.io>, Filipe Manana <fdmanana@suse.com>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 8:52=E2=80=AFPM Josef Bacik <josef@toxicpanda.com> =
wrote:
>
> If a COW write fails, or its ordered extent is truncated, the extent
> maps of the part that was not written still point to the newly
> allocated extent until the ordered extent completes. If a fast fsync
> logs those extent maps first, replaying the log after a crash replaces
> the file's old data with an extent that was never written.
>
> BTRFS_INODE_COW_WRITE_ERROR is meant to make a fast fsync wait for the
> ordered extents to complete in that case, but only
> btrfs_finish_ordered_extent() sets it. A write that fails before a bio
> is submitted, in writepage_delalloc() or submit_write_sector(), finishes
> its ordered extent through btrfs_mark_ordered_io_finished(), which does
> not set the flag. And since commit 66ff4d366e7e ("btrfs: fix false IO
> failure after falling back to buffered write"), a direct IO write that
> stops short truncates the rest of its ordered extent and finishes it as
> uptodate, so the flag is not set either.
>
> Fix this by setting the flag, renamed to
> BTRFS_INODE_INCOMPLETE_COW_WRITE, in can_finish_ordered_extent() when a
> write fails, and in btrfs_mark_ordered_extent_truncated(). Convert the
> open-coded truncation in extent_writepage_io() to that helper, so that
> every truncation sets the flag. Both places hold the inode's
> ordered_tree_lock and run before BTRFS_ORDERED_IO_DONE is set.
>
> The flag stays set until a fast fsync clears it, and that fsync then
> waits for all ordered extents to complete, even if the failed or
> truncated one completed long before. A direct IO write that stops short
> because its buffer was not faulted in costs the next fast fsync one
> such wait.
>
> Fixes: f13e01b89daf ("btrfs: ensure fast fsync waits for ordered extents =
after a write failure")
> Fixes: 66ff4d366e7e ("btrfs: fix false IO failure after falling back to b=
uffered write")
> CC: stable@vger.kernel.org # 6.10+
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

Reviewed-by: Filipe Manana <fdmanana@suse.com>

Looks good, thanks.

> ---
>  fs/btrfs/btrfs_inode.h  | 24 ++++++++++++++++--------
>  fs/btrfs/extent_io.c    |  7 ++-----
>  fs/btrfs/file.c         | 17 ++++++++---------
>  fs/btrfs/ordered-data.c | 46 ++++++++++++++-----------------------------=
---
>  4 files changed, 40 insertions(+), 54 deletions(-)
>
> diff --git a/fs/btrfs/btrfs_inode.h b/fs/btrfs/btrfs_inode.h
> index fbcf8ca05fb7..cd75c1a17e45 100644
> --- a/fs/btrfs/btrfs_inode.h
> +++ b/fs/btrfs/btrfs_inode.h
> @@ -90,15 +90,23 @@ enum {
>         /* Set when there are no capabilities in XATTs for the inode. */
>         BTRFS_INODE_NO_CAP_XATTR,
>         /*
> -        * Set if an error happened when doing a COW write before submitt=
ing a
> -        * bio or during writeback. Used for both buffered writes and dir=
ect IO
> -        * writes. This is to signal a fast fsync that it has to wait for
> -        * ordered extents to complete and therefore not log extent maps =
that
> -        * point to unwritten extents (when an ordered extent completes a=
nd it
> -        * has the BTRFS_ORDERED_IOERR flag set, it drops extent maps in =
its
> -        * range).
> +        * Set when a COW write failed, before submitting a bio or during
> +        * writeback, or when a COW ordered extent was truncated. Used fo=
r both
> +        * buffered writes and direct IO writes.
> +        *
> +        * The extent maps of what was not written point to blocks that w=
on't be
> +        * written until the ordered extent completes and
> +        * btrfs_finish_one_ordered() drops them. Completion runs in a wo=
rk
> +        * queue, queued once the IO of the write is finished, and a fast=
 fsync
> +        * does not wait for it, to reduce latency. If a fast fsync logge=
d
> +        * those extent maps, replaying the log would put unwritten exten=
ts in
> +        * place of the file's data, so this tells it to wait for the ord=
ered
> +        * extents to complete.
> +        *
> +        * It is set under the inode's ordered_tree_lock, before
> +        * BTRFS_ORDERED_IO_DONE is set.
>          */
> -       BTRFS_INODE_COW_WRITE_ERROR,
> +       BTRFS_INODE_INCOMPLETE_COW_WRITE,
>         /*
>          * Set by reflink while it holds the source's VFS inode lock shar=
ed.
>          * Direct IO writes also take that lock shared; one that finds th=
is bit
> diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
> index 036d8c0f04ae..58951a89bfc6 100644
> --- a/fs/btrfs/extent_io.c
> +++ b/fs/btrfs/extent_io.c
> @@ -1963,11 +1963,8 @@ static noinline_for_stack int extent_writepage_io(=
struct btrfs_inode *inode,
>                          * there must be an ordered extent.
>                          */
>                         ASSERT(ordered !=3D NULL);
> -                       spin_lock(&inode->ordered_tree_lock);
> -                       set_bit(BTRFS_ORDERED_TRUNCATED, &ordered->flags)=
;
> -                       ordered->truncated_len =3D min(ordered->truncated=
_len,
> -                                                    cur - ordered->file_=
offset);
> -                       spin_unlock(&inode->ordered_tree_lock);
> +                       btrfs_mark_ordered_extent_truncated(ordered,
> +                                                           cur - ordered=
->file_offset);
>                         btrfs_put_ordered_extent(ordered);
>
>                         btrfs_mark_ordered_io_finished(inode, cur, fs_inf=
o->sectorsize, true);
> diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
> index 6f525ce42a2d..4208587abff1 100644
> --- a/fs/btrfs/file.c
> +++ b/fs/btrfs/file.c
> @@ -1638,7 +1638,7 @@ int btrfs_sync_file(struct file *file, loff_t start=
, loff_t end, int datasync)
>          */
>         if (full_sync || btrfs_is_zoned(fs_info)) {
>                 ret =3D btrfs_wait_ordered_range(inode, start, len);
> -               clear_bit(BTRFS_INODE_COW_WRITE_ERROR, &inode->runtime_fl=
ags);
> +               clear_bit(BTRFS_INODE_INCOMPLETE_COW_WRITE, &inode->runti=
me_flags);
>         } else {
>                 /*
>                  * Get our ordered extents as soon as possible to avoid d=
oing
> @@ -1651,15 +1651,14 @@ int btrfs_sync_file(struct file *file, loff_t sta=
rt, loff_t end, int datasync)
>                         goto out_release_extents;
>
>                 /*
> -                * Check and clear the BTRFS_INODE_COW_WRITE_ERROR now af=
ter
> -                * starting and waiting for writeback, because for buffer=
ed IO
> -                * it may have been set during the end IO callback
> -                * (end_bbio_data_write() -> btrfs_finish_ordered_extent(=
)) in
> -                * case an error happened and we need to wait for ordered
> -                * extents to complete so that any extent maps that point=
 to
> -                * unwritten locations are dropped and we don't log them.
> +                * Check and clear BTRFS_INODE_INCOMPLETE_COW_WRITE now a=
fter
> +                * starting and waiting for writeback, because it may hav=
e been
> +                * set while we waited, and if a write failed or was trun=
cated
> +                * we need to wait for ordered extents to complete so tha=
t any
> +                * extent maps that point to unwritten locations are drop=
ped and
> +                * we don't log them.
>                  */
> -               if (test_and_clear_bit(BTRFS_INODE_COW_WRITE_ERROR, &inod=
e->runtime_flags))
> +               if (test_and_clear_bit(BTRFS_INODE_INCOMPLETE_COW_WRITE, =
&inode->runtime_flags))
>                         ret =3D btrfs_wait_ordered_range(inode, start, le=
n);
>         }
>
> diff --git a/fs/btrfs/ordered-data.c b/fs/btrfs/ordered-data.c
> index df74c75d6c29..1a4e3e34ec11 100644
> --- a/fs/btrfs/ordered-data.c
> +++ b/fs/btrfs/ordered-data.c
> @@ -367,6 +367,9 @@ void btrfs_mark_ordered_extent_truncated(struct btrfs=
_ordered_extent *ordered,
>         spin_lock(&inode->ordered_tree_lock);
>         set_bit(BTRFS_ORDERED_TRUNCATED, &ordered->flags);
>         ordered->truncated_len =3D min(ordered->truncated_len, truncate_l=
en);
> +       /* As for a failed write, see can_finish_ordered_extent(). */
> +       if (!test_bit(BTRFS_ORDERED_NOCOW, &ordered->flags))
> +               set_bit(BTRFS_INODE_INCOMPLETE_COW_WRITE, &inode->runtime=
_flags);
>         spin_unlock(&inode->ordered_tree_lock);
>  }
>
> @@ -398,8 +401,18 @@ static bool can_finish_ordered_extent(struct btrfs_o=
rdered_extent *ordered,
>                 ordered->bytes_left -=3D len;
>         }
>
> -       if (!uptodate)
> +       if (!uptodate) {
>                 btrfs_mark_ordered_extent_error(ordered);
> +               /*
> +                * The extent maps of a failed COW write point to blocks =
that
> +                * won't be written until the ordered extent completes an=
d
> +                * drops them. Make a fast fsync wait for that, before
> +                * BTRFS_ORDERED_IO_DONE is set.
> +                */
> +               if (!test_bit(BTRFS_ORDERED_NOCOW, &ordered->flags))
> +                       set_bit(BTRFS_INODE_INCOMPLETE_COW_WRITE,
> +                               &inode->runtime_flags);
> +       }
>
>         if (ordered->bytes_left)
>                 return false;
> @@ -436,37 +449,6 @@ void btrfs_finish_ordered_extent(struct btrfs_ordere=
d_extent *ordered,
>                                         uptodate);
>         spin_unlock(&inode->ordered_tree_lock);
>
> -       /*
> -        * If this is a COW write it means we created new extent maps for=
 the
> -        * range and they point to unwritten locations if we got an error=
 either
> -        * before submitting a bio or during IO.
> -        *
> -        * We have marked the ordered extent with BTRFS_ORDERED_IOERR, an=
d we
> -        * are queuing its completion below. During completion, at
> -        * btrfs_finish_one_ordered(), we will drop the extent maps for t=
he
> -        * unwritten extents.
> -        *
> -        * However because completion runs in a work queue we can end up =
having
> -        * a fast fsync running before that. In the case of direct IO, on=
ce we
> -        * unlock the inode the fsync might start, and we queue the compl=
etion
> -        * before unlocking the inode. In the case of buffered IO when wr=
iteback
> -        * finishes (end_bbio_data_write()) we queue the completion, so i=
f the
> -        * writeback was triggered by a fast fsync, the fsync might start
> -        * logging before ordered extent completion runs in the work queu=
e.
> -        *
> -        * The fast fsync will log file extent items based on the extent =
maps it
> -        * finds, so if by the time it collects extent maps the ordered e=
xtent
> -        * completion didn't happen yet, it will log file extent items th=
at
> -        * point to unwritten extents, resulting in a corruption if a cra=
sh
> -        * happens and the log tree is replayed. Note that a fast fsync d=
oes not
> -        * wait for completion of ordered extents in order to reduce late=
ncy.
> -        *
> -        * Set a flag in the inode so that the next fast fsync will wait =
for
> -        * ordered extents to complete before starting to log.
> -        */
> -       if (!uptodate && !test_bit(BTRFS_ORDERED_NOCOW, &ordered->flags))
> -               set_bit(BTRFS_INODE_COW_WRITE_ERROR, &inode->runtime_flag=
s);
> -
>         if (ret)
>                 btrfs_queue_ordered_fn(ordered);
>  }
>
> --
> 2.55.0
>
>
