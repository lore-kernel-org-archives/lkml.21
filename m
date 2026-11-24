Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795522411;
	b=CtykqxNPZIF410t9vkU5jFFP9IEGvES4CvdWtQpJfs6AUrmaeoy067TZytiNGo2emSi3
	 szeQOJHUdKtVdi0LUmZ2kRt7KbqzIOAd00jxa9Zw9RScsaFbG4aSg5DES4ZYZMz7PgNbV
	 mmyeRDQoNjA2KQVacHYdvBGQishI92tMbm2QwDdxy787mHRxkQzzPCAY3PKA35qoR25PI
	 IKWgjI6bg6dAz3d9q/SJCg3U8Ph6WzJm//vIUnNzHZ8KAtes96VgSubcZ0xzZIc5YbfcU
	 6/dpE7Km0ZMQNM8vJwkxHzQIichydCg/DNRyr1UXFCGqG24ZNkNP7aApqK5YInAefHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795522411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=9txfLV0X7J+AJlocBX4pn0cSS8Iiklmn56A4kBLwtUM=;
	b=B9/XzAvSMEsJ3BmbmOWNi1kJmZSzzQSONFegv2PLGtdodhWXvO1irnPzKdpSb8MuaIQq
	 Lwgiw34sJxZOHaES3ZCLXoTlH6zjnO27NPZ4wK5j2M72P7sOWde1Oq1PE32QgTnFE+1bb
	 3mDZFi38s0mjRLB38B2hydw90pGs88cdoL1etapYk4+gVPgGFbh20w3f1IZPfxqXc6Krh
	 Pa9RbTdeVjQmz7e1rwhxirXRQsYN/EY2GC7uxKm+qyJ+2xwNyNQ/DP/1Rbw4NrKhHGsMf
	 PakvXotlguCsah2DbfuZ4kLaxe6+Ckb5DxbSa1FM5bV0TJL/d/d5II3GPfAOTESSrmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YsgMZmDi;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB16606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BB16606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YsgMZmDi
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb6bbc025aso34463595e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795522409; x=1796127209; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9txfLV0X7J+AJlocBX4pn0cSS8Iiklmn56A4kBLwtUM=;
        b=YsgMZmDiQbEqjVJRBimGhvLGwr9kzHj9glkDjgCVetBle1OrRe66JT2A0wAoDOJlVH
         3eKtFaYlR3COaFP7I/pHY1t8i9hQGp7K5EqlwMLpxS0/3XEv74X92iuLuCqG8QX6il7q
         kxoYjIvqquTnoKXVyJ72GFWMyDlIOjTrV1z04jHYs1a3vXYdoOUq2rHc8At8o4Dsn4MH
         e1YWey657bbBZm42gXftzDS94wKDaAbUCOuEPOmQRcTQgJzH4bjlgFN62yBYHdzAasdG
         14cuZ44P62LK117RMeK1ZJCVP9A8fBDkyM9/uACc8LIXi/lDaHSu6B4E9tl0HW4IX3WO
         77zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795522409; x=1796127209;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9txfLV0X7J+AJlocBX4pn0cSS8Iiklmn56A4kBLwtUM=;
        b=RvF6uBkHl3NR/LX0/0FwHkrE7d0/rFihyPhVwLQtarAqrejnUd2DIASZYvBfjKY1Zc
         cqLgmxtdrV/lOZYykL+e9FVrXdatf+ntci7fXVbxL+2kj4Ak4lBjIHLEsPgZOjFbmhMo
         y0fTqRwpd6XalHb0EFRKT4cdqaHY3JXQmaS7/nwFO2p0MrSo4iNAUDpl9AQrT892l2Gf
         AvBY1lJvhbeYly4KzRGEEmqK6Up4aeJudpq/8XfT9X9LhpoW1djPksxwr+gl9RMk50eM
         GQsDgLHK0wWhOs+zel9iRp1TXMJpx5+GAHBSQlOgAPkZfNMTR6RZSbkevYyRdhVybQCK
         zlBA==
X-Forwarded-Encrypted: i=1; AL+hErEuptzVwMiO9YNxLkm/bd93e/f8GgDjDKfuktV3xEJW3SR8yYfBzmGRDgzldfFtt/jjDjWiY4p2VtICRYk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mTDVCfDVcCMxYPca5HbHtsezWrO4zIgXOOzA5QdZQXDJjyOkJ
	YsYP1UagBSTSp8cX0949X4nCU+A7TY9lqQD3IoVux1j902/8ZRKG8rdrBmgR6+nff7yCuY0ydaW
	rz2JPAv0vOJLncAlMbQ==
X-Received: from wmcn6.prod.google.com ([2002:a05:600c:c0c6:b0:4a2:853:1e95])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:154c:b0:4a2:729:f7ce with SMTP id 5b1f17b1804b1-4bb8881c378mr304628095e9.8.1795522409266;
 Tue, 24 Nov 2026 04:13:29 -0800 (PST)
Date: Tue, 24 Nov 2026 12:13:27 +0000
In-Reply-To: <20261122191322.929005-1-inguyen@fit.vut.cz>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122191322.929005-1-inguyen@fit.vut.cz>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124121328.3253693-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust_binder: only remove a node from the tree if it is
 still there
From: Alice Ryhl <aliceryhl@google.com>
To: Nguyen Le Duy <inguyen@fit.vut.cz>
Cc: Alice Ryhl <aliceryhl@google.com>, gregkh@linuxfoundation.org, arve@android.com, 
	tkjos@android.com, brauner@kernel.org, cmllamas@google.com, ojeda@kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 22, 2026 at 08:13:22PM +0100, Nguyen Le Duy wrote:
> --- a/drivers/android/binder/node.rs
> +++ b/drivers/android/binder/node.rs
> @@ -636,7 +636,7 @@ impl Node {
>          }
>          if no_active_inc_refs && !weak {
>              // Remove the node if there are no references to it.
> -            guard.remove_node(self.ptr);
> +            guard.remove_node(self);
>          }
>          drop(guard);

Nice catch, thanks for tracking this down!

Instead of still running `do_work_locked()` on a node that was already
deleted and checking the tree in `remove_node()`, perhaps `Node::do_work()`
should simply be a no-op if the node has been deleted?

If we track `is_deleted: bool` in `NodeInner` (set when `do_work_locked()`
removes the node from `ProcessInner::nodes`), then when the stale `Node`
work item later runs `Node::do_work()`, it can clear the `delivery_state`
flags and return `Ok(true)` early without entering `do_work_locked()` or
touching `nodes` at all (and `Node::cancel()` can skip re-queueing a
deleted node as well).

Since `do_work_locked()` only removes the node when `active_inc_refs == 0`
and `!weak`, any required `BR_RELEASE`/`BR_DECREFS` was already sent when
the node was deleted, and no new references can be acquired afterward.

What do you think?

Alice
