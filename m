Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794989194;
	b=gvUbVUTTEoNuvGEKWKw3ULllWtGBhhrPhpctY9P3ObOgx4DJP/eBNLZ6s3ICqw1nSC7K
	 4JK3pqvnxakE+1F7xtbysfQVy2K170CJKYfftsyb8bzylUsGVFFXkmeAaxetAHO7kbyB6
	 QyFr82tc6NOMZbJvyR8ccKSXf0j2LiCmJueln6FOP34nQw7eGvTX3OhyN5hIRl+04eEPi
	 MPATQQEEKCe5AzEgIMApA3CcntBrUuJtEqImaXAkv8vx2xXC7LX1OuFRYbnnCh87eUs/q
	 jYnaiG8Cfidj/2p9zLLSNhieQgB2KMIsc4kinTYZi90eU0ox9GGodU+bT1/0qjtnczA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wTwgFeI7gQ6N9RjdGtOM+dkxnAdtOrsW2Q+npaN7whU=;
	b=ny+QMlxqfpqnKDXrwkmLrdMfXnseEKb+f28SZik+PUSWOWsBz2a4ViD6wV8BvJd+FDPZ
	 bT7A1qlJYjwLGXPH+v6cqJxwbt3UE117QwkpttucDRD1uwoho7lD3PXac8+PKhtgCZ+A4
	 mqaOvpS/tnyJL0FcoMu7ZwNejOB7QHDHlCAW01bUKmqrl9lwTKRwx/YHYn5yLmgLJ7hww
	 gC7TeXwrSdDABK4Ukgrbaq8KaWduBpC7IKR+kkakA4X44bD2805bbPwqdnRxAA+vu/O2t
	 OhsnzjWn6CtgGKkfvjWYcUglydXJVmR8Wg1y+iGiOzZXL/S2zknT6TiNRzthbE0il/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JVsrIND0;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DBC606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:06:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40DBC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JVsrIND0
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4b764ffc014so5236125e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794989192; x=1795593992; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTwgFeI7gQ6N9RjdGtOM+dkxnAdtOrsW2Q+npaN7whU=;
        b=JVsrIND080oRpPZXlP5D1BFddSwOo5gdJSabFFzvRCGyT//1U3vzHDzAAHuvogCrib
         KdsQ6cVBbZkLUbfCA8bGSiCK3T/NYs4/ab2xVB3Xbwf90Ngqj1DtIvkpz4b9c0ne4FTK
         bp9GEkBAKMAXlKgnQWPzlodnAiId7JQkVYH0vTtQQZz1hYVVvb5zPl/VgybJ0NlAG7Y4
         f+hJGwed7Ry3ASvSpr2lxjaz2/ygb8GgzsyEqQi9yt5/SGo8raxKdh3GanrrDDRPGuRh
         gCMWqoNuR5xhC6nxH7ya2gxy2P8Mi6g8QQ2bquZGv1QlnUcoS+8WQusgbNFOtBFVfjC8
         50pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794989192; x=1795593992;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wTwgFeI7gQ6N9RjdGtOM+dkxnAdtOrsW2Q+npaN7whU=;
        b=zvKORPBddYerSNY+HH/wxQEKrcFYx/1m29EZKrO4Wpddd9rzQSZN3pVGXvsgDubWjG
         qCOvBjPyKi7mZXoUh2IS/+GBycu8rRl5bBZcunWLV1V8Tb/xHyaVwiTSncth87jjGWtM
         gLJrNkx/yFBnR6IvihavCOfylBuBC3lQF/CshmmGR3os7OhIXEmqFncHCaqRqj52kCix
         EC/OYp/xxVwfGahHqhPLd7WErfsDOI/DqavgCKC9TCXVMJWeR4rsWmjXsctrg6sMmHpn
         24keOj7wfOurziC85py6ugs5Sr4M0YxLAteg5wAi2URXWNc8Td4snJURuldwlxO0mWnk
         lRFg==
X-Forwarded-Encrypted: i=1; AL+hErGBJF5lRSR7y9Jsl5YGn5ifu4bqRe9ibeFeKCxGtsmwY1RuIY3P8IqXXE5cOkkDSUXJ811RZBOlvroxbUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RkhbgNp/j21eTSMElsBvAeh6XWd73q1rQTyyZlgAW6TZNBAMZ
	CgSXPlqlzsUp0cnICOOZyFmgpj+EIf1tymg4xTSJc7r6ZZIm3WP0U4zh3b/1RKsczxhsDWmdY8Z
	GWyLN58c7xTxl4EtHHg==
X-Received: from wmcq4.prod.google.com ([2002:a05:600c:c104:b0:4bb:52ec:7054])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4583:b0:4a7:9025:5c3b with SMTP id 5b1f17b1804b1-4bb7da2633emr32108295e9.19.1794989192307;
 Wed, 18 Nov 2026 00:06:32 -0800 (PST)
Date: Wed, 18 Nov 2026 08:06:31 +0000
In-Reply-To: <20261117233901.2212899-1-cmllamas@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117233901.2212899-1-cmllamas@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118080631.4094963-1-aliceryhl@google.com>
Subject: Re: [PATCH] MAINTAINERS: add rust-for-linux list to binder
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 11:39:00PM +0000, Carlos Llamas wrote:
> Now that the legacy C binder driver has been dropped in commit
> fd2bc059ed46 ("binder: rm -f binder.c"), drivers/android/ consists
> of only the rust binder so add rust-for-linux@vger.kernel.org to the
> ANDROID DRIVERS entry.
> 
> Signed-off-by: Carlos Llamas <cmllamas@google.com>

Acked-by: Alice Ryhl <aliceryhl@google.com>
