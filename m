Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162830;
	b=L5Vs7AZGXYOQvGarns0JnjShLwyZ+ytX4SaoDIO5B3ao/0qGE6/xT36s2SoeyeReP4wH
	 EX7daoBUgvufrYvKpk6SDsmp3FGx0kS79cPSJskAZLJFkHN30eHbSzDU94sjo4XQTfrkg
	 QK9jvqKUjacQaqni0HW8F6GHOmT9nVBOoxBCiJw0x4GdjDw3qGDNvcTz019cZNH30TkQV
	 iiliMQa6/eZrHyTTOtgPqFPIzTj32HzK41bIVV65TOcYf+iiHuU8Ew2OxOYF8gO6fhnBG
	 wFkPin5mlx3eeKDczqy9Z2iuZBETV+AkpoXH/9gqlJhBaBw8BnBm4IMC5gmaTogNm2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jQvpyKaLfdZKOFmMbpsSFbP7raLwzSlOfDUVM2Aqbec=;
	b=5SUWt1SUVNYeZdm2lbb6gZbVaFqwxIXDDHon7r+JOMR1bQmHvLHe3EBh4BNPGZTNe9uQ
	 3siF+b15I4swNR6/kt1VkWS04tk5oAb3PaL0mPCp6kxv4PTKqaP9YQZlFdDzd8ufhvcfO
	 Gl0IVaj4dd8F9WkQrfNBNt2//6zgui8TO1eXyNc/m36nRNFfTivSdXnjNoxgxfeo1uXBX
	 fy0xYria3nSOXIPHzxPFx3WzliyYz7XCnX2LuC5KCLEHfMZ1Mhrx+SkD2uSjZShm8rMz9
	 YgcIAfvRr1YaVCkPdxJ/5HdtYkczpd1aUo/a9t8GrfeL5p2lL/ZKSVZ++WQusDowt8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fc5AM36G;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BDD60A2609
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:20:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0BDD60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fc5AM36G
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso363490e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162828; x=1795767628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jQvpyKaLfdZKOFmMbpsSFbP7raLwzSlOfDUVM2Aqbec=;
        b=fc5AM36GdktGMDpoqt5SSgfE5z2ejcEw0do7btOxbCGr9edQU+oAdfSBVJ0shBsOZn
         Y+tjijkasKiGMOjAABMHTdUBOMTv4jSizprmMg/cswB85i6sXT/SqUVT7e7NDPLfc0O3
         ak9zxhgOjl9VBO13/yt3Mb3Gf9Of94k6v8XenNO+gkHrt9M4EcIPzSJTc+95EB1MQ85S
         MueMUhy0sunRIo6gXwfk6TybGdaAUgxanN0PSCqioSaDlow8vsXepsZKLDiAllVCOkQ0
         QvSIu59sKN1/ZIoTxfyERrqzPflJHqpbXb9f+RwsXFdNaZh1+XA/YQPp84HP8yiwK2xS
         TZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162828; x=1795767628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQvpyKaLfdZKOFmMbpsSFbP7raLwzSlOfDUVM2Aqbec=;
        b=hleNgrTZpgmdA62ugw7TGRY58NwAVKsmhNd0IodE/26F+XSzrnC5wHcn3ZjDmAdq4y
         9B+gCfvfRU3ghsTBo5Ug2fwxQOyajm9neFomqBXPWmV3cPhn+R7Tu3mNHlPgBayUBbZy
         Fwdh3dC/E1upuCviLo/R2TIzIFwiEUysbwWMZm9k+Glbn1776xQuEu7SIBjEB+kCxor0
         u3sVYZiA0I9K/0jIkg/UkbWpxB3mJGHmNmdh0AyxzMu3O5f0wP2UpKgDK10d1NJJzg2i
         oh6dcmg+G72u3oEgXtFF9KVQtL7a0263T8fhqY6almOjfkxKKWk8WBRRKIXWpV+C3ywk
         CVnA==
X-Forwarded-Encrypted: i=1; AL+hErH+U7YyEVdS08t8ew1RQl9wbp04R9YDMJJ8MdgfzvzY7mCI7nBBm3ZOeZd0j5KevIlnpvARaKdo0AMFrJU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iVaQwrwOVcer4tK0nvFGNR39MF3PpnGCsIkgbVPMTcZ6B7aLI
	cYAssSDaqvRXRN3IGk7bDZlKosE3SzsUtRjl1U7RhW28LHO6xfsxNtlx
