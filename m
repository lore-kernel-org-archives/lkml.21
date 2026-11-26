Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795687378;
	b=NaR18Yr03aPOI/JiNby0ypOzSYwVOmXsUj1rh3tSXEUNMDhanmrM3u4InvNaBCVNZr6U
	 VWOE2Lj/uPdsrBWDWQLimA8iUT9xaIs9RYuL7XuAzVOWPuRg5N4mMOaGnazBS08E29QSR
	 uOUmLXUUy9mFwdH9/pygkRpBkFSwkHTJwJs6yotZnHS5Vi0iCAK7+exNHJ8y80rgcmcDR
	 C2fGQnesuSTN6vKCSt+LgjFWV1hmBOpra/B1oi/JT5lsAdogr9WOJrS74y8JJDFoLpopB
	 vd6G2YirE8T+uk1FR21NHPeOzu1pSDEpD7eey95bIjD245eGyxidcy7Q3SM3wpzBjQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=yz3Fvi0Z1WbpqBTLJfHCJBGO30gXD4l/AgDztFQ3PBw=;
	b=whnn3pAA4tB32yIlp1IR/NArj1gSbw1Xf3+4XiLUDQK1Rx4vDnssub2Oyi6Pr+yWFrFp
	 5X7w8OEM9JGBxgNXDN2T0NPDe6Djwt2f4/spWev3zHMZLJ6FGqdv5Ft4X4oZvWO3NJV+F
	 j8FFPewxroTohw7h9zEcDil6N1BaFKrEBAw4DbZRiXEhgFeTsfmTYjpeRqAlQAAY+L3ES
	 xY/IVsW+7mj6yhFjDcdbK4cHokX1cxL5UCvC/5pMdpvevA7MSS67RGaUu3q7/9tc7lbo8
	 5JDYhXUiXWeZ/RW/pwmvaHkLbtbLVxrMcdyc0FAKbLo4brc9hut2JoR8J1+AEMSEH8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E12EJywu;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333EC606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 10:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 333EC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=E12EJywu
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4bb67b2c00cso39186025e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795687376; x=1796292176; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yz3Fvi0Z1WbpqBTLJfHCJBGO30gXD4l/AgDztFQ3PBw=;
        b=E12EJywuUH6ee4wcIsNOeCHLhvkUSPi47vFotlTOk7NVzd/jcCJ5XZJgnrB20h8MSZ
         uVHkFgiIjTVJ7mVriiRSLYGSOiCEl6Ib7gqfXjOLQwBR9cHig6CrjVdTXU1rDrlwL7ru
         d0DN+98GEGIWwC3SrowP9VuiXXwCy7huemRr0wbM8IHRBxcodzsZOy95EdQEYOCgLzQA
         pwTrW/Er7CuVT/u8iojzVz+WQf8TfJDjQWjSM0Az4OCK6s59wlA7nao80PTRXkkYh6hP
         oLZP4C9vgSVARBjyupemQb0kPqolR2gr8C9bobAIlk3VMKvRGsJ13Wwx3cIrPu2j5y+l
         txzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687376; x=1796292176;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yz3Fvi0Z1WbpqBTLJfHCJBGO30gXD4l/AgDztFQ3PBw=;
        b=c77cCoTfTGxBOU3KYNdhViPruz6OY7nNnb2qTlD3SsRpdEbwnosiNBsi0+XcTLTSjR
         lnz8AyPcks7p96MtRpLIwm9r2Qz85P3LgkesXfqwWg0RtS2KQaMFERca8URYrJSdu/m+
         5A6IMIXf8Haf9J4aaq2guwYWEKCDO5LrHQh23me0EcUQlPPq9k1KM6PtAStiAa7s780/
         YLc+s7+rIdoY/nyLrDh7J8+K0WkJVJznti/379exDTuwnJJ2FWtxP0WX3r2WPfq96NMW
         wQTEndVTWAlcPxQU54+89SaEfTiUuQIaK2ae3oxPAxU99BJ/SaMqLwcqR5F6iA/hZWis
         4HYA==
X-Forwarded-Encrypted: i=1; AL+hErF5W28wv8sCokNT1+axnKW/jce30DaBLfzpt6iuXjoK/474oTwCT/Rh4fyH3KMV+1R1FCK8R28BtdRWEC4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E+MegB5DvB0JlM06lpigLIsKCH7zOci0WOW9fY8NJRsx+ys41
	sa8EyEOoGkwyFMNBi0m1WOP3hpfOnOo8t5CztrPwQwPHjTnGPMCzISpHWyTR4LPy04oAkTufOVP
	IcO0X4FUToJq28wputQ==
X-Received: from wrmk10.prod.google.com ([2002:adf:e3ca:0:b0:4b7:f63a:77e8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:600b:b0:4a2:18c4:61a5 with SMTP id 5b1f17b1804b1-4bb887fb6e7mr422669095e9.6.1795687376087;
 Thu, 26 Nov 2026 02:02:56 -0800 (PST)
Date: Thu, 26 Nov 2026 10:02:54 +0000
In-Reply-To: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125-b4-tyr-as-casts-v1-0-2b2f53164d86@collabora.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261126100254.3642219-1-aliceryhl@google.com>
Subject: Re: [PATCH 00/13] drm/tyr: reduce the number of `as` casts
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Nov 2026 19:46:51 -0300, Daniel Almeida wrote:
> An `as` cast silently drops the bits that do not fit the target type,
> and nothing at the cast shows whether that can happen. Tyr has 86 of
> them, as counted by `clippy::as_conversions`. This series removes 62.

Looks great overall. For the whole series:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
