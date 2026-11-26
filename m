Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795676809;
	b=LzW3Y+B9sRJ2UAq4zXXENZyKjIEnfGp/NhogHtcbrgb3uKkTKl77vAtmYfRqUyyULI66
	 3n5Fxe/xZkfyFQ5nKtuXJyjSIgHjS9Jqk0vbUhijS51E9Ac+zmiHR7ZRL4PVkCiGcb2XZ
	 V/9ZjL4lv2+y2fdlls5DAKoCBGIvha6DJRTzXosTOdEP55kgjAtPikc/S7kWnWpNdf9tL
	 nykimsiXFzOfIcggrAEj9hpp/Ydc2WTJEPRs0tOdqfmvMfPQTlvvWauR/bgI7QvBeCoI5
	 TcVC9zxkG+axXWuBFy8GGtp+4ZO612q2VaB/aLVQq7be3OxneGDZNRcbETj07RxKzGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=hp2LcS4H72LvNZsciYrnTzMlHczMzIpxcsomt0P0dEQ=;
	b=Mbf4u+TUREgz95lqVFGJM35oZ8uVp3xW/xHdqiVufnEF+Ce6P0BQZH3aQoTzv4bHVrSE
	 Dg0rdWm88VweNoCWqkCBq0RFCyv3mWCtfGoGGQeTMrCEkCvBrTsB6JtaI4I5eWfHMqH4z
	 YTf9rp+GjgtmpQdiSTKQe6nePX16HXR7/pOwdnZWtUVfo/RL9c6DPH9g0FLmOfqGLNCer
	 9rDYDDIqhM9vJQH1+tmRXUsEMlOK6fTezbizl0NptLIpuU3mWmt8YO+dGQsXKkXejmh7r
	 i82bHu303xPms3nvy7wSYYNKDdI6AegjCYEYURQ47j/vHs33cCbN4ylDB8fSJ5RGWpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xB7RViL0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5B7606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF5B7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xB7RViL0
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-71b30ed75a1so3851921eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:06:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795676808; cv=none;
        d=google.com; s=arc-20260327;
        b=G9zNsP9sOA2xNCaNuvO7GjXd5VGL2MDfl7JQtMvrJFDcif+ZLNqsi/rMrpy54x28iF
         cmZAH0j2R9vui94+YlqjMg6fWNG0Cj5SUUGv8AbxMax6RoCD9Vn2o31TFtV3z31Jihxm
         Tp8vg9sSMDCJrGsmaNiS7lx9pzvMAlj3xzORztjb15h4qLB07RGNi0FD8/fn6QOZ5fxX
         BerUNKt+q3nedr0ciUfccWEzDzqd/0v83XatzE8Hffbx9Pysz2qMLrF9QOiBHEEtfnYv
         Jx5UOentgtEWBf9vVxRfyT6nFWX6vt186+TyvtmgzC/qF1ZAkfB07EKEz2NycnxSnW54
         P6RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=hp2LcS4H72LvNZsciYrnTzMlHczMzIpxcsomt0P0dEQ=;
        fh=va5L+0PMMd/XGKkTyST7RFcPdwkuPuvlIKDQ0UIC2iU=;
        b=a6PsvoIA5x3VhrK4cyx4TcQSkvjxWgk885N5imhql4wSQhhE7DT0/I/La1mALhAoxZ
         f1HiKJCQEzc7BpR/MMDhA4jndGCjxXDlIMaC7WOUYWj0jCEFTV9KmIcfp4dyOZLvb8uD
         pmekgZIoPkDhqnasqpN45DMKePGIKyTZq3kft9DOSBXS18NPohnsywoOIKH6Gr8+CH+J
         d6VABnplXJMHgS0/c6lIANgW0KIhJUkBBvpnpWysl21Z1pVoR3B2rPbTz5F1tzxSdJUB
         sx5wbCPbtXBPyEjEJH/OZ8kuylA1Ss5BZ7hOuhiB80Eu67Rl7jg26Saqmz9qSBQyK7L9
         c7Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676808; x=1796281608; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hp2LcS4H72LvNZsciYrnTzMlHczMzIpxcsomt0P0dEQ=;
        b=xB7RViL0Qm2HDqntJgtv31vB6wqSzk0mWQxvI9vjk9mas4YmcxlZMLcgZwpEyqSnSD
         fUGiVloXiZRw5+dydJomD3aYAReIwO1H6qF4JLGcc4IAnPZ2Pw9h3/c27N0P7uUU1f3g
         vk7Twjdjs5rm5hWe5at1Ey/NI3i1fqjV2SGFM2dp9zJrVOd7HTG2tm8A1pfXHLJEBBFP
         XHJtv6WP1fWxn+flyVfZUoKqi5KIBQlUBfweDm1mYzBQEcWaZxiipVfsYTaGk6dKKXFZ
         Y8YUql9jXKyeAX+jYx4eXHfjuVrBNpvxuz/3s4Tcuf0uO36QCVHwrHTh8ULt8hbMPYFg
         UZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676808; x=1796281608;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hp2LcS4H72LvNZsciYrnTzMlHczMzIpxcsomt0P0dEQ=;
        b=d/CORKSpmF3MxwOdcmNbHi3u65OSUQt6wdSuBEfB9d5YMGBrux76K+Awm/2WeWnrtM
         E41CShibcpQ1D+XfhVADVWtd9Ly8m0/sk8zpVgOxVj7WSPS86EjjxcJmx4nJHfMiDcmL
         8hcS4Iink3V09l4cPhRWEzhXuyvu8AkoXAoY3XzKHVwPxMVFnv1ixD8Omt4MT7XqmcrW
         gJuF6BII1LypgnKi0QZQixl2oBpRcHOxOVFZFNKpWlZw2Q6gwrYqaBexUeOZJQUYBMeU
         ZO6pQIX17J8Zdg8YM8HFZszmeVzW2vFVHTKSSW2eNKIfSSXYt6ip1uXmsQc6Id2vmSq0
         GlkQ==
