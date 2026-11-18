Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991941;
	b=ZBv7yjOchsZ5yjKLshU7hV8hpeKL0s/R/Flw5hE5pVjgnO6Dcg94NrLJERwmaYJIZkgX
	 jmLCZV80nHbgG54GoDLA9vCq7gjVXv4NumhV+Q3HqKO0bW4pys3vpGrQjhe1v3pnzO/ka
	 ITt9cVKA+7dU0jHoaad68fZ0I34Lqqxc8uZMV7fOVxl/Ov/tOrYo+72p7c6poEwu7JEae
	 w1Jcgf4nzrgG8jHjZgqMyxultvusv5eNkymsQHfGgjYQ5uPq6Isz/RbEzE3CsJAeib1eU
	 9iseUqyJly7dMhe0a4aawyGK02WqEy2Dy8D+8MqiwfgIQwVjHeMrEqYWd9/vBW+n3uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MH6h5yZLan++n11pZrmjLLjasWeBnmoXNM7NAKKbaGg=;
	b=N+4lVTEA07BKkURrNkV3eOZaUH9vM/Okta0h0dWTrii0PcVRJB63pdfepMYpmobmp2MA
	 xbab/mktvzi/UwiCComblWyWKDVKoAfnAzm/ZphSvrbDReGByfqAupdYHQHS2BVgZi0g7
	 1BfWtefiWQBiBR8TmQ8f2bHNz/y+tjvGVpHtAXUtYXU4shX61ri/M5XAIBViCsdF8isg8
	 OoMyiusnY6nfbAmn0YtMx4OpEYz8LFOdM+YyX/Od4vPpwngqtVBQaB2mgYt+GyZPoiTZa
	 /bKqFL2NcE2LEunGBZPSOmbc1H3DbObl9p+1+7M2gTAibpP91RxnbhfNq9NTtYhoIXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p6r+HdZK;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E06D606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E06D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p6r+HdZK
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4697404c2bso71597766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991940; x=1795596740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MH6h5yZLan++n11pZrmjLLjasWeBnmoXNM7NAKKbaGg=;
        b=p6r+HdZK1xiYYCINoTCEtmLiP+rz7k4S332McHIJfs1CCJXMQUw6o5YRLByHzygS9o
         zjjtU3mxlZAw53bLKM0o71tFlYck9QdDrym6Zuz3dBMgNMocTROoaT17lpFWBqQGT+EO
         xoixsFZhBKW7J1UDXpVt9deYJPGNhtQCBxH0VO+pR+Sb7JgYq+EVoW+fvJheE3H+QkFI
         rzQUBkegB/X1SMfSdSy7sRomzhXVc4WLZW7KTlT4doajipjrBtzCsAVO5lSUGpNdV5e6
         8FyGUkt596p9GjYOMNKUopSxhSG7k8KW3mAjIaq/Dn7neUjMbB2S6zFYWuelshQzoz0/
         iLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991940; x=1795596740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MH6h5yZLan++n11pZrmjLLjasWeBnmoXNM7NAKKbaGg=;
        b=uQHwLBS9EdWN3N+oOKHjfONW/QOJJCE3O29rbeajtG3Rlmcukhkp0Q5YtbYjCkLRY2
         1NyLEyUlFM5OKGBHuCAnNVqQHVq9WdJ03NMDCkxVG2Y6PMrowp8yCph8O8B8XopP3GDr
         b4cGwIZE7xtguifoi68giLSWp+bBWxiPpLX7d3qHon2ajZCOhF6isyvQKCjoZhMXMjz7
         RuyXjsq0Bh+8poYFZ0FrAeZ+ITpq/ekO2FfKot2F30y7qsreTU9YVVF9hCy9n1uwmQ/a
         Lhkk7H0TAzGrZ0x28co2TK6sEOcxd2DgOAyjr9Ee9ZYQa9YPjiPBMo0BntBV2SANxoic
         EIqw==
