Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795876078;
	b=TyoObMMuNhB/aiVlpawNGoy4AG629oPiCVGV5vZNpY62CRIUSOZJLzGhBWGtBdR7MMO6
	 D/s5A5SJfGPCV3ezA6+LHDSfprG2aVkscuXX7VqkCXAZ5AcAD/ZEm7bsa2+al6Q4TCL4/
	 nxwzk4caaVyMgJm1fOXKoM+PMrp3fhLPkAqvx35vtqghmTfyGLLWenvCV0XheDWHrKLWL
	 SAfom4mOIe8wtVWe6F+vrlNbfh/6oUh6KEPvUbrD5aXpBNp1z+HJ0LSegH1rR7M28qaPD
	 KA/Oj+COvmlBBrgXf/ElHZ2MaLFjKseZfem6qfvDBOqrrvE4cciq7wEntQUNw9KR5Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795876078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hvp7TwQHCrNMIqm7jRQRWAQZXft95G4xN1Dkhbod8bI=;
	b=S6JMoDOgqRU3flGPWqz9ki9T9pEnezLX1mhUCtLkxuiGZq4t4HsLcPLeRufR9S2GAu+2
	 tEEi6M85YOZQKCQ7MYgRGltx5hL7bH/CnAvnFDWWYhAha0oJTI/jmtF85UsLCIJ+RTrks
	 jL4l+mkFVeaMhoScu2ggsaNXdrydhoSgsqlpWK1wOaDCvmttmx2QnYl/GBBqSTsnWMuH+
	 +0XN9qTaTOPYxUN0uMJqsAxaNMURjMcjBdgbT6EUvXUJqyrz1fSzDejJR08/piZOGhC0r
	 /3+iEJGg6Vs6MKCC7evuMzJiyYwoEs0z2Ghs/yBfCyiT+aznQbB49ekU18kKNXyYN+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YzNflN9x;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C940606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C940606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YzNflN9x
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ba12b00c76so9309855a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795876077; x=1796480877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hvp7TwQHCrNMIqm7jRQRWAQZXft95G4xN1Dkhbod8bI=;
        b=YzNflN9xxjMkoLx8oCHUhxYeI78BZR01+EJWRQTgigjHF74qZzkfQ0SXnWpiS9fZrw
         YqdfB/I8fWK9mT5xE/YM/HqYU5rbT7YYmyMiMRF4QruYkehor5yPq4C7ifDs3Qhpw9Hl
         0qtRB7Bd6hSM8Q3laHsVpzWEHp6SZoZyFntxTfQDAMQRhtIYxZiVT95QLNvMOdPihjIu
         ZjSOrrkuGLx7GUvzEFb01c3HIDEc+of5MixiWv6LzidPmC+U3RiVGF5NbI89IGaUsoiB
         sBWdNoMECXguXEuqvd6oDcCr8cKHvam+/pKigVhalTDW9OVPY75gn1PrpvIoEdj5N9RW
         VUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795876077; x=1796480877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hvp7TwQHCrNMIqm7jRQRWAQZXft95G4xN1Dkhbod8bI=;
        b=lbKnqiz2DVnsBj8we1Nnq2JXbYnqqDGXldQ2TjEK9tnlM30BKNzfYINQbAWEaXwBz9
         yUm9uMX1PoFPPd6lIzQmLOrgdO0rQWYtzlGtXOvMco0OYWJNyy/Yxqo1ILD+zUk7flR8
         QKlQa3rR3QuhaNVzRzxx2HSF0WJsslsUSf2iVyo8sbdF86Iy+/Os6+TGF6ROQS78G35m
         BtNNx4CiCm8two7K5UIBv/XEkwM+iMIUqrrTQxpuzwVcn3eMKjclVj7CA6TEnc1zEDC3
         2ZVYbBsGwCNzEs7N/6O1e+ilyrl4EY18faKHe78c9G6CV+eBXESu/9iGuI8M19gBoUxH
         oziA==
X-Forwarded-Encrypted: i=1; AL+hErHm/VLY8COzOnzApcqeST212i808nxeHlkzKw4PrVbs6X97dkcSknit+ngvk/uvVYe6tNDqZ1ocZ6jv4qQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JnYV2ItrnufYs3OYXFuUqqEcxe6BY1lpHUCKTW07da1ejdVeL
	C0vw6QyS7VVzq7PK4ZEJ6tcvpT/F5iRkzfQnTGeGNak6jaRg48rDch0x
X-Gm-Gg: AZFdTZd4JTbz8kLQ1pIN9sMXJ0n826nzFXY3uzpiu3nPi+SuaRq73WDkVtfkM9MYLR2
	1I0Hf9816FjWtNKHS2QcbxwTrOD0HjqknMRlR05TUkTp1Ek/eWhVqW/waAdUr8RJBOg5ZnuCghy
	VQyweELUGl3a5eoOUk/Y9X9V6BM97biLUm/JzVJv2TofijtHI+nJgOi2IFRugju68pbyLlmVMTm
	qxU1ln0N8LHZI753c/oVYzUzamrxZmj56lzLcwCvBOeHsXjG2TNAXi6SZKOX0Tplpd0BPqzj1UM
	maeZyHXMvvNezDBigSTt6GgQCQB53o3H5GklfGJr3Cajwg7RCsghX9h8iF/wO4vpLw3o5uyN3HF
	btfUON1Aq4zjGzu+zEXkga0znLlpX8xOq+HtmM8RCpXxXPvZN7QI+ViSBjFQA8Wu1M7n3xI6wL4
	XlHmCNY8G+NDC4eij9j1i0jeCcJLelS6ghEY7O8CzQ1GvMT84t9Y8HTy2Cj3Ab4PNYqzZSomz4d
	5+s2WGLpvB1hiHRh6AcdNoHWFhC110P1BddyXN3h5RopKybvdStrTWb3SW0bs96lAAOI1ZK46mR
	j/QjkvjQUz/e/WXQZi65fIrv0iqMmRwUxqc6PnObF2FJCwmxBS5Uf3IKucep8JBiHbBiwnJ8ykq
	9JS2JI5wDt3lRkHGj
X-Received: by 2002:a05:6402:4416:b0:6ba:b24b:a25 with SMTP id 4fb4d7f45d1cf-6bab24b0fc3mr13921304a12.7.1795876076510;
        Sat, 28 Nov 2026 06:27:56 -0800 (PST)
Received: from kernel.. ([191.40.25.3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e35ca6sm12448436a12.4.2026.11.28.06.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 06:27:56 -0800 (PST)
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
Subject: [PATCH v3 3/7] rcutorture: Test duplicate call_rcu_tasks() callback enqueue
Date: Sat, 28 Nov 2026 22:27:25 +0800
Message-ID: <20261128142729.3756679-4-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128142729.3756679-1-kunwu.chan@gmail.com>
References: <20261128142729.3756679-1-kunwu.chan@gmail.com>
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

Enable the existing duplicate-callback test for RCU Tasks by
setting ->debug_objects.

Suggested-by: Zqiang <qiang.zhang@linux.dev>
Cc: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/rcutorture.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 1648e6369d809..8c264aaf1727a 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -1327,6 +1327,7 @@ static struct rcu_torture_ops tasks_ops = {
 	.get_gp_data	= rcu_tasks_get_gp_data,
 	.irq_capable	= 1,
 	.slow_gps	= 1,
+	.debug_objects	= 1,
 	.name		= "tasks"
 };
 
-- 
2.43.0

