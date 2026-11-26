Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676414;
	b=QxlSxJ0aqRlkoFSEk1KTgg0w+i8oHVVmDNyI8GPuQBQAJVCKI89OQK/KsAxD7aNFgEjt
	 mfnJ+OIlXWjlxDCtubhJuwxfAKcLHiymvWuf89H50yKvIpe9hiyTVH0s9f0mqqrZYiHez
	 CJjgZ5CBaiRYFP5TIg6y3AZsrk482AdIXxNAOsyfjGLcAX1KpuU2QTRVmbMQiqBPmI4WQ
	 JReY3yA5r4dJIJ6uSUX5lkV/dgt+sZxz+dyUGMJ+0DjtkPRr3mXeWZK6kIA7SHLIuYR7q
	 KRYGA8zbBqOffoK4tNW5Lcb4YjOdMJQ1HdqqEqi3D0zvLtNVwzVoeEaoB3LZrWXBuRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wy2ZfDuxZ+L0rGiTO2Hr2gxsNqdlmXKGnqLfSzRtbhg=;
	b=nNzybVe8/FZygesX5aklI+lIdHmOZIgLxQmFOYWRjH1H5DaxSiu9eUtHT7yVf2eID/+R
	 Ue+KlkrMhvRNkbH13ZznjowsR74bm874Pwy5UKbBwkcsNh+wslOh9xMyVwYmk6xuxiIbp
	 gcy7+kUEDtW/iULotC76h69k8WfJB2RiBRgo3vmP5OLUjU6LzW/NjBjSA4ce4ObvXbDqB
	 0KVcaLT1sRyEbhlbLdAPmwr2ZZarsvo6Cc7sOqkHbXOPVU8jRj31uSc6LmOBD8RTW8NQZ
	 G2kridvEdYO4/YeFhcCk3u2bSlPuZw7KKHoaD0X21HbfetKzo4b66SZN65NscRECTAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eIqBQMhu;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2602606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2602606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eIqBQMhu
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so5399896a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795676404; x=1796281204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wy2ZfDuxZ+L0rGiTO2Hr2gxsNqdlmXKGnqLfSzRtbhg=;
        b=eIqBQMhupYMGiKV/6qlv4Cq7NXKn1OMb9eHtz72hxZv8xTGGeTQAZLp1YqYfVcvhlb
         GL1wxi88tFxuG/VdUhYm87woHu8EwSvU5wLvQTSezbb/Qzp9Hxb/YXGxdYQh4D159BzV
         AaCGZEwGJfzhz7Wx602e8f1lpTSRboxCYR+rwyogwv0JbuZVaHEqwhL73EkEUlqEVdU5
         iyXeDmfYWcDcdsIzUifNY0G46DEA2cYbmsa2Bvxd7MEN7q0G8KTWcHH0/c2mJtr0lCNV
         XHcNx2vRV9mL+f7UjHLAovSDZZx/UHcoVoBPvTEk93YdNSawrymTVWCKXQmvGoAzxqtt
         OwTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676404; x=1796281204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wy2ZfDuxZ+L0rGiTO2Hr2gxsNqdlmXKGnqLfSzRtbhg=;
        b=RJOWcTyiL2z29aMo7EDttWMsoNBPd/rizxpc0m55/PFBU9YQX4FVc6Y+SD+vu79yn2
         hliNVriXcrL3wnX+bteLVHC45LxO5GOjR0xOxcvr8X8csD7W8wV6SAboelIjatXVxCtx
         VKE84cayeTKzKo+jfphPFfqJzFyeOJbEiM6g9EQJnvSOvp4sJTXjGUCx3pUcL1zEoalI
         SDKWdnHYNpVaWl6rBohgDn0hTLUFM2FOISbN1fZ7s+c2WvS3kwzxkVFWlw+mJB+bWiR1
         OsWYeUSkPsirZ296r2uX3mgYr6wr/px30r1NEHy+ecwuyH3H7rzl2G6vvUzx/wrx/r7k
         Oh0Q==
X-Forwarded-Encrypted: i=1; AL+hErEnVAaznXwUc3pSsnf8ZWsU8bOGL5Mm8YgmKjV+5PnpDsvoWkgKvUMLn7MnfcRNIwP5qH7X/AIJ7Kp8UwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8isRTQC4zKY2GDK3+d8UwB8pM75LkX/u3b0BkP0jG7V0Sf3ibW
	5SIYlKAtudUNQeIrCJibLmbf+XKUjHrdLS6anpAlerGXPcZAkK5OAhhG
