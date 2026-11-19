Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795063063;
	b=tWW88usKVpd+ESNidRZ0NuPImOSb44GcnYYfu0/q7NHf7Of1GfABQhpwL21xLiIHu7pQ
	 TF54Gr+ZpvypLkS5PhfP5/zjnsD/3caPtpXktEY2d4Id85nE7HgMTT33mWBiONMUjcBI8
	 FUr3Ju977syny9tGX/1A35oEacEnMEGY05Bj1FZq7Lu+1MIWK1sv9oe0pahuDokxbAMWO
	 qxV7KGisGnYoAEe8vZw76yRq7IKX0ijeSCRU/HmgKVlovaqPUeQdJJRY7hM6RwNm8NDw4
	 l8K906TlAZOgcnlhjbQ4eqnvvXhxTSWUtMQcXSLZ3nHDb9JSb/RzuTJhytwu1OLpi8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795063063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+FXF9hSoVS4CH32BazzPKuzl72nnJAzMPE7bT4F/z4M=;
	b=MU8oX6mQbEySgvt6lwohDP5KjcPM3OGdAS2hvltMZnuGwzRN7jmJ/tMe+JJgpQPTkgxf
	 VxjkXzNFmj0Lko/efFj0retNo79AIqtLDKqmVqpdxdJcjErszsKwA0qSwNbe0RopwOA11
	 Q94aWbBlMxWYZ9lKu5csn4kV4OrEbIKSxw54aHp4RFRe9dPZMSDFDR7vgHF5s0DrxS+hS
	 rUMfGDHe+TtTffMlg9AihKBy3sZ2jqcqadAIpHhEebdv0RTZzyCO4cxhjljOzs4iezXTg
	 umUDkG8TKhxSq3UgLoyxI1O4bRv9NVfqFZt6Lvxu1hBpiQhxb1McQN/j+Q3mtxEzElQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=agOalK1M;
	arc=none smtp.remote-ip=209.85.221.178
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD527606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD527606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=agOalK1M
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso572151e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795063062; x=1795667862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+FXF9hSoVS4CH32BazzPKuzl72nnJAzMPE7bT4F/z4M=;
        b=agOalK1M67rtRfhX0+CCvwdGPWZU+74cGhIclHGYhvcKDeDN3MG70OI4rl3gzS/XMz
         uMInYrQhEXJ9FptQcuszFz9jndr3XCO3x/g8cnugLHoHFFOGgx5mDLBLZbuxbmOCNHNO
         m0VvfWZTGmPLkhILEtMgrpUn3Wqh1T/V9h42wc3MI7y+8X346Z6983IG5a00cSiCTI9L
         qRIPKG9ufw6WcEt8pU9c0AJ3OQZrsIK40lRdSdeDE3Cng0nDxIXZJr7CpcTj5luOOj8L
         n7RU9NQ4vv5ZjwRkM/8zMkzfuHJGOBZJ/6KqkQHokNvFALVSzxsvBsCwoNSSl67fzvlS
         IxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795063062; x=1795667862;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+FXF9hSoVS4CH32BazzPKuzl72nnJAzMPE7bT4F/z4M=;
        b=f7baqWTE+SoPojpAZjeFiUfFvrQ4RVijQ1RNyKpNOZNWjxWavuLo6TWvxGXxfwycyE
         4C9146fvIskZ9A6Y3E+I0twDtihj5h2gfFd5WmJrfaW9Yjzec2WKFk3RcNQFFx5lord7
         0ATuK2tPOi5spZxAiAx8RjdlUQz/6U8Bv6pmkraSnS+bkR9Nqy2IuwWt0+8GRaykyxZx
         DsTcfPmj5kOS/0Hl2Pl7ouWhHjrDCsYrW1griEoPPNJq4zozb6eAN8+AkoMG96CGF/R+
         p2r0q03+q8Odz5Z6Qv+7CKZAcRQ1coRWiHAdMorCphv/oUHNhz8yVvpNqSomAzs3b6u1
         okHg==
