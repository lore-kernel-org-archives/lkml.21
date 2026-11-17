Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943958;
	b=USX7So/Dqo3GrCeLhzf/Hwsgcy793f7dS2/tmse1nNG3FRGNQc1YWgm0fWwRJ0pv7hRP
	 SVy/vrxwldrXCYlM8/SDf3HmsNWm3NMkMndmIWbI2BjQUNlkHWOaCVTeugFORK9ywJRV+
	 jFXlzJI6rmnG1hJRx8oJCyOaXcER0rZF0xWunajONsQizOt+I2oXaetW4Fh2s2eUOqCP+
	 hgmH7Y7f9gnnHDQS/EfNqW93t31LRXjaIP1KMkkEI8nfyngT4he0JUXeeE1GOfpAwfV2q
	 g3izRFBf/wQm7C9hJk3QR1NDHa00yj+A3e1YHchR0Z4nGpIx5Ee90okxLFzgToFnd5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=+0+txM7MPeyJRwa0Sn9PNj0P/voFCRRCRvjyl+hjpB4=;
	b=Ax3+K4o5HYVq8Ae3pSHNX+rXPIebN1CRGz4+QmKXRRteF31q+5uQEljpwPPty4sbJ7GW
	 e6xUr0LjH+aLoTB9jizZ/w0ocWtLhcuHc4vQh0srx5OC3GmzWp8Spx9SSAgl+6GSAGXXY
	 WPNhdQ6waKL49/t/ItNJNGP9DBx5Ic9nMZk6Locynenhfa4nRCZdm0lWQfNJX0Dy99XgJ
	 9Az20BiN9eyQ9OBmz3LQKKli6xCPGkK2GLPxOVYRbBHywBKzq2DmiAQpGMqqKl0QpyFqF
	 PhlyoQR6z5EX1iwU1/G0Dmn77W6/tu41eNSlGFNiWbLpB8qiJCNmasXPVHCiCwz4xLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ouk+s3U/";
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E5F60A263E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3E5F60A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ouk+s3U/
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-49d70f45b22so96406f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794943956; x=1795548756; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+0+txM7MPeyJRwa0Sn9PNj0P/voFCRRCRvjyl+hjpB4=;
        b=ouk+s3U/cPUMl5YYG9bfqgivs6ZmlkfkAFuyZnJVTXuly+H1q4mQTQFxfqdkXiT9/w
         9+TJvMayC75X4YPONvjwpvac6H9gIV7vKiwK4ZoA56aY3MdLrBFVY6KDrlu/Xtymqu43
         HCaISoxA21xeIDV1iK+gj9R1lqz3Z3cb6rQd513/pYvz2Tn4ZWIUwM23eBqFcpG+1e48
         7nNkZxIlbrMQVcih1tA0kL+x93O/3/q+RlVMOF6nlwY0vawGCpGpY6XnKlb9dVUCGcao
         jO18l7RUkxSYEyqwxBFXNjLhkkYoZ1o/cVBtDdGPvI2p5ritq1dHYEjaFembsXCTmYbn
         aEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943956; x=1795548756;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+0+txM7MPeyJRwa0Sn9PNj0P/voFCRRCRvjyl+hjpB4=;
        b=rESjcVX4UQUSMA0Z+HAm23fMbff9Yzm46JAlc5PhjBHSCk4EWhu9MUNlnKEKUpfq/C
         bsWMxcoQ5VZWW01v8bMXghLsIWivup/jju4/v2XJPBznx1KemQz595DhPSm9+iWQfoRl
         eh7zTSwYjuxmhRaoqMssRAGfc64w7HyD6fKRlJ/57THSLbsyTNVg0rVJ9NimCo0U15ro
         yeV0vS1KNOi16bFiOHcnhpxL2YekCxv8Nf8yecuavyu3ZxCBCoYK8esGepLNO7LkR/H2
         mN07tjM0m5Fo4wbEWq2Ll37tRpI+EJi6lTBfktR1dTL9kdIbzIsR2QymmpGU7ZUTjaFp
         yS+g==
