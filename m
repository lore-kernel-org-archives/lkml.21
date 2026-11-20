Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795172077;
	b=1WlpgyMAsmwP33T8N3FxFqMBSkaLqVcmcIsdQYmMkvIk8s+WJBjXuaGJiW7OMz1fPVmg
	 0CVQLuahTn73tYwFbietKlk11Rh7vRLqVuOOYABDH9TGA5i86kNltBT5IU5kzDruicMOa
	 HNGADQL3PpN5KpHGGGAws9VYe7GeQRyaM28F6WjLGvBIJb685jYvh4JAZVzKuy5GW162w
	 riN1chE86Nb21nWxjPKK31RMdZS6FbfJj+A3+5g23qmyfyTR8Wep2DWXpVCQLvRAfuhSq
	 7M9iOiMv9yA2v6HqOZ6+gyhRw6kbVNP1BJch5AcN6CA2sYqNqUsV6E/UR4Co8KpkIgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vievxvMoQb39fU5dw8Ha4cqfcWmcBRrBY8uU/a8nTv8=;
	b=QBhYlnYwlo5P+x6qf5Sx7OrD2ov228dvpvnRdvELAxxuFox9HYMbm1uxiCHkxRfFr9X5
	 s3G2ybVblX3X7Jny9HSTiaiInPkwKjZ4B4JjpEjoBkULsMuMJxzLXEnCRaxN/GHrWnOEW
	 2gd0jNTdGuBTOCXG7hjqdmPnhnmdRuEoYVnXIUgnyWi6uFZnzZBysFg+reQLRWKAlFPZW
	 +wy06RLd25ZsZqONfGYUGwhOF6xwY5jfdIWhqC3xG+j9kK7HFxTdq5CCEGTiefCe4zr1w
	 w5fEPOd6opPJMCWLe9H0B32r3UVKmOBeyHsYZF1KKQ6fBQokoNy1PJ/j7sNfyTxthOA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0UEud1jD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5A3606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A5A3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0UEud1jD
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c0ace36e8eso56345e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 02:54:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795172076; cv=none;
        d=google.com; s=arc-20260327;
        b=P8sG8k69dV287CsYHs25Af6zRN/Q5DTb3Xzmt1fDMzLuWALWchTEyodqZWeTqvSbsX
         von39pXj7fKfogMULO5VSYN2BubiszdilJPvw/z/1cybgBC1Bcm80UJ/ZL/20aW5w1Hh
         vxJDu7yzY7wr57R6mEqdzUta75CR0K+h8Q9nM4ljxIRhsaW6uXdWJ+5Ll55A6gpLfPMD
         6lPlEajwIoFNpvLHmjW8W0ZYGNawWvWfb/2fm/9ItgNCwUixYJfu/QvQU87E/OlvoqGu
         7MoPjb3p1wkbEeSwExS3hqZrZX04zR+sYjIM/14QBFK6tlrSciBt6Q8SLLhYDyA4huCM
         rnmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vievxvMoQb39fU5dw8Ha4cqfcWmcBRrBY8uU/a8nTv8=;
        fh=Zo2EYAKl2jJKL8acHTYVnww3jqP/z2HnypBeekIwHqU=;
        b=KPb1gBFT29VH8PHmyR1iC2X2azccowA5YDGKdqg4vAvwta8r1TLxJoo2MlyOeopMNs
         7coc4Zuv1mnJIcbk9Bqzx4EkZypH+N4UzXOyey/yxhO3jDgDzO8ueus+0khzlmwi/toj
         PjHLX+FeXP7BHFGehrOVl5as7YiLyRpbYDoG6XaKDC/O+qhiF/msQf225MY/L1bOldJE
         32FruGSILlLrLh5P4QPHDocnTvtnVY7SweAtwpKL1TJO1bCL5Gx1pJZ+P6+x57Ak0VZS
         p4l2gIHOBtQWth6zQq24Rkyqmc29KbdWKD4DpU3Koy13vgIT3AJOC5lVJJ3KYBCBfXFn
         6dmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795172076; x=1795776876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vievxvMoQb39fU5dw8Ha4cqfcWmcBRrBY8uU/a8nTv8=;
        b=0UEud1jDAtrXqXMnao0nt1jnV/dRJKBl7/ekCbUgqnIi7knC0s/t5eFpTT7F0Ih6XG
         wZibq+ywE/LnUVy5f4ZuLoqlYExV23QknUdG6oYWUJ487ok/I/hPAtGiRfFVvP5EIf9k
         19oa4WJ1XvBKkFA5i245ipdzn5aCiS5zBfZsLy3WVgbUVuZP/i8ieWV+3wBkHrHAndnH
         XGyMeW17cvLo5Tlg3Px3LfO9ydRxvb4fBepjojHaZdh6R/hC1/+mNt2JzJD8MHKwzf1A
         mDPW31MHSRgi0+nKsq5CgzvQnnquWow2ENQBttC7q1OjxRNcQg3N0QoAnwvfGal1+w3X
         oGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172076; x=1795776876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vievxvMoQb39fU5dw8Ha4cqfcWmcBRrBY8uU/a8nTv8=;
        b=pg1tr8mk8hEV7L8YwmHRWmYZFQPk7fp9fvZj6YjKSP8p/u8KnTI2i5tZKT9IbS0dIj
         sLU0mUz6QkapCBmRHQzG7hYtXTn42xuKa4+b0i7xNgS8uUBiG/jOm/Dx4WtbalrVZOQ3
         x9abh3gn+QBYjuBQIQi58HdvpzIbt6SjBRuPr7lEVORUeQFqZQRo0z4D70Bl8DRwWskI
         kUmobOCqI68zALwCPjoJrvhFDkw5MNJDOJxCb3D7m6q8DO8pM8bHY9BEQ5vvqswUd4QD
         sWQ0Va7nn0oSa4XVof2UzhnQXPfRKHVjaQpsRHA2jSipJUAGVh/yZJP4+ymU0ztmEO/G
         emoQ==
