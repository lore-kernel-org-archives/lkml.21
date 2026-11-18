Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995608;
	b=xXxxMbUivqsru4blDeQteX66VPN1LnIaEIwn5OMgLwnfhtQcDKuGEd0H1yIK3U9nFRcX
	 hFkx+cLbr6HxXw4G80O2gm9ic0yB3ZMxM8gl+h2Q7wdG5p5Xp8KUXOs63SZXWAZsYWBWy
	 5ZsMx81EFZZvYqYQN6VgkSU0VjAWHdpGBTcjOpqnqDAIfN/+RlZe5VAZmhDRl5dLEF0tf
	 E5Xoio7D9iIBqB6nq8vqRBaxAn6BdRUxhQWgzlo6cyA7sVLhi/ruzEwrOHv6CDMQvAI4a
	 GQ91a/KQgo8MIQeI2f04t6y72jM7FYgbUW6DyJMbiSmJO+xKGLQVdQEnI9v4WTkOQVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1voa5gtURoefFDtWXtSo9MgtUtxO1bQT8LxoPwj5oTQ=;
	b=sOfcyAAkZpYgRcLbuH+nXXgW5J8YnojcmBt9NbvrqbNLBBBP3rGSqMnQpIVyS3gRaZTQ
	 wHPS5ZCulJUBJW6aOifsM2SDfaD1X6LsUFjiXYINnwK6si3DrIVlA+c6OAgMA2E/pM9Pg
	 BlPghlR0tnOXF9cDHnNtZKAMp5S9RpW7XMD6V4WdkIFRJB1H6NLajvt51I4913zrVHgWU
	 0RAlQXUbkduActjGIEgNmYzBH7Fg89wL0AI+TLzNWLscfIBW3MwOO4728UYEUK2JAfEYt
	 1QtRBBTOpqGCYf/aMXDuBbaqtyzvPLFCqtZToEWwWXHFkWrQFPBwYZrhsAjPWCJhZbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ETYtVlGz;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16814606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16814606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ETYtVlGz
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38190551625so1472379eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794995607; x=1795600407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1voa5gtURoefFDtWXtSo9MgtUtxO1bQT8LxoPwj5oTQ=;
        b=ETYtVlGzePDQfeOeqoTZZfuGGlZosMS8f3cM1m5HOcPoCx/mrFjSOU4DPL7rufXk+j
         Q6qAX+2VKt98xbZNvlNmTpGvgPurqpLelXzEoDH7lPxlR057vug9C84JurPL4+LYafQr
         /sWdL339N3CgtRWSZHd0Cd+X2gNgnzCg+DRuHwhAFSzyk8KAMlNaw3VmfLxUqgo9vszn
         o8YNWjpsp85dcH9lq5AUsyOTa0hvDyW7XGmDhJLVoXZWaSOJO+bjnqJma3LzAmZ/nMqR
         2hnGwLoVWQokIraWgtYI0TT97kchnE4cnXgkyNn3wkEEbJpPsOHlMvae5GOkhn36uez6
         r3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794995607; x=1795600407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1voa5gtURoefFDtWXtSo9MgtUtxO1bQT8LxoPwj5oTQ=;
        b=Z5IciIRKCURjz3elZTGo9d+zf2FZm1K+1oDQdgQJPF5KYV1LQNW6mHbyL5G0NUsyuB
         kfOGP1EkzQLI0icPkJ3QE2Ox7f6TZlLxO4ZJuH6t5diFkVrcJHMnH/+1RVIzjXFWJvhO
         QWjBI5NwyRukqOA8NfushstHk03HFoSmxjwexMv8c2F/RT1SZw3xUXePBerJwOLAFra+
         Z2Hduy7Mh5w45yLuTnVFSAlU3CJjioeocR5wKQX3DC75MveAQdYb46UDE3DK5oWFoS3u
         /seLQwX/bC6vRl9X+TMcT9MNh4I7OP0ZriZyRhDjyzEAKBnUCGytFOBGOL/iDde6EQFF
         MI0g==
X-Forwarded-Encrypted: i=1; AL+hErEwtjB+lQMAwq3H3juKy277dqT7kxHoPD9e3vNCxO/xmQgs+0SLtSJATnShqm21Ikfqu4SY0j/CVHpuls8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uJRWZeP3JG3P68qNOg1y4U2mEWOkJ8XilCTKc7ybVf7OTBbvd
	SlnRCKJzm5QN+B1jOgactcHNNdkbHtzc9cH0to9CL0cHYEswWaGk67Yd
