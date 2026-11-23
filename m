Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445102;
	b=oVmnSx50+vIaj/jKnhae6MHGFXILj10Swgi2lAFosxNzEvfsA49WOS28qhCElPb0Cg70
	 3x2JrEcllG59btoaqjEPpukHxEIoGCGhO4D/6NwV4Zyr4K61+GyR/2UMaX1hqESMruZHH
	 16atsGkz8bUSrMwDlstCBfYDRWdIjlUxtD6gel+CG8+RlgGD5m8TVSSqEXZv5ar+OZprU
	 aJD98edfnuVQyxMCPaPCFPr6SYcvZ/M2ZVMGsbg5lQxnWwZTqiViYJFJHVrRBVyXgaWAX
	 S/h2JMhuWGEdY6E0v4oKLoPymcZZWX0m0PmBNhj9DRFltDLBjLByealpJxoO3BSItzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oroJDpKY2n8cvcz82AUhbS2tqIsCRV2vr8OBoeaBK8I=;
	b=kt64sOnXQBWXHxrErvS1OqTqzJN4xS5PhixkrwIeK79xeDx+JJLT1QGlkDwRqtlZkrqh
	 Hc5hQpnd5wwWCoSDGlFUvcFiRA4Q5xQ3FR8NczbcwSkWjwc8IQNton8jvMTzCarfJycjE
	 NX8Wzmexvr2kn34AuvYGNr96ZWDRiPr6YzlNjIje8dkLcsZVllYpQCEttd5lLVKRHp3ma
	 KUNA3yEgb/pJO/E0nEN3XtXDU+l0MAPQHUXIJ0wvNx9NVZIXoc/lYQr+n3IvoKIT3eMkF
	 Bb1M3vxNTxyb2mTuNQnrz4Gi5s8JaWAQH4yBxvSIiRMcGiufLnZac+3AQsIQQSjqyuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKvEr3le;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40DB606A337
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B40DB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKvEr3le
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b403511a3eso405424a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795445101; x=1796049901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oroJDpKY2n8cvcz82AUhbS2tqIsCRV2vr8OBoeaBK8I=;
        b=nKvEr3leziv3c4sG72Z0We+liDj+aNB3C84dddoOCQ6mzbB4izvIXB3GU2dLJJZAkR
         cLLpoEs7sT4JsRBd1qEl78UlnQvpw0Gt9/ppOd4LvCvS05LU8Smldxrh3QWciGUelJbI
         7n19l+XK7G1Fammfo50hJGt11iOnmd7/9JBFe8goPWvwF3CJXi8rCfpu/aJZdBUosE8k
         S0cJawnBatIMml+VaOBvPJhTnGQ96Bq6gA/bRb6lHJTRoCkY9l7atcj+xQUxKDFTIZPS
         p464wBR3TLqiWIklYivSHlau5FSdWFaZxUcp4Li+F/JDp8HgFZqjy6X+792FnRdI9ysW
         Zrqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445101; x=1796049901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oroJDpKY2n8cvcz82AUhbS2tqIsCRV2vr8OBoeaBK8I=;
        b=jSRaUNv54yNnw3jTjPiGpdH/BZcKnnOCA2BfILN/Xt5EsYKhkOnxZYDZNhUfviDpNe
         gBCv6aWcKOHnOSP5yM2SEQKPpLv78aUdYwtOceAPRqvMHM4HQLqiopvZE6AFJ9wpR7Fk
         LEe661PCiURKnwSdooHIU6P7rUq5dg6Ein0pUBpZM1Cs2RO4ALbSIud5FAs0gDYHGTJM
         GKi16JxnutkVnCXsgRnFD42ArMyMtCsG3dMgAhAO2W+b7cr4XdpJvJ7Lcg//WVoGf3hS
         aa5WVwBTD/m0C4Z6V84h0iX+gWS1UXgYY1gC4r7/kdEHpCTKQbmPO+3dvepzyPpfE8g0
         M67g==
