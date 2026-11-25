Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631348;
	b=zsFsAUTysY2Z/Jk4kISm0vR9zXpvsRNjwIV7rV8XUHr8mGekarwUJSe8EgUcYGJV7F46
	 1DNvVXSMfiB66FsPz5iQjD5suFt1UrgiNnJr7MyZ4WOhrDPyXSx/4UunP0XmsEwBUpCmY
	 ZeZzreQxZZtAmb442/JmmDRbjd251QlHyorR3cC823wqgH53zTPRlybBwOyPyEfWhGaiR
	 shOxrUtaliwb6j1b98t1L6AK9bViKI0RZuOAydWDGJUbf1um4El3bhaSPhn2zHALaQTtL
	 M3nGU9UCtYJe7yx8Q2XchLd/L0FCmKePk/yLOrR2MHo/OaRA6F0rz9HX6F/4S2PMjTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BbqA7dzUFNRRH3i43l3ktiNJhr4jSjUq5g8IQF9/Igw=;
	b=aYPLwFU8KbuKyuwSxM3OhKICGd5QgCd7LigJX8jKqJzW78dtAfTiiu0FJTX/eiZhRTjO
	 EX+HZ1NJ3vtZKfd48oO4NIU1UU7//ff+3g9PcMikiDz7eJw7b4ArEAzIR5WObpNpH5cPV
	 5zbYlrt27s3wge/IvMRCt9uTd24kStfuDbZNHGqpIDwYAOKoycgIklpb6sNlmzyMrAA1R
	 mn8n13fjcb7NixVGG+IyNla06K1VMWgpGuzvV5IiyS0p+XfliV2wIxvesJ1/KN3M91Yq+
	 YpVoGzLkvgYgcAT4ONdrSAst4a+LrVbKi3MQ8Jdb0Ayi3oCJ42DldHd01+t80rt+Z5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NTsgbGfh;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593F9606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 593F9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NTsgbGfh
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so675247eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631347; x=1796236147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BbqA7dzUFNRRH3i43l3ktiNJhr4jSjUq5g8IQF9/Igw=;
        b=NTsgbGfhTXGh+A1YKsQyEZSPadXbqYBhPvtMwI/4vatcNfcNkaYYd2k3wGpFI6atXH
         5IK2WFXWtYmCG/cHmvu47nJ+qnkpkaaIYTKSigj0sGqgBBvIH78C9kwwrZ2PFHf9yvEP
         dKAYG+pMBR1UKIanZ/bDZPBlpko1JTkvEc0rHdpXs29yntcu0dx3z5S/sh0yuH/euBKV
         1eDZd8j1p1qFGaqmlStbvBXqYTV+B07j1ZzixQcN9eQY4gUw8DlJgt5QUUY3QAnchjys
         dfaHYfZqbnTaoyWYQH9TW6end5if2pZcQa+HcqtGk/ohMDbzy2WjOuc0Ls9AWyNPm0dO
         ZSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631347; x=1796236147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbqA7dzUFNRRH3i43l3ktiNJhr4jSjUq5g8IQF9/Igw=;
        b=AUskHF+akIOY5aRhtdCO77pAhJfr9oExDW3aByJfhLrK7Haj8fAv9F1hNFogPsVgYx
         +qRt0lqBSTbh+f7Od164hEY7zeLlXolMkZWCoEaLKQ2lWpbAmR6hjegU+2uNmxC4hcbR
         vc0Mht8sN9IsH4xDbjiyjwKXQFmTMwudc36BrEHOiHoWIJYRcaA3B4b6wsZDeUF5Thpw
         vnSDfJXAt0DgPIdmYy2EKYhMAndopBfWCvb0uXGrxgxypDEX5gNW8RkD9DmlHPkeoM2l
         LwxmpoDC5sjuYjXyga7mqb2ftxSutn3QzRoBe1n695XRpi9fsroW59D8sNX4H0IeIpzJ
         00OA==
X-Forwarded-Encrypted: i=1; AL+hErEQ2TCzt1iQqtYPQmeXEH0URkzfzfgw8z0DkspucgJrzfdly0Yozv1aX8C6KAtFZ4bpmLm54UO6hTgZ1/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MPNXdEMsu3Vb+IpQcFgue1ykUHAk2xCznEK8Fz2nKf0hUQEsv
	EMtr1XHx0ky/Yjea3wqQKawhdKqVOXyZUyCwoTmc2ULyzvgM1vrLJa5OFAJyJipP
