Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097584;
	b=SFl98UbuaSCIkxSrKNryHszNKpbRwcbByNHP/jFRhwKpgwoBNbcXH6wMv4vR0iPCmoc+
	 GHXYsgdoiaqSVaUOnrGeZnx275fOXxHF0yhZSrA5a7rQjAMIzeARRYqfY57jRxqRacWI1
	 I9BTtUk0C53Z/0HwOrv1+H1FwoZ3zWSagCqA0y/rO80YHU+JTTWMtahnh5YE51k8k1Nwu
	 DMaSDGOyZYghtBZkDeDjkvj2W3q1zGtDEiufpdWI7Dv89ChG678xGBqv8KP8uNzqySAc8
	 fgy1O6pw/eEVv+IRjV+ivKF8zi45wiGkf176SwF+gkcn2nV0DAi/laSBa12WLGUn/OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=y1oHpV/LsieEJFLLPZ+81lTiB0zWbNqxFr3Xnsz5XgA=;
	b=JqzdjioyK/hMc+3gVMefqulVr8GIt3uHawiRVZREvpBZfLg0fJeDu7QV2C+JhIrBiDK6
	 MmF70PavV3fvyLVMqY//LJeIO6enndLnv/6XLBh1vSysghKorBi0o9Vs8dv0CBr6meRUR
	 XSZHgylvGWgLLr+z4DxCMzmwKBnQ19f4NZAeqFJBgfpN/ATx1V0lWBas2E+w6jOfD27QD
	 qOtBaIlKR7TdB+0ZB0Y23jGklxV5RM2RfNk6jbKOub5ZAZsNR5D8Gen02SHC2f3eAcv/V
	 8lpKk9K+CAkltdrFuA1t6RqniQ59CWswKFeddSRkG2K70PXV5bG5WXwSH7eDRJZsB1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NsKps9fa;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B59E60A3812
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B59E60A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NsKps9fa
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4b764ffc014so19851755e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795097582; x=1795702382; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y1oHpV/LsieEJFLLPZ+81lTiB0zWbNqxFr3Xnsz5XgA=;
        b=NsKps9faGpeFPnQt31IdPU0ANBwb8ptFpr1Da4VmhUfIavUv1vOdBVDt0KFit/E9OP
         P1ySb0z2LXS9o9KhSzMbUeBuvv5bNRIwZRTQaDG0HuA8r1/kjkpIjASr7YAXIMpAExaf
         Pxw8h8WAsaHinyQBZXqSUHKz8vOc6MH9D7n15vbyRO1EVtAbJemeNZ/9uzbyBvll6tLo
         3DsMZSUeP3UlBEjqoWfrsjEZCcHPxkmSpjCCqw5wKDoxrwgGSHbf3sMhtPJtCBS1AaBS
         zkY7dCrLGTBFQ/yeaQZ8/IXvoKrP4foFuP7d1aOUGXzFqzHLtJ4dE0/d4tbL85cArHHX
         ygsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097582; x=1795702382;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y1oHpV/LsieEJFLLPZ+81lTiB0zWbNqxFr3Xnsz5XgA=;
        b=qaYTYnA9ABYZPnuX7R0EClGuDIVgrO3NgBABiahcMTjOPPOLj/dYkbBvM9E6wC0xkE
         M1cCFWWzlwCYJ+ZgoXfDPDgOptvr7OdUbgZ4jhRqgYGRI5ClHabPsjO6SNalVcuhKOmm
         UR0tsa3PPH7aWCTtFQcc2ZQ5gc1laOi6t/iJon4guisEB3t97BAXMf/j5xgHjkvLi53/
         Fi47llJ02xr8T5RlWYW1IVI2pWEEl8yxfTXMuhbjexYUw46VQbkkbu2Yc434sZjxUuN7
         okUtAoQN7y65dTxR+px7l1QCV5Ozv4vJRRMuUYcWZgOwpimFYfPaVbehaoNcDNmmsvZa
         c86Q==
