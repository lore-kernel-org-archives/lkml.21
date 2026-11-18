Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795024254;
	b=kHpozOo4k026nnPuSuuPDG5lTfqQOBphYFDuH3tkiAfr5PnjEPvuxlyNH3HBv0t+9JEi
	 ukA7JfdQFnz/egYW+Meh/oaVbYqaCBdZvASGTwYfj9AaDgMWj3t4s7nZaLcBvec3zipC4
	 WckP2aqegKWfl4ztL6iSciLg0iOZOApH4lEtiCz/O60i4YZJ0SYiHUu9pmvUHVNMDboB6
	 ZQDoofq4w13NP8TRzKEJUeZdo/lGTV1lhlAbxkI5M73WZzeZ/CT/vkE2WsbzYg9Ch8v7u
	 lakA62C34/yYGwtiVdoJPxa70snhBUQdEcqCr33TSrexun7n/569brCqxQ33j8JJTgg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795024254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BliQBsLi8Tf+bGa80m+pxZeHcLThIeJfSszhbNvQWjc=;
	b=tinn8a9Fh8/pEQvnMZEfLV/oguBGXItlpR817YV4v7C/ZIuGzg/m8x9OIZX6goI6GXk5
	 V//jd4z7dWF8G1obh5nZJBmvOFadtOTkO3P4EVisXar6VRjzLgpl8AZjfTfskv5UU+vI7
	 PapDzeCl09RJiw77DdnJiYrqePraR+m+yntHIx3ErlZH0NCnEUs3VqTtM5AgdDM7alLTr
	 cpoJJsBwKIBSnSFOdlh1/RBhRLb4O/ebwDv2goZRg8qbyARXHpXGPEJYHvj8sn4Tffc++
	 pKESQTXSNalZzr8iNkNi262WGPgzVlL0Xn6+a4tZmKQNHp1GNSKvBaZus4NGwf+6dcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0urFzns;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C98E60A260F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C98E60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t0urFzns
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so1993415a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:50:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795024252; cv=none;
        d=google.com; s=arc-20260327;
        b=HODU7GOjEN1jcP+ekQHIAs3UEwDxm8PNpku7I7YriOf/b55jvd9TGuvRNQmqv1tFQA
         2J3gXref5RmKS3jM/D1yNIr1u2S4poQg+BYPoEOMESDlwoVKdvBXQL4sFQswgKWnBQG7
         FMjbk4cF5pDI1wgezhw8MlVRP9V6UBoebiV86qate1ZKBP1j/1Iv/4JHQTWlYBGk0+me
         gUnnF+YC7M+4VSKesas5HsRnliuEUdlhlp240uvrbjOt/CqKm5ciPDFvlAulKGghwQ9+
         B3a/kUOtXY44QsOiuHD8yOugJo5Uyh34dY9gHmmeeANa87V8bflzwKWVEplMw9ptC9Mb
         HyTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BliQBsLi8Tf+bGa80m+pxZeHcLThIeJfSszhbNvQWjc=;
        fh=71lTUR0hrF1YpUjAzJ0QRuThYM17iqJpaF7fdoHSTHo=;
        b=in9y9bSg8YNpzRN1xa/nBos+ywNnlGgwPSkN/axu068nW1P0023Nxb5QvkjBvqRSTD
         Tjw7uHlHDJWj0JfLQTXrSp5C0B0jNH9yb8sAAVN0ewFnvYAtVObwplzuGKIdqDeDQ1Fq
         QJwpQP+OkWMOBLqWHwrJN0gvLdVeDfwQttrGoA+nTzhj6dceQ3D5LkDQMHpsIPOSKv+s
         g3ZyP/B6/TNHfawCMpXjVLXD7Ah4NKfD5SSZKUONcL2GZnftZDBKoU1k6ce4oJytZkOA
         PapXtAjXggLVxK9PPzy8l1nozQEce0zPMOle1Xs/uSrp9dNPo9vNkXSJdtlg+gXYLff4
         3RIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795024252; x=1795629052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BliQBsLi8Tf+bGa80m+pxZeHcLThIeJfSszhbNvQWjc=;
        b=t0urFznsvrKRqixemRUZFc9mgXym3XN1YMBmj0waBLyV3CsdgnHy8xmpMpLBOjvFSO
         4OyVbjrHe3QbmjmaFHziwXJZHZ3OpkdyrRZKOYWCdCJexvqSmUuVu4fnaP7X0VKW/H2Q
         uU2+obaBKEAHGKd8XWt2iDtAO+W46sMhQn7B0F4IN3mylmD+1QrZ9esi0QvoH9kZT9bX
         EBKM7Z1u6o+AxA5zR70zZUIovWhwqLZJa6oEexWqxHL96XtNRn01UmHNOonMpcB3gc6f
         RbyVXVt9WSJBogGVLF5lTsidaWxQ5lTI8ZoKmu6C/MRJ9rExNu7Xb6AIdnGzmI6derxu
         Duww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024252; x=1795629052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BliQBsLi8Tf+bGa80m+pxZeHcLThIeJfSszhbNvQWjc=;
        b=gxXkjeprpPdefpoOpBil6Mpoy3WcTtkNi0+IeOr2sDsL5A8hgy/WKcRkZZNGgEBnV6
         nT6KfIM7T2Utz+Sd3e/Hn9KV63oP1JhAZYfHoc7/DFQMs+wVzT1UwZNGaGgZppPR7yvn
         LkPLbOK3lSSOFq9xhBw85F0JXGy9HDnhyMxUfS8PQxgvQnmreJPdRYv/pRpp9seNx68j
         Twk8gjAe2Jd7dhKjkJuNQ/cbB3V2wcgPuDYy4fhbL47G+Ni82/09xyCjJiIR4n6uJ1s3
         8P+taEGneAOFj0xOv0VhvfjJqNT9acV0DXOJsO/cXl1mPB7dhK3E+jvjxjnBG/3gE5om
         Ee+Q==
