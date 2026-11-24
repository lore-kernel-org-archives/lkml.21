Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795506988;
	b=YGPlwM/p58iy5h1QjW6FeOAAcYxF2aLGO5Qr5GdDCsNbeyTEvctGxT2pF9EOQ1Dc+nAW
	 HbT4bT+YKF1i9/5kXWxCxMIzq/jxEz/ApxWZLb3C8Ge6jO9fwnsVvzbvFAoPqeZcInYtV
	 YKpzsoqTquQbbbaKssW10x0CTQiaZjJGzpLwd/Hfyu6OwnjD4FfDE+aoAinAyOahq7BLA
	 wiQ/arkeRHvUb5ezV9gLxZ+4ihucp0tYuFVwgKEjvTVSUXcJD5vJTRuzm5TD2/Vd4/14e
	 VM6EvC1U8t0ydxpyMnJf6j0NOnK4/k0NlYbqBzK88Nnd5QfQdQiwl2cQ+VtYsSWF43Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=vYhZnVqOZw+nz+bSvWI9hUrAjtNqzIx5KTyz4HXKnEc=;
	b=BGgZLU4NuJqonC79acw8kJXk93BDyLeS2Uya3HngCRxUavXo7JC+uKNI2W08TZhXCKpu
	 xxXwlWgtx/1ZPrBZPGSQRBr9txUztPv9M0o5pK1VfzZShHNO7tGo8kUGDShCFtF0ZYfV0
	 byzEqEaEIb6XuKzStsH9lV8+hMNXes3r+8OTQJ7CBYwZVDaC2rKReBD0bN0FCsXS7P2k1
	 /f3hUL5tQ5R9fdSjaLStY7tnPtdz6ghdbhGnj7ZYRODP9Y3+jMsEf5Wr4TOwHSApgN5VQ
	 PFVo/+Mx/L+6kZTTXkxZHKyPGannkMkH1A0Y9jiWjg2a4ihbAdQsNKzD48hMoQD2E5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cN9h1p1V;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD61606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AD61606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cN9h1p1V
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386c337edfeso43942eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795506987; x=1796111787; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vYhZnVqOZw+nz+bSvWI9hUrAjtNqzIx5KTyz4HXKnEc=;
        b=cN9h1p1VoSXcPxB3Fj5OZVM0BsYWslYa7ACsFpqDPFTZIQWQ5e5j7XPqNeI+ViFAqD
         wXUlKlA0oka3N72ZB2U8ftjBv7rhKElWOmRGyQ0qk2AUaJhRA5TlVkvISCzLYB9H7V79
         4MnUaw2bfyijcXTAjZQozrv3OHx7fV7naGPH+rv7RZ+xRoIFbpWvSAvpNNGrtNcAMFAz
         vR5z/pFRokCQBYsJaaThWUs1hY6tJj4YnoRd4fpsH/fjTjSR+dn6v3NQlESJxOGvbshG
         UmLBo8w78lxcEwNYRemOtvLIae7OlArtnpQ7ymdKDMxuY38tQJmG2/tP/QHZBgQAWme1
         6sUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506987; x=1796111787;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vYhZnVqOZw+nz+bSvWI9hUrAjtNqzIx5KTyz4HXKnEc=;
        b=xzUL1uNwsFB727UpbGpV9015k3rknvNxzjCrjcbARP3FdKRnvtAEPnW8hM9fth9SfA
         RosONqGfgYyH3yE9jWvGgrJfQYmHShqHTBIrlMZNafoofGZy5VTCkNUGZZ4OkR6p92zd
         2cKPmqhmztkwQMw4rV0VgVrCrr8Fy4f88jfNJGG/RgEzu4tksLSP3o8+T5IYGKOXZKTh
         yki9cyKy0PxlHAJ+8Mj+ab50hARNAhFSpvAZa5q5w3ePZ/6t9+rqbpPXMo5ys8o4zCRS
         C/9S7FCciSiZEKAySHpvJrsUAXlHPF8nrDSLk4iE1ni6BaQqRWeT4UgoGbc2gWBSW66l
         WD4A==
