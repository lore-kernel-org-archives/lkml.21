Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165609;
	b=MTQ3cGP5pOzSItOJCXscJeWFvnAaNAIrGmQmlk5m2/LYyd5bbrZLtu7npPH5J9HkXhVs
	 HItkt5egQ2ndz7evHJBjHbQuH1SvlhooZNWX82AAPOWGtpn94dcy4Ob077vBHBUOP84bu
	 Spks4qLHlF1CRpGKwZcUIC8Tp1+xCkzJlE3WiSccg63oUi89BG5XYtYA5r2BNedSlQg3z
	 /hVXRXPnNtXJa/YetnfTsJdms0aOpmGJ8vyNTxXkww105DWOqA5hL70L1Tr4/iyc5llRh
	 cYNy0SXg7P0uYrg9LALW+3mJ/bjSX+9rhbcAMHHbtIOEkIrTR3gn6LwULwjHaA6N7FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ozCjzkbSInbrmO6p83Z+XuWVCHjjnvkKYmiMfFEnSNw=;
	b=IHRdhSTc6h/FrTpSpjRisLibmP7C2Kd/PI9Tq7cVC4dQVH6hk3xgvwwtewolBlNMz3Aq
	 BwoYKjLstJmCh9+Z7uvbh1x46dSHKrDN8IMwk0txZgqUvy9M8OhCjwfixqQRoxW3iupU6
	 kZwyW2viwWrDuOnY0XomKKrUNdQ+nm2XBopoespR6ks1qFBchbdD1DNYiJtSjsNRRJgKd
	 xNhxlLi1yA8UTnOMKmpvSfgYTMt7qhxwtSfA77OJnzNoAMG36vVnI1etXpG5uEJY04+8x
	 jpGJx+FZGGsqZ54QJOQh7cg9ovIbkSzRLEFHx0LKrjJ5xrzw+z1da/25fzD4GaabIyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=GCD2hjdZ;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D31B606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D31B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=GCD2hjdZ
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so1110650a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795165609; x=1795770409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozCjzkbSInbrmO6p83Z+XuWVCHjjnvkKYmiMfFEnSNw=;
        b=GCD2hjdZOroT8tTzLKEL2/WPLyjNC0cJQArcXTpCrUikekFbskZpLeCMRmf6YqB7MV
         3m4i/DNiYHu8d1NJI8xg8x+RRefWXwWSzsgMvpVxLeike1/LtLJsBQ/cbSQb79oNSOnL
         s51d2U2BzIWROvxIYVQzReinWNfSTUl816fqetABWwpQc3kTLgiC6E92de0hQv7DrJy2
         vOGcU5eEst6vSJHITExY9mXP7ADsKt27BRrsAWFyUel7BX2i4hQ3zWfY/9vR94W9jRCe
         JOHwsePxxrY2wQIkEfkYHC3AxqZN0On8WrKUF9AD4jEDPUdoHvvPS6PFc2K/Ew3wK27T
         o1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165609; x=1795770409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ozCjzkbSInbrmO6p83Z+XuWVCHjjnvkKYmiMfFEnSNw=;
        b=sY1VROsPXONg7jWnIoTLIscDaeeqiUcwwQZtLndMHlOxLwy4HiLt+Vb2YEnJNKKfwS
         iYkwGQvEdDzmxAPoB0NlgPGk/unlEmVNUHR4Y3jbvZL6eF6DnzQ+6ECY9TxsVeEdfZYw
         Pzt0+28D0j4z1guhCv4aCuIKhj6+1UyzstHYijkcinkxcpo9sDJU8C6KRxli8Mqt5NQN
         4OcKbDpxX6CAiYVLI014jpngUZKGntt0JBuotJAkUu303bu0isIqt1GRrQPq8ZpVHnMl
         8m3PwwgLUM1HqFMEG1lOZUAbfXhs/YGQFjuqOaRIyD839PSBxi23hMyp9jec0IamRuzh
         +rXA==
X-Forwarded-Encrypted: i=1; AL+hErGoRkBEfq4EmSY8b68XtLQQaABnSzuD6EJ3z9ZS1FWjWe9y9Cw2gQ2T/ZSur9pTVuPL3US2t2RkTJcNT+Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DKKf/dg/hlDDYaInTKM940mHQV1ppxq8Nj9z8K2qb1oApNWnF
	ARLrQbY1C9p8ka7c8LC9zSYMDtqUAUyiAPPKbnPN/pDVMGKqyOeDdpu0X9ftKx+3qzRVk4czE4j
	Y0OrZDCu9dkUFtMW1Wbu/YBtAG0+C7YM//YncCQ5+PtUbCdBOOXre
X-Gm-Gg: AZFdTZciaHKK0LY2QjwgOpAJpp8eWjxyDF09TFq/n72vnhmqc/XMyIoRAX3haL2AaTZ
	3RNBLRDKO6TgL5Ypcpfr705VqDN+Zq/DDlRFfw5z8SOL2sLo0t5QOyAQ/Rr3DmlWzT7Bazo5iBF
	ADl2e3Unzb96qnIDHfUwsNcBcUlUK5OQuEXfmi1W/UxfCVKv6gkYbQdg4mQiINpDLg0RzXg1NzE
	hNR+czr50y1C7TJ3MSP277LEzLHgYjB/jX89LLmRmazIg4yXd9dUAZ6O0IMlTmkxrXTkNxKS5u3
	XjaGW5X3PeFR0YssTz10k5ftSfErPM9sSvGi0oC/XLCHZRNlDqmcI/X24kdf+yYU4031A5G1C9+
	wxcZclNUWl/zlh3wEA9VfNq3av/U=
X-Received: by 2002:a17:90b:2f8c:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b41c93fac6mr1505800a91.30.1795165608742;
        Fri, 20 Nov 2026 01:06:48 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d245549sm723189a91.2.2026.11.20.01.06.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 01:06:48 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Piyus Kedia <piyus@iiitd.ac.in>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Hopps <chopps@chopps.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xfrm: iptfs: bound the reassembly copy by the buffer it copies into
Date: Fri, 20 Nov 2026 01:06:45 -0800
Message-ID: <bee0a5cf-dada-479b-8417-dc3621109a15@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119142308.3272570-1-piyus@iiitd.ac.in>
References: <20261119142308.3272570-1-piyus@iiitd.ac.in>
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

On Thu, 19 Nov 2026 19:53:08 +0530, Piyus Kedia wrote:
> Bound both copies by the tailroom actually available and abandon the
> reassembly otherwise, which is how the function already handles a stream it
> cannot complete.

The inner packet that reaches this check can be valid: its first piece
arrives in an outer packet whose data is shared as page frags, and a
later piece in one that has to be copied. After skb_linearize() the
tailroom is only the slack of that reallocation, so the check drops the
packet whenever the piece is larger than the slack.

On ipsec master with this patch, a test that sends a 1200-byte inner
packet that way, 450 bytes and then 750, and a 100-byte packet after
it, shows no panic, but only the 100-byte packet is delivered. The
other is counted in XfrmInBufferError.

I had a fix for the same overrun and have posted it now, with
Reported-by and Closes for your mail:

  https://lore.kernel.org/all/70d0cc8d-e2ff-4293-a416-eaf2705a0b9c@mid.andrii.net/

It makes room with pskb_expand_head() before linearizing, for the frag
data and for the rest of the inner packet, and abandons only when that
allocation fails. The same test gets both packets.