X-Forwarded-Encrypted: i=1; AL+hErGEKZmxoQXqcxMG6FiPGBYW0tIpdr/pZW/cfDdjTFen4kXvKQDbusVX19vnb8zP8QsMyzncp43Z/CqD9qg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+veZMCvxsGjWHv8uqErYTow0euEgh+UiVKBfEy71DASVFQrP7H
	ZmB7RqXhBcYKMhrWfFaHYjnLaaPmJykjZaop0wO0QFuZHUfm7b/3eK1ny23hT2fGeFFS9v/7jr8
	oAusWNAkSDOkdymiJ4t5vDDxXHRosT/nVv1OvCNw1Cg==
X-Gm-Gg: AYBFou1U8Bn+Kyt5SdO8yrFfzvtEVycp2ok+8FQQA4wIpz901Dj4p95s7RDqitIQbwK
	pG72/Pxi9CX/oQ+dlkedlKg2muXjam7RladW3DvMQ3Ns3rSj1bZ2hYgsU/FOPFiqhWTKcjCSd/1
	ixT3yiMtjRLUpQ3fEqnSmsJC8p8sgWTf3lFfTnqD7c5c4LSd9tL8R7hiJr8xCqI6xLBC5jhzXcG
	n1AYUe5RlRuC99bwN4bxta7esdNqnmNBYybvBp7wSdsi7FHoe8Ga8BFJ2SAkKayBkrRas1OIYkE
	sI+z+3naqDXTSvVM5hIsCTU4Tt3+XzPvezhaI7zxq+SWmc0I7I+VLR2mCmeRoTUVrgG/ETpU/Af
	2/aev0a5RAbVKchhYljllvM4g5YYoz8hG66LOE/i5Ak5RsoYGEblEeodQ5xQ3cV8QRIeL84xJ0A
	JDZ0pj1oCW2jnmeq0=
X-Received: by 2002:a05:6402:5411:b0:6b7:df0c:18d0 with SMTP id
 4fb4d7f45d1cf-6b8a2e6d881mr1966295a12.11.1795024252167; Wed, 18 Nov 2026
 09:50:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261118142613.be3r3s6kobkkxnz4@pali>
 <DMYFBDIV4Y08.35ZKR5G86U1H7@gmail.com> <20261118151605.lqtn5fz423kuswk5@pali>
 <DMYHPLWKPSH3.MUM1IIZZIWNR@gmail.com> <CAOQ4uxiwpdC-fKkqS5kiZ515q9MenC0jX4USV1idN7h2njx45Q@mail.gmail.com>
 <7126bdd0ff59e9ea9bc58702af2ecb38096330e8.camel@kernel.org>