X-Forwarded-Encrypted: i=1; AL+hErEVKLXDZ6Rz3Lw0m+Pf6HKYV4vK0/vq+VLYTPK2+0sPr02QKsCARBs/ZEtVMRkN+HIfXC8fSLi8mYsQO8E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OzAXSqe9xeF23w6la+ejJpF/48TCF2YgQSyAwoKsY5C/HOznt
	xcqn+TTc9u3LeJ5HB9zTbzQH8Vw2SqgaZz2I7iJQilIi2VXsRWasNGMe
X-Gm-Gg: AYBFou2PwTtuXJuQmqlKreGkOn6nhQZQgf4zHQaST0J5jG/NnuM9RYi1r80fugivSB1
	kRbAqFVtQrA1OCiCFTe2YW4ppcAiA/3EWshXXmm2sOD8mC62dHitm8XwFpaX5fNbaaT37uEyaA9
	DXGZyzbxsMEWeKsZJ4f/8h3IK2GC8gQ/28wVnwi2sStQCFm3c5/w3vw7OXofc0LhcaSKsQKLSJT
	BbXHBO7bCgf3BaXTWxJWdOQmQI+xiFSlX5YQQEryq5zbpF1cTAPGD/zJdseaCpLGLsUm9xkMShl
	V5BqaxAm6hsmDzanpOnfEmnrqy5ROGsFXypscRPeeJL2HTjJdAoYHLK1FoCQ4Tv9Qe9C/f1JK2K
	KEDHEC7oO+aOC+0Sw3BqpSaiGANUk7SJdSAagu8mLi6U+R7w0Lv+l/RrxmTzAjOaVWLdZsn1EO6
	XSsve2I82HwmM5E1M+drtkdDwHkvY5E4/Nn4uu7QaNyT87m0GKupwEmQxWqsDIpBCT/gTrDORjk
	j6Xe3DSnqSngejuhKNQtOk37iMyQ1gW1Dqb7UPKi5GaALZQkBgF42HeeAQv3+WRO0TdXyR7CRWy
	kO0xa8fulEcT6Rtowrh0yy05lAW8+kHJltu/2m3lRj3nfkPFMIuRxzzT6f9wC22HwPZGWSGH7aR
	MkwIpEXewIBURMMlgdjXXT/90DLIFmrhLSmvXalJ8KwYwuMjqvGveWleKHZWFBAC3
X-Received: by 2002:a05:6122:4d13:b0:5ea:c51a:37a1 with SMTP id 71dfb90a1353d-5ee64c3cb93mr1894599e0c.8.1795063061754;
        Wed, 18 Nov 2026 20:37:41 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee64e4d867sm3290348e0c.3.2026.11.18.20.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 20:37:41 -0800 (PST)
Date: Wed, 18 Nov 2026 23:37:40 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>, 
 Gwanhyun Lee <gwanhyunlee@gmail.com>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.37588f5cf382f@gmail.com>
In-Reply-To: <20261118120102.3717000-1-graypanda.inzag@gmail.com>
References: <20261118120102.3717000-1-graypanda.inzag@gmail.com>
Subject: Re: [PATCH net v2] tap: clamp zero-copy copylen to remaining payload
 length
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Junyoung Jang wrote:
> tap_get_user() derives the linear copy length for zero-copy TX from
> hdr_len or GOODCOPY_LEN without bounding it to the payload remaining
> after the virtio header. tap_alloc_skb() exposes that length in the skb,
> but zerocopy_sg_from_iter() copies only the available payload bytes.
> The unfilled tail is transmitted on the underlying link and can expose
> stale kernel heap contents.
> 
> For example, a 246-byte padded virtio header and a 14-byte Ethernet
> frame leave only 14 payload bytes, but a zero hdr_len makes copylen 128.
> With a 512-byte virtio header, a guest-supplied hdr_len of 256 also
> passes __tun_vnet_hdr_get(): it checks hdr_len before skipping the
> padding. That makes copylen 256 for the same 14-byte frame.
> Larger padded headers can raise copylen as far as good_linear.
> 
> Clamp copylen to the remaining payload length before allocating the
> skb. The minimum Ethernet frame size has already been checked.
> 
> Fixes: 97bc3633bec7 ("macvtap: macvtapTX zero-copy support")

