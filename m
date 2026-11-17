Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943962;
	b=Ry9QBmk9bTPBzEb6VK+b8FO4pcaN3MbaAKdOhsYE5GZF3EvjFmeNFWOm7z06Ue1GqOSS
	 4wisLamv4yzbdW7Mp6u+01M7CEkI3AgSpusymWlNXNy5Whb7n+IDI33M4VN1YQxYtpWa0
	 bUqi9WSsa75kfNkU9D92femzHxStXn7kHHO5QSMKGnXtzgeQeYcya2YNFagtHWBrG9B7F
	 TN7mRKmmnIRpy6mswGdAfemKTNrBe4Jt12mOnTS9xfDbCli32oIEEEIY4FTdgVFJ7ZWbd
	 3EBQFPvWD0xmPlJAoQK8sJPT334wGV9J9C5mMNSgxSZJpOYbdckMhgSTSlvZc2YYDXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=sEdsgEuo8ODT+rI1rQ1WVM7pBhVs1i3Hp1pw+AHwR1c=;
	b=Ww3mk5U4wdBRRziQVlRBlOtLqCBI2FUEcurMF/lHW1Lhxa+7Sx0hOmB8qktYYSfyv2uK
	 OUYuRxuUNrT+nnOlIHFarl/UCU9bWAUSoRg1TQqzutwCTbqt8idM5rGuYKfadtkn0Up/k
	 ID3YRkCyiPpmKluz5pIUDyzICJolNaVadi8Z3JvaZMqBZAXcb6lkC+ljcWMz4cnMu2+Ko
	 hsBHk5cNbOIkw2vgHUjN5r6PUxj6IrudQrv4V5TnZzNQlOwN5rWLYfn5dwT9ZeQyvpbO5
	 5Pw7lvHeKUqXbJGRWBF08O3lITijMmS+gh9FiYJf5HVQwpli4i0iMzSMfZWw2aUxgWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iBl5NfRd;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B9960A5BD1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02B9960A5BD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iBl5NfRd
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c508bafaddfso5815666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794943960; x=1795548760; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sEdsgEuo8ODT+rI1rQ1WVM7pBhVs1i3Hp1pw+AHwR1c=;
        b=iBl5NfRdf5cWA59IJIb08trlhqEfUF3MHKNPKAS1DywmemLi225mbyoiazWQV2Hd/G
         uE+acbsK9lrJU1KLQuGHaG3iy0VdZPiZF2fwknbpUT24LTHpMiBqlQq+NEXA4PhRdfHd
         iLQmLvF52RBPz8Y7psq53+eVKT2y5ggUMtk8ZAKsSkRytoau4sPV+jDdXLXPbOi86bG8
         nrONNNJ/yNH63VOVmh9r2O9t2gOaZy+IIdzUZKBfxBCC9muQRwCIrbyhoMkTCFiwUWJK
         3wLLe6R1hWW27KKYd7bX2w47bhvdo45Ujc/Z912zbctkn0eJuL6052BNwW1O8Jd2+ePy
         CpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943960; x=1795548760;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sEdsgEuo8ODT+rI1rQ1WVM7pBhVs1i3Hp1pw+AHwR1c=;
        b=P++eM2SXD4zZgAyreaKaQZP3+gXbm5EuDB/kN8DqLospmu4PbvIij60GyLOUxaWVXM
         iM1wLLndiiLhiLmy405oYOEqXKR7riPvZ9Ib3yacr7/TE1rsUEok0M1CTPRfyqGFVlas
         EvdeaYR7+mpwZgBKpb4J17+HYh3LNraZzDY5V0XuhdBFyHq3BaDDLdmMFh80sO5TqN/K
         QuviY+1RdDA8EQ4lvaPVFdosfLst4/D76/kyfjr5kt3iRVkqF158VdeyJ2NQYTMPjp/c
         RfCYROTURHMo8uBm3dL4Nc70lVnKmISCbrhkn9P1v+Iv4Epm6RoRiTUdz3Uw9YjvjBOp
         bO4w==