X-Forwarded-Encrypted: i=1; AL+hErF/83ZPvKJPJGLEkPKnXv9EOvc+Pmf96+zOQ52GLl73D/62ZuvWGlVgo29MDf4sbkYBLpS3gFFhqMiGP7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XqrEkHeFWMjhVJj+GUWtZyaNAeVa+Tapkd/7MqJHYt2bCTD7T
	FIN00JPOo7aRHmLU2NQsXhh7ynDNbUHfV6AvyP1EqEXwoReA5k0d0P45pvxh/NPdimjjWi/LJVF
	i3nRCjN/wGej7h1P788NRESG5pTFdaL0=
X-Gm-Gg: AZFdTZdVKulzEsItfTUzSN796ZqEhv7w0Tsd6lFSX08ARTLZb3E9VqZ7teriZV5MEZn
	qlyd/jE540dzsPnpJfUBESy1IGHUCJCmO0VD1qSY3APnyJX/Husc6Ao1piM3VwngMn1j5KDVhxJ
	VyjsSqywDEwBGA+/DwxsVV2x/fDZ9VwlWqCgXcYtx5nTp/4zC1aMAWqGjxKevb1hoCCTGj0qUY7
	oGedF/I1/IpucHS9Q/veaBsWFjnaAIVdGOpzYtDDyRkz6Wr8nXLG3UsN800Wu4Fy90b0cGhJvA8
	RoG6otWIEXn2KN+vFgU7i85dUewnbrJi7t1g8Jn5OGh3pMd79R/lqFaW/fax7O/PhrAJEz/esFs
	4mC8RNg64A2E/2MKkV3jcxNHVUR0LhR6MloBCgRPOZaJVlJGwkpdqTiGMe1LweVT7uQ==
X-Received: by 2002:a05:6820:a29c:10b0:6dd:e81a:5906 with SMTP id
 006d021491bc7-71b394dbcf5mr13813445eaf.50.1795676807667; Wed, 25 Nov 2026
 23:06:47 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 01:06:46 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Lee Youngjoon <getfeus@gmail.com>
