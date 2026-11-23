Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425218;
	b=W3eHsH0zV71p4WClTmVkUSKbq9O6TWXc5WL4xf+t/2Y0UUr8T9PAnA5DBD6macXGbZkb
	 FtvmnjnHd3eYAzlcEhutpVh/hIWXm5hqBqFF1A/W1IzCSiPgsbMfNTTDP93iXLjWuGLYa
	 J4ZuxlHuykGLzp9yrXbjjWsPdmKIuXKmW7xr0o+HQd2K8I0S/DLhABkFLDLHFvRyVWWIK
	 otDSOqI76p8Wbuka/qqkRsk/5qqjhjwOFSi9M9yMIKdKGsLfj625k75NbKhb8UTtm6ymE
	 MMBZNBWbKhNGGVxtUOoQbut0yFR4UaLL5ZoW+bqEg5CPExKUhup3Gh05RxkLemzviEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ebivgiuvbN3l127D1q4e6dwezpwZR2FhoIKtzcUXl9k=;
	b=BpmBIUPDYqkzTw4/kyuSFn6wlpUjF3/FmKK8MMl3eqLC29zO2NVlipjVGArXPxcm5yBI
	 mEJ+1/3lspyZuNxKx/S7RDEL0FTvgP5PiZsU3yqFPIF0nzq/4tt0Q0W57nCkdjN54mk0c
	 MNpqVu8yiA8PBnJBAJC8UOeDwQwD0VxZGMIgsYy6EeNCNjkuGtHJaygJexrcQxc3TPXVN
	 RHe7Xx6GuegwXDFrj/KOKs2UzoCBaCIuSv2nbSNTP2ivkRw83YJllc3G6MPKItvSZ8hIQ
	 aFWTFdxDRU0z5SuX5jxqaAvY+mGljhJ2jVaA1fSdzAZLXtsfYgR/vrEN48LotMJCWSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GDzZi6Mn;
	arc=none smtp.remote-ip=74.125.227.203
