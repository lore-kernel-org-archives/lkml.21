Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074495;
	b=G6LZUZ2gA/T5rRiJtd9tMxT5XH4/6l5/+FnvgWcsOYEQXR9QroCSrsE2PSnikx7p+LyP
	 Oqv0u5CybZj6hNsNk01Phk5XMboRyhNIzaZQjwsIJtWcVUkJNFsX7LzzMqbkfmxr13tvk
	 KEtn6hTYa5dkw6rfiy+wt3626TXP3gsdJtTRbWuZdoeMEsVXITuw5IMTeb54KVbuU0NnQ
	 FpqFh8wE+lOob+T9tgEXID7RkoSD6Lw8Flt4FRde8ya8n6K+N2Dtq30ERNAivgqsCi8Cv
	 x4kIbnAMfkbs/rxx3zSHlpHA3q5U50MugtnW3eePywjBY1RUwXywWYwFtM577dw40ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074495;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O180qNhw5W78dmrLDEsmkRqedQNPx135gQrEePWhYBE=;
	b=gJGoAKB6F8i5He0qqdC94QD21ljM5DmSjSgbqzYHg9k6qJtrRPkrtWKk41s1huK5Wa4K
	 QaierBvGhOwn9y6HQ4W+0nITy/PGb06kCtC8aJlMALqN2STeDVJF673VewIWgzrbojZQz
	 oQc9GVA/AAzr1Yupydm2DY4cDFuBOM/aKTzOlnSjaPa5vhIX5isN4klYI6i8PZhti3tF0
	 5FOJ+JKi2Esk8WlEqdNxGnsbGPYIrMFynoweGIJP/gUAtKTfNwabharaNfJ1VFGT9/jAE
	 Ec3bA8d+jPE9Mg4/BFL4M1BQzWsgGIPIN9HHcXLlllE9GPVY2tUx+7eRBkOxeqWDzxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ltMLbvsr;
	arc=none smtp.remote-ip=95.215.58.218
Received: from mta1.migadu.com (out-218.mta1.migadu.com [95.215.58.218])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50DD60A2602
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D50DD60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ltMLbvsr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=okV4O0NXWrhvYKNtQ6ZWyQBBxWCja3OGyrgrmrYhKEQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795074491; v=1; x=1795679291;
 b=ltMLbvsrlPP+xqHHxkEsRwTwxhK+OkujBeUJNi8g8C5pgLFX/MV+coVPuMgHWd0wXvm8uN2a
 7XIsU3R4beH3SpVL/VPqksYTNCldQpVAQE88VyoAse+i6kkOXvjcUbEAP49IWGrIc5MgR11Paht
 DYdoYRqytFqZl/Isy0TfJd6g=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a77521ad71c27b16;
	Thu, 19 Nov 2026 07:48:11 +0000
X-Mizu-Trace-ID: a77521ad71c27b16
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-mips@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 4/7] Documentation: KVM: Drop the stale number of vCPU request flags
Date: Thu, 19 Nov 2026 07:47:49 +0000
Message-ID: <20261119074752.1027729-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119074752.1027729-1-fuad.tabba@linux.dev>
References: <20261119074752.1027729-1-fuad.tabba@linux.dev>
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

vcpu-requests.rst states that only two request flags are defined, but
KVM_REQUEST_NO_ACTION is a third. Drop the number.

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/vcpu-requests.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/virt/kvm/vcpu-requests.rst b/Documentation/virt/kvm/vcpu-requests.rst
index 06718b9bc9597..eedf338d47d6a 100644
--- a/Documentation/virt/kvm/vcpu-requests.rst
+++ b/Documentation/virt/kvm/vcpu-requests.rst
@@ -141,8 +141,7 @@ KVM_REQUEST_MASK
 
 VCPU requests should be masked by KVM_REQUEST_MASK before using them with
 bitops.  This is because only the lower 8 bits are used to represent the
-request's number.  The upper bits are used as flags.  Currently only two
-flags are defined.
+request's number.  The upper bits are used as flags.
 
 VCPU Request Flags
 ------------------
-- 
2.47.3

