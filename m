Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795474038;
	b=fpWEPs+FTdNRee4UQsiY9lhyAXVqzKf/ohhujRhrnqsMi+9abtO58tJvEtYV6yekQ0VK
	 HB8WqDAZ6ai1RG+mOqmuwxxeUjCjsa62sKybLF7r36g2SZQ7ZmVQlFdeM+XAh4TTwu79y
	 ZPNcqsivzK2+AdSywRW4jhtEPawyoRvDeNnagxp3atlxv4mgmdsk68OWa647xYSM1VDzl
	 QVqtbpG9Gn+/2ffwkBL0ANY8HTByeNapPPS8lN9sI9FRA+JY9FsIpigyFzsvCzNn331/s
	 qArFvrmJivWs5m1TtYgVYSa1HB7zekKqfMDLI2P1OVvMHvBEYBGHINhC1lEKNH17+Cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795474038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=prDmnot/bOxVS2gCc8v9HfYcjzpcvwnB8HRgvfXYsr0=;
	b=Il9Y478Aguu2LssezBFTZoBO4tptsTANfVhi9AIQnpC+tkw85QP+vwZKM9YHi7xkOBz2
	 1ln7lUdJ3Dw8+W2SNZEOTFv0hwY5sHbSwvgvW+kCfKwClb7IwFKn2NIDkuFC3+j/URZ0G
	 8kHOHg3WXYoDzToykge7ASp2DPZzrpDC9CWcLQPGXL+9dse2JGrMTxEY0I4cf/B86L9pM
	 8TVjzm6YBzkrBDzp2Fnv0po8P+qNkoDMJvnCowwOx4cShm062ODRT0PcCOaYeTbkkomuy
	 S4bUrlP7+7cqqIE9IpvlXn5ZdOO2cRI6OnmZb1IFOrNoF6HRC0epQWRqSZDGQB/sFdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e9TlTdXc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075CE606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 075CE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e9TlTdXc
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b8627e0eb2so5036448a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:47:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795474036; cv=none;
        d=google.com; s=arc-20260327;
        b=S7I77Vs0ws9lWHw3r3wLUJRcSSpwSHzNxgCN/Hz+D1XxFt/HOVMeJoFCAisIlyY7aJ
         vhI7tlKTDCRz3lDJOeWwJlMAUtjyXfqrjbetKGgZ9v08bU/I/woJgN/Xod2tNrlTjPG/
         IWvE2KbuwUmFB2qV5ljQZq1JF8zviCciJpyu0oOfIw0fix/787/JyyusQZdHlb2raTjG
         gelyPEGIp5NTCAIGycVmuRse3Oz8Hl2jzttMFNboqbxndr8aM5tgxsHoO+YqjE8SqXEF
         fuWXRTsFAPxsjG54ft9uFu9tP2+/Q2ScYz0j4POT0qEkN6hEiDIgjcYm25us+uwViDHu
         wfSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=prDmnot/bOxVS2gCc8v9HfYcjzpcvwnB8HRgvfXYsr0=;
        fh=b0FbsFD3hndHbrR7hTzcwSUIMBoG1u/ivslMMTasxFc=;
        b=P0h/oPn+ECUNuk8mscAEbdxpmuOWn5OIdHmOTjaKYP+wsgOEkWj0bMWDzzSoDQRCpL
         lFtUV6J2PCMihcG6v8mpNStRivV3vB437okfFC1D+rSLI0UP74ZNdH1JdPlP/f8wPHP8
         ivKA9kUzyTXJ/XHETOcdNPeBkEPFx+UyegRpRw8J+CzJ3dIjjeJbW5riL8rdOrLrctk/
         hzAdLhYQBQqG5QH/bMtzpgH54GtEyA/+pjWB3HHgg/7S/OghAB//DRSZaHgEW2oo9ecP
         m1Ka0g0/H1Lg/ubEOMXrtVEmjYjSv36QHKESajC1Jw6d4Ieanx7dr5WcXHLVBE1Nckt4
         At+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795474036; x=1796078836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=prDmnot/bOxVS2gCc8v9HfYcjzpcvwnB8HRgvfXYsr0=;
        b=e9TlTdXc+gatXcuCFKKb7aj/RyvKZZs3Fc22DsvCbrqYMGGtwci3FfIjibOfYQ/CZW
         9N8fj6eIrKNnVRdbxmnkFIx1GgLKrWEmFGL9vOQOEa0GR8Bc8q6jIgpflc/R1WmaKkIq
         a1L/XNzQgQR2OfVdP5ZWakzu06AC21i4FBAOG3jwYP8Lhy9AUkzJO9T8iBSrC7rM4aSU
         +QCy52SpD8tCCzGsrVoCDffQdo0iiSxV39ldqNaCG7VxnqiWEDVWhmyRn5+Uk0DxMQhg
         +jgf5l52Pyk6Ega5GmFX/ULCv5YHSq3eiAljutksNIdRm4c/i9EcMfRht5xGucVDbs5/
         qj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795474036; x=1796078836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=prDmnot/bOxVS2gCc8v9HfYcjzpcvwnB8HRgvfXYsr0=;
        b=BLAVuCz9LuOFqZ423Vo25hnHyOYyuUMgyUxA5zfOYXdIecBk38cAJ4eSDfqw7R+9EM
         pvSuNcynxXaLvwGf8YX6sf+QUhAiuVyYpG9yETghXj4WW1J/tJwbO1MgTJnvpMglRJzr
         hvRZShX98crm17Lg35JLWZDeVFyCz1H+01WAiDMQdfy5SkvDiFMmQFtYOEA7s1crfYna
         ap5E7I1aKI8MucW1YDwcwfu8n8rI5v1J0SfahR+6RDpEw0t8qWer/U/lkUV4fWLqGaFf
         m9VnLR8l0vdR3Tpznh+HMxqKERPUixXxnQFCh4TiRcKFKpxtSajPVgLerd+BmPecE22W
         InqQ==