Received: from mail-pi2-f11.google.com (mail-pi2-f11.google.com [74.125.227.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AB0606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08AB0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GDzZi6Mn
Received: by mail-pi2-f11.google.com with SMTP id 41be03b00d2f7-cdb46439b0aso1670910a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425217; x=1796030017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ebivgiuvbN3l127D1q4e6dwezpwZR2FhoIKtzcUXl9k=;
        b=GDzZi6MnBEvAb5mfrGHTDZnI8vjcqgLv9IboHCyECqWIZ/+9FelkzoZWjAJJf7fjhg
         ztf7ymroCZbKuE2FHIupYfdSNCkX/CltmAaazkbAfdNyAsK45RI0hw8wKOmCfpBxbOxG
         S5RfZWTqV4tiJ9RjKVArefQfKjsK+KBbuisATxqSpX8SEyx8fPp/vgkynN8m9FksNO6D
         PB66E70MTiKv2UARPEw3XHnhHEYBRc4skSKieU505f5L24A9aPALJixlOdQxB5I+KRqF
         enj9PWPAFfcwIP14EU8l043te4GaCiNvrqmUVppybSwy7oDjps/e6HYEFObGweMyjp5P
         o6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425217; x=1796030017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ebivgiuvbN3l127D1q4e6dwezpwZR2FhoIKtzcUXl9k=;
        b=jS1p+/dkpI2GtHzCNgCHhPyPbEdeJIbw/IKba3ELcse9C9okufEiVgVicXgFj+lm48
         IV1WMQkPPfGz0eFYfh7Fv2Czv+plp1uQf88SvUpXBiuDrYUYlQ/ZrYB3i2eKvn7zawQI
         T8vXzgHec6g9J4XIbA8QeQ0YhKEuPRr5dbZUrw7pa36eKAOaB7Mwe3lZNy0jdbuEc53t
         QxzD9r2xaNtf2NgnL9GHbsmenMSAOs3tvGs26Pb2KTqTR2wh4fu1oYHTzosfDKTjJHYc
         nXhet1wHlCRirbf8nVW9M0sM7id8+hjka65LpjF1ROM/8G7PJr4r1h9bTrQRVj5o23bN
         gvQA==
X-Gm-Message-State: APuU4Z/Gtl9aIAOtrhDBANXvb0pH9QWGE+knrBxOPKWU/Q3O26tp7WJG
	zpahftdz8uZw4CYlTln4tFpMqQJMR86z5zCkjGDaJgj+5tzUIIE4Br5V
X-Gm-Gg: AZFdTZe7umWi+rvzGvnz0ihzYOiNjmH27HYLknXLyimwm54igF7zk5VoASfmHU0Rvqh
	stIyiR1N+CiJGH+kh0PQ4N9EYhF9yv1U8VotH4XnFQQFlbj2ePfmp/Nxtnmu/PHnIEvm/pLk33h
	GvMUhTGLqYUxysPUcQZAYAVngDr+DYwLligX2AY9hhpJtweoqV8bPQY/+uk8gmoRVwbUXajlWTS
	2xZ/A3sCS5I+U6bNJZOx3zzfbzmkuC0kPAWb3eZu6+gsTl1AgYCkqvjwSS4x/wEIiGTsTJRzPuv
	sKzDVRp+aufPsl8Z8TUsRubnXlo7sPOyMKfSY5ijCm3yp6hMj/PR53a7GNelzAJT4pPGmnW+csY
	E6BkW4Trm8XDySIBQm44IeP0Oz6b5VOJuNMqpGlO4FF5LKBQC1ZgK2VrjyR0F/MBqmrq5P4O47l
	fKFqBFG/bkxr1ZYyNdSOadAbfB0wKC9KetqGq6+bfYZwBsJIc7qEjQ3pROdJmpcnysHoAP91s7P
	RVZZhSc6C4VlqMh2cPp4wG/x1uq47zHK7XFCYnV6EVcM85ERQ98C2YCqVVImT00CJTIbYTjXglB
	Co9k+OAzYjDXlEvMU5aioXCkSJ4psWf58rmbBbDEwYl0a3jXI+T3av7Tdk0ZaGgiIs0wi3BMhgA
	=
X-Received: by 2002:a05:6a00:3e29:b0:870:c2db:da2c with SMTP id d2e1a72fcca58-8c87c2936d1mr9928497b3a.25.1795425217254;
        Mon, 23 Nov 2026 01:13:37 -0800 (PST)
Received: from BSDHENRYMA-PC1.localdomain ([43.132.141.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87344184fsm5364341b3a.35.2026.11.23.01.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:13:36 -0800 (PST)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Oleg Nesterov <oleg@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christian Brauner <brauner@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] signal: initialize k_sigaction in sys_signal()
Date: Mon, 23 Nov 2026 17:13:29 +0800
Message-ID: <20261123091329.3658965-1-bsdhenrymartin@gmail.com>
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

sys_signal() builds a struct k_sigaction on the stack and only sets
sa_handler, sa_flags and sa_mask.  sa_restorer (and, on sparc,
ka_restorer) keep whatever the previous syscall left at the same stack
slot, and do_sigaction() stores the whole struct into
sighand->action[sig - 1].

A 32-bit process can read sa_restorer back through compat
rt_sigaction(oact), which always copies it to userspace.  The leaked low
32 bits are stale kernel stack content, in practice a kernel text return
address, so the two syscalls reveal the KASLR slide.

Zero-initialize the whole struct so the fix also covers architectures
that keep the restorer in ka_restorer.

This issue was discovered by Tencent CodeBuddy Security.

Cc: stable@vger.kernel.org
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 kernel/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index dd770e68faee..460dd4d1d548 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -4894,7 +4894,7 @@ SYSCALL_DEFINE1(ssetmask, int, newmask)
  */
 SYSCALL_DEFINE2(signal, int, sig, __sighandler_t, handler)
 {
-	struct k_sigaction new_sa, old_sa;
+	struct k_sigaction new_sa = { }, old_sa;
 	int ret;
 
 	new_sa.sa.sa_handler = handler;
-- 
2.53.0

