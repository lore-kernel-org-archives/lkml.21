Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649516;
	b=HHNXgpBGdIlKWhXVNxO7Nw1hxba13/ryVzKSjlYXb0LD5YzperO2s04UUWB8SP4OalEl
	 9KiFofmrpof2CGgkk816/kdb3k7FTCSd28b3n28Y662mqk65w/9W7dVUMzyQmAiM3aZzx
	 oIYjohN9QzmCHcWIzowxQHec/xeva3nfHlpXPNvN/ClRPFHcNgihF2llaUhLDdx6VcFSz
	 o6aVez5k9yA/fZWUOrsI/Fsh43J+UYvMzLe6ugopHpaC1O4jttrbtoMU7UIYXrYAd2j9B
	 U5ZXVcbZ2Wz2WBSvUIf2P+q6N6P1Bzcj2oXCuBdi6hUqMkyg7SI/ZebkyfKFEjilLmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Np0anZjG5hAkQgXnIrOs9QHgsmNIFocrZSI/L4oANeE=;
	b=H1HhQPEl3GLTIvchH66URi+8dOMOpp05cadTpU0NkiPYqvqRZyqzeIPY1sh9qLQfHMDX
	 /78wyS/iruAsd7cZvXl/WP7FUpsu7rwrIhFeo/fHiN+24APFGV/U5QgDnEmDyRcTCJe0O
	 tSn9/2mU7ID3Ow6sN1OvpcEB+LPMk2Xpwz6rAxanOXPqx7i7vMf5tXurxtIzNtYO5bCS1
	 A20LCZmfhOssRrEY6cYOQfjQ6zbFv06Z3b4D3rjW8Dbe/yp9ajCwxzHy8OB9X8Lh0dRXL
	 9aN1BXIGUUpzCT41yXMjfHH6Ot40qA1PLQuzreF5y80b/WH4P0LvTzacnYDPXqEa4zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m9EoKzUD;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC85606A687
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AC85606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m9EoKzUD
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso60765635e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795649514; x=1796254314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Np0anZjG5hAkQgXnIrOs9QHgsmNIFocrZSI/L4oANeE=;
        b=m9EoKzUD0AT1AG5pR0Kw2NKad7wac0+MOmFSd5HkOQki1m5QN0bRx/fwlrIvnsO+Z6
         KAiQpy3t5coxmb+PexU7c1c33hSEuRauizLZTryU6IQFW1MqeBShoGN9oWfCbn93Sb1w
         sgAiF4aYc+NwVM7oG+MUeW3vH5qauSIVp//nEqK9JGkNW2HkMNd+6hYe6qm9lwy1JHzl
         xRJlJyR5bIcNNm9R7yd7WF4OxMx+DFw+3shRkawlpAHyJTbv74c4LGTua15nHkSEVjP+
         gSp76LZ9nUzDxVJRSuAZEMhSEj4lSFKgja1Rh/Pn6KMtTMWUxzmc5xdrZyf0JqTG7nx+
         /65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795649514; x=1796254314;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Np0anZjG5hAkQgXnIrOs9QHgsmNIFocrZSI/L4oANeE=;
        b=jWupGoBng6PgZVkzMYWI0fxBeKf9hK5I3AFpyjASMcgTE2kdMFo00tGlPMVmJpv0aC
         IUTbnkNmwkwsdp9vMhsVsvMotK6ec3nc6rYN70TErZKdcO8mO9nQS1YsZ0VrC1mW4/gV
         Mu7Q2WyXwecKfROB8HX6gMLWwjVLd2/T+Ew4VBg+vLneqyOZ4KHJKpcFDFrA/bdv9C3P
         4g1DJFS4ZcR1Bfouf3tZdG0fADIeeE8fSghgYYE/k6JMdnGHwCzeVeg3JVa1TOJMNXdd
         +S8+/wLqg3PXiqE9PoM8h3VyLpE3CrUwoOrwlNsaH66kRk3V1F48L7OHea6dht0aOCJO
         r3aQ==
