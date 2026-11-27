Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795781098;
	b=Adq9LKIYU+geWjO/BipfF5mzhGsP9KuIXbF6BqIkDJCmJ8sUfHe6XpdqK3pp3u2Q2soE
	 OfGCREahHqjh5r3mBJze77iawRaBBE4Q+SMLodoA2BsohdK3SZrMF9s//rsSetI4iRe9W
	 Ja5hAsTnaYLMHOGkxRTVlBvhDm5ReL7wJv3Zu49f91TyE+kRYnkSTG3dt/AnAsIpY9y9S
	 2wVZ4NYEXUXqNBuvVSKaTfyV0EqsaiEKMNXDyaoLS6NozgQcR4lkRhTHyeozHHot6VFsv
	 IsMV3ikVFtfdBc29bsEs+MH/4/luUdsssyRhz8HWgMCGH4CO8ZSHwvGqriPwXjXi1Zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ftbPRsCQ0aqf0DRrrjwD4Al8a/o+mRVmt2zUH0Y6zDA=;
	b=AtKEjgKjn4WIKjCdrncTjgx9c+BSlWZldK/0cmwlsHT20TbZ/qE++MNQKlTm1NFOTY0f
	 dyqX7kDRlQYvHpAvjSxUgnbexNSV5fbFkXuFTgcpFG4d1tVhIpAEbdVzvzpXbq8mmMdAL
	 oLPUyIN0Qb8qAmGkgyrDMMiuIU6o/4tXxTCiY6cgTCuADwc1CohcxJe1WCJO69fsaMayJ
	 BllfJTyVfORzB2r7fbGjETNGzmR8DFH1tQbbb+cnv7l3ddAU8T3DBv+FFtZYytqlUp43O
	 ZEd3rF/cB89bqI4m/tk6Mk6uk4cDphXbeD69nNs8q+EKRjP1tg52/XDIO5yNLlGcwkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="a/faIOem";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE58606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AE58606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a/faIOem
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b8a52db5f9so9787031a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:04:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795781096; cv=none;
        d=google.com; s=arc-20260327;
        b=auR/fa3Z1vsRQ/tARPfFYvvTpvRVYkKnErG6yIBUx5yNHLMFVCghsTmm5QoG2ddSoy
         ozWPkbs9oJHDkz9H/SVtpzxmSCdd1lapaxKo5HN9pUYZX6f/0+IYW/ZF027hl3KQ3HcH
         9aOJZ0aBMsNBbIvAM6/jRPUmPft4YCDPS632PTH7dJK5HnmjJtc6yVPwaTxmP4zFcZNx
         /fzNhKk24WcQ6P3UspcMfLJBNV9MImXuNCn8zPykQ4OiqM4KOMOOTMTbvNaJDWs/xmPB
         pDc7mJyZAS3NIUBj+Ky5EW268iakhVdURrHRX5T4TVt25Z+TmxQnuYdMvantGQZBZTNi
         y/oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ftbPRsCQ0aqf0DRrrjwD4Al8a/o+mRVmt2zUH0Y6zDA=;
        fh=Y671IUC6Cc47ks5tHBHoHxeR69YokWcv+MWq6lJ/IaQ=;
        b=ifjZiCUIXL5P6JARLdY25PdadCVIQ6v1t/P3KInvI4oUtUhoVDbHG9XR+CdsYVIeUU
         wEnDjMTuoU++P0teXetC9vT40ocd0i9B/UFCv9ENHBdHpOcnvCvhuL4ftw3kv2FNWRjk
         0RTLW2pxaL+pvRQfhJV7LYsEbqC1lef9G/58S3ZSbbZ6qsex+2cDvxXONPMmxWpzBCUE
         xfJzLiWSd6NMsBUD/qwH+ZxJ9bblJi6eWlU+RH31jPpkLBVNxSQmXSNqkeGsRlV0kPvU
         NSrz7hqQT/SjsRTmKF0N3PcXCsFA5OiDBjk7BpDbZBDR4lD0CbjE3YgqpLDjWpxflcCe
         pGUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795781096; x=1796385896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ftbPRsCQ0aqf0DRrrjwD4Al8a/o+mRVmt2zUH0Y6zDA=;
        b=a/faIOemKG9XP9oN9nHZ0RXKAJGUuULcrj5tlG5oW/VxoETGk/czdvSllhhNf3cLZ9
         QZfgoKUPAO+lxAeT39SzbkiTrobrvkwTRilpOiRfynBTw3Dq4mQQOsaPpO2q3L/eNCw6
         75tG8Way+N5Y7kNdc374kxwLxPpgXrf4M3aS8Tkoc7ZPyjzg6Rzr+n+Pscq1n8ZXh53X
         8gOnoWD+dlS10yDPmY1W05uiGKpWUmd1Zb6pGB8AYpx6o/RFlMqxj59WZhRkFmmQMlzf
         d6R5FFbL3Np6vQDGcBL5tFUkX4TUGEgF/3bqMPd6LQvhH05HX1jyMVN8C3RNkqypH2BI
         RiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781096; x=1796385896;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ftbPRsCQ0aqf0DRrrjwD4Al8a/o+mRVmt2zUH0Y6zDA=;
        b=VJ8TwxI88lcfNAeN9STppwKgIOeIFn4DEQixHXlQsl38ErO5tIiyXPpHFYCrEKopbt
         VJzNM67jecBB8n7pX+p3u85I5c3Q5bBjMi1mmSqpamIU4uUz4uFPodkE7EmxL8STGSqd
         SQarIRLeBo7q1K00q/1Djy0iesHdDIYmnKAxeJvrmHojeBk3/I86Qg5kfN5oJQAauhyV
         MRPgkp47fAEEV/50ufdNGhVJPC09brbzFHPxbv791tYKsv9vBe2WSxUNUHAleYaDfX0V
         QLihrgWqEsFKOB7/ufEXNBrpgp+jJL3Qhhk9ExrPHOuVj2KeVZTq3pMTJMBjKaX9fBs8
         Jf7g==