In-Reply-To: <7126bdd0ff59e9ea9bc58702af2ecb38096330e8.camel@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Nov 2026 18:50:40 +0100
X-Gm-Features: AclHuK8-cETfcc5mQcfuFgReFzNL3uUqtJJFv8XHOum7KdV27M9jJ90gtN64MvU
Message-ID: <CAOQ4uxidYWNVmoPgxKrxesXTxpMB-JqUZx9p6xXZWD5m+hJ+JA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 00/10] add provenance time (ptime)
To: Jeff Layton <jlayton@kernel.org>
Cc: koraynilay <koray.fra@gmail.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	David Sterba <dsterba@suse.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	exfat@lists.linux.dev, ntfs3@lists.linux.dev, linux-cifs@vger.kernel.org, 
	linux-nfs@vger.kernel.org, linux-api@vger.kernel.org, 
	Theodore Tso <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 6:36=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> On Wed, 2026-11-18 at 18:28 +0100, Amir Goldstein wrote:
...
> > Guys,
> >
> > Let's take a step back.
> >
> > If this discussion is proving anything is that the btime/ptime
> > duality is a big headache and it's going to be a source of confusion to=
 users
> > even if we come up with some smart pants consistent semantics.
> >
> > As Jeff writes, I think we should consider making btime mutable
> > be a per-fs choice and not an API limitation.
> >
> > A filesystem can even decide to store both the forensics btime
> > alongside the user settable crtime.
> >
> > There are some precedents in xfs with settable UUID which is
> > a different field then the origin UUID from mkfs.
> >
> > Fs that have immutable btime have a few choices:
> > 1. Keep it immutable
> > 2. Start making it muttbale (like the Win fs)
> > 3. Start making the user visible btime (STATX_BTIME) mutable
> >     but keep the forensics btime on-disk for, well, forensics
> >
> > If btime becomes settable via options 2 or 3, this could require
> > admin opt-in (e.g. tune2fs -O crtime).
> >
> > With option 3 the crtime feature would be ROCOMPAT
> > With option 2, it could probably be COMPAT. Maybe.
> >
> > If we accept this story and the major fs maintainers are
> > in agreement with this plan, then I think the missing piece
> > is making the "settable mask" visible to users via the new API.
> >
> > IOW, we need to somehow export FS_XFLAG_RDONLY_MASK
> > to userspace instead of only exporting the supported mask.
> > And then with the addition of xflags_mask, we could also
> > -EINVAL on users trying to set readonly flags/values.
> >
> > Perhaps a single xflags_settable_mask is enough.
> >
> > For file_setattr(), xflags_mask is anyway a set-those mask.
> > For file_getattr(), does it matter if we get an answer
> > Filesystem does not support casefold on this file
> > OR
> > Filesystem does not have casefold on this file and
> > you cannot set casefold on this file
> >
> > It's kind of the same, isn't it?
> >
> > What do you say?
> >
> > Shall we drop PTIME in favor of "is BTIME settable?" API?
> > Leaving STATX_BTIME exactly as is.
> >
> >
>
> +1
>
> I think this is the better approach.
>
> Looking over some of the earlier discussions around this since 2010
> (!?!): I think some of the XFS devs objected to making it settable for
> forensic reasons. So, on XFS you might need to rev the on-disk format
> if you want to do it there to preserve the "historical" btime, and
> maybe some xfs userland work to make it accessible for forensics.

XFS_IOC_FSBULKSTAT will likely continue to publish the original bs_btime.
if a mutable field is added it could be published as bs_crtime.

For forensics this should be enough.

>
> For the record, the statx manpage documents the btime field very
> sparsely:
>
>        stx_btime
>               The file's creation timestamp.
>
> There is no documented guarantee that this will be immutable, AFAICT.

Yes, and it really isn't immutable for cifs already.
It's just that we don't have a standard API to change it.

Thanks,
Amir.