X-Forwarded-Encrypted: i=1; AL+hErGdIdlUPQ/KzifXonD3HxYKMKdIgt6dRtVsBnwLpvA4CZp9cQCBpy5cWyQa54bjM12GxqLpWV6/7yK05kI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LonWOoj2eU1EX/S7WPnUotmF8WjqhFlDnSnLSDdYbhf0EbP9v
	tmGlBN5x1TEQ+UUcPsE3BaKWCUpqxN3aD4YUUOzPWdUO2zdczPrgLXAMlh7B/0cf86dlsVHSWkO
	WIkivie+mJLaFSFlqC54lStV8926/hso=
X-Gm-Gg: AZFdTZfR24j/g8KON1rwskgKCnjl9BqDCmqWUVk4TCnhtrOWeXueyvnVGD0mejHbLTP
	rWVuk/vd0Nza5/RDPBiRfN5s69je3rrn5zCdnCWyD44mSVd66d/smWpAXtGCzZTlVs/lqLa4+fq
	1eOJcIGFKgTt9O9aIhFjIFQQA9vgksVDs9EktFKGvdxxLc7rwVQ49smCbqXq8u5PK+i6A5VvuvX
	vQkvvPF/jv3XiFAbfVjG8c0//ja0peJjxuas9ea7o5sL1NJqW9M+WmKQCNkyY8+5vb0lMzykwDE
	AwiTjITkfqJXWbU6nNYCVmWBfyVMKf9fuXSy2k7lKU3wf+UYBRNHur/y/FNGbzsMQ9A8mzfnJDD
	oxF6hiD1nYyYQi8nZQdKnF6T53U7yH34UtXlvIj6Qqdp/bJO0dTFIreRzu7yTEm2vEOTLuw==
