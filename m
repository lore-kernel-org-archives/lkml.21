Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475188;
	b=Md5cDY5CK+aikhkPcwNk7ME1+1IvnvmCVLvz5W7K0Fnz7Qq752hLtf/HfRUNoy6Z6cBj
	 G1vcI9+cF+Lc1kIEnGMaLE+5isfzpswBKfXJo6jhO8x4jhEDaVyVr7TsauyM0k14PDnFl
	 JkQ920eZrXNbrZ+Fz8EdFpo28CYIc/nLvvXChV+AF8Q1nyxw4EEaI04+bOMbkMXfJ1Xxl
	 DiMUJH2Kn0WxJSHg941X/fOi+PGKs9U4Vmxq9qEMxsfL82OnCLe4gkAxmhyMRI/pn9BaH
	 yFejj/vIDrS/d7ig8fvpzzVe26aTxVBASU5pgtFkKlNhlbhvmXQSPqeYQ5rLGQjj5gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=umX51t+2vvQvnn/vRHnudssMt2lYCcNqFYn0hYVrUj4=;
	b=K4vwcutU5AfOHXpq2uP4AwY3fhHCXcD6crP2V52Bjqs09wPUyWp90ujTbx0U8O5iNjP0
	 2Yhy4zLn3cYkEPgo5KwgPTUH5FdP2iETwt9i3wBFP+RR5lTnrajxi/PJPlY13s5YRiIIT
	 lueP4MOjbj/EBwcA8De1KtO8W92rNXEBVtI/0SO/IlbudOEbcI1mSgpbFq+9APIKpj5ad
	 pvDawc0zym98mZWtzEnfPAOL33clIz5ClXAT66L9kc2ZR5vrFjApW/Kf4AFSZLrxOnx+j
	 u6cF801Hmux0jvTy0KHqUklo68C/6QJ8zLkUxqTVB79K6eBIPkdzt1LVpU684v4rZvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bYw304wu;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67112606A322
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67112606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bYw304wu
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c15956ce07so4086789e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795475186; x=1796079986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umX51t+2vvQvnn/vRHnudssMt2lYCcNqFYn0hYVrUj4=;
        b=bYw304wuhUM0vfU89L5+9XOkJTd1KluYpeAmqtBffGvNeA9Y87s/cNLAix8nApaLmo
         9HCdf/V3Bh3wiwrMD1jQLhGkSiRzW09vtc3uomJVEyo4IISJZzk2LEQ9zw9sgbjaQ/vW
         v4p3GLRYRHBtiJZlKm/4svrZuZ5VVyjhYnQ7qLnY788PvPyjTe22cg/MC8SV92MNDX0Z
         QVJsLTMjfUN/P0ymMxLBcMyhWO9VjISqlMn1+GVsm7onBqaVj1R3gj9xOsZKkb0qr+9S
         YPSDiwTugGzP1n7TR6E8rGb6zOnLn4dbPV94LAFdbwv1+K8xUBl7U2hPxgigSwvxxqKo
         rZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475186; x=1796079986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=umX51t+2vvQvnn/vRHnudssMt2lYCcNqFYn0hYVrUj4=;
        b=Gd1TX96Gr3dOKzAKCKEoTKyelAAGyN3lFQlJA7s0S6zhQkP7pyRQtvy43AiW9f3E9o
         zoHub2fUdUl3kKTxSwakGIfKRUQqnEgx2kSPHnfJwga+c1iokHeznWY8pgdypLsnvKDY
         z1EFEkVRzyWv/KV+pD/uzPCMCSnwTZyXJMoJkv2KsEGNXxKdZf+zXMHjhpOUlh2IYE/g
         nhTm8085oB4cXh4F48Hysvj66QG5tcl7T+e+KledvJoi0wOJU1V1JgMM32nRVSMCDkRA
         /KxyI3clmgw7d5n3CAI3Q5Fz36vaoX3J/BZO6Xo8/SDRSBd875eGOelb1pu/E0P8y97c
         RY7Q==
