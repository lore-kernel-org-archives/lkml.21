Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943956;
	b=LJqw3zztOskVJ8kQ4G2Y/lI8IgH22S9mjc+ZQ87/KbUScv+kjLVybtk0h/++ngAxMZE3
	 O917J3El5ktncGArphc7Ie2juQe2XO5FNYWXlL2QlK+XPMc0KZu5Vfap1/b8BHFgY3MG4
	 lOIpTTaHIr5DHmUnNbzDcjB+NkOnJa+Tc7i0Ta6FdF2265PXHJSMDlXpSocaaxmdisujv
	 5+zbdAlcfAn8efcFMgZzQ/tWKZh/J94X0Uy7cf6mtEb17Ib8quRhn3Kqm3gy+zvKfczdW
	 z9nnKKkQyc3U+UGgOeIyT7RDFHzvJjAPhI3MMAieH9bdUyX2Ooh5VkiHPttr228b7YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=CWEIybWOyPQ+4rZV05KjYSAVt6nHfWxtoLBA9Fvcf20=;
	b=1HRZ1YzXRk8f4x9l6nlbvjz8221A8Miv+ADpnAmb6OHizjg2wtHBodloRGGz1wtd6qhZ
	 2d+1q2jXLJ6N4xo8KfR3jI8fvmSjk4JrECKleHO51sINR+xG4QYVTIXVKsvN/AKyNbSrn
	 9imJOwaxqeU22CXhczxXpEGM9W0HySpzDzwmr6V0P5FvhxMfhoBPIsXkXBV4ee6eCdj60
	 fkNKAOSEPXKbfPcPlCECj776/B0q7y1X+yFAhMiKaoT9uDK624dVk+NKIohz1gS7Aq9J8
	 C3Uk2k26hk+ITsYAikmpZnL+6gU4yqYME0Lp11Ehl4QilmH6vDNnVJEIvvLMMiQY7HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LOap06DJ;
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B6860A260D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3B6860A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LOap06DJ
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4925ef75fc4so83246f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794943954; x=1795548754; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CWEIybWOyPQ+4rZV05KjYSAVt6nHfWxtoLBA9Fvcf20=;
        b=LOap06DJg3ibAXIcvqMVQw8Ao0Y1NyxeIoRmnhaJfVJI6ryAuAMd2ifvJ8m2EVEWvP
         +TuEJIjfydWoMmZ+30PzqA8jUo1Z2Jy+KoMAQrbAydEUcw0LSPSOxxVBGI2RiU6hj8lU
         gIQQuxyWRraBAcmSqYkb02T0NBNo+FrPNHlgeureOLNgSW4sFGyJE9h25tKZEOc1N2OU
         e6I0s/mT84+0q8ZGpDmuYMHDs2ucatwx5iE9++bmaE5CYb/1Gqc2gsnIB8C2jrEIxTTc
         rm04QkNUb9Ri8XHQLQfRpjTclpQEl55t1YGtJc+t+1ZzdKVie2vH1MVXfciPpnGmbSom
         wMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943954; x=1795548754;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CWEIybWOyPQ+4rZV05KjYSAVt6nHfWxtoLBA9Fvcf20=;
        b=ReAt21UsRrfHWs3pFyAPUX1NWa/n9kU916rp4JlWYCqjZaF8DxhfSNGtYnVCL2Zaf0
         nhtGJBvxxMo5wnnKVNqm3Go8rLlV1qxi+8oSxqS0FvHKQTIQ4a3BK0XF3TDcgeoFMKbn
         /SjfdIS8Q3k080ulLELGFGxamJqBKphrwmTeLXgBhrSsFMROPmr/I/kDO4VGVXDLiT6n
         EPR5iHzmC6rZTRLehn9s+kbhJdGTrV90A5iNTpwP3aw6jJL85F9axdVC2xs9fLGRj3pY
         QHFDqnhpbjzJH8SR8QnBanCFFqPfNhwiweyA7zrHX6dlcnq59iVEbVri7kmgH9gCo4aI
         rSgw==
X-Forwarded-Encrypted: i=1; AL+hErFp2nqmCuQml6mxjO5Aa1G0/+FYiS9OinLz+CaXW1LH2aFrcM/M3c4AloTK6XmHY6SCEWGJce5KWUHm5Ds=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FDA7RAKUdB6bBMewIbCLapJMw012wfMOgudhBrFx1GdXZ86ah
	/0bnbzIs2dOST3m2j2Z2xd33/BqyqVnVubOZWNBDD9IQQYVdOhn7BJWHkMwLNwZ2fQ+yTKK6aKu
	5Kywyb/QCwRX5iPNfaw==
