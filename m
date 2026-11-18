Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795023477;
	b=lU0D+b/L0sFLhFQxdJg4+sT52FFzEFFfDkpxSKEa+Z/GPPfTOsU0A7KyzP4+9W2+yNBV
	 TqRnnOm/0aS92kA8Xjp+7fL0PE1XuuXSegfP2YKsQgx7sgebN7/A2NLfY4XoDIYLCbJQ2
	 Jgjw6HZrU9iYOtDkaMeXEzwg4oCB1pQe15BGUn0ZjViVkPj07HR3xSJYs2S6EM5Z/u+4X
	 NpxH/3smJcv2kO0QZ1VJosMdeT+VRw1MSsRf0p19d4W95z+/zLWpzZaA7il8tEsdJI1s5
	 X1YLdgirY2afdUvE/UGFaIuwXvt5MIKclpKsELNqJJWhatkkFSYrC5x/na/0rNRfBog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=R67yuyz8qBaN7OEJjW4cC9fhK33d87+KjfsWBVWkcBA=;
	b=SdD6vKGkgDX14NeOMgSjJc93PtNURip3QBmEVMWt2mhBM/VH+et9bXifjD7WeEkkDsK2
	 B3GAu5RxCYjL5IqEG/v3NBSHYpI4NrOLo8gx4P+F68aZixonXWB723sC8HWkvunRuI0a/
	 Chr8YiCfjwJh4CR+SGNNrZIs1p5yT32BPYXWCIf2QfEenfRJl+8KCCeC49LwJ501uULF7
	 8mFWt1F+48fI/T8QkcD8v/q1DokMwOzMjzDw+1wICDXbgE/Ja+AAGKywETrkfwGuflf39
	 y3LKtktHoD6UTH+ZXDm/EKnfyeqfL81FyPgyWoUg5WtGUD+slop0xgXuyowXYirW+Sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4Fx1cvZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D78606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2D78606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4Fx1cvZ
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50933bdf4bso14806666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:37:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795023475; cv=none;
        d=google.com; s=arc-20260327;
        b=BC8QywDL/7wyMIcpAzmy2m9zv1i+38pnPfwGYF2Hamdlu4G3tqKZAODGkLeFNWkn3G
         zDZ06jmdK3Gis1NoFB/1Ohcwzq2jx4NtJ9+ocix7rL+urdS+OKwV4/fgjRYNVGXCGUiO
         3piA6Xm5DdzrCYxGfeTS2+Wob6ZB3tNYuzCCw6sOMXK5+USDzFtf2+AMm/2QfgIQYCpC
         PBNZh1Iey0WwfIjmZEBB78/1MuZnxFxQopKTy8U7Ugsvy6lP30szHgzm8evbLqu+Daju
         hrX0+iVDF5fKC7lrXF72zOjAHYp09zyhXYso9olUBSmmg9+d3kNBZO0kBgnUltE92dWA
         rhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R67yuyz8qBaN7OEJjW4cC9fhK33d87+KjfsWBVWkcBA=;
        fh=+qreBaoOaE69lhBcVvMumwKIsx3gysV7Kj6SERR+zPQ=;
        b=Sfok5wR0/c9m/1wHkqgh46QwlGd/Y+gP9/shOhkUL21Yg653L887UI2Vd3AGbcDtx4
         OIjMq/lb1f94VBFVT06eMzzj5EzFhvHAdkDDCbcoaSk0WM/SLGM0JKKJ1gJjZ7VAAlkW
         ZyqdOXzqDaMxqg+EzLqIb7NcjgMrgYR3n+7vFfoUybecEn/plDGF4j7q8DFXW9mJzTtS
         MEJYZtSDMl392moEiGSB0qNeaoB8zfMdOsucqcncfykmQjpQRancjx/Z3bkjnyO+0GXV
         uN+dsqiMWXuWOZp6h6OMDsq5Sdlf2jXlqPUpQww0NMmo758c9h8/vPx6SVJgfB2Y4+8g
         elGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795023475; x=1795628275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R67yuyz8qBaN7OEJjW4cC9fhK33d87+KjfsWBVWkcBA=;
        b=B4Fx1cvZRSB70oxXa7PXzsQOiKHd8kick7ujHIg5sKZfXngwM/J3md0QrwQw4limgc
         gzD04fGPnUdH4vsdPqK10mZdRL8XnpJIKSo8akWEM5mP1fwpa3D6R1ZVi3kB4ftkkRYT
         t3eglWK1B2yIv1p5oKl1PvLjjuez6SSOZkvKdegYNTew2mBmZIppnHMoZW7XAD514J2T
         Wkz+jc4JDJW+IYh3dYSMGjOQlspp4IYbioQrh478oLfKYgEeEOCfp3zOdH8mfHNwLEAs
         a87jaYO1D21yfJt0MK/CqLT0XQY2LPKrrUvneOLh7WazFrteu6Qq14s3DdjdZZ4eW7Xb
         Uy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795023475; x=1795628275;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R67yuyz8qBaN7OEJjW4cC9fhK33d87+KjfsWBVWkcBA=;
        b=UANoPXnhr4KA1P22xJwmI1eQ6sHRsrT95v0CIo441uzqZMo9bsnTLBM9C2/3pmrzio
         u+Tt+E80HEh9tGoo81weVrIPgKCj1ejiK04KlD/jCGUNGSVZMbkPxqoqmskqzysgWTsc
         RuiIzDgomNi7tlTUoXRKxUoEsTMu1CFnAbniyGlIFV8ho6iJAsfh4qz9Gud7O9AOftiJ
         lvM7IdjNE2HIxopZYzUcDiV8nYPRA3gyp+J9uoYRFHByOvomBWED9xwoh3Hs7hTrIYdd
         y0JXVA05ICuhkVqYqjxItDygwp8qSdpQowSnozEKLvUxb3Y+mwQ70BzFMV/WXJgO6FoB
         9YqA==
