Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270176;
	b=eKaXcIlQbHjCYFYHP7HhhI9BdSaUdAllOi/17Ithe4R8G9s5Hr77A7L+2+ldFJBxL37A
	 OpP/3y0QGY/12kbPwYVpOuVqv99bHlI4Q1/lLiBnwl4hHXBZgWw6iFpp2n5U6KkOyMoDv
	 pdYS8iFoDBzII4fA4fBpcKZRE8m16T+RVCJ9nm+1PdW/7hwN/RyhnjcNA7USkhBsNxAg+
	 FpN7XV2NKG3q6hwqeItcQY4Ap6cD5aWS7RaSRzoIYUvTI/XgFkwCFZ5Nzdp+fNEbqvXwV
	 S1tGK7LCoANLo6YDJzcmVXAfTmipDBdv+PUej3qXr+goJ1Vk6FGYk9iCydPREPpMu0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270176;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xn+NzOAI51seqA5M9eZgYuYtYyEXJedApRaY9hQ4Hxo=;
	b=j2GKsfQUMIUd8TKYG01D2pi2fL/76yEhmHHl7rjD8YDhQhxql8vWipNNwp1HDNhUJ8B0
	 2VRhwzfXMou3+5x0ZAanHCmcY3CWh5jzmwLIxyccIZU+Ei6a/oXkmwJzLPk6dBbCG5vOb
	 H7tkuhW8RnBasdzLurKDOAIk30u4DqQVoXogY9/DHdD8yKjFL9UCbK9fycP7mOqyChjQJ
	 8VlzARG+BtWsH4Ko2SQwry+7lauA0pnal1VUuj4MoyprHuyyLyQAHfqUR552V3YnfOkJP
	 PZG6L5noZR+Z24hAc58TrETV5k9yBM5q9BUW2RYD8e03RW+Mr9ozxX+ueeTYioXMUaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gz0WixZ1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA31606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gz0WixZ1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6031F000D4
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795270175;
	bh=xn+NzOAI51seqA5M9eZgYuYtYyEXJedApRaY9hQ4Hxo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Gz0WixZ11SWNLOMtkFXq+S7pUzvFK/qiGZEUPOPIdd2ZPKivdszZUHFr9kuH3zOIo
	 NnjNd5gOmVsQZpT9rJJzgPkbYRbUzRM3NY+bBBjAXpyoNN/OM/Int02IlTwn06dCpr
	 hN3uk65eJcshfIUhHwHtHsm+6Mcdg7HnOjTyVUmaAF8pwy0M6ebRH48J9ng0WtlPZK
	 v3MOXDPZCQCgQZyapLMwiWoNSnrBtllIXXB/FgXRruhLlZNGuI/HnfSO/7w90g8KTC
	 L4r44Y6diMApehoKHDnK1hNMFs2EYz195D2rrI0gfylFabi1uT3Ekh4DNYGhYpPx+u
	 ymVA9+2rE9c/w==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so2705872a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:09:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF2tv3hSnCQLGOy0mET17yzhgH6PzLEXD8ff8T9tf1H74sZwhwSSFccxB9bQ/YlwtvV9rLpSIextwQkzPY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n6u56E30533UqCf9BFI+9TPnrhLY5mKxNT03irs8B3k9Bv3x7
	lLIaZVG/wcZOVvw3OOKcpx+wWTubRxgJrUG0ACCRGMSp5hObXURTL/+yzNsBdwLoc/QwaMZm4vb
	p+Azx+k0j0G6oGalA9Ax/sMwXmtP2TdQ=
X-Received: by 2002:a05:6402:a594:20b0:6b1:c7d9:b631 with SMTP id
 4fb4d7f45d1cf-6ba37e75977mr3576112a12.23.1795270174408; Sat, 21 Nov 2026
 06:09:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118090701.1858849-1-wangxuewen_ky@163.com> <20261118090701.1858849-9-wangxuewen_ky@163.com>
In-Reply-To: <20261118090701.1858849-9-wangxuewen_ky@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 21 Nov 2026 23:09:22 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9Yqdycqht1hCCMqZ_TtkeTGSy8LGYKMpny6j0=712OBA@mail.gmail.com>
X-Gm-Features: Aa3M54pKzxUEDqWg31mFRVxfq_Xa_AjzTScws0XhhLNUiWZrGBxpxPPrJwyw6tw
Message-ID: <CAKYAXd9Yqdycqht1hCCMqZ_TtkeTGSy8LGYKMpny6j0=712OBA@mail.gmail.com>
Subject: Re: [PATCH v6 08/37] ntfs: preserve buffered fallback writeback errors
To: Xuewen Wang <wangxuewen_ky@163.com>
Cc: hyc.lee@gmail.com, liubaolin12138@163.com, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuewen Wang <wangxuewen@kylinos.cn>, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 6:08=E2=80=AFPM Xuewen Wang <wangxuewen_ky@163.com>=
 wrote:
>
> From: Xuewen Wang <wangxuewen@kylinos.cn>
>
> The buffered fallback of a direct write waits for writeback before
> invalidating the written pages. It replaces any writeback failure with EI=
O,
> discarding more specific errors such as ENOMEM.
>
> Return the error from filemap_write_and_wait_range() through the existing
> cleanup path.
>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
