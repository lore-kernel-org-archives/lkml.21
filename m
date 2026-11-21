Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795280990;
	b=nHE//c9FAxJptLEyhlaClFkSOgjJam6AovyX3rAgPMb79qjFKyWxZPs3cG8VU7GniSQU
	 e2VCnyuZPRZr/WvL9RxMm3DIbZHud8YiHPhcJpTZ0S3L2lqnQguQeCJw6uf8LFizYPrIQ
	 qCrOeTQZ9Qj5tisF7x36q5rYAhCsb4DQnVKDd8LO2xyGJbIS/wtEKUK0oLX0laaPNezAM
	 2PuFnkwRcuEdSAAOrnJ44bJHGK7s3qHTxO2haq9P88zgE0L3LqjNk9EIVRfInZReeD55x
	 DtODALggrNMuYmyT8ClIK6kCMo3N0Jvrg9SGe31Fmaj7KeGoDHlvZVmELwrGphU2XHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795280990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=+/DGpjCF1AMbD6J8UfGRizKwiMAblO4BBrSABe5kffk=;
	b=oc+HunjpB37YpADAzBNSBPHUM5U05RiQECSRBZWqws2aUdU2+MRH+2rD9RGa6dsdMIiq
	 9PwoXH6NFSo0OzqjtU6H99fx0KAyQrYrZA5+zzcAakW94avGHuLxJH0hT15ZNbdjwdi1p
	 Bhx4Sf/qR1fmpPZ1JxR3eHCrD+EJXFOKbe/LnihbnipzaqTyXSRFFFGblV6nl231W/+74
	 aMi4aPcAXMfcKUQMWZkA4+onTpGYUnqI7N4K4MCVFK/SgmJEmEynhH5/LG5uSrL3VNcRl
	 w+0BuvPRz3viHbLchdCpAG/zIWZzrpcVI7MagrXbazQ3THWVhRljDzRcRyorAq1mXBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FBG9O+Pa;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CB3606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62CB3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FBG9O+Pa
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b50dc340d9so39532c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795280988; x=1795885788; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+/DGpjCF1AMbD6J8UfGRizKwiMAblO4BBrSABe5kffk=;
        b=FBG9O+PaG46G74PboDUZtRyJfjw4wJ7Vv0L1Fr3Xx/8ZvoTyIBK+C/wqKh8uCFct9n
         VJIakphsTpYnSLK93XCjiis2PzQcVmI9kOtO5IGsDl4KfR+eKwdaZ3EohsZDYUf0n+4h
         TuNTv/EpOgT8UiB8OpeAsbkor2TaZxcCETr55ZJEJ0oCeoowlMzbS2pnE8oQrYd0N/hf
         eyE6/fUnySBSa/YEQGzuM195nDjFrWMPsSX1yRNheMmRfCm1oCTWE5TyD6T3ZkMUwzK6
         tQijLxlZIRRWn/2Ztk/MChpbADDMolkvHVxrmW0kXXYlKh3CmiRtHaeix61Mm0sRSSLU
         sqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795280988; x=1795885788;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+/DGpjCF1AMbD6J8UfGRizKwiMAblO4BBrSABe5kffk=;
        b=0Z/dsGYabu6sKLLX1uQTcel5hGkbN7Ca2ndLQtU058UDNEXNC8i1U7Hk3HIq5bJZ1P
         CEyY9M/Pytc021+ACPOIIazGJzTwAmI9iBcwDkyuiSlmviw+K+Z+7gOwIYDTlj05/5T6
         v2XGjughsIEOnymKrifdaCIDmySsKqT/ojIlPE+aFcpUWpT06Lrs2hrFfzQmKWgLi4uk
         /Y3+Jq7uIV8pleKEU2fUctD+RQw7UEYpNEOhaNco9fJAYGcEgKMbtM9CAoiBE9w86ZN8
         KIvESLhaTWTMp7+AiC67EWoGEdvE6x0ic6/3iWjNmNzpOKBGHVpUymq4s1m5brEjx8KS
         cf8g==
X-Gm-Message-State: APuU4Z/Qi0YK1fh4ShJxYJTXIoWBXD7OKED0BRjdKaSYEzJGWOsUcT9c
	snv5DuZeBsZADFiGNtZ2tOxmgxnq6kcgRR08twV4reog67ibUdeSa/NR
