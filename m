Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795019816;
	b=do3Qlj2Ll95smlYWhK3vqUJqpLhBOp8cQnyTjsouEIaoZfpjfPc95jVcDkFcdFHXRT33
	 Ti9jXMUWGPHfrdZkr3dEMdOZvUIFhUMujy6YfEnYTheYONBpHSC2xZdvLU5gE5Ub/4YER
	 Ta3EuKNIXUtDBuiXY7lrFpASWXMtbtWROwmMS5ATiUNSX0IrcUpAtO9oLJ+4hMNivroiF
	 aXrJVM2RLk6UInfm1eorEbsx9TK9Nrc2QscUXn5bA58zre1OD/TrKBVzsPn48xRHD7zRg
	 lVJjHbTFBqMAXf5BfHogMP1Y+YYa0Xryh+0gXr9C8TfLP4PYWxFrD9OrFQMh8ef80wQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ThJWWn15R7JIY3hayjLwOhu3LzqQd50Rds3OyAm+UpI=;
	b=WjioADXgTvWzcBOeg0O9MIRVgvs/pfx46S1JvBg0q30YIxA1Uky6nnTsmuF4ZJmz/NRW
	 jQTetFrXoUxgQMAo4Op/gphVJmV87wVGPps7C0UfQQVPdVfHZnH2JRQCmd4iy0Ihi60x+
	 Ua5detmEH6HtmXzlpiXCu3SAEcX64E5GUgzkCXQAWZV2liq2Xfoac9mR13vroDalpllZW
	 wNA4ogupuv3FI1YzvEJWCzPupFNiGff3qNNJ/66I3ypviuL7+TJqC/ocecZ/Phsu1ckxp
	 f/8zvyfyxz7mFbXBEsEb/g2cOMT9K+OUpOVFTfiy6G0FwQWB7QPxidOvRH1dOBeyKCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q928FUfp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF0F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DF0F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q928FUfp
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso1093024a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:36:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795019814; cv=none;
        d=google.com; s=arc-20260327;
        b=RYGQ5JYE8BiZd1peSSNno/VBphx/DX1jtRMuz9EjDneIebfC0VsyBgbHotT/ty7Gm1
         A2xmlDFZHzALRXKt1TMTdfFel667MKfDC4LRioBgAJBJbGzHBgnQF+PJ5VpF+QiK58uw
         ixwNKeygwp8d6sj/2BxaZHbAV9n6iTkyXTCC3wVAu1LoX+mrOxWD1FgcqryfJWWW8HhN
         /sGif4ctQegITR86qulcZuPsXQkMF6+ap3oAaJbolFM+n37bObwlBH/ShBZ1EM/0mlpX
         IG8/R34Mn6vPy5uF2VaCzUHrp4S6UhfyZAZqXeUN0MSliGKs7ob9A2TpzhKbOanqhaxf
         NtJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ThJWWn15R7JIY3hayjLwOhu3LzqQd50Rds3OyAm+UpI=;
        fh=w8C2bc1abOkLJ3QS5zl3pJN7NODAE/utgsXGUxI1NbY=;
        b=aJ/2PL6LxQiCF5+sDdD8jQDn17MO1ir1aUoJu5KwKbwJg+wK/ZZK/2Voqfw80qRqLX
         NCl6oe2HPc3O0l+xwG+jrjoHjVZLNe1pnm6Ocey8QSIyQDOEl1Rc6XqZbJ3i4SiL0qy8
         dZ8sllgs6ec5ZnZZ+uFJHZs3ZUyUjMoqjL7ONu/V+gH7O4PB4FfIKun8ziTrQFHm7blc
         gIOf4e+hpjIcLkOEcSvBh3qJeMHuIoeiEF2W9AqqX0VdL23G+BzsKqkRf5viNWYk8Y/K
         fbyljwxJKbeFHCLc0O0tcvpern9vDELzG0daYHhOPLZhxQDKWVMNFyS4NijdTZBvlnzd
         kkKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795019814; x=1795624614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ThJWWn15R7JIY3hayjLwOhu3LzqQd50Rds3OyAm+UpI=;
        b=Q928FUfp2LnQkjGEnKMIMu+nIXWPV8Mw0HjVjFDQa7MZUVLuYPLFwnsc7iiHqC360u
         Kp8IRabh9aATlCbBIrXYC8LB4ujsA2WowQnPl0onFZOSJ5rVYhQ50HD2q0pTUJXyKimM
         OUL77cTMfVDMrYjz/NQW0TKyEQpYRFMt7Ju+HVxVGfRQjrSAY87Mpzq+C/2x9bC6NTow
         OtYFWyMzdvLEcoERGP5aXpJZMZOJljjkWPd07rML7zS6cDn/RnBxJCXaYM/7fpaXHvui
         3d3div9gMzI9ed77/rJrBt7B9+fw7rgFDQ4NESvylFpmE6QFtWC5GnB6Lj4Ro4sGb6Nt
         AJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795019814; x=1795624614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ThJWWn15R7JIY3hayjLwOhu3LzqQd50Rds3OyAm+UpI=;
        b=taPOjUE5noeN4UijEhN8LuUnzr19H2WH8y8YgqFwosaiBEEH2JsnW+P8DUvNGggZX7
         D1n48DEn70TopOG+z/iG/CRmwPjexiOhzDfiAnX3kdltQfQCLmdo4L2Hs+x4WRnLfD5E
         jkYE0dcClE5bZ13X4omUx2xxQGUrMAZcphvY2YI15J4FlxEaX3TF3GB0/83ssKKaXQ07
         ABNTnfHBmYvv0NrwwdZzZgoUQkBPoERu7kKayI0j9ay6uduWaXHpFSHcLq1dyxzSTAYM
         GiCpDmzSae2cDZkz2QEUEIYQrOhp3tmO6sYG8jvwIZsGN9NNFCN/BK3Tp0ML0jhRZjOt
         sKKw==