X-Forwarded-Encrypted: i=1; AL+hErER+wK1aKZ/toCCW68d08h9h+599Dn2jMb7FhJ6F3m+Z2C320BBQshlGciazWKUcBOe14Ic3s7qxiUpE4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zJZBJr3Q7uJ4J3WPraXqQh7dX8EOpwgqtieRZ/sz1sEd0Ac8e
	9MzEN2Lvslbo5IwdcM7Dp4w8BM9igxOgXtYP9w9rRZe7SDPWRQZ38Cw9EGKPDIQmyYBWzSggC66
	I8fkgXEs0+b5CwIJEacosqsQzdzTwh0w=
X-Gm-Gg: AYBFou3gLczhKNTPWOLVbGk4uhHJU4mtrvsqMK2QOFM3uE6Z3DbE1PMFgCeVVGeyhwg
	mDZpiKEJyCkIDOReBQAerWAEcl1z0TlKGCL1X4KuM9AE7flWxu9ORawPLs6B2GAQjgsQq42u1Z+
	xZusigDd6d0sSjcWRHu65mwz+FoT6nAYRwL4KHOAJDOMoValNSe4kPY2XZFH6HH1SvK9BxYA59x
	W4G4m/EMuWRpoOxpdNG/Kk6TWHdUfcysOngWF8qR3no2gwlZvh4YyQH5snWgzfD1jXtCHrZn5op
	XfJspRYMeHk6KIxd/MHm69w67wM/xVbeZcbjm2jCXLDm4Ns0sFMDziVq8GUmG/Dpug+uXNzZRzD
	KZhKQbaUtlXnHsM/ckkvDTInbDWfk0N7p+qdB+r46/ktZXR9edFKRrmH6DAl0oPepAjLMpg==
X-Received: by 2002:a17:907:da1:b0:c49:b6db:1 with SMTP id a640c23a62f3a-c5126364307mr15604866b.12.1795023474965;
 Wed, 18 Nov 2026 09:37:54 -0800 (PST)
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
 <cd49ce48-58d7-4341-b4fc-34e63daf3c52@app.fastmail.com> <CAOQ4uxjme9sJ5LGNDnP6rEKZLTJzX_ZdcMohgu2iLULK96GPOA@mail.gmail.com>
 <9c4a509c-b6af-4da1-8a64-9d5c26c74bff@app.fastmail.com>
In-Reply-To: <9c4a509c-b6af-4da1-8a64-9d5c26c74bff@app.fastmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Nov 2026 18:37:42 +0100
X-Gm-Features: AclHuK9j8na9qQXXbOgij3n-j2Bo4JySgielhO0fgIJ-weX9anWXgtr5UxF7Q-Y
Message-ID: <CAOQ4uxguPD+PWEUZtAzSdA-15d_C5cn=34ZmCm0v_b0MWK_sfw@mail.gmail.com>
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

On Wed, Nov 18, 2026 at 6:14=E2=80=AFPM Chuck Lever <cel@kernel.org> wrote:
>
>
>
> On Wed, Nov 18, 2026, at 11:36 AM, Amir Goldstein wrote:
> > Can't an NFS client be connected to another NFS server
> > implementation which does allow this?
> >
> > I can't wrap my head around the problem.
>
> You already named the problem in a previous email: What happens
> when the NFS server's kernel is upgraded from an NFSD that exposes
> only btime to one that picks either ptime or btime?
>
> Clients will see a file's btime before the server restart, and
> afterwards, they will see a changed TIME_CREATE but the file's
> NFSv4 change attribute will be unchanged.
>
>

Indeed I have.

My newish proposal (on cover letter thread) is that we
abolish the ptime/btime duality and make mutability of btime
a pre-fs decision which is advertised via the get_fileattr() API.
So from the user POV or nfsd POV the values will never diverge.

Thanks,
Amir.
