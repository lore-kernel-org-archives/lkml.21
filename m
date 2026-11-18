Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001376;
	b=po2VT2RjOWnk6eyvOFwQXy5XllZ0PO/dXoSWNIATsr8bmRNb7HPymcsAkTwFJvFBl8sZ
	 8mlnViK62FscyuzRpcqRXyZZ8BbXWAXh6mN3kagexhfGd5kjhO/Q3Z6jK53hv/VJcPlct
	 xs2aubXJCjkgg5T5tpCSqAJ6pBTt5/ncghCMK99ZDZxjqv6M5lmlfoqGjweHCGFeoSkVm
	 EMWzGhgHWRs3aN5WJGF1T7lisT+l/E91Hj5cZ7m66w03AIUgnWXWrl8zIWF7Vr8UmNdgx
	 4ZUxkM78XYh8qxg5n4j5VVTjm+q92n0JGyQbeIqzpd2ALegqSnjbWj9WMVYIbnmoTRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fiRXPitExg9c6g7UHC8j9HW4vMb1uaFTU/jha31fP2w=;
	b=NlQmRA9ws6Q0izbaWhRotVbsC5NpfZqQxGnVE0DxGdKwk8TLQYcCUGg0xX92WTbC8i2J
	 nBfkVjWix3/qhixs8wFq5dNYl+RP4tMJj2zErciubz0MyPtrDsmXPmBi1tAxiRiilFc06
	 TVGAD3DU5olhn/O++qkcN7HNYrdKn5r4HOrUR39tQR8yUkQ9LaotsCVbHMYaezS3p5p8Y
	 3J9tzHHlZZH/CD6wadyVxkyXK5O8ZVk+TyuC6N2BRedhtQemHK3plJ9VX49OngGL3qTLU
	 pA0NgjPxDODp+9ZvnOpBbF0xZ0DngSggec20qSQgNP0ERZ2OT12dQp6u3jQDwx1WXOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FPxBJ7Fu;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9FC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A9FC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FPxBJ7Fu
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a359b714f8so5701345e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795001374; x=1795606174; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fiRXPitExg9c6g7UHC8j9HW4vMb1uaFTU/jha31fP2w=;
        b=FPxBJ7Fu5862Z/MAJ89JmQqESgILChRBFEPRHJXgdjOUAJ82tKBBx+dhQsBub1mSZf
         K8PxpT9Jr8OB98ieeoTXEaIAYgk4WyciMLMKwdB0eCiY49yA9VkjjJuhM4xRD09VSQST
         jVPgczsN9FVE/ubT6oXp87EKTwOPjp1QfigXnh1RYQZcX+vkOnFCA9HoaM8Ubsjrc+os
         q/0sT8bOkL2fZtR6iGi7sZmr/Wr9/N2MKMHi9QAto+HzmnbxAdoncJb27Jf+fm3QkTUQ
         EG6I1kZCMlcw5SWjxrA4sUxGrA010fBBXZbYXYNEl+PcEvK+X3e5F6iPqIVq0OvexnJg
         2qRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001374; x=1795606174;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fiRXPitExg9c6g7UHC8j9HW4vMb1uaFTU/jha31fP2w=;
        b=JaP/TZGQIo3/V4uXO0nIg0jDCUFboynQVuzZbpVS0Zohsgx2ZnEXotdOCeQI6sc69C
         uRQ/MY77t8KSPmVutIK7DCxuFVP93Ys9/Xk6lqhGDGCVJNR51Yl+BMa01qttVj+uBp6p
         4t6wj4dKq0WX4y2DIaVCan+2MlNzYcakYre44E/EZaIaIxMRlExk0+KvLxDVFDUHFJNS
         zP7abkG4oEaezIZjNfH7R0w4583x0YzZXzGaAKDaBygk6K73TrX4XlyDUs2U8ImnFmPP
         B7dzDvQQboq2JO+yEcUNQSPys067o4kLV6F2eUOmbXr+hFcLVn/JhZgS9aVjmaREncYR
         KnEg==
X-Forwarded-Encrypted: i=1; AL+hErFnsR0aiK+2ThY7v/3bBDQ22VpJvjp4NbB2g+P3ld6T+Q7OpqtqIzCtPA7QjqFCwVUOVqT0xGj2iNAR9lM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ozL9A9sRHtB1ba9l+B0BV6rnZgHbrUhsh0jc3adqiLRv831WM
	fxhwHhn27aO6meSoo9n9Rx3RouVX/myptM4HHPL83TE9ocCLjQsqcfOoszrhGAZDdmTga14ia6s
	LNl0s5u3wfdKKNzvdZQ==
X-Received: from wmrn31.prod.google.com ([2002:a05:600c:501f:b0:4a1:f37f:7f0b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3494:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4bb7da4efd4mr41542225e9.35.1795001374269;
 Wed, 18 Nov 2026 03:29:34 -0800 (PST)
Date: Wed, 18 Nov 2026 11:29:32 +0000
In-Reply-To: <20261117231927.2200674-1-cmllamas@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117231927.2200674-1-cmllamas@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261118112933.477541-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust_binder: disallow binder fd transfers
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 17, 2026 at 11:19:26PM +0000, Carlos Llamas wrote:
> @@ -182,6 +182,13 @@ pub(crate) fn info_add_fd(
>          buffer_offset: usize,
>          close_on_free: bool,
>      ) -> Result {
> +        // SAFETY: `file` is valid; read `f_op` with `READ_ONCE` semantics.
> +        let f_op = unsafe { (&raw const (*file.as_ptr()).f_op).read_volatile() };
> +        if core::ptr::eq(f_op, &crate::rust_binder_fops.0) {
> +            // Binder FD transfers are not allowed.
> +            return Err(EINVAL);
> +        }

We have moved to using atomic_load instead of a volatile read when the C side
uses READ_ONCE. For example:

	// SAFETY: `file` is valid, so `f_op` is valid and aligned, and any
	// concurrent writes are atomic under LKMM.
	let f_op = unsafe { atomic_load(&raw mut (*file.as_ptr()).f_op, Relaxed) };

however the f_op field isn't read/modified with READ/WRITE_ONCE on the C
side, so I think we can use a bare access.

	let f_op = unsafe { (*file.as_ptr()).f_op };

Alice
