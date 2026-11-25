Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645091;
	b=kL0ekneaJNs4el17k9zk40KaUWP4pyacxXGNhZLGVsksfbc2gFeioEkD5nFSZ8UIDtlA
	 5lkZew6T5vV8D2cvko908BK0hV1mmKM3AHlp/+crEHDSXM8oAvd97+B+Up92jsMd5/H8Y
	 DwR2YGTegBK44iS4XLjYy0KzAwGqXc+onGh6m1tUxb6YADL5uJaQqinbzNA68CbPd43Nv
	 eywWPoFoD3rTNoF4bW7XIWr9CRIihqPGtDvhqgGfLofm33GXspDabjd4xK8g0iVTMW0gj
	 GoPnZ08AgYRCr4OVoKEwwo91+k9q85bO3O4pFbtRYcMCgG+uhYkGzatNhZVEURG7fLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AkD/EULkjYCTOVN6ONVEcYCDVTXRZ/wAEijqIncHQyo=;
	b=4ZwvMXD+lAkMUqF8+tnc8uf6bKdwGDbjTbDOL0T8+tVJCrtpMlExLf4IIply9buLfsZx
	 kjhAc0HBKodNwFbBL+9FANF/+4PEW91PqCy49nC5dhs7aGs6dR5v1o+73Gxu6bkk8XH1K
	 RbHSBmrTrwpKlLVLFJgjqFYR6C3lTC4APHPrukR5jAN/FA6fTqCNaDw244NkjSGQrPH5y
	 D5ZrFB4m1EVhPOZAdaXPB8921dCKmysfykuwCXapVCnMw0fYGIezpZkLrACAYW6nW5inp
	 ICX7sIhYD+HjEkGs1deIgrbTRsIEARw8VF/0qKxFlJylp9kFic52pmjrIuOYzDILo3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="EtI0OK/n";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D67606A684
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51D67606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EtI0OK/n
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-38692f62b22so7637001eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 14:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795645090; x=1796249890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AkD/EULkjYCTOVN6ONVEcYCDVTXRZ/wAEijqIncHQyo=;
        b=EtI0OK/n6MC4BVKd3pAxgf03MybUyrEr/pFVhAvp+iXntfUDeaRqHxKpVaXFVHcGwC
         iLd4TDiqO9K2xRY0HvB79J3Ioam3j2ErwGhwdFBb2v2tdlUYK0Lsp7ONeo6Yf3A+GWqJ
         yUIACEFFlbyETHReWI2yAt3TjbRHcFEKmOzAFsuiTEFWvTbeZGyBYRwxoLTCVvDyr9Ig
         Fv7l1CLYjd03F8L3YdmLoBuXrxqbPP+hN4JnLCvOBLjxwHw2AOq5XdDsLxxA8dA2k+EM
         RNzjz6pVDloaKsrMUUxfbNRAYTw9LYv7STFicpVJsI2EBu37+Qghxv4fAkP3gd0hXMY6
         zNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645090; x=1796249890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AkD/EULkjYCTOVN6ONVEcYCDVTXRZ/wAEijqIncHQyo=;
        b=Cq6jPVgULEMi3rW6GzSv/ar2+lebb2pZvq30AAMvudBHcutPc/eaEhC3r6ZzsFB8Zw
         /w6bm0yyv5pXhlxPmsdP/X+hygPVQ1pUwibUfawp9wWugjG2HVVxOP1soHCGZ+g0JGwW
         C/hksOM9qw0VotIT+okxqyCnQT3hjUhKlpRy813fKRTPWd2F+8iiO9WP56w2iqkpIzTK
         9XVKZoQSbFIXhQXS8G4aMXmqJ/HaQElLCuNsme2F71TF5fLp1XL+njUmcdIPlChKlerc
         9EZ+EYBwtvw73PJQWzg75NctuUFHqGIvnJHdPO9TyTyojOSsw1wClzczdUKUUC9n/R5M
         wR3A==
X-Forwarded-Encrypted: i=1; AL+hErE6N7ZVRy4uPW22YFLg9rS4VRYc8fdkXCcp/YxOIy5Mn/C5+iCFKKWWS5JJnBytld1DIqEDAFWgCnXfvLY=@vger.kernel.org
X-Gm-Message-State: APuU4Z94lrdPaT49Pwh78h7nTP20qcCWA4qIDKbMDK76vLn4dQy1zBAE
	iMC2CbktizYAK9h+yEnyvMFHzD1u9I084lyxBErzAZixk3n6XAEnS+UH
