Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795008764;
	b=gth9PR3y0wwR7rm45yK14hmOSvDkqaLt1gN2kcryWhVFlC5CXZIRRW0QhWJEXj1ci8ed
	 UdJ+admK7f6eE0uv5DntfHXRtFQuh0YPSi7LrqaGUEZXfBy9fGd1jaxSe5t5h058mRcvG
	 cfrIjmIEiDx4AAoYcbTc5d4ju5fcbv0hXdt3i8LeRqPJbQil3KP4BC2YKW7X+LoeJUiXy
	 o6ILG5UDEAZzhl12vb0twGgUWC9fCmg7eNZd3CU/26WkpCiiDEIs+7J+60L8k2KY2+/Co
	 Mbjt4k/la6EK/UwrbYtvUG2hYhiFVRaqygNW0o7Onqhef40vwczkpYwqSmVfuQTABJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795008764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vARgZ4ae1GlRG7TFzkKePX/f+At6TdRa5dq48dnLYwg=;
	b=waNJ6b58ZMJuqK6hiyhsks7aSbrLX6WpuyyhNRamA4fqWOn+h/ifNMMbEzC0IKaD4PNE
	 Z4N1FdhBk6Qsm+qouFU0ChzuNmsXO8WKFt7DGj2M8dxkx40DirCY+BKJhvC7fjHMGW9jW
	 Pr0IKHA0nNoYFqk7WgwV3DNrcOQEqKCGFvP4FnglNNpWNELNFqDlfN4QFdAb8numXN1CW
	 3+X6PL+idvSne0sYAohn5Lrfw08iwOuOYouUMfkGXBF/QJnifLh56uBsKVuuEix4vJbbL
	 R2SI0bUOQPkZ+iPqPmT/jb892sxs6VV2uT0mbtZ9FOqFlCTxLocLvuEoKbkVJepS/+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0HGTCba;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7113D606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7113D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0HGTCba
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adef977ad9so9492121fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795008761; x=1795613561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vARgZ4ae1GlRG7TFzkKePX/f+At6TdRa5dq48dnLYwg=;
        b=R0HGTCbaAt0zBaWeiU03QdsUJ5zB3b5nl2+hCxiIpFJveWiSYRqck2FLSpimAl71oi
         RPVTb1zX7Td6eSZXvcqJ5GQakK8jQFlR/hqbdtNjmr6W14RYBqQp9Qf7VTht+2cX5Pya
         cIXOgxwaW8F/ZHlUlVj/L+S0rgjxMnPEHWVLxJQ5tqfP/tGgMBjUvpOptED3DDL7U4lW
         3EXzCsPngS2WxozP+/fuyI2WGhmTC5XbIq8jxRuPnQD/BPQhwA0Dw8UiG7aEeYmlumDl
         +viPvvBHNaO/ZrO/ivZlU9u+nT3uke3BXcq59CvvMq1j916Cef3BNDanSzP3gMtDoEYI
         I6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795008761; x=1795613561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vARgZ4ae1GlRG7TFzkKePX/f+At6TdRa5dq48dnLYwg=;
        b=T1Pz9vvBt8+dRweaW4zNsps+xSxKxJHXRj7DyKjgfRZRuAXCgTq7bTUiMl20LOylB+
         /AY86/CxY3I1Nm7A7FQO+gvlwWNHg1CosKP/lGvrnw6P2d0219J4bZWXefT7Sh/D/ikc
         tUviCnoIayJv72qrmQPNp6m4Zl0G3tcVzMMmtEZnsUPbzXY0G39z2Woqv87145nKeRvV
         AcCyMLLFaYcZwVy2dYh0fTBdoZ0WbkRXfMWxnEYxO8XH4Vkx8NiGhZ/xIva8NSvqfpS+
         0L5b5bPwif3Up2q2Ie+Ip0sPhN+JwOrkTEg4rxIXntFKxfspS1Rn/nw15zodmj3UVC3g
         xMpw==
X-Forwarded-Encrypted: i=1; AL+hErFvqsuV1UbXY1+OjNSoC291ttJdT60uXhVVAdCLIChYCRPAw7NBgRx3zDBg+DLa0xzQpkCx0/4iQ314flc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hMDgkTdfjX1X6IGAu7FP3+GVnIfz5//dDf2DPURSOn+Be4v6b
	Tu0bBuvpQT7SrAGtssq1Pe6sxBcjTFMvAZG5oZudHfzE9hQht9x6ooVz