In-Reply-To: <CA+m4KrC5=QzYthdWOyeJy68OrgTCrKdYFRovD3vRC+V26NkqGw@mail.gmail.com>
References: <CA+m4KrC5=QzYthdWOyeJy68OrgTCrKdYFRovD3vRC+V26NkqGw@mail.gmail.com>
Date: Thu, 26 Nov 2026 01:06:46 -0600
X-Gm-Features: Aa3M54r4sbmQWAvLgNa8a9_OjeQhUqX1RUq0k2cmQkyFbM362EOUw7mP_XR5FuU
Message-ID: <CA+m4KrDa-5MGYF1c_zAzY-ZKM2oJTdP8p7u1D0AXGi1smKNHPw@mail.gmail.com>
Subject: [PATCH v1 1/2] platform: arm64: huawei-gaokun-ec: Reject short I2C transfers
To: Pengyu Luo <mitltlatltl@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

gaokun_ec_request() issues a write followed by a read. If
i2c_transfer() completes zero messages, the helper logs a transfer
error but returns zero to its caller. If it completes just the write,
the helper returns one without having received a firmware status byte.

Return -EIO for a non-negative short count. Preserve the adapter's
negative errno, the EC status on a complete transfer, and the delay
before releasing the transaction lock.

Fixes: 7636f090d02e ("platform: arm64: add Huawei Matebook E Go EC driver")
Signed-off-by: Lee Youngjoon <getfeus@gmail.com>
---
 drivers/platform/arm64/huawei-gaokun-ec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c
b/drivers/platform/arm64/huawei-gaokun-ec.c
index ac21f732d..abf05e7ec 100644
--- a/drivers/platform/arm64/huawei-gaokun-ec.c
+++ b/drivers/platform/arm64/huawei-gaokun-ec.c
@@ -145,6 +145,8 @@ static int gaokun_ec_request(struct gaokun_ec *ec,
const u8 *req,
 	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
 	if (ret != ARRAY_SIZE(msgs)) {
 		dev_err(&client->dev, "I2C transfer error %d\n", ret);
+		if (ret >= 0)
+			ret = -EIO;
 		goto out_after_break;
 	}



On Thu, 26 Nov 2026 02:06:16 -0500, Lee Youngjoon <getfeus@gmail.com> wrote:
> Hi,
>
> These two independent fixes address the host side of the Huawei MateBook
> E Go EC protocol. A short I2C transfer can be reported as success, and
> the normal no-port-update case evaluates a negative shift before sending
> its acknowledgement. Both issues are present in the pdx86 fixes tree.
>
> For patch 1, a host-side test fed the actual request helper adapter
> returns of 0, 1, -EREMOTEIO and 2. The first two now return -EIO.
> A complete transfer still returns the EC status byte, including a
> nonzero status. For patch 2, UBSan reproduced the negative shift on
> the base commit. With the fix, -1 sends a zero mask; ports 0 through 7
> set their respective bits, and out-of-range indices return -EINVAL
> without a transfer. Both patches were built individually and together
> as an arm64 Image and EC module.
>
> For reviewers interested in firmware inputs, the PAN write can also be
> checked with a fixed cable configuration on a Gaokun. In an earlier
> instrumented run, the left charger was online and the right port empty.
> After a normal left ACK, D3 still reported update mask 01 and port
> records 05/00 and 02/00. A test-only driver hook rechecked D3 and pending
> work, then issued one empty PAN ACK while both ports were left untouched.
> The I2C trace captured the following exchange:
>
>     host -> EC    03 d2 01 00
>     EC -> host    00 44
>     D3 payload    02 01 05 00 02 00 40  (before, after, +2 s, +5 s)
>
> This observation documents the existing empty ACK encoding. The EC
> accepted the command and the update mask stayed set. The series preserves
> that input and makes no change to firmware recovery or hotplug policy.
> The host-side cases above can be exercised without a board by stubbing
> i2c_transfer() and recording the request bytes and return code.
>
> OpenAI Codex assisted with source inspection, the fixes, regression
> tests and drafting this series.
>
> Thanks,
> Lee Youngjoon
>
> Lee Youngjoon (2):
>   platform: arm64: huawei-gaokun-ec: Reject short I2C transfers
>   platform: arm64: huawei-gaokun-ec: Validate the PAN ACK bit index
>
>  drivers/platform/arm64/huawei-gaokun-ec.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
>
> base-commit: d4000e7b99e06e92f21a3c92098a0476d316e9d6
