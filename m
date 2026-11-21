Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795260566;
	b=Q21NrSIm2r3oqOq5z0TonlbRTYFb+nUZ937IMXLp0Sn1QMNIx8wgzH1EfxySwczKcDGr
	 hPyJUh/Xs2QsVgnZhB9AgFIHT86ughq/OaYBN9+++Q2Jrn89bdwMStLJEnueWHv7F8qjM
	 52Fcb1mIYymBJWmaNmJ27CYrKlf7pwKbWQjPWMLk9xIjPNcyPfWeiHQCinKl/6SALfeUY
	 D0K+BYv4qFb32UjSF+wnFCTsSURHpR49yjZZNOpANAcnz1fMZnKAo3dio+LSpGnlDv7X9
	 NRwbB2+XGn5T+M+8y6JLVVWP61TFb4an25wpuVOnzSM6JzbKm+ij44vB9/xwYjAh4MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795260566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=umQx8DxNkvnGJlvvds4sRbKDPuEqjAlh1ZTdHWdFhho=;
	b=mlRc7DYmI9Zqg+He4QbS2nQr+9jMu+nSjndWxUIOvm8IpOELCK6oy6ha6e4SV+KELFFv
	 M6LQEtWNL/1aCQrtXnKdJssJZQVAW4u1cBx7E6vHQkP51lTmHVraOHqC4FJU/JIIAGTrs
	 PljVzc4maisWOst2xCwFdDF+t6h+2F+EIHqR3z9KoLtK+djT5/OHZJrDJ6RZtYQsjf8/y
	 XMHlMgSctJdbufTbOnybwDfkh7N970QcdlMqcx4DVhostdSRYdlwkhYTw3769ws/WkHea
	 Dk49kr7BbNbsKsIqDj35QBoY8hBYewMhGPxd0bHbNIe45Nd8oCNSOQHYJxTZVWTSkxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wndv97v0;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011BE606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 011BE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wndv97v0
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb61185057so11637675e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795260564; x=1795865364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=umQx8DxNkvnGJlvvds4sRbKDPuEqjAlh1ZTdHWdFhho=;
        b=Wndv97v0xNPaFveqPJE73z2hBy2mVbS4EQLfhSu3Qr/NEtlcenEomJW44MLGRSN0NK
         4ebXbUWqFYFshtpdLkIu4G+V+8BBmM4hyxvT3t8kA+Oxvm2IVXPxSvGwwul3fcxE0VQq
         HIs2yWfKLdXI7nxF4IPMSF/TR+8a3cnWWtx2k85gPjqLFLunNFD8vv9NlusF/pG0iaq7
         +VRUjMsc2SpfichnmWjWT5E+IL35HOomym2W//nn2utskrI50B/79Ztt9kmhc4C+HvIe
         4sGG3nqOPrBEJuFMaS80zwwswZrzMx4Wr0D9XlEh+IYg6SwXxZju8DRH6xr/BPT7Vemr
         9ahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795260564; x=1795865364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umQx8DxNkvnGJlvvds4sRbKDPuEqjAlh1ZTdHWdFhho=;
        b=k1f1z7gmRb9ePBYRXtyUHMZk6b06kZ5qi4gWn1YyBTn5KI8JjapYhQaZuW4eO5Ww+4
         VefHx4+cIF7XE50esGcW7Dc/ffgtLwMewKMzn70rOD5uQk1gjBPv6P7Uad3X6AlPj3YF
         Fww2lPq3bCT50f0DXeX0D+r9LTU3k0PPJQw4dmeXr7dRl/QCpSjlraZUHIDB2OqpPF3Z
         1NPctVDH0hGZXrcbEKUOUuAalSzzBvOBk0vme4kLm6sFbSQj7/T3m/pVpAHp73W/ayRw
         8bccFvorPFLl5SqR38WaljeSXbsdK3trENY1Fc7SaJY3CBEv2m3WEWHBXTErGsIMLjaM
         IxIw==
