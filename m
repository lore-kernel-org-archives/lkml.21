Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103074;
	b=orDIrSY3a8z/7+jDMWCfWiqzpy0bjqU4/pFErIcQzgW2LCvX5XQfUIu58/3hW9NwbWRZ
	 6UrRzHwY3iaFeK6yiZa4aBKdExZHAiMkR0uXMEbApQLzoT6DT4VnYb3VfSEUFvDyggAu/
	 Z/ghlu+zakJfIUSjSyAYnHYBsD27uNH3wAHsb2HyDPAAtP6NoXmxS/unofb/EEpIsAwCp
	 x2C2Pft0PXuqhLqoK+heYeiffOLRAfSwjwYLI8Qn0enaK4hrPU7uHTh3FGN/+sW6CV/uo
	 0/Cd+jkbwElt1ISZAqAK1nMdrWi0xgoYzL85B0twFnTQti7uEfIkged183VT+yUU15A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=plRJXSHLssMK20rYzYBE8Y5/bfsmM0mbLiVQroO7VYE=;
	b=oKocAbyn5sqetiLmehY/Kw3U9Eb4EGeXCHz9ns0vA+357pWQEeULKIoifIpcCZJcRjp5
	 M/BK/kshiC7L0VJMcc5N0MVtx1vjaIqhRlt/Mbzf/uQFVoy7vpQBOtRSzQwLGWmfRsV8b
	 WfGozlGBKVylmjiIBRY1tvjyzgBRKl5dnK29BQJJR+2WEXlPOrxR44a26MAWXOM1AHVK9
	 YTzbgrFsKIhlXS9AAGZAXJ1zGlz2l5lWT9lNwpnm4ahba2OL3xyO8cm5f1trp/kmkyNMW
	 j/lljT39FOn+Jf9mvvTXdcwqdu/qUdWREC3vUzDw6Iqlp6AaEmdJiTAjhdUYImRLwpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dhYU2RLR;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD967606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD967606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dhYU2RLR
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-492b5408dedso1528510f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795103072; x=1795707872; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plRJXSHLssMK20rYzYBE8Y5/bfsmM0mbLiVQroO7VYE=;
        b=dhYU2RLRhjRMFqZMy8elmtfJ4dXKwFU/92H3dNdgTsuJ0MQFIT6TsYnnB/S2AILL4R
         ayus790DzrpTP+WsKc8ZxWnhLyONg4f/mN8VxMWpN0bmy1OEWK0qUUpFb1KFFIQGvVHq
         I98dQCEO0+yhPUXDFDUHnUlE19s8inIYRYCdcT4ceOaonhaVzcQfVigDyPNSs+8hcZPK
         xTEtKnm8+iGwU9hnFIPWRe9Z8lcpwBiBQALO+s8ndlTbbso6IBsIVch2yKy6ZMqirNV4
         3XpgGmg1be6TzNoLBHWy7chJp25wqGkblPOXOGqBVMmeoIpGBIqEiY5nweDY+oPUVVR/
         /Fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795103072; x=1795707872;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=plRJXSHLssMK20rYzYBE8Y5/bfsmM0mbLiVQroO7VYE=;
        b=TnL38kuUdyuEsDNEB83mqM6kQmR4RO3AJpKRELSmYzt7ZMGXxYRC6NCEIslpGOSPpF
         N5wI2mJQHJmhAa+wcF8nbscw+ramroxPlVuvYF1RiLpE9tw7Mo3nDmch6rsLF/7uil8A
         kPZwKTR8etjpCvbpF0H3VHFEj4XaY+wb3L8f5xk5g1R2I+ShqLDYYB6E5+FLmRmxbMfr
         H+cSCylTWVrYQzLRF+SaYdFyJPOZyhag+aMSaiBaf3B55S42iKjnkBCN5bJjWMSsSFDS
         tMwZtMsDBrBOGpL1Of2mljoRNe1xnfGfcSlKotlYyKuqUr8AMqRPUn4fYHdfmw2xzWp5
         XFtA==
X-Forwarded-Encrypted: i=1; AL+hErGogh0YTPbptgYgW17MMkQfeum2HahYA7Lkrag0Slb3ouzOUZHkjbLs2pxKbkqETWP+Nuadmx/x/DDkL2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dKW1zABFRpWtNn24jzM6+hw1XAAxaRg12AfFcbC+B1nheCA+k
	8IEHn0FFX/f8fztC8NwoMsNyPzfL1waDCDE4m0BhHuPIQmspvPdZPoPN3cf21Gk7Vfq7BczYSeZ
	htBglnuzcbTIIjM9m1Q==
X-Received: from wrsr11.prod.google.com ([2002:a5d:494b:0:b0:497:e67e:6f53])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f93:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4bb7da1c549mr137461195e9.16.1795103071706;
 Thu, 19 Nov 2026 07:44:31 -0800 (PST)
Date: Thu, 19 Nov 2026 15:44:30 +0000
In-Reply-To: <DMZ8NNSPL36I.15O2JQR7M65T0@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118233727.3147222-1-dakr@kernel.org> <20261118233727.3147222-2-dakr@kernel.org>
 <DMYTKRS80NRC.18PBQHK9SZ8K9@garyguo.net> <DMZ4C3GGD9U0.360KJBSFLEK61@kernel.org>
 <DMZ5HM326EKD.1I8KUFD65L91Y@garyguo.net> <DMZ6RL5X2UXE.33EY9MDLO2AJA@kernel.org>
 <DMZ7CHWBWU4O.3EA040FFBVCLG@garyguo.net> <DMZ8NNSPL36I.15O2JQR7M65T0@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119154430.918072-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/4] drm/tyr: name resource lifetimes after their types
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, daniel.almeida@collabora.com, 
	airlied@gmail.com, simona@ffwll.ch, lossin@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, bjorn3_gh@protonmail.com, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 19, 2026 at 02:57:37PM +0100, Danilo Krummrich wrote:
> I think in the end it comes down to personal preference, so this is fine with me
> too.
>
> Though, I'd use a generic name in the latter case too, such that it doesn't need
> to be changed once a second resource is referenced later on.

Agreed, using a generic name like `'a` (or borrowed-resource names for
invariant lifetimes) sounds good to me too.

Also, when updating this for v2, note that `VmAsData<'drm>` in
`mmu/address_space.rs` and `GpuVmData<'drm>` (along with `VmMapArgs`,
`VmOpType`, `VmOpResources`, `VmOpRequest`, and `PtUpdateContext` in
`vm.rs`) were still left using `'drm`.

Alice