X-Gm-Gg: AZFdTZe7O5B56S0A3KkXtEIcR9D0pp36Vk2X+xtd9fcXug8gdYD16X66k+n/FSaE4mg
	nhG62scAxLe0n9qJi52EZxhafrJdwIqGc55rUwCEseXUPRPZ/VtUgxWPSTRRa6NT5wKkJaZoJfR
	+m3XcSq6PXBHUFwlkPNaFTfhSxutidotCyvjpgzlDuGuqzpb1fTNwwRF2Xvtt5p2vZAKBZmlJ6H
	5q7VSh7d0O2MYMOkhlK8ZrZ1643YgxSSIkx4158ck0/com9bYRLMCHIgQ+3VGULNwiQbKbdDY4X
	LouDai2aSSp2UDK6FiVMaTOJEt8im4Vjwnz+tPOTr0kVFXylOaxRKZFnOHhjJrq8v2Rui0LLbsd
	LMgGxIoASaN/eithDRYITmJ36xlfU/Ix++ZxTm1rBG6jAxOK/DWpDX8jPr2fAoboKEFcNhcmEWP
	gJ8OnXJ7nX70XAQ7BRNr+vBiOQc6kgbCcd6emVAd1ootDozkVRVwV6f5sh3AdeGhnign+Z0kaPJ
	f0/6M1FZ1kEKbx3Ob83Spm6zIvrbdTSYzMbyQqASyC/bnx7Ud4o++Wx/OMwgg1UJyCdKB2ENEp7
	wBC4Sj67jGdD/RSKGiemNnABZ+o1mxcFjhyBxidk+tZbDAIz/MlYSJM8wA==
X-Received: by 2002:ac2:51c5:0:b0:5c1:ac84:668a with SMTP id 2adb3069b0e04-5c1bc7d39eemr622417e87.29.1795162827934;
        Fri, 20 Nov 2026 00:20:27 -0800 (PST)
Received: from archlinux ([194.28.181.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd04451csm399958e87.59.2026.11.20.00.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:20:27 -0800 (PST)
From: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] rust: macros: document emit_base in ModInfoBuilder
Date: Fri, 20 Nov 2026 10:20:24 +0200
Message-ID: <20261120082024.17776-1-mbkchelofficialdev@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Add documentation for the emit_base method within the ModInfoBuilder
struct. Explain its role in formatting metadata strings, handling the
differentiation between built-in and loadable modules, and managing
linker sections and conditional compilation.

Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
---
Changes in v2:
  - Fixed the typo in my last name in the From and Signed-off-by lines.
  - Reworded the documentation: dropped an unverified claim about the
    reason for the module name prefix, and documented the `param`
    argument.

v1: https://lore.kernel.org/rust-for-linux/20261028155005.174417-1-mbkchelofficialdev@gmail.com/

 rust/macros/module.rs | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 0a7b9e24c..6f4aacfe7 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -49,6 +49,20 @@ fn new(module: &'a str) -> Self {
         }
     }
 
+    /// Emits a single metadata entry into the module information table.
+    ///
+    /// This method formats a `field=content\0` byte string and places it into the
+    /// `.modinfo` linker section, except on macOS where `link_section` is omitted.
+    /// For built-in modules (`builtin == true`), the string is prefixed with
+    /// `<module>.`; for loadable modules, it is emitted without a prefix.
+    ///
+    /// The `param` flag selects which token stream receives the generated item: when
+    /// `true`, the entry is appended to `param_ts` (used for module parameters via
+    /// [`Self::emit_param`] and placed inside `mod module_parameters`); when
+    /// `false`, it is appended to `ts` in the main generated module code.
+    ///
+    /// The method also generates a unique static identifier using an internal counter
+    /// and applies `#[cfg(not(MODULE))]` or `#[cfg(MODULE)]` based on `builtin`.
     fn emit_base(&mut self, field: &str, content: &str, builtin: bool, param: bool) {
         let string = if builtin {
             // Built-in modules prefix their modinfo strings by `module.`.
-- 
2.56.1

