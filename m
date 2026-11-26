Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795731190;
	b=XRV35qkWkhDUcIR/Nryn7udXZXjcEOKjTVpZjxwOSIz0TJT+CNr6tM5FqPfo1Oz+0mqG
	 eXdZehZr4a/mmSsxJdDMYPeeP5hWIzNKX6u6cof8ewMms0c88PXWLN9uYwImCigxZb7SF
	 ZrxB4I5f8zEDa4CNOOJx1jt2oKR7eUsWrtb6sv9k4SFqALZxdSA8sPFeN56XbOi3+rXC+
	 +XfamSRdGLdib1MMb3uhIBnMxfWXZhEOW7J+iZZGWlW2ohwYy1Sb9m2RMgo3Cul4Teqt+
	 fZ522if/0zjnWMgo3ny93j87xCrETupD4t2Yvwaku/4AFK+747H2UHnX6yfNO2y/14g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795731190;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=Zf8ltuoqadfIK65fHIjFnRPvWtUZp23p6nOPHgOjNjM=;
	b=qhQD5pRnrjx2A8h+/lS+w4Xc3Zd4Po9Et6rJxJuJhch4zZqHulg5ETl0eMuwEO2mb7RV
	 lOYmKRLHJn5eA0uDPnwa/1M37vMg/pI6dbL0YLFT79ckeP9vR1mBQpm61fkIu+VGGTcgl
	 HWNTkipNZBuR/tdT23EGeKd96h5NVkDfy8cNY76flDmeprj8MT/C8fkB6NNCt3Jzz/hGR
	 a17QSh17NiLYZj5Bjc2rky0wfGHPwwPpQn51Q/XcxZqvpPzJVxpdCu1yw231LfU5VI2Ut
	 jKb96ztYboU8xyk48jauQCBUycN8Vy4/adpjKSTbRUBOkQuPI5AQ/ejH4QIhGD530ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=XaszjSX1;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3458C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3458C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=XaszjSX1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=Zf8ltuoqadfIK65fHIjFnRPvWtUZp23p6nOPHgOjNjM=; t=1795731188; x=2111091188; 
	b=XaszjSX1oRex6SVii4yIO7SjXRHfLfPZfIiGY1C69c60Sopg7jGlP9/TWFVEOCUHQxq+x5Zwo+8
	0Dzj2i+3ZB16zBdfvNaB2s1tPVNk9mYrrc98QPnG9rg+uerc1TDWU0EYu4rXNoQlO4y2Rdk2bvAfk
	7abQXumQlFfgbQQxdBEbrEXpR8o09bokBOvXr1pAcmTvRofoLlimV4/x9awQkolKlekkGmOFK6Kz7
	4U6K/Np5LvVINGoDYPF9G6w4RsgEfSdvLnUW6rP3FkLjuksTxgha8dUGSffhrp8DadKYLxQ06gf15
	1ZWKQ5ms+6EM64tiFbkYfdkNFjOTWEFAAZkw==;
Received: from 186-249-145-105.shared.desktop.com.br ([186.249.145.105] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xWhiD-00000004ZXB-0m2E;
	Thu, 26 Nov 2026 23:13:05 +0100
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Thu, 26 Nov 2026 19:13:00 -0300
Subject: [PATCH] scripts/bloat-o-meter: describe output fields in help text
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-bloat-o-meter-help-v1-1-fb0785c94bbf@igalia.com>
X-B4-Tracking: v=1; b=H4sIAOuuCGsC/x3MTQqAIBBA4avErBtI+4G6SrQwnWqgVFQikO6et
 PwW72WIFJgiTFWGQDdHdrZA1BXoQ9mdkE0xyEYOQsgB19OphA4vShTwoNPj1hplxt50ndRQQh9
 o4+efzsv7fvqW5gpkAAAA
X-Change-ID: 20261126-bloat-o-meter-help-f3dad95d442c
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Yury Norov <ynorov@nvidia.com>, Valtteri Koskivuori <vkoskiv@gmail.com>, 
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org, 
 Eric Dumazet <edumazet@kernel.org>, 
 Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2

First time users of the bloat-o-meter script might not understand what
its output fields mean (add/remove, grow/shrink, up/down, Before/After),
and even occasional users might eventually forget.

Describe the output fields in the help text, so it is quick to find out.

RawTextHelpFormatter is used in order to keep line breaks in place.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
Before:

  $ ./scripts/bloat-o-meter -h
  usage: bloat-o-meter [-h] [-c | -d | -t] [-p PREFIX] file_old file_new
  
  Simple script used to compare the symbol sizes of 2 object files
  
  positional arguments:
    ...

  options:
    ...

After:

  $ ./scripts/bloat-o-meter -h
  usage: bloat-o-meter [-h] [-c | -d | -t] [-p PREFIX] file_old file_new
  
  Simple script used to compare the symbol sizes of 2 object files
  
  fields:
    add/remove:   number of symbols added in the new file / removed from the old file.
    grow/shrink:  number of symbols in both files that had a size increase / decrease.
    up/down:      size of symbols added plus size increase / removed plus size decrease.
    (change):     difference between up and down sizes.
  
    Symbol lines: symbol name, old size, new size, and size delta;
                  '-' means symbol added/removed;
                  '0' delta symbols not included.
  
    Before:       size of all symbols in old file.
    After:        size of all symbols in new file.
    chg:          percent change.
  
    Symbols in both files with the same size are only counted in Before/After/chg.
  
  positional arguments:
    ...

  options:
    ...
---
 scripts/bloat-o-meter | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/scripts/bloat-o-meter b/scripts/bloat-o-meter
index 5868a8b11b0f93930ef7b666bcdd229f89dd58be..d988b623e86ee97e296521bdd76aa621ecb8823d 100755
--- a/scripts/bloat-o-meter
+++ b/scripts/bloat-o-meter
@@ -9,10 +9,32 @@
 
 import sys, os, re, argparse
 from signal import signal, SIGPIPE, SIG_DFL
+from argparse import RawTextHelpFormatter
 
 signal(SIGPIPE, SIG_DFL)
 
-parser = argparse.ArgumentParser(description="Simple script used to compare the symbol sizes of 2 object files")
+description = \
+"""
+Simple script used to compare the symbol sizes of 2 object files
+
+fields:
+  add/remove:   number of symbols added in the new file / removed from the old file.
+  grow/shrink:  number of symbols in both files that had a size increase / decrease.
+  up/down:      size of symbols added plus size increase / removed plus size decrease.
+  (change):     difference between up and down sizes.
+
+  Symbol lines: symbol name, old size, new size, and size delta;
+                '-' means symbol added/removed;
+                '0' delta symbols not included.
+
+  Before:       size of all symbols in old file.
+  After:        size of all symbols in new file.
+  chg:          percent change.
+
+  Symbols in both files with the same size are only counted in Before/After/chg.
+"""
+
+parser = argparse.ArgumentParser(description=description, formatter_class=RawTextHelpFormatter)
 group = parser.add_mutually_exclusive_group()
 group.add_argument('-c', help='categorize output based on symbol type', action='store_true')
 group.add_argument('-d', help='Show delta of Data Section', action='store_true')

---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20261126-bloat-o-meter-help-f3dad95d442c

Best regards,
-- 
Mauricio Faria de Oliveira <mfo@igalia.com>