X-Gm-Gg: AYBFou0hAMacnYet0AFnfQOL9kevIoZGx8VLT+JcWSzneu3LW0jTwncoQbiAK6w4xk/
	nDZVRBcv+uo6kEmt1J+NU++f2tmrWeKjgjpRiAKd7ybPtGiySAkQSi21rCNW1/oeleIyxH4FQxm
	5WqOtuGYwPQWCP56iTCXrJU07ztQQNXoS+XY+31tVauCRSVBk+IFcO16lzFJP+3fP04YiorQslh
	3cRVLl6w3898HA3Uy38i42kE2v3sS6Y68bnHDLXPCv2zHju/UlQQppppEHyZqba+LwGkAGCK9YA
	5iB9pGCzfQdEKa+z5OaNkGQYhmfkOkhXrTdg6OpgVMYmcqB+XFeSfk0WhGs6Vfed4ZvND4EkMsJ
	IvsB2332OZYYiYPf5kNbN1TIo68k6QSpEfDDawgRfW7JBx9bN+jj91+jh8IqelLtOlg30FyAKjm
	E5XIO83RZ/frGBhbqe2NBxW9wEN7MXW92d3bQj+A5eenqxrnDwlHGr3ArS55qYcAVS91lHdsZUk
	3sFNnIxcJMsJcP7Ju+zV1ygPPEiKUM2GxwWdrhzwvsrFs2vefe/j5a9DIUEneTyfnX+INj2WlZ2
	WEe8MoJKUHDHpzGhUEyad2ARp5RCXNP3u8bXvoa9IqUvINwA/RZJLF+j6pM9aEu/Xwbn4CzsGA4
	akY5qJiAHCR6U59b3UtflTYWwGP5y4ibCvhdBVXBGF7uTNdA/8JG/EmsFsqVgP2ztD9go4cmfhg
	f6
X-Received: by 2002:a05:6512:104c:b0:5c0:a7f:3ee8 with SMTP id 2adb3069b0e04-5c1a9d25ab8mr1067457e87.8.1795008761239;
        Wed, 18 Nov 2026 05:32:41 -0800 (PST)
Received: from C422HJQPQG-Fractile (cmbg-18-b2-v4wan-168328-cust3701.vm17.cable.virginm.net. [80.5.206.118])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a650d2e26csm4798809f8f.4.2026.11.18.05.32.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 05:32:40 -0800 (PST)
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Vishal Moola (Fractile)" <vishal.moola@gmail.com>
Subject: [PATCH] rust: drm: ioctl: fix call to unsafe function
Date: Wed, 18 Nov 2026 13:32:32 +0000
Message-ID: <20261118133232.48603-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.54.0
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

dev is created via an unsafe pointer dereference. Following the
convention, it should be wrapped in an unsafe block, but it is not.

The compiler only properly lints declare_drm_ioctls! when its defined
in the same crate as it expands in. Since upstream drivers are all
separate crates, this is silently ignored.

This has been present since commit 9a69570682b1 ("rust: drm: ioctl:
Add DRM ioctl abstraction").

Fixes: 9a69570682b1 ("rust: drm: ioctl: Add DRM ioctl abstraction")
Signed-off-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>

--------------------
Based on drm-rust-next.

I encountered this while trying to build a rust driver out of tree. I
copied the macro to an out-of-tree crate so that our uapi can see the
same generated values without needing the generated bindings.

Ai has told me that this is because the macro expands from the same
crate its defined in, which sounds sensible.

I see:

error[E0133]: call to unsafe function `kernel::drm::Device::<T, C>::from_raw` is unsafe and requires unsafe block
  --> driver/drm_ioctl.rs:77:33
   |
77 |   ...                   ::kernel::drm::device::Device::from_raw(raw_dev);
   |                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ call to unsafe function
   |

Plus a number of warnings. But warnings are warnings so those are
whatever... Its all silently ignored upstream anyways, so doesn't
need a cc-stable either.
---
 rust/kernel/drm/ioctl.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index 64af9eacc306..5a2e2f4f0e91 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -152,7 +152,7 @@ macro_rules! declare_drm_ioctls {
                             // dev/file match the current driver these ioctls are being declared
                             // for, and it's not clear how to enforce this within the type system.
                             let dev: &$crate::drm::device::Device<_, $crate::drm::Ioctl> =
-                                $crate::drm::device::Device::from_raw(raw_dev);
+                                unsafe { $crate::drm::device::Device::from_raw(raw_dev) };
 
                             // Type-inference anchor: the closure is never called but ties `dev`'s
                             // type to `$func`'s first parameter, which the compiler cannot infer
-- 
2.55.0

