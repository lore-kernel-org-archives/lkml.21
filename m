Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.34.166.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202401;
	b=mBq6WTjMgtu6AjnrXLHQV9DPLNhD4ko/i/65hie/4oo5fvsf+jWDDz7cJc5gX9e5iaqU
	 RPNR/AQ2c5+JjcKgrWnUgjJW+d2bOH6Irn8c1vXZ0pMDh2ftFtZMafjJ1ob6QekUTpZy7
	 0Q83bqcqw/sZpR6SXz+KOiwEcjFQ686X5tY6Ik03Tug2ynVfYO1o2Vad3b1maM/YnPQqG
	 rbgVBdP1IWQi7cx9lqshpg1mmgGWXZzdatWY2x5Syd6132jekq7HID+SFIdcddt/dk/1S
	 oQcOG3FRoMpqi0cm6bTuZzputxqe5ORyIIWut4dJLPVGzVmn6eGr3rmlrinaz2sfibQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202401;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=YCSPQg38JCvTFBhOaouQF8A4H/BO7cYu0Ed6hFheRRk=;
	b=pBG4JHg6kF2Mbupt8udX04UH/dCgGU9sO1E/NsvGRja54iuLlPpJiAuKa3Qo7BDuolgd
	 vPwmRdBM4C7AiYCIP6zacOOYiUVpHfDdq5n57ajuObKeU1jNHJPjgTUqwihx84+QhQAX9
	 cPPXQce1xmzleRX0OEm6XlFDx5gexsqpsBd1zxLr4WofJngHAxJ3ZvsV2yzHJtypdV1b1
	 0NkDVzoCQt40ZJA08/+U7J8oz9agvF9pHUu9cMp5FSlH2Vp110FZzund0AYRSdrg7CfkC
	 4mejB32oxp/35Vtd/tSeRkdnuObsz+sI88PPylMLmZW8/00h9o7tNVbtZoHiQkQJSCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tukaani.org;
	spf=pass smtp.mailfrom=tukaani.org;
	dkim=pass header.d=tukaani.org header.i=@tukaani.org header.a=rsa-sha256 header.s=x header.b=OH+bECqH;
	arc=none smtp.remote-ip=84.34.166.10
Received: from mailscanner01.zoner.fi (mailscanner01.zoner.fi [84.34.166.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3053B606A6CB
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3053B606A6CB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tukaani.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tukaani.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tukaani.org header.i=@tukaani.org header.a=rsa-sha256 header.s=x header.b=OH+bECqH
Received: from www25.zoner.fi (www25.zoner.fi [84.34.147.45])
	by mailscanner01.zoner.fi (Postfix) with ESMTPS id BC24644EA4;
	Fri, 20 Nov 2026 21:19:41 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tukaani.org
	; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description; bh=YCSPQg38JCvTFBhOaouQF8A4H/BO7cYu0Ed6hFheRRk=; b=OH+bE
	CqHWieFSxKm5UOF4rg+CCdi7M35T6aA5gLfY19KyPlANkXcRs2bumDtjIkexnnFjlGtyo2eeTMk5a
	TiTaQ3HFZvTBY1AnSAt7YtwEKBncaXoqy79W/DzGgi3YZp+0IXIp39aLxqB3Cqh/yDw3nDo8WBamp
	5E8ZK0CMr4WtGF7CIgKyy5gxa4+C3VLkEIIfkdgbcyCjZqc2OGD7H/Fzc9aJYSUspyjtnZ7itRm5A
	+oJOONklApQ0nfMYAwY3Y6PK1gSjSfZdJYfNPx0FWCZJ+Mj5oxuknBhBvBGI2tOPpcXMH9Nn21U10
	0+yaD/f6VnevBB95uujuUV+6rl4Sg==;
Received: from mail.zoner.fi ([84.34.147.244])
	by www25.zoner.fi with esmtp (Exim 4.100.1)
	(envelope-from <lasse.collin@tukaani.org>)
	id 1xUU94-00000007R16-0TP6;
	Fri, 20 Nov 2026 21:19:41 +0200
Date: Fri, 20 Nov 2026 21:19:41 +0200
From: Lasse Collin <lasse.collin@tukaani.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/xz: Decode LZMA with local range decoder and
 dictionary state
Message-ID: <20261120211941.05b6995e.lasse.collin@tukaani.org>
In-Reply-To: <20261113115937.188894-1-pmenzel@molgen.mpg.de>
References: <20261113115937.188894-1-pmenzel@molgen.mpg.de>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2026-11-13 Paul Menzel wrote:
> lzma_main() and the functions it calls access the range decoder and
> the dictionary through s->rc and s->dict. Every decoded bit stores to
> a uint16_t probability, and every decoded byte stores to dict.buf, and
> the kernel builds with -fno-strict-aliasing. So the compiler has to
> assume that these stores modify *s, and reloads and stores rc.range,
> rc.code, rc.in_pos, dict.pos, dict.full, =E2=80=A6 around each of them.
>
> Copy both structures to local variables at the start of lzma_main()
> and write them back at the end, and force inlining of the helpers that
> take their address, so that the compiler can keep them in registers.

Something like this seems to be a good idea.

While -fno-strict-aliasing hurts speed a little, it's a minor thing.
Even with strict aliasing, writes to dict->buf[...] are a problem
because uint8_t usually is unsigned char which can alias anything.
Simply adding "restrict" to the pointer arguments of dict_repeat() and
dict_put() reduces decompression time by several percent on some
machines.

I separated the changes into multiple commits so that the effect of
local rc, local dict (or *restrict dict), and various __always_inline
additions are easier to test. I created three temporary branches in the
upstream repository[1]:

    optim_paul  Your version
    optim1      Local rc and "restrict" for dict
    optim2      Local rc and local dict (no "restrict")

optim2 is similar to your version. optim1 and optim2 contain a few
other changes too, the first one being "Split state updates".

The results vary between systems:

  - On Ryzen 7 9700X with GCC 16.2, the the local rc clearly helps, but
    the dict changes don't make much difference in speed.

  - On ARM64, the dict changes in both optim1 and optim2 are significant
    improvements (tested on NVIDIA GB10 Spark on cfarm.net).

  - On x86-64 and Clang 23 with -O2, the rc and dict changes make little
    difference.

Could you test and compare optim1/2? I mean primarily the commits
before "Split state updates", but thoughts about the later commits are
welcome too, of course.

I suggest creating a test file with xz --threads=3D1 --check=3Dnone so that
one is measuring only the decompression speed without CRC32. The CRC32
implementation in XZ Embedded is slow.

There is a benchmark program in the repo:

    cd userspace
    make CFLAGS=3D'-O2 -fno-strict-aliasing'  # Or use kernel's flags.
    ./bench /path/to/testfile.xz m 10  # Multi-call mode (XZ_DYNALLOC)
    ./bench /path/to/testfile.xz s 10  # Single-call mode (XZ_SINGLE)

The source files aren't completely identical to the versions in the
kernel. If you want to test optim1/optim2 in kernel context, copy
xz_private.h, xz_lzma2.h, and xz_dec_lzma2.c to the kernel tree and
remove XZ_EXTERN:

    sed -i 's/XZ_EXTERN //' xz_private.h xz_dec_lzma2.c

It might take several days for me to reply, so please be patient.

Thanks!

[1] https://github.com/tukaani-project/xz-embedded

--=20
Lasse Collin