X-Forwarded-Encrypted: i=1; AL+hErFulY7qtTBOl7EUIzlMpASbaWdd1yo92fj1JfDniVgeVOakzsZI05wjbTeujXenx9nE0EM+EWWtq33VJDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oXPk0czraR2MaAosXaf45jHgu7uYeQcNEIFQXr5UkVVmPA8tb
	Q388w1ZHQGf97W6UFb8+HStagOADHT98TzSxCqunC+CyD1JsV59KmdO5RVbhT4++ajaaG2LCL7U
	l+sndawW/r3rmLBoSzw==
X-Received: from wmoo4.prod.google.com ([2002:a05:600d:104:b0:4a1:fdd5:9c10])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5012:b0:4a1:fae5:f2e2 with SMTP id 5b1f17b1804b1-4bb7d6d1e08mr128396855e9.4.1795097581727;
 Thu, 19 Nov 2026 06:13:01 -0800 (PST)
Date: Thu, 19 Nov 2026 14:12:45 +0000
In-Reply-To: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=15796; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=6LjUwam0RewI0V+0iVTYpfOpIbY/kkSwySVbxBxbLcI=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/wPjcINy06ATXSiEp8jJLR8l0+SzDzeBslnoT
 CULA7ChdHyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCav8D4wAKCRAEWL7uWMY5
 RndGD/4+B5L2BhuVIUjyMBe+mR/X1+xD5g7Xc+vTadRhIBjL6WY//R21uIzZOhEWLkNW0R+0zqS
 v9upSEcCkm3m/gKC/2nKSk3REow10nXLJtj6+DN20Sst/+z05WbVgpEBWflc1qTg+sPCl3Fr8Iu
 hLIXvmttGChgArjihE4Rx0IC9SGUiB0yG/AWlh+yAeQBaki5CpHKt3I1SmV2sI4FonOwxHkfUbe
 GzTzgKf6mvFQpTxq6qn9gg1GrY3DZAV780lad03D0BIPKKT21dbpTiPtwz/9aIVwsakG7b3iTKX
 bl+3SPaIYLj/QX1BYq/F25AK7tme6RDyfthfNSZ8APcs/dL4Wg30ladGHwWY/XQYjMeoa+VGEtn
 su7f3cME3/Mbwk5bbUFEdfX6Wa4JAYAqPJfUHFXMFjMgIxXU13mDnHbb8NYv1TgMPaqoRB+CPnL
 okUi2pOSB2orzJiH+7COShsqOhCg0JEGwes+hLXk7y2VpctU16UFiF7SJriYjn/Nz+ftPnjXrHt
 v3vai1mxjwGQBnkgRggrFaRG36Kn1YAff4RwLQsPvDXJF1ppaw8tSzNSQWCPt9eYHOUnhR+50yq
 NbsuVDLsZ7f/2fnC6dH6Nd165eZnFUZwO6rMpI1XCiTyNKigciELZDaQnro8Icsp8W3URFM8+lo n3tEcqBf+YA96Og==
X-Mailer: b4 0.14.3
Message-ID: <20261119-rust-workqueue-v4-4-707c68994940@google.com>
Subject: [PATCH v4 4/5] rust: workqueue: add creation of workqueues
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Creating workqueues is needed by various GPU drivers. Not only does it
give you better control over execution, it also allows devices to ensure
that all tasks have exited before the device is unbound (or similar) by
running the workqueue destructor.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Co-developed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/workqueue.c         |   7 +
 rust/kernel/workqueue/builder.rs | 370 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/workqueue/mod.rs     |  51 +++++-
 3 files changed, 425 insertions(+), 3 deletions(-)

diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
index 337382acfbf5..7699dcdd5e05 100644
--- a/rust/helpers/workqueue.c
+++ b/rust/helpers/workqueue.c
@@ -19,3 +19,10 @@ __rust_helper void rust_helper_destroy_work_on_stack(struct work_struct *work)
 {
 	destroy_work_on_stack(work);
 }
