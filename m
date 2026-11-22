Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795352495;
	b=cy3TdC71A5g8L0NNE52C78Syejqjip9pIZGsCj8BJRid8WawoZP6henkP7Wq1KL8CI5U
	 D6wOHwyIJUm33/JIKlRJftc8lm1rBlu4zs8QdxUA/CIB+g74Aaq8kcJAZW744sx/7GaRh
	 w/O/jOlkvErI1NlMm3Xdmi5OFmAUD+NjWi4vAwJlvy/wh2K28nccxmMAJ9v9bFBMW0BPg
	 4DIRCq8tBoFepnFXRQ9W2fqxw28WhNpyZ7QDeLz+YB/5SW6k2im+ncLOYWz9hmLHOOEWQ
	 jrXYTvvurU0tYu2k678rbj1mVDx3hnAlG0UR1Gb9m6wikpPcfQQwPZxBPKWiLQGiQIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=dgD6v1f8hqSyKP1pmrAiIRCKNp5vHibGV2DXdSb8jaU=;
	b=C/ENuYrOvOYeCMGGfA0epBG78EkvpLkXAdB399WAXe/oIp9Vu5OfAqZjCC+8dkGaUnEr
	 V7jwpo8k1NrA9w2onVl59/nNRUSLiNUV3pELrZCHRGgaXYUKLk0vCxrA38fWusj53M1OA
	 vxftNjmGpvgHK0EVDudRxfINXAYULdgzpjewdn2EZCSH9sL+BGJcu1JYFe1zV34//u2oi
	 nD2e3qzMd5ZEx5WrtJ4szZg44IOx6vlK8D+d57mYreNAhZTrjgAorUXyQtRLX2BjY1IX5
	 cstS+kb+jThI2XBRU5SzLUuHHXBnvRIWcFi8S2Mm/z4OwOGrU2q+/5AwKQfKbfgvU5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iv56wC3d;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DF8606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81DF8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iv56wC3d
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4aae099f5baso1060705f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 05:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795352493; x=1795957293; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dgD6v1f8hqSyKP1pmrAiIRCKNp5vHibGV2DXdSb8jaU=;
        b=iv56wC3dgWLzy/CUkTFg/rngzd0mZE1WGaSHNh4sVn4Khgz27rJXENPkXfj0YFWN7q
         F+QtZpXvyVOEKenuC5kxKqz5/qBg3Bxh1A99159metzO5UTkwn+UvvmB1nc4zNNtagnA
         TU0MWLVtYztOf+Wsfh8x3v7vIfFwa63ZJLh+Js+SSIVknlJj0vSkKoZt9pfcjwDGwEW2
         eGbRl7dv1E6j+SXy3iTjFyci7oqA3ut8q8dWGnVlzD0NpBRqgxBcVZpMCEIHEdNKOi4T
         FuIVi/cPemnemQkGPTTVgHpTOL/ECow56LvE7I91nz3RxEYEoJ1mDRzP6qBZRnua5SRl
         n4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795352493; x=1795957293;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dgD6v1f8hqSyKP1pmrAiIRCKNp5vHibGV2DXdSb8jaU=;
        b=dKELE0eT1i+wLykwSnOS7fmRQJo7ztEnx95R/NlFOnvE6eJjO2jv4VdAiZzaCVGIGH
         3GisZLE5djCqWjgzq9m4g6EI1UYfPEOqXq4SotdrJWCSNaEitNEMlJvVdQgStEMkT6IY
         9hGTCQDgwZP+uiiYx96Cwij6sxntLOIv3VKrRF1YrrMjY3i0wUf3AzZ2W3o8u9xPbnLp
         CUyziKow0Rnd/maVooQqBlHAJ0U7JWdviI0SqETJgodKaMp0Dc/doQ3wv5/t2+8z982P
         RGX+hWUWU24a4752Aaobftj2KKCWSbsEo2IyNvPYupD0EGjpi/hTmC19EkdC33LenXrr
         C3tA==
X-Forwarded-Encrypted: i=1; AL+hErGSbApouuFKiVvtmrviOJyu7Gm8QdGErNQDKVRJPmLV19lNeHZKCM+0s+HxyM6+UYeNs2hUxOjeNcKRcHo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bb9ZytIwCNFQ7OPV/t1IxtzlXkCsmu34393wXFh9Gg2M9Zziu
	PmtpXYTlVwJe0vHWyiJ7a+edyS/E6WcvzPayJJGqfS+wIwAQ7awFvZ9LOWFyi3RiLE5ns/2Nsrw
	1sYnrEbl1/dP8O6rKFg==
X-Received: from wrnv1.prod.google.com ([2002:adf:ebc1:0:b0:4a3:da3d:b9a6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:188a:b0:4a9:4dfa:c150 with SMTP id ffacd0b85a97d-4abb2910440mr16888311f8f.33.1795352492323;
 Sun, 22 Nov 2026 05:01:32 -0800 (PST)
Date: Sun, 22 Nov 2026 13:01:31 +0000
In-Reply-To: <20261020-b4-dev_query_fixes-v4-0-df66b4c98bc6@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020-b4-dev_query_fixes-v4-0-df66b4c98bc6@collabora.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122130131.1394960-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 0/3] drm/tyr: allow mismatched buffers for dev_query
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2026 at 05:06:44PM -0700, Deborah Brouwer wrote:
> Panthor UAPI for DRM_IOCTL_PANTHOR_DEV_QUERY allows userspace to provide
> a smaller or larger buffer than the kernel needs. Revise Tyr's
> implementation to match the expected UAPI behaviour.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Applied to drm-rust-next. Thanks!

I folded in Miguel's style and doc suggestions when applying.

Alice
