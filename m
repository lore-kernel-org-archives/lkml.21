Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772671;
	b=ISsRa+ZzJzLGhIGy95xFu7QlYgBNUEu2BRYKVEEu9UQ5u2GxSab/M5sM/aV536Wvsais
	 gDqtuEGz7P3ah9eXEA1xvfW8LMw/BS/lpO4/T+ioR+V8tk4RBW7vsxO01wh9rCjlrZh0u
	 nPsIAoKGeZwMbVbHYfF4AJw0UDdh/0kYwAYl7Dyoz3VpIuX4OyQuWzRzHVuHALCJX2Eo/
	 gSFW7Sj6u29sNgrZChYEC/NJWs1K9HkAeJ1clr5a8+DBwZkxY43mQsw/OR201nYC6qob5
	 uEVbrIix2TVJMc6Lz4f+EEe8ElFXa10y0hpXYQaCFB0CHvKKL/cS9WgXfitgvkQz+nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uBc/0navA/XNmaOJk7fHTE3AuIw2bivnerbrsG3pp/o=;
	b=qPt5HGVs22oCj47XwmYfRAFEHrCQeOf6kFI6bu34NKe0dpnoaprG51ltWvpav654LVaQ
	 ChwXwv1zFqVntFF6ImugoqKIRLNzOqX27EoV+x7jskwZ50q+d68tHj24abKfNRUkD0QnR
	 ZIOax3lPDYjRatyDk7BhPsKEfcRkjDF5dmXE72TPOdIc5FzTxB2KuP4G1rvsO9xN61Qjy
	 bKNNNpykNY1gCiNynG3I6gXMCsZP+szDD6moezWFHtU6123Gv1xaI6XDthBI4HHugJf5B
	 mI0U+AjRXuiUjRufgVAQoCb13/zdFWbDiSead3oW0wNgdHFSUmf+uXSf3m7OugYvsEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=x2RNRq6w;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A49606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A49606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=x2RNRq6w
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-386ab9ab619so10780231eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772670; x=1796377470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBc/0navA/XNmaOJk7fHTE3AuIw2bivnerbrsG3pp/o=;
        b=x2RNRq6wfsYCVD/oRhw3e74SQjyylIOlX0URS4iq2QaS74LPXRwYeHSL0frpEKKlU0
         4XR5DSblgtCknocR/o/+4E/bR5Apz98CtOZKJ81OEe6i2Rf758K0jFhACyqHfaUAukDN
         +7hE01G08ZnZX19AKm/WmRRKg/w+M1IWRxW5gUbp6DYdMUEqxELMBMZxnwGrBkJD6Fo6
         aOIGz+2uo5Kknc6Vcg6TuD5wKdUQScG/cX9dsl4i9b/IgxHAivOsHMuAsmBX7PBZktpm
         B9yKvH2RWuC/Jmk7Y/8PWMZ32DJqvk+sUY6n9abuVUVwE7W9xyzFoqj13jdEdYrLYfIy
         bq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772670; x=1796377470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uBc/0navA/XNmaOJk7fHTE3AuIw2bivnerbrsG3pp/o=;
        b=wVfD3J+3FvWkh3CIHnoA/4+ANHqhWFau1Gwm6D9iB/9fM7r3Pj13cqIDMt9SN23cdl
         7mlyczi1zhmret3lG0ZVNImrT/w3YfbuUeafyDBW3LaZYd73BKvWn6mmVxcXrLdhGfSA
         lqV1An4L8qVq5np3pndXMWDDxPoSxx7xwXZbsV+Wb4Hy2P2hIc3uhNl02LSOAhYI9YTV
         ucVHz2f9GKptMYuJ8kIvVkotPyyRf5UwQn0hy+gZyZjtI2QK7WKm9H2NcPlOFLC7S7ME
         NTRm+I7+Ujz6rFrJlvJxl++fcFwaRmLd+DGnXZJAJSlU64fQirUowoZdV/ErqjDSlaGw
         BWlQ==