X-Gm-Gg: AZFdTZfGbyh64EgeBtSTjL9CAqGXrfMe1MnBsgZ3zk+N5b7jYFaPCEQJNOcIvzSwCAR
	wz9s7qkbnWCpYxLu3fGtF9/Cj9MH2IgWp/TTcXA04pwqqaA9DS5vC58e1Di+WR9IqlP65yfxxUN
	ttq1maK0HZI/lE+klEChRLCRsHa5Di832lb6KfEfeNJnxsnzVPU4Oa0i4aXnhywrm+cF/VxHa8M
	xHUZcIH9YWaUv6n626+DdfuLaDU4FVvH/8d878AI0+DXSWvjxq6SYN+qSReqJU/9eh17+opivts
	36Awv9UU01pYBVYdGvcJmQAWGRC85s2Y8WaXtO9YNbhClwCQneWJcOnk54c/r8al3VjCasY7zES
	ewNCgUOU4GvOJ0t09+Qd4WAesqDTZMFJp75H/QldXQt3WpHtLMws+5bEFnUkKjX2SGxqXwTzsiL
	WuC4pP2nZ2ahFMYArRWcNY1pp/pSESbteaX8ZW7rhQF+X+kuoDeL4BNSidtBQNwaNXSX6h9jS7X
	oqmqW3Ib0ZhFOFBLQtRcJJtTMYc0lw/4m8U8f/KJh9A2oBVFGbgc5AeSrUiMwCn2EU3jvMVuIZP
	/PCV3wI9/7PZIOqnfr7NSGR2s0940b9L+wyCLf+DANACgV3J8njM/kyEPn3k7HojLIQ=
X-Received: by 2002:a05:701b:2919:b0:1b3:a881:a67b with SMTP id a92af1059eb24-1b5568a8a08mr8858631c88.1.1795280987955;
        Sat, 21 Nov 2026 09:09:47 -0800 (PST)
Received: from o6.lan ([2602:fce1:44f:115e::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm22813152c88.14.2026.11.21.09.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:09:47 -0800 (PST)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH RFC 0/3] zram: avoid copying spanning LZ4 objects before
 decompression
Date: Sun, 22 Nov 2026 01:09:23 +0800
Message-Id: <20261122-zram-split-decomp-mm-rfc-v1-0-4e69b08c0fed@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAETQAWsC/yWMywrCMBAAf6Xs2YVmhfq4Cn5Ar+IhTTe6YtqwW
 0Us/XejHmdgZgZjFTbYVzMoP8VkHAq4VQXh6ocLo/SFgWpqnCPCt/qElu8yYc9hTBlTQo0B102
 M1PnNtt55KHlWjvL6rU/QHg9w/kt7dDcO03cKy/IBajr+PIEAAAA=
X-Change-ID: 20261122-zram-split-decomp-mm-rfc-36ff2ba7809a
To: Minchan Kim <minchan@kernel.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
 Xueyuan Chen <xueyuan.chen21@gmail.com>
X-Mailer: b4 0.16.0

When a compressed object spans two zsmalloc pages, zram copies it into
a contiguous buffer before decompression. This series lets the LZ4 and
LZ4HC backends decode dictionary-free blocks directly from the two
fragments.

I measured the time to swap in 1 GiB of synthetic data on arm64 with
4 KiB pages. Each page started with pseudorandom data of one of 16
lengths, followed by zeros. On this workload, 32.6% of compressed
reads spanned two pages with LZ4 and 34.4% with LZ4HC.

The table shows median swap-in times over seven pairs. The last two
columns summarize the percentage change within each pair.

  Codec  Workers  Baseline (ms)  Patched (ms)   Median   Range
  LZ4          1        1403.81       1344.45   -4.21%   -4.64% to -1.61%
  LZ4          8         222.57        216.36   -2.73%   -4.19% to -1.97%
  LZ4HC        1        1403.35       1336.99   -4.74%   -5.07% to -2.90%
  LZ4HC        8         222.10        215.77   -3.16%   -4.39% to -1.27%

These timings include both skipping the copy and switching decoders.

I used Codex to help implement this series.
Do you think the swap-in improvement justifies maintaining a second
LZ4 decoder?

Assisted-by: LLM
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
Xueyuan Chen (3):
      zram: allow backends to decompress from two input buffers
      lib/lz4: add safe decompression from two input buffers
      zram: use split-input decompression for LZ4 and LZ4HC

 drivers/block/zram/backend_lz4.c   |   1 +
 drivers/block/zram/backend_lz4.h   |  19 +++++
 drivers/block/zram/backend_lz4hc.c |   2 +
 drivers/block/zram/zcomp.c         |  28 +++++++
 drivers/block/zram/zcomp.h         |   8 ++
 include/linux/lz4.h                |  18 ++++
 lib/lz4/lz4_decompress.c           | 163 +++++++++++++++++++++++++++++++++++++
 7 files changed, 239 insertions(+)
---
base-commit: b95f8bb86713c860ce8536d22a988b949b884d5f

--  
Best regards,
Xueyuan

