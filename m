Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795440928;
	b=Mr1RBdb8jOXBNbZt8JXusef9z1CI2gzuEd6DdXNLrVgkIapmv9HadjTTTuKk/k1sm4cD
	 FLGQhKlRoKeHqpn+/4k1/1mw+gVItlUR4smk7YDFivAjOx+GL4pAwmzIa6cCZPFdSxJGB
	 sBhyYJyCkfUkAhVJYwpMZZX89zAw8sRqFJ4C5Xek8J4xAKk48cWMpYKWOJHlEFyxQJrYo
	 pMEifGoHzeOwHDIinNmzYs2ZqXW4FCKqSuYy5WjoIPXlZKCbY4/LhR0u1dbTF34eqtRuz
	 ATzxMBw2sX0edqOZ7dq9T3lkqnOo4tt1ugfVExPO5bYhbBb2MP5Ikg+MUfFfmKFl+6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wA48BtGM3vO5100Jfaf4088EYVNimRYHtUBWITFpY8A=;
	b=fxk+mVH+mBkhrqsoG+E6y5qilKpvW/dzbMixRu05haWB2fvOriyzXBgDWUWHeEcVcksw
	 gCFEBXySLcIX+SIVOg+d8wE8XCjNL3rZeUrKE5T81jGh+5b05rEQpktVmLo8SReUvLymT
	 0snXliECKM6duk2FuTVogcuqCMaqfklBvXnICyb5E+72h8UcxbC765Ot9i9ljw2LhM69x
	 1PKYkgxi3AalGBhZlfjVBERdDYg3A4ljaXTNYoibF3owfg7RCWjQpzDhHRIoDPUszfpEg
	 SzoHo9v6ybT6l/0P4/oqmu1u2pAq7A6tEBvxpBzVpawP1nCv3LLroND4Ryb30MF+mFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CUalyFmo;
	arc=fail smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D7E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32D7E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CUalyFmo
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso4577725a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:35:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795440927; cv=none;
        d=google.com; s=arc-20260327;
        b=X2KfhxvrF6mIA9FRKWXs5b/met+KkHa0DaM/3hRh9snwmCA6ClHiRNxjmq8Zc1zLpU
         JpqxZeigDvRyAck2iUUHwpCA94jPtDQd4rGxF0oDO1OT+vYV3f9WN0BGcN7cCnjICDGM
         +8mX1qlu+e+QQVCaPJ4DsKFqx/e1qAmxWWs4jC4RPCsMRKCP9i1u7NyOW3oNYTIU5arz
         cvKg5u6YHs5+f7fYmwlCoiWN/cd916VV8CP5U7XDvtrHRgpxSWd1zmVktyWZiNlWA1Bc
         szCBR9jlp9QcoNbr9fqvW7ldFFpzYMgev8cSfwEKKBhO9edVbFmf3/E/80sgetL2xjQc
         wzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wA48BtGM3vO5100Jfaf4088EYVNimRYHtUBWITFpY8A=;
        fh=4D8J5f3POqRXoxtvw8x6VBgh1VmbB15NxsV6eUtJWXg=;
        b=hKCCo+NBlVxaq6kKzE9caFMGcvwbY73wkzm1trzOd5AwtA3WivIGu1w8oB2skJolgW
         g05l93+US/kpGHPuCqbEe9AJqSce+SKQb38s4AHwmNqZwS7bpHthxZreVomsjtHORQlX
         M3WYnIfSVcA6JdzmXIW6ed5/BkwnwJ97SJVVzbGGAsL3oYvLfEpxEONG+cHv9yl9b+uD
         FsGSxgUe6WkhqFDY4WDaFifHHk0U4zX4TIebD4C4Q5Yk1khfol6MXDRcEECrMBJcUtEv
         H0jPY2bBVIRxXK6vAYuJoieJoXv4qnbgcDwruXKKd01WxXNhex8Hs7m+SuHYBdc2FTGt
         6o+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795440927; x=1796045727; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wA48BtGM3vO5100Jfaf4088EYVNimRYHtUBWITFpY8A=;
        b=CUalyFmoReb/83xqvr2Uap9kVXJPiulZAZ9BuYFqHt3BZvwosq+NJSvwCx7EXaJ61q
         0UImgM/pK6aJnaecMJUvuPZ2cI7g4pQe50qM9Pea8hpjQVdlAcsrhBAjR5pkLoL6krP6
         nRENxUXoYZaxAwVNugh+MZ7YZxx2ccbHZqMsfjTLAWxmMDno9W5bQVXg6ZykzS6zofee
         MuNz4LKoADJSq/Wy8NqZgyRU3Eg71INdz3RDm6YrbcXLD3QD36tPN1Wy8wpv41odHg+C
         B4L+HLWFbiG+tetJRVhqx1bMgUVGiUgvZsZjbnHTLfWPYdIp22KPI7gyBEnpYFSEFiNv
         Y33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795440927; x=1796045727;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wA48BtGM3vO5100Jfaf4088EYVNimRYHtUBWITFpY8A=;
        b=Y88BTNBiuRaFOM8Unmk5bp6UQdiE7lzY7YDXBVkI3VcKK9arOG4tn+/GKsRxmHNobf
         I6r/NsjnZzWlRh03RC4G7T4E8Cza6xevKGtb9WPnsQjtqmSIpH+0g4KtAGa5Ck6ySGFH
         QsOSWoWrVPkxiNyB3WCQt+b4VFsUkXChpfakyHTIfbzuW6f7PS5PI7DZWAyoKC8CffLp
         BlSfI0czlb/exuMgjs/lE51FZmjMS8eHrnJCV0rj2MWmUjvmEAuuNnGYGiQaVONhihje
         11CwjC6mf3Gv5mpF+IZgOfPN++qvWIFSvXSHR3KXCqzM9yI3URD+Pc3aUIvq+RVxwYx6
         XAtA==
