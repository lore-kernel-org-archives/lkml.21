Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087078;
	b=oFkTJwyTMD8yVuW6sg08L2n/Zp3wFAZvX3MWD5fUtXhV2jUVux8tyqkjGhCI0z1VXKy8
	 u/aaS8OY38hIoDMp8jR+blfBLWoA6PfVVqFtXOAvlevadgaypLth49K2bmpnh1Ue3ggyN
	 cwqi/uzhzmV31i468L8lvAB4iZl3J+3Q/IzssewnklIZIbtzOVFs26cer+ckq1JRVozJ3
	 iBerQBr13bulKvvxZMGEHR2aUKRRrpI3ohxzOqyGwfCLuqj7A2ETr1zGJ3F1UnyzkFHAn
	 aKYpkLA/atNtcihwFE4rZRmdQnsMv8MEzcGBthu6DMPezqbxyjo6VmFS3VUQbPIYqeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=8ezkMimIRdDJVS3UtETrn+MxS3pDa4Eflud97FdBW4Q=;
	b=PY/M6b1ojJk92g9PbAOLjAV5cJYGmB/D77dNYbiXUXhXWOjso+k7JkwdBL1hxxpDyI0M
	 bY5t+aLN3j/jKc6emOUGCJrruztLUyOpEK7MqklqS0sWbqcKeDTmMjNw8TrJaN9WBX16A
	 Q+HdtK3B2XPa11ht8d+2HJsbwwND94mrUebQ93prVO7+bY3jedOkH8/Hb75uCcml6YdPP
	 IrbTqPITRZ/74VDEv6uSzosqw5mNOJ70yvSAEnU+lySMw/VniHRIYl70ESSvheaqZDsFK
	 iquIF8/7jBuSZHgHkCJb+OroJ9/k9C0xTc/eLeoNRFyAQjhMhgCAoMpoUDf2Ac7jZ1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Bs92/En9";
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C95606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C95606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Bs92/En9
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a68703d177so858094f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795087076; x=1795691876; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ezkMimIRdDJVS3UtETrn+MxS3pDa4Eflud97FdBW4Q=;
        b=Bs92/En9HoqpVVe9AMzXrXUWsohXdx6h89e1wmfTKcGvK2BQfag7HarUMvZZ+MWskQ
         w4kPfeJ87EExGnGLIEb1iTmq1+7LQ3q5gvYToPLTFvnpJbwYtSSEL+VL3arykWX6PbsV
         z7tAjD6l54dfiF7hI3DSNHtfJY9Tz7C1OUWNMHkk3L1tWThA9e+IO/goFYvWdcv/5tuj
         1WJxu1jZQPk/9qRU4ONODlVq/B6f5BFWgPyPDG0Gx8h+F347IV+eq8fCxrWhpjRqv4G/
         qrOSVJtJymb2BajSRuC4g2FkcylC6pMdaQgRFY9rorGWIEpDQ3ewvKExPEbQOyJ05GjB
         ON3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087076; x=1795691876;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ezkMimIRdDJVS3UtETrn+MxS3pDa4Eflud97FdBW4Q=;
        b=Aj5N6K0Paxb5eoSWjqYBb3BJ0TQ5rK3KQ93d1dyhW9C1UXY6gIUltQJ4EQ7ZHO2hLq
         m3z+Yj5n2lh9C3brDAvM7OdZq8Cxs7KJNYIIIzQaWMBzkKinYJ81VvSILEKgEegp7lLO
         G6pInQmODgUngrzjbRQPcYfVh/eY+SxPzmGY9tl2O59SvYXigtnOajZ/U54UVB2+LC/i
         WVVWL2tcEU1ZNClwyOHf7ahHmRXtHRPM1D9Vd57Hr3YYkVsedyxL2zooz23T8TY5xDcY
         F1wl18/yjRaDVfSMhJSNwUF2+i2FV5LoKdDQAj9xq2gJXDWR9tGTJpDJVHaXaD6bIkOy
         pW4w==
X-Forwarded-Encrypted: i=1; AL+hErFaXS03PnxDgYbAWYPYLYMWSMWQKyyL9n4Iev3dpP5Cbv+gObkK6kKPXzXfUND4JwtphdctIERKWZVCmYA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JpXR7FlH3TDpu73+ma+OKZ0o/og4CZ9cnOZT1/YnpuZn/Vq8c
	OvIRRaPrQuOJ4ne56lNOfEjjed4KZujHSWYaQIOU4EFL7vgF764ZRBRtxOfXZIoZ5pIQnEj40mk
	VTYEG2mbUQs0+8w6Bzg==
X-Received: from wmpz13.prod.google.com ([2002:a05:600c:a0d:b0:4b2:3c81:ca])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a07:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4bb7d57770fmr116377775e9.0.1795087075740;
 Thu, 19 Nov 2026 03:17:55 -0800 (PST)
Date: Thu, 19 Nov 2026 11:17:54 +0000
In-Reply-To: <20261118163203.2483856-8-dakr@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118163203.2483856-1-dakr@kernel.org> <20261118163203.2483856-8-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119111754.3049805-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 7/7] rust: drm: make Driver::File lifetime-parameterized
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, acourbot@nvidia.com, daniel.almeida@collabora.com, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, work@onurozkan.dev, brauner@kernel.org, 
	lyude@redhat.com, alvin.sun@linux.dev, deborah.brouwer@collabora.com, 
	laura.nao@collabora.com, beata.michalska@arm.com, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 05:29:48PM +0100, Danilo Krummrich wrote:

The v3 updates look good to me, thanks!

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice
