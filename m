Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794987856;
	b=TlE9DNJdDzd+Z0r4knO+FyUyfVnA2OpSjRDX9ycb+DT84CFf33NpF8gLNUmSfatviOBN
	 acJtNX4FubbV9iYiuJ44zQOYdHUOc+mr2NYt1fwzNI4nJBLp4SidIbJpeCde2zsEwP/wK
	 raUJd+lmPRhdJcuTXcAjI3cSKMUGEctOmRjpWmYhv7PWa/hOYzrsmKtnPbpkLI1lGHhuP
	 +TYD+KRA+SiSSK6LOsZQN+P71hI8b/vfv2Dslvd4jvVKaunQV6gJmylBTsA0nvy4Pdfch
	 YmuJdV1vqD54r0yiRUL9LSTWGW00WT9pyZVHr7LA8anRNqHg1ysdhUef5DPYgKqlHFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n4AlrOV2bTkxElEMddERWhd2tmhmmQ/VeiiLUiTK5Jw=;
	b=FWgrVdSkNasuVzaXTYsaf1FtzpdgSFmtJSnyRSQbCQd92YEsriiRV4UiTXCdMgE8oZU6
	 Ed3z7Ft8yUePpD53JDiBweZ6Z65Mr65adzLJsY/44ClCegD2TdwaczKq4cqQqTxeJ9pTE
	 aEtNPNCa1dsgPHFzQzPLkJLn+pKrJ65WT9eiv0lD61puJyr67n5ZWk6nCikXGCONT+NGg
	 wrEQmTMu+/iD10Rw3OJq2nYllFtHbW3X1dFSbpmHqBH2oZ2XZ+XR1QbnDm/dywKA78QT7
	 ncaRhEH9VPkbRDVtXnQ10rdNoVMVinKEIJDW8mtxtaNarMBAH4ikNmZH2cVOSUmWWOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a90oyekV;
	arc=fail smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B08606A334
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8B08606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a90oyekV
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c5067a2411bso80384266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794987854; cv=none;
        d=google.com; s=arc-20260327;
        b=IbA7FjMQZfhTwkfruDRFgRK83BlxhBYl2H/8/6UZOVPFOVtSdqBPHPlO4GMGr4+m9A
         sfWDvaksRH+um70SsuRXgq1QRQKzZLWJi1NvTcTm6JyOSGkPVke6Sd2de+Q0FCTpjWYX
         dydkVDcfmFi+lyHQ4PE3dGTarcKIZkssZ65vZxIQNQJYuwU8MGv9qfqdhlSVPnAhzaf7
         GxErlmSGiTvhTfxk/WW0Ns504AKk564OD6i/oNe4MeeUzSEsqp96b3B7KzmhhkRffSeb
         TF5+aQeW/uU1HBvWDFt+yo77tk1eN35UR1caukJiMjDVSaSa6ydMDMXige1UlDDggLqP
         ywjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n4AlrOV2bTkxElEMddERWhd2tmhmmQ/VeiiLUiTK5Jw=;
        fh=hKO2p9GC4NvcVs62+EEHRnacI0X0cp1t501SesG0/YM=;
        b=VGv4TgqThTt1o1+kPNFydrueHe7kbiFVw3M/KPjwxSVAUzCe38++Vt5qKgcfMmsCGY
         +sIc9p6CxhdwjvptPdfOcc61KkNPhZfVtFgA9fj/VfrrZaS3is8tzpQaw74TraxRPrXj
         ya38VpoYl9HDErSNDs7yW7ukhsAYyFOamnYyDAjGNi2yradk0uy6ZSPFSY7N4d/qK1y1
         ygSuqXbSGOpcr/ZC5U0+1ajvRZNrWeiQyga3Niz0KadIjIGDzNKqU5HHNZjEO1E5zrhM
         YJrplkjdAeMYKatwLo/dkGWuMs0WbZqp3E/NxcJ362E5QEZontrgA8o7m/y1UJINJsQ5
         XkLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794987854; x=1795592654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n4AlrOV2bTkxElEMddERWhd2tmhmmQ/VeiiLUiTK5Jw=;
        b=a90oyekVEtWSbiQRFscTKUuOugQqsd/uPA+FKR2IB/q1W1t8taa8KZshmfMtrhj1sD
         LqlTnKmsQhen50SBtfcKu6ft+wmIP8g2pM86rjRDF5dOKhx6HkBJjAXW7T1Tl+HJbYGM
         9Z/N8X+v0TSuGqaim2wrUn/cNQfHBvaUNsmrozwAN8tX044VAK/I37vtJhmtoyIAOWLA
         XYHsu5zGuiaBInhEXWSkPT9Ljesxk0waBX2hq58DlHTNOBoHWFxCJ3W007gohZobfiCi
         lUKynaBj5mnjW9OxWobgOEENOt4UOL2ebqhsSIkfnMawpK0ePLqbjCd09xHI9SQgG63a
         TzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987854; x=1795592654;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4AlrOV2bTkxElEMddERWhd2tmhmmQ/VeiiLUiTK5Jw=;
        b=jqAdQi/uB+mhQ4fJHIyl9Rpz3Xf8/B/70ZQeym26w0dvsXlGICmpA1vzbCy2MKLmYN
         v92UIDWGLHxeKryhTQsHQq8E6Lq1Z4tfwJbwMWLhyHW+u+3OdsaqFqOKZ70asP2BsoYy
         aavCQyfTduh0sKZvwrRzaUX20jBlP611OG5lnLSTlsmcgAVssjKS9XQRVCDIzNat9Jd7
         BxWXIYQkHcIwv8/EQ3YmUHgylzcoHgwdElymXQ3mKA5s7YoUExFDZZFbsOn1PKpTaKP4
         w3BzfnC4NmfOD19+F1kXOnguX045DC/FgMcU5Qt5vfODhT8pD9zWm4rQPk758nRauuwy
         K6iA==
