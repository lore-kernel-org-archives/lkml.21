Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091558;
	b=aXEjW0d1nj+F6p8rWO9a3conNQd0Qyp9+6nnOkTxKzD5oTV5IypwBqK3NwlHXO8BsvfB
	 h0xw4i61CMPeUCdzzsifWBrkYwh9omg1iPxhl7r6v8tUXueP8YIp56m6wsbJwxhpGsU/p
	 PGxNJSUUMm/30QaOAbSg73UZ7St9C33Gkf359VgjYx28fDAh71ALHgS08NP3gQdYUkxFN
	 Kn7lvB/w93hQpT4i1iYEaipOjI+aiUi6VtIDdZ0ea/bZO5DS/vYWPdUYlZ4kbEXlFMt5X
	 85xY6nZJpw/VdcVY9Toyb2BTJYg8rTfYpAdt1BksrxIuwNnskQdHd8vMB7xZmlSOu8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=U1PlVqI3LdpyYByoBRpGi49i9nzjyIWS4Rn9s1piSHI=;
	b=CwJZMTGHLsMlvUDj1RxoI8ZP8GqWz4Y5x9OC6bg9TmaDSJwHzR2lW3NxmrGKFGf+O4MV
	 EVzc6rPxw+/xKXmK7bVGRm2jimzVWmu2XkYmLbcCiogqnGywL3oyBEgZXzR37GkZ+T2JU
	 s3c08V/nun8Nr3uyxeZl4R3TZf3iqO48NKGPyHqHgR86sB0THzCp87kqtV7yj33eRf2L2
	 DGqsS7JZWmj+3BIJzXCP0IbtWX7QgCm6n5YMcBY1RVXKOqOwpuQarWXn0h3aKcelQ8Qf1
	 JTC/r7+hYOFUGho8XSZi6Ru7FtzTbNRKTeoY6ReFZMYj3we3lwT47OIftWJ1vx15RSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PXVclfx3;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2BE606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B2BE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PXVclfx3
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492690dd5daso1847040f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1795091556; x=1795696356; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U1PlVqI3LdpyYByoBRpGi49i9nzjyIWS4Rn9s1piSHI=;
        b=PXVclfx3lhD4A3jkg0ygj6OYL841hm2nPX360NiKq8ytDfZXXbBlSxMxhORqqRheet
         F1xMaOg2vgv/IKaJmdJCUZgRR78dqpHP/O3ZaJDYZzSXpTKljzLx5XzcO5C1o2eqH5X6
         WdUFVXQBtCLI3IlG2ZVH90mZNWowQN+qML63K0iYPP11ObF1rgms8X1kpOiquvMFt337
         B4CJWL9mkY0sL1Py8NFGPPQKSsXoVLBWB9e0agYLnte9Fiam0hmPCRj2E7DftyAuVVC/
         buiHHIBfqZtFoKkzHGThhm4cQV5v6Rcn6XTPcES9h6UN1/OkoXHOCw4CLVuARWDHBbLi
         OR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091556; x=1795696356;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1PlVqI3LdpyYByoBRpGi49i9nzjyIWS4Rn9s1piSHI=;
        b=enJyTX9mv+lN8+o5H1PR4ppocI1pfi/Tb6la+XAG9DvKkhZ8sa7TIUayjvXnAesJrJ
         4Cmo3oxxXL6gWBv4vlNS5rLkRNQ04gKCxFyHQeEFap05JrZMpSyotcqKcOyR24iJM3Py
         gKX5ADWv89bFLaUy8rRvw2PYWWOhfbAXm3YvhyKSRpULZzWx/SpfbKz1V6fn1ecjnqgG
         5zTUbZLlYdXNDQZeGwLRDajz8angmpimGUXwP0cvpX5Bec1yqymeGIEQIFYR9FleMVZ2
         9AKoV3iVMnsfJBq2Oh+b3lhUxlE9Cb2f+Q5Ili12fw0/pLy1SKO4kl/3w3lg0l5toVqX
         yIOA==
X-Forwarded-Encrypted: i=1; AL+hErGN4sMJhfGqbSiCJte7FGJobMaAypXJLnIPHvNY1kgWhVq3L5kYwwREQWtQawbEFtgW8OR7w7iik2ni2R0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xe5PwCywihAH6Sty/XWU7C/Y9vV4B/Qjgm50tKbIc7SyBBGs4
	ZOvWz1FRdVrntAABBoufiFhYUfaDP5HBHMZg1/n/2I5hDDwb8S5Cs7h0nHVVXnIrKEnp