X-Forwarded-Encrypted: i=1; AL+hErHbEKmqsAqHK3kxpzKW2Ie7eejmkZXms7fFY02wWwvzJql1UN+vSAvoUh/gfe4M6cMdzwhzDiUUFqAxpag=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HG3ShkOk3Paq4g0emoP3A+hOIFQ1vv7zeaWHy3A2N+BNKQVUS
	ABLH6PW6n3CTBIiIpzffYrrwgzt6b3H23aHnhl66wj/Mi9j94CWoLXgpdZTZ4KerPjCmOImVj4M
	SyjYU8dj+jt4B5eLa2C83Fn15HNxyw3E=
X-Gm-Gg: AYBFou0gj2JezdE5K41RdL2E6S9UxMI8a3+4oNwxV+8/c+p5fuvgjwhSDNYIiYlnBE/
	FxXiWUFoYXb++o8yh/YBK4YMbEYpCVpHa93HmHMsEyV7irxBG6aCk+Jrz3w4vekgZ//gCCw6O90
	dZk7B+RQEaZQZrLusFmEGUSGaRJIEG4BiZBdDI1cVK4mgLVSRw4yU2xYUTd8Msqtx1Pn9I0mK6R
	gUWAXBhidEVqlwPCVBPFZIcWM2bjdIpt49Kwq8KGmNjASrQ/u9Iymrjn8CijBdcqAV6tdn6wYlM
	56LyWbZws+aCnxZ4Z0bVZAzM7aDPoLNBVDbPQSCXEZSFzBSdpky6l+HICP7rtq9cqLzDQ7s5jGt
	q5+AmieKCSexVQpXxo8qoyY2XSeeLNIs4UI0FtDx6zbHyagSIdVTC2K06J/qLI7MHgZZqcQ==
X-Received: by 2002:a05:6402:c711:20b0:6b7:b12e:1638 with SMTP id
 4fb4d7f45d1cf-6b887effc26mr1999145a12.37.1795019814317; Wed, 18 Nov 2026
 08:36:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-8-koray.fra@gmail.com>
 <f297d9ea-ebd7-47f4-ab7b-de5c45980000@app.fastmail.com> <CAOQ4uxhpMARO_ZMJDeoa044BwufLVnS0o4Fv0abBF=tjaZmtWQ@mail.gmail.com>
 <cd49ce48-58d7-4341-b4fc-34e63daf3c52@app.fastmail.com>