X-Forwarded-Encrypted: i=1; AL+hErGoLVU8M4659YTKeIfCTtX0ynUcCgPPgUz7oKT/gV6yknC7DQfsVpO+pHywJSxb4a1MYaxxkB8DYqpm1C4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IJTQTMfYXhlAQw/gvLkKdOczKKEVVEqwuYrH0sLQStgifmlkx
	rGgISlTbXYEMl7VRXV6ChoFkUZCUKK4hZT8k0UlX4i8la/ISps0U/q2w27Vrva3bqlY=
X-Gm-Gg: AZFdTZf2zMs2BQkviOtJR69aB+0SmRv/9WBEh1km2ag+vUkbw6mA752LphVEJqlT/8c
	1nI8lnlt0xwcgAtB3SHL5ORlrr1G4Ct7GaMRGHfohAy60o01JqUwqCzrA1LepL+sIdhFUIHv/wQ
	a1LQzSh1qxwlaMpUA+K8nj83iNLZ6y4m5LjnnOm+cjyWRaGGMyQ/yU5rx9GD1vufXTtqOkegYFX
	sTyf9AQMLQ+APueF9qyiBGhl9EmVe/m76pezqPovBZSvR5sSQYAmSz6r31g7Csx3HlikJaoOGp2
	336Aoo5GSlzlLugB33L57y5aiYfkZcWh3j/nxpgAhm1zXLfoQCuF08z36Jlx1ipqXP7x6gRV+d6
	QwuTEbjty4WxfzuJDBIdGGgsfILePdIWFhG7qTJrZXCqjoIF1pHpJsIuNGytYuns2AD6O7ELwEM
	Zn/nempDUuo3YiUlv9Mb1tBceBCquEoN3O3BiMm4b6ZahgioU7o2YAGdrxoeo6PqhgLn1kqO25S
	xDyHsna9T8JA1LVZ7/IvIYxh9bpPI1VG2+k7I5KES5tJ5wTJQi74aWxTdRFDybmwMOJxzmZzKSp
	vZkKWSd7vjd+zL0dB+U3g8U+lgGP76jaU9XmmgLf3RNwMwMckQmec/PrcOiKHTWVfHbe98MXLqV
	D0INUtJ8JeVJuWTEvLk8eqx8Fu+FewqIGGeefORCuqxUQUYPe
X-Received: by 2002:a05:693c:6010:b0:385:849b:7899 with SMTP id 5a478bee46e88-385849b7adamr27832938eec.4.1795772669710;
        Fri, 27 Nov 2026 01:44:29 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm73935236eec.6.2026.11.27.01.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:44:28 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sashiko@kernel.org
Cc: ap420073@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	horms@kernel.org
Subject: Re: [PATCH net-next v2 3/12] amt: key relay tunnels on a union amt_addr endpoint
Date: Fri, 27 Nov 2026 09:44:26 +0000
Message-ID: <20261127094427.2962443-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179572061610.3135.16297939691113808529@kernel.org>
References: <20261125191450.2497936-4-omar@blockcast.net> <179572061610.3135.16297939691113808529@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 26 Nov 2026 19:16:56 +0000, netdev-bot+sashiko@kernel.org wrote:
> Does an exact 16-byte compare still make the per-source cap work on an
> IPv6 relay?

No. Counting per /128 lets one host that owns a /64 open the cap's worth
of tunnels from each of its addresses, and the MAC check only shows that
the sender can receive at the address it used. Eight addresses and the
default 16 per source fill a table of 128.

v3 counts the tunnels of one source with amt_same_source(), which
compares the first 64 bits of an IPv6 address and the whole of an IPv4
one. Both the early check in amt_request_handler() and the one in
amt_tunnel_get_or_create() use it. A tunnel is still found by its full
endpoint, so gateways in one /64 each keep their own tunnel and share
the cap. Patch 11 now has a case for it: with max_tunnels 16, which
allows two per source, two gateways fill their /64 and a third one in
it, with an address of its own, gets no Membership Query and no
multicast, while a gateway in another /64 gets both.

The /64 is fixed, not configurable: the cap is a bound on one host, and
a host that is given less than a /64 is simply counted with its
neighbours.

> The commit message only says that the per-source count "compares the
> same way".

It says what the count does now.

I will send v3.

pw-bot: cr

-- 
Omar