X-Gm-Gg: AZFdTZdRylnFOoUHx2JgpDTBi8fgaLbIl0R7H+dEPt4S0dvBgoJXXnY0NrhdGDCDQoj
	ufEAW1JA5R1OtMXcF6eCOFGOx2ERflE0vDccU0W42xAjwrIXtv9ecQ2lmajRFFVny2N3WARqrVR
	3nATOA8hinOADRrWhH/+yJo4FCZuFTNNEJP2rzYQmj2mdVXKIDUEtF0VELR8CBB/7iLuWXPIIAB
	IQ5P0vVv0i7jcgCjYVci3hPNFJu+iCjaYqk2h4Jqbbp8JKr1iMngYLJJilf7k8yBssjlQasxEqa
	I6RjDh+dIcGS54X8HNBhpRh8HeSvk0j8/Ohq7UH33L3TcS12dizPpVtA2ymGGf5mvxRcAgTN0e6
	oAfGFyod9U+SYy28oJoB4DatZ+bROxSSOh8zlyzVYpRnOHUH1ZnyGzHysjQnX/0Wer0woBOw58b
	sei9JnXZOHZsUH82URb6DyQgEo6ECBsA0CTm5jyKYGBw/z8ZzSfar+kaqJEZWeR/KJQF32IO/fK
	vMzT2d8Zq8BqEetoc8RxrlontqtPUzwpq3vAih/AGIj5pgN/AsOjwQzVTW3KZCKOUeLdNDClsJ0
	Kg6xWD11AwZzHeOoOLGywHJJos8kD5LsXGHwXzoQJ43tIRmdY5APqg9+LGgkuQ7d8aLbigfd5we
	nFG7MKHfhrBQfp0fvKoL/LbnJ443hFavazoRZUA1L1p+S5HCB1ye4Q1iqKNrNeIiUKJlP7rhyOb
	c=