X-Gm-Gg: AZFdTZdNnDojeu/zYfQxI6+pBrLMC0D4KopQRfUADPwZFXNAgDz99zDCTjwKMuPjMeU
	Gs12g/OWlzqhmSlNeJ+FKFc7QXPWcvkq5VDKtddcLUUzyZFcmI026t59irFgMeVzJXtGPguzN0R
	VedocNTG7S8QmiEWJhjUfZiKcAW/dChLpevkZUM49aLCuoQxue9tavzptLhk1kTrnXc7Y0bC4oU
	O0UG0MI+sLByC6ZZ9QmlwERq1ewE1r5NNZSrnHgylihLP8b4ZwS6qVBvX1tmAUSE3uftLOB//3C
	evxNXX/pEl6YkVXVR900SXghKif/Wb2wKtgX6zOOTbhXXOwX3i59A669OkvWvi8I3zpmgN4ZYiG
	3MrjL3q21QImdf9axfk46jmOo7cvGWQ3zkjp+V52IbFSHKIO1DJ3+WOxjYyxehY1Tz32b6kpwfv
	BwvDjcyBYEKUxgv7DFQwRAM7DYXpqCSRqTuj0lM96jlgb3W8/qDvhM08sNAkjyJGySfPUMTMZ3k
	TaTgIeb/FZPMv9XX+Ao1761zNqkS59jYfxoVavmvkcx21A4wxUDF0nXQTUuKxNUMPtqQtVbzFBb
	ZAreNK/Gv15ooQRWsInR
X-Received: by 2002:a05:7301:6407:b0:386:2300:db04 with SMTP id 5a478bee46e88-38623101ee2mr19243959eec.22.1795645090140;
        Wed, 25 Nov 2026 14:18:10 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm69581357eec.5.2026.11.25.14.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:18:09 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2 3/3] docs: python: abi_parser: Detect a symbol repeated on one file
Date: Wed, 25 Nov 2026 22:17:58 +0000
Message-ID: <20261125221758.2535044-4-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125221758.2535044-1-takano32@gmail.com>
References: <20261125221758.2535044-1-takano32@gmail.com>
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

check_issues() warns when a symbol shows up on more than one file, but
it never looks at a symbol that two entries on the same file claim:
"if len(files) == 1: continue" skips that case.

The parser stores every entry under a key of its own, so a repeated
symbol on one file is visible as two entries with the same file.
Compare at that level and warn, and keep the cross-file case
informational, because two drivers may expose an attribute with the
same name for different devices, as sysfs-driver-hid-lenovo-go and
sysfs-driver-hid-lenovo-go-s do.

Verification: get_abi.py --dir Documentation/ABI validate used to
print four warnings for the cross-file case and nothing for the
repeated one.  It now prints four informational messages for the
former and two warnings for the latter, at sysfs-driver-mlxreg-io
lines 348 and 744 and at sysfs-driver-hid-lenovo-go lines 389 and
566.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
Changes in v2:
- The documents are fixed before the checker is added, so the tree
  does not gain warnings in the middle of the series.
- The internal MCU protocol_version entry points at the top-level
  attribute; v1 gave it the prefix of the removable controller's
  group, which made it name the same file as that entry.
- The checker keeps its warning for an entry without a file, counts
  lines rather than occurrences, and drops an unused loop key.

 tools/lib/python/abi/abi_parser.py | 48 ++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 16 deletions(-)

diff --git a/tools/lib/python/abi/abi_parser.py b/tools/lib/python/abi/abi_parser.py
index d7bb20ef3acc..8b51659fb6ca 100644
--- a/tools/lib/python/abi/abi_parser.py
+++ b/tools/lib/python/abi/abi_parser.py
@@ -554,28 +554,44 @@ class AbiParser:
     def check_issues(self):
         """Warn about duplicated ABI entries."""
 
-        for what, v in self.what_symbols.items():
-            files = v.get("file")
-            if not files:
+        # Two entries on the same file that claim the same symbol are a
+        # copy-and-paste mistake.  The parser gives every entry a key of its
+        # own, so such a pair shows up as two entries here.
+        per_file = {}
+        for v in self.data.values():
+            if v.get("type") == "File":
+                continue
+
+            file_ref = v.get("file")
+            if not file_ref:
                 # Should never happen if the parser works properly
-                self.log.warning("%s doesn't have a file associated", what)
+                self.log.warning("%s doesn't have a file associated",
+                                 v.get("what"))
                 continue
 
-            if len(files) == 1:
+            fname = file_ref[0][0]
+            for what in v.get("what", []):
+                per_file.setdefault((fname, what), set()).add(v.get("line_no"))
+
+        for (fname, what), lines in sorted(per_file.items()):
+            if len(lines) < 2:
                 continue
 
-            f = []
-            for fname, lines in sorted(files.items()):
-                if not lines:
-                    f.append(f"{fname}")
-                elif len(lines) == 1:
-                    f.append(f"{fname}:{lines[0]}")
-                else:
-                    m = fname + "lines "
-                    m += ", ".join(str(x) for x in lines)
-                    f.append(m)
+            self.log.warning("%s is defined %d times at %s: lines %s",
+                             what, len(lines), fname,
+                             ", ".join(str(x) for x in sorted(lines)))
+
+        # The same symbol on more than one file is normal: two drivers may
+        # expose an attribute with the same name for different devices, as
+        # sysfs-driver-hid-lenovo-go and sysfs-driver-hid-lenovo-go-s do.
+        # Report it, but do not call it a problem.
+        for what, v in self.what_symbols.items():
+            files = v.get("file")
+            if not files or len(files) < 2:
+                continue
 
-            self.log.warning("%s is defined %d times: %s", what, len(f), "; ".join(f))
+            self.log.info("%s is documented on %d files: %s", what,
+                          len(files), "; ".join(sorted(files)))
 
     def search_symbols(self, expr):
         """ Searches for ABI symbols."""
-- 
2.53.0

