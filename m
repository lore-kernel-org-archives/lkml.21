Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015164;
	b=xANZYtWfMVlp7okhqcC1U+KEl7jSOWWqGqbqL13kZa6B9UGjCSOufn35lt8o+tLIqnmg
	 OBwt1lodqal1U37Jf2TZ4B0stmuTucyAbbSLIWwIXySLvI1q9o/DBaOEIE3nh+QyzjQun
	 6myohSJbH7wzPMb+lNaeaSHmx/T+e2juID5/KKsdh4DdMgWl269DD0JuEqUJnaZ6BGrvy
	 ebJLqZHIRd9PYQxMOKN+Gd5dpvp2F9oBQXaG1+Sr2wvxjbLzas+78cS+UBD3mPtrpM6tK
	 XTU/IxyieMJgyxQEQvdXpZTbnvIwH/iz9mOohGz9Bj3Xv0+L/lK0bTjrgFB+ei4H2ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015164;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=koCdIud5bvpKPiL3HIQENure4nj+SWr6XN5dow1D4zc=;
	b=B3kfuI4c2RaVD8eH7qpB1zZU+b5JKy71kTb1/cPmicqPp8xx3U9CJVWN9FPOSG0miavp
	 v7LPfQ2eA7Fchnh+5i+Os7mTavzGX7lFWofWdB3z2Ew5TBobuUJNEmtDlLZ9TwDFVPP51
	 ZdJFtzjrzFgWRaQUjwi9zEmZMgL9rLatk3rzCT/hYdNKXjBvGwGMDKjiLvG5SUugN/1xO
	 AZE+JMPsbh00TtYcX312ICePK9FK2lAYZpoVVrlgrFh0JnjtCBPcyuMfZpAAfMUtTqosg
	 MJTOzuFW7DJgWEt6z08q5Ic/PLft5JnovSwBQ3DXKl5O8PKvZ8bq8NVUDwcYNecf8Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uRUCCjhw;
	arc=none smtp.remote-ip=91.218.175.28
Received: from mta0.migadu.com (out-28.mta0.migadu.com [91.218.175.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4F760A2605
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF4F760A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uRUCCjhw
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Bb7O1wsvqN0w+zVyjmLfDDD+fQI7fDHwilt03qAD9W4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795015160; v=1; x=1795619960;
 b=uRUCCjhwGpctUfiXbk62GkkckYA5hgq6TPTHmQXtQes/s/ys0Vcxe3zPbj820cOC7dySK1WO
 ZJypSIFBLRZLOO1Rbx0UMSGVECEzanCIf/GLYZPcUuVU8qVeyI9r/wPNqknioxB24odHvYSA/HJ
 yQZwqlD5XfLVWeAJkRKkzs00=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9ade009b9b921e73;
	Wed, 18 Nov 2026 15:19:20 +0000
X-Mizu-Trace-ID: 9ade009b9b921e73
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/13] irqchip/gic-v3-its: Page-align ITT allocations in pKVM
Date: Wed, 18 Nov 2026 15:18:55 +0000
Message-ID: <20261118151904.4099560-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118151904.4099560-1-fuad.tabba@linux.dev>
References: <20261118151904.4099560-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bartłomiej Grzesik <bgrzesik@google.com>

In a subsequent patch the host donates the pages of each device's ITT
to the hypervisor. A page the hypervisor already owns can't be donated
again, so the MAPD of a device whose ITT shares a page with another
device's would be rejected.

Round each ITT up to whole pages in protected mode. This costs up to a
page per MSI device, where several 256-byte ITTs would have shared one.
That's tens of pages on a phone and thousands on a server with thousands
of VFs.

Signed-off-by: Bartłomiej Grzesik <bgrzesik@google.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index c952c069f9373..bbfea565149bb 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3493,6 +3493,9 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
 	nr_ites = max(2, nvecs);
 	sz = nr_ites * (FIELD_GET(GITS_TYPER_ITT_ENTRY_SIZE, its->typer) + 1);
 	sz = max(sz, ITS_ITT_ALIGN);
+	/* The hypervisor takes whole pages for each ITT. */
+	if (gic_is_protected_kvm())
+		sz = PAGE_ALIGN(sz);
 
 	itt = itt_alloc_pool(its->numa_node, sz);
 
-- 
2.47.3

