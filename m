Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003607;
	b=YQ4uzgbicW+EPdzEo0N1+hhVhWuPKBz6NlJw7VLVLaapN8pWdD/430YPfxatQjkxwgcI
	 OvUgKormrwlr57kzA8oW8pT10UU6y9402zM2/PHdjdUwx++BuvAERwqWhP35hiUkMTp0X
	 eCzLTKbbpRaQkMevOpCJQeHR/Ek4p6C/CMVT9X6FTyrDT5/ZL+x/2V+8/liRa5qL5VPsC
	 /d9PAymihqtgDFX3osnDKJE8eMqJI12Q0MiXJZIrbr/9kWRqmDWUFkKOE5g7x61fghQ9d
	 lT9LztlFU7oTjGKiTZ4C6r3ZsiCPiafj9bvrr7PtcbSiaDhIrUuxfsGWrT9FSASuOsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=kp5w5RDq527SICD8D5Xw9eo93/nbQAeR3FOsszsY3AY=;
	b=1MoJLPbVDOOitmfCXoj/74S2rE49Ob6tPH9u5bJi1bElzingW77LAK1qIKgg7W08dX6u
	 Nrx+zUvNt759Pr3pFyp7HY2uqi2RRQGupi3B0My650KNpsXwFEzLhOdlCj4YHvGiUqFDV
	 aHHdWgWu1A+4n0gvxuFaI7jzVMbcdrga+k41JRAavDzdwdTfjImc2b+c8C3tBx/7FoTen
	 U6zLYR+ZhxWSAoBKa2z9A3x6i2psp0OlvzSOGc4EO4mbtefC1s3Cvcrov44DdGAhHLMAX
	 jyRbhRCZYiFFn0bQaPavnF0BQX298ulOHbu1Pf94NCEbP3Am1n1RGOHBXNwmT8fHzAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JKXd2vEC;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910CF606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 910CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JKXd2vEC
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-49337a224a8so627502f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795003606; x=1795608406; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kp5w5RDq527SICD8D5Xw9eo93/nbQAeR3FOsszsY3AY=;
        b=JKXd2vEC/2EgcPBcdZPiioMfmgmnXvAQtXNKU7KZj8KXVavvRTaWwERFzNxL/euf9A
         wb9wdYJxkkK9pVMcFhfhYnOnWbBq0xbmGJZ51PuoHdYFz3Bb1sPT8t4zBd2FklxZWHWe
         WEukuTJtJAZqL4SKF2Gk2VRBuLKE75Rn0DD8qbKQVSt8eb7ZIZozBpt17jUsHcLwOZMf
         x43tBv6r9daMXqH7vbjRKE8H8X/qxvNlRWpOnciOxxTNrAxoPqOTe/mi8GC7hN/5JmO4
         uyaZJXKoe33qCW1QnMOhshO+1rxFcWUSh+vhuPZSvJE9X6to1Tua6YJRysi7XntV5nVo
         U03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003606; x=1795608406;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kp5w5RDq527SICD8D5Xw9eo93/nbQAeR3FOsszsY3AY=;
        b=zj6FtMXQvRhK08pZ9u5S1z98B86SoYUepThW0u3xd8g3CUmZabVmSQylOG3fLYxZrF
         s+Wka5TodMVTsmXPNPAVWLIjRGTeCdIZgu0ZDo/IWNxW/95QeGdjsQGtQ5dFDaLqKOuq
         JD5cT2m6w7STjRykHcycXslpytKyi+0Jv7927ZmeJI0G0Es5rRs8q5AjqPxQiBYon2Cb
         pEpLiZlkLMnVOG5yGLMgVBHxu/cdJEEt4zrxxVkhj8rpQ+0ldK4+Jhcvp8jS36RObSP+
         Yu81PI+1KfeJSw8luNfpUylb+DQrfD9zcA/o69Or3mRZ0A+d+kRpfI+7rCXt/yBzZQYE
         Pu0w==
X-Gm-Message-State: APuU4Z9pW8DyXlKJuu/kzkBQ5MWAmN/7HkLhyJl6JjeZE/5KzZTydTwd
	Wa766BpIq8FKV4XgeZduNPrLMcTrJq9SP1SvmpK4piSG9s7kOebiyglLAZjwVi18WQJeRD2ZE6F
	smNQo/uz1y+3QIj2voQ==
X-Received: from wmih2.prod.google.com ([2002:a05:600c:1442:b0:4ae:7292:22a7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4513:b0:4bb:68e5:b952 with SMTP id 5b1f17b1804b1-4bb7da187c2mr43604775e9.16.1795003605603;
 Wed, 18 Nov 2026 04:06:45 -0800 (PST)
Date: Wed, 18 Nov 2026 12:06:44 +0000
In-Reply-To: <20261113-tyr-reset-impl-v8-1-2ee298ac9808@onurozkan.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113-tyr-reset-impl-v8-0-2ee298ac9808@onurozkan.dev> <20261113-tyr-reset-impl-v8-1-2ee298ac9808@onurozkan.dev>
Message-ID: <av2U1FflKT1mEotg@google.com>
Subject: Re: [PATCH v8 1/3] drm/tyr: clear stale IRQ state before soft reset
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, airlied@gmail.com, simona@ffwll.ch, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, boris.brezillon@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 05:32:26PM +0300, Onur =C3=96zkan wrote:
> Previous reset may leave the reset completed IRQ set which can make the
> poll return too early.
>=20
> Clear the IRQ first so the driver waits for the current reset to
> complete.
>=20
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Do you want me to merge this now, without waiting for the other patches?

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
