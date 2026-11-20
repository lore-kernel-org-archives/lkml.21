Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168123;
	b=1+bBi86wn5IWGQUBraLNAvP/9fSbB60TXwVIwcVbYGXGIn+HdANYduQf41FYr48Dt6Xy
	 i26JKcioTS4IWgwAYLer+rAaJTP3DuczWKo7T1d9GpewGZjXckblJi9Sg+/9m51hXyXQR
	 1T8+ibkTMxubuzcOAu2xMCUYiLn943GXfdOQJTXRu1ELWGB2vUXWAzZk+yVtEISfJG9cJ
	 sCeoNjniuISOjAx5qeNnlXd7bcGKnWa44hLiTRJJz86N7GhGrftUm48eL7qvXXlcROXP+
	 YG0dBuUv8/Ytq38QPnCvrg8UkZ0Fp0xWKSolefzbnIe6+ZwNKNpChZdyo1hZBOvhe+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LrQEkt8HXk1ed1syfHwtkDqVdWgo9sprdy8k9nccOT4=;
	b=PsaW3DFeRyRB0rH4FqhQYH3Vi5wSyBzvBLa/0RsM1uGqYOEYx0ByVoAiZdfd8EDo6MFD
	 +Q0VIV4i5GXK+ZhoxiWYlHradAgYkjknh6cXiYS9rnlJNMtwZPmS6yiuc8DFZS58UxQsA
	 FrVRVoEzfpje/uJIrn32BZYNnBBvz22ehVa6QQC7i4vwXF2wc9viNMSo9twt5dcmqbHHH
	 MhLq8UTOKIyYdeai+2Bfea42J8dfd1GbDXNsgaEzU2SbfmzCtBXyWxfFWmbhu/lVDSSeA
	 VW7yTQuQOjXMt4/SZMLHC3r+30gEYAHYHehGGwJHgDXRId5gnAME/k1wgsw+pxO/mXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QxSXBoWw;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71904606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71904606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QxSXBoWw
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so82849f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795168120; x=1795772920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrQEkt8HXk1ed1syfHwtkDqVdWgo9sprdy8k9nccOT4=;
        b=QxSXBoWwFNgSQtDk7FgcCwW7Iu7sNYfShCcuyAaffjRYinW70R31yZM+yPr6wrXjjt
         Bf4ypvCIuYxbTCzsUWJFeRf8AEu0GkpIeBMjk838RaohymTeJ++xhTBHw1EGTGpu9XMz
         KXgyco+DZVAyVTUlpBQv65z13lX7OxIRmbehC1C7HySWbZUnk+JvFvoOo+RW/RhbZuXT
         LJEU4DHn35FBs0y7+1rXo6NntmSmoLsAwh/KcXyBPBt6Rm8I14A6JYeYi/6dOtC8/ig/
         /z56iB3LRlXa9yM8UWdWuNHaZ+ijxWjp2HKs7NWwO7xKLQzFisYDnwLFhf9tfVPaeW4W
         ICMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168120; x=1795772920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrQEkt8HXk1ed1syfHwtkDqVdWgo9sprdy8k9nccOT4=;
        b=oQ3liTcU09MZKdCbHt/Yzj2WZ7jiu/+Ve6+0mKGWuCp+D2d7OZTUqLHGh3g56VGO9g
         zo7rulUZY7VoWve4IiZi07eoi7jei/Tx+kT6DsCX2oZZbnYWb0cBZNhX9O3fSCq35Nn1
         Uo1Nl6Xa2aDR6+qnMZhKmDbEkLiymyAuL+ndc+FdY+B5Ph7SXcGIfGOu220zqyMsp5/J
         CxajgBme5qpQ73NNnORmCKorhm7iCcHoPj29H+1ifm5qY7njCY1ZAV/t2RqD6fTn+Y3I
         FrclHtRrI05KBJUVBPGKnj7naMVmzynCeiBjxpEXoxmHUqCBojj4WT40HL2z6qHpJeet
         bqrg==
X-Forwarded-Encrypted: i=1; AL+hErGldx8IGTWHJeHY7liKW9FqCTI3niIon64poTp6/7PiOLPkiZSq6obEZuppabVXIbOPDRFuI6uIYHKfg2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Uyfgyz3HCYvAHdlWQi5dJZog0c4xH87SaFdNCBf7Vhx3DduvC
	5HZ9YCh1k5ORSpM1QH1bixHyWmShQVBswRR/l7/9lnFtLwWvefFnsOSI
