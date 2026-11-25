Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609478;
	b=hde3hVawwEZ7V7GqBu9+lKbucU9KU+43CLYwl9yW1meT6dYu8lrwhuSnB8Z5MdEdTTu9
	 /FAunFdT6t82wWkmcus1+k86MxXb8UCMFdylXeztaBRqBajtrkugspct0S8EqGwuFfqCL
	 L17negySQ/HNNpLXj4AcqphCMjuMJhMPs7/jp4/y2HPvXD/KLx1+wATpmLrNiokB4iIxo
	 ECY2Pbl95A3rXbdjerABoSPq+ws1tqCQGFQ1bJ1Yp/nKXfLJt48C5OHYUUMiCwqtUR2N9
	 44KFq44JugU4yxVhtAqqJsFh9OK+eMCzUPrXFG1INHjv9JBIsLPAypJgzes55rAjqBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609478;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hqNNaZep2vx4KFfuJvMyttlCRC5vDaQfJNnpwBRD3DQ=;
	b=G0G2VDb/96QqbGqO/dDu9dPhFmCVYkVLbOO24dQTpSdeO2T7NraocoVHwelXDgMASgTZ
	 PCbWVJ0G5ftJ/Dw9dczPlZNNgCVnlKTutx0ix0BBC0+7xpcSh85st34OJYXJxSI96IioQ
	 YEPG+4JkYcD6dxrqyFYHtmdY8JXg9w19wxpXYhP5qRYP70NfxNZ/MfrjFxGjAxRGxJCFH
	 nDiaUo2NzrM5QuhMbGZVNJ2rp3vZGlQtRXvE2ltVHhG9+gt/SXqkbPaYwC58+meBnP+pz
	 umLFhuq2u2WWbvna5wCKMbtAK6ncNIGf4f9UDESipxg/gol/6h/u7IBKy+Bwiun3bkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=ZNqTAKw2;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FEYsJN52;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB77E606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:24:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB77E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=ZNqTAKw2;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FEYsJN52
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 118C71D004AD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:24:37 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 25 Nov 2026 07:24:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1795609476; x=1795695876; bh=hq
	NNaZep2vx4KFfuJvMyttlCRC5vDaQfJNnpwBRD3DQ=; b=ZNqTAKw27O94xM5A/+
	Gqxx3yx1j7fCq4H/yplqtEiVBvMel2o4ndQe8Empmi5MhCEl763gr2XiK5vtU3eK
	pE1BvGrvOGInRvTzZH4f+/YD89eyq91zocmNieJUouyjx4dmAZiEnXreMJMu7rws
	wBAEsxijR9WMfDnbVyw+d7N2QG2HYwRHgQdjuH0bH1RP2bTjH5k/+NelQ035tErZ
	0IaICEUPY+VwDXhu29n+ATcKms9UrZuLaGOZrjYRbyWfvNkwsi9sGLkXd/KiCCtS
	Y0TXZjIVTbCXSghkGaO3Nl6zsgPCm2m88TScQdig8yDW7BvdGT527f4g2aYTHMq2
	Dl3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1795609476; x=1795695876; bh=hqNNaZep2vx4KFfuJvMyttlCRC5v
	DaQfJNnpwBRD3DQ=; b=FEYsJN52tKSLV+oTNVc3D+W4bWa05xICHZ/Vcq1TM7yo
	QxjLbdQSZUZZi7ZYK1KPSXXq+R1X6jsOWBDwlTSZhZf2uzjmcwIG5ZtsmaOOp54y
	9jRywsHayS3DxfVCu9x4uTkFBkrwq+W7gxOodgaPBX6EUisBi1BTrGD0uMb0OHOl
	oPrrmft9UjTOu03/y4Pmg8hv6Y/bOnyqBvGIYLzzXFR+HcW5LC6sYoEtLsTNnte2
	1IcawnpRMFBOl0UzsdzJ3aJfknppqpdjWkAiIR65lbx2WGVwoms1sUImcixERAyD
	7wZjgo/Oe/deZv1KLdvjSzzpb7i3EaDO9Stu/7U4Dg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795609476; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:7IgvwojAImx8REkS3ufJlO7OhyVlRU3VRUfXIfdEM2FF5Fa
	VHRXn7q1sQO1KtPudviPLXUtY8cpR1fThI+6mQTERZ8KDp1zUeBFcCEKnnbe/Wv4
	bRRLLKtRhPijunXKgmiakuEMlN7F3ZWaf9X5BE5yQxJckvEDPuzbRV4OnpVtYT4d
	rwjBNzslgZ5bwEVkq7S5W5oiaxQuGLThqtERgNG06FKjDv7yfDR/SVs1Uim0hrvT
	Io536oOmruX3KimUvPbYZsj2J3Muwf+DM5SutFJEq+oC5tpACarxbhJEifbNT65e
	s78oKAM7PhM0BV5p/IZXMIRJIKk3hLTeHmfNxxQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:HZzJJv9k8m8KYAQ/T1lMq4iR1NJ9poV4J12WWPKB1Bw=:pPrqYcx5JyB3s7FetIEbFd4p+NIP+7VjzkYpiDi4uCI=;
X-ME-Sender: <xms:hNMGayVLWoOmf_IGlPsGBRU_MJ8Kya2O_WsmybSO4SybyiVU-vbW5A>
    <xme:hNMGa2jzB22PbD2bO6LY4Qk05tqhfQ20Y-IsINZcS5MHkc-vqsZ5L78JEI6M-Z-mv
    emcOOpEnp59nXdSd8czPcn4kP4XVpmNO90LR69GzcLAz3rdhCvoCY_a9w>
