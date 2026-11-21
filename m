Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795265451;
	b=PHlPNJKOKmImCTJSUZK/haqr4OBf2wYlssKGJPx9VMytEg2F1xTfCvX9zn8ATmh+CqTV
	 Kxp0pzie6Tn9RxweFcxbxErc6VWXVUF+N/5rFEs8ESDLm4b9cWHkCpgu0zzYWT+9icXGP
	 SONfTx/HkGIQiPtJRSxIe8Yt9Dfl3YmFv+CTvwwSNvKsVjjEcadqfXhom7Xi9ryAtAy5k
	 r62b/M4QzQoRCQ8KRhPufpdX0IqTFTXIrrvNrAsR9z1wTB9ZZuxn8kCR0WXIJ8p4gZJKZ
	 txq6Is8IjRO65hMcRHeBQo4rHRpNuTkwWMj41QoRTeB0TsB79Y+4Y4VcUjEi/uN8QZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795265451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a+JvEByhjl3Q0eRtUPeklA/fZjCl5bKRc9fdhPzK8Ac=;
	b=Qt8wUJdsvdAbiWgptPUHwoVdN7bTd3xY3Lb38LQBQGutgyGtpRUGb0UopDv60pwZ1gx9
	 A+TwZlUq2RvxwttrmQ4swHO9uhHPdllWz0cI3Ug7+seyUpd/Tte+HJ9XFPVm3BbRQ80UH
	 Otprg/xxxJlxzHjXcdhiDeOm7XdavBWoQ0boYVIV6bwg/5VqKVwDzQ0ZbB+CCyS+/6eb4
	 TQz6jLxGXYIz+I03rF0y8BTAfBS3g1GVfXj2E070+CgL1r4unLiorY4Q88v/hJ3ZAxlsP
	 R14WJLn34hw+RZq2FsVjMamWCRCc4B54XfFrfpG5dy6I8Vt1DbltGt+J7xJtcW9kcyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Imsir6fH;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9FD606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE9FD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Imsir6fH
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso12809795e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 04:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795265449; x=1795870249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a+JvEByhjl3Q0eRtUPeklA/fZjCl5bKRc9fdhPzK8Ac=;
        b=Imsir6fH8V7hOExu52NV554HH3pwtbhoLh70BMUw8H1FaFiWt7W9gMtzLxzyAWqEK7
         PDd4FwlbIR16ulmMWV/RrrEnkjme74mNISBwO15zVGJctYBCbuEexnAVhvDw7EChJweE
         CNJLlHu9Ia5dmdb8RBOiBLwhc4OjapiV+Cd5c2mU4ujK3opQq7DLiS0fxDOUOEmQUNcn
         Oc/JxNmuUt/GSKQYXe7LuWKLqWlVmLBpBDpHOHXdMcuoVtBhj0Cs7C48GQHHVRpGJLnx
         57FfYipZk9L0sk23f1CityQxeUziuI/F0K8U0AB14i0DdHS5Ft9RaNWxa8xeiGMaq5aa
         bU8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795265449; x=1795870249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+JvEByhjl3Q0eRtUPeklA/fZjCl5bKRc9fdhPzK8Ac=;
        b=nMQJTkpQ8p4zL/qh/sWAXutVyHrUdzcLsE524i44UDqe0W1rGp4o9EMChpTK14TuGa
         W0gHwyW/eitMvS7mIYmmdgmi9qbBETulxFGWS5uqXCICKvD5jwF8CggAjskkZ05l25WB
         aDlGrDKcd1Q6EdsTgMpiufmP0N9/cLcclqr7jb0dPObz3aO1Afe/VU0rs5ZPzPUsjkHF
         3ABUUoInZxtWk1bfx9VuhBiCzX7t/65FJt3vVY0xbSqQn0kwrNUbf6f5hx1AXVeSI6B3
         Vo4AFsAB7IT1fF8+GfHIwfRpfgfMLubuDfinOsw94YuAro0Y/SRoTxDDDrnyWcD+2Mp6
         mWPw==
