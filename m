Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795676779;
	b=opyZdoZQhYNPHyb3d6cbY3DHT4RBiIXKoOY8t4ZlT4qvbqS2/gDSfEUTBAIBJMlkEO53
	 8dLgAhKwoIi3DauuW9BOLi8NR0uycjKCpLvJg6ovbG9OxEdRmy3ftZ7DFNWbpSVosWd56
	 YJMFkrf5s9MwQMSZucM5UI+fp1bNrGzQwd0nOAQbMz65qv76xH+tcsHLcJ28DnT9w3Bkz
	 6RUSgsJzsFwxgK8tq2sjRkyO8ouO2JcC5yTgG7Li6Cx3SaXzaDxojF1Zsm5UwF+OiP0E2
	 CwImXMOebjHlwYopxuzxrjb78zAydhlFNE7AKBZNtRFuQjtuWC4OVeqIFubCGtPHs6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=JGkzya9dAjnn+jPv3SgcvQ46bNDRabbKXhUISQinlYA=;
	b=C/mIvjoKVybbkqNVTnqV96pUww3GU/QFWKW4nx0uuoPjbvbf47U3ZTBMeNp3fr1vPe29
	 s+oNtaOps91OWw6WV2Ln6cOrn9mpSYRiueG2RzzGtxvd7lurDigCpzoB1TkV2TWaQMlF+
	 ueUgiQpKyVRtXvg3LdKx8cF//fURtBlqZeF4VAab/8Use5WOpL3so9IYdEAW8txPCboih
	 HP8Yscvyn2c7smFKKsHch/XmYug6jAJLcJSE8psDSWX5+/hPW3w8uS/D6Bp3vridC8lbE
	 /Tqs36XPRTGSihTx9i0h7Oab/Po+kiykn74umNGzSH9BzBYNJ1HDB++gsS0/oDhDOyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UH5HQHFq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75050606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75050606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UH5HQHFq
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-57e4bd7fb1eso1063738b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:06:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795676778; cv=none;
        d=google.com; s=arc-20260327;
        b=nymKBVuGXkmuEjMp4xZONh1Ql8hui4R+6JCrBxLQA+sERnDpciKHDY0Js7GXIPWHxP
         TWpXnTsm6t6wW34/XgvTmjYI5gfcCqhJA1FkjWR1ja273xIxPdhQw2A5DDOwe+qJQ8um
         ri1hvXq7Ts+Xuho2KbUwne/1kMGGyiSzk2iaunH4JL3pnmhTRtN40b008JshE8f5tD54
         E1qmOsh61LK5kioWcrHhOxS7CSvEUbxlE48fbvEPS5fcIytCs5QBMF+51yiJG/a90zb1
         t3g207mJ2P1nLrX/EEc5HxShyIeVhRkcG8/cBGNo3Yg23Y3OIM1Ykcpvwz1Cu+zIvB4w
         qaRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=JGkzya9dAjnn+jPv3SgcvQ46bNDRabbKXhUISQinlYA=;
        fh=qInzIYZgyHyZzw8GvDd37zX2TPQ8GjkYkm/SC3E6pQ8=;
        b=UGBxVB7kSz2EMaToLeWG7hXkg4Ke39B4A35bQvscdXi1ccgUTy9BgN51l3yWVtVETt
         toLMJnKLnT9WuA+FFpN3zlwKFOvqXrQKHKDRV/3sWf0yOuaPEEzYxEQiN7/DVUQi8J0d
         Eg5GlwP3NUzDPV4xQkSKIDY8SYpuAIgKkKYHsFQhJAzyrGm0mI5jJZGBfz9yVQksPDq2
         bKowxZ+Op/pHG//6YrW8kCiPErpFAexo2mRurtsef5t1prGilg21ooVGxKRar0wFWJDL
         lX11Gjrr2p9Q1+2o5ctMJwcm8orDPbefXvXbXpG/HdlRSxwV/O0jNydgDn8T7l5ZQ8qz
         9Lsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676778; x=1796281578; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGkzya9dAjnn+jPv3SgcvQ46bNDRabbKXhUISQinlYA=;
        b=UH5HQHFqTxWVAe4pNETG3TgSSnfdvawd8ZQqFQpTnXL8pklkBd3jqxrX4e1K60dzCN
         mCk/ExxbGY7CHX9BaicRT/mUMnD59Wl7VG2ao0I/MrUgavg8Dk4k1G6IFokyh5mZ0oDm
         AjSe3P7IfgcbvQxru2NKz9hbmP8nCLfrcNQSyS28j/dZUrchIitIru9PMmoFrvN9okV1
         7uMLKIV+zxO1B36TBVevbRi0bE9Huy4j3dCL5Ht6IN2bT5Jmslw8xPBv7Wn1/997vVCr
         F+iCkk8pUWDQq9JJqWyWFuq4UR1ZEf8IbZhe6Y6FfyXuRqPr5atBZEKVDCLveet/ZI/6
         K7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676778; x=1796281578;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JGkzya9dAjnn+jPv3SgcvQ46bNDRabbKXhUISQinlYA=;
        b=WeH+onaklSVXsn4lgpO//xRk32/E6mbP+iCMToRodSCmr4GH51zRyEdEWIkRiXa7z3
         vFFnr6kPiEusA/+2d5mJoAcys4bQFtlM3ruv3Qwx2cxKCxVqvccWkK2uG8/LkiWn2O6j
         2dNswroIpfPInYgd9wb/UFdWJ5WtvpIxWgm2I1JPQZUJVNoUqVC60gKiY7cgilcGbP8f
         8v8B6VvCl9m9fc3ZGX/bDUvaevCS2pmJ3q9OY+Uef47njW9+1mLRDulhpubcZr1ImMfp
         nKE76BD17IuZrzWf+C+q/9YhwIhcYQHs6fQTgy06euHDqp9wjqxgwDvedtyXwi6iIgtg
         OV2w==
