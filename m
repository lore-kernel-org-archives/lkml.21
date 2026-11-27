Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799738;
	b=nC5tpjsQWuDGvsMIxV0RedMz3DrIVOm0KiH54XAQR7L1RNjtmYLwDXGvAzxm6iD5M42D
	 uxJSEnp+bqk6NCwkQr8r+4ntH+7FSrGRSmH0mOd6XlK4grEcyV0laemeA6rlWn1FRvhKE
	 PdUtfHtn0LN4V+858cyuMNHZ/HsvJFfIb3mgQHhuXskcWibBL3MlD7xZz9eQPeBuF51hJ
	 Mb0K23BsLT0jNItNWHDQaV4uqsydi2ItpzrXQsusnDE70d9Qx58zm+LPjLBf+oLbZ5Ya+
	 n2lAa+o3ClZwkUczo8dKvEoT9UKRJOCbpB+X95YCqlQ2YFmrwuRd7FT8dPLCfhLN3KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tm3D6IyKP15hbKabapmjY3c8WokqB5K6kpDdyd3I+wE=;
	b=S4Z6UREOPOiH+dy1PrrT9dPFK7H5EsgETvwiWEa8kkfQDJYhlLFWlYPVdwvbaLLkjbEZ
	 /8faSyVHV/FraPWz9syCZnOe7ZUy5DCKYa9Vz2xRZstzgRhxIkQgku2/WeBHDp87flkCb
	 VrYrMfCy0zywIqmXpBUQ+FJUBOshoHBZfeSg5etnXRul0vakIQ8wn7i745gSpEzrUav4b
	 qQ8lDgOhMttcrGsGWTGk7o1KKIdwca1CUp8naDiz/bPmv6b3gdIiUnt/7LRpDTDZLRDQ5
	 xozIOCaQBHx90iJV1z0M81L+qLxT5kjEX+OzbJRydvxSsshnmJ6M0JScDou2L0QzmEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z1rMekaR;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F5D606A327
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75F5D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z1rMekaR
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e0fc747a7so5510183f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795799736; x=1796404536; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tm3D6IyKP15hbKabapmjY3c8WokqB5K6kpDdyd3I+wE=;
        b=Z1rMekaRkUjtuAon3EPKf8WGMYKdYKLyCF9S3JqK+HrcBdiu2jpY9+T3ZPeDWNX/d9
         MZhvnqd3hT7ffzPZDeaUK77G0n4gzU2A6Kr2EOgW/9kLUNMtSYhHj8uEKhJCRB0vQ8Dw
         Zjwd6L+0JcMTM9vi+/xHH5BIjxJ07oIGnG9v73QtphO1RphyzN9RII2fupI3sw3IidD2
         l/+g7QqtVS3C2FiCxsJo0PUEYUSJpk5tP00BE9YrSv4cJf7cqoR+DgPmUXbWxAqnclXk
         dHUR5CaufkCj6QYk0a2B2cmDBuIgyqOdFft8Coo4ztFQBY7cWFUT5Uc9CZcMSQFID8pB
         c9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799736; x=1796404536;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tm3D6IyKP15hbKabapmjY3c8WokqB5K6kpDdyd3I+wE=;
        b=UptkxvPKN7fkRzsnqk4VVqDIzm/5voJVkMsEp9k7T+K3YAtCpoVSb84eWe2zMCe5Op
         i5iTnUz6nwX7yryVz0b39r42AY4ir4jI/m3ZZbKJx+IoTSKJlxXu9Tm30vxVlyEu25x5
         LO7FF7k9DAks9R8EcMlfhrTxd3zVpgYJxFM31qMPFUcpEla9d1gRD05UxKy3vg5p2+T/
         2ecH/WkpVCh03mK56eeixxvK7y8z+jTkohyvdMRYGXjAnaut8InInxnNuYKgot2QyMEO
         pMhh3JdNH0MJtpFVUYUPl3XhCumYwKg/pSE++3QVcPSR7RGpv2m8QwT8nFAxlYN2YarK
         qi7w==
X-Forwarded-Encrypted: i=1; AL+hErE5gxD0NNtnn2RVFXMVqR76KyM+cw/7clPUhUjSJBOYDUj+WyLuJblDgbUJsdxs4CNsT2ZPkdywF/PKdeY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Lu5uj+nfCwoWgwWD297gJUdjfb7vx7U8sgHarGmP4934Vw6A2
	nSAtMe99OPoH2TPMXKdY9AMNLpq5e7djP5qNfcg1KCWxlscWl+jU3gZJoXmKXaooJ/Gih2FZJeB
	coJgZhz+pw1b2DXeCxw==
X-Received: from wrrb2.prod.google.com ([2002:adf:f902:0:b0:4a4:ec0d:c449])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4705:b0:48f:cb37:3ec3 with SMTP id ffacd0b85a97d-4abb400c591mr50248173f8f.41.1795799735734;
 Fri, 27 Nov 2026 09:15:35 -0800 (PST)
Date: Fri, 27 Nov 2026 17:15:34 +0000
In-Reply-To: <20261127-bitfield-conversions-v1-1-2f0b127c0857@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261127-bitfield-conversions-v1-1-2f0b127c0857@nvidia.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127171534.2097398-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: bitfield: add conversions to Bounded of matching width
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2026 at 09:05:40PM +0900, Alexandre Courbot wrote:
> Generate these conversions automatically through the `bitfield!` macro,
> as these tend to be useful.
>
> Tyr had such ad-hoc implementations, so remove them to avoid conflicts.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