X-Forwarded-Encrypted: i=1; AL+hErFVNDIZz/yJ+wHzvdNwFI+FSTvkr9J+iERqQcnAMo/28T4byWdp0yG+qQwtfLR1XtZ4kWLK2ZEyzSUxxTM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IbHeC/4wYcHpXv1e0lggT4KLGg3xSe5WPFeGpRJXJO/NuJkQ5
	yj8ND32fAx8IHfK0Zw05bxfUceGsEuMZT5gmIjE9CPceZJrrnEeqbEY9Zyxft/I/zaz1E3SCFla
	iqjt71wcCFfOJotis6A==
X-Received: from ejeck9-n1.prod.google.com ([2002:a17:907:e1c9:10b0:c46:aa24:8716])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:72cf:b0:c2e:2252:6ddb with SMTP id a640c23a62f3a-c510e19b51dmr22046066b.10.1794943960151;
 Tue, 17 Nov 2026 11:32:40 -0800 (PST)
Date: Tue, 17 Nov 2026 19:32:21 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1251; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=fHxqvSNi6j+mg7W4SOrkydkocL0Pw6SV4czczy3ta6w=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/KvQUDExEsHiZ6Cbk1w6CzxYFmFSS4BSPnhEk
 MSLEGspzROJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCavyr0AAKCRAEWL7uWMY5
 Ro49EACB0ftf0GHD6NVKJk8qoRRSAA8NtLcQxD9TKYzGe5l1VQ2v/ZRDvNthAokzdRvaDp8M5PW
 1IvhSetFJ1EPRT9FlJXK2lAOTgNOjbV31SMgyfAeog3PyR/AAEA3mJegzv0uA8x2BFW2ftoq9ez
 ftvL5TL/kRzHs/YDi6niQqRXc3GlcM1r3KgpKlj0pw1CgsDeZsfeW4DA8zi20tZ0dVQy8k6SN74
 rnpMamiABEsq9czO0k0TAIo2PdqLkksEo7LJrATWxZZbSw91E7qLnu7xVAqb6VQqH8KVjDyFQ4L
 3D90Xoq/m9Rzqv9GUeIsTH+oGkRb3rFkj5NdcdOybMq8+orYHWW+qHORyYvOBdGdzy8ICUh66XI
 2O+Mez/FxA2cxniGl8lj6y0zYwl9OSQE+6w7sOXqEYHamldd+54o0hcZQIXUFNk3WaA8PnqKRFp
 agH5mLLhUCQo0e1DL5UHQxBjwRtmyqQZ44vAMgM8d4wFArAd38y2VLOKLic+hHzm7WcRo1p27P7
 gq6FHPM27S4LPzaN3Kl94tyFAKa4gt1bju+FU6AXnvDVFK+fY+Gs3Hf2GAH8Kyv5Xpmh0pFcwiV
 O4rKaY4DkUE50L1H+Gl6XcUjAkTinnrj9ZXxVMj4eaxEwyvrozh91m1ow3Ep9bEm3FNtth4J59R iniBlvdTGiEmd5A==
X-Mailer: b4 0.14.3
Message-ID: <20261117-tyr-remap-2mb-v1-4-2a8efd4c8180@google.com>
Subject: [PATCH 4/4] drm/tyr: vm: check the remaining length in pt_unmap()
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

pt_unmap() subtracts each unmapped chunk from the remaining length and
relies on unmap_pages() never unmapping more than it was asked to.

Check this subtraction and fail with EINVAL on underflow.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
[aliceryhl: use safe casts instead of 'as']
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/tyr/vm.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
index bcc864b17428..acbca552d133 100644
--- a/drivers/gpu/drm/tyr/vm.rs
+++ b/drivers/gpu/drm/tyr/vm.rs
@@ -41,6 +41,7 @@
         ARM64LPAES1, //
     },
     new_mutex,
+    num::casts::FromSafeCast,
     prelude::*,
     ptr::{
         Alignable,
@@ -1063,8 +1064,9 @@ fn pt_unmap(dev: &Device, pt: &IoPageTable<'_, ARM64LPAES1>, range: Range<u64>)
             return Err(EINVAL);
         }
 
-        bytes_left_to_unmap -= unmapped as u64;
-        iova += unmapped as u64;
+        let unmapped = u64::from_safe_cast(unmapped);
+        bytes_left_to_unmap = bytes_left_to_unmap.checked_sub(unmapped).ok_or(EINVAL)?;
+        iova += unmapped;
     }
 
     Ok(())

-- 
2.56.1.703.gf848ed807c-goog