+
+__rust_helper
+struct workqueue_struct *rust_helper_alloc_workqueue(const char *fmt, unsigned int flags,
+						     int max_active, const void *data)
+{
+	return alloc_workqueue(fmt, flags, max_active, data);
+}
diff --git a/rust/kernel/workqueue/builder.rs b/rust/kernel/workqueue/builder.rs
new file mode 100644
index 000000000000..d253c2f8ed4a
--- /dev/null
+++ b/rust/kernel/workqueue/builder.rs
@@ -0,0 +1,370 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Workqueue builders.
+
+use kernel::{
+    alloc::AllocError,
+    prelude::*,
+    workqueue::{
+        OwnedQueue, //
+        Queue,
+    }, //
+};
+
+use core::{
+    marker::PhantomData,
+    ptr::{
+        self,
+        NonNull, //
+    },
+};
+
+/// Workqueue builder.
+///
+/// A valid combination of workqueue flags contains one of the base flags (`WQ_UNBOUND`, `WQ_BH`,
+/// or `WQ_PERCPU`) and a combination of modifier flags that are compatible with the selected base
+/// flag.
+///
+/// For details, please refer to `Documentation/core-api/workqueue.rst`.
+pub struct Builder<Kind> {
+    flags: bindings::wq_flags,
+    max_active: i32,
+    _kind: PhantomData<Kind>,
+}
+
+pub enum TypeUnbound {}
+pub enum TypePercpu {}
+pub enum TypePowerEfficient {}
+pub enum TypeBH {}
+pub enum TypeOrdered {}
+
+/// Entry-points to the builder API.
+impl Queue {
+    /// Build a workqueue whose work may execute on any cpu.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from unbound wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_UNBOUND")]
+    pub fn new_unbound() -> Builder<TypeUnbound> {
+        Builder {
+            flags: bindings::wq_flags_WQ_UNBOUND,
+            max_active: 0,
+            _kind: PhantomData,
+        }
+    }
+
+    /// Build a workqueue whose work items are bound to the CPU they are queued on.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_percpu().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from percpu wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_PERCPU")]
+    pub fn new_percpu() -> Builder<TypePercpu> {
+        Builder {
+            flags: bindings::wq_flags_WQ_PERCPU,
+            max_active: 0,
+            _kind: PhantomData,
+        }
+    }
+
+    /// Build a power-efficient workqueue.
+    ///
+    /// A power-efficient workqueue is per-CPU by default, but becomes unbound when the
+    /// `workqueue.power_efficient` kernel parameter is set.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_power_efficient().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from power-efficient wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_POWER_EFFICIENT")]
+    pub fn new_power_efficient() -> Builder<TypePowerEfficient> {
+        Builder {
+            flags: bindings::wq_flags_WQ_PERCPU | bindings::wq_flags_WQ_POWER_EFFICIENT,
+            max_active: 0,
+            _kind: PhantomData,
+        }
+    }
+
+    /// Build a single-threaded workqueue that executes jobs in order.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_ordered().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from ordered wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "alloc_ordered_workqueue")]
+    #[doc(alias = "__WQ_ORDERED")]
+    pub fn new_ordered() -> Builder<TypeOrdered> {
+        Builder {
+            flags: bindings::wq_flags_WQ_UNBOUND | bindings::wq_flags___WQ_ORDERED,
+            max_active: 1,
+            _kind: PhantomData,
+        }
+    }
+
+    /// Build a workqueue that executes in bottom-half (softirq) context.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_bh().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from BH wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_BH")]
+    pub fn new_bh() -> Builder<TypeBH> {
+        Builder {
+            flags: bindings::wq_flags_WQ_PERCPU | bindings::wq_flags_WQ_BH,
+            max_active: 0,
+            _kind: PhantomData,
+        }
+    }
+}
+
+/// Options that may be used with all workqueue types.
+impl<Kind> Builder<Kind> {
+    /// Mark this workqueue high priority.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().highpri().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from highpri wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_HIGHPRI")]
+    pub fn highpri(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_HIGHPRI;
+        self
+    }
+
+    /// Creates the workqueue.
+    ///
+    /// The provided name is used verbatim as the workqueue name.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// // create an unbound workqueue registered with sysfs
+    /// let wq = Queue::new_unbound().sysfs().build(c"my-wq")?;
+    ///
+    /// // spawn a work item on it
+    /// wq.try_spawn(
+    ///     GFP_KERNEL,
+    ///     || pr_warn!("Printing from my-wq"),
+    /// )?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "alloc_workqueue")]
+    pub fn build(self, name: &CStr) -> Result<OwnedQueue, AllocError> {
+        // SAFETY:
+        // * c"%s" is compatible with passing the name as a c-string.
+        // * the builder only permits valid flag combinations
+        let ptr = unsafe {
+            bindings::alloc_workqueue(
+                c"%s".as_char_ptr(),
+                self.flags,
+                self.max_active,
+                name.as_char_ptr().cast::<c_void>(),
+            )
+        };
+
+        // INVARIANT: We successfully created the workqueue, so we can return ownership to the
+        // caller.
+        Ok(OwnedQueue {
+            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
+        })
+    }
+
+    /// Creates the workqueue.
+    ///
+    /// # Examples
+    ///
+    /// This example shows how to pass a Rust string formatter to the workqueue name, creating
+    /// workqueues with names such as `my-wq-1` and `my-wq-2`.
+    ///
+    /// ```
+    /// use kernel::workqueue::{Queue, OwnedQueue};
+    ///
+    /// fn my_wq(num: u32) -> Result<OwnedQueue> {
+    ///     // create a percpu workqueue called my-wq-{num}
+    ///     let wq = Queue::new_percpu().build_fmt(fmt!("my-wq-{num}"))?;
+    ///     Ok(wq)
+    /// }
+    /// ```
+    #[inline]
+    pub fn build_fmt(self, name: kernel::fmt::Arguments<'_>) -> Result<OwnedQueue, AllocError> {
+        // SAFETY:
+        // * c"%pA" is compatible with passing an `Arguments` pointer.
+        // * the builder only permits valid flag combinations
+        let ptr = unsafe {
+            bindings::alloc_workqueue(
+                c"%pA".as_char_ptr(),
+                self.flags,
+                self.max_active,
+                ptr::from_ref(&name).cast::<c_void>(),
+            )
+        };
+
+        // INVARIANT: We successfully created the workqueue, so we can return ownership to the
+        // caller.
+        Ok(OwnedQueue {
+            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
+        })
+    }
+}
+
+/// Indicates that this workqueue is threaded.
+pub trait TypeThreaded {}
+impl TypeThreaded for TypeUnbound {}
+impl TypeThreaded for TypePercpu {}
+impl TypeThreaded for TypePowerEfficient {}
+
+/// Options that are not available on BH or ordered workqueues.
+impl<Kind: TypeThreaded> Builder<Kind> {
+    /// Set the maximum number of concurrently executing work items.
+    ///
+    /// For percpu workqueues this is per-CPU. If not set, a default value of
+    /// `WQ_DFL_ACTIVE` is used. The maximum value is `WQ_MAX_ACTIVE`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().max_active(16).build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from wq with max_active=16"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    pub fn max_active(mut self, max_active: u32) -> Self {
+        // If provided `max_active` is greater than `i32::MAX`, then we need to trigger the C-side
+        // comparison with `WQ_MAX_ACTIVE`, which we can do by clamping to `i32::MAX`.
+        self.max_active = i32::try_from(max_active).unwrap_or(i32::MAX);
+        self
+    }
+
+    /// Mark this workqueue as cpu intensive.
+    ///
+    /// Work items will not contribute to the concurrency level, preventing
+    /// them from stalling other work items in the same per-CPU worker pool.
+    /// This is meaningless for unbound workqueues.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().cpu_intensive().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from cpu-intensive wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_CPU_INTENSIVE")]
+    pub fn cpu_intensive(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_CPU_INTENSIVE;
+        self
+    }
+}
+
+/// Indicates that this workqueue runs in a normal context (as opposed to softirq context).
+pub trait TypeNormal {}
+impl TypeNormal for TypeUnbound {}
+impl TypeNormal for TypePercpu {}
+impl TypeNormal for TypePowerEfficient {}
+impl TypeNormal for TypeOrdered {}
+
+/// Options that are not available on BH workqueues.
+impl<Kind: TypeNormal> Builder<Kind> {
+    /// Make this workqueue visible in sysfs.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().sysfs().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from sysfs wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_SYSFS")]
+    pub fn sysfs(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_SYSFS;
+        self
+    }
+
+    /// Allow this workqueue to be frozen during suspend.
+    ///
+    /// Work items on the workqueue are drained and no new work items start
+    /// execution until thawed.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().freezable().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from freezable wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_FREEZABLE")]
+    pub fn freezable(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_FREEZABLE;
+        self
+    }
+
+    /// This workqueue may be used during memory reclaim.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().mem_reclaim().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from mem_reclaim wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_MEM_RECLAIM")]
+    pub fn mem_reclaim(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_MEM_RECLAIM;
+        self
+    }
+}
diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
index 5ef807ed6a33..4f334dbf256a 100644
--- a/rust/kernel/workqueue/mod.rs
+++ b/rust/kernel/workqueue/mod.rs
@@ -186,7 +186,10 @@
 //! C header: [`include/linux/workqueue.h`](srctree/include/linux/workqueue.h)
 
 use crate::{
-    alloc::{AllocError, Flags},
+    alloc::{
+        self,
+        AllocError, //
+    },
     container_of,
     prelude::*,
     sync::{
@@ -200,7 +203,14 @@
     time::Jiffies,
     types::Opaque,
 };
-use core::{marker::PhantomData, ptr::NonNull};
+use core::{
+    marker::PhantomData,
+    ops::Deref,
+    ptr::NonNull, //
+};
+
+mod builder;
+pub use self::builder::Builder;
 
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
 #[macro_export]
@@ -346,7 +356,7 @@ pub fn enqueue_delayed<W, const ID: u64>(
     /// This method can fail because it allocates memory to store the work item.
     pub fn try_spawn<T: 'static + Send + FnOnce()>(
         &self,
-        flags: Flags,
+        flags: alloc::Flags,
         func: T,
     ) -> Result<(), AllocError> {
         let init = pin_init!(ClosureWork {
@@ -359,6 +369,41 @@ pub fn try_spawn<T: 'static + Send + FnOnce()>(
     }
 }
 
+/// An owned kernel work queue.
+///
+/// Dropping a workqueue blocks on all pending work.
+///
+/// # Invariants
+///
+/// `queue` points at a valid workqueue that is owned by this `OwnedQueue`.
+pub struct OwnedQueue {
+    queue: NonNull<Queue>,
+}
+
+// SAFETY: `OwnedQueue` uniquely owns a valid `Queue`, which is `Send + Sync`.
+unsafe impl Send for OwnedQueue {}
+// SAFETY: `&OwnedQueue` only provides `&Queue` (via `Deref`), which is safe to share.
+unsafe impl Sync for OwnedQueue {}
+
+impl Deref for OwnedQueue {
+    type Target = Queue;
+    #[inline]
+    fn deref(&self) -> &Queue {
+        // SAFETY: By the type invariants, this pointer references a valid queue.
+        unsafe { &*self.queue.as_ptr() }
+    }
+}
+
+impl Drop for OwnedQueue {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: This `OwnedQueue` owns a valid workqueue, so we can destroy it. There is no
+        // delayed work scheduled on this queue that may attempt to use it after this call, as
+        // scheduling delayed work requires a 'static reference.
+        unsafe { bindings::destroy_workqueue(self.queue.as_ptr().cast()) }
+    }
+}
+
 /// A helper type used in [`try_spawn`].
 ///
 /// [`try_spawn`]: Queue::try_spawn

-- 
2.56.1.708.g77570a6a1d-goog