X-Received: by 2002:a05:6000:41c9:b0:48f:bf3c:1631 with SMTP id ffacd0b85a97d-4a638eb6cf5mr11136176f8f.21.1795091555666;
        Thu, 19 Nov 2026 04:32:35 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:677:1cd6:7e14:6fa6? (p200300cf572c280006771cd67e146fa6.dip0.t-ipconnect.de. [2003:cf:572c:2800:677:1cd6:7e14:6fa6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560ab64sm9565958f8f.25.2026.11.19.04.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:32:35 -0800 (PST)
Message-ID: <41d7b45dd286090f5f0057f51f182f28b3ecd46f.camel@amutable.com>
Subject: Re: [PATCH v4] kernfs: allocate inodes and dentry outside
 kernfs_rwsem
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Shakeel Butt <shakeel.butt@linux.dev>, Christian Brauner
	 <brauner@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo
 <tj@kernel.org>,  Jori Koolstra <jkoolstra@xs4all.nl>, Meta kernel team
 <kernel-team@meta.com>, linux-fsdevel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Thu, 19 Nov 2026 13:32:34 +0100
In-Reply-To: <20261111215058.1837351-1-shakeel.butt@linux.dev>
References: <20261111215058.1837351-1-shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-11-11 at 13:50 -0800, Shakeel Butt wrote:
> In the Meta fleet, on 6.16 with the kernfs changes from 7.4
> backported,
> we still see long cgroupfs stalls:
>=20
> - oomd and below waited 72 seconds in kernfs_fop_readdir() while an
> out
> =C2=A0 of memory container created cgroups.=C2=A0 They resumed when the k=
ernel
> OOM
> =C2=A0 killer killed the container's workload.
>=20
> - oomd waited 15 minutes in kernfs_iop_lookup().=C2=A0 PID 1 waited for
> =C2=A0 kernfs_rwsem in cgroup_rmdir() while holding cgroup_mutex.
>=20
> - A lock profiler sampling part of the fleet saw kernfs_iop_lookup()
> =C2=A0 hold kernfs_rwsem across memcg reclaim on 26 hosts in 29 days, for
> up
> =C2=A0 to 625 ms.
>=20
> The profiler shows where these stalls come from.=C2=A0 kernfs_iop_lookup(=
)
> and the export ops allocate a new inode while holding kernfs_rwsem
> for
> read.=C2=A0 The inode is charged to the caller's memcg.=C2=A0 If that mem=
cg is
> at
> memory.max, the allocation can stay in reclaim for a long time,
> sometimes until an OOM kill.=C2=A0 A writer then queues on the lock and
> every
> new reader queues behind it.=C2=A0 On cgroup2 this blocks every cgroupfs
> user
> on the machine.
>=20
> Such lookups are common in a memcg that is out of memory.=C2=A0 Its
> reclaim
> drops its kernfs dentries fast, and the files of a new cgroup have no
> inodes yet.
>=20
> Allocate the inode before taking kernfs_rwsem, as kernfs_iop_mkdir()
> already does, and attach it under the lock with
> kernfs_get_inode_locked().=C2=A0 That helper adds a new inode only for an
> active node, so __kernfs_remove() still finds every inode it must
> clear
> i_nlink on, as commit dc1a0cc95737 ("kernfs: don't lose
> IN_DELETE_SELF
> when decoding a file handle") needs.
>=20
> The inode goes unused when the name does not exist, the node is
> inactive, or it already has an inode.=C2=A0 In a VM, a lookup of a missin=
g
> name takes about 1 us longer, 4.5 us instead of 3.5 us on cgroupfs.
> Cold lookups of existing sysfs and cgroupfs files take 2 to 3%
> longer.
>=20
> kernfs_get_parent_dentry() also held the lock across
> d_obtain_alias(),
> which allocates a dentry.=C2=A0 Hold it only around the inode lookup, as
> __kernfs_fh_to_dentry() already does.=C2=A0 This also gives ->get_parent
> the
> active test that the IN_DELETE_SELF fix left out: a parent that is
> being
> removed now gets -ESTALE.=C2=A0 Before, it got an inode anyway, possibly =
a
> new one whose i_nlink __kernfs_remove() never cleared.
>=20
> kernfs_fill_super() preallocates the root inode the same way, so no
> inode is allocated under kernfs_rwsem any more.
>=20
> Tested on a 316-CPU machine.=C2=A0 A task in a full 256 MB memcg with slo=
w
> swap looks up the files of new cgroups.=C2=A0 Worst waits in 60 seconds:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 before=C2=A0=C2=A0=C2=
=A0 after
> =C2=A0 oomd, for kernfs_rwsem=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 236 ms=C2=A0=C2=A0 0.1 ms
> =C2=A0 below, for kernfs_rwsem=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 356 ms=C2=A0=C2=A0 0.8 ms
> =C2=A0 systemd, for kernfs_rwsem=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 160 =
ms=C2=A0=C2=A0=C2=A0 37 us
> =C2=A0 readdir of another directory=C2=A0=C2=A0=C2=A0 530 ms=C2=A0=C2=A0 =
3.9 ms
>=20
> The lookup itself is still slow.=C2=A0 The VFS still holds its directory'=
s
> lock, so other work in that one directory still waits.
>=20
> Suggested-by: Tejun Heo <tj@kernel.org>
> Acked-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

Hi Shakeel,

please feel free to add

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

Kind regards,
Alex

> ---
>=20
> Christian, this depends on Jori's series in vfs-7.5.directory.=C2=A0 Coul=
d
> you
> take it on top of it?=C2=A0 Greg, you asked to wait for -rc1 and for
> testing
> in -next.=C2=A0 Are you OK with this going through the vfs tree?
>=20
> Changes since v3:
> - Rebased on vfs-7.5.directory.=C2=A0 Use the kernfs_get_inode_locked()
> that
> =C2=A0 Jori added there for kernfs_iop_mkdir().
> - ->get_parent: a parent that is being removed now gets -ESTALE even
> if
> =C2=A0 it already has an inode, because the helper tests the node first.
> - New cost numbers. v3 costs the same as v4 in it.
> - Kept Tejun's ack, as the approach he suggested is unchanged.
>=20
> v3:
> https://lore.kernel.org/20261016220029.3276154-1-shakeel.butt@linux.dev
>=20
> Changes since v2:
> - Allocate the inode before taking kernfs_rwsem and free it if
> unused,
> =C2=A0 instead of dropping and retaking the lock.=C2=A0 kernfs_iget() bec=
omes
> =C2=A0 kernfs_get_inode_locked() (Tejun).
> - Do the same in kernfs_fill_super() (Tejun).
> - Describe the ->get_parent active test (Tejun).
> - Retested on another machine, numbers updated.
>=20
> v2:
> https://lore.kernel.org/20261016164345.31618-1-shakeel.butt@linux.dev
>=20
> Changes since v1:
> - dentry allocation outside kernfs_rwsem (Sashiko).
> - Couple of comments updated.
>=20
> v1:
> https://lore.kernel.org/20261015221110.3183461-1-shakeel.butt@linux.dev
>=20
> =C2=A0fs/kernfs/dir.c=C2=A0=C2=A0 | 12 ++++++++++--
> =C2=A0fs/kernfs/inode.c |=C2=A0 3 +++
> =C2=A0fs/kernfs/mount.c | 49 +++++++++++++++++++++++++++++---------------=
-
> --
> =C2=A03 files changed, 43 insertions(+), 21 deletions(-)
>=20
> diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
> index e72783843edb..fb1dcf35d900 100644
> --- a/fs/kernfs/dir.c
> +++ b/fs/kernfs/dir.c
> @@ -1251,9 +1251,12 @@ static struct dentry *kernfs_iop_lookup(struct
> inode *dir,
> =C2=A0	struct kernfs_node *parent =3D dir->i_private;
> =C2=A0	struct kernfs_node *kn;
> =C2=A0	struct kernfs_root *root;
> -	struct inode *inode =3D NULL;
> +	struct inode *inode =3D NULL, *new;
> =C2=A0	const struct ns_common *ns =3D NULL;
> =C2=A0
> +	/* allocate outside kernfs_rwsem, see
> kernfs_get_inode_locked() */
> +	new =3D new_inode(dir->i_sb);
> +
> =C2=A0	root =3D kernfs_root(parent);
> =C2=A0	down_read(&root->kernfs_rwsem);
> =C2=A0	if (kernfs_ns_enabled(parent))
> @@ -1267,9 +1270,13 @@ static struct dentry *kernfs_iop_lookup(struct
> inode *dir,
> =C2=A0		 */
> =C2=A0		if (!kernfs_active(kn)) {
> =C2=A0			up_read(&root->kernfs_rwsem);
> +			iput(new);
> =C2=A0			return NULL;
> =C2=A0		}
> -		inode =3D kernfs_get_inode(dir->i_sb, kn);
> +		if (new) {
> +			inode =3D kernfs_get_inode_locked(new, kn);
> +			new =3D NULL;
> +		}
> =C2=A0		if (!inode)
> =C2=A0			inode =3D ERR_PTR(-ENOMEM);
> =C2=A0	}
> @@ -1282,6 +1289,7 @@ static struct dentry *kernfs_iop_lookup(struct
> inode *dir,
> =C2=A0	if (!IS_ERR(inode))
> =C2=A0		kernfs_set_rev(parent, dentry);
> =C2=A0	up_read(&root->kernfs_rwsem);
> +	iput(new);
> =C2=A0
> =C2=A0	/* instantiate and hash (possibly negative) dentry */
> =C2=A0	return d_splice_alias(inode, dentry);
> diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
> index 9cc1a56740b9..53b1a2796e0b 100644
> --- a/fs/kernfs/inode.c
> +++ b/fs/kernfs/inode.c
> @@ -269,6 +269,9 @@ static int kernfs_inode_test(struct inode *inode,
> void *data)
> =C2=A0 * while the inode is inserted and __kernfs_remove() always finds i=
t
> to
> =C2=A0 * clear its i_nlink.=C2=A0 @inode is consumed.
> =C2=A0 *
> + * The caller allocates @inode before taking kernfs_rwsem, because
> the
> + * allocation can block in reclaim and hold up other users of the
> lock.
> + *
> =C2=A0 * Returns the inode now attached to @kn, which is @inode unless on=
e
> was
> =C2=A0 * already hashed for it (e.g. by a file handle decode), or NULL if
> @kn
> =C2=A0 * is no longer active.
> diff --git a/fs/kernfs/mount.c b/fs/kernfs/mount.c
> index a0be784bfb06..05e8ec1ee7fa 100644
> --- a/fs/kernfs/mount.c
> +++ b/fs/kernfs/mount.c
> @@ -99,8 +99,8 @@ static struct dentry *__kernfs_fh_to_dentry(struct
> super_block *sb,
> =C2=A0					=C2=A0=C2=A0=C2=A0 int fh_type, bool
> get_parent)
> =C2=A0{
> =C2=A0	struct kernfs_super_info *info =3D kernfs_info(sb);
> +	struct inode *inode =3D ERR_PTR(-ESTALE), *new;
> =C2=A0	struct kernfs_node *kn;
> -	struct inode *inode;
> =C2=A0	u64 id;
> =C2=A0
> =C2=A0	if (fh_len < 2)
> @@ -124,32 +124,32 @@ static struct dentry
> *__kernfs_fh_to_dentry(struct super_block *sb,
> =C2=A0		return NULL;
> =C2=A0	}
> =C2=A0
> +	new =3D new_inode(sb);
> +	if (!new)
> +		return ERR_PTR(-ENOMEM);
> +
> =C2=A0	/*
> -	 * Hold kernfs_rwsem across the lookup as well as
> kernfs_get_inode().
> -	 * __kernfs_remove() deactivates the subtree and clears
> i_nlink on its
> -	 * inodes under the write lock, so under the read lock
> either
> -	 * kernfs_find_and_get_node_by_id() refuses the node, or the
> inode is
> -	 * in the inode hash before the ilookup() pass goes looking
> for it.
> +	 * Hold kernfs_rwsem from the lookup through
> kernfs_get_inode_locked().
> +	 * Then __kernfs_remove() either finds the inode to clear
> i_nlink, or
> +	 * the node is already inactive and no inode is created.
> =C2=A0	 */
> =C2=A0	scoped_guard(rwsem_read, &info->root->kernfs_rwsem) {
> =C2=A0		kn =3D kernfs_find_and_get_node_by_id(info->root, id);
> -		if (!kn)
> -			return ERR_PTR(-ESTALE);
> -
> -		if (get_parent) {
> +		if (kn && get_parent) {
> =C2=A0			struct kernfs_node *parent;
> =C2=A0
> =C2=A0			parent =3D kernfs_get_parent(kn);
> =C2=A0			kernfs_put(kn);
> =C2=A0			kn =3D parent;
> -			if (!kn)
> -				return ERR_PTR(-ESTALE);
> =C2=A0		}
> -
> -		inode =3D kernfs_get_inode(sb, kn);
> -		kernfs_put(kn);
> +		if (kn) {
> +			inode =3D kernfs_get_inode_locked(new, kn);
> +			new =3D NULL;
> +			kernfs_put(kn);
> +		}
> =C2=A0	}
> =C2=A0
> +	iput(new);
> =C2=A0	return d_obtain_alias(inode);
> =C2=A0}
> =C2=A0
> @@ -171,9 +171,17 @@ static struct dentry
> *kernfs_get_parent_dentry(struct dentry *child)
> =C2=A0{
> =C2=A0	struct kernfs_node *kn =3D kernfs_dentry_node(child);
> =C2=A0	struct kernfs_root *root =3D kernfs_root(kn);
> +	struct inode *inode, *new;
> =C2=A0
> -	guard(rwsem_read)(&root->kernfs_rwsem);
> -	return d_obtain_alias(kernfs_get_inode(child->d_sb,
> kernfs_parent(kn)));
> +	new =3D new_inode(child->d_sb);
> +	if (!new)
> +		return ERR_PTR(-ENOMEM);
> +
> +	scoped_guard(rwsem_read, &root->kernfs_rwsem) {
> +		inode =3D kernfs_get_inode_locked(new,
> kernfs_parent(kn));
> +	}
> +
> +	return d_obtain_alias(inode);
> =C2=A0}
> =C2=A0
> =C2=A0static const struct export_operations kernfs_export_ops =3D {
> @@ -294,7 +302,7 @@ static int kernfs_fill_super(struct super_block
> *sb, struct kernfs_fs_context *k
> =C2=A0{
> =C2=A0	struct kernfs_super_info *info =3D kernfs_info(sb);
> =C2=A0	struct kernfs_root *kf_root =3D kfc->root;
> -	struct inode *inode;
> +	struct inode *inode, *new;
> =C2=A0	struct dentry *root;
> =C2=A0
> =C2=A0	info->sb =3D sb;
> @@ -314,8 +322,11 @@ static int kernfs_fill_super(struct super_block
> *sb, struct kernfs_fs_context *k
> =C2=A0	sb->s_shrink->seeks =3D 0;
> =C2=A0
> =C2=A0	/* get root inode, initialize and unlock it */
> +	new =3D new_inode(sb);
> +	if (!new)
> +		return -ENOMEM;
> =C2=A0	down_read(&kf_root->kernfs_rwsem);
> -	inode =3D kernfs_get_inode(sb, info->root->kn);
> +	inode =3D kernfs_get_inode_locked(new, info->root->kn);
> =C2=A0	up_read(&kf_root->kernfs_rwsem);
> =C2=A0	if (!inode) {
> =C2=A0		pr_debug("kernfs: could not get root inode\n");
>=20
> base-commit: ecdfc51a6a78aaf1c4ac1d8b6ea199cc2ed020ac
