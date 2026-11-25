Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645162;
	b=3HNPPeKy9fqO2/srkFYmIeqEi/+BMAPQPmhLVIH/m99joT3QSQQPw/P1CJS/rQGeBiN2
	 Chal4UBFY4rT5mwU53qRe/6kN6FWi+cGvtRwj0oGSKA7NzPrLYTvVawtULBdshcJOIj7k
	 1+vQqfQ2tZpsEFwuy5Xhbv1JPjCThPGH1vQeXvNZenMHQncIZn98mkA91szWmTytmnAxo
	 3g1WQXEHOS/ERmdLDi8zyOJJNiBy0trrB3eb/SmwQgC6msqZH3WHYOmU1jOutMq8o1TCk
	 d3RamK87Qvkxuyb+DwgGDtJR71DrqY5xUyKb6RZii268eYtsveUUaUQUtHPX9TJnPxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645162;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/mM0J1a71Wn6f8VLov8bY8YKxe1QvMRR/3m9TE5bYfk=;
	b=CCeHeWOoWxp2jdj6E0GoPQurZFOXhQ7MHANC/CDsPSiOr48H8AizZCLcWxTako8tyYHj
	 VMzF1srtnQLJBJqFEf2CdhUnI683AF/7aM3D9sKLam4kMuj4csZXxLtc7K1MFEL4OIJUd
	 +ZOMCl7ouY/88sMynfp3zffbskRRv2mfePgmtAUzCgcc8v9YAWsU9OCk2cFjkLEupy+z4
	 /7y9dnFejvGyamvO9Zo7bLNRbmHt0vPO/ZmwcaJuI/+hJjf8tG0/50NOnLT2jOoia3Y97
	 w/I9Ofy3FMJELh2vvfvY77sIRyUJzwOJJrkgWhhLqDfSVraNblfcszsoJvnWjf8V9bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XptYq2ly;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96020606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96020606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XptYq2ly
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386a65fca25so5298882eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645162; x=1796249962; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/mM0J1a71Wn6f8VLov8bY8YKxe1QvMRR/3m9TE5bYfk=;
        b=XptYq2lyzTSfPHoG/56IlJIRAvm81y295rD9W2H96Omtasl9GpUA/jNFxqPQJ0aOC6
         6VAmQm9ZYh6//vPqJZ9SMdhrWgvFkWN456hvl8Qbd06efT0Hl263sPmapGYUZCl0m4/Y
         4p/y0P5mZkE2IYyHjj+Ie/0lnyOI9AuSaS9P7NmzYqIFcBqhrt3SaeARsRu60aPCDa82
         jZ8txShqP2aYVcYIOttaPOWbDLx5R+HhoifOtkWivTKvhv3VH4zIPt2DgSeCvyTmWQcc
         fKcmTfDuu2+BPXMkZcYL8nsgXazp2O+HurKTzBy9ZHkQJMPbU6Nm6WjSQCCmtzXVp6co
         HnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645162; x=1796249962;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mM0J1a71Wn6f8VLov8bY8YKxe1QvMRR/3m9TE5bYfk=;
        b=LaLX4ASp68eoS1CUe4FfI5sm1017vjXQ2mhJSFEhFdZEi5BuuR77/+WIJe18dcE/1L
         RZSLLGo8ZMHE8nk2qlu8FmJ8fygmPIPdJDgYPgSJrNLfVBD0ddfZSImFTXY2Yc19sVL5
         qjxlPeEbhsy7LdPku4FUWk8A3c0fnqrk3urko0sQSoLnHk5KYVnY4gLarXyg7ZK1CqW3
         dJ6cnQlrGpp5EDjS1rzGcH4SoiA8XdDMmAUMK0cwLeFsEOz0HQ0sosiwS6qKrXXiMDae
         /Qg+WI0W1Nhypz4QdPbfsK+0dXnvh30lYh+lgR43rAeqyMpF5XyhBNxX8xZC3a1uFKXF
         P+TA==
X-Forwarded-Encrypted: i=1; AL+hErHE9Fz8w5Wnin5ediuZvKEkiXW04x18JduBPdoQTFRNAbpKKI4OBVcVM8HaKmi53iA1nI67SnAwpm9PnoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/J5HzFwTiWG1XO2nLlLzJ7AiEkPiTFD5FagDh42woRd7luA8pD
	FSPZDSx2EZ1NIzJLZfgg9gD6WlVFcm9QDXDyDvcDDQw78eG/1PktblisfbxLqtc6FKhE5NgP+hm
	pFA==
X-Received: from dycmb5-n2.prod.google.com ([2002:a05:693c:20c5:20b0:369:fc78:c914])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8955:10b0:386:9cae:abef
 with SMTP id 5a478bee46e88-386bf39f8b9mr6889141eec.36.1795645161387; Wed, 25
 Nov 2026 14:19:21 -0800 (PST)
Date: Wed, 25 Nov 2026 22:19:11 +0000
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
Message-ID: <20261125221911.1425213-1-elkin@google.com>
Subject: [PATCH] mm/huge_memory: check VMA end bounds in insert_pmd() and insert_pud()
From: Elkin Cruz <elkin@google.com>
To: David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

insert_pmd() and insert_pud() only check that addr lies within
[vma->vm_start, vma->vm_end) without verifying that the full PMD or PUD
mapping fits below vma->vm_end. On a VMA whose end is not PMD- or
PUD-aligned, inserting a huge mapping at the tail straddles past
vma->vm_end.

Require vma->vm_end - addr >= HPAGE_PMD_SIZE in insert_pmd() and
vma->vm_end - addr >= HPAGE_PUD_SIZE in insert_pud().

Fixes: 5cad465d7fa6 ("mm: add vmf_insert_pfn_pmd()")
Fixes: a00cc7d9dd93 ("mm, x86: add support for PUD-sized transparent hugepages")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 mm/huge_memory.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index e167c9ea4609..683f0c68d6b2 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1630,7 +1630,8 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 	spinlock_t *ptl;
 	pmd_t entry;
 
-	if (addr < vma->vm_start || addr >= vma->vm_end)
+	if (addr < vma->vm_start || addr >= vma->vm_end ||
+	    vma->vm_end - addr < HPAGE_PMD_SIZE)
 		return VM_FAULT_SIGBUS;
 
 	if (arch_needs_pgtable_deposit()) {
@@ -1771,7 +1772,8 @@ static vm_fault_t insert_pud(struct vm_area_struct *vma, unsigned long addr,
 	spinlock_t *ptl;
 	pud_t entry;
 
-	if (addr < vma->vm_start || addr >= vma->vm_end)
+	if (addr < vma->vm_start || addr >= vma->vm_end ||
+	    vma->vm_end - addr < HPAGE_PUD_SIZE)
 		return VM_FAULT_SIGBUS;
 
 	ptl = pud_lock(mm, pud);
-- 
2.56.1.839.g22a8290db9-goog