X-Received: from wrno8.prod.google.com ([2002:adf:eac8:0:b0:4a3:4620:1d69])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e193:0:b0:48e:4300:c6d8 with SMTP id ffacd0b85a97d-4a63de52730mr1008245f8f.35.1794943953550;
 Tue, 17 Nov 2026 11:32:33 -0800 (PST)
Date: Tue, 17 Nov 2026 19:32:17 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMKr/GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mz3ZLKIt2i1NzEAl2j3CRd80RT4yQLE3PT5LRkJaCegqLUtMwKsHn RsbW1AOkuzV5fAAAA
X-Change-Id: 20261116-tyr-remap-2mb-7a53b8475cfc
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1679; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=vSb8dcnD2eG8K9E1baNk0JXzV820WUHmszz9zfbL9p4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/KvIxRmUX8ES1X5aoMSyIxD/DGyKY46COBIZk
 l3WJbGYM6KJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCavyryAAKCRAEWL7uWMY5
 RlBYD/9LZxWa1EOICrXfCQo6+2FEaGCBTsGLsBCGNZt1aDkE705pnOcpv89yKcb61oL5jKTgTnW
 xpQGfS8/AHinHSIETT2reeDB4YrpfzKFFlHy+s5uCvqaMrDkS0xGr3eeSsaIDFJWASvdkEippTS
 96axYSKcL7IFwFLAmgcG6sX6tc0b5GG6YfPj75KMsMDqJ3kzAy4GDySRre+ze+MkIPI5rPoSdlC
 bDZ1yQZ+MrXVRxE2tuP33TmNT2izHdDsTxsdkPvzk7AGQ+oihOvv6lzCMkGxAhW+iBy91sIchkX
 /ewCL9ObYoq8wv3Fo0015JzMRoffi43yZVGOgl2jWFo/tAfMB0Q9JHTVRlIC6z2Mqwx6cGSbLJq
 2y2G/r950f+7EEb0Sk8FQDfRZbzval9lsEozVfD+HmJhsjPsowLG2Ts6hYCYggj1F6apuPx05oK
 bGAWMT2i3wIdIs47VBY+0nGf7hM4dTIQ8gTLYTtEEv3Uqup3mp+APnE3UgC20V73mFjgF+a+bd0
 ct/HDow4DEd8WlnxgPELic8aqxm7FxfePM7Mmc0Z9EsXXPs5ntYG4v696CXy794wL5Ab7FxxOSq
 vghzvQB8amoJ5I6nF85Ee23Zss/K18MPB4vI9M4+qLYN2grL4wfzZKk3nCZkI9DsMoWR6CGB/8j /nHigx3AoV+EAnA==
X-Mailer: b4 0.14.3
Message-ID: <20261117-tyr-remap-2mb-v1-0-2a8efd4c8180@google.com>
Subject: [PATCH 0/4] drm/tyr: fix partial 2MB block unmaps on GPUVM remap
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

Tyr configures its ARM64 LPAE page tables with 4KB and 2MB block sizes,
but arm-lpae rejects unmapping part of a 2MB block. As a result, a
partial unmap or overlapping remap that splits a 2MB block in
GpuVmData::sm_step_remap() fails in __arm_lpae_unmap().

This series ports the remap fix and supporting accessors from tyr-dev
onto drm-rust-next, along with a defensive bounds check in pt_unmap():

1. Add the GpuVa::data_ref() accessor.
2. Add the IoPageTable::iova_to_phys() accessor.
3. Expand sub-block unmaps in sm_step_remap() to 2MB boundaries when
   the swept head/tail fragment is physically contiguous, widen the AS
   lock over the expanded range, rebuild the surviving fragments, and
   take the preallocated GPUVAs before mutating page tables.
4. Check the remaining-length subtraction in pt_unmap() against
   underflow.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Sami Tolvanen (4):
      rust: drm/gpuvm: add GpuVa::data_ref accessor
      rust: iommu: pgtable: add iova_to_phys
      drm/tyr: vm: expand sub-block unmaps to 2MB boundaries on remap
      drm/tyr: vm: check the remaining length in pt_unmap()

 drivers/gpu/drm/tyr/mmu.rs               |  13 +++
 drivers/gpu/drm/tyr/mmu/address_space.rs |  29 ++++++
 drivers/gpu/drm/tyr/vm.rs                | 152 ++++++++++++++++++++++++++++---
 rust/kernel/drm/gpuvm/va.rs              |   6 ++
 rust/kernel/iommu/pgtable.rs             |  23 +++++
 5 files changed, 209 insertions(+), 14 deletions(-)
---
base-commit: 8045d0e7d208ad389a387f1407ce0db9070805af
change-id: 20261116-tyr-remap-2mb-7a53b8475cfc

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

