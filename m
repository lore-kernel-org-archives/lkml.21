Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679917;
	b=H5iujfgvyGzi9ln6w3kuPcwGUVwp+I9GTSB3CbA1+2zXWtZXfIon2ys7ulZiAnnYo8Yz
	 9nnUYkE0W29jNlU1hfHIgTbEqJaCTFB7XlSTa6morWVSMHy1RsQxYm6N8wBii/Rr/vkoK
	 jjj7gdgLD9qk47+zx5bspzjf5FiOpEcxRVACuWU3N6yHwND1AMIqaEX3lnsn3XcNjwVbd
	 GmiFEUmJuT4dnizXZnCElwIihi5in+hilJBW+NSP6G0a0xgo5WFyvT5ATL5o57/K8JCQc
	 /d+FGZMNJ0mOf7iuvfX1Q8VDVTKBqOhKzPBMZGi9uNTZznYTxnRBES+i9GHJ8jcd1pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=0imkLVY7DR3yLBtUODiJvpCkS1WeOdOTe9PcrNGFWyU=;
	b=yoNkdsV/6yROUmYwg8AnZpd6x5to6BwE8VoK5BlIrrs40FyFfsWacJNc6VaUPVnlaPCI
	 XCl2Qvs8GutdSs+5fsaQhG9zG4IESxu9ZAkPVsoNWN/1ojQQjpdHI8FALw6RI7SkKPVzg
	 7ERps83g4j40a9pLVxwlLrTa/B+TKgaahFmxOyIEJGh3Yga2Iiy8OZeNyIwVZPwe2vfNu
	 ffu0QE17Wl3nnozZ+IMVGJFcJn4uLw/e2uOEVXnbZFdV+YpRTaB+CChYdTOeijLSJIK6F
	 VeolgDFEXdhOgq99b23oeVN0/HQMNzQNQpXYK1e/VSgGFLkW0w/looIjH6+sFV+1QUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hlAiLngi;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90115606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90115606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hlAiLngi
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4ad3d35e899so55646105e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795679915; x=1796284715; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0imkLVY7DR3yLBtUODiJvpCkS1WeOdOTe9PcrNGFWyU=;
        b=hlAiLngiIjdPD0sGeqtaO8ydBvxdi5tpGzWcIRLdpWvq9lOBk0ToAR4WrVLmTPDxRN
         0YrSu5rJ6rW03CQas1nzML9P0R7rKVzOwZjgb4RSH0v8GzQ2CHb8ZA2bg/Wr0IQNsyhq
         SNHxliL71dOXxe/dc5L3LsVr3pOms/A56k58Jwe/1ScigCuzDHS+L+4Dt9qcoFeUzJL2
         L5Ql2x9PWV6ju/kewA2Rd6id0FS6JcLPIHtLkXrC52xoAraAf10LowNNIfj1f0FbGvKt
         B1lvBg7RyCwyFbH2xzzzyCUEZT6AQOSASpvLHG0S8F9lk1C1tGstt0zcv/BB2pc11w0Q
         R3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795679915; x=1796284715;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0imkLVY7DR3yLBtUODiJvpCkS1WeOdOTe9PcrNGFWyU=;
        b=kuUCEASmW2fJW1dcYGhkjqx8iF+fM693+mVEm0zAmSjSzwl5RcWTKubCwfT8QvNFZo
         f7PuDeMhnetUVLQSi79zeOGoEbrDpgBppuKsiM93W9SMfHzPM295HfGhyVnRGLf06a2v
         XenoyZtnHnmLmjQtG6UctW2tiM0IsAeiEuIWNaW8P98kMrU0wdS4XYrTLSyYnNXvRDkN
         GXPayCb4gjyR0ELeBYxOx8cpAAMPFhMMjdAVISQfZ2dMbJnM4dPbWc1K336jh0yD/7gt
         o+qok+fC2CCk+v4gdQ3bEr960b6M2NCGw5qWZM59qZQcNt7suUcizKyFDb9yuqWMk7HJ
         IoRA==
X-Forwarded-Encrypted: i=1; AL+hErFMnxwlfFmcu5lA938282hJDhGCbH1leXv6yPcDCR5R+qK0UT7ToBMlUqjc8SIMGX0Djy3+RHY9fsozWwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xUtqBHa9SaS3PhWrv/x4UL8+ess5Z+tmYEKyDzB+vZ8U27UHc
	jKCjcefMUV9U0Gfs88BOZjf+anHtPS05NtJv6P/uV9SKsI+AEwu9ZySHIKBAa6rSj6RswxbM//a
	+bwONaldPp7MHEb9iIw==
X-Received: from wmcq5.prod.google.com ([2002:a05:600c:c105:b0:4a7:d787:d4a0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4515:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb88813b27mr421203835e9.12.1795679914758;
 Wed, 25 Nov 2026 23:58:34 -0800 (PST)
Date: Thu, 26 Nov 2026 07:58:33 +0000
In-Reply-To: <avIi7IPY5bVbxxw8@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102144532.123432-1-adhyanshverma2010@gmail.com> <avIi7IPY5bVbxxw8@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126075833.3414053-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust_binderfs: fix minor number leak on binder-control
 creation failure
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Adhyansh Verma <adhyanshverma2010@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 09, 2026 at 07:45:48PM +0000, Carlos Llamas wrote:
> Is this patch any different from this one? :
> https://lore.kernel.org/all/tencent_8D7B76C623DA3A29EE73D38217ACB08AFB09@qq.com/

It fixes the same issue, though that earlier v3 patch was never picked
up into char-misc and no longer applies cleanly now that
drivers/android/binderfs.c has been removed in commit fd2bc059ed46
("binder: rm -f binder.c"). I think this patch is better, so let's keep
it.

Alice
