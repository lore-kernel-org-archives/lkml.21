Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795778772;
	b=WBEHVW2owaOCd1SyKDfqEGkQC8n4EO2rvnPELKgy5WuAio5ayZqulWDXVinjZnbEqtbk
	 FVvH/HUiAN/M3BPTs5LdYQpRwyDfiS1SSdySOsnpWaiCRZvasQlY3RVLrn/AyIvMapRZh
	 lL1t9t+muGgpU9TnJkdLPzwn5oF81pHOaC6M8BK7e44uSzOuXtdwbk1MFQa6lWcknzoSz
	 YXx4QEEx1FDeYdH6yWSmgYT2kSsU0CU+pqR9r9VjiCozhz5DO/RFNUaltnXItDcLKdFGk
	 zzwDfVstwS2vwi85Cv0OJJCTxggeyZy/ZYoPUdjivtsKnzpy737EDwCRAFkHincvW6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795778772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=hDmEatNY2XfDKoZo8j3BqPFFbPxVHs9szs48QcnIzVc=;
	b=1K1nZjgBIvHvj/TaLX8NFIpkE1pWSOsDZsaTWD9nusSrnkdl7gf8G3CsFha5w6MOkXUL
	 LHC2XCj5V06aqWeQeu2cYf1iSKwloPSXg0SNnwu0Bb+NAoAtySLEEyRKxutr3LZY9rBYy
	 0t/6gKqgMpsIMougGg31xbSEoKYXr2DmHaJKlsCt4MPP4FF+xcGq6ZQjJrVhMZbBsNvB2
	 UStF+7mQQ3JhvLtTR1xAL2uvLADE8S6qI8LlpqaeE66UHNR/kVl/3yvOEFJS99vhU5xlM
	 aEOsFN1nGWPV9PQrLUlbP15pod9n8m/n7aLa6dF3UH9yB1qYgEBf9dQPs0tFrjgy7VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Pu0IUCuR;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B97606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78B97606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Pu0IUCuR
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49febef74e3so60324095e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795778770; x=1796383570; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hDmEatNY2XfDKoZo8j3BqPFFbPxVHs9szs48QcnIzVc=;
        b=Pu0IUCuR/qs8R/S1A2LCQgtBAbTaY7OuVLXe41ybTSFKDf2CN5EhSaXbhbcVsEP66u
         fdwewfntk84M2KGMnxgMhbLRjbwSav/do3j5KLXQFjDIteQzZHMgz8gnqteFcki+OmTU
         KlFq1eSfluQpBtu/BT4h+A7KvTTHKzYFqEoCQ2fJ9lUptULLGzcSSCALF9nntPzQw+x9
         adIJoOKT7NbuLxoLiGFeZIJOXDtWzVeiUGM5V+c+5ko9nJGf811ZffJkDwm4jlP1QhM0
         isU40DdhCa7WmRtukIUJ8aV2D8uTWSM3+3sUtZtp4zhrgeVDkpcn26j0TbWaU+eclh6I
         bRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795778770; x=1796383570;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDmEatNY2XfDKoZo8j3BqPFFbPxVHs9szs48QcnIzVc=;
        b=a+WkzYPtcnPLb3AEXb7FiL4kSP8sKIemfr942r/33Goof3c+VxWIHfcqh8NQjyW+Rz
         Gig9Gk6yzh0Re4/rcgssTWJd6UWCj8lhBuBrPCzO0yI0liIC8OJjIKSec5V1j4CNiEHn
         oiwoiFlYIq44QdvQWZuVsrjk7t6B6SuzL9vUwIxfx7aONXVqQaA/S3pzz9lYORiH3T+r
         GgtVUHs7NfEzZcrfpZqpNnVVQ+GLL/5QeLB89MnNdyXNytmWmWZitWy9Fqw0RlZ1EWLC
         tEwu8By7Fj1pSO7oS4cxJy7C9asYCQf+n4zQGtV8uVi4FMT+OX7T+6ZksBVkwk1f7M2W
         y4hw==
X-Forwarded-Encrypted: i=1; AL+hErGMvrveJrA1UJsFT8yAWhi9OKboLRVJbziG8AmyKI+/XPON0UJtMtCTXGrQHhrk8EQp1AjogGT4A3oeDhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sob+CzE1d14Dl8uXHHSeZ12zyQM0cF+Apvs3ZHzbcHh6a9zDx
	KH6oYdpr4NzyOz8jbKDeiWsCHMOXLOu6Sy/V2NEdVyvYLiXMUqGk1AaOZPEvPW2siIgoTTqJoqi
	OI0iK7ziBD+Zrjl/yMw==
X-Received: from wmpo40.prod.google.com ([2002:a05:600c:33a8:b0:4bb:76bb:3497])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4504:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb887fc396mr493239585e9.3.1795778769532;
 Fri, 27 Nov 2026 03:26:09 -0800 (PST)
Date: Fri, 27 Nov 2026 11:26:08 +0000
In-Reply-To: <20261127100846.67589-1-adhyanshverma2010@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261127100846.67589-1-adhyanshverma2010@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127112608.1537695-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust_binder: fix process leak on proc file creation failure
From: Alice Ryhl <aliceryhl@google.com>
To: Adhyansh Verma <adhyanshverma2010@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Carlos Llamas <cmllamas@google.com>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2026 at 03:38:46PM +0530, Adhyansh Verma wrote:
> In rust_binder_open(), Process::open() allocates and initializes a new
> Process struct, registering it into the binder context's process list
> (Context::manager.all_procs) via Context::register_process(). Because
> Context holds an Arc<Process> in all_procs, and Process holds an
> Arc<Context>, a cyclic reference is established.
>
> Immediately following Process::open(), rust_binder_open() attempts to
> create the proc file via BinderfsProcFile::new(). If this call fails
> (e.g. under memory pressure when allocating the proc file dentry or
> inode), rust_binder_open() returns err.to_errno() immediately.
>
> Because open() returned an error, VFS drops the struct file and will
> never invoke the ->release() file operation (rust_binder_release()).
> Consequently, Process::deferred_release() is never scheduled, and
> Context::deregister_process() is never called to remove the Process
> from all_procs.
>
> As a result, the cyclic reference prevents the Process from being
> dropped, permanently leaking the Process struct, credentials, and task
> references in kernel memory, while leaving a stale entry in all_procs.
>
> Fix this by explicitly calling process.ctx.deregister_process(&process)
> on the BinderfsProcFile::new() failure path to break the reference
> cycle and allow the Process to be freed when exiting rust_binder_open().
>
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Adhyansh Verma <adhyanshverma2010@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Thanks!

Alice