X-Forwarded-Encrypted: i=1; AL+hErHoGi3u3JM4RI/XLR8/g0cgvEak2big4mG8+efKUicauoQ5DoC9VqAmgK3N3TIa9yVQTwXLQcZNChEtpIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w5uiLZHNjUmwiFalYNMEZX5/jr/baoy4NWpD+dtpRDCtAbQT3
	vv2yhEcbHvKYJ2VYQyZE49EcIgNRpIdPtlnXF3jeWAFBE3Kbuespzk9p
X-Gm-Gg: AYBFou0/KkkPX6TRc8wpkGPDc/jFKiej53eBGsRPhnsWQvgNiCXL/03g3GHe17Es4xz
	iWNY/WopDyXUkUacuFapKHdibp1X6D+n46Kfxti7q7Fb0SxY2p6T6gyk3bfBnJQGv+EZrI0I3cx
	H6QqKK4qWJXXQqli3tlKiz6ktSJOhY4Gfqmape7GIHsqIUXSqb6XubX0X/NIcb6P18ro9UGbo7y
	02IxNWesyi7Px/vb+ejCnZQo6LG4odPdpPNxeWpZEpW584hufYNz0qYKes8khaQKW9KEltOivLo
	sDyqpUgXcd4mawgBevkEsfOSW0UaahO1oEpiJUsh1jmnNHKYPErrlLGaH8DGfFCoWI0Aus31SS9
	rm5RGq+g1Ja7CjwClcBnl3nEON1KJGvR/XpS3DL5ENXFk8djxFXxW+aYv2z9WEY+bnz+/7IG6YG
	pgAy+jI6BB6wxsd1ijrqdCHgHgEQYIhe2ZcUKk7lmz5zFwDwMchVbF4WTYT7jFEjHGPwhVurUiO
	7b1e6oQV5njgRo46EAHn3jjrhnWxukM8/EuT+vPr3ZBF+4pIFhEY2jXEt1dXYoY8bXyl+cB8nOM
	aylB73l8EHYXFqJ4cYW4TYactmE9NmOA3w9D
X-Received: by 2002:a17:907:3d8b:b0:c50:5005:8ecf with SMTP id a640c23a62f3a-c510e0e8be4mr150691266b.8.1794991939176;
        Wed, 18 Nov 2026 00:52:19 -0800 (PST)
Received: from kernel.. ([191.40.25.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510c83f31csm71077266b.10.2026.11.18.00.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:52:18 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: dave@stgolabs.net,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH v2 1/7] rcu-tasks: Record callback enqueue stack
Date: Wed, 18 Nov 2026 16:51:41 +0800
Message-ID: <20261118085147.1668598-2-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118085147.1668598-1-kunwu.chan@gmail.com>
References: <20261118085147.1668598-1-kunwu.chan@gmail.com>
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

Tree RCU records the code path that enqueued a given callback via
kasan_record_aux_stack(), but Tasks RCU does not.  KASAN reports
involving Tasks RCU callbacks therefore lack any hint as to which
code path did the enqueueing.  This commit therefore invokes
kasan_record_aux_stack() in call_rcu_tasks_generic(), covering both
call_rcu_tasks() and call_rcu_tasks_rude().

Suggested-by: Zqiang <qiang.zhang@linux.dev>
Cc: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/tasks.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
index a20db323612b6..fd43cd5d5a485 100644
--- a/kernel/rcu/tasks.h
+++ b/kernel/rcu/tasks.h
@@ -6,6 +6,7 @@
  */
 
 #ifdef CONFIG_TASKS_RCU_GENERIC
+#include <linux/kasan.h>
 #include <linux/mm.h>
 #include <linux/ratelimit.h>
 #include "rcu_segcblist.h"
@@ -366,6 +367,9 @@ static void call_rcu_tasks_generic(struct rcu_head *rhp, rcu_callback_t func,
 	if (WARN_ON_ONCE(!func))
 		return;
 
+	/* Record the caller: the irq_work's stack says nothing about it. */
+	kasan_record_aux_stack(rhp);
+
 	if (debug_rcu_head_queue(rhp)) {
 		if (__ratelimit(&rcu_tasks_dup_rs)) {
 			pr_err("%s(): Duplicate CB for %s, %p->%pS()\n",
-- 
2.43.0

