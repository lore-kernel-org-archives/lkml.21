Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323205;
	b=A1stovjYEkBaww6GP72dxgZhe5EBMz4F9X0qkjGKKrOy0T8PD4h7gCxNBToDfLj70Ya1
	 gC9VjVI9tAxBQzqhTsf3yvbTsT/0/023jOGpKc7Y0zmIqFKQZng7T1bJTJgbDKYUpE6dt
	 5FNXwm5GIUsvbWHGbjZ5XOJUpvb0e0yhcg7If8Qdo5IPta2Aadf/R8i9jD9QcWGLjtJhb
	 LVL8gIDnS65AWHc0T4IJa52oHi6ekqOpYInPEaxI7oqgKWmv0kdFu7Li9CtxTR81/U5VM
	 6ml7nh/ykXLWHFiZN8MXrNKh91jr4cMm6554mV09CE1faUESc4LjUxbESuqdUt2fJJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=pPZfXzdtdV8nq8V6brmrCDHD0rHVJANG6b7lQmazwt0=;
	b=NVvdJuCSG5jTErfTtidKWxw2paBro1u6BIecxR64DX25HoRDdolv1ErkY+NWybdwXdaV
	 VdHw4s3o3ilycRNJLJaT3n2OcrfNNlZ9eyfO4Hld514BF5cvy1ZitVFeLGvBGMnOV0946
	 FiIVp7zKLH819FKAA/U1xqIp4qKrKluTOVwJ5RQfD8J1rBnRA0jGixqkBfNYlCcTj07q+
	 QC+VmlGYGVL8DKc8tizT/9aNHZHd78ioHss19dX372LTSUY4xXTMW/gdn+++UAjg0HYhR
	 ARVubMw8LXDCnR+UAf8PBbePUSgGTOP6akFMIucR0UN9epsCQAL/pWxejlHUuI+88Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K4iMf1M6;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93058606A334
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 04:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93058606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K4iMf1M6
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-383ec96a7deso2590104eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795323204; x=1795928004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pPZfXzdtdV8nq8V6brmrCDHD0rHVJANG6b7lQmazwt0=;
        b=K4iMf1M6q6FfyHzWYGk7iVifuz22T3uz7hpCMrB3yJqVIVrtVNuWaFcvzeyA5vSDei
         rBjCS6zQKpDyWucMjCjXnko1Jab8GtJb+hmla3k6cL9aQVwaXV37ogvEd/zqpCMoDAdq
         /xMdTha3xHU7a4TlyZuFZr6/m4QjaAN8ctgWkAzuCk/2hqRsXl43wLa1NEGTuKnZw/F0
         E/S87OchXXL0c66hNVbBfhU2lqzb1lWTRrVocEnGJ7J6Xeu5hDo1gcM6rM3gt1nSLnNB
         7iJSEdygbCWHGx435/33GTdgRXlDWHAfIIIri61zSr57VWiOET+kQv6F2Jvm3xL7fosv
         Rq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323204; x=1795928004;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pPZfXzdtdV8nq8V6brmrCDHD0rHVJANG6b7lQmazwt0=;
        b=PO2fIPFsGakEL4ejWfUxEfTx/RccM2geesaAVB4kUfhdtcgyj/WdgBrOtZYVTH3xpj
         a8XZXKYKAUdhE8ff09WLGzty+PK8TEaatfHjz1nKy3kYuQjwPqOHG1E0KddEM25yqC3X
         qbACApf8VIYO3zHoeyRg4LwB01albGopPhPNGLbN1kd9ReX9lWuyr1H76hQQqpJH7K8j
         O+SvhHMwNw+S9yfkbr7FVdjuigJ5rDHg1ajHmVtLn44gF5rMAYzxQcX4UgqovhMJMoIJ
         JchuXDjUJRonHRgEpRltT+/5gelyrNjZCRTHf8YNlvtuj9eTe810ndvqQBwvyZ7jESUf
         XCgQ==
X-Forwarded-Encrypted: i=1; AL+hErEqp1O/jxZp4kMh0VAvdbNG7AgKutDDUnL2LWw74ULZ3TayRjcPXTxeCTvB87AKxujzAfbvEP2Efz/zN5Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DS/QUcppCSMpc14Aw7Mz5KkEsc80ZzlFsXDF9dElVPX9L4P1p
	uta7wR9dx+AEUOWI2pq7tpn2XiCNtR51X7D351jlSPVQjFiEC+86XvNJnehpPEMl+CAcMvTrmgN
	fkq5llxpLUQ==
X-Received: from dycac15.prod.google.com ([2002:a05:7301:550f:b0:384:b800:2ab4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:1486:b0:383:6eb6:5730
 with SMTP id 5a478bee46e88-38570e24c0fmr9359658eec.32.1795323204068; Sat, 21
 Nov 2026 20:53:24 -0800 (PST)
Date: Sat, 21 Nov 2026 20:53:16 -0800
In-Reply-To: <20261122045319.18651-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122045319.18651-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122045319.18651-2-irogers@google.com>
Subject: [PATCH v2 1/2] drm/amdgpu: initialize r in amdgpu_vm_bo_update()
From: Ian Rogers <irogers@google.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Commit bc566781845b ("drm/amdgpu: stop syncing PRT map operations") added
an 'else if (!bo)' branch in amdgpu_vm_bo_update() that does not assign
'r'. Because fpriv->prt_va has bo =3D=3D NULL and is updated on every comma=
nd
submission, userqueue validation, and KFD VM restore, calling
amdgpu_vm_bo_update(adev, fpriv->prt_va, false) when bo_va->invalids is
empty skips the mapping loop and returns uninitialized stack variable 'r'.

Set 'r =3D 0' in the 'else if (!bo)' branch.

Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
-Wconditional-uninitialized; not runtime-tested on AMD GPU hardware.

Fixes: bc566781845b ("drm/amdgpu: stop syncing PRT map operations")
Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v2:
      - Set 'r =3D 0;' in the 'else if (!bo)' branch instead of initializin=
g 'r'
        at declaration (Christian K=C3=B6nig).

 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_vm.c
index 82b9b2d5d0cf..d36ce2748f72 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1323,6 +1323,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, s=
truct amdgpu_bo_va *bo_va,
 		}
 	} else if (!bo) {
 		mem =3D NULL;
+		r =3D 0;
=20
 		/* PRT map operations don't need to sync to anything. */
=20
--=20
2.56.1.750.gf70dc682cf-goog

