Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106225;
	b=pYMyeFtzGskPEAt4Ig61vX6wR6uPbP3jV4+R+NLhMG1/wSq3BIaVFysRoXLjaUyhxW/4
	 qjDTivMyAdJBjjZ5t75msE4dA1Fg9c/EeWAW9bS21XB+qOf0unNBQrcYPxAhGWs3b52Es
	 iNYSFZp1NRsyoHj0S3Zt8XaMjijJcsPwjG6vUrpLPQGMtJtX+ul2p0Fr5doPeXz3A0Ppb
	 pUQ14Hl+poUjZpFg5K3+1CBUAvXJ3e9qdBILMKGhcb6dG81FPZDPM1jfuAY37Yg3I9Q03
	 WZrwE/QthftYhnbxoSHYXtsteQrBxKdRLvw2iqZDHdsFZeN3Yj7+fDvsotohMgOYa5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=VESp6hsfsBjU8MDr+X58zX9DGjPHSl10HXSvMJRGh40=;
	b=nsee+QngBjp9pOSrIJrnrGCIJtNg3k3CjbRqOO13ZIoq4RiU5eqJrm/ytyAvk1GNLEqh
	 XBFegA3h4yd5hmAXVrVeGgovaYuNT9R4Gf0zCg7A/vcf04LsQMpVcgGV3o85V1dlCeXTb
	 FKrmlJncffyqkVVInR2ie7kXXiVh5M2Kly1gRw4ffeo6wuhvkOy7X/lzuqpbosdGQJIXi
	 rxKeYOrhc3UMnZCHcCYaBBdlzv3MUuzI4j/Kp48j5JmfNSttTNfRAFp8rCvKzNMmnksre
	 Zl0nt5m9im0ooIokfH+B+2JJf2kUyqPpswFb/nI+AqmbpT6OWP831G1D07jGUfkoW5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Cqpk3ACA;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D41D606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D41D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Cqpk3ACA
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4bb6bbc025aso21672055e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795106223; x=1795711023; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VESp6hsfsBjU8MDr+X58zX9DGjPHSl10HXSvMJRGh40=;
        b=Cqpk3ACAMjA/LkzAhUUWUONLb4WfxoWIVI58AyTNiyYFoogkR387bB+FREOqy+vgsg
         2qSZtira57MfSWJMiN7/HAFvqF2BP7Ahr5lE8qrNEOGamcwjpUJNZpexASxmAWWjcHx9
         77kqIJs8JRXYGEUi8nwAAUbws0c02CpKAHkuSTTpFHgmK/l3GMYw4H428sL1xIneDIXV
         XvTrJtTxq7R3Fql6FmkpjvNQNlQ5Gwc2lMyFT/wOAoSkD1QLg4bMUfXuXtMNefoV0rDa
         97tHoSWb9/7SNj1j1nr8/nO2JN8VD3oUhbiJzcwgx/h5QdamoOueLaC2Fq5YlRU/b4KB
         nZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106223; x=1795711023;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VESp6hsfsBjU8MDr+X58zX9DGjPHSl10HXSvMJRGh40=;
        b=V9eASGDaSKin0DDCiJcNE5RWprODyIjWjIlkMzDkA2Z6V+9tmk2/Skz1ArQoRldL7B
         sQ4MpRlfXj+WnlISeDhAAd9vH0ibPRuIDKUhACXADLdYi0Q1OLErqCd0jR+rtT/W1aGS
         9rGdunemjXfUOwMdsukfRO1ZTXPV+m1Mb+BzeY7lBrlP1k9Qu9BiTcrceSZsyLDW4Q9W
         cVi6QTykzpjnuP3Y4NrkdGblzJjXaY1fbgRIsxF0f+2g775Bx6WRb1MaKyZGKwEp1X6X
         InGIR066Zc5JCG9Y3bYRYDAKTPX9q41bU5nRi6sf3q5TwWf2ndgMRTVbVGKZT9O+jI1z
         hxag==
X-Forwarded-Encrypted: i=1; AL+hErGvsZbek87si4umwNUGIl3APB+6mahoxUFk3q9MkGCujWvb6o7kqo1HQ8Ueb0wQ5Ta/pBQDa0ZrXhqSYWk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9707IWGko9sGoMU4peifH1hCrFBYi5CobtFczjl7YMAKlMk5NB
	A7+GOH0sd9QwzGbtcPGfilQcOTx8jkBNk++aImfgodnB0PNHL15xORjVBQs48p07uokCvTFGnQK
	P6nQPq5IfKW7d/nXp0w==
X-Received: from wmsl30.prod.google.com ([2002:a05:600c:1d1e:b0:4a2:df9b:ef74])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:820c:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4bb887876c0mr2867805e9.0.1795106222831;
 Thu, 19 Nov 2026 08:37:02 -0800 (PST)
Date: Thu, 19 Nov 2026 16:36:54 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKUl/2oC/x3MQQqAIBBG4avErBtIIaGuEi0kf20WWWhFIN09a
 fkt3iuUkQSZxqZQwi1Z9lih2oaW1cYAFldNutNGKTVwOK57Y2dPywnRbuDFG3ToB6+NododCV6 e/znN7/sB9gx+wmMAAAA=