X-Forwarded-Encrypted: i=1; AL+hErGOACOLDPVuZZI+4XCMSrpW2tX/TNpc/iOWINvuNHl7TEUMGowCvy+GwZa3gTv6fFcW5BFSGLPkxkTZoms=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZddiVoK4aJx3MYOc386Gl4fAX52vNB2aNxKAUT7gzqWCVJHb8
	+nbu+gE70suAQ2cJyFDXzVIjew3hClU9wheRcKvjeihRa5ixjEp8kmP2
X-Gm-Gg: AZFdTZdIuR4nyH3B96P7r9WY38JQnj6Yihr6DeZr339JZvxd0vy5RQUjLvlpTltAgEZ
	/bnkzr4BlnAs7H+gF5oVIlZu3RUWCr84MC3G6PIauJ3gEIQZw3OHX1KZZT8jaNEZx+Mx+vujHjC
	8Sp+zO7kwt4jwSp1j70RvbIhH2Ecpj0KdZ37Oi8VASFX/P1fJ6BA/2qK/FFW85JFlUtctWewDpK
	63CbTneguYD8lf8jq++OrrYmEkVTqeOH+HcmpKfNGwludH70xNwwsaQuQKoa/OyeU6iB2MhphfM
	WLLxk5idw0Iwl10F+0wUJ/kmO8O6SQO9IYBH/QzJC5A6JuCw3uBdjwyrZsDxl9sYUH9PviwpL4W
	PsFWYC2DBBLgxgGcsXZCefM6T55gNU4mTzopaDuJ9rs/Q0QF1ID836oYthy/AUK0dBnFj3OKEx1
	x+snZzsJ4kmME8ZCbSF7CNQMfL/CML4yndYEN/DcbMLkJil8KjZnm/As+F+qW+g8WLIBThLJEvj
	6g8WU9Lh+7mB82PdZn1BwFcwaBEANHYrbBSSkpVVtNua5/bv9FvzJL3mV9SSfOO5ycexYUcrIoW
	CUYL8gjz6Q+51owYYfH0psA3tVSIBL3gQ90wtBXKcU2VX1G5QHnZkcxPWE766eFlGHKp/k5Bqrs
	A48TLP9sQfQ==
X-Received: by 2002:a05:600c:3b88:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4bb8880789dmr443306225e9.13.1795649514424;
        Wed, 25 Nov 2026 15:31:54 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm38324142f8f.11.2026.11.25.15.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:31:54 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH RFC 15/19] riscv: Align init data to the ESP32-P4 PMP granularity
Date: Wed, 25 Nov 2026 23:30:16 +0000
Message-ID: <20261125233020.1380594-16-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125233020.1380594-1-vitorhg20080@gmail.com>
References: <20261125233020.1380594-1-vitorhg20080@gmail.com>
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

ESP32-P4 has a PMP granularity of 128 bytes. The RISC-V linker
script can place __init_data_begin at a smaller alignment, so a boot
stage using that symbol to separate executable code from writable
data cannot always encode the boundary exactly.

Align __init_data_begin to 128 bytes on ESP32-P4 so PMP can apply
distinct permissions to the two regions.

Verified the alignment in an RV32 NOMMU kernel that booted to the
UART shell on a Waveshare ESP32-P4-Module-DEV-KIT.

AI assisted with preparing the patch and validating the
linker layout.

Link: https://github.com/espressif/esp-idf/blob/master/components/soc/esp32p4/include/soc/soc_caps.h#L191
Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
 arch/riscv/kernel/vmlinux.lds.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 1f4f8496941a..e4498a9fdc6c 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -77,6 +77,10 @@ SECTIONS
 #ifdef CONFIG_EFI
 	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
 	__pecoff_text_end = .;
+#endif
+#ifdef CONFIG_RISCV_ESP32P4_CLIC
+	/* Keep init data outside the last executable PMP granule. */
+	. = ALIGN(SZ_128);
 #endif
 	/* Start of init data section */
 	__init_data_begin = .;
-- 
2.56.1

