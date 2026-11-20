Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175811;
	b=4yctFv9I0St+6BN2j3v2vJ8p/v1WJRpVD/6OrG5yhppCl0a1AF3VhXDN603Ahev8G/TH
	 dPSqChLu8jbNCrhrOmkifoyrfmKOjaQiPz7UBq0wF1A+XL0SBQ2gBSictRm+1IJoC45if
	 eFwiNjWBReNRvr3zONE41a4dMKkZWoJCfCJ4eICIWNSJULQYZr9Kx7LyhZ2las6aEywHI
	 /XdYuOa2ilxtGc+6s8C0gVzqwl0dQKOLgYd7vhV2aVI2lF+jRNnm2swKHwsaUeA7grDmN
	 4b5jUUCmJrv35bRlrjUkjha/o058Ibb4ka70NW/GpEz3iF9TBYk/eHEkxR50dRUxXrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175811;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aWntWikItZoiax5YFuZGg4RDFm2k6IkT2ctGq5qxDFY=;
	b=EE06ozcn0FY+rWEuoLGsJaygLOtC7YERTymVOZgO75t6i95vXWus8Ezt+7gQBMZE7CKe
	 HN8IPblOaxV3ivxNfBaW+1mHD9wBSjy/R/j4A5DZTzrYGoVtHp1OFTOC2m80KI6uif4R3
	 9DEPXPEmu67MwibcQBsHUowF/+H3/OVQf36uKmXhKjAtF2PqybYlsY/OZhb9uptKndxJP
	 A2oKHZOf5yIDf5p/h8p6ZyH7by5GWE1Eg/n9WdA6evCfJiSifLR8Pwn2oZnwCnYZVwmzX
	 y1c6SbnLD0bY0qa2BfCXpsJa/HvDqGc+bBT38qmhbaGwk00AuH38TMOqmIWTakUWxlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nkOJWF1y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A468E606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nkOJWF1y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC791F000D8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795175811;
	bh=aWntWikItZoiax5YFuZGg4RDFm2k6IkT2ctGq5qxDFY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nkOJWF1y/Mto67qbV+wrOthRlIrHzBPCxrdX4b4CMMmfDXmripfZGfzbiUpI0OLoo
	 X2C3xp7Y2PGYuOsJWwj6v3Lw19moWs37ZYTmufjMUdpzCuRTV8XJJFpvo4yWwonY5k
	 RIwHaBqb8aQ4rO9BD6+Fx70i/Fzrxy+0yFMxn9CYkk3BiZ2q5GwRhhjgRKyiw/nxeM
	 JIVcZPYrjicHmynj0oOB/Rvz8pMLfy1tSKlOr0YQIO3K9nZYIsstmfg2xF4LH0HLG5
	 E66QhqfwvyfpqEGa7O2628xWd8FTbI1vqDlfniqErWBJbjFc4kP6Hems/T4oAJEwyH
	 W0rENIHW1tJSQ==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so140096466b.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:56:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHOfHez4AzXu5dMmW3VUQHa3zPIBpAUN3thCHzF0JGTz14R+KX0j+WhTbhQJNXu10hfEyzunRCKfxnfkJY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wciu8bjtq60oc9jIxTyFHFpLm7UcGngkBvUcriC2DvCHl4YNJ
	1FAFUvUs44Oozoa5TppX56utfhMVBsM010Tw9Jte9ZkbUe7v+WuCeeTmHtqLU9yl0soyEC6KPkx
	Zx7V2+xR9vrUl0Le1h9JgOfWlZqcYxcQ=
X-Received: by 2002:a17:906:da0b:b0:c42:2d07:4c38 with SMTP id
 a640c23a62f3a-c513a85f70amr217159366b.26.1795175809833; Fri, 20 Nov 2026
 03:56:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120092015.2469284-1-dand_wu@163.com>
In-Reply-To: <20261120092015.2469284-1-dand_wu@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Fri, 20 Nov 2026 20:56:36 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8F7Y3cMuhoGJJgm+8Ewo_XZ183rgXg5Vk3NQC=J0c+SA@mail.gmail.com>
X-Gm-Features: Aa3M54oQnxMJ1oWDgwk1mBOzYVu-CO7PbPdSutfa-lMkK3wVhWCxHB3qXdcTY1o
Message-ID: <CAKYAXd8F7Y3cMuhoGJJgm+8Ewo_XZ183rgXg5Vk3NQC=J0c+SA@mail.gmail.com>
Subject: Re: [PATCH v1] ntfs: use kvfree when ascending an index tree
To: Dandan Wu <dand_wu@163.com>
Cc: hyc.lee@gmail.com, liubaolin12138@163.com, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Dandan Wu <wudandan@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 6:20=E2=80=AFPM Dandan Wu <dand_wu@163.com> wrote:
>
> From: Dandan Wu <wudandan@kylinos.cn>
>
> ntfs_index_walk_down() allocates the index block with kvzalloc(), which
> may return vmalloc memory. When traversal ascends back to the root,
> ntfs_index_walk_up() passes that block to kfree(), which cannot free a
> vmalloc allocation.
>
> Use kvfree(), as the index context cleanup already does, to handle both
> allocation types.
>
> Fixes: 0a8ac0c1fa0b ("ntfs: update directory operations")
> Signed-off-by: Dandan Wu <wudandan@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