X-Gm-Gg: AZFdTZdpUrHleDskrrtxVJdPHgDLoM3FQuq3kRyaBFUPxOAibNnA40TjFfyWqy8U0i1
	5uKGgJDNYih5b92p8WzypeE6BISmcl4RAnB8U2XY3Y7KNpUAQI8n5UjWFL3SJzv4yAEZM6Oi6gS
	2WJHogCcp/AdRfCzx6hcV7ipDjWTA+TDbbDM2ph5ovrdkhyRNQh0gBoObnePjwKhPIp3ENBVzuQ
	2kqhSFOZFsFomcsE73F2/ZNRZ1iEeqIgmb/rxzgn+eSqWkzq1M16eB4qwQxjaNfC9T4sfTbXD0q
	tucopl8myP3KvNZVGIcvkakFOHe+XfXR3TtOeYKWzaJNcSXD/ioZO//IMqUH6ORTqXOjUXyopFf
	8s05M3TXHTKr2zNfrBPJ03QbZmeTbVdxl6ci9N7uuk7HY2EyHpdcM9xQLB8c8YKIWHY8idW4Snj
	WXs2fLmj3KRhOst6oPvNME9fPsOTnza5KtMRdQrIiultwWRz3h7hbwYQGeNtlOWxj+JHJMckEYn
	azLHd+e6qYT4FFhx1rZHXnpncukNtyMUEXPKNbcsbMGwFEKV4xQRiDMm4TQdyVAAoNQTHNMUr6Z
	etrtBVZ6Jr80/+2iOSph
X-Received: by 2002:a05:693c:88c7:10b0:386:b3aa:77f0 with SMTP id 5a478bee46e88-386b3aa7d6emr9851203eec.18.1795631347123;
        Wed, 25 Nov 2026 10:29:07 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386c7c62a91sm14094564eec.17.2026.11.25.10.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:29:06 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] vt: Escape the CUR_ prefix in the cursor kernel-doc
Date: Wed, 25 Nov 2026 18:29:03 +0000
Message-ID: <20261125182903.2396749-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A trailing underscore is how reST writes a link to a target, so `CUR_`
in the prose is read as a reference to a target named "cur" and the
build fails for the three cursor helpers:

  drivers/tty/vt/vt.c:276: ERROR: Unknown target name: "cur"

The same line appears in vc_cursor_start() and vc_cursor_end().  Wrap
the prefix in double backticks, which is how the rest of the kernel
marks a literal, and all three render without an error.

Verification: before the change, each of

  $ ./scripts/kernel-doc -rst -function vc_cursor_valid_size \
        drivers/tty/vt/vt.c > x.rst
  $ rst2pseudoxml x.rst

reports "Unknown target name: \"cur\"" once, and vc_cursor_start and
vc_cursor_end do the same; after it, none of the three reports anything.
kernel-doc -none on the file is silent both ways.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 drivers/tty/vt/vt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 6a6eb8b2a6de..14b7214ec105 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -273,9 +273,9 @@ EXPORT_SYMBOL_GPL(vc_font_size);
  * vc_cursor_valid_size - Computes a valid cursor size from the given value
  * @cursor_size: The size constant of cursor pattern
  *
- * The argument given in @cursor_size is one of the CUR_ constants, as stored
- * in struct @vc_data.vc_cursor_type. For unknown values, the helper draws the
- * default cursor or an underline dash.
+ * The argument given in @cursor_size is one of the ``CUR_`` constants, as
+ * stored in struct @vc_data.vc_cursor_type. For unknown values, the helper
+ * draws the default cursor or an underline dash.
  *
  * Returns:
  * A valid cursor size for the given size value
@@ -317,7 +317,7 @@ EXPORT_SYMBOL_GPL(vc_cursor_valid_size);
  *
  * The parameter @cell_height is the height of the character cell as
  * displayed by the console. The argument given in @cursor_size is one
- * of the CUR_ constants. See vc_cursor_valid_size() for how to get a
+ * of the ``CUR_`` constants. See vc_cursor_valid_size() for how to get a
  * valid cursor-size constant.
  *
  * Returns:
@@ -353,7 +353,7 @@ EXPORT_SYMBOL_GPL(vc_cursor_start);
  *
  * The parameter @cell_height is the height of the character cell as
  * displayed by the console. The argument given in @cursor_size is one
- * of the CUR_ constants. See vc_cursor_valid_size() for how to get a
+ * of the ``CUR_`` constants. See vc_cursor_valid_size() for how to get a
  * valid cursor-size constant.
  *
  * Returns:

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