X-Forwarded-Encrypted: i=1; AL+hErES02enpuQvyA9prXLs9ml2STO7uOH/dRPEHs8yEFuYQDnItcxsHHZsH7cQKL1RsqUKzUAzZUKVCENV22E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z5SS+BUvGWbjBSKDtMjgg2Vzf3HvbWSOuk98H5H1uEB0yRjXu
	61fTTnDvHjYqhoaTEjlh3PjbDLycUVpdsAyjQIh5WMCQ+tFJajAR3rcXt/To
X-Gm-Gg: AZFdTZevsxdISrbHSgglfvLkR7/PxAZ7R8Fo4pZkDJ96BFHUYtrfQXQcriB6TzOBm7K
	GtJFOjMsS+doItzGjVcEWcixM7/5DYWDQzMT6G9/a7dl4NqqajtknD2oTpHcmI8CBmX3mcnjwat
	EiaSi15W2NRijrMAqSKHXr0elWlMUN+C1rtfpKMF13Na0wpFaNOLMU6P5QbN/AueOI3yLmZcagr
	gY3h2wCWpAew42iP/99I52EDRhzzCqiwYmuUc2qGH1tGKsoE1HjRVOMCBhoFeebE/c9c0Gk3tN+
	cq4GYZOZ4Dvn5KWHPi7EjXdFh9g06Jl8IA7Jme0WHwYLEl9ZrruVyy0D3POLG82R2pAYfy1is3P
	DGweOW1HFSfcNAqFKW+tXUCf0PIhCIWexhfvuygOQZ+FSaBEO9thixZeNCeVifqfnjxPBxXaet+
	PMoGm67UyFdMX6+SnqM9yWHaTHmIGa3R8l6BLozEWWaeIUsMIq1dHGiuJIuLIhk7c+NGkSsQEMs
	y0dQuiv9JSYw8ecNPv+ZhCB7BIJmgMCGujBgCKvQ+SrQGkIDzHh8wbAmlxoM3cJOv1aTTJ9qhkT
	g+BeRPHK+rLWsWxN4u1iJYd5vC745c31iBeQ
X-Received: by 2002:a05:600c:820d:b0:4bb:6cef:d14b with SMTP id 5b1f17b1804b1-4bb887c34f1mr145440935e9.2.1795265448967;
        Sat, 21 Nov 2026 04:50:48 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm10803003f8f.20.2026.11.21.04.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 04:50:48 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] KEYS: protect construct_key type dereference with key semaphore
Date: Sat, 21 Nov 2026 12:50:39 +0000
Message-ID: <20261121125039.2532663-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

construct_key() reads key->type->request_key without holding key->sem,
then calls the resulting actor function pointer.  While the
sys_request_key() syscall path holds key_types_sem for reading (via
key_type_lookup()), which prevents concurrent type removal, in-kernel
request_key() callers pass struct key_type directly without holding
key_types_sem.  If unregister_key_type() races with such a caller,
key_garbage_collector() can retype the key to key_type_dead and the
module text backing the original request_key method can be freed before
the actor call executes.

Take key->sem for reading around both the key->type->request_key lookup
and the actor() call, consistent with the approach used by 925c84e3cc21
("KEYS: Protect the read method check against type removal"),
51bcd09b9ffc ("KEYS: Protect the update method check against type
removal") and bab48a104447 ("KEYS: Protect the pkey method checks
against type removal") which protect analogous method dereferences in
the keyctl paths.

Fixes: b5f545c880a2 ("[PATCH] keys: Permit running process to instantiate keys")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v2:
- Hold key->sem across the actor() call, not just the type pointer read,
  matching the established pattern from the three prior fixes (Sashiko)
- Clarify that in-kernel request_key() callers do not hold key_types_sem
  so the race is reachable outside the syscall path (Sashiko)

 security/keys/request_key.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index 22cd66a44da56..60a8cb5924e11 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -241,10 +241,12 @@ static int construct_key(struct key *key, const void *callout_info,
 
 	/* Make the call */
 	actor = call_sbin_request_key;
+	down_read(&key->sem);
 	if (key->type->request_key)
 		actor = key->type->request_key;
 
 	ret = actor(authkey, aux);
+	up_read(&key->sem);
 
 	/* check that the actor called complete_request_key() prior to
 	 * returning an error */
-- 
2.47.3

