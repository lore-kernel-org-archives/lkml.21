Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021804;
	b=SZLS4fQOpf+Fe0m+GZPhqcV2x9mxnjpCz8vARvKM8nLhTVRbVYFpn7u21ou6MzN7zyBr
	 QSV703FknXDJAybjZpAN8p3SM7z1HFVq8NzhNJvM76hle/lYzfyleqyoW6ifkfa6QmLGi
	 aAekYIm/RqV/qaUh+Dqc7cNfTrLXhdQXR1GlLHi6cAkh3E2yEnoFr+iaHLAzyoZp1MHzk
	 mfZm3VBuMzBGlWiHdrUFe2AxwOjeFIAXLejbGMRphzvrT2dyf6n+Q73lLJiGuogYU/xDr
	 z/pj8OKKCrQVsYU75AoyGWQ8ycarRiSU7BFr6laqVIwermkQRk3H47eDfwzAlb51WjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=mBINZO8SI4MpYZqVki+lomnJt57kbnNhtrWtWttDyyg=;
	b=g/LxPWZE1Jjz+++ljzl94DFl2ZdyqHuxr0hFx1zDupFB2ZDm3ZHkT0YKjSWsPp3sRNje
	 4GBgtwjdFYg6URcxB5KsKYpARbvhJs4IYp6jzTj4jPJJCfl5IkgaXy2V3MN8zbpdBZpds
	 cN8YUVIGuIIE3IoQ4hhGGlRyy5myI5IWndanQmdD6t+X6IZp7jSbmmXW91ViqGh9/7scT
	 hKMNKURhDS6XTTfzwrTi18idwNadxG8UjhQrguD8VI7CzFEEvUmToOAZRSkxwwUh/cUZL
	 EhMWuZkcC+UBghLHWUVS/mgE4L2VrMsdkoYmDnvTQmeHEgruWUAc+Xw58ks/Sf4TKNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NQRD6l1T;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E62606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:10:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20E62606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NQRD6l1T
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a17741243eso7176335e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795021802; x=1795626602; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mBINZO8SI4MpYZqVki+lomnJt57kbnNhtrWtWttDyyg=;
        b=NQRD6l1TEtmIkjHWuz75N2co3p+FwDO9v10vBOx3armYpgWNct7q4TXvfe+q4eiCFU
         K7fsXwLRgj96NcAqLdAtMd8bmPp+j7SaF0lt973TUT1EscM6flsDNztdVahjV6YZn13h
         Uu0AVW4rEq8gi8umm3a9VhwbyyGSDq+rbimt41v5mYKm7Js7LqHdxKdE/LlB+bJiZSv6
         RAvcZMnizV/Pp6qJFfMpQFPiJYOi0SvoCXmW7MIY/OEZUYI09VE6iaGwIK1SfdHGBhwh
         GVBY0EEth0Z8NBZT8gCzlHQm0xH/la8rl7HpSpUsTaLD2Hfbe5wdYhP1N0bLTwFQR/Wj
         SC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021802; x=1795626602;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBINZO8SI4MpYZqVki+lomnJt57kbnNhtrWtWttDyyg=;
        b=tbPHDvwqx+h2UYve+uH6aqDZEufF31C3ot4Sxi76tIxmc4FFGo0U7LBisaKJ21BXMl
         dDeiX2FkHy/2XTCuf0aOdRIExJq7VLVp4DNE9HxQzV+waVDTWoaJkPBdMNHiMug5lF1n
         sEq0AO0sTt6qiW9nHm6TLcULz6LEIuSB9mq086khsbt6ezdLQoLCq1FWgyChGmFuoDXz
         yNyuoxGgDcOfcNktIPVU08WGLUq1zv1X1MK6RDeP0dTJdonmHbnEWlL+tMOCxjjFW4eN
         ZPT88npmXumoNRyQtYRf4Y9OQkhZVYK6HjjlOtprjkLeeBF/ACTo77bylH23YaBy12pK
         UAxw==
