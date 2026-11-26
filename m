Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679918;
	b=19SoX7DhCpY9pUFr4/hM5YY7tBkAwAXsgRZasBycbK+eysAtZ8pjMIvESUEHksq6GTpH
	 QCtKvPUjzZQ2NXnNzgWE4Tcfx/pwX3VKThvq4ij7tpgpmUwHst2p1i9frTe9i2isdujhE
	 hQQALHduYp0Vxtj9WfEbHyFZxMMQOLL8sf2qVc42u4+CtnALwdfowwptS4fXbZnWJeS2N
	 dm+u/f1HjbowDE6AluH4BJ6y7a0ArCh8dt8muR7LaGbp2hiNJ/u1PaKKIUqdX4ojHVVO1
	 0euT9heqwAI7WsKO7eTymbzr8mZsmg7bRkvWnPvJETmQrU0af3P7djjpywMYyKMJBnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=PZYKWQ0p95TfEQsySy2InAwQAnvwm+Hixm35KSn4PUg=;
	b=rhmzf9gUEbUgkcNl48dmQ1T6EWOT3smfN9MkQHp+8qviHaHkkIcWQjigKIN/Lba5Glt3
	 /eFCaxTFS6noiD1D1x/IAQ5AA0Kj0w4lEyPBW+2PRXxgCIfpzQLdhbDyuolrZxL6yiaxA
	 Cy4eb7LeSTTCwd+2oZTxrDMoOQ2MeTtlACZ/6EcO+nwbIYGpBGMtg5otYR2YdkPF3MwvY
	 vOVsSFboJhGD6OPtmRclla1PgQzhG0KQGo2YoSbe2rVJYq1lzoYFvfsf7ZjfbtiozCXzd
	 9Lm4BLnUZVzsJ/b8NzMCYN1kv24Lqot05smH03yq1GffYarbagUW4bL7UOvyAYs45QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UBR0+9td;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2FA606A33F
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F2FA606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UBR0+9td
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb6bac1e84so43709435e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795679916; x=1796284716; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZYKWQ0p95TfEQsySy2InAwQAnvwm+Hixm35KSn4PUg=;
        b=UBR0+9td9ViLJD3dofx+KjwwkGL45ja+6P/VYMyZ2G4jiBo1GcLKuwimB6/xwx7xyx
         sor7GtMUN/JlKYZaajAJZVMOJubjw8PDdGOfEsTizXdCHuPe93B0w/9zj9BVTu5ziqLE
         rDE6pjIkkT5oKmnz5VbbTklrcuo+9lg/VgHuc+Ah8gtrq88fTAp7Z7DzJw6IyZsMsnjr
         /0EKBiBozbZrihSb8kJbYSjTf23vZYi2ym03qEGUARlnBgJ0eot6S5FNek+SGtsRhDyA
         13t+wYBGAKl5Agrb3rN5M83lxrGIgpP5SE/Z7wYJ3vbnD7riGMe2Wgwm+yQxbyMd1f/v
         /iUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795679916; x=1796284716;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZYKWQ0p95TfEQsySy2InAwQAnvwm+Hixm35KSn4PUg=;
        b=GGixLLwDjJgpyN0wvI0wTiOOZPFn42kAUBNeASUmNIWVIvQY3LlMTYE+JcK8qJmfAi
         V6Fjxm5os73vhOZCiYu19kd8pdFtGFHf0H4HmjvXfrrJJrLpj1+V/TdqLzLYS8UOIZfy
         NecPmzCrEg/GibTC/2dk2ztT1ZBKwJtn9ctnuwIlBItuZuEBKQfbX6c5CfHmW+5AyQuV
         RXdgYyQS3pu2GK7DC0WdMdcNLRRAJm2tPx14TI39suAzJ1UJ2um/T+gtCFMla9A3Is8y
         Kt6LTKV9gWvzbDgiJujiuhkNs+AZP7XfRlVpmwYSM6ZfGGqjN/5/zKU8+ec0w2tr/1gF
         5hmw==
X-Forwarded-Encrypted: i=1; AL+hErHjkxjyYHCljK73kviqtJ3MUhn3GDA8Ep/1EbeJQP0XRcjlonXZ38MLcuWycSpcnTieDPwWr6qCNTucNsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lkBLZ+ky0ECVR2+bEUwuD8DdcN61uSraoTdd4veNT8+8GOIco
	5xp+MEFCu6xOVUDwDoLOgywYhuc47iDj4VDC5SC5Je/hTp9Hesu+A6fqhX0+Ol9vXEEB0+6wsNi
	J+dGoZkazBIPYdB7mcg==
X-Received: from wrbdf15.prod.google.com ([2002:a5d:5b8f:0:b0:48d:ed2e:b1ed])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46d0:b0:4bb:7987:fbc4 with SMTP id 5b1f17b1804b1-4bb88817eb2mr415191855e9.19.1795679916051;
 Wed, 25 Nov 2026 23:58:36 -0800 (PST)
Date: Thu, 26 Nov 2026 07:58:35 +0000
In-Reply-To: <20261102144532.123432-1-adhyanshverma2010@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102144532.123432-1-adhyanshverma2010@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126075835.3414193-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust_binderfs: fix minor number leak on binder-control
 creation failure
From: Alice Ryhl <aliceryhl@google.com>
To: Adhyansh Verma <adhyanshverma2010@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 02, 2026 at 08:15:32PM +0530, Adhyansh Verma wrote:
> In binderfs_binder_ctl_create(), a minor number is reserved using
> ida_alloc_max(). If d_alloc_name() subsequently fails (e.g. under memory
> pressure), the function jumps to the error path.
> 
> However, the cleanup path only calls kfree(device) and iput(inode).
> Because inode->i_private has not yet been set to device, the eviction
> handler binderfs_evict_inode() returns early without freeing the minor
> number. Consequently, the reserved minor number is permanently leaked
> from the global binderfs_minors IDA.
> 
> Fix this by introducing proper error unwind labels so that the allocated
> minor number is released via ida_free() under binderfs_minors_mutex if
> dentry allocation fails.
> 
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Adhyansh Verma <adhyanshverma2010@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
