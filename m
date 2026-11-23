Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408179;
	b=RWbgXSySaaClkM8NU1uBIapp3buty2I81PZbpPbyFe9kdKxerDxU8aRijKLOPUL4M8E7
	 ERf38R0OKMtVeAmn1nias2ofyJIpcSV2N/8rztf4Py64TUq7vWQVNAN3KRVZrSrr8fI9T
	 MDCYQajgDFfmPuI42dVpqjIP9Q1cDNjVBL6M53oWHrEG2ejySugzzJt08DYCLa9w2R1Ld
	 1848SNmB5XCmwPg5aZNTfVwZ/fQWUqNkuzaNSHs4E2x0WhApJJ626ISdLW6VBoJPVnGy4
	 C09EXMoS7Rztq+52to59+mdv2fTrLY8rmYW01E4yuBMgXWJX45yl2g6EA/dezM7JbPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=7zM+IiNKEoJGgxM3+Bk+Imyhf6P6VaD/X4/H1O5YPuw=;
	b=SkX6bxEDVegd2yBPwoz5rTPiXRPaLPKGvTp75buCpVqQSCdG91pZV/5rXjv4j0iQve+V
	 rmtL3Nu8jb14jitfEWZ0InUpyl0cHHDHmgAM142auh1+WoNv9h9Kickeb09VXGGyyn77p
	 Fa3q5WH/MnFMke16oeemLX7j6YtXqjk02a337vUZplwpXMpRW78/7Wiepgax6mwY/tsmE
	 VR42JDK6XWDZgnK2lld+gMFNZAbYuMtp25rBC03VE+2tqqnWD2Nmnf94NJzTwN2XcA6w0
	 ajqxBivZec8qINZzZ7zbCvkFJExFrd1lGghi7wiRGQAYv3ZT4QORdVSuH22SqxEYfpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUHUGZaE;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF872606A336
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF872606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aUHUGZaE
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a3c08d6928so3933445c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795408178; x=1796012978; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7zM+IiNKEoJGgxM3+Bk+Imyhf6P6VaD/X4/H1O5YPuw=;
        b=aUHUGZaEEOEdNzNk7jJlnPASzHhhEnHRVaIhMy7eYVLp4Y/4cOgGMgya7nmlEyzVbh
         UZgh943sTiJsR6xbuAa8fchQmXtuq/GwssxQELv2dy8c32pZ5lRrktP6Hyf0OKplQuea
         mKFBcFlf0U+ShSFqAmU4CrsYDybMSFng9zilxUCaD9bW57CKuZtNtiwv6AalDbp9e9QY
         /YdfKnNWWCEj8kZd7ncag+85jEEvP9KiP4fEGWPtnuN1ee4MPG1VA30upm6eLUVt1UVA
         KQJ7GmlXFOJAloqENl+ZxDm5ADGr7jn+qWngQDMdU7L2J4+AL6Z0knQRcV9NrUD1rhff
         Kfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795408178; x=1796012978;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zM+IiNKEoJGgxM3+Bk+Imyhf6P6VaD/X4/H1O5YPuw=;
        b=nsaXQk9FtoweUb/byJzJ5I4eKeB31pCZm/afNy3T/4+gG6XhwhO9vGfHj8qOsPLLK4
         B/YwrETx3K7+TW3Duj7wjI1A9nQD+xEb3NtUJzrX2O5pk4xhueNm001kaF8O7EuTT6+I
         f8gOxabHzaG2m9wBeG/LdsDBoIBY5S4VbVWMTIOozlkEgod+cwNXl4AWhWP/wUhZjd4V
         IgokfHo+PMVWrCSd62XoykGad/nVeuovhS12W7q0Ir5N6STQuCdgmIa+6e1aIOSOhOd9
         a2mhEoCVtcSSDhpB8R2ktrz8Hb9RPWQpKgYzIAOjoRFRSlRnbfbLnvMw2CgUeSC+l2fJ
         xgIg==
X-Forwarded-Encrypted: i=1; AL+hErHnVaSyGkjyl1Pk5WSRNn7H9KsRq8qnodJLgtNljTVOLSj0H69zTjHnvrbdIV1ccQ/5cxAG6/ucuZdYpy8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zA2KSJy1XrrPq8EJudvHzYTgyIRoBJCr8ZRm9a1KwXK2hsr9c
	ndxrVsB55HeXlpx40hMuM009vXMZn6spp0iAbNwy+coidXGVt/V60QUo
X-Gm-Gg: AZFdTZc1rA6d9Jq6/CO0hLw0Ct8PtyfW4zMm30THVsCfPUweus+Wijfp0u+7yUm3A8q
	Yhd6ePOeCRrKCJ+jRvIuimVVEQW6wiQ8mJ+vfddHjYx8yBraWtUKolD1lrgyYRvHjXN8wPURlAA
	x8gZlETtA+dASdUPg4GshvUqDpg1j37UaXZ7UfBO1a81l69oZ7Et6ToxHIyszb8K7ZMpFL0U3zO
	MgOgytv8o5G7fDj8+bcz+p75uR7xbCTLxqZk+zA9i3grpXLxywRk6EjeCq9PV+Sh7mhLuzJyFek
	aZE0qT0zv4Y3yEICRH9gv5bi81ghuC78YX8DITr2TweV3EX/TnotkEQzro+LSKI8TR1qF3ZjoSf
	p3ss0gcJG58W91A5q3Qt6f4PFUDprAMRYhIMeqnjXh+e6Vt2jHjZ5+1LbsamlyCPBwIlsPS0tP+
	kP3QUEW4ZRkyhi9Z1v05hr5T4UZnqu4+07Y1cKb2zFUkFKaxeLBnTC7x657KQWzyHAybDg53te6
	ewtRVESVaISBRzE+Uw4rhlKun31VjTeBYpGPr1sBnyYT7FoxXGOHXaZ6bN5RfFiSmg1ojM=
X-Received: by 2002:a05:7022:62b:b0:14d:3c0c:79e9 with SMTP id a92af1059eb24-1b55686d67fmr14706089c88.11.1795408178021;
        Sun, 22 Nov 2026 20:29:38 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm17703865c88.11.2026.11.22.20.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:29:37 -0800 (PST)
Date: Sun, 22 Nov 2026 20:29:37 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Eric Dumazet <edumazet@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, ipsec@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [BUG] xfrm: a socket policy cloned for a TCP child leaks when
 cloning the second policy fails
In-Reply-To: <179540513898.3135.13913410077710347458@kernel.org>
References: <179505710269.3511679.8893709762919027206@gmail.com>
 <179540513898.3135.13913410077710347458@kernel.org>
Message-ID: <179540803327.3139702.4403349042486439775@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 23 Nov 2026 03:38:58 +0000, netdev-bot+sashiko@kernel.org wrote:
> xfrm_sk_clone_policy() already sets the child slots to NULL before cloning.
> Would checking "if (np)" on the child pointer avoid both cases?

Yes. v2 checks np, the new socket's own slot, and is sent inline as a
proper patch. The report was also wrong that a partial clone leaves the
parent's sk_policy[1] in the child; that slot is NULL.

Kyuwon Cho

pw-bot: cr