X-Forwarded-Encrypted: i=1; AL+hErECBPPD3SimHEU5dV+J/8uo19umoonY0Z04CCsA9syRezMmK/p+sHRjjE7iUnPs3XuDKdC7tw5uFn6xvrw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HMirLaNy+qVx0JvywM/Kyc2rK7+iRZAq2UIQ7fDkDGA+JjcIL
	1ItV9+R3HZUQEJCoElxHeT258t82x8y08hgkxV3tLYkfxWwy1jx10ao7
X-Gm-Gg: AZFdTZe0rxEAS0nuIBTLjN58My+3mgGDnqO0tN2JA7Wgph2+Ja6dOVozkYp6ddRidhH
	wlzoaHj2mNNghowdqdj324n4PXeylRmiDwUqzgo2cs7aSywUwEssPGlJro3L8CpYLsNYHWIk7qw
	6e0AzRN/5k8ta81SwhZkogr0tekFAKkHaVNPW/L4r1yzmmcrtXvaynH6P3ReNdRIxKII8nNJNVq
	//wh2sdi+8TvblfMW2U+kcANUX26EjBr5J0v3eOQ6eyCX3uC5RFz0DhwjtjwqfL2LlDum/1U+1K
	mQw2plpfDjd2s7pSaneEx+OePn/7vQahGx693yyUu6CxlYRRCH8417Y3EZ7B7jbtU7k86OBaZZZ
	HcZQLd5F8G0CwzB6TdtyjXpH0TxgS4q/DsEEeV2BN5DEDzKRQ5CojOFj/Y1Wg0oKAElVI1akiCv
	OGYXwEeEJ6EaQkfgBR8i9fWf57TvRmAJa3pXApRg9PmutAsoC3AExhOcNh0zKzXVueG+uqQoXlh
	o3cpVcIUyXlDWf8XTeHFnENYAC1R7PANGMZVcKZUcWdzS5107SuS13Q48MPhdS9YU/JcUT+2H8W
	2tH58MZRNqyaW/wFfdR/RE5Qfzj0WW8GuWM+ovho
X-Received: by 2002:a17:90b:498c:b0:3ac:73c7:9c07 with SMTP id 98e67ed59e1d1-3b41c55b914mr15888941a91.0.1795445100877;
        Mon, 23 Nov 2026 06:45:00 -0800 (PST)
Received: from gmail.com ([124.127.13.134])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b217a5bsm7810096a91.0.2026.11.23.06.44.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 06:45:00 -0800 (PST)
From: Ziyu Zhang <ziyuzhang201@gmail.com>
To: sagi@grimberg.me,
	mgurtovoy@nvidia.com,
	jgg@ziepe.ca,
	leon@kernel.org
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	ziyuzhang201@gmail.com
Subject: [PATCH] IB/iser: Fix deadlock during blocking connect
Date: Mon, 23 Nov 2026 22:44:40 +0800
Message-Id: <20261123144440.65441-1-ziyuzhang201@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

iser_connect() holds state_mutex while waiting for up_completion. The
CMA handler for the same connection needs state_mutex before it can call
iser_connected_handler() and complete up_completion. A blocking connect
can therefore prevent its own connection completion and leave the waiter
blocked until a signal arrives.

Drop state_mutex around the wait and reacquire it before checking the
connection state, preserving serialization of state and cleanup paths.

Fixes: 504130c039f9 ("IB/iser: Protect iser state machine with a mutex")
Cc: stable@vger.kernel.org
Signed-off-by: Ziyu Zhang <ziyuzhang201@gmail.com>
---
 drivers/infiniband/ulp/iser/iser_verbs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/infiniband/ulp/iser/iser_verbs.c b/drivers/infiniband/ulp/iser/iser_verbs.c
index 55fe68e..9fe2d3f 100644
--- a/drivers/infiniband/ulp/iser/iser_verbs.c
+++ b/drivers/infiniband/ulp/iser/iser_verbs.c
@@ -778,7 +778,9 @@ int iser_connect(struct iser_conn *iser_conn, struct sockaddr *src_addr,
 	}
 
 	if (!non_blocking) {
+		mutex_unlock(&iser_conn->state_mutex);
 		wait_for_completion_interruptible(&iser_conn->up_completion);
+		mutex_lock(&iser_conn->state_mutex);
 
 		if (iser_conn->state != ISER_CONN_UP) {
 			err =  -EIO;
-- 
2.34.1