X-Change-Id: 20261119-gpuvm-data-rename-cf6e0e59f266
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2803; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=9nHlV2IX0ybZW/nMkDdw/FTgCb1QJu3QEYfuNAVRj0A=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/yWoV/6pHAaJqRouM2ol6MHJianug+Bx4ROFW
 +3RUAa1s22JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCav8lqAAKCRAEWL7uWMY5
 RixkD/9TEsvRdSu4RFQ4gmgUKRWqfYAK20JPBM8Uy3RWetQUpwN0EKmAxE++IZVd7IALAj4yVHh
 7QZVfsVeEKA6+p968hukuRdOG2rSeXsYkltoY7d3HDV9H7K1l0D9chzC1+Sit2Hwc6P2c+KC7Zw
 zXuxCwDij9gtTdeHHgrh0gIU0F29PAvBaD2Vb3UDcFVrEzATP8XmkJqTDkrsvG+9lmpdQWGKT4l
 8hs+v/VygwdwAQf/uMa/LQ5VOZ4RW3wQrcJeLTZ14b3dLlTTnsbNAWCZrj5gP0MbVTa/juAl2Hf
 rrzzTWw/Vbn4352u+sjHziaHvHAmdBqAbgzQCI5F5KyosGOPIYYjvRzIkUDBPNNmLGggimjMTBk
 /0VF0Ev6rEFJzwhu1ybCBj/QGD79XcHhu4o2vx3ljAW2LqsqsxJcVWLxcCXAbQgR2kRN/t0HMR7
 /MyBvKSqLW4cFoXd2+nrIkOTL6NwQnYxBLmqQkKwf60LIf+8m6QKs0ZlX686VtLJCiMMNfytrKI
 0AawmoOhuZSCS3+KfM55WzY9xyPeDHqMshWIFsW6sTGhPn/sbPCjLLCknfm2KQkv2nXdTG0V8bX
 hGLtXjOULF4YiVZpbHtN5Bf6Xg+7KKPPaEW+WP+SPqJfSOfGOfu38IxFnQGQdpsfxmw4PM7VcAw NV94UCWU3/05N1A==
X-Mailer: b4 0.14.3
Message-ID: <20261119-gpuvm-data-rename-v1-1-8eb773435fde@google.com>
Subject: [PATCH] rust: drm: gpuvm: rename UniqueRefGpuVm data accessors
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>
Cc: Sami Tolvanen <samitolvanen@google.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

`UniqueRefGpuVm` currently names its shared and mutable data accessors
`data_ref()` and `data()`, unlike `GpuVmBo::data(&self)` and standard
Rust naming conventions. Thus, rename them to `data(&self)` and
`data_mut(&mut self)` for consistency.

Link: https://lore.kernel.org/r/20261118111653.448550-1-aliceryhl@google.com
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/drm/gpuvm/mod.rs    | 4 ++--
 rust/kernel/drm/gpuvm/sm_ops.rs | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index d9d43d719761..23e73da865fb 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -311,14 +311,14 @@ fn sm_step_remap<'op, 'ctx>(
 impl<T: DriverGpuVm> UniqueRefGpuVm<T> {
     /// Access the data owned by this `UniqueRefGpuVm` immutably.
     #[inline]
-    pub fn data_ref(&self) -> &T {
+    pub fn data(&self) -> &T {
         // SAFETY: By the type invariants we may access `data`.
         unsafe { &*self.0.data.get() }
     }
 
     /// Access the data owned by this `UniqueRefGpuVm` mutably.
     #[inline]
-    pub fn data(&mut self) -> &mut T {
+    pub fn data_mut(&mut self) -> &mut T {
         // SAFETY: By the type invariants we may access `data`.
         unsafe { &mut *self.0.data.get() }
     }
diff --git a/rust/kernel/drm/gpuvm/sm_ops.rs b/rust/kernel/drm/gpuvm/sm_ops.rs
index 742c151b2540..9f3fe7c954fb 100644
--- a/rust/kernel/drm/gpuvm/sm_ops.rs
+++ b/rust/kernel/drm/gpuvm/sm_ops.rs
@@ -381,7 +381,7 @@ impl<T: DriverGpuVm> GpuVm<T> {
         match p
             .sm_data
             .gpuvm
-            .data()
+            .data_mut()
             .sm_step_map(op, p.sm_data.user_context)
         {
             Ok(OpMapped { .. }) => 0,
@@ -402,7 +402,7 @@ impl<T: DriverGpuVm> GpuVm<T> {
             op: unsafe { &(*op).__bindgen_anon_1.unmap },
             _invariant: PhantomData,
         };
-        match p.gpuvm.data().sm_step_unmap(op, p.user_context) {
+        match p.gpuvm.data_mut().sm_step_unmap(op, p.user_context) {
             Ok(OpUnmapped { .. }) => 0,
             Err(err) => err.to_errno(),
         }
@@ -421,7 +421,7 @@ impl<T: DriverGpuVm> GpuVm<T> {
             op: unsafe { &(*op).__bindgen_anon_1.remap },
             _invariant: PhantomData,
         };
-        match p.gpuvm.data().sm_step_remap(op, p.user_context) {
+        match p.gpuvm.data_mut().sm_step_remap(op, p.user_context) {
             Ok(OpRemapped { .. }) => 0,
             Err(err) => err.to_errno(),
         }

---
base-commit: e55a991e09e3b44f0b0d8206bb523dc57c086341
change-id: 20261119-gpuvm-data-rename-cf6e0e59f266

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