X-Received: by 2002:aa7:c710:0:b0:6b8:e848:d004 with SMTP id
 4fb4d7f45d1cf-6ba37e8dec5mr6855932a12.29.1795474036043; Mon, 23 Nov 2026
 14:47:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122000856.536902-1-koray.fra@gmail.com> <CAOQ4uxgf2KE=Ag13EPAu5=KnrFwt7zRH=im-qmLc8+i10Tjd+Q@mail.gmail.com>
 <DN2X3RC5JUFQ.2LNGLQOUX4ZPF@gmail.com>
In-Reply-To: <DN2X3RC5JUFQ.2LNGLQOUX4ZPF@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Nov 2026 23:47:04 +0100
X-Gm-Features: Aa3M54pZr_aGN97hdgjJEJclpmHDWTbmXWMujrk4s8rCr1BMot2r_DEgpbuT4T0
Message-ID: <CAOQ4uxhsv_1EEqAZ3Ebp5Uy8Q6nvEnE3EAomJjjQO86nTcW0cg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add f*_xflags_{rw,ro}_mask flags to the fileattr API
To: koraynilay <koray.fra@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, 
	"Darrick J . Wong" <djwong@kernel.org>, Andrey Albershteyn <aalbersh@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lauri Gates <lauri.gates@gmail.com>, Christoph Hellwig <hch@infradead.org>, Dave Chinner <dgc@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	ntfs@lists.linux.dev, linux-nfs@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 10:45=E2=80=AFPM koraynilay <koray.fra@gmail.com> w=
rote:
>
> On Mon Nov 23, 2026 at 2:35 PM CET, Amir Goldstein wrote:
> > On Sun, Nov 22, 2026 at 1:09=E2=80=AFAM koraynilay <koray.fra@gmail.com=
> wrote:
> >>
> >> This is a follow up patch series stemmed from [1] and [2], splitting t=
he
> >> _mask change for the fileattr API into its own separate patch.
> >>
> >> The first patch is a preparatory patch so that the code in the patch
> >> after can be formatted better.
> >>
> >> The second patch is the actual implementation, which introduces:
> >> - fa_xflags_{rw,ro}_mask fields to struct file_attr
> >> - fsx_xflags_{rw,ro}_mask fields and has_masks selector to struct file=
_kattr
> >>
> >> These masks have the following semantics:
> >> - rw_mask:
> >>   * for filesystems: advertise which xflags they support changing
> >>   * for userspace: specify which xflags it wants to modify
> >> - ro_mask:
> >>   * for filesystems: advertise which xflags they support only reading
> >>   * for userspace: ignored
> >
> > Nice!
> > I think this API description is very clear and coherent
>
> By the way, should I use this description in the commit message (and

You could use that as a short TLDR intro

> integrate it with missing information before/after the bullet points),
> or should I keep the current one?
>
> (current one:)
> > This lets filesystems advertise their support for specific xflags, like
> > statx.stx_attributes_mask does, and userspace can specify only which
> > xflags it wants to change without needing a RMW cycle:
> > - on GET: each filesystem that wants to support this new API fills the
> >   masks according to its supported and read-only xflags, then:
> >   * for boolean xflags: it fills fsx_xflags with the current on-disk va=
lue
> >   * for value xflags: it sets the xflag bit to 1 in fsx_xflags and the
> >     xflag value in the struct field;
> > - on SET: userspace fills the rw_mask with the bits of the xflags it
> >   wants to change, then:
> >   * for boolean xflags: it provides the xflag value as a bit in fa_xfla=
gs
> >   * for value xflags: it sets the xflag bit to 1 in fa_xflags and then
> >     provides the value in the struct field; if the xflag bit is set to =
0
> >     instead, this informs the kernel to unset/clear that value.

You can keep it also but tbh UAPI documentation is more useful in
comments and in Documentation than in commit messages.

Thanks,
Amir.
