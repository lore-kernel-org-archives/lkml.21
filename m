Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795059638;
	b=xT7u/o+PwSYI2EValPJCz1+BcTM9knJGLe0+7KBnI18cs9AE6vUqjJFNMk4hWCDoWuMR
	 jBxL8JM6n7Cdyb5sYWiGPuJKUnX04UWb4VrGbcuwRnOhxeNHvcZmdJabnG6d09/foSpCw
	 FPCURwETcJ1GtaICq1hZasItR7vsgPM+G9ZLSsEDOcCNr5m2ENbrXfnwkNiYAKkk9KgN0
	 W0a9CuFX3RZSTt0qrQEdVOOgJbWqAsCVCh2AdZezkQTWTGXykB3cXFGz0eYAUAsvIoBlG
	 ArNlYpw1HJnssXAQxod4OapJzG/Up/LnFPgSler7SlTW8KhGTAK3bPDPj8F2yWSmBOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795059638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A0MBPJOKvnLE5rP9NIQzyUeRKGazCi9hDA+IfnK6LUo=;
	b=vqWTXFLulnHrCFQ7vDqxw0lyME3zH0jt/yJue92Fhdo3fZDKt6HR54p4/3mOE8yzpAQP
	 M6nSWx5rme5nmNFXX4kKZYwJYqiXZ7WUVI/RiiBq1cXik+l8fVUkTu56BQXqepbsfOqv9
	 g2r8k5vMQdS4GMW/hCVs8qmSOOg1t1iJMf868aopMUmYUF1unU9avEYbstli+GDrBDaiH
	 4VXNUug2YPDnwH8pjdVWXKMcqaMX7oBQA9T/H9P08u+8GzpI/BxfpAYbmBqqQN8NXSOxO
	 GTkwYb7erIdpUul7ih8k0mcl9jT6bl7BTNzN53HXWc/SszqooY91wS+mc5vNy6EjzHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YF8qDQBN;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5CE60A5BD7
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D5CE60A5BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YF8qDQBN
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a315ed211so474228eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795059637; x=1795664437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0MBPJOKvnLE5rP9NIQzyUeRKGazCi9hDA+IfnK6LUo=;
        b=YF8qDQBNQaYCsJIOtgVynAeZl0Y6NpZGU+vY1ytn9XgC0BQEut9eLnAz4MS+3lQQ5r
         mJN2QRwgRo6wOde2SFdbP0C1+miDYMb5dCSS7NQ9ek9+9G7j8+xipqW2N4WUynupBxCf
         jhssUAYpFgpSa+U5usea4/ltROLx9GjckFoGRG9H49T7VlU4kb0okUMqjR3Adm648pKu
         Bj+0Bv1C+Ci7x2FyhmfmAdGXo/BCTZvwinB2HBlYJfy0NUEbkOToh3APOBWYhTYkjjCg
         kY1kJHUXioLIp0SxIS9Jl0mqCk8m4kXPYusuPp1R+lBP3S54f51ypjXfk0hJ8NMXdHX3
         As2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795059637; x=1795664437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A0MBPJOKvnLE5rP9NIQzyUeRKGazCi9hDA+IfnK6LUo=;
        b=ZFX6Jjl8/av/XQZuv0cN/XAf9F1EAfks//AXpgv5kDn5efMYCLdQ3tf8WtazSpxu8z
         L71XdN7ThuFehJby8X1fA1CeqXrJSAy687dYsRrEt9Cr+XdBw++EFP9NT/5VEeAV9DfQ
         ZJEjEu3fMzKj9zIm0hgKngVqvTV2F21CCXlbQIwSbrz/IRuXMWIVFv+0hw8z0ltf4Eud
         6f+HVt4FdV3JfvCyavoG/G9d15wUCHJjidrUltkzkdzsByTFWwWMD5P7r2HQZHtj7jP3
         7zYhT4UeI6ifjeuGDptMAGaGVZW/slqInoskojKnqyqcW1uFcUy04nxQmye5RsmygDLw
         vgGQ==
X-Forwarded-Encrypted: i=1; AL+hErE4KthbPsO5ankg70+C3REOIPRj0hDVhjulvEPD0LWQSWvG4aKziQipNSKe+SgHilv6zoZ5ikW93w2m4aQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z//O/zYr1m6STH9F/uB5ZrzBfdAUAS8iT+b5yQcKana2N+xldgu
	d40Xl0rPrzfFfKpAaeejKj+wGTRFQL3+jvfsCaQdF3i0eeDtDEpyUewd