X-Gm-Gg: AZFdTZfJWzUsOVd41jDPqsyCYhH8gVCp0VFC3pYA6TUjYMfHKNrtejlEGrwUQByVZZe
	5aYAgS3hxvGeNfdj7BoUAkOKykh6Vgs+e50jt/O3or7Ub7jDNyAnsTjS0cI1WY7VrnpNU6HTXvx
	JZ7gx0XxnvNKB66FSlsx5F3flW06ku83Mkvp7Sdx8kigbvbMqdUJhQuYMylFbYGZNJB+DWCiPHy
	mFNbF6wOhG/YTDzqdcGzgbcLG7WjpRMP09FJqZWmPHP1qQWjgYqP2DsbE6ovH3E48zcGLzWjPT/
	chWUc+m98sSOzjgX6mH6PJec/voH+QqIjJRVnHGRlFxhPxOZJGfk8X6MvrRfcG7gyXY97wA325M
	qDvej1CBvRunWz4e7iBMQRVDBqRDnnD8FWbGTCEs3a/UpXvR8e18JtdijdikCDdFHfYUFPrArrN
	kmIpQc3VEB8l9FpbKO8EWDSv5+OO016opF4b4X6CeivXou4mkFLPn8+ZNJnCCmVmRySwIY2O7N6
	sqd6F8Ay9jquuX8y7yXvfpM8xFciaS7GviDzQv+giGP6aoimrfqWAwNUASNAvLoT+7h9Mi5YcHr
	UxRciKXGvklGz0DqYx2kH+ATr/aWY3XHtjaKrPiKu7qlAXWGy69ptR+DV/9hEX4nAnVS6XV9ceu
	gLGR+0t31OM4N6Bl3drxF
X-Received: by 2002:a17:90b:4ec5:b0:3b3:adea:4b04 with SMTP id 98e67ed59e1d1-3b41c948521mr18210202a91.36.1795676403878;
        Wed, 25 Nov 2026 23:00:03 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([2a09:bac5:cad0:1caa::2db:4c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm34150819a91.15.2026.11.25.23.00.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 23:00:03 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Koutny <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhiqi Zhang <zhiqizhangg@gmail.com>
Subject: [PATCH] cgroup: Preserve sign for fractional input
Date: Thu, 26 Nov 2026 14:59:58 +0800
Message-ID: <20261126065958.89207-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
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

cgroup_parse_float() parses the whole and fractional parts separately with
sscanf(). The sign is only carried by the whole part, so inputs whose
whole part is zero, such as "-0.5", are composed as positive values.
Inputs such as "-1.5" are also composed as -0.5.

Callers such as cpu.uclamp.* and blk-iocost reject negative values
after parsing. With this behavior, negative fractional input can bypass
those checks and be accepted as a positive value.

Remember whether the input has a leading minus sign and subtract the
fractional part when composing a negative value.

Fixes: a5e112e6424a ("cgroup: add cgroup_parse_float()")
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
AI contribution disclosure:
I found this bug. Codex modified the code, and I reviewed the change.

Validation:
- Built in a Linux container after applying the patch to a fresh shallow
  clone from https://github.com/torvalds/linux.git:
  make O=/tmp/kbuild ARCH=arm64 defconfig
  make O=/tmp/kbuild ARCH=arm64 W=1 kernel/cgroup/cgroup.o
- scripts/checkpatch.pl --strict: clean

Duplicate checks:
- Checked torvalds/linux commit, PR, and code search for cgroup_parse_float
  negative, -0.5, and sign-preservation fixes.
- Checked linux-next master and tj/cgroup master; both still compose the
  fractional part as positive.

 kernel/cgroup/cgroup.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index b3657e72db..bf7c3267db 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -7540,6 +7540,7 @@ static u64 power_of_ten(int power)
  */
 int cgroup_parse_float(const char *input, unsigned dec_shift, s64 *v)
 {
+	bool negative = *skip_spaces(input) == '-';
 	s64 whole, frac = 0;
 	int fstart = 0, fend = 0, flen;
 
@@ -7554,7 +7555,11 @@ int cgroup_parse_float(const char *input, unsigned dec_shift, s64 *v)
 	else
 		frac = DIV_ROUND_CLOSEST_ULL(frac, power_of_ten(flen - dec_shift));
 
-	*v = whole * power_of_ten(dec_shift) + frac;
+	if (whole < 0 || negative)
+		*v = whole * power_of_ten(dec_shift) - frac;
+	else
+		*v = whole * power_of_ten(dec_shift) + frac;
+
 	return 0;
 }
 
-- 
2.54.0 (Apple Git-157)

