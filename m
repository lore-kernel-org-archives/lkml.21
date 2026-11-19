Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074514;
	b=i2URrA7OScFijF1vEreDcXXPMZbr/yg3INVQmu4nq4tWwvm7eGnclOfuKm0JKNL5FRL7
	 LH/WULq3d6VLM569BUNLuohOvHwB4dUbJVKn/5pMVJuMWLTxI7AyzWdCTvV0fC8sYE8jG
	 RxkMCsNzyNqOzPly4YbY/OYLoAAvBvkoAr0nYqfwYmHtp/u/GBSJ8vddq8r+XBQdm4/ua
	 oSeNAaVuy6tvjgaYW50oMfbIM6z9m6uRVzdKibf52R7E7dzW3ruNm3ZKfUcjyLqLnQH8g
	 edvWR2kSXW2VngzGU2uAc+UL6IM5wT+b+UV8u6cEKsW6T8TdHwXPEdFinU0U9pP5dYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074514;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vmZk9/Vpa3CGsFpach0w6FgXWKmQOWGxhsMKrxJ18rY=;
	b=Zb/wm3kf6pewSYVO1h7/XXqcHg8v+bx0RJmJrjnyOTDCkYFqI/F6hYy2b6OHOj2SDHrM
	 ObKEzzfGHyBswuZlpPQyhGcFnIGWB9DyBK3Y5ekrH0xoGS22eDNfwmtGsZotslEmFPhiF
	 RIrFmu2kJgROGKxVCB+3G1OP3PSUdChY1KF9sVEtqRFURczWss4Q7UP0zZNawCtls31h1
	 m9p7STFagygwbU7E8K+z5y4MPopqPgkSNsMtNRidOZbJTEKh6fNBaLF34k4Xy7FjX+cVt
	 izM6mGDuswc9Zrva8su6cNDyQH6ziuwY7ymSudh9ct0FiAMr+VRl+q9Jiljf1z6LFQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tgIX+mhW;
	arc=none smtp.remote-ip=91.218.175.71
Received: from mta0.migadu.com (out-71.mta0.migadu.com [91.218.175.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74176606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74176606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tgIX+mhW
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qEU0Tk5tuRynFX1J3Q19vVq3w7Tb+EgsrJVKUkkp2HY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795074510; v=1; x=1795679310;
 b=tgIX+mhWqzdh7C8R5xqdoUXUMmq0Qio9AUmRSb4IL9un0VXClm12+sDcI2ae8GDY/JCSC8WT
 WZ4nqgivxCQVZHk+J+0cpns+p3LrVk7RcyYNnBCm3CNryMgOoPGKpwPd8OHHVz33Lr6bR0id4gM
 9g9crN8V62KpUpfsb10BJs18=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7095458d099e9dc5;
	Thu, 19 Nov 2026 07:48:30 +0000
X-Mizu-Trace-ID: 7095458d099e9dc5
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
Subject: [PATCH v2 6/7] KVM: Fix the range of reserved arch-independent request bits
Date: Thu, 19 Nov 2026 07:47:51 +0000
Message-ID: <20261119074752.1027729-7-fuad.tabba@linux.dev>
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

KVM_REQ_DIRTY_RING_SOFT_FULL is bit 3, so the bits reserved for more
architecture-independent requests are 4-7. Fix the comment.

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 include/linux/kvm_host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4b91ef9667703..21207d234618a 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -165,7 +165,7 @@ static inline bool kvm_is_error_gpa(gpa_t gpa)
 #define KVM_REQUEST_NO_ACTION      BIT(10)
 /*
  * Architecture-independent vcpu->requests bit members
- * Bits 3-7 are reserved for more arch-independent bits.
+ * Bits 4-7 are reserved for more arch-independent bits.
  */
 #define KVM_REQ_TLB_FLUSH		(0 | KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_VM_DEAD			(1 | KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
-- 
2.47.3