X-Forwarded-Encrypted: i=1; AL+hErEpJYkTORanv4rJwlt6nHDNgGG9ZMLeEU92oKX7pdJfn8Q6XGyPTP8/utxz9bAWDzAGP3Q7xKSZn97WbtE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+VNSEsC49y2mnHpLbyi0tF7OVeGio72M5MvZN8XWR1RI9gMew
	8kiPxe/EToeJTT30bz6xsiVKO9TT9M8jawtYIFWe2GK60KjOdYtnpaX0XB4CBjt4KWUPKtaEHz6
	D+sczDueXMq6Vqa6ryOflacOxJpaVhpg=
X-Gm-Gg: AZFdTZdjn9up0t2+VlI4eblHzU2AK8V0HgpcCuSSdA7dZZXRhwvxz2RvBl3xn9EetA6
	cjMwuY09KqiVcSpFUAPIQx1NR43WUZZNYVQYI4gR4MAVyTTEEXwxKGcFne2Jdj7WPRrI+YTTM6Y
	KqANhi3Z0Lj8FuTZ8fCxMuDulMh6Yhk0I+MzGJJoat0WBt8ma2swaETrqNrYOwFTfRin/UaPCTO
	e9dGwKc4nVVzlpkI9ggLxcGWrrUkOArNyEKs7aOUNQxlgmuDhRkyPIJgjb0u79Bon3FwxrigycJ
	/MindRSzpsa49ZO9z0QnCsDroDN/8OG9bsLlenx8tBnrSJVLFdKx8Qqry08tTyRwNC9TU2ETXqb
	hzQFSE0zFKyakdyLg7BJQt/aU652CQT1B0yjZZhcpTtIj3jz7pCNY0Ag=
X-Received: by 2002:a05:6402:320f:b0:6b4:59d0:7294 with SMTP id
 4fb4d7f45d1cf-6ba37e9ec85mr20367582a12.31.1795781096175; Fri, 27 Nov 2026
 04:04:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126163114.403846-1-koray.fra@gmail.com> <20261126163114.403846-5-koray.fra@gmail.com>
In-Reply-To: <20261126163114.403846-5-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 27 Nov 2026 13:04:44 +0100
X-Gm-Features: Aa3M54qEfB_iTiJNZjGRc3XRinkgqc1ntuigIkhA7BS94_VSwwZ4uoMmp26Q3TQ
Message-ID: <CAOQ4uxgJjy3TaORBkMOdef-JvzX2uA5K2sbMDEcLqmpkedsESw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ntfs: switch to the new xflags fileattr API
To: koraynilay <koray.fra@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>, 
	Eric Biggers <ebiggers@kernel.org>, "Theodore Y . Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexander Aring <alex.aring@gmail.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Andrey Albershteyn <aalbersh@kernel.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Lauri Gates <lauri.gates@gmail.com>, Christoph Hellwig <hch@infradead.org>, Dave Chinner <dgc@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	ntfs@lists.linux.dev, linux-nfs@vger.kernel.org, linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 5:31=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> Switch ntfs_fileattr_[gs]et() from the legacy FS_*_FL flags to the
> modern xflags (FS_XFLAG_*) fileattr API with masks.
>

This is where the commit ends doing what its subject is saying.

> Introduce FS_XFLAG_COMPR and FS_XFLAG_ENCRYPT to be used in this API
> upgrade.
>
> Following the FS_XFLAG_VERITY example, put FS_XFLAG_ENCRYPT in
> FS_XFLAG_RDONLY_MASK and in FS_XFLAG_COMMON, since it's read-only for
> all filesystems.
>
> Following the FS_XFLAG_CASEFOLD example, put FS_XFLAG_COMPR in
> FS_XFLAG_RDONLY_MASK but not in FS_XFLAG_COMMON, since it's read-write
> for some filesystems and read-only for others, to avoid breaking
> existing filesystems.
>
> Also update vfs fileattr_fill_* helpers to include these two flags as
> well.

All of those non trivial bits deserve a patch of their own.

Not only are they independent vfs changes, but they also have
implications outside
of ntfs which need to be spelled out.

With current patches, I think this change now advertizes COMPR|ENCRYPT
in fxs_xflags for all filesystems that have them set even with the old VER0=
 API.
That may be ok, but it needs to be spelled out.

Do we also allow to set COMPR via VER0 API? Do we want to?
These are questions to be asked on a standalone patch.

Thanks,
Amir.
