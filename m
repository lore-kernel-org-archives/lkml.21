Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795476409;
	b=eD34f5xDCbsM8MKH1+DyRzF3iu8G2crsmqDaIBpT8zKHxfcTBjszGo2D6EkZ3l7jZm+k
	 Nj5i6whOwtJgxJ3QJSPh2kqXBk+fSLQIAaoENHJ91F63Lbs9WDs9cQUKLmwCYmQQw2aMf
	 r+pJe1xS5Znyh8LtoAoi+rSricpX6UIdiCey0BPqztJwVJLKW/xLydWGFfMBw4XRLvtyk
	 9a9SaakzQdJClf/ExeqCCCF2MkBRWSEv5u5OBAyQVUZAX7IVJeBPQjoorlEt28hD+kgv+
	 XMgcnpIK5GujfwttfnZvTC4kGxHWYSoJcHJolbouhZD+C22xSQMzsR+DodqSnSkpU5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HseEX6n05FD1veyeX/WRfonp9sQvS52+uztmoZnoKtw=;
	b=GD1FVaeZqnAWhQ6ZKggOGvpaWMJmAbbL87MEz2gPYDz4HWgekrBoeWbQPQthEY4GXzGi
	 EhEbqoK0XEpdCt+Yztr9nhWlIkwkj+JF3NaCiIQC25sEID+3waOyI79RXYZyL6Q8MKVuQ
	 g4wZ/H2JEC5OtVqK4K3uVes2d2zkc2djUAIvZoToepcWMZFVUzMn/nAE7q/vnu1Bno0en
	 Q3N64f4mx2TtgT0KLAPbd81QCt8KcmjBEhKJouQLzd0hJhkoaTJmsXRFfGknOgR20vTFF
	 56mhQ6ltG6bKWbKxRdVbPMRS2Mqt3UXiHISwqBNtkJPT7UwarCaExQ/5X1vZz4rXxXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ca3pZyjL;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70030606A322
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70030606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ca3pZyjL
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-47d75bcf3ebso3141123fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795476408; x=1796081208; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HseEX6n05FD1veyeX/WRfonp9sQvS52+uztmoZnoKtw=;
        b=Ca3pZyjL0FOqCWQfm0o8D7LRJ+MD4P5v5fG5rIcPY3SGR5OZ8m+0zYUliN0gROgM6a
         Mrzbb+JUEquiLsCqGa05ey1cGd0U9BvpJuTr1c3Sif4mSglvlam7yv8dWMOkCtiSoTJ8
         dG8yqP4YN6zf45PlO4DasxdR+iGCjBOGi8/aF3xxLqZ8cGIAaQIeuJMAiS5wAnL+rUHk
         SNoFdLnkEJWkN8wv6ox+6/mI9ppPIwD3mFDwofj60+WWxRaRhdqR0ElHwyvkywcCfcgQ
         9a0P6dutcybkm71O28Z5ouHeV8j+e7jSO2Hrtfo7BY4m+6ARF+kHpZKGKl/Kgt09Pdva
         0iIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476408; x=1796081208;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HseEX6n05FD1veyeX/WRfonp9sQvS52+uztmoZnoKtw=;
        b=x0GPGvhVL+NJI/veoze3B30svX+0ozkd+BvdUKqzqdhgC6AmJFlIGF9ZrkX+PY/nww
         ubza6+2OGIXxHP7nXX/0xJsf61+4xwr4nZuYWbjlbHYgfIp1drCE8PifpWy7SSDP78vd
         wPAgpUwa+Eip0yJPvJzlV/O+mf1PH0NfGgsXDHgqjSXhQCe/PbLWj/QAwHmGzCvXxDBR
         V8RI4aCTSXbsf/krSwcrgUWN10rnauJc+VkBF6CI42ee31VtRmf51MeyHOB+3ZX+BT9w
         uKig+HlAhcZO5dQTIIn4+JJMMEAJFtFTmpbzXDekkpTHpAO9mzyMaa2KjclchBNvX4PX
         JSfg==
X-Forwarded-Encrypted: i=1; AL+hErE6Ztqzmn58JMkkk8eFcCZI0Fmqkozo+ebDNzRGHwTzufpfQc4+1XWtwlngQp/6utJVBqGC58XUOIopIEA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2tFgoS4SYIdvBr78NHBvOybQpQoFTkVA0LKTCbx+2JTq5BoVh
	P7CEdpQ87V4UZ1Dhr/1MKW/gIb3TXh10iYrJSOBIbcjdexXec0QOCYfgSTm/ONcJEi5S+bBRYRu
	fDZZdPABAGvCGI8TCiCctl9gYew==
X-Received: from ilbej20-n1.prod.google.com ([2002:a05:6e02:4e14:10b0:53c:d564:3a52])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:c123:b0:4f5:e12:b47c with SMTP id 5614622812f47-57a0be9dc7amr11961032b6e.48.1795476408097;
 Mon, 23 Nov 2026 15:26:48 -0800 (PST)
Date: Mon, 23 Nov 2026 23:26:45 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261123232647.3733149-1-coltonlewis@google.com>
Subject: [PATCH v2 0/2] KVM: arm64: nv: Fix stale and duplicate guest S2
 tracking entries
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Wei-Lin Chang <weilin.chang@arm.com>, Dan Carpenter <dan@pereq.eu>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When an L1 guest issues TLBI IPAS2E1 with a TTL hint smaller than the
actual mapping, KVM clears the entire block from the shadow stage-2
page table while leaving the stale tracking entry in guest_s2_mappings.
Patch 1 drops undersized TTL hints in compute_tlb_inval_range() and
falls through to the unhinted path so the unmap and tracking removal
cover the same range. This follows Marc's suggestion [2] on Dan
Carpenter's sub-page TTL patch [1] (which Patch 1 overlaps with and
subsumes), fixing WARN_ON(size & ~PAGE_MASK) on 16kB/64kB hosts as well.

Patch 2 avoids inserting identical duplicate entries in
kvm_record_guest_s2_mapping().

Tool-generated content:
- Initial bug discovery: automated LLM-assisted audit of the arm64
  nested stage-2 tracking code.
- Patch and text drafting: interactive Gemini session (patches, commit
  messages, and cover letter).

Changes since v1:
- Drop the kvm_remove_guest_s2_mappings() change; discard undersized TTL
  hints in compute_tlb_inval_range() and fall through to the unhinted
  path (Marc Zyngier).
- Split duplicate suppression in kvm_record_guest_s2_mapping() into a
  separate patch, call kfree() under guard(spinlock), and drop the Fixes
  tag (Wei-Lin Chang).
- Rewrite the commit messages and cover letter.

Link to v1: https://lore.kernel.org/r/20261119185105.626343-1-coltonlewis@google.com
[1] https://lore.kernel.org/r/20261123-inval_range-v1-1-815e15797089@pereq.eu
[2] https://lore.kernel.org/r/86h5h7zn5a.wl-maz@kernel.org

Colton Lewis (2):
  KVM: arm64: nv: Discard undersized TTL hints in
    compute_tlb_inval_range()
  KVM: arm64: nv: Avoid duplicate guest stage-2 mapping entries

 arch/arm64/kvm/nested.c | 105 ++++++++++++++++++++++++++++++++--------
 1 file changed, 84 insertions(+), 21 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.56.1.839.g22a8290db9-goog

