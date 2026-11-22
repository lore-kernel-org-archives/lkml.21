Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795366605;
	b=ZSgor7Ts425l/7gYDtgy4GEE9z2Zx1OKWocrGRwZZ6E7J4ypC0osrWYVswLGLDBSwsa8
	 rH5PB9naYIRkYe2n8fgd2YIewgNRzZFglJrWsqfJesTXCPm0YjnLEMkml0NmWM7607AmB
	 4lgKcxog6nYFeNoVq/dFZotT26ZM3T9p2TczKvF3nWgAIs7oW7U/q2sNheagcUxv2PFGy
	 7q/YUVzWPWPmAo6SWfgE9uen4TDf9lRzdquC3VWuTHrW8fNm4IsNwlfLQyK+FfAiBOiFT
	 HFKbJWfq7ZnWf143QdLYWqLBGSbNHhPZIosfuFvdX1bTQal0SmwJKCKYhdAXrmMABow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795366605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GELrYH8zBYivy4PxMXXze6BPTMvfthUEBjTosoYnJTc=;
	b=whswQiEUzmRWcc2qRROGD+ySjxdQIhBVCuMEMDA1hfThPPg5PUb0cdIxNXaYzNq7yf8d
	 z42+OM5AXWDXT+JGP5Ff01MYGLOGukjMTSsNEhg5onstxSRs+aCnbpJChbyuZ+k5k9ant
	 mTh6jUYIWBZURAaKH4YBNyjgAVNV+Vl/MpZJ6MUjPVdjnBhGIqxO9WkT5BL7RmcpdjRBV
	 4XsabGJ9nngOfxcNTTjiP8FOkSOqPgX4mb5OVOLfOE+trLoIvxWK/9xBGILAFQHAgj1Ws
	 d2NUxa0W0j5KczpeRezMyytVxIMsWH/LPGGfM7l02J5ynEkz0WgA3cLkkZJVzrRuWhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0zHGVscF;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63985606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63985606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0zHGVscF
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93f20b304c0so253432785a.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 08:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795366603; x=1795971403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GELrYH8zBYivy4PxMXXze6BPTMvfthUEBjTosoYnJTc=;
        b=0zHGVscFwJeaq32+axXyvuYPW3svBiVjLFTsk9Sb1nKxysCyACPp6SSLwcPgJRK00B
         zOm30roWW/hUXxE0/0yJsjm3b4qgWOtucvjqrIJKF5fwbbIlDwTUPr8IBOh2hhGDRCLL
         IZCaXnkkr2bF0TY0g5D609oDf7fh+Q573+yQaJFQaa+QLL7MFe2gVF6yHFyJh/czy1N2
         GEIcadj73HUT1fDOjw+26Ek5If7UR77M0esLOzixBxKJSgbVJeEUpcDq8n3h+71zsb0s
         Sr3YrcJ1zgf5GwvJ1gwETRoRiR1j/6PHXGMvwGL9Gc4RR33rtRZ69yvqY10F+pKfxai6
         O0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795366603; x=1795971403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GELrYH8zBYivy4PxMXXze6BPTMvfthUEBjTosoYnJTc=;
        b=GVPBTmJQ0fZ7FFPfvxsiLE6IDcdJ3396R8FPmotxpvLeYXPhSYMSQggPqj5u9gMfPm
         0wYWwCjc1gOBdK2nqMhdzuP9FKuc/EaQsWWwEFEV+Lr9KoK8INOU6gZZ8Zs19W8piA0D
         QO6T+0/PA0r2C/dd7/8S1mv06aYydJq1pJ7VQbCiGKVQEJuTarpmIZWTpo1ye4XZHl1t
         kLhEE5v6X+25xlROoGppeF5MtMXplIej0hKW0P2pid1AVU5asFccNTt5A57+HgZWuTOp
         KfHcyD4r5NvmuZ13VB90/BTachePIAnl7yCMZ+rdcoVhUT5EuO5nysRfY75Sd3tz/H5E
         9ehA==
X-Forwarded-Encrypted: i=1; AL+hErEGwiqZ3NQR8GwUemK5GXZiXgit2xSrnHxBZWc9VCcREUdhBoBCkII1jYcLbQkPKnFO2tySszKz3g+g6rM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cDqhJsLmlypMiSNE/AOBse2Q4oOtZa118pql/GfIyH9nrI8JI
	om17EOym/qB7DpLKDBETv4cuOWBNG3144SUxmTi0+zuUobc37lsLRB+8
X-Gm-Gg: AZFdTZdtr6AEN6KJWYLz4N9UdmHB94FZ2BCBhK8CDeZ08ZYi79ataEV4Ku7GiDhcQbR
	SupgAr1oEaB4QYolquaLBazI/cJBoxYyAaXgvIfe4Y/VbdUjuVpskNkOtugJiVHi+CKbCV/YnUr
	jR/g6PG/KA0yv+Ddd+flODzaeySqSmBj5LXFLCpafRp2ZqFGLstDMj/4d4sH5n2mroapjTu97L/
	CJz/WtVJGm4HKEyUnvwilIXK9QbvRw/GhHUbZxonjxMBbisuHB5Qaxa2GK4cF6jGHt8bkbkf3Fk
	v/9yw2qPzDIL7FiNzpYi4Ws1eG13o+wNhWIdHjJWrn5Os1UK7Vt2AKjSu1URo7AcpnrRSAnnzTj
	sAea4W6i7bF3E0bjng0X95V3L5cQQ58BC+9DsuTm3RJYWXb9ElaSAcwdJhEei5KkR6Ptz79TjwW
	M80iFeoXc0LoGZ0cLU3wXboKkeg1S4Zsno0Jsrg3YpTHENK8UlGAILsd6lW8d+nWPbaRz4Gkklq
	KoJmy9XJ78Zvx8XsIt64S4SqoSefI0s6iXdj1FvrJwts8mcQmyu3UUVMnR3nN4K/6ciGzCCt6yn
	NUvjP7PUDXKKHgwnc9IAUt+4ZpAuZTIRyNJUT9YaGawRXfJtZQ==
X-Received: by 2002:a05:620a:6910:b0:944:12d5:fd45 with SMTP id af79cd13be357-949bab2a96bmr1590306385a.70.1795366603309;
        Sun, 22 Nov 2026 08:56:43 -0800 (PST)
Received: from tofu.taila6b446.ts.net ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb349db3sm629367985a.7.2026.11.22.08.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:56:43 -0800 (PST)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: mcgrof@kernel.org,
	dakr@kernel.org
Cc: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [RFC PATCH] rust: firmware: diagnose insufficient modinfo buffer capacity
Date: Sun, 22 Nov 2026 11:56:09 -0500
Message-ID: <20261122165609.1914670-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
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

`ModInfoBuilder::push_internal()` tracks the required length even when
the buffer is too small, but `push_module_name()` can still index past
its end. During const evaluation, this reports an out-of-bounds index
rather than the capacity constraint.

Check the capacity explicitly with `build_error!` so the failure
reports the violated constraint.

Link: https://github.com/Rust-for-Linux/linux/issues/1271
Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
 rust/kernel/firmware.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index a18f8b84f3e3..54c6a13714c5 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -339,6 +339,10 @@ const fn push_module_name(self) -> Self {
             this = this.push_internal(module_name.to_bytes_with_nul());
 
             if N != 0 {
+                if this.n > N {
+                    crate::build_error!("Modinfo buffer too small for module name.");
+                }
+
                 // Re-use the space taken by the NULL terminator and swap it with the '.' separator.
                 this.buf[this.n - 1] = b'.';
             }

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3

