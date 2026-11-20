Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795186534;
	b=4WTCBqfwjjT9+3oxbSE/A2EyqKrdkKwZe6OkB3fRsHx7zWcjhU+t2xukpuOP1+wia5ta
	 UnvWWz+D+zqM2DCFq/pdYY6YkvOD6j5R6hcQkAasitFi6E8XkZ4Fj7xP4I/ym+8yCBjke
	 hKdyeYIDey17DwAsb18yevjKmV0qz1qIOxIzzVy3PmVpVJ5utyKqFpIvVNDBZfaW3BehB
	 moiKU+Au+jQjU+8TG2qinhRBEH7YPqB1KYqp0+iRmDRtjP27RWZVBThF50p1gzBihkj/B
	 ZegJJdtfzMYrk4qztsXoEQ6MA3aifLhfTajW6jn3YJ7BvWp/FB/FPZqMAV/COdJnr1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zpoWzG1+g8sYeNmdw7RPLfc/0HSn9Ajkmbs7oAG/5Qs=;
	b=Ig3PikvWdhGr1CCK1ZPbFMJ0gcGDT/8XeopVMQuIQ3jYqdFtBWPqF5Pu+V/emGq9VCyG
	 yt43SYplH1lyjtcBVFGUyfjK7PU9ZAXl88IEsVGBz+sU2tmozI+p0w2GvXGz1K7YaAFCj
	 ifyzK70pvoEVocVZaRcjuwgSCiKJWSOi4pcvGyvtVpNS0/Tu/oCKSGL+b3fZ0NOARDaGo
	 p+SxIVdSVgd4zVSPEzt2No2gxEGIXs0hMZMLgQ84kMBaZHMNablgnmG8paj3I45KdqTul
	 UAx4y4YXdly/c3r02JOP0Ccqa/3LNHEw1Ugje9Ejq+5Md8WMcHbHPe9MjOi13YWFSSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XT71/E4r";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9EC606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E9EC606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XT71/E4r
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so1228276a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:55:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795186532; cv=none;
        d=google.com; s=arc-20260327;
        b=MUow6tHBdAHg8O2D8YmqCGzFYDvYKYb1OAKzz1Bud4OClXr2uVkobCY8faUPxqcDi0
         e1If+bKKSQna+yBY2Fk9OWgyVq9BvmltvEvJwEeZ9SdBFynj4hCOEVYEfuPg2Xr774zJ
         /iaS7Hr2rMUqQpjvk7f/xSfKKjSSTpnnQAmqVdeOTwBx8Hd4qZRCuYkm03IaKmvz4IQm
         DQwu64S8HnHg+CT3x/vC1oLh94vWAJjvMaLB/I0LXP3IC5EVVb5T+A5KAg11xZAWcnU/
         4XdRDEB1+mS+X2B09WoW8lrIwVVIfop/bNZT9yWLf6HV9DbA3hQXrVeTGuZ+eiOD0Nto
         Tibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zpoWzG1+g8sYeNmdw7RPLfc/0HSn9Ajkmbs7oAG/5Qs=;
        fh=hcq5saG4+wO+p+Fb5TiDFQuiKC62q+ZgDHjyyesTJLg=;
        b=ZwhcxoTYXptCzpgfOkerGA32I1HkNyiqGOLlVjO+EevLO3yJjQPvgVzP/BFxNLtRUw
         vjZ1/UGcebWbaGJ7dISzSujDHc2LWYX3amppTAEDCzmG7Icv4Z20Q9lR6iPs4N+t8NtJ
         vDH6KW2Q9N33QcJlOdZiHTsOucIth6nsCFX0GnawJEej8fzdqm2dRVo9wtsoqgk8WuvC
         mSgkDCvKVlElK9CZa/cOz1fCC+gV/XkZ82LrEAqoY7OBUiP8+Pw0i8Js9T25lNhUFyED
         PiuUBmpfY2U20jx+uUxEPjFCgmCsPUe0AIzgAp9rbwstaeMdBfzXC9hH/Ekh3ZLxwwQM
         ObqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795186532; x=1795791332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zpoWzG1+g8sYeNmdw7RPLfc/0HSn9Ajkmbs7oAG/5Qs=;
        b=XT71/E4radr+V0uXgPEtpy0gTEoHCeyDzLAY8K94G59n90O+uv++nCc8LBTX/toK/0
         oCtVL35qsDqsHFCvztHPd6HhjbqSJ8Vwc8ZJfStI7YYUhYzRNmLNpBIQMkc69ILk7c36
         ZDgsLeuC7kJXyHt7GV7DGWfHYIq4655Im+cirBeI+iUHoUj7bKjfKZyUnrONaVl4D44J
         ww0U5x8tM0ESZ2EwqzQw4R3/0gUwPfGJym0p5b3otFIF//GO/UwhtCfcmLJW/40OkP+W
         CdiJIaGOl4B0ABFgWYbTFah8knh1vRGWghRZ7vMT9mim8VxC0/RTV9tBJ5cW6vANuiQ4
         lwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186532; x=1795791332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zpoWzG1+g8sYeNmdw7RPLfc/0HSn9Ajkmbs7oAG/5Qs=;
        b=W7LCKVzpkTM8YyY0YC4XoRzdk7UM3cHD853bWHCCEnAKVd//vJI4rs5jPi2460x/IU
         81HKNJ4yB6XcxxEtqlT8zOy6ag0DA7440Z+idJ9580hF1cm/jnF4jUvpqc4FioG2CANH
         y9HEB6Xd8yBCBLpikSbx2d+F6Slh4gki9IxkApQ8XYGmcuyFyW7dUtV2HjeBGooo4JW4
         A6lsDQz/3xQDZDMWD9k99p4JDvg2MNXxQsfJdh6KTJaFgocu2lGUR9tIqZ4Gkfkfe017
         Cvh5w1fUcHG3aU3fOHhq8yBsH/ZU0706jpCepRt0SUGQ4lSJesHUteWj6jNhUCVHY18g
         08vw==