In-Reply-To: <cd49ce48-58d7-4341-b4fc-34e63daf3c52@app.fastmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Nov 2026 17:36:41 +0100
X-Gm-Features: AclHuK_Wot5qcfi8_9CAebWCtd31KyKZ5gW_T2w6JAANm_7TsCfaaSyfxQBsTLM
Message-ID: <CAOQ4uxjme9sJ5LGNDnP6rEKZLTJzX_ZdcMohgu2iLULK96GPOA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 07/10] nfsd: add provenance time (ptime) via FATTR4_TIME_CREATE
To: Chuck Lever <cel@kernel.org>
Cc: koraynilay <koray.fra@gmail.com>, David Sterba <dsterba@suse.com>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 5:09=E2=80=AFPM Chuck Lever <cel@kernel.org> wrote:
>
>
>
> On Wed, Nov 18, 2026, at 2:44 AM, Amir Goldstein wrote:
> > On Tue, Nov 17, 2026 at 11:02=E2=80=AFPM Chuck Lever <cel@kernel.org> w=
rote:
> >>
> >>
> >>
> >> On Sun, Nov 15, 2026, at 1:03 PM, koraynilay wrote:
> >> > Implement provenance time (ptime) in NFSD, as introduced in a
> >> > previous commit ("vfs: add provenance time (ptime)").
> >> >
> >> > Map ptime to FATTR4_TIME_CREATE, allowing clients to set it across
> >> > CREATE, OPEN and SETATTR compounds.
> >> >
> >> > If the underlying filesystem supports it, use __vfs_fileattr_set_loc=
ked()
> >> > to set it, returning -EOPNOTSUPP in case it's not supported (i.e. wh=
en
> >> > __vfs_fileattr_set_locked() returns -ENOIOCTLCMD).
> >> >
> >> > When querying FATTR4_TIME_CREATE, request both STATX_PTIME and
> >> > STATX_BTIME, preferring ptime over btime if available, and advertise
> >> > FATTR4_TIME_CREATE support if either ptime or btime is available.
> >> >
> >> > Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
> >> > Signed-off-by: koraynilay <koray.fra@gmail.com>
> >>
> >> > @@ -3646,7 +3649,14 @@ static __be32
> >> > nfsd4_encode_fattr4_time_access(struct xdr_stream *xdr,
> >> >  static __be32 nfsd4_encode_fattr4_time_create(struct xdr_stream *xd=
r,
> >> >                                             const struct nfsd4_fattr=
_args *args)
> >> >  {
> >> > -     return nfsd4_encode_nfstime4(xdr, &args->stat.btime);
> >> > +     const struct timespec64 *ts;
> >> > +
> >> > +     if (args->stat.result_mask & STATX_PTIME)
> >> > +             ts =3D &args->stat.ptime;
> >> > +     else
> >> > +             ts =3D &args->stat.btime;
> >> > +
> >> > +     return nfsd4_encode_nfstime4(xdr, ts);
> >> >  }
> >>
> >> I have trouble with this approach.
> >>
> >> We've already established that, for the Linux in-kernel NFS server
> >> implementation, FATTR4_TIME_CREATE reports a file's birth time and
> >> does not permit NFS clients to modify that.
> >>
> >> After this patch is applied, the server reports the ptime instead
> >> of the btime on some filesystems but not others.
> >
> > In other words, for some server filesystems FATTR4_TIME_CREATE is
> > settable and for others it is not.
> >
> > Isn't the NFSv4 protocol equipt to deal with this complexity?
>
> Not a question of whether NFSv4 _can_ do it. It's whether it _should_
> and whether opaquely choosing a settable vs. an immutable timestamp
> on the server is the right design.
>
>
> >> Essentially this changes the semantics of existing files that have
> >> a btime set -- technically that's a regression.
> >
> > I fail to see in what situation this is a regression. Please explain.
>
> Any consumer that depends on btime being read-only is now screwed.
>

Who is the consumer in this context?
An NFS client?

Can't an NFS client be connected to another NFS server
implementation which does allow this?

I can't wrap my head around the problem.

Thanks,
Amir.
