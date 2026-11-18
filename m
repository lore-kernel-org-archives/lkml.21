Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967647;
	b=fGO62XPppqJCFiavNH+6Iqmn/Wl9S7YIhc1YZvXZmknBQgUN4IfJSPoiMQ0CMhzjNgXG
	 rvsDGGvDYAh8WZUFvL058J3LWwG0hp98yNwQ+IoQevuaWShFQEmxTnB2Y41YPyOdqV/sS
	 jgmPZLdj5sXWJO53fgSo65rLAwZFrEeYCGiBvWKSGiswkReb9l4sIm4fbd0zEDdu7e80J
	 b3hTcsqUbka7yw106HKeJ8B8OgYZK1mfYqm3q0DVIShDfG3eG1OoorzNISV7HPo+Jm9SM
	 RI0Yy6H3DoCp05hV19E1JbDPhFqIem10joHcrq9NIaEY24+OfbGyD/LzM2g0wyqCRcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i45bHZiP3wEgcVETQzoa65BO2wkAbHlegiGhDqMSTjc=;
	b=db5jYf1zhExc5p+RgCaPxTZjN7iTqeREycKYa5CYXhM/FL2jhzrBbaVAhO3d8rdhe+61
	 ffay98HcCcsodM0udFQ1lWs407rncWCoVTq3Rf3CYLFCT6i1+S6LUtwTV3d9JZRm1iJ3z
	 Q38E8CuzO3rRda2a8vjeodzBkQqJiP5Uw3waKsaVf3Y8zCAt2X/oS+2K1kiM3mCoCdfSH
	 SGFA8GM73DwNoNAv5SbLKoY0C5u2baEr8haQxhYg0zN1OSN4XSnStwW0p9pyV8wFh9ZP8
	 B5QAfZaYX4RDHkXxeo1tJ9TLJ+DrRcydjKH/9OVEQ+iRYfa81AmFPoW5St8L1y64fPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWzcJU8f;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1AC606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E1AC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cWzcJU8f
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-376a4059061so58313eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794967646; x=1795572446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i45bHZiP3wEgcVETQzoa65BO2wkAbHlegiGhDqMSTjc=;
        b=cWzcJU8f71qRXuXGab0DEdPLcwJztkCG7kZJaC6cbL19em4r3br54w30smE8pVof0X
         g/ciOffOuD17gLF1EJYrASn96dvF009LMvgC9J4zeHhlsc7KTbvF/TU5xIkhuHZbRjYq
         U85FO6tj31Q7nVIjpT11nnknwycWNw3VxmPtJSj4ZANiu9OPeZceii6W82s6z/XmO7Px
         4Qn2vRYFJd0uIJ+cCWYjTmvnPhb0yMlNEUhF7m8m41GJ0mUL8xTbqgqcaVA86NfzyzXn
         QpzEljDLoxt/E5UfIthfAXICGkZNQpHIhSCjxbhkl3VkxijZKBH3pdc12qGfX4+xGdiZ
         vNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794967646; x=1795572446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i45bHZiP3wEgcVETQzoa65BO2wkAbHlegiGhDqMSTjc=;
        b=a4yi9+KwNiH/fzRpuL9+R+YHbLmrLGYyrxhw4LlUViUnJq5fSbPDhDmDFxrlFyevXM
         Sg1xKS9i1WRQ+yzO5VeLhyfG0Sqi6Jl3x5vW1yl/1j7fVEw3Z2Vpp0nTDoRmGFIjF+eJ
         kbD6nqmqBxCzytI5ozKkMP/OE72g1gcaLMrepsDORSSa2H0l8RpxDXee5n8zvVDM3oY/
         nr0lRFCNPpZBgJdL039+2DgCr/p58jWo/xA96+XMWxgFWmTHrqZC6qFqSdkTGXfz3VQp
         pO7u8EaIkFlykMuMbVBrHUiFnYG8bd8jwKSXfp26KkO/L0n46dmNg8igXIxHO4DphcxP
         hpMg==
X-Forwarded-Encrypted: i=1; AL+hErG2knq+vl4ULJrDvuxMYeOKGklyd8NMqogMqAcUYycYzCaG93LoKQpSMN2OCHWhVHLW02DfTFR1Oub22+o=@vger.kernel.org
X-Gm-Message-State: APuU4Z98mUBvIQDvOkPTyECQ4dqWAyJGdiNyqLeDeQDN0JdcGBJtvyM0
	r2MTObsNQyLRTh8QkW8gJtoJtPzpW5HhIYBYNw5o4lVGSKfTdKWEhZSY