X-Forwarded-Encrypted: i=1; AL+hErEKrX09hP3vjSS4nQ+3CSzS/PUUjCdmFP1NKReaXije2wRYFMQyui34fqrFL5xrISKy59/O7f4OVOHtpJg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+r/dfejpaq+8HCDPBexIT8JckQ6yC8uVVqpkpqMPEOvqWNJ0lU
	doZyDkqRcCtM5IePRNjSXUV+XdiLB/o20V6gZZc9HcsYrWB6ub57oCr2URy4RpKWkmEfcMT6hLz
	letilM+V28QehPUA9s0JjenE76+NQzjs=
X-Gm-Gg: AZFdTZcbI7ouAJKC4KtD55+bJj2/t6LEikUkDo6VPXHrOQlA8fsxFxSh+vCpxIAyA8A
	uoA6c1II/UpSp/T4oJYOEm61Id/BbVFkAgcOQANWhjXfrEnCOqHIZqAYa8yKydH2Q++tMkkqbwk
	BfPr8O64KZeGAgYtqQz1/9T7UqFEk1KuPbtpK0QoeHuUWwj/SG4qRkAH4XN167IFhfNxG4K0LIm
	QMUVadI71pGTlo8iueLI7kXy6LlbTJNrSeifDmBTykQ7l+HFHaDumLhHWxW7UId9ydun3Pc1e2C
	UoYVN8zv7lr6C5uorcrnDIzvryvXMxhaVshlWraX6jaKVFS8QZt7xR/q2ceyb7vlG1dc0Abuk9x
	HzSRHXE0Y/AoQgnwMrfYm0v2DVvQTcmJlbcbZm7Vq2COda6ezBWtvFT/357krXYlFolpLxw==
X-Received: by 2002:a05:6402:3223:b0:6b8:5f08:931b with SMTP id
 4fb4d7f45d1cf-6ba37ea44b2mr2503989a12.26.1795186531571; Fri, 20 Nov 2026
 06:55:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-9-koray.fra@gmail.com>
 <CAOQ4uxgoNsOH82FyrCxc+qSoid_CFmbmpL0qgWFw-e8E689fFA@mail.gmail.com>
 <DMZJ4PL1JVA4.2YEB7EPYJR5Q7@gmail.com> <CAOQ4uxi6h9BBP7pf4sR+gc2+4XtkEgbxXZha45iZzdB_wGFVgQ@mail.gmail.com>
 <DN02S2XNGRZD.1KNOZJ0GGDJNG@gmail.com>
In-Reply-To: <DN02S2XNGRZD.1KNOZJ0GGDJNG@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Nov 2026 15:55:19 +0100
X-Gm-Features: Aa3M54om4CtJTUNd2Te8u7pI-ZPclkwXdtuzgdSJLpiBpdV9ZiFnAJvfZll4Px8
Message-ID: <CAOQ4uxh+d-wNC0aWLEexPFz7zj=TZjLyu61kaEmwBx9_hKn2gg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 08/10] nfs: add provenance time (ptime) via FATTR4_TIME_CREATE
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-api@vger.kernel.org, Theodore Tso <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:34=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> On Fri Nov 20, 2026 at 7:45 AM CET, Amir Goldstein wrote:
> > On Thu, Nov 19, 2026 at 11:10=E2=80=AFPM koraynilay <koray.fra@gmail.co=
m> wrote:

> >> >                    fa->fsx_xflags |=3D FS_XFLAG_CASENONPRESERVING;
> >> > +                 fa->fsx_xflags_mask |=3D FS_XFLAG_CASENONPRESERVIN=
G;
> >> > +                 fa->fsx_xflags_ro_mask |=3D FS_XFLAG_CASENONPRESER=
VING;
> >> Uhm, why both in _mask and _ro_mask? If it's a RDONLY flag shouldn't
> >> it *only* be in _ro_mask? (same for CASEFOLD)
> >>
> >
> > Good question. Maybe
> > I guess if you want to follow some percent
> > FS_FL_USER_MODIFIABLE is a subset of FS_FL_USER_VISIBLE
> > but I think that exporting ro_mask and _mask is going to be easier and
> > cleaner than rw_mask but not sure.
>
> Hmm I asked that also because you said in the xfs shared extent thread:
>
> > The advantage being that it makes the interface symmetric.
> > User can alway setattr() with the buffer they got from getattr()
> > and instead of randomly ignoring flags in set, the fsx_ro_mask
> > along with fsx_mask defines the behavior exactly.
>
> But by putting the ro flags in _mask too, a user would have to clean
> them out or vfs will reject the call with -EINVAL/something else, since
> in that case the vfs would see the user say "I want to change this [ro]
> flag".
>

That's just a matter of interpretation.

You could say that if flag FS_XFLAG_CASENONPRESERVING
is in ro_mask then its value may not be modified and fs needs to
fail the set if the user given value is not a match to the current
kernel's value.

Could be used for an "atomic flag set" operation, but I think
this is taking this too far.

I am fine with xflags_ro_mask and xflags_rw_mask I guess this
is the less ambiguous option.

Thanks,
Amir.