X-Forwarded-Encrypted: i=1; AL+hErFmrRvBqRNDftfer6AUuTcZb2zsUZOaa4ICQiTRWUWOCLdsUj1RKEU8ibgpf2TqCNsK0dj52uN42+vZbxY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cvhz1z0rYp5GltX36xJXIUS3M3lYCAR75Trmi4LRMXocJfU1S
	R0DtDYaOq+bdfsxNGl+2C/fm34h9gUSweiy7qzASmhYJDvBMaKXQ/1p8
X-Gm-Gg: AZFdTZfziOnUzfg+MFvCa770VA3u3mDam+R8Cohn9Uc2OuNXiz+mSpxus+cN/54Wapl
	VX5TVrOLF41TRicArIN232aJrpo8Ns2nyAp4QcLwtUWtvNMEHPc6ZSHcntUEvCDNzj3u7L803qj
	Kx3cfGyveRMuMJlxvnco2IJW4Wcmvhpfk4oyOQ0pQKSkQC5z+GZhNkMFpA5tRRn82JqKc9KuVrp
	xZPGJM/LqD06I+VpNdZibOpXSV3P+s4UPlBfZb8ws1bsqo/yZeBjXYF/TqTJgtdxKrA+H0IRn32
	0bhAGLURh2HE9jzWkI0FKUQCYC1Al9F+HY2kAjJxKKpFBtolTYIntl62BmjfJhDWgU6VMU5jJ0z
	ZJist0UI7TqiF5FrxAqMcEFIrOtfNVzXTCYTPN9142Z9fBnSmlKUTmw2BCLl6oXzryBe/QbCYwz
	gsRfDG/yvNEV9f7roJJltYFP4LfwNdsx7rPCjVJi/wE8agqYY3KFCHgEjpf55K93JKPFGX3hwSc
	W0dqs/ScuK4axl41B2t5x+6dzBP5idHfJIFMFXL8N44kCdfxzdyLnEfBvr2nbtCq7M/UP5MMJVM
	8rQgTXXCwLKhu36ACQaNnjt0jxcudAsiEA==
X-Received: by 2002:a05:6512:a96:b0:5bf:fc1b:561 with SMTP id 2adb3069b0e04-5c1b74acaf4mr3644137e87.0.1795475186305;
        Mon, 23 Nov 2026 15:06:26 -0800 (PST)
Received: from Swift-SFG16-72 ([141.105.129.181])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8055106asm36984711fa.32.2026.11.23.15.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:06:24 -0800 (PST)
From: Ivan Borovyk <saref012@gmail.com>
To: dakr@kernel.org,
	ojeda@kernel.org
Cc: abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivan Borovyk <saref012@gmail.com>
Subject: [PATCH v2] samples: rust_dma: add missing newline in dev_info! call
Date: Tue, 24 Nov 2026 01:06:17 +0200
Message-ID: <20261123230618.375172-1-saref012@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123010430.365536-1-saref012@gmail.com>
References: <20261123010430.365536-1-saref012@gmail.com>
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

The dev_info! call in PinnedDrop::drop() lacks a trailing newline in its
format string, unlike the other dev_info!() calls in the file. End the
format string with '\n' for consistency with the dev_*!() and pr_*!()
macro conventions.

Fixes: 5444799d701c ("samples: rust: dma: add sample code for SGTable")
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Ivan Borovyk <saref012@gmail.com>
---
 Changes in v2:
- Correct the commit message: the modified call is in PinnedDrop::drop(),
  not in probe()
- Reword the rationale: consistency with the pr_*!()/dev_*!() macro
  conventions rather than log concatenation
- Add Fixes: tag

 samples/rust/rust_dma.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index ffb693544673..b4b161896517 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -129,7 +129,7 @@ fn drop(self: Pin<&mut Self>) {
         for (i, entry) in self.sgt.iter().enumerate() {
             dev_info!(
                 self.pdev,
-                "Entry[{}]: DMA address: {:#x}",
+                "Entry[{}]: DMA address: {:#x}\n",
                 i,
                 entry.dma_address(),
             );
-- 
2.53.0