X-Forwarded-Encrypted: i=1; AL+hErGnMHz9en3oQv3GuVH4dCY6D9xmJ3smqQcD7Vz5EKejLsNphi3jPywPXNpetNtSSDzvsSkiFsgZD7McVJQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MiLqHFF7ZTdfOkLklHjYTT9InVNaAIYuZrj8UkkR4hqlFqdPQ
	Gxkst5waflLjy6l4W6r+aPtRB4KLOUDLIzIC5Bzn4nJlHdnqnBSdBjOh+F9gLFRDDbYzyMCfyH0
	zWJXHrhrBqoRckmxdYQ==
X-Received: from wmdn7.prod.google.com ([2002:a05:600c:2947:b0:4a2:8ef:a5af])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ecf:b0:4bb:7007:4a5a with SMTP id 5b1f17b1804b1-4bb7da2eaa2mr68357745e9.23.1795021801887;
 Wed, 18 Nov 2026 09:10:01 -0800 (PST)
Date: Wed, 18 Nov 2026 17:09:50 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN/b/WoC/x3MQQqEMBAF0atIr21IosjgVcRFTL5Og0TtgAri3
 SfM8i2qHspQQaa+ekhxSpYtFdi6ovD1aQFLLCZnXGet/fCmEYrI18HBp4CVu2YyDmaGDy2Vblf Mcv+fw/i+P1fPKTRjAAAA
X-Change-Id: 20261118-ordered-wq-cancel-63b02e0feac4
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=733; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=2c+b7t2eSKRSZikSFPwO4mhMOW0PlzZoNYa5IB1loN4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/dvjWZXjaqIG7+QNZMRPjUaudgg03nhqwuouf
 rjtcynuV8aJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCav3b4wAKCRAEWL7uWMY5
 RqEvD/4jQXgzC7AXJ3txLaMqfqDu96CDUPsiDmb2Os7FDvR8CQzsd+E4vkv8pqnLpUoVUbHTKxn
 2LWXPUTEOHgIv87yjdfM6ZAPpx7qtx6Tv4I8U84NucamP86rLQ6mMPLBua5EDNbRmvslVhFLomy
 +SxNbhkFbEBHwBbNfU7FLV1P2TCLuBnhqYAQ8uiAHXkWUtYcsnF0alwTgCbe6NV9wQqIiYY2VV3
 9a/6bCBumEP6JkrPczQHfL1ELRfX4M/A6CWQuChk4HiNMWIW3zL5YFlLMJQAHRFu53FWr1hpjwg
 Lx0jF3cHrOX1gTGF2y3XnaDi+6vo7n5etmR7Vtm1x07Is7Bb9S12OuZit9LmasPyB6ZHdY0LU/9
 9YoUtddS6nhAA01UysT7bPMBRhEpgNEI4FrQILcfCB5Fi9DqPto6wRHdJGYbsZVQa6rmWu0RtYm
 3s3UYTrJq5b6jPzkx+q/9SdB4Y2nwTaj22UrRHQ1ia+sox6qbd7JXg40xcmUcA+Aipul3211n0Z
 3lwyL8KPBHQjpButhNYkOP59y5KlQxPxpWRxM44d1bBEvIky2FvViYro4fWZhuvW7ZpTECXAvto
 CLULfePyLLxPbarsGy4z0VZr30J8rc62G1h1bCYvVQ6/3QrO/pHY77KqTrT8uNnvmNWUGbU3G+c FR2c8om07K578Ng==
X-Mailer: b4 0.14.3
Message-ID: <20261118-ordered-wq-cancel-v1-0-916e01f9affe@google.com>
Subject: [PATCH 0/2] workqueue: fix cancel_work_sync() on ordered workqueues
 and clarify docs
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: Boqun Feng <boqun@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
	Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Christian_K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Please see the commit message of patch 1 for details.

This came up while figuring out what to do about this sashiko review:
https://sashiko.dev/#/patchset/20261020-rust-workqueue-v3-0-ea7c74d02068%40google.com

---
Alice Ryhl (2):
      workqueue: fix cancel_work_sync() on ordered workqueues
      workqueue: doc: clarify cancel_work_sync() cross-workqueue behavior

 Documentation/core-api/workqueue.rst |  7 ++++++-
 kernel/workqueue.c                   | 37 +++++++++++++++++++++++++++++-------
 2 files changed, 36 insertions(+), 8 deletions(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261118-ordered-wq-cancel-63b02e0feac4

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

