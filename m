Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729045;
	b=EFN2vuwzV15Pc8CJhu7P3UgllCGC2G0DY8l1skY0HR0vNkMwZim9PdfqT52tCBgXA7FL
	 e67WdaFtx47rYT/LwTyb/me9maGB9Z1nvBEMR+Jtlgq5O7w+v+mkTnu6PPbvtrnEDlwTt
	 mAzihTIO7N0J9gC0TPzw7e4PXWYDduhFtBKfgef4WXNddo2Q+Ezq1MMox4A8PMJCnwZLN
	 K3pfbG7EXchK0mbny7ThkgQF4fm+Qi8A9iPacz2hzT8FX7+8B6d0KnFhMK+er8bE2nIoN
	 l8tBVb105PtEXurXajjDFBxmL7yWj1lIBgD4sQwcIfObdfUOgYSeAdL5z3OE6SpG8DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uP/6kVUXbVbhrAYhjj9kXY0YqJ9cNzkJI0NxOXhod74=;
	b=ztkVKWeoO1KLc4QGhobvQ7omCXnkAGpVFt7PB/ZhhvYqPBDuQNkH80oPU0Afj2xAZyUd
	 liIeExtTTNYKeJvBvnErTtSAjNfsqv3CWFdnBYhVbQFDA8VJtbCSFqyvhzL9aU5jmLFKa
	 TNcXFsn2zBpv/JJmW5SR9lHrqyfxVyuAebQikpw6HF7eWYMbAEPj5iMxd/clsit4VQEXk
	 y73BvOodKv9JzmjtvvMHq+snPGvVbG9HqJGZUmRy4a10KN3tNfzBhLuLAG+/rSWvUbWTr
	 JkGYS66XZ7M4x5aOpoMLpg5WTjj0esHduyk3XrWQrNFAhU1jO4mQHEF6OBfkBcujFYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzvRbgNw;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2051E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2051E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzvRbgNw
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a07078200fso3939754b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729044; x=1796333844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uP/6kVUXbVbhrAYhjj9kXY0YqJ9cNzkJI0NxOXhod74=;
        b=bzvRbgNwjn251XThpHXsW5t0unYcm3gX8Be+ckcmbKuwdN9mJZI5U0edI5NQJAK7z9
         zS8VDCyiZCsceZh9tNGFJ+OBhXqubZbNQocHOCMiUOhf9VayirpezZ1+cSea0NKLqFGT
         gw/ricZkunTKMcx1zRT6jUwow5WRaaeBEHRfQlxBnR9jCNeJgrgszzJCjxlqna5QVC0r
         7GeBpbWlTmGsWHtuMHp1Bx8cM/8s+odqW2Lx1DqkaQJ7HZdd3oqmDuQ7Wt+ZX675MR7c
         vbZNsg1OF3rY1FCKs/gRvkuSUhQ+6HbLQhF6SiZNyv51i9uwj67qHdqWygGBJEDXOc1d
         87bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729044; x=1796333844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uP/6kVUXbVbhrAYhjj9kXY0YqJ9cNzkJI0NxOXhod74=;
        b=R/8kY16lUt/qisPZICJrPHgUpHbTz6yNnz7Bw/p1fR9hfQcdegfqxaGOYgH3VczEd2
         06q2v1Zjbcj8EX8ykhaWvXM5Q7URVBWqo8Ig5XdmUqrdXrOehQIS3K+4bQZFfe/IW7OV
         Tc+ai/erdATUus83xQJeyrJ8EE4eCXVw2TcI9Z1opPqct/6k9jymohOcydBG1OZNeSNA
         upc4n3IVmgkR50oKMQffb+9GVmJPnYM9zHIMg+pVsK6/JpR7+uoHXvPKqcgfxC5WDQUn
         PaEKNBmgrEDTiRbQo0JzjqXeUYej72XTLFc7KFHRM/uYKRY1N8poph0ClbqZDthcjj3F
         PdzQ==
X-Forwarded-Encrypted: i=1; AL+hErFw+zZUdaxxRzXB/qqzeXLIpwGuIh57kZ2bTly5mK0ApSXBrukj5VoxZDzXXF1NI4k7YEivN9b2z9n8JJs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QYPKOw1Fz0NzARQU9nQRp7d8cpPXq/lPWQGqHYa+uSY2MxYcl
	6dBfSDLYOYTL2FW4RksR4E7mZSxwX681fdBFzkaCyOZRWqFrtduyd9L6
