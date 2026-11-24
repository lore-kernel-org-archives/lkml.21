Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546438;
	b=C6qcc8vCQukr4sKiv0Kdwj63DuyKeuNUqpDJRuoLIOK5rm2XWZFLY4Uqngf4/bSzJBnj
	 toX1M9yGL9NdTrhYaibrKSFLt+ydepfczm3C0dL2gdMx8GTAtr0VJdHj9escLaWPUYX/Q
	 nPyliUpPiXtmS0mCCTJa+S5McXH7rR3txQM0UBkfDvfIoVy52jV7rl7C/tHMbFN+Yg4Gu
	 IiLAnLfhMrqdD5Djppy6Bk52HJt9WkG9lqEpEG6IYO+T3MCElFUPDCh9lLKW0PrLgf6mx
	 klnFbPQPSzywXZfPSSJWCIBYk6vooCIE5FAyMToZ1+vfPOfWw3KLyrgLlMhbuQg6KRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=mL/gxZRbqEoO7PWsAzrzJCRp9tsO2oUCEAYKIbDqaTE=;
	b=qRXXW4n8+cIWMi4XqcG4JORpo6XRDK2RAVaJ6KJUqlVZi8f2jolZQ0yAf3Fouu0TvKTq
	 MY9AhM2jWq8Cgbhr2d5lfEiEMG63hHyeMXNWGBwROcOMVjAdc4Sow//rTyQLB6DnQ66ms
	 5FcHmTpNodw+ObKq1b4U9VzKFk2Q6CCZ9l1Mb1obnXOPhXgJxya1KaKqmsxWCqBdvECZi
	 +2D2XxrbDXuTuB4OXtP4ojbdDmYm2KdNTqGfnrECJJLV29nWJRitnC+PSNKOlkcsQFKN1
	 xhtKoHFXfi+ES4EX397VqKtEMYH6gS7P/nwuSrKmmNqSEzITa78a6jnceg/0oQCJ2pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F+WAV8YJ;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FEC606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 18:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51FEC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F+WAV8YJ
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-49090fde23aso2995848f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795546436; x=1796151236; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mL/gxZRbqEoO7PWsAzrzJCRp9tsO2oUCEAYKIbDqaTE=;
        b=F+WAV8YJ1MJL9kRGEi2wZ18e4jKibp9jJ7DEDYHEE5w5Ib4RSvUVan9OEGO3u64jy+
         NSaVSYCs9cGpS68g8HaoD1cl+0t189rUCiNQf9cdQSYLic/gfk1Vidi/t7th4XrKSSCG
         uMMvpbYNmfdfghxXoJLlC9rZbJXOiKLDrAnTzv/xnwOiq3s/2gcoR5aTtUXEhBYVYVCF
         0/cDT6FUsz+yDEFYLb8pA82WkEUf3Jf+XvkP0a48SDcsvwRrpxkc9KjgPU4Tlljo2gjM
         zspNEIQ6G9XNcOAZvSBkG11sWRcEryANIumPFQu0VHRM1CYcPQUi2q1EFpOprh36sruc
         cDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795546436; x=1796151236;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mL/gxZRbqEoO7PWsAzrzJCRp9tsO2oUCEAYKIbDqaTE=;
        b=hQgyVNbdJteeBQsAFc7WpGvmxG4xszLlSVk+3ef5drJAvfwPuqiBV7i0rOhLUIThyz
         lSe/SXWjFECH04Nmatw5G8jji2+xKFqPrANfzCxt77iUQQscU5N9ZN3F96qqkRQszHkX
         kKr9vjO8YN2L6tzKcYWvN+xx9nt8X7iFwi4fkM/R4TXVI3T3yU/cNZP8Nwxk/xv8OnSH
         jV4fKi8X6joWzkBZaKwSYiaCY7iNwqQwlomyIfq0vfT7lqATbljMyeBB6be7m/QQ+Doq
         NyaCHV8XYiYwEPjvvCSsaKZx+eOQff7072qt32zVV8glbUOZSFjrf6Q0spPQ8QS4J9f6
         oxOQ==
X-Forwarded-Encrypted: i=1; AL+hErFmzoe9aPQgosYXgoR4TdG56Czof2we6nqJOmNgr0514ha07jYWd5i8Y3rA027TboW9e1ivYgpkT39kWpw=@vger.kernel.org
X-Gm-Message-State: APuU4Z86qu8EsDA6ne30693BbexTGuzOc8t1zJs/B9VDbDznNey9XG+i
	F48NBNYA6rsn0cQZA+Dz7K9TftRy4LTEIsrLOLI2dKDx01BMoW+Km3L22OCmh5yGLEN4OoXStFi
	h601DQGxPQa5M7pSWEw==
X-Received: from wroa3.prod.google.com ([2002:adf:ed03:0:b0:4a2:f12f:819c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:6f05:0:b0:4ab:f5b0:a7ed with SMTP id ffacd0b85a97d-4abf5b0a91cmr28429904f8f.12.1795546435440;
 Tue, 24 Nov 2026 10:53:55 -0800 (PST)
Date: Tue, 24 Nov 2026 18:53:54 +0000
In-Reply-To: <20261124-perf-binder-local-work-lock-v1-1-bd8de1a840c1@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124-perf-binder-local-work-lock-v1-1-bd8de1a840c1@gmail.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124185354.3821154-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust_binder: Reuse the thread lock in get_work_local()
From: Alice Ryhl <aliceryhl@google.com>
To: Peder Bergan <peder.bergan@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Carlos Llamas <cmllamas@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 04:04:27PM +0100, Peder Bergan wrote:
> get_work_local() takes the thread lock to check looper_need_return.
> When the flag is clear, it drops and retakes the lock before trying to
> pop work for either a blocking or a nonblocking read.
>
> Keep the guard across the flag check and the first pop. A blocking
> read that finds no work still registers its wait before the condition
> variable releases the guard, so a producer can wake the reader.
>
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>

Looks good to me! Unlike get_work(), get_work_local() never needs to
acquire the process lock, so dropping self.inner between checking
looper_need_return and calling pop_work() was unnecessary.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