Thanks for the fix.

This appears to apply to both tun and tap. But to have been introduced
later

Both macvtap/tap and tun originally subtraced len -= vnet_hdr_sz first,
and rejected hdr_len > len with -EINVAL. We should reinstate that for
both.

Commit 2506251e81d1 ("tun: Decouple vnet handling", v6.15) introduced
the premature check, replacing if (hdr_len > len) with if
(hdr_len > iov_iter_count(from)) and crucially before
iov_iter_advance(from, sz - sizeof(*hdr))

Commit 6a53fc5a8770 ("tap: Use tun's vnet-related code", v6.15) then
brought that bug into drivers/net/tap.c

We still should also include this fix (or skip zero-copy when
copylen >= len)

So there is more work to protect all paths. This on its own fixes
one issue. It should probably be respun to fix the Fixes tag. Let
me know if you want to take on the other work and send a series.
This can certainly also stand on its own. 

Side-note: it is also somewhat surprising that we have allowed such
massively padded vnet_hdrs all this time. But that is perhaps too late
too fix. Certainly for net and stable.

> Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
> Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
> ---
> Changes in v2:
> - Replace the Fixes placeholder and add the co-developer trailers.
> - Document and reproduce the guest hdr_len > GOODCOPY_LEN path.
> - Shorten the code comment and keep the C reproducer separate.
> - Link to v1: https://lore.kernel.org/netdev/20261113164903.785381-1-graypanda.inzag@gmail.com/
> 
> Tested on Linux 7.4.0-rc2 (067c5c24cef2) in x86-64 QEMU/KVM with
> two vCPUs, CONFIG_MACVTAP=y, CONFIG_VHOST_NET=y, and CONFIG_VETH=y.
> The guest used vhost_net.experimental_zcopytx=1 and init_on_alloc=0.
> Each case ran in a fresh VM with TUNSETVNETLE enabled.
> 
> Before this patch, with a 14-byte Ethernet payload:
> 
>   [POC] case=A
>   [POC] case_a_hdr0 received_len=128 expected_user_frame=14
>   [POC] case_a_hdr0 tail_bytes=114 tail_nonzero=98
>   [POC] control received_len=14 expected_user_frame=14
>   [POC] used_idx=2 trigger=128 control=14
>   POC_EXIT=0
> 
>   [POC] case=B
>   [POC] case_b_hdr256 received_len=256 expected_user_frame=14
>   [POC] case_b_hdr256 tail_bytes=242 tail_nonzero=82
>   [POC] control received_len=14 expected_user_frame=14
>   [POC] used_idx=2 trigger=256 control=14
>   POC_EXIT=0
> 
> With this patch applied, using the same inputs:
> 
>   [POC] case=A
>   [POC] case_a_hdr0 received_len=14 expected_user_frame=14
>   [POC] control received_len=14 expected_user_frame=14
>   [POC] used_idx=2 trigger=14 control=14
>   POC_EXIT=0
> 
>   [POC] case=B
>   [POC] case_b_hdr256 received_len=14 expected_user_frame=14
>   [POC] control received_len=14 expected_user_frame=14
>   [POC] used_idx=2 trigger=14 control=14
>   POC_EXIT=0
> 
> Disclosure: An in-house LLM-based analysis tool developed by the authors
> assisted in surfacing this bug candidate and drafting the initial notes.
> All root-cause analysis, patch code, and QEMU/KVM reproducer results
> were manually reviewed and independently verified by the authors.
> 
>  drivers/net/tap.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/tap.c b/drivers/net/tap.c
> index 2f19fb07bb2d..f25c58d6e986 100644
> --- a/drivers/net/tap.c
> +++ b/drivers/net/tap.c
> @@ -608,6 +608,8 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
>  		struct iov_iter i;
>  
>  		copylen = clamp(hdr_len ?: GOODCOPY_LEN, ETH_HLEN, good_linear);
> +		/* The remaining payload may be shorter than copylen. */
> +		copylen = min_t(unsigned long, copylen, len);
>  		linear = copylen;
>  		i = *from;
>  		iov_iter_advance(&i, copylen);
> 
> base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620


