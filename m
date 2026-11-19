Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094634;
	b=oOviAMGi0NipSCvRjojbFPv4msaEDxbpXSt49joFLX4Lnhn57noPpZNu6aKcmfNBYqcc
	 DOR8Xd+hrMH/OZYLUzdB4xoP3DpfcNelcfQEwHn2Tth35moqwJEfxMWGKhXU8KCQujQtA
	 C60cQjwpAUQRUOj7YD8nkF5UhoMIiD5QUdtZ9RX4oCzxBZGhM453JK1tRHK2t+aHKWoQZ
	 Kk6mL3b5je1tXvarCDz3AkyDPZPejebe+BoUd0qQ2U63oQtpZgdIAH/2XNTnfRXTqMm2Y
	 nejdd1C61Awl5XQ9gIGbZz1eKuiZz1U3iATTD+IoUCHIcpdy03NvnWvvZi2PH53FIIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094634;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=MWe39Nb/RxFSnXc3f1VE9L5I8zRUdFYpRSvZyE5F344=;
	b=o+dPbWDPm+ak40AlBXAH02/LJOc9IOOZKRdFZkzfT44gh4gXS/AMpu7g+9reryGOGGvR
	 nG7BYgKzNsJeF3S/P2zijH5nYZW0etXhNMq+1oOR2QN0rHcwIsyW1mt5m4iCPZOm8punm
	 8Qq8GDY2MJNZlsO2EFd/CPHVCQYJ9YYHs5tehvthUKmfYWIQO3q0KyzCfEKsD48c2ZqNJ
	 hJ9ADua0szF04UQoc+ThNL1oGQ3fcphTq/1NrsxusXhi+L0ajTAkl/L+l1xUupoyXFGq4
	 CD4h2nsDml93Ukv/L+ltckHXQ/bpilF3vUUK82GP54Ii7eMShS/cSDFEKovHAogKZng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=f4lHCbMj;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D53960A2602
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=f4lHCbMj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=MWe39Nb/RxFSnXc3f1VE9L5I8zRUdFYpRSvZyE5F344=;
	t=1795094634; x=1796304234; b=f4lHCbMjpTLwJWQM1JpXulNUC1vsUazGdgsMOl8DDRr97zj
	iBbqEA9LLCbAOEQlzAjn8NtS8X1XHi+uB3uOMQnr9hN/y6v/HlUsdKQQhJyMWd3p14PM/0p3C6JOO
	Q9iBqntyA/hAt4tEjAKttfEDp/TMhWK6ZD85Cn87r55CWdUila5kEHO8Ig31ICCEWXPn2Y3/bhtIO
	ionIQNQulOb4+UA0NTIaI7eA7UQjzQffRqbrjZGhTZDmpLxoGhhJIM4KbmugBWqkKLBoUiJl0HPi5
	fSUHOmT+vaPTKB8P7fl64SQMde61Mncn6M+DHWQWl9QHIczcHqBGWv/kRJGmbsUg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xU276-00000004LIl-3FwG;
	Thu, 19 Nov 2026 14:23:44 +0100
From: Johannes Berg <johannes@sipsolutions.net>
To: linux-um@lists.infradead.org
Cc: =?UTF-8?q?=E5=AD=9F=E4=BB=A4=E6=BE=B3?= <menglingao@xiaomi.com>,
	"Theodore Ts'o" <tytso@mit.edu>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org,
	Benjamin Berg <benjamin.berg@intel.com>
Subject: [RFC 1/3] um: Use fixed random seed if UML_RANDOM is set
Date: Thu, 19 Nov 2026 14:19:12 +0100
Message-ID: <20261119142340.9fcebd4d1520.I4b0e4ca4bf79c8cbece27e919366079e39c13151@changeid>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119132340.225696-5-johannes@sipsolutions.net>
References: <20261119132340.225696-5-johannes@sipsolutions.net>
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

From: Benjamin Berg <benjamin.berg@intel.com>

For a more reproducible /dev/random inside test runs,
enable setting the UML_RANDOM environment variable.
This helps create reproducable test runs.

Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 arch/um/os-Linux/util.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/um/os-Linux/util.c b/arch/um/os-Linux/util.c
index e3ad71a0d13c..3a3baf4df587 100644
--- a/arch/um/os-Linux/util.c
+++ b/arch/um/os-Linux/util.c
@@ -98,6 +98,42 @@ static inline void __attribute__ ((noreturn)) uml_abort(void)
 
 ssize_t os_getrandom(void *buf, size_t len, unsigned int flags)
 {
+	static char random_pattern[128];
+	static ssize_t random_pattern_len = -1;
+
+	/* This happens when called by setup_arch */
+	if (random_pattern_len == -1) {
+		const char *env;
+
+		env = getenv("UML_RANDOM");
+		if (env) {
+			random_pattern_len =
+				strlen(env) > sizeof(random_pattern) ?
+				sizeof(random_pattern) : strlen(env);
+			memcpy(random_pattern, env, random_pattern_len);
+		} else {
+			random_pattern_len = 0;
+		}
+	}
+
+	if (random_pattern_len > 0) {
+		size_t tail = len;
+		/*
+		 * If the returned length is too short, then the kernel might
+		 * loop trying to generate random from the passing of time.
+		 * Which seems to possibly infinite loop in time-travel mode.
+		 * So just repeat the given pattern.
+		 */
+		while (tail > random_pattern_len) {
+			memcpy(buf, random_pattern, random_pattern_len);
+			tail -= random_pattern_len;
+			buf += random_pattern_len;
+		}
+		memcpy(buf, random_pattern, tail);
+
+		return len;
+	}
+
 	return getrandom(buf, len, flags);
 }
 
-- 
2.56.1