X-Forwarded-Encrypted: i=1; AL+hErEC/v/eHI0uGbPtRfO5yrwepV9LJu9y0NivUEA7rrwn12L+T3NroTtanr12oG06vPHoT/1LTnypaokLG10=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nF4h3ahLOikfwhnHWN6PjqcgzNiPf8Wb60nB4DCP7nsXRW5jq
	ldPxH30qYADV1tlyO3T0ReVRJvx5jmNLniqtI3kmcrEaDcn5XF08wA0=
X-Gm-Gg: AZFdTZdxoOXNqjZoKCBeY0wx2iGnWiEqewbtOFEU9sHS6vQZG9hs06Bo1Ui+ZDiu8oH
	Mn7U4MZxKZ+U7LL77MPC7ZgqExqw+7xQXrxVD1tOGL+1YuDMY/pEKamLYmVTMo5pM5ik051pfne
	/fXQhLIgoIZ2yvPgKSyPQHymd0vC8QCYFNdebNyPKiP36EJcHYDWhRD20hGSjEl5qD4RWqXgYEQ
	526NZ1tPrRsk3X8kbjd9WvYnn1cYm0gGaqaHwQk3rUeA2fe/j5Eg4PsnYewMZZhpB8geur/Y688
	MPvk/EzWa3xeyeHgyWxK9K6mLJTyvCIBMvDP18L0CzAo32+LqbxK/AcxzkkSll0Gl3Weq2O0O9S
	3F/BXATikffMNYXpK2J0d+R224FW6KkXgZwVJRQJuQ9Dz/dCNPQOSM0fT5V8twBEMkuh69pJLcX
	qOSk79dgs38U6SsfWxUjmz067yIflarXeSHRl/trsR3olFxQtdWzjkG816uKD2y7atx0fM8S1n0
	aD9M9Lehkjq2Ft2xoEOXGS77IGWIqPES53p14M0BTU8rFLgyql0SFiqm5jQi/Xulm2vlpUl9VgX
	mxOc6FgWDJgjEsZ1Ii/K6JPVVTPQNuRL+tsuJQ==
X-Received: by 2002:a05:600c:3511:b0:4ba:73f:ef5 with SMTP id 5b1f17b1804b1-4bb88828304mr137787085e9.34.1795260564182;
        Sat, 21 Nov 2026 03:29:24 -0800 (PST)
Received: from localhost.localdomain ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066f6e6sm37210385e9.3.2026.11.21.03.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 03:29:23 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] KEYS: protect construct_key type dereference with key semaphore
Date: Sat, 21 Nov 2026 11:28:53 +0000
Message-ID: <20261121112853.2175119-1-tristmd@gmail.com>
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

construct_key() reads key->type->request_key without holding key->sem.
A key reference keeps the key alive but does not pin the module that
provides its type. If the module is unloaded concurrently, the key GC
retypes the key to key_type_dead under key->sem, and the module text is
freed. Without the lock, construct_key can read a stale type pointer
after the method has been unmapped.

This is the same class of issue fixed for other key type methods in
commits 925c84e3cc21 ("KEYS: Protect the read method check against type
removal"), 51bcd09b9ffca ("KEYS: Protect the update method check against
type removal"), and bab48a1044475 ("KEYS: Protect the pkey method checks
against type removal"). construct_key was missed because request_key is
less commonly used than read/update/asym operations.

Take key->sem for reading around the key->type->request_key access to
prevent the type from changing while the method pointer is read.

Fixes: b5f545c880a2 ("[PATCH] keys: Permit running process to instantiate keys")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 security/keys/request_key.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index 22cd66a44da56..eff67c5fb9015 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -241,8 +241,10 @@ static int construct_key(struct key *key, const void *callout_info,
 
 	/* Make the call */
 	actor = call_sbin_request_key;
+	down_read(&key->sem);
 	if (key->type->request_key)
 		actor = key->type->request_key;
+	up_read(&key->sem);
 
 	ret = actor(authkey, aux);
 
-- 
2.47.3