X-Gm-Gg: AZFdTZcxc4nVHjbIV9TEoEQx/grKb30nruAU2XwuQxj87WDx9EKQ1+55NliB8A0LGy9
	KRkfmF06C/TDPNX3v3sw7k8V2IC5w2KXo70j3v8O8NShpchuzs46MgWQSQLtex/tw+tLlmQg4x0
	h6S5vUL8nbQnmKnQoJx3WtLB2LqRpBjtSEQpqkdBGzqWDUaxwv/5ijlhNHe1MDaI4LkWtKE9aYf
	ueORiaYt8Auqh325p65lVZ8hZpP1Mr7zKTc9Zegc3xns+mmuPMio58plPAfkuc2iFaWVk3tipzb
	kTWQCLd5LoXN7HxZefP03mVPv0ug8j/75DIO6d0K0Z0fvyGvj8J0lw1j8uhWalKFUv75az8poiO
	Twy5dagzJUjq11OZ+EdR8QIECmCEMmgnsv27JX9wIHQlWFQQxN31Oxr+l/ExXt6gYDwF46KatwL
	DpohSv2R5iPw53FZb3GqjfX0T9QfL9mVn/aeJv98+Xg8xCdsvlN+wfEDUl5hwY8bNBkVC9NnnWC
	pOklZFQuqji5b5AqcHZOs4p2H2tz/zR+NwDDCl+qfkKpjsq1S3PFNMB5fBG/3w/8V9eicTaIPa+
	LqUtbwDx8l8o5diulFkJLwIvfRO/tQ963RK92XodrNOkH+3Ye6f2/gJqh/s+/e2VwRa6Bb9czpR
	GueBF7sUR7/1HjJ6QUm1bi492VoA+A1Dg6EZQM/xz2EURnL5J
X-Received: by 2002:a05:7301:fc84:b0:370:1e50:a485 with SMTP id 5a478bee46e88-3828190e7d4mr1883449eec.37.1794995606974;
        Wed, 18 Nov 2026 01:53:26 -0800 (PST)
Received: from localhost.localdomain ([103.107.26.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a79c96b2sm6800826eec.24.2026.11.18.01.53.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 01:53:26 -0800 (PST)
From: Shivani Patel <patelshivani2283@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shivani Patel <patelshivani2283@gmail.com>
Subject: [PATCH] staging: media: atomisp: Deduplicate and reformat atomisp_find_in_fmt_conv_by_atomisp_in_fmt()
Date: Wed, 18 Nov 2026 15:23:14 +0530
Message-ID: <20261118095314.42769-1-patelshivani2283@gmail.com>
X-Mailer: git-send-email 2.50.1
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

atomisp_subdev.h contains duplicate declarations of
atomisp_find_in_fmt_conv_by_atomisp_in_fmt() under ISP2400 and ISP2401
comments. Both declare the exact same function with broken formatting
(lines ending with open parenthesis, leading spaces, and awkward line
breaks).

Furthermore, the definition in atomisp_subdev.c uses the same broken
formatting with leading spaces and a line ending with an open
parenthesis.

Remove the duplicate declaration in atomisp_subdev.h, place the return
type on its own line, and shorten the parameter name to 'fmt' so that the
prototype and definition adhere to the 80-character line limit and
Linux coding style.

Signed-off-by: Shivani Patel <patelshivani2283@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c |  6 +++---
 drivers/staging/media/atomisp/pci/atomisp_subdev.h | 10 ++--------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index bdd2d9b18..6af8a42a6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -95,13 +95,13 @@ const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv(u32 code)
 	return NULL;
 }
 
-const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_by_atomisp_in_fmt(
-    enum atomisp_input_format atomisp_in_fmt)
+const struct atomisp_in_fmt_conv *
+atomisp_find_in_fmt_conv_by_atomisp_in_fmt(enum atomisp_input_format fmt)
 {
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(atomisp_in_fmt_conv) - 1; i++)
-		if (atomisp_in_fmt_conv[i].atomisp_in_fmt == atomisp_in_fmt)
+		if (atomisp_in_fmt_conv[i].atomisp_in_fmt == fmt)
 			return atomisp_in_fmt_conv + i;
 
 	return NULL;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index b12bb65be..c4a3bce6f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -300,14 +300,8 @@ u32 atomisp_subdev_uncompressed_code(u32 code);
 bool atomisp_subdev_is_compressed(u32 code);
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv(u32 code);
 
-/* ISP2400 */
-const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_by_atomisp_in_fmt(
-    enum atomisp_input_format atomisp_in_fmt);
-
-/* ISP2401 */
-const struct atomisp_in_fmt_conv
-*atomisp_find_in_fmt_conv_by_atomisp_in_fmt(enum atomisp_input_format
-	atomisp_in_fmt);
+const struct atomisp_in_fmt_conv *
+atomisp_find_in_fmt_conv_by_atomisp_in_fmt(enum atomisp_input_format fmt);
 
 const struct atomisp_in_fmt_conv *atomisp_find_in_fmt_conv_compressed(u32 code);
 bool atomisp_subdev_format_conversion(struct atomisp_sub_device *asd);
-- 
2.50.1 (Apple Git-155)

