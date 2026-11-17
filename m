Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943959;
	b=okC1hFAn+gc/Brj20MbkA/uFXURt+5xD6a+URLOtsDG6acNODz9dxOzCOEm/F2w5zqk7
	 0ozJibtJ0LxHtIdIiecwP9R2XqImALWE+12wlxsu9991os8EQZ6abF0TSNIEWRPoKODFX
	 RXdl9ETFlxwBggZ1u1Heb7s7MmXhvlvDS8NGnz3TW0zRYz/KJtzLZYbH0Z2+CBx9CIAiI
	 frvpYN1dLMi1m/l+tt7jZFs46ltRFSjC2GBl6KXHq/IqF+6G3eHICoKMs3cBv1Y2/ekrv
	 4O3TdwvDbLEQopYjkW0JDpjXTqDo91DK8TOD8MQSvj+bzqLtDjuF96/xPWsqjWmXWdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=H4pN2M9wOQsksT8v2A6luJsQGTApmzqSYccD0MaszVk=;
	b=T3C08HJmBZ/Cme7pC6W5OALdeSUxOZEdBSx/UYTgL2wxxFVme6MmJf7IeDRu6q2XYWI8
	 AhmJiu25dinzAV05aJmZ83WIWmIFGUuqfBV1wLNgslFRnlyNL+0YN6a0FQbE1w+SfoOod
	 slAS+aOC1xpEtkwFJWpV7pGBWUHMq5/BKQVJkxii2b6GsOxqWHMf7VU9dVlYpvF/ayzgM
	 mlpA0s05JeV093ExFo9HEDagD8mPSO2Ynf1BrsI9viVnl8bPWqfY6HyO1MPU47f8S0X3P
	 4NWjFBKBiAF6Sw7MjH97vvW01I29Sr5cvzdzt6UjToZzuYSTbZp7o1KXsOvgoSNjj9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M9GVB9o7;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F54606A88E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F54606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=M9GVB9o7
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4925ef75fc4so83259f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794943957; x=1795548757; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H4pN2M9wOQsksT8v2A6luJsQGTApmzqSYccD0MaszVk=;
        b=M9GVB9o75OoC6BHxgpU9PCl+CnnZnv+uB/3w68k7H8o8Vl6twEBeGQS/0zyJ/bAihI
         MPlUpolKwoSnFxWE9tOMIZSfBIpAcgpyUPM9sZHGVL2zcFhjURug9i+b9d2I2jMtuNpA
         +sCfXkMKJ87/cZDZw9Z46IvbId23+97dP6H3QTJwsKn7z998Uxs0J5YNvo67fW8ZaTm1
         sHmF59RC4fuPGXy8WGArX4BkV1NAyx4iOJ/7mx46ioFW/c0jRnx6dWabJ8gcPYI/COji
         PnxzYrfhysocf9nZiHO0uhAr2ugYqIBRTTU7J7euyIpi5hP9Z2VlDpFyFqIMkLG9kaZw
         Am5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943957; x=1795548757;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4pN2M9wOQsksT8v2A6luJsQGTApmzqSYccD0MaszVk=;
        b=HkbowGKd30DWlXVeo+NShudvosApl9gAasF097EE5GrUIfwHBYyp6LDYFppBB9pfVi
         CH9GGLf1qyGXYlttbyMlc3zikUHJSdItVw751zjaEFu6DZmf+Ri/HjAP/17IzBiRVh9G
         W7L31zXqiyy+Cix/FmaKXYw3c2xEqQb69Y2Aq5mFBy9f0881HKqweeSSfwXzRYFknAVK
         6ZRG8jrKZxs/pG6RJvw5jqbAytU+pjQ4r1boYI48Lp/t7sI8RXbchjSM3XcFkwE1zlzx
         IE9bNRHOyQAgqkOyIEf2z0DTvaCzkxLJIkovvFKwme37ZXSUcrf193hCsDAlpGH+pA5+
         di6A==
X-Forwarded-Encrypted: i=1; AL+hErHdliV5MokBb0KO9bnJ40ezN4/mbr9lIEP5baXW+WqoElBW60nGz3pln/wb3kuP7KM1ysZexb94B6gQAMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oQR5dUK3hTBbGo77RK3YjxCuaanqPLNQ9aZqjG6FYkgBuWSQe
	lqwd8H0C3G97t4RMULJwB3i0r+78LC3BIW5FbDD+uOrxh1SU2XYEHkAozImmm+QcWBtoHxEZbQ4
	DFrXDcmbPPBIn4LbNrA==