X-ME-Received: <xmr:hNMGa9kcmDo1qExCpTnVzB6Twjg7UPJk0UTiM_qzBPqyCB4xmFYGon6kXGBvdEEVlVPjeXeDCXNrWJcm5pNKbwy35C1RtAPXu-VUxQ>
X-ME-Proxy-Cause: dmFkZTEVJM41lcuGx+m2MY5vP8v9MD7dndaUsoPvBmGB0Pzi6NXSHKf+paHd1OT0ewWoZ0
    bQsYPOWiL2OjiB7FbvLmqN8KTdxqK1v6SqoBN/iqSSoSyGHHyWbd5w9LMe6l8inIRGkOwf
    nDUtM4fEqsjMwCcW7OYEbCbVb8dFi5gCjWLSsQ+Dash/gILH+YWJeRH+oYGLrKZ2XM1nRj
    WnCy0qlmjhJqANNfCIPRYLtKEn+eGOPby6Ew24iTnOKS1JXGHFYe2k4DPZZsmaa6iWQCp6
    cGlZ6yK/X42m0qTpcNLdcs5ZZPGMwwvkvWLMtngaYddUbs+QlyPkOHbKFREQt5jDt77Sqe
    pFH/ZsdzyKn7NvQrqhksJyHZSiwz4ilA2va/n3/U1l+vchw69NvcxEf0D3WnqhSAo2Zg9c
    4KwkmPOiwwncuQTIqGPZ+SUAtJnUC4clqxKd2q3OUgTShmxrfH/iK24lVjBSKYYK+htOuT
    130P4PreWzBE98du7gYDBgNYzZ+qxKOkFr/FAJf6exhvm6Ov8vR5DTRymFwD+X00T/oUYt
    fP7wMWhC62/wz4WiobLbVml4nbt39+FwWRjJVixA/DcJ58HVoqfa8cJ5YZHjn8ORa9J1Zj
    gHoAPqswYTtlgrFjfGyMKwuuRc2pKAeewcLpbKbDGSTcZHNK33sc/AcHjiNw
X-ME-Proxy: <xmx:hNMGa_ybnneuOwi5Wq4PM2QjdVOFBUOfhTex9Kffrh5bXJsG6fjNLA>
    <xmx:hNMGa4sk7HQLYdWau3Oh75RQb8j6GVG-RrQdTp94B8kmxY0xkFIdcg>
    <xmx:hNMGa0upOlDsCUrBavb92OYJ3ka2A2cdu9PoouMcTtUZ2YsYyThz7g>
    <xmx:hNMGa2lrlhLfcLRfAiNsYbkQ2f2R928ynlFahfu1MKiEZWp5WRS0Mw>
    <xmx:hNMGa4tQrTXHFW0IHGsfo1UajtMrGN09DUxg9PFL4-jUcFy7viX_vhDz>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 07:24:35 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Wed, 25 Nov 2026 13:24:28 +0100
Subject: [PATCH] rust: drm: gem: shmem: Drop unused unsafe for vm_ops
 assignment
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rust-drm-gem-shmem-unused-unsafe-v1-1-d6c5cb0b391f@jannau.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3NUQrDIAwA0KuEfDdQhQj1KmMfMmObD91I5hiU3
 n2wd4F3ooupOGY40eSjrs+BGcIC+DjK2IW0YgaMa0whRCab/qZqnXbp5EeXTnNMl0pzeGlCzFs
 rgROnFHABfJk0/f6L2/26fokM1j9yAAAA
X-Change-ID: 20261125-rust-drm-gem-shmem-unused-unsafe-559fa1565661
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1693; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=pPrqYcx5JyB3s7FetIEbFd4p+NIP+7VjzkYpiDi4uCI=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhmy2y003917+33ntgfdTp1P/DogY8tx6WrNcbUt2ZbjSz
 Jmyal9jOkpZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAExE/znDPy0G4eykeYVfqmSZ
 poSxN6mt3f5+g8XLY83zOo1i2UQTLzP8071XdWPn8bLXbRFb2lU+GLgFeXj5pupE6McvyZI11Fn
 PDgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The assignment uses a raw const pointer referencing the static const
drm_gem_shmem_vm_ops from C side. This is safe since Rust 1.82.0 as
stated by the #[allow(unused_unsafe)]` attribute.
This was added in parallel with commit f32fb9c58a5b ("rust: bump Rust
minimum supported version to 1.85.0 (Debian Trixie)") for Linux v7.1.
Drop the unsafe, the SAFETY comment and the attribute as they are always
unused with Rust 1.85.0 and later.

Signed-off-by: Janne Grunau <j@jannau.net>
---
randomly spotted while looking at the source, no other
`#[allow(unused_unsafe)]` in rust/kernel can be dropped for the same
reason.
Tested with rust 1.85.1 and 1.100.0
---
 rust/kernel/drm/gem/shmem.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 24cb5343e0db..fb8c70d0e4c8 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -138,9 +138,7 @@ impl<T: DriverObject> Object<T> {
         vmap: Some(bindings::drm_gem_shmem_object_vmap),
         vunmap: Some(bindings::drm_gem_shmem_object_vunmap),
         mmap: Some(bindings::drm_gem_shmem_object_mmap),
-        #[allow(unused_unsafe, reason = "Safe since Rust 1.82.0")]
-        // SAFETY: `drm_gem_shmem_vm_ops` is a valid, static const on the C side.
-        vm_ops: unsafe { &raw const bindings::drm_gem_shmem_vm_ops },
+        vm_ops: &raw const bindings::drm_gem_shmem_vm_ops,
         ..pin_init::zeroed()
     };
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261125-rust-drm-gem-shmem-unused-unsafe-559fa1565661

Best regards,
-- 
Janne Grunau <j@jannau.net>