X-Forwarded-Encrypted: i=1; AL+hErFSxsmx7R0xMd2THzOu9bIHHEeXAnA0qYFS67VRJz7J5jUGQ/aOJsOIk71nZn5HFKnfnioG8uAYs/GrFAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wg41uBItvZ8a5duzCNAXYDfY0nVIDiHYIvdJ/CHMgszHBarM0
	esFf28OlXelLLiHKWAQzQ7PNtkjHVSlMlnD+q7WTGgy9bBqds3YNa4WkcqNunR1vFtxYpi+d85x
	11MyAz8ZDNa7Bq5D1KBqdNCsYBk+wSjg=
X-Gm-Gg: AZFdTZfOSs3FKcDzuZBhFD9XlYgF62uQ01uCJr+eEyTFP1g1O5cHd0DTWouMAXPPZ9Q
	e1h49i8wYe2Zqnsp1w3pP9xT+fBp0KJ2aRHe2YlI0KgHj7j+4B2ZEavm3vlXlXa+2Xl8wl6Fsnu
	PLU3r6NgIkSYEbkXr8RmJ6seUauumzOkYf9Xgk2zUOG06aRsvrMiaYxVXnIi2fyMEWU3lIuxf1k
	t8v/b1EFtrDjNBQA4YSMXFr4R1y93ohOJ3+H6h55HoXN3vaH8n9Jyp4Kk+e3ZoPTqMPFysbI5IH
	fSt3Ud5RTsGw8iq6YBwDQqhWtHTJnYlUO6klPEJA5MYOiKRULm8+8373rqQTtR2IGIoMvYVBTzo
	0oz6v0aawlV7p5ufqlUnHHZnSUPXNgE66qCnQN6TW3TsCHNrRtVBFbdFh7VyHdaxW4qsf9g==
X-Received: by 2002:a05:6402:1ed4:b0:6ba:7e42:d88b with SMTP id
 4fb4d7f45d1cf-6ba7e42da5dmr4190054a12.12.1795440926543; Mon, 23 Nov 2026
 05:35:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122000856.536902-1-koray.fra@gmail.com>
In-Reply-To: <20261122000856.536902-1-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 23 Nov 2026 14:35:15 +0100
X-Gm-Features: Aa3M54oltothA2ZyBgLZ2dfkBmCeGTagh_PAD6Wp2_FkqMP-qy6jOW6gmvjqNlE
Message-ID: <CAOQ4uxgf2KE=Ag13EPAu5=KnrFwt7zRH=im-qmLc8+i10Tjd+Q@mail.gmail.com>
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

On Sun, Nov 22, 2026 at 1:09=E2=80=AFAM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> This is a follow up patch series stemmed from [1] and [2], splitting the
> _mask change for the fileattr API into its own separate patch.
>
> The first patch is a preparatory patch so that the code in the patch
> after can be formatted better.
>
> The second patch is the actual implementation, which introduces:
> - fa_xflags_{rw,ro}_mask fields to struct file_attr
> - fsx_xflags_{rw,ro}_mask fields and has_masks selector to struct file_ka=
ttr
>
> These masks have the following semantics:
> - rw_mask:
>   * for filesystems: advertise which xflags they support changing
>   * for userspace: specify which xflags it wants to modify
> - ro_mask:
>   * for filesystems: advertise which xflags they support only reading
>   * for userspace: ignored

Nice!
I think this API description is very clear and coherent

>
> (ro_mask for userspace was also proposed as a "verification mask"[3] but
> I left out that semantic to keep this patch series more contained, and
> can be added later if needed.)

Not so easily added later.
We cannot change the meaning from ignore to verify without any opt-in
later, but we could use the combination of
rw_mask |=3D X
ro_mask |=3D X

to "verify" (set it as long as it is already set)
all we need to do now is make sure that the API returns -EINVAL
for rw_mask & ro_mask on set.

>
> This allows userspace to not have to do a RMW cycle when using the
> file_[gs]etattr() syscalls, avoiding possible race conditions and
> simplifying their usage.
>
> Patch 2/3 also introduces the missing FS_XFLAG_PROJID flag so that
> programs like chattr can leverage the new mask API.
> FS_XFLAG_PROJID is kept out of the legacy FS_XFLAG_MASK and so it's
> defined as part of a new FS_FILE_ATTR_XFLAGS_MASK group of xflags that
> will be used moving forward for any new xflag (like the one proposed in [=
2]).
>
> Patch 3/3 converts fs/ntfs to this new API, to show how it can benefit
> filesystem drivers too.
>
> The series has been tested across NTFS, ext4 (with project quotas), XFS
> (project quotas and extent size hints), and Btrfs.
>

Judging from the number of bugs reported by Sashiko and by my agent
on the COMMON flags change,
I think this needs test coverage for the old APIs, especially with old bina=
ries
chattt/xfs_io that do the get/set cycle and re-built binaries with new head=
ers
both tested against old and new kernel.
Sorry, but the UAPI issues are fragile...

This is one of the changes that would have been very hard to audit without
the LLM agents. Hopefully with the agents it is doable, but need to guide
them how to review/test for regressions.

Thanks,
Amir.