X-Forwarded-Encrypted: i=1; AL+hErFbe+IqDl+ciK8jPa15QOdqr+lKEozxbMH6rPZPK3xkAxlS8gYfwAmym/WgtWkRxuNaVfxGLuFEuBki9CA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8270K6eqpvldIn/kVi2Z1utvH7i2qtVvzV+Lo9JjLPVRfXGYnS
	X5jhsTx87MI357pomNQALU3rLQ5PEaqytiWw7mKBg+SWJQ+LRudy9nSX
X-Gm-Gg: AZFdTZddsxCm+8UWo+L0+Bj/x6MxAaZaQr95pDxlV8Gz9dosUf+Xv0HwC6cQvorfOhn
	ZDZ5axK4gz1Nsu8LR3ksaTzpQATcw3gcN02s1hF7d8+mYDrVQ3er3Ma/Fa4tXCoJdQw0Z3MaKja
	EZN+2C2iGJwmYD0KuKGR6xqZNEmYGEhQ4G4XZCiJSFucgJ67EYOIgvN560OC85TEbFg1xuoDIu5
	P/zHVtRxEQ3uqz4gGf/lIJOBDheaAOHzXuWCP2oCHJZOT8tdAYMrpQCJOhvXAXAXCNic3bjQk4Y
	XSzESJ/Izo6FsLQ/ithhFAYYGe325uB5/qVCZQffiom9ymFsMYN9yNweqYgKpUcuLabEZO25O2P
	MZBDlPNztS6EqSB0uvRwFwgYMOuO4Kuob8eNNGfPV8u+4VPk6NKiX0HBXHGlGgeCUbY3MP6rR1B
	oU4I01LZwnPUdGduc7ePaq+qvIvZPjAJo0R5qVIB+Mr78cP1u9cBJ5iGaH/CgA/fcgfVOj/9K5p
	xbBDGr5rbAjm8oRMMYIMVQxwRcAm9PK3JzXf+PQm84SSrWPycZuahx5HpLhKUcDpU+0nF5ZrV0D
	rHqDSxEseyHl136LtjhWqGHRB80V8/qOQ/JXWbKIhcetkx2kXYfzQAUxEnLAwpycNf4=
X-Received: by 2002:a05:7300:1c24:b0:384:a0cb:a6d0 with SMTP id 5a478bee46e88-3856de58f7fmr23387653eec.1.1795506986646;
        Mon, 23 Nov 2026 23:56:26 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm51631829eec.11.2026.11.23.23.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:56:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC 2/3] lib/lz4: add safe decompression from two input
 buffers
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Nhat Pham <nphamcs@gmail.com>, 
 Yosry Ahmed <yosry@kernel.org>, Minchan Kim <minchan@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, 
 linux-block@vger.kernel.org
In-Reply-To: <awU7nwcEVC20uGMi@google.com>
References: <20261122-zram-split-decomp-mm-rfc-v1-0-4e69b08c0fed@gmail.com>
 <20261122-zram-split-decomp-mm-rfc-v1-2-4e69b08c0fed@gmail.com>
 <awU7nwcEVC20uGMi@google.com>
Date: Tue, 24 Nov 2026 15:56:21 +0800
Message-Id: <179550698133.2385422.1938353460437500441.b4-reply@b4>
X-Mailer: b4 0.16.0

On 2026-11-24 16:28 +0900, Sergey Senozhatsky wrote:
> Let me Cc Herbert and zswap folks on this.  Herbert mentioned previously
> (back in the days when we landed SG-list based zsmalloc object read API)
> that lz4 can be extended to support spanning zsmalloc objects and, if this
> lands, then zswap may also be interested in adopting it (along with zram).

