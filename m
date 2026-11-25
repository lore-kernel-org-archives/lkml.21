Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634109;
	b=raD96v/pBOPpRsqgULmrqP6/zTxnGMyOB91E+3wXnUhZ8oK7Lg+xf72P/9ZEOdZX7zGP
	 NRcSs3Flq38axuFJQDGxxDXE4zzUWkNzxhx38DGchRz4JjZGN94aOIAB5RG6CPTzjRvww
	 wyrj2hVxtN6P1QPM478WRuUe1MnXHf7ue2zb1fvjVRDZduxJdwa7+UOrCBkFWKteJCNT+
	 6mkMxl6LWIgnPXB3hVde0F5bKye1i2Thq/bTPJNPe1JklNvZO4vxMKI5globuelcpaw+7
	 M7ORRO0nN6z04ZghePphwzIMgoL94g7NrD0B9wZtw29jFWyzBzl+eegXhnvuQ3q8dJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2XXDx1N+ETD9sRZ73sW75oA+drTEDlkdMhzQqYaN1Bc=;
	b=yX6D+gTbgbW1HYrh2l0g4Gq5U9UcA8y51NU3Rb7Tqu0+ODMmSwecqF6XTCWxHTxtqKcN
	 r3qP7xAQmWtlEJJKPuJ2cukUMeRGmY1sob0jyITdbqsmfpJxE2i2HjLh5FDIweFRsqln0
	 Kez5eQW3s9GZfj3e6q7P9lkufDTVGS7lzcTCGUBpKPxxlJUrkQql+NrGk/3C6FWPrP56V
	 kjKXMQWucjIT10VlEbSp6sbv8QLvkSfcRaE6Wbz/j6Ty9C6AmCMM1pgHrr55AU5hIBNcn
	 jDsxN9yxxo70KEa4qv9vNbKcyE85hDiXPRntZ7bfuFqBObgUPPjPz37p9nsL8ApEHMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=nEC4fdqe;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3EB606A6AD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D3EB606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=nEC4fdqe
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso2568893a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634107; x=1796238907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2XXDx1N+ETD9sRZ73sW75oA+drTEDlkdMhzQqYaN1Bc=;
        b=nEC4fdqeLFuOx7pZ9gejzfft5pb20bd4XKtV7usvGd31fLlqVxuebaVdG/h4js03Jx
         fV8cM/XuasDvTzoIqa73NH/HbsT5AClRxqtCuZMbit0xqFlMP0WiFQEnp6rVIl9Y+bSd
         1aqjxSMfppqr6shrFEfjey6aC6bvF53GxCKDl7nz4K7Iyzv+SJ3Gdsg+p1F8n7Zx8G29
         /MY2nIUJKMzWPT4cfvwySr7oyBFqun+KRqB9OchapP6GKDm0FljKD3RtXNZYOx8h9wdq
         b8ChyynDuYMPSfp7sn8+CY89SXRzL+Yqs4tApEJw0DpqlAQpa0KkdJfvzz0gVHR1Qjpe
         tlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634107; x=1796238907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2XXDx1N+ETD9sRZ73sW75oA+drTEDlkdMhzQqYaN1Bc=;
        b=hbEAdhamm1me6u+/rMrryK9L5Ru3XuzfHgrQZdamuexB0hYv1VZDRqAMhrS6qVAaqq
         SMrwQF37aI5CZDVeSrI8qercm4yRZWYXOivxyCOYt9t6NVTdGLBcEk5sou+fl63IQ8jy
         RWNNvB6zJX+YG+BGfzVrpuYpOM2e0GfH+lqbcFYvPF5pZohccd2PREEYU6w+RpPO2wUi
         cKuIAh2E5tov2qIXz5y7EEyuQWWgypZz8Pr3kHzh4CfhxN/D//t+6aRKWq08TcsDLEKy
         b7D5lSUUiykgk6pOMI43iC1neYQYLt/w/jHzkTGMJpwGytNVCWtpBT7bl1ZtoTPyx1GE
         Oyng==
X-Forwarded-Encrypted: i=1; AL+hErFpulCH5DjJuvQ61jNX1Q0tD60lcJpE4xAyfdGyFEqxJ8aUHAe72mdRTjoJr87v6g4RdPpI6ykQ3gtkUBY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lV0IYzzrEWsOmnEUJEEQL9t0cWwsW0+796hfWzNGqEfCep/nb
	PiqMZgQekkjoW5TlRkBsqe/9TI3Miv2qWiFek1dJRQ0TpniI4nnW0wIMwMCj/Bpjb3M=
X-Gm-Gg: AZFdTZe67Y9kl3V5h8i+ADmA88vcTKrKxHhqWqNyRGcXIKL7kXwweqZbAgJkesy7Ci0
	QtQTaU6Vjn/uD9pgmYmGMxw4Dbs7Uas3RnZnoB8+elF9UoZ3KmDmwSk1sbT6FzHCpCUvBiSamwZ
	Bpc8KxLr0p5m7qqfjy/8SDwK2q6ermasIonhFQLFhuyZnLIswy4o2GxSxP8RzY9jRBvqCcG+mpS
	4cXgp7z8JHJR9oELNJvAGu8/NQXec2+Jmw7OeJBLalF1ezZtUWIFHovGYtrdweWfbbtlYULUZUa
	usuNNK8iufFUDp8MRWNi7EBezrVJG2TLZK6p54+vhVmiQVFZR4/6VinjgQDbokL5clbJwiGrFzW
	l+BmCFqS1wlfRD1xM9OeLO05nX7toLIicWzbs+S4xPW409zLuZlWlhH7ihX5PsbATw14R432hBe
	XKVh+oYYwTKhtFnSe81MdKftf/LsGWgCc/0sE1zMONDfRjDn4yw4d1yKwmk58hAx4qgAVRb7gJf
	ndI4+QeZoWZBj7gPJz1gJ5LXG6gu96DW/nqj08+lgVu3MRIlFzLa/cBNRwMukr6SV9UxfJOxNvF
	tdKqA7GuZdpyXx3UtV+v8XTtG0/39qn6qsV+L2sK+VFG8BNgzTlD6sMuHsZ5ekwlsHJwQmxqlvq
	PAjw+AGCoZIOXBV6CxfsH1DamK7dr6MrNVn9aUQXxADjj2Ah/nI8=
X-Received: by 2002:a17:902:e5c5:b0:2e8:4f3f:60dd with SMTP id d9443c01a7336-2f03f215a7amr145555155ad.37.1795634107510;
        Wed, 25 Nov 2026 11:15:07 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:15:06 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 10/12] MAINTAINERS: amt: cover the amt headers and selftests
Date: Wed, 25 Nov 2026 19:14:48 +0000
Message-ID: <20261125191450.2497936-11-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125191450.2497936-1-omar@blockcast.net>
References: <20261125191450.2497936-1-omar@blockcast.net>
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

The AMT entry lists only drivers/net/amt.c, so get_maintainer.pl does
not find the AMT maintainer for changes to include/net/amt.h,
include/uapi/linux/amt.h or tools/testing/selftests/net/amt.sh, and this
series touches the first two and adds selftests next to the third. Add
the two headers, and a glob that covers amt.sh and the new amt_*.sh
scripts.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9f1a6024f..6a028cdba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1506,6 +1506,9 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
 F:	drivers/net/amt.c
+F:	include/net/amt.h
+F:	include/uapi/linux/amt.h
+F:	tools/testing/selftests/net/amt*.sh
 
 ANALOG DEVICES INC AD3530R DRIVER
 M:	Kim Seer Paller <kimseer.paller@analog.com>
-- 
2.47.3