X-Forwarded-Encrypted: i=1; AL+hErG3OVZ0dOIIL2ngYu7y1j9ldpjUNtnWM+PlrgAX2XB9Nmujg/2lxSe5S4yg1wkFs9Xe4OddRXtnTJfRsBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4+7vK3zDZIAB1GWi4zId4u16R9BIVRV3VVUeaVJ13i32ZQxZZ
	wsxcBA8X+aTcNF7ADncGNYvlRb9DuIgqXaicIKZYjNFQVIjPITK4kUhh9l8cS+bH2XW88flu1Ee
	bNM8V2uvXFJE3y0OxijBOjLUlZ4/XgoA=
X-Gm-Gg: AZFdTZegQHoWkxgFHUUmU0Y7geLd4W7G0B0TlCQDUobwUEUvVCxLIzSZACeMRytpaQt
	/+tNRW9lpOvchr0uWxJrlwMN7Jye5csgNk1TPUZZopwLAOlL4GmAt5bw3UeN3R/oCTj/LMcsYG/
	Vm3juok9sfGWYl3pi+CqSDvKM8/LuWKq6w+gVauqeswblPwuCEOLRPdwBqM/XfAu26vJ4GbbLxo
	X5qQaN5BfIvIQ2VxjK1c80Q1S+/BHd8sVC0al8ZXVon6ZomUdqIlSHiB1yxXNiV5MoGMYIYx2fY
	5UKv2YpPoVMu5B2XpjT2fm4PUy0QMcgESSPl6nJkeafU1gvMHwgcdWk5yRYlyB8PnaPjIiout9O
	bS1orS5MQoYol1gRYFThDHsgo1VkwDk9JxfPweXY+Qjq4RmPwlqf5tKv1rZ7oINqdY2TpF9XxVo
	uCkMU7YWC5JRg=
X-Received: by 2002:a05:6808:6413:b0:574:9463:5511 with SMTP id
 5614622812f47-57a0b64e63emr19810454b6e.48.1795676778214; Wed, 25 Nov 2026
 23:06:18 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 26 Nov 2026 02:06:16 -0500
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
Date: Thu, 26 Nov 2026 02:06:16 -0500
X-Gm-Features: Aa3M54omcjTpSdcnmVtJqEgoipl0t9iwMSKeuCL-vk9fRXRWXqfRUnArp4WiGRM
Message-ID: <CA+m4KrC5=QzYthdWOyeJy68OrgTCrKdYFRovD3vRC+V26NkqGw@mail.gmail.com>
Subject: [PATCH v1 0/2] platform: arm64: huawei-gaokun-ec: Fix short transfers
 and PAN ACK masks
To: Pengyu Luo <mitltlatltl@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

These two independent fixes address the host side of the Huawei MateBook
E Go EC protocol. A short I2C transfer can be reported as success, and
the normal no-port-update case evaluates a negative shift before sending
its acknowledgement. Both issues are present in the pdx86 fixes tree.

For patch 1, a host-side test fed the actual request helper adapter
returns of 0, 1, -EREMOTEIO and 2. The first two now return -EIO.
A complete transfer still returns the EC status byte, including a
nonzero status. For patch 2, UBSan reproduced the negative shift on
the base commit. With the fix, -1 sends a zero mask; ports 0 through 7
set their respective bits, and out-of-range indices return -EINVAL
without a transfer. Both patches were built individually and together
as an arm64 Image and EC module.

For reviewers interested in firmware inputs, the PAN write can also be
checked with a fixed cable configuration on a Gaokun. In an earlier
instrumented run, the left charger was online and the right port empty.
After a normal left ACK, D3 still reported update mask 01 and port
records 05/00 and 02/00. A test-only driver hook rechecked D3 and pending
work, then issued one empty PAN ACK while both ports were left untouched.
The I2C trace captured the following exchange:

    host -> EC    03 d2 01 00
    EC -> host    00 44
    D3 payload    02 01 05 00 02 00 40  (before, after, +2 s, +5 s)

This observation documents the existing empty ACK encoding. The EC
accepted the command and the update mask stayed set. The series preserves
that input and makes no change to firmware recovery or hotplug policy.
The host-side cases above can be exercised without a board by stubbing
i2c_transfer() and recording the request bytes and return code.

OpenAI Codex assisted with source inspection, the fixes, regression
tests and drafting this series.

Thanks,
Lee Youngjoon

Lee Youngjoon (2):
  platform: arm64: huawei-gaokun-ec: Reject short I2C transfers
  platform: arm64: huawei-gaokun-ec: Validate the PAN ACK bit index

 drivers/platform/arm64/huawei-gaokun-ec.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)


base-commit: d4000e7b99e06e92f21a3c92098a0476d316e9d6