I tested this approach using real zram data from an Android phone, but didn't
see any performance gains. :(

I'd be interested to hear if anyone has a better approach.

> 
> On (26/11/22 01:09), Xueyuan Chen wrote:
> > LZ4_decompress_generic() assumes contiguous input. Its wide literal
> > loads can cross the boundary between independently mapped fragments.
> > 
> > Add a dictionary-free block decoder that reads from two buffers and
> > handles literals, lengths and offsets that cross the split.
> > 
> > Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> > ---
> >  include/linux/lz4.h      |  18 ++++++
> >  lib/lz4/lz4_decompress.c | 163 +++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 181 insertions(+)
> > 
> > diff --git a/include/linux/lz4.h b/include/linux/lz4.h
> > index ad6042a718b5..3b6217bd9a9b 100644
> > --- a/include/linux/lz4.h
> > +++ b/include/linux/lz4.h
> > @@ -292,6 +292,24 @@ int LZ4_decompress_fast(const char *source, char *dest, int originalSize);
> >  int LZ4_decompress_safe(const char *source, char *dest, int compressedSize,
> >  	int maxDecompressedSize);
> >  
> > +/**
> > + * LZ4_decompress_safe_split() - Decode a single block from two buffers
> > + * @first: address of the first input fragment
> > + * @first_len: bytes in the first input fragment
> > + * @second: address of the second input fragment
> > + * @second_len: bytes in the second input fragment
> > + * @dst: output buffer, disjoint from the input buffers
> > + * @capacity: bytes available in the output buffer
> > + *
> > + * The fragments, in order, contain one dictionary-free LZ4 block.
> > + * Their addresses need not be adjacent. An empty fragment may be NULL.
> > + *
> > + * Return: the decoded size, or -EINVAL on error.
> > + */
> > +int LZ4_decompress_safe_split(const u8 *first, size_t first_len,
> > +			      const u8 *second, size_t second_len,
> > +			      u8 *dst, int capacity);
> > +
> >  /**
> >   * LZ4_decompress_safe_partial() - Decompress a block of size 'compressedSize'
> >   *	at position 'source' into buffer 'dest'
> > diff --git a/lib/lz4/lz4_decompress.c b/lib/lz4/lz4_decompress.c
> > index 3a2cd9acada4..548197faa3e3 100644
> > --- a/lib/lz4/lz4_decompress.c
> > +++ b/lib/lz4/lz4_decompress.c
> > @@ -39,6 +39,11 @@
> >  #include <linux/kernel.h>
> >  #include <linux/unaligned.h>
> >  
> > +#ifndef STATIC
> > +#include <linux/errno.h>
> > +#include <linux/limits.h>
> > +#endif
> > +
> >  /*-*****************************
> >   *	Decompression functions
> >   *******************************/
> > @@ -705,6 +710,164 @@ int LZ4_decompress_fast_usingDict(const char *source, char *dest,
> >  }
> >  
> >  #ifndef STATIC
> > +struct lz4_split_input {
> > +	const u8 *first;
> > +	const u8 *second;
> > +	size_t split;
> > +	size_t size;
> > +	size_t pos;
> > +};
> > +
> > +static __always_inline size_t
> > +lz4_split_input_left(const struct lz4_split_input *in)
> > +{
> > +	return in->size - in->pos;
> > +}
> > +
> > +static __always_inline int lz4_split_get_byte(struct lz4_split_input *in)
> > +{
> > +	size_t pos = in->pos;
> > +
> > +	if (unlikely(pos == in->size))
> > +		return -1;
> > +	in->pos++;
> > +	if (pos < in->split)
> > +		return in->first[pos];
> > +	return in->second[pos - in->split];
> > +}
> > +
> > +/* The caller has checked that two bytes remain in the block. */
> > +static __always_inline int lz4_split_get_offset(struct lz4_split_input *in)
> > +{
> > +	size_t pos = in->pos;
> > +
> > +	in->pos += 2;
> > +	if (pos >= in->split)
> > +		return get_unaligned_le16(in->second + (pos - in->split));
> > +	if (in->split - pos >= 2)
> > +		return get_unaligned_le16(in->first + pos);
> > +	return in->first[pos] | (in->second[0] << 8);
> > +}
> > +
> > +static __always_inline bool
> > +lz4_split_copy_literals(struct lz4_split_input *in, u8 *dst, size_t len)
> > +{
> > +	size_t pos = in->pos;
> > +
> > +	if (unlikely(len > lz4_split_input_left(in)))
> > +		return false;
> > +	if (!len)
> > +		return true;
> > +	if (pos < in->split) {
> > +		size_t n = min(len, in->split - pos);
> > +
> > +		memcpy(dst, in->first + pos, n);
> > +		pos += n;
> > +		dst += n;
> > +		len -= n;
> > +	}
> > +	if (len)
> > +		memcpy(dst, in->second + (pos - in->split), len);
> > +	in->pos = pos + len;
> > +	return true;
> > +}
> > +
> > +/* The decoder has checked the lookbehind distance and output capacity. */
> > +static __always_inline void
> > +lz4_split_copy_match(u8 *dst, size_t distance, size_t len)
> > +{
> > +	size_t copied = min(distance, len);
> > +
> > +	if (distance == 1) {
> > +		memset(dst, dst[-1], len);
> > +		return;
> > +	}
> > +
> > +	memcpy(dst, dst - distance, copied);
> > +	/* Reuse the period already written, keeping each copy disjoint. */
> > +	while (len - copied > copied) {
> > +		memcpy(dst + copied, dst, copied);
> > +		copied *= 2;
> > +	}
> > +	if (copied < len)
> > +		memcpy(dst + copied, dst, len - copied);
> > +}
> > +
> > +static __always_inline int
> > +lz4_split_read_length(struct lz4_split_input *in, int length, int limit)
> > +{
> > +	int byte;
> > +
> > +	if (length > limit)
> > +		return -EINVAL;
> > +	if (length < RUN_MASK)
> > +		return length;
> > +
> > +	do {
> > +		byte = lz4_split_get_byte(in);
> > +		if (byte < 0 || byte > limit - length)
> > +			return -EINVAL;
> > +		length += byte;
> > +	} while (byte == 255);
> > +	return length;
> > +}
> > +
> > +int LZ4_decompress_safe_split(const u8 *first, size_t first_len,
> > +			      const u8 *second, size_t second_len,
> > +			      u8 *dst, int capacity)
> > +{
> > +	struct lz4_split_input in = {
> > +		.first = first,
> > +		.second = second,
> > +		.split = first_len,
> > +	};
> > +	int written = 0, min_last_literals = 0;
> > +
> > +	if (capacity < 0 || !dst || (!first && first_len) ||
> > +	    (!second && second_len) || first_len > SIZE_MAX - second_len)
> > +		return -EINVAL;
> > +	in.size = first_len + second_len;
> > +
> > +	for (;;) {
> > +		int token, literal, distance, match;
> > +
> > +		token = lz4_split_get_byte(&in);
> > +		if (token < 0)
> > +			return -EINVAL;
> > +		literal = lz4_split_read_length(&in, token >> ML_BITS,
> > +						capacity - written);
> > +		if (literal < 0 ||
> > +		    !lz4_split_copy_literals(&in, dst + written, literal))
> > +			return -EINVAL;
> > +		written += literal;
> > +		if (!lz4_split_input_left(&in))
> > +			return literal >= min_last_literals ? written : -EINVAL;
> > +
> > +		/* A match must leave room for the final literal sequence. */
> > +		if (lz4_split_input_left(&in) < 2 + 1 + LASTLITERALS ||
> > +		    capacity - written < MFLIMIT)
> > +			return -EINVAL;
> > +
> > +		distance = lz4_split_get_offset(&in);
> > +		if (!distance || distance > written)
> > +			return -EINVAL;
> > +		match = lz4_split_read_length(&in, token & ML_MASK,
> > +					      capacity - written - MINMATCH -
> > +					      LASTLITERALS);
> > +		if (match < 0)
> > +			return -EINVAL;
> > +		match += MINMATCH;
> > +		lz4_split_copy_match(dst + written, distance, match);
> > +		written += match;
> > +		/*
> > +		 * Leave at least LASTLITERALS bytes and end at least MFLIMIT
> > +		 * bytes past the start of the last match.
> > +		 */
> > +		min_last_literals = max(LASTLITERALS, MFLIMIT - match);
> > +	}
> > +}
> > +EXPORT_SYMBOL_GPL(LZ4_decompress_safe_split);
> > +
> >  EXPORT_SYMBOL(LZ4_decompress_safe);
> >  EXPORT_SYMBOL(LZ4_decompress_safe_partial);
> >  EXPORT_SYMBOL(LZ4_decompress_fast);
> > 
> > -- 
> > 2.47.3
> > 
> 


