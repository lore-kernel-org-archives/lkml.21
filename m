Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980382;
	b=mgDcrElt9LdCD3uH83lUSfq49eQL3gLTA3ywnFyJ5gP7V36LuOXG7bOaJ3tFvLlHiZa+
	 9Z9m1vVFJVEg1mYRjObZN2awDD8voIgkllGjCM0WoN4hD94i5e6eI7FMeRLXclqWqwCKO
	 94lZ8S7GUgESIJSbImM1eC+3cUDIN53sTaplQdQyoXphsDQHzBFL2VB6U93i11RNZ3dj1
	 VuHQ4B3qImpnxvfXgStxpAzXty4mdgADYpCCZeJoI/2z1HhxRzUTvkkM7aG+lFV0ns8WK
	 2uMq2oZGYkWNPxvVdlm5UMy99Gqbv+E3kcbITrPZOraV7KPkJiLOZz5LRvMFrIA8iNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OnTUX3RjpiKuBl0z2oMbfZLXj9pzVhSggONPVZAXlX4=;
	b=nm6pA6pNh6MWffiqBWOIRW9zjE+gsmhjAed68JJ5Sm7Zi1pcU/688Gn7blmK3dGgeJtG
	 txGhVDJCYwJMBvWQ63wPTUSgZXYsabmYgwpq/88pcxht2cTdgwtKjq+gTz6LNA84fbm7P
	 P+AJwmBofU21zsUZx/CmgVPh4uQcygtA5twjLrWhTkVp+XMkWfUhUHGQ4K0160rmQISNZ
	 w6jlg6aHim5TjjIGmiAOrHApxb3QaXjFX00k1cihEnIZ4LwqocLE25FS6ENd8juurSuNs
	 VzjIPsPTrIuKs1bSeRC7lp2CkSvLylVfX6qjsGf6W+ijl1wBkKEpk4lU/vaDO1TCNFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BsqEWE6v;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78693606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78693606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BsqEWE6v
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b612fd74e1so227396b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980381; x=1795585181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OnTUX3RjpiKuBl0z2oMbfZLXj9pzVhSggONPVZAXlX4=;
        b=BsqEWE6vbtgRQhBkSqqEVTG6v7UxDQmKbkDbb3LW6/nP4/UP2hmD1pv58B02QjGk9h
         HNg09iC5CLtDEZ6Tifo5elk094LsO7/ayo/cJ9Y1lRfPJvjwCKMZ15M6nvHtr1NAAc/q
         7jPi6bi2n2hUCNc0UaB4b0x4I5YrnhTW8WI5g5SuV4tcbM7CkncKc2VF/4r3nAI/Q1BM
         eVTR0Qe6bya7Vqn0Rg++B2/x2pO9MizH4gj0UWrqg/RFJK7IDeGHJ5RdCZDUae98DL/p
         oWnfdv6X2IfNQUsldegcY/CsA22Mtzxcz7PQJdYwJeNoEXsrz9SBmAVSFT+y6w6oV7WB
         0kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980381; x=1795585181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OnTUX3RjpiKuBl0z2oMbfZLXj9pzVhSggONPVZAXlX4=;
        b=ldCyAOtawOWjbAT1b6Bh/LLuljes5oMhR5FwwYHobW+/xBTjW0EdhWciwvC1LnGwPn
         lDPet43YVjzP6mTSCgyasFK52chqGZGpLAhJ7C3aH209rbtZIVhmLXjn8aRwuO4mwjSn
         P0e+i0O5nUiCFYR/HHwRs3f9LGLGN1F1XhWhnjw3yVuyOolBeXLw17VqfjKXgq1NZPVD
         Q+kh5cROn7KIjEu9vmn5+p/7D5OXApyLgrojb3vFSlw2RH9uQoVaDd57UAfzF2dTBh9h
         bTk0AFe4HfsrogL98pil8wXSXy/W0/n0cR5PW5Yi/WoAj15Xg4y8XalUjdbPDNft9vz5
         fUNQ==
X-Forwarded-Encrypted: i=1; AL+hErFeHphAhfbXPYkK39eHt2Ffj5n9vNAYSqPUnuOhKbhNqcTLHRo9Xp+Ysf7zr1mB34gk0JsFh3bXPO+f6Q4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NMDH6XQWnQLLNhJqVMQfcDcuQrooBFHgnywtw4/P5AmyMOGKe
	QZw2Fy7CNuHVs8qf816+eFjupquoplQ7Wr33d3IbfDZ4KDMViobkIiUC
X-Gm-Gg: AYBFou1RkOuSUMKQdTDXfUKKydPubQAf3bo0B5H0aMehnWO3MuOSfQcw7a55IxrkJO8
	QXQ+k3mn3z5H0AW/jV5HXxGFb2s9XdzdVpB3Tg9aS2HF6qjtB9sd4/lB4qsUBsS7rbrEgzSSSdX
	XFYz+kCitvtneECITb0t3IWdEIFa/QGZjUyADyRyc3y+fk3Q3YANGkLWPZ0oDjb9bcZTLKT+IjO
	fvxeKFoTGFW6IrLKPi4gg0LttCXntOFtvwj9uHKCq9h+fOh988a8UrrHtt9VSUnxG5ysWLz0kFu
	OQQjATQmBWMLcbd8HFenjrfvOTKSQNWP1HDdDXVnFtaQnOUmCfFF+N3+Ofq7eW9PJpcQM7aW6mj
	XoeF9yPeWbYxG9VUoaDKHTYmgHYE5rMYzk/NTTeBQHKMYdA6q4fnmfZoUSDb3b9JRsTAJqB9BoQ
	E4DUdLJkMYrIS2On5T+BvdlEFVKMihBhimietcflIHYpy3e5aQthM6+ekPsuBxCpCY5J7mRyLC/
	t0Z2UrtT4a1QfxFSJP+jnO4f80eWRdPW9muT08uTYmJWLHi9kvZmrTjGpiujo5hyypgHsiYsKzh
	QaOaXt/KOIoVKmCg93qmAMZIeeHvd+P4fItJSEDEjJFJc+ws
X-Received: by 2002:a05:6a20:430d:b0:3e1:9071:acdd with SMTP id adf61e73a8af0-3fe976e2b70mr1561308637.35.1794980380746;
        Tue, 17 Nov 2026 21:39:40 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde3c4a314dsm503249a12.22.2026.11.17.21.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:39:40 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Oleg Nesterov <oleg@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] riscv: ptrace: Initialize cregs before copyin in compat_riscv_gpr_set()
Date: Wed, 18 Nov 2026 14:39:26 +0900
Message-ID: <20261118053926.845109-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

user_regset_copyin() only copies `count` bytes, so a PTRACE_SETREGSET
request with a short (or zero) iov_len leaves the rest of the on-stack
cregs uninitialized. cregs_to_regs() then copies all of it into the
tracee's pt_regs, where the tracer can read it back with
PTRACE_GETREGSET.

Fill cregs from the current register state first, so that a partial
write only updates the registers it covers, as riscv_gpr_set() does.

Fixes: 4608c159594f ("riscv: compat: ptrace: Add compat_arch_ptrace implement")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index a005574..32227b7 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -584,6 +584,8 @@ static int compat_riscv_gpr_set(struct task_struct *target,
 	int ret;
 	struct compat_user_regs_struct cregs;
 
+	regs_to_cregs(&cregs, task_pt_regs(target));
+
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &cregs, 0, -1);
 	if (!ret)
 		cregs_to_regs(&cregs, task_pt_regs(target));