X-Forwarded-Encrypted: i=1; AL+hErHNBIljlCZvy3mmO4hW3QwUFhX4Y5r9pb5bSul249C4p+tlqrY0Ztq4/CEfgtZw6t4/5gLwkvu9JrQ6ffo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8NNG2fnCO9sKRjTywPCE/e7nO7KMwDYKHgB+oRVizuNBvmrMf
	BHMmbELynrB4buHUDYMEmQDuTsZi/RxYufYAH5ezx2e3PhLECJrDLmaVVZhKcCjrQVrWqlv9u6d
	zDfMdNaXgXoV/RO5ujg==
X-Received: from wrnb4.prod.google.com ([2002:adf:e644:0:b0:4a4:9fcb:c0d2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:983:b0:492:820d:107e with SMTP id ffacd0b85a97d-4a63cd0eb78mr804149f8f.47.1794943955847;
 Tue, 17 Nov 2026 11:32:35 -0800 (PST)
Date: Tue, 17 Nov 2026 19:32:18 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=qullzfbasZ1PBAiwmelJR8Wu/8Cq09DzJ4AhkY0NXXE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/KvQhhfo/i3hpH5lFbOyDEwYbHCYaKQPRqu7h
 BvCnbobi0mJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCavyr0AAKCRAEWL7uWMY5
 RojaD/92+hR/vatJndmWWwF1FE/2fpo442zd/mWkRgzBkO4VFIAIzF35Ckwt+5scDlitsJkhc4o
 7T+bS69Ze3KLWfegrGht24waHlj7oB6wbMYYWLuZPB4utAyG5ljJC0mvJ1qATyBmphbuTCBLuFi
 5wHzxgysG3H0vwDgykoqSpqhIhuDKyYQFHTOa+gQZhI/xcR0TLOEx0Dfw6zILOQX17t8WJz345G
 KDFh2xc0uqfU3sV8o9EcmfTo6F1641JtsXVIZY+Oc8yCAv826HzwsxKkFFYyfjlic3zEblEubUV
 xhxRwbdq76B9Xmq0i9Y1COm6pHZb9KUaT+yeeYxGUEamZwGS/M5a1palNLRGlKuWT8AOfxIiWcx
 x/w6kfDtP2nKNMYdbIFzkDF78wkZAsanc9VJOAca1Zotbxsz7w0NKQNoYgUV6WrYcbUQ/PVupF/
 g+6zuUAwfP1uey0kc0/sMvH3qwmkT0hHalKomEES5QimHuMCP738vgMWnft4jczbjNevxCtr7CT
 6vrskXM6peY7eqcGV+YNA7uCIc8fRk5XD+IXrNInmibFCEIe8m7qUPHjcOL28p7WLdh42VO/4Cq
 vXfm9Xij3ONUlRy/h4Vdizgeo4bpmukCIFSSZnsdGDujDlDMIDbMcpZ1cibReJ/j390RfadZalx zRc6pYOXWN28N3w==
X-Mailer: b4 0.14.3
Message-ID: <20261117-tyr-remap-2mb-v1-1-2a8efd4c8180@google.com>
Subject: [PATCH 1/4] rust: drm/gpuvm: add GpuVa::data_ref accessor
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

Tyr's VM_BIND remap path rebuilds page-table mappings for the fragments
that survive a split, and those fragments must keep the protection flags
of the original mapping. Add GpuVa::data_ref() so the remap step can
read the VaData of an existing mapping.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
[aliceryhl: split into separate gpuvm and iommu commits]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/drm/gpuvm/va.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/drm/gpuvm/va.rs b/rust/kernel/drm/gpuvm/va.rs
index 46493f0ec5a6..f81302faba61 100644
--- a/rust/kernel/drm/gpuvm/va.rs
+++ b/rust/kernel/drm/gpuvm/va.rs
@@ -87,6 +87,12 @@ pub fn obj(&self) -> &T::Object {
         unsafe { <T::Object as IntoGEMObject>::from_raw((*self.as_raw()).gem.obj) }
     }
 
+    /// Access the driver-private [`VaData`](DriverGpuVm::VaData) associated with this mapping.
+    #[inline]
+    pub fn data_ref(&self) -> &T::VaData {
+        &self.data
+    }
+
     /// Returns the underlying [`GpuVmBo`] object that backs this [`GpuVa`].
     #[inline]
     pub fn vm_bo(&self) -> &GpuVmBo<T> {

-- 
2.56.1.703.gf848ed807c-goog