X-Gm-Gg: AZFdTZcO2Wfd5Ycxsr00R/EzlSWhKs+kel/y2Q1rH1nTsr3g/auspPRTNDJh6OjHQ5P
	+v668b7LxzjODTJ8aVUDxD0fLVRXAPrGBAPo15ul7J+W+9U8JjNc5V+DbGurHlIzhuQUiM5H0R8
	Rq7aoxXWcl5AmivhzuCj0BvAB9BPPsLWI9zyenxx6/zNgpOy2H9OWx4r9Mpo1An2D0DdUxpD6RB
	D2kfoVTD8HeDshwcvM+eGi3pwkASlyyUV9YLWrbZJ4fmgz4zMTiz3p4QOenlwIxb5JUXb2GvsDJ
	xU3GOTYJN9xEE5gVDirbprPkka19O9qFWAqSx4XCb2vAKPFM07ZYUq8Fk+MrPYrKBshwAYiuS+p
	jQndhUgPgLD2dgzZHwURLKlc5DeQGeqXg+bL+mEYdbNQggEfGMqbKel461RwhaENignwAcCJhYl
	ZMTBkxyLqXiOKVVqoITKV3CwW5jUYRdLbl3hC5s09JcaO6SUHeAIhJS2W0qFufgj17jslI0ZxB4
	jxDvBvgVIlx2oiWnwpq2XJDsP1Mhgx/htzSuVn0vpNBrj4FAvbUwt3Gv6a5va8KebNcIo92s0RW
	RqrKHBSAc7vePLXhNI52SZ1vfXn62r2gEzxQ39S/4rrOptwOyUl/Rpy0q982voL6QPl3+/pz7lq
	mC/Q8v8ZEg0VaslfXzWkJBc0mCz3k3G99VltL6xS64AILuxb1we9tBOTTPH1zGtTWHwyv9YwOoR
	kZT65arI5UVrE2cWxwNS9KBw==
X-Received: by 2002:a05:6a21:9d95:b0:3f9:f95a:7415 with SMTP id adf61e73a8af0-4014e45d163mr21654924637.63.1795729044324;
        Thu, 26 Nov 2026 13:37:24 -0800 (PST)
Received: from kapoor ([149.40.62.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c38sm11703905a12.2.2026.11.26.13.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:37:22 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Yasin Lee <yasin.lee.x@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2 0/6] iio: proximity: hx9023s: fix sampling frequency, resume and event value handling
Date: Fri, 27 Nov 2026 03:06:45 +0530
Message-ID: <20261126213710.1047676-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Five fixes for the HX9023S capacitive proximity driver, and one cleanup.

1: writing 67108864 (or any value for which val * 10^6 + val2 is a
   multiple of 2^32) to sampling_frequency divides by zero: div_u64()
   takes a u32 divisor. The check added in a318cfc08537 only catches 0.
2: reading sampling_frequency indexes the 32-entry period table with
   the PRF_CFG register value unchecked; the configuration file loaded
   by hx9023s_bin_load() can put any 8-bit value there.
3: resume re-enables the chip interrupts only when the trigger is
   enabled, so threshold events stop after the first suspend.
4: out-of-range threshold values are masked into the 10-bit field
   instead of being rejected (-32 becomes the largest threshold).
5: same for the 4-bit debounce fields (16 becomes 0).
6: cleanup, no functional change: get_samp_freq() doesn't need a
   64-bit division either.

Changes in v2:
- 1: use val == 0 && val2 == 0 for consistency (Andy)
- 1: reject 1 kHz and above (a period below the smallest table entry)
  and use a plain 32-bit division instead of div64_u64() (Andy)
- 4: check val >= BIT(15), keep the threshold with & ~GENMASK(4, 0)
  and add a comment on why the low bits are dropped (Andy)
- 6: new, drop the div_u64() in get_samp_freq() as well (Andy, on v1
  2/5); last in the series as it isn't a fix
- Rebase on the current fixes-togreg

v1: https://lore.kernel.org/all/20261123165255.239490-1-kapoorarnav43@gmail.com/

Patch 2 assumes the whole PRF_CFG register is the period index, as the
driver already does; I don't have the datasheet to check whether it has
other fields.

Applies to both fixes-togreg and testing.
Compile-tested only (W=1 for every patch, checkpatch --strict clean); I
don't have HX9023S hardware. The checks in 1 and 4 were tested with a
userspace copy on 32-bit and 64-bit: all 32 table periods are still
accepted, and the threshold check matches the v1 one for every value.

Arnav Kapoor (6):
  iio: proximity: hx9023s: fix division by zero in set_samp_freq
  iio: proximity: hx9023s: check the sampling frequency index
  iio: proximity: hx9023s: re-enable interrupts on resume for events
  iio: proximity: hx9023s: reject out-of-range threshold values
  iio: proximity: hx9023s: reject out-of-range debounce values
  iio: proximity: hx9023s: use plain division in get_samp_freq

 drivers/iio/proximity/hx9023s.c | 47 +++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 11 deletions(-)


base-commit: 69bf7489f01ffa3c3269d09eb8a0668b1bdfa053
-- 
2.53.0