X-Forwarded-Encrypted: i=1; AL+hErGK49ZKTwbBItPTYnzm5TY+9xvWVj5IySxji4IY+dne0W3EIQrlKxp+NhtOrBwOet5CIA+Wbho8wuGt/wg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r/Go4uMrLOABnXY5D9zHYwqp5C9yTOblpU5rMkZvejaw+akVj
	zea0rF7sqzUF2vur5GqQRAhk+kOwqojEtkl/kMdXv082KIHVo1IVHTUbTJs3LXrx/srIEeBi6EG
	F2kp7akKaNnxiLf8KLHZVdLk3m878OpQ=
X-Gm-Gg: AYBFou1sLhaUyECd+urhDtKMGsubsDrzoZl+c0a/dEko5ZeiM4EETDFw2Mv1md2sree
	sVJOCeQUOhZUqX1A0yDPCOJaOkuLjQDQmeTDfediSOmvBrEWrbZoAdRwozcZDrr4Bn1R3L/v8zs
	x7X8EtywX6qebJfm994XtfK2TSZoK92k/udUjkMY40E4Mi4SqJwT8cuHInZbN6ZMm6BvVXhjHVe
	yBJA+uIThbECTTxYbymdiajxnL+3NeULU9KuM9rOQaZcJFQI0aoGvfpfWQSYJtGPe8XJs0xnIWf
	cPw0xv9SF41+avhqJS92sDJUBedH4xgRkLqLeW2ZPD07fQl/912WJfnAKX4ZvvN6EHMgq3f+tRH
	2hr46YG7jYck0R6XEwqfbAT9tthAbbCxndp3a+F5nyO6fmSbPQI2iDoaqkCN2LXfdoiwsTg==
X-Received: by 2002:a17:906:99c5:b0:c2a:ad55:b3fa with SMTP id
 a640c23a62f3a-c510debbf56mr128472166b.7.1794987854109; Tue, 17 Nov 2026
 23:44:14 -0800 (PST)
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
 <f297d9ea-ebd7-47f4-ab7b-de5c45980000@app.fastmail.com>
In-Reply-To: <f297d9ea-ebd7-47f4-ab7b-de5c45980000@app.fastmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Nov 2026 08:44:02 +0100
X-Gm-Features: AclHuK95FDUZyIgGYH5oXAgwPF3l-5HxSmk1nBdJ9DPBoS5wbYWUIu9nYKyQ4rA
Message-ID: <CAOQ4uxhpMARO_ZMJDeoa044BwufLVnS0o4Fv0abBF=tjaZmtWQ@mail.gmail.com>
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

On Tue, Nov 17, 2026 at 11:02=E2=80=AFPM Chuck Lever <cel@kernel.org> wrote=
:
>
>
>
> On Sun, Nov 15, 2026, at 1:03 PM, koraynilay wrote:
> > Implement provenance time (ptime) in NFSD, as introduced in a
> > previous commit ("vfs: add provenance time (ptime)").
> >
> > Map ptime to FATTR4_TIME_CREATE, allowing clients to set it across
> > CREATE, OPEN and SETATTR compounds.
> >
> > If the underlying filesystem supports it, use __vfs_fileattr_set_locked=
()
> > to set it, returning -EOPNOTSUPP in case it's not supported (i.e. when
> > __vfs_fileattr_set_locked() returns -ENOIOCTLCMD).
> >
> > When querying FATTR4_TIME_CREATE, request both STATX_PTIME and
> > STATX_BTIME, preferring ptime over btime if available, and advertise
> > FATTR4_TIME_CREATE support if either ptime or btime is available.
> >
> > Assisted-by: Gemini:3.8-flash-high antigravity-cli-1.5.7
> > Signed-off-by: koraynilay <koray.fra@gmail.com>
>
> > @@ -3646,7 +3649,14 @@ static __be32
> > nfsd4_encode_fattr4_time_access(struct xdr_stream *xdr,
> >  static __be32 nfsd4_encode_fattr4_time_create(struct xdr_stream *xdr,
> >                                             const struct nfsd4_fattr_ar=
gs *args)
> >  {
> > -     return nfsd4_encode_nfstime4(xdr, &args->stat.btime);
> > +     const struct timespec64 *ts;
> > +
> > +     if (args->stat.result_mask & STATX_PTIME)
> > +             ts =3D &args->stat.ptime;
> > +     else
> > +             ts =3D &args->stat.btime;
> > +
> > +     return nfsd4_encode_nfstime4(xdr, ts);
> >  }
>
> I have trouble with this approach.
>
> We've already established that, for the Linux in-kernel NFS server
> implementation, FATTR4_TIME_CREATE reports a file's birth time and
> does not permit NFS clients to modify that.
>
> After this patch is applied, the server reports the ptime instead
> of the btime on some filesystems but not others.

In other words, for some server filesystems FATTR4_TIME_CREATE is
settable and for others it is not.

Isn't the NFSv4 protocol equipt to deal with this complexity?

>
> Essentially this changes the semantics of existing files that have
> a btime set -- technically that's a regression.

I fail to see in what situation this is a regression. Please explain.

The only oddity I can see is that a kernel downgrade could result
in an NFS client's view of FATTR4_TIME_CREATE going backward
in time to birth time, but I don't think this qualifies as a regression.

Thanks,
Amir.