X-Gm-Gg: AYBFou2Zrcrbaz42oIvDZQvk6Scv2inC/gk0mP8UdLGE/Lpwkk3e7QHdYu/wr75YmLD
	Noj0zZzuIpgL9p805f0320nr9UqsA63i5HOyh+V96ndMm1/0ObSjTAPKP7pN6OYlPdSleEKB0lH
	xBtluZ0M1joub2MbDEGWNBJlAQDTMapkbjFquYDdDc3GgY0ySairB6mBGoBSJDx2NUtlCJZWbRB
	+GmEu/vdyfHYE5s++KEVurLzdl9aKpEVSt000HiPNsR+eWtqVk/suGG2Q0s9IuNLg4MbJ5MgCDt
	vq5WL5i4H3VAgJPtDLuQoEJ7xuBcu0vysz+jQ4s4QbxYOS49T5eLcozOuz/oXznAjBY9h4GB/zR
	Fd71fHDz0oMfFPi5bvPLnlpkSF7nwLS3LbOpAzZOD9G4nijGDhVWc2DuX9Qm9Y/7RVZvMRNpkXl
	LP6/aoT3ZvohpgLU0RP863bOZ0LskZ8mrQmZsuuo33UgYrvuTAmNBd8/3NkfXswfrBJJ+8JNXrZ
	GiIpURD+AoIvdu8zVZ297rm8njblhoTx7BTG+oOAQ3zS31nmpgl/8Bb28FoGhpFTFEsHEE4cCev
	Fv2CzM8lF6GB6+FGM6MjHJxFYSTdphGBszt0xK2WO4w=
X-Received: by 2002:a05:600c:4e87:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4bb88938d38mr55542695e9.30.1795168119561;
        Fri, 20 Nov 2026 01:48:39 -0800 (PST)
Received: from dell-desktop ([2a02:587:4b42:1400:8199:c552:2b9e:c33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f635ffsm45137535e9.4.2026.11.20.01.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:48:39 -0800 (PST)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: linux-security-module@vger.kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	brauner@kernel.org,
	viro@zeniv.linux.org.uk,
	jack@suse.cz,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	kpsingh@kernel.org,
	matt@bobrowski.net,
	eddyz87@gmail.com,
	tasos.papagiannnis@gmail.com
Subject: [RFC PATCH 0/2] security: Add pre-lookup pathname open check
Date: Fri, 20 Nov 2026 11:48:18 +0200
Message-ID: <20261120094820.11929-1-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Some security policies need to inspect the original open pathname, for
example to report or block suspected path traversal attempts. A resolved
pathname no longer preserves components such as "..", and requests that
fail lookup may never reach a hook exposing the resolved target.

Today, in Tetragon[1] we capture kernel-copied names through
getname/getname_flags probes and correlates them with open
results. Enforcement additionally probes do_open and passes decisions
through BPF maps to the file_open LSM hook. This requires correlating
state across several internal probes and the enforcement hook.

This series proposes security_file_open_name(), an LSM hook exposing
the kernel-copied pathname, the VFS-selected starting path, effective
open flags, creation mode and lookup flags before pathname traversal.
BPF LSM programs can inspect these arguments and reject requests before
file creation or truncation. Existing checks on the resolved object
continue to apply.

This is submitted as an RFC in order to get feedback on whether the
proposed LSM hook is a reasonable addition.

[1] https://github.com/cilium/tetragon

Anastasios Papagiannis (2):
  security: Add hook for unresolved pathname opens
  selftests/bpf: Test pathname open enforcement

 fs/namei.c                                    |  15 ++-
 include/linux/lsm_hook_defs.h                 |   2 +
 include/linux/security.h                      |  10 ++
 security/security.c                           |  27 +++++
 .../selftests/bpf/prog_tests/file_open_name.c | 103 ++++++++++++++++++
 .../selftests/bpf/progs/file_open_name.c      |  56 ++++++++++
 6 files changed, 211 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/file_open_name.c
 create mode 100644 tools/testing/selftests/bpf/progs/file_open_name.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

