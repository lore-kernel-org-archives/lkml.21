Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991950;
	b=NciyZpDkqMQRq5WviN2jkF04v+NDDPn233pJqfuCvT+/dx6R2bZXA+RCJ3ptDVweWhVp
	 4WQgz7mfkHLSXwnLx7hh3Trcgs9jj20Ou0Y/4o4aOIsP6OfbHn8KxrQv5erP5PjZ2AGLD
	 DGtWB4SUGsE+grCQcRcte8UxikeOqMUSs8FBwRy+av3+FBMcOXmo3wNStbqGaFSwVMKQh
	 dZtnvw8g+Iu7HJCO4Zqj0N9OW80F/T2PClfL6ExV6B495YBxP/Bh/gxDRTdWBTQtKN6OF
	 cx4PwRUIRmBYg03tBxhYQKezV8ci22sb8vDrCyvwQBwqnaDNFFw2V3wqV36qS7hIDXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K2VXvsE8Kb9V+lDeqW1cFDtziuGBumC83nZx9hEEydA=;
	b=JINTtIcS2KMsWh5ODpufT5qEPkBIWtbfzunkWo7ZGEYaRs6htyesgxr0xX3LFNT3H+HG
	 Wcwh5hK6NjXN5VvlWFerc4hpZvi7XBokpxy3alPvEK9GcZH1wNh8SvGhYnztlEjLNMfRG
	 HIEK7WpBalRdgCJqaKDHSDWWsUy3p+ECjAxpSX3KnxRBWVLxfHji8Mgy00HX14xG3aZF/
	 XDqq5mojvZg8SYwRKn5NP7OW0oVh8lY2jMb0WD0xY/CCs5CyGVTaV7W0trEpWbs7I6l5x
	 CJ1Yyv1dnWI1p5FryWI12PJeXwGR86RdKI8By11gLRNU0GNAj0JeMJnwpq9+Tn77yPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tDy2jNQ3;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B16606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B16606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tDy2jNQ3
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso106893166b.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991948; x=1795596748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2VXvsE8Kb9V+lDeqW1cFDtziuGBumC83nZx9hEEydA=;
        b=tDy2jNQ3+6CLAJF6z69RMjECpGI/Ixk+1Y3e/Tof0O6Z/b0xKNIjN8MNFLJhculQdN
         XTu0n2WIFXEfgoNYuuJE3LVR+E7sD21U+frCl+JkCWNvPuwEMRuUeyusrtpwsLPnJNUL
         /AcR+h4nth5whXbjITZUB+UtH6mPMk3AzJnQt+ViHqbtNi7C0xNqwRhhdKpr+1ckGdSG
         8gIJAeqTvaWiFk0AuYM04VVpNFjZL5rlISvoz16r63uq+rk8uMcxS4BmynBMGcpXGgOF
         /2uLdrRKLegTs8FScfC2lxs7CbwZfNsv5Hfr143eo6iSX8+Fa3JMEMBlTwlA24vPcQS0
         6VVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991948; x=1795596748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2VXvsE8Kb9V+lDeqW1cFDtziuGBumC83nZx9hEEydA=;
        b=zGtLgphj1AdLI3N5YpaKi/bnP89GU+VQZiNrXU0hyTFwHVNoIWU5KEB0curkUf+CW4
         ufX821rG/PXA8OL17lU8PQDyhCTLUGdVNje7FkQvtiKPXcsaC4nOEHoc0KwY5fB2Q/kL
         vurd0fcbmxqfKsz0hQnR6xV2rxJDgnqazRkszIVOn+uUTLCu6pzZ5n1aDkdi5BhgwNDF
         7QLhz0MauTympaGAOR+V4II9oV0yltdi4PHVq4NnwAoq11zIb/4Bkp3NzekejT93qJDD
         sJraTSD1gJSdk2RxRfJUxMD9P15zaKccJQECgw55r/PQVv8r19cO+3QWXKRPj+5Bl3e0
         EOGw==
X-Forwarded-Encrypted: i=1; AL+hErG5If2k3AOUN+14LaVeUuWbOc/eJ9CyZW0g0Nvq6WoFBxGHm+14678p48MXoPySd33oRqESAvmWtyuW8kM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oML/4qjzUrGSLf6bcugqmdMWbbjaHFwsLwGqeS5KiVeoogEUi
	9QtZb41V0lwVA5Llg05teTJAmJnxPYyyQip0+mrxajFzNRoSA6XWLxW6
X-Gm-Gg: AYBFou18GQBa/m1OxFqmdajzEMSR3Q3dPLobhALOLGKpyDrpcnLNf5oU+WgsnGWXEKF
	uWiHT/vD34TEyF0/gkargJ22CzMwwI0elmQiiKNv8DCAN5i5IPUC8aAQ9Yee2SJGxc6AZKS1UMD
	HJ3BGva00JcyR9K0HTr8JaNQDGJ7S7S1+9R4vw+zMMyXetHHaOJdBrRZWVfB9I/+pdinmohOyAX
	RKLIDG634+9hFou1i6o7jCMWGzBFMCtqI30R6QkgldWMPjocrlpp68apCan5fDQg9Rhk4+/9TMr
	6QeGtAZ+7+LEvlK0A37VyysQvN3+L6ZmBJG4KAJspGnA3Wcgz+QIs4oFEJpXBv1i7AgNklxACBz
	/h7icQsH0NBRjx4W3CCvC+NoFZYUhT9F4TerDLp/FOfu/Bd2PsrBBVY1vv57RQ38C4RIUwxMF7j
	jKzw3mGWQQ+KdFPn1jBhxOX49TtXOVU2fgF1quhYXDFKaEu0SxkAllTGpUfEa6JPg9XLG3pvzxz
	gAay5jCYY3eCOHi0DzmwkIh71qnhsB4NHhqTImviRU57ufA0lZBTjCBk7qpG9YiomzduYDbRscr
	Q6GE/bz7q5fwdlwoWcRU5Fk2GbOL1aZqW2taqnJVnAQj7aENbyVrofhshw==
X-Received: by 2002:a17:907:6eab:b0:c46:9d7b:37d with SMTP id a640c23a62f3a-c510e2a8771mr156578166b.17.1794991947373;
        Wed, 18 Nov 2026 00:52:27 -0800 (PST)
Received: from kernel.. ([191.40.25.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510c83f31csm71077266b.10.2026.11.18.00.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:52:27 -0800 (PST)
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
Subject: [PATCH v2 3/7] rcutorture: Test duplicate call_rcu_tasks() callback enqueue
Date: Wed, 18 Nov 2026 16:51:43 +0800
Message-ID: <20261118085147.1668598-4-kunwu.chan@gmail.com>
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

Enable the existing duplicate-callback test for RCU Tasks by
setting ->debug_objects.

Suggested-by: Zqiang <qiang.zhang@linux.dev>
Cc: Kunwu Chan <kunwu.chan@gmail.com>
Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 kernel/rcu/rcutorture.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index caa550095705a..3dcc3d4318ad1 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -1221,6 +1221,7 @@ static struct rcu_torture_ops tasks_ops = {
 	.get_gp_data	= rcu_tasks_get_gp_data,
 	.irq_capable	= 1,
 	.slow_gps	= 1,
+	.debug_objects	= 1,
 	.name		= "tasks"
 };
 
-- 
2.43.0