X-Gm-Gg: AYBFou2/uoPDg1DVYCNdv0vrQD7BfkNa0757iNBsyymAN2KPN2zcZHtDcSEMazYXhQl
	am7iw7gztnBkkeQPdIiqZO7lEC7Q6rKAtVYhya0K/0vocG83FSsXga0spN7tvB5IAlINbdIZ3e1
	BsgSRC0pkmij/ksczOjwfcARq6EX1DcFafZwD+z+o6CMoaDPcPGZzB6fDt6xHtP8HLls43ZlA4j
	1Op/cY04KAR3Xlm7wD/uqHSNGjeyTpSqtX6dEOoyGVL0y2i1wu+HtNFPmx37GXcVhIieDXIxyAf
	NOpPzWx2iF6NC2XIvvlwUVsbE4qSjHBh4IBX6dwci5oUaL9/aEuO4YO2axNen881ZtYHu9mlBQc
	jAqHvwnPnleHJIJSY6WWU/6aRZihqBCo98g/NtKMHS29Tr94fDjyZnjOyB4vZMW8XNa8sUGGbe6
	5HmiQDYZTIgNxrPyKTzxUx5hCO68FhK0CBKcodRl8/nyYm96m17gpc2DmKaFZLlIEfLwVFuFlOI
	ty9YPinxb22eKXFvqF8u+sOkNeWKSrUBIVuIE4fLbmzchEDEel9RA3Zv2zqA3yEAVGefxh6X4bA
	br9u3xhGAiNycc9EYE3pOibrEIwUd5qgJapIjBQey+gl4S13xkxNl3d5fYshpL58akpzzNKrhL1
	fR9XsFcU=
X-Received: by 2002:a05:701a:cc8f:20b0:1b5:4596:8371 with SMTP id a92af1059eb24-1b54596847cmr617949c88.0.1794967645989;
        Tue, 17 Nov 2026 18:07:25 -0800 (PST)
Received: from DESKTOP-CJ1L666.dankook.ac.kr ([220.149.255.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784008sm2862327c88.5.2026.11.17.18.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:07:25 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Julius Bairaktaris <julius@bairaktaris.de>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4 0/5] drm/msm: Fix VM_BIND job, queue and entity lifetimes
Date: Wed, 18 Nov 2026 11:07:11 +0900
Message-ID: <20261118020716.1698-1-arpe1618@gmail.com>
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

These fix what happens to VM_BIND jobs, queues and entities when the
file or a VM_BIND queue is closed while jobs are still pending, and
make the VM unusable when VM_BIND jobs of different queues apply an
unmap before the map that it undoes.

Patch 1 makes msm_gem_vm_close() wait for VM_BIND jobs, as it does for
submits. Patch 2 handles an unmap that finds part of its range not
mapped, or that comes before the map it undoes, like a failed map.
Patch 3 makes a VM_BIND job that the scheduler kills before it runs
apply its queued unmaps before it drops its references to the unmapped
objects, release its BO pins, and mark the VM unusable.
Patch 4 destroys the VM_BIND entity when its queue is closed, instead
of on the final put, which can come after the VM's scheduler has been
torn down. Patch 5 puts the queue last when a job is freed, as the
queue may hold the last reference to the VM.

Changes in v4:
- New patch 1, as Rob suggested: VM_BIND jobs add their fences to
  vm->last_fence, keeping the previous fence if the merge fails. Patch
  4 is still needed for killed jobs, which the scheduler frees only
  after it has signalled their fences.
- New patch 2, for the ordering problem across VM_BIND queues that
  Sashiko found in v3 patch 2, and that v3 patch 1 also made reachable
  through killed jobs. Unmap errors are now handled like map errors, as
  Rob suggested, and so is an unmap that comes before the map it undoes.
  A job that fails in the ioctl after updating the VMAs now marks the
  VM unusable as well.
- Patch 3 (v3 patch 1): uses the checks of patch 2, and describes the
  window that Sashiko pointed out in v3, where a job that waits for a
  killed job applies its updates before the killed job's unmaps.
- Patch 4 (v3 patch 2): changelog updated for patch 1, and a second
  Fixes tag, for the commit that added VM_BIND jobs.

Changes in v3:
- Patch 1: only apply the queued ops of a job that the scheduler frees
  after killing it, once its dependencies and the previous job of its
  entity are done. The error path of msm_ioctl_vm_bind() frees the job
  right away, so v2 could apply its unmaps too early and out of order
  (Sashiko). That path is left as it is in mainline, and the title now
  says which jobs the patch is about.
- Patch 3: rebased on patch 1, title adjusted.

Changes in v2:
- New patch 1, for an issue that Sashiko reported on v1 patch 1, which
  that patch makes easier to hit.
- Patch 2: changelog refers to patch 1.

Review of v2 by Rob:
https://lore.kernel.org/r/CACSVV00ZppfBKwsHJ+NBYBB7a2f3g1O=6J4Gt1m_A74fudZQoQ@mail.gmail.com

v3: https://lore.kernel.org/r/20261114141851.134290-1-arpe1618@gmail.com
v2: https://lore.kernel.org/r/20261114081902.1669-1-arpe1618@gmail.com
v1: https://lore.kernel.org/r/20261114062541.2001-1-arpe1618@gmail.com

Jiwoo Kim (5):
  drm/msm: Wait for VM_BIND jobs in msm_gem_vm_close()
  drm/msm: Mark the VM unusable on out-of-order VM_BIND unmaps
  drm/msm: Release the pins and ops of a killed VM_BIND job
  drm/msm: Destroy the VM_BIND entity when its queue is closed
  drm/msm: Put the VM_BIND queue last when freeing a VM_BIND job

 drivers/gpu/drm/msm/msm_gem.h         |   7 +
 drivers/gpu/drm/msm/msm_gem_vma.c     | 242 ++++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.h         |   6 +
 drivers/gpu/drm/msm/msm_submitqueue.c |  50 ++++--
 4 files changed, 272 insertions(+), 33 deletions(-)


base-commit: 1e59855738454b14021b64115f0090eafc7526ae
-- 
2.43.0