X-Received: from wrri7.prod.google.com ([2002:adf:fc07:0:b0:48e:a88:307b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:4b41:0:b0:4a3:8b21:51bf with SMTP id ffacd0b85a97d-4a63f182f83mr740599f8f.48.1794943957287;
 Tue, 17 Nov 2026 11:32:37 -0800 (PST)
Date: Tue, 17 Nov 2026 19:32:19 +0000
In-Reply-To: <20261117-tyr-remap-2mb-v1-0-2a8efd4c8180@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261117-tyr-remap-2mb-v1-0-2a8efd4c8180@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2309; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=+WyZnWDfy306Ajq1PPGtwj5xtYYAYr61kK3N/Swr1tU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/KvQsa1UM5WU2G5oJXUq4SO8VXyaXylfiF4lZ
 iZXO7H889uJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCavyr0AAKCRAEWL7uWMY5
 RmOED/9SPEc5SVbIFzMOA6exlWVkV17LrOPMbmZ73sFVMoW6dCfBjoLKmng6Ja/pJd0w8Dv3LzD
 CpvEactijAk0jM504Lfmq0eO3Hlu7DpONrjHI+6FRM3pEY7wItYzrkKlhaCp1UmneTU301YlJhe
 xWOV1nOW9Jxt2tBUlTG1mL9eeUiXB/cyfGesZFlTg1OGvyIA+zscZIf6qyf36NL6/rYp6tog4CJ
 ObGH201LRf/gJx3W4Wwfma+Fmu6adSlZf3I/4dXwqf5TLtSYuSt9mIxZEVYsmaWgSepSLsPwriF
 b8KsXKB3oR6FD5nRgJEWoiQSvbXaQ4h/yDq0CX5ohQ1nTSlSAtrzKAiuKTmP2XYpaBvFQOQNLzQ
 QKK9NGzbeulrMV/+dc2l2GhzgbbKUvHYQ85IdcxdCY6vWRs4+EkOp32kW/iDpaQfotRqxItDSdb
 a/SN3nsMgQPLc9NgV5Zmakgr9HdXrOxFeF8N1xFRgaB2Rggd0LyV0mpKM7WLFRl4hmGVctueN9G
 aXQuMEtmhaFiEGToBlacYoxZxAL0Qf5zQ8GJYGLqXY3LEI8ICybR3mYK9Zxd7jxIubVUUp9E+l2
 yiHoYfcfmW884QNrI2NgtfgooFHlOA3QbRPK9rVtt5JhMOaIgBEXuPA3Whj24i04wGYc1Sa2XCQ YjvraWdGlh012KQ==
X-Mailer: b4 0.14.3
Message-ID: <20261117-tyr-remap-2mb-v1-2-2a8efd4c8180@google.com>
Subject: [PATCH 2/4] rust: iommu: pgtable: add iova_to_phys
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
	Deborah Brouwer <deborah.brouwer@collabora.com>, Sami Tolvanen <samitolvanen@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sami Tolvanen <samitolvanen@google.com>

Tyr's VM_BIND remap path rebuilds the page-table mappings that a partial
unmap sweeps away, recovering their backing from the still-present
entries. Add IoPageTable::iova_to_phys(), which returns the physical
address that an iova maps to.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
[aliceryhl: split into separate gpuvm and iommu commits]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/iommu/pgtable.rs | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/rust/kernel/iommu/pgtable.rs b/rust/kernel/iommu/pgtable.rs
index 5f9b42ca92c2..306c03862a72 100644
--- a/rust/kernel/iommu/pgtable.rs
+++ b/rust/kernel/iommu/pgtable.rs
@@ -199,6 +199,29 @@ pub unsafe fn unmap_pages(&self, iova: usize, pgsize: usize, pgcount: usize) ->
         // SAFETY: The safety requirements of this method are sufficient to call `unmap_pages`.
         unsafe { (unmap_pages)(self.raw_ops(), iova, pgsize, pgcount, core::ptr::null_mut()) }
     }
+
+    /// Translate an `iova` to the physical address it maps to.
+    ///
+    /// Returns [`None`] if `iova` is not mapped. As in the underlying C op, a mapping to physical
+    /// address 0 is indistinguishable from unmapped and also reports [`None`]. The returned address
+    /// includes the offset of `iova` within the mapping block, so it is exact for any `iova`, not
+    /// just block-aligned ones. This walk is lock-free and does not allocate.
+    ///
+    /// # Safety
+    ///
+    /// No other io-pgtable operation may modify the entry covering `iova` while this walk
+    /// executes.
+    #[inline]
+    pub unsafe fn iova_to_phys(&self, iova: usize) -> Option<PhysAddr> {
+        // SAFETY: The `iova_to_phys` function in `io_pgtable_ops` is never null.
+        let iova_to_phys = unsafe { (*self.raw_ops()).iova_to_phys.unwrap_unchecked() };
+
+        // SAFETY: The safety requirements of this method are sufficient to call `iova_to_phys`.
+        let paddr = unsafe { (iova_to_phys)(self.raw_ops(), iova) };
+
+        // A zero return means `iova` is not mapped.
+        (paddr != 0).then_some(paddr)
+    }
 }
 
 // For the initial users of these rust bindings, the GPU FW is managing the IOTLB and performs all

-- 
2.56.1.703.gf848ed807c-goog