X-Gm-Gg: AZFdTZddmrCNkuGIPz7InO3jOWNaacgJrSyac4ag9W7WHMq21VBcl8qIA1Nz946msu0
	5QidNpXhGDjFPw1RkI6u/CtARW2ad/vk+naTBUkqkXXVGO/fIBR/XvHfrj7LzZb+Cmrk/65bnDK
	8GBZ7nOcbqwcnzvjN/lgD31y9dBbA2SfXKshvcUMBbU/tScnfSHLlPv/DWLAQlvPvEg2heC+Twb
	wygpp8NdT1CaRfwejDmnXPs2TOswZO93FFXr4s80d1Pet0HjeW19anx6JSjjyCHufpc5vZD4o+D
	KXWlOaLs9M5pEN7zzCwwVl2LwOmuQKG5vRY2BTXJu+JerOUyTVrUDwQJKNsSMnvToc2knIMOnZW
	kMm+69Nml07EFHxBqKBlu6h9itx3hgHoReFycB/DOiA8vAZeSywNvv0pZJ33ee6qPy+LnWjkzCU
	qHhvYICXRZcN7de/Fz/8UcYMBFbbYrSrIIdi59aGvkW3/wzKrJiehk85v/gtnZJ0y4ai145R8nM
	yPYnRtFFhzY/ebERm9J+flJYmIXJJOEImRVQe4paXol089aS6aTUjR1t3gi2UHE0szb9tb5UF6m
	9PVDXq5ZRrMOInH9a1q6w8ZtxtW4umBRcA==
X-Received: by 2002:a05:7300:da12:b0:36a:2473:9b2f with SMTP id 5a478bee46e88-38446cdd2b1mr694103eec.23.1795059637194;
        Wed, 18 Nov 2026 19:40:37 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a4522829sm12699465eec.1.2026.11.18.19.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 19:40:36 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCHv2 17/18] powerpc/powernv: Rework OPAL console write to remove conditional locking
Date: Thu, 19 Nov 2026 09:09:12 +0530
Message-Id: <f7e4448a35cc9d9161b20661cc589c03d565680c.1795058683.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1795058683.git.ritesh.list@gmail.com>
References: <cover.1795058683.git.ritesh.list@gmail.com>
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

Clang's context analysis reports:
  opal.c:454:7: error: spinlock 'opal_write_lock' is not held on every path through here [-Werror,-Wthread-safety-analysis]
  opal.c:493:3: error: releasing spinlock 'opal_write_lock' that was not held [-Werror,-Wthread-safety-analysis]

This patch rework the OPAL console write function to remove this
conditional locking to fix the reported build errors while enabling
Clang context analysis. We could have marked __context_unsafe(),
but this anyways simplifies the locking a bit.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/powernv/opal.c | 30 ++++++++++++++++++---------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 1946dbdc9fa1..aea83c4be76d 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -438,19 +438,13 @@ ssize_t opal_get_chars(uint32_t vtermno, u8 *buf, size_t count)
 	return 0;
 }
 
-static ssize_t __opal_put_chars(uint32_t vtermno, const u8 *data,
-				size_t total_len, bool atomic)
+static ssize_t __opal_put_chars_unlocked(uint32_t vtermno, const u8 *data,
+					 size_t total_len, bool atomic)
 {
-	unsigned long flags = 0 /* shut up gcc */;
 	ssize_t written;
 	__be64 olen;
 	s64 rc;
 
-	if (!opal.entry)
-		return -ENODEV;
-
-	if (atomic)
-		spin_lock_irqsave(&opal_write_lock, flags);
 	rc = opal_console_write_buffer_space(vtermno, &olen);
 	if (rc || be64_to_cpu(olen) < total_len) {
 		/* Closed -> drop characters */
@@ -489,10 +483,26 @@ static ssize_t __opal_put_chars(uint32_t vtermno, const u8 *data,
 	}
 
 out:
-	if (atomic)
+	return written;
+}
+
+static ssize_t __opal_put_chars(uint32_t vtermno, const u8 *data,
+				size_t total_len, bool atomic)
+{
+	unsigned long flags = 0;
+	ssize_t written;
+
+	if (!opal.entry)
+		return -ENODEV;
+
+	if (atomic) {
+		spin_lock_irqsave(&opal_write_lock, flags);
+		written = __opal_put_chars_unlocked(vtermno, data, total_len, true);
 		spin_unlock_irqrestore(&opal_write_lock, flags);
+		return written;
+	}
 
-	return written;
+	return __opal_put_chars_unlocked(vtermno, data, total_len, false);
 }
 
 ssize_t opal_put_chars(uint32_t vtermno, const u8 *data, size_t total_len)
-- 
2.39.5