X-Forwarded-Encrypted: i=1; AL+hErGUsT4m6oU1nE1mUz5unqopPBZqp/thYEAyugHFBzCx4OJPTGj6kg+h85DiKlO7JrYhnilyS9bk54krn5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jWZs1UOIIbuw13OyHfJYPDxLz/EuseHgn0WyhQfNUSMRLPQF3
	3JisEKnBahGwEbtyfTbMF8L+ZWRN586Eb0pNRgCTlUXSKtR3z4iPJ+FNbUdGGF5EDOBhr6DoR0r
	IrhTvDZ9MOhWYGfQHInT0rrlmYVvVqHY=
X-Gm-Gg: AZFdTZfuVtaQ+0g2A9s4cKe4QU8TKwB+Ng2LNzeSsg40KamI4/an+TUzFtHuzTFhp+X
	xKQyekpHyKfKotqL9B9H7HyRdmdKiTVDCYWPnFJxMB8ndlkYYJX2PBIBTvWMZXV/r9g5yEZn9jQ
	kTIq6TVrfqPdTer+0Hck6Lj9hHN3FK+vvnXHA4iJWV9T6K3IRHBU6k3O1eZ4ObzduZfNTfOKCfA
	+s6UdRAGdPhqhnDO6H6X+kF4ZaobVho7eXqoYOt53INxUvYqVXqEJ2qM5lY1hd5U+/wLjrV94+d
	JHRcPUCWzF5U63lwv/nbrqjlguzshN/LBGE5D3Aszqn4YnVUJD+qS7Lo5FxAUSVjegCEOyAoS/f
	PJz66Jhjhrt6Mm2PrBhi2B1cOWEz5agyTDtq1gpVCaJo/dGnmt5zkOVnKj+goaF19VMGmpMMe0A
	c0X6jAIYvQd/oXzLFU8ArsDlDPGo8P43J+Pi0JXZtcpKQ/fXM8JNxRazAOrnAOat6na8UzLu7eV
	pMcjC0OvJBn4qezLNAwupiANTkKqpwrbXL7peLryu8eqjNOCWmgNdp/8fgKhkqNsYvHvd+A
X-Received: by 2002:a05:6512:6812:b0:5c1:5703:46ed with SMTP id
 2adb3069b0e04-5c1bc89ca10mr714804e87.6.1795172075335; Fri, 20 Nov 2026
 02:54:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-b4-gpu_info_intobytes-v5-0-3e0c7c93223c@collabora.com> <20261020-b4-gpu_info_intobytes-v5-1-3e0c7c93223c@collabora.com>
In-Reply-To: <20261020-b4-gpu_info_intobytes-v5-1-3e0c7c93223c@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 11:54:23 +0100
X-Gm-Features: Aa3M54o513_u4OJXnC_4PJiTfbRDccCUiJK3hUcQFc9fkLbXWHCQET8-3sinerE
Message-ID: <CANiq72nX+94ie+0RjysjKT+FSoTH0TvWUCOciPObvnrkrnH-eA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: add zerocopy to bindings and uapi
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jesung Yang <y.j3ms.n@gmail.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 1:48=E2=80=AFAM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> Make the zerocopy and zerocopy_derive crates available to use when
> building the bindings and uapi crates and their tests. Also make the
> zerocopy and zerocopy_derive crates available to rust-analyzer when it
> runs on the bindings and uapi crates.
>
> This will be used by the Tyr driver that needs the traits IntoBytes and
> Immutable to safely copy the struct byte-for-byte to userspace.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Looks fine, please feel free to take it through your tree:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
