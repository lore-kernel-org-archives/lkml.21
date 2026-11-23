Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460460;
	b=BRCqJhEIyVMN+z6CHqsgvaJODubDYP0Ju0y8T9hszyw4IHNiU5kKua9O8cC0IeZhNAZx
	 wnIJOCo+m/646Zv74ItJdBFMyNzQCxIvE0JQZ0Myoe6UDudqUOQS+segAzdrYBb16sUus
	 VhtpRhHwgVU4zFUGl6ORklsr0u8soDaHfpxhRivqFsToWwLUk4xblSLa22ywX2bvEma+D
	 p0xvBtkDIiIRaABR4LW9hyq4jVb19EXaUI5q/4N01TXAJj+KBR4+mq6xFeJ83K1KifyGV
	 g5EKTIq0zGyYwLP7+iRuASPYFIEQ8iGpT7dLn1qxJnqaAffD5XQrloEnHUn79+uyGcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460460;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=l4CNQ2xoCIzIiOKM0YDrq2t5ezZfH9cmVn2diC4Zwwo=;
	b=bhzpWjMeAeS1HlpZ7mLNvg6IDZYYGvrB7qlRvBDrGUG1whWvGOLpa3hP2SqRLmvPc64T
	 oiHLC5Yabdtqnof1bZPHX0CZnyfdAqp7+Wa5lTvLC6XGQwsiXfIOZG4QgC1ukMAs7M+Yq
	 u0xbNGzpcsfP1bwnO2i2YUy7L8AQVo2sj9AUpkgqPT+4LRKUGEw1PaDg3dbJXC/55ddsk
	 mnRkP6tKAlWWnRoQEkbZ/lQDZwitRqC9REdRKEh06M57D2ViOUqHRMhod7q9tVJaqw602
	 L838WQjR32+gCJIzx36X/jCsHHtFna9mrYaI8RKimvwE24zbSx8X42njFBGNODT2Orw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bnN3kAek;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24A7606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B24A7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bnN3kAek
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ea2c058e67so4099536b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795460458; x=1796065258; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l4CNQ2xoCIzIiOKM0YDrq2t5ezZfH9cmVn2diC4Zwwo=;
        b=bnN3kAekdygRkf4aioGdSq8An4GHgXCCm1kXSoVZ/CUF1NIBzabNfrDkSVhJJjMcFn
         vuERHPE5Nz6gDKNGNwLcwiCNUNlLlL3QE3vmVR9SdAWSVLbI7QQbCC0u0tGD5lSzUEzq
         7U0PA4ipzIMVzqhJshQmPCgVzTV3NJp5l5wrQmWgxqU57C5wGltMjGSjgVO+CjuU7BWG
         KfqzN6KkSGC6qdaNg47vfeHw/9pfu6zriNkVvGiBdB8fQkErrp728KicbvQPhyBxq2EI
         nq+Re/o5PQqETyhnsGakKkUl8rQGZpjk3ANbnyMI3n9fN0vq98BBNBeHo6Bnmeba43As
         6AXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460458; x=1796065258;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4CNQ2xoCIzIiOKM0YDrq2t5ezZfH9cmVn2diC4Zwwo=;
        b=TxmLJCauNDe7SGDL1nlHo7js5JLC8gsnlLp0aRphXE7X0sU4RihkLIB0Qvf0bhxH27
         JpSTrjLreyjJGtPq1rlr4w4WnR3HP3tcdE42HZFMyUyuAny1NLewlniUS1gxJVv0NNJM
         jkL4HIVksTTACvFg9mH+SaJh/kApMWHNUIo27H9pDDUpy9h4uzEg9Jm1lSsnW1ltudpn
         tCQh/zHhQeW9oS5undNwUW8lGA3zGf9SHxFeTPElIlo4y0Ni3ufkXDdoci2ra58FYQ0X
         G7x3Hf2700zgrTQGVZHrphxoGpXpJJqg5GlaWj/RjxAF3nsheADbWc+UVgwrzkDHXigM
         0gPA==
X-Forwarded-Encrypted: i=1; AL+hErF8IRnWwEcQR4ZyJGPhTNLNxguigYOcVq+3df1QurWByaekfZZosHvuJ5zjYK86Ttg1rRwZxOwYyHA1aic=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gIr/SSSrJkdNKfARaz1ErAdCrnyQsTflkvumEwoxec0vpZ0Jn
	stedjTbeOJy2CMMEy6MeN5b4fO5gO83cWqNRHCNYhVFvWT7AV32Ir2jbe2OTsj3FDXBdlF21V7D
	W1MM6TA6NYYGC7g==
X-Received: from ilbcb19.prod.google.com ([2002:a05:6e02:3193:b0:54f:8d15:4dbc])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3084:b0:55c:844:98ff with SMTP id 5614622812f47-57a0a93940fmr14754171b6e.34.1795460458168;
 Mon, 23 Nov 2026 11:00:58 -0800 (PST)
Date: Mon, 23 Nov 2026 19:00:42 +0000
In-Reply-To: <20261118223704.3286085-4-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118223704.3286085-4-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123190045.2166865-1-dmatlack@google.com>
Subject: [PATCH] fixup! PCI: liveupdate: Track incoming preserved PCI devices
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alex Williamson <alex.williamson@nvidia.com>, 
	Alex Williamson <alex@shazbot.org>, Alexander Graf <graf@amazon.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Chris Down <chris@chrisdown.name>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

pci_flb_finish() logged args->data, but LUO does not pass args->data to
the FLB .finish() callback, so it always logged 0x0. Log the physical
address of the incoming struct pci_ser instead.

Reported by Sashiko.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 drivers/pci/liveupdate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
index 493576119a76..520c7530475c 100644
--- a/drivers/pci/liveupdate.c
+++ b/drivers/pci/liveupdate.c
@@ -409,7 +409,8 @@ static void pci_flb_finish(struct liveupdate_flb_op_args *args)
 {
 	struct pci_flb_incoming *incoming = args->obj;
 
-	pr_debug("Finished struct pci_ser (0x%llx)\n", args->data);
+	pr_debug("Finished struct pci_ser (0x%llx)\n",
+		 (u64)virt_to_phys(incoming->ser));
 	pci_check_all_devices_released(incoming->ser, &incoming->block_set);
 
 	xa_destroy(&incoming->xa);

base-commit: fd54e32f7903199e8acb2762dd2debfffe4501c4
-- 
2.56.1.809.ga0b61035b5-goog

